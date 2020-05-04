@extends('layout.master')

@section('content')

<div class="main">
    <div class="main-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <!-- INI MASIH ALERT BIASA BELUM PAKE TOASTR -->
                            <!-- @if(session('sukses'))
                            <div class="alert alert-success" role="alert">
                                {{session('sukses')}}
                            </div>
                            @endif -->
                            <div>
                                <h3 class="panel-title">Data siswa</h3>
                                <div class="right">
                                    <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#importSiswa">Import Excel</a>
                                    <a href="/siswa/exportExcel" class="btn btn-primary btn-sm">Export Excel</a>
                                    <a href="/siswa/exportPdf" class="btn btn-primary btn-sm">Export PDF</a>
                                    <button type="button" class="btn" data-toggle="modal" data-target="#exampleModal">
                                        <i class="lnr lnr-plus-circle"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover" id="datatable">
                                <thead>
                                    <tr>
                                        <th>Nama Depan</th>
                                        <th>Nama Belakang</th>
                                        <th>Jenis Kelamin</th>
                                        <th>Agama</th>
                                        <th>Alamat</th>
                                        <th>Rata-rata</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- @foreach($data_siswa as $siswa)
                                    <tr>
                                        <td><a href="/siswa/{{$siswa->id}}/profile">{{$siswa->nama_depan}}</a></td>
                                        <td><a href="/siswa/{{$siswa->id}}/profile">{{$siswa->nama_belakang}}</a></td>
                                        <td>{{$siswa->jenis_kelamin}}</td>
                                        <td>{{$siswa->agama}}</td>
                                        <td>{{$siswa->alamat}}</td>
                                        <td>{{$siswa->averageScore()}}</td>
                                        <td>
                                            <a href="/siswa/{{$siswa->id}}/edit" class="btn btn-warning btn-sm">Edit</a>
                                            <a href="#" class="btn btn-danger btn-sm delete" siswa-id="{{$siswa->id}}">Delete</a>
                                        </td>
                                    </tr>
                                    @endforeach -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/siswa/create" method="POST" enctype="multipart/form-data">
                    {{csrf_field()}}
                    <div class="form-group{{$errors->has('nama_depan') ? 'has-error' : ''}}">
                        <label for="exampleInputEmail1">Nama Depan</label>
                        <input value="{{old('nama_depan')}}" type="text" class="form-control" name="nama_depan" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nama Depan">
                        @if($errors->has('nama_depan'))
                        <span class="help-block">{{$errors->first('nama_depan')}}</span>
                        @endif
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Nama Belakang</label>
                        <input value="{{old('nama_belakang')}}" type="text" class="form-control" name="nama_belakang" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nama Belakang">
                    </div>
                    <div class="form-group{{$errors->has('email') ? 'has-error' : ''}}">
                        <label for="exampleInputEmail1">Email</label>
                        <input value="{{old('email')}}" type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email">
                        @if($errors->has('email'))
                        <span class="help-block">{{$errors->first('email')}}</span>
                        @endif
                    </div>
                    <div class="form-group{{$errors->has('jenis_kelamin') ? 'has-error' : ''}}">
                        <label for="exampleInputEmail1">Jenis Kelamin</label>
                        <select class="form-control" name="jenis_kelamin" id="">
                            <option value="L" {{(old('jenis_kelamin') == 'L') ? 'selected':'' }}>Laki-laki</option>
                            <option value="P" {{(old('jenis_kelamin') == 'P') ? 'selected':'' }}>Perempuan</option>
                        </select>
                        @if($errors->has('jenis_kelamin'))
                        <span class="help-block">{{$errors->first('jenis_kelamin')}}</span>
                        @endif
                    </div>
                    <div class="form-group{{$errors->has('agama') ? 'has-error' : ''}}">
                        <label for="exampleInputEmail1">Agama</label>
                        <input value="{{old('agama')}}" type="text" class="form-control" name="agama" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Agama">
                        @if($errors->has('agama'))
                        <span class="help-block">{{$errors->first('agama')}}</span>
                        @endif
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Alamat</label>
                        <textarea class="form-control" name="alamat" id="" cols="30" rows="3">{{old('alamat')}}</textarea>
                    </div>
                    <div class="form-group{{$errors->has('avatar') ? 'has-error' : ''}}">
                        <label for="exampleInputEmail1">Avatar</label>
                        <input type="file" name="avatar" class="form-control">
                        @if($errors->has('avatar'))
                        <span class="help-block">{{$errors->first('avatar')}}</span>
                        @endif
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="importSiswa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                {!!Form::open(['route'=>'siswa.import','class'=>'form-horizontal','enctype'=>'multipart/form-data'])!!}
                {!!Form::file('data_siswa')!!}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <input type="submit" class="btn btn-primary" value="import">
            </div>
            </form>
        </div>
    </div>
</div>
@section('footer')
<script>
    $(document).ready(function() {
        $('#datatable').DataTable({
            proccessing: true,
            serverside: true,
            ajax: "{{route('ajax.get.data.siswa')}}",
            columns: [{
                    data: 'nama_depan',
                    name: 'nama_depan'
                },
                {
                    data: 'nama_belakang',
                    name: 'nama_belakang'
                },
                {
                    data: 'jenis_kelamin',
                    name: 'jenis_kelamin'
                },
                {
                    data: 'agama',
                    name: 'agama'
                },
                {
                    data: 'alamat',
                    name: 'alamat'
                }, {
                    data: 'rata_nilai',
                    name: 'rata_nilai'
                },
                {
                    data: 'aksi',
                    name: 'aksi'
                }
            ]
        });

        $('body').on('click', '.delete', function() {
            var siswa_id = $(this).attr('siswa-id');
            swal({
                    title: "Yakin data mau di hapus?",
                    text: "Sekali hapus, kamu tidak akan bisa mengembalikan data" + siswa_id + "!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if (willDelete) {
                        window.location = "/siswa/" + siswa_id + "/delete";
                    } else {
                        swal("Your imaginary file is safe!");
                    }
                });
        });
    });
</script>
@endsection