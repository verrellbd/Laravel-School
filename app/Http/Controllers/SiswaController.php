<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exports\SiswaExport;
use App\Imports\SiswaImport;
use Maatwebsite\Excel\Facades\Excel;
use PDF;
use App\Siswa;

class SiswaController extends Controller
{
    public function index(Request $request)
    {
        if ($request->has('cari')) {
            $data_siswa = Siswa::where('nama_depan', 'LIKE', '%' . $request->cari . '%')->paginate(10);
        } else {
            $data_siswa = Siswa::all();
        }

        return view('siswa.index', ['data_siswa' => $data_siswa]);
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            'nama_depan' => 'required|min:5',
            'nama_belakang' => 'required',
            'email' => 'required|email|unique:users',
            'jenis_kelamin' => 'required',
            'agama' => 'required',
            'avatar' => 'mimes:jpeg,jpg,png'
        ]);

        $user = new \App\User;
        $user->role = 'siswa';
        $user->name = $request->nama_depan;
        $user->email = $request->email;
        $user->password = bcrypt('rahasia');
        $user->remember_token = \Str::random(60);
        $user->save();

        $request->request->add(['user_id' => $user->id]);
        $siswa = Siswa::create($request->all());
        if ($request->hasFile('avatar')) {
            $request->file('avatar')->move('images/', $request->file('avatar')->getClientOriginalName());
            $siswa->avatar = $request->file('avatar')->getClientOriginalName();
            $siswa->save();
        }

        return redirect('/siswa')->with('sukses', 'Data berhasil diinput');
    }

    public function edit(Siswa $siswa)
    {
        return view('siswa.edit', ['siswa' => $siswa]);
    }

    public function update(Request $request, Siswa $siswa)
    {
        $siswa->update($request->all());
        if ($request->hasFile('avatar')) {
            $request->file('avatar')->move('images/', $request->file('avatar')->getClientOriginalName());
            $siswa->avatar = $request->file('avatar')->getClientOriginalName();
            $siswa->save();
        }
        return redirect('/siswa')->with('sukses', 'Data berhasil di update');
    }

    public function delete(Siswa $siswa)
    {
        $siswa->delete();
        return redirect('/siswa')->with('sukses', 'Data berhasil di hapus');
    }

    public function profile(Siswa $siswa)
    {
        $matapelajaran = \App\Mapel::all();

        $categories = [];
        $data = [];

        foreach ($matapelajaran as $mp) {
            if ($siswa->mapel()->wherePivot('mapel_id', $mp->id)->first()) {
                $categories[] = $mp->nama;
                $data[] = $siswa->mapel()->wherePivot('mapel_id', $mp->id)->first()->pivot->nilai;
            }
        }
        //dd(json_encode($categories));
        return view('siswa.profile', ['siswa' => $siswa, 'matapelajaran' => $matapelajaran, 'categories' => $categories, 'data' => $data]);
    }

    public function addscore(Request $request, $idsiswa)
    {
        $siswa = Siswa::find($idsiswa);
        if ($siswa->mapel()->where('mapel_id', $request->mapel)->exists()) {
            return redirect('siswa/' . $idsiswa . '/profile')->with('gagal', 'Mata Pelajaran Sudah Ada');
        }
        $siswa->mapel()->attach($request->mapel, ['nilai' => $request->nilai]);

        return redirect('siswa/' . $idsiswa . '/profile')->with('sukses', 'Nilai berhasil ditambah');
    }

    public function deletescore($idsiswa, $idmapel)
    {
        $siswa = Siswa::find($idsiswa);
        $siswa->mapel()->detach($idmapel);
        return redirect()->back()->with('sukses', 'Data berhasil dihapus');
    }

    public function exportExcel()
    {
        return Excel::download(new SiswaExport, 'siswa.xlsx');
    }

    public function exportPdf()
    {
        $siswa = Siswa::all();
        $pdf = PDF::loadView('export.siswapdf', ['siswa' => $siswa]);
        return $pdf->download('Siswa.pdf');
    }

    public function getdatasiswa()
    {
        $siswa = Siswa::select('siswa.*');
        return \DataTables::eloquent($siswa)
            ->addColumn('rata_nilai', function ($s) {
                return $s->averageScore();
            })
            ->addColumn('aksi', function ($s) {
                return '<a href="/siswa/' . $s->id . '/edit" class=""><i class="lnr lnr-pencil"></i></a><a href="#" class="delete" siswa-id=' . $s->id . '><i class="lnr lnr-trash"></i></a>';
            })
            ->rawColumns(['rata_nilai', 'aksi'])
            ->toJson();
    }

    public function profilsaya()
    {
        $siswa = auth()->user()->siswa;
        return view('siswa.profilsaya', compact(['siswa']));
    }

    public function importExcel(Request $request)
    {
        Excel::import(new SiswaImport, $request->file('data_siswa'));
    }
}
