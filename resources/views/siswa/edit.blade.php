@extends('layout.master')

@section('content')
<h1>Edit Data Siswa</h1>
@if(session('sukses'))
<div class="alert alert-success" role="alert">
    {{session('sukses')}}
</div>
@endif
<div class="main">
    <div class="main-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">Inputs</h3>
                        </div>
                        <div class="panel-body">
                            <form action="/siswa/{{$siswa->id}}/update" method="POST" enctype="multipart/form-data">
                                {{csrf_field()}}
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Nama Depan</label>
                                    <input type="text" class="form-control" name="nama_depan" id="exampleInputEmail1" value="{{$siswa->nama_depan}}" placeholder="Nama Depan">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Nama Belakang</label>
                                    <input type="text" class="form-control" name="nama_belakang" id="exampleInputEmail1" value="{{$siswa->nama_belakang}}" placeholder="Nama Belakang">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Jenis Kelamin</label>
                                    <select class="form-control" name="jenis_kelamin" id="">
                                        <option value="L" @if($siswa->jenis_kelamin == 'L') selected @endif>Laki-laki</option>
                                        <option value="P" @if($siswa->jenis_kelamin == 'P') selected @endif>Perempuan</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Agama</label>
                                    <input type="text" class="form-control" name="agama" id="exampleInputEmail1" value="{{$siswa->agama}}" placeholder="Agama">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Alamat</label>
                                    <textarea class="form-control" name="alamat" id="" cols="30" rows="3">{{$siswa->alamat}}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Avatar</label>
                                    <input type="file" name="avatar" class="form-control">
                                </div>
                                <button type="submit" class="btn btn-warning">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@stop
@section('content1')
<div class="row">
    <div class="col-lg-12">
        <form action="/siswa/{{$siswa->id}}/update" method="POST">
            {{csrf_field()}}
            <div class="form-group">
                <label for="exampleInputEmail1">Nama Depan</label>
                <input type="text" class="form-control" name="nama_depan" id="exampleInputEmail1" value="{{$siswa->nama_depan}}" placeholder="Nama Depan">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Nama Belakang</label>
                <input type="text" class="form-control" name="nama_belakang" id="exampleInputEmail1" value="{{$siswa->nama_belakang}}" placeholder="Nama Belakang">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Jenis Kelamin</label>
                <select class="form-control" name="jenis_kelamin" id="">
                    <option value="L" @if($siswa->jenis_kelamin == 'L') selected @endif>Laki-laki</option>
                    <option value="P" @if($siswa->jenis_kelamin == 'P') selected @endif>Perempuan</option>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Agama</label>
                <input type="text" class="form-control" name="agama" id="exampleInputEmail1" value="{{$siswa->agama}}" placeholder="Agama">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Alamat</label>
                <textarea class="form-control" name="alamat" id="" cols="30" rows="3">{{$siswa->alamat}}</textarea>
            </div>
            <button type="submit" class="btn btn-warning">Update</button>
        </form>
    </div>
</div>
</div>

@endsection