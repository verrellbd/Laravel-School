@extends('layout.master')

@section('header')
@endsection

@section('content')
<div class="main">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            @if(session('sukses'))
            <div class="alert alert-success" role="alert">
                {{session('sukses')}}
            </div>
            @endif
            @if(session('gagal'))
            <div class="alert alert-danger" role="alert">
                {{session('gagal')}}
            </div>
            @endif
            <div class="panel panel-profile">
                <div class="clearfix">
                    <!-- LEFT COLUMN -->
                    <div class="profile-left">
                        <!-- PROFILE HEADER -->
                        <div class="profile-header">
                            <div class="overlay"></div>
                            <div class="profile-main">
                                <img src="{{$siswa->getAvatar()}}" class="img-circle" alt="Avatar">
                                <h3 class="name">{{$siswa->nama_depan}}</h3>
                                <span class="online-status status-available">Available</span>
                            </div>
                            <div class="profile-stat">
                                <div class="row">
                                    <div class="col-md-4 stat-item">
                                        {{$siswa->mapel->count()}} <span>Mata Pelajaran</span>
                                    </div>
                                    <div class="col-md-4 stat-item">
                                        {{$siswa->averageScore()}} <span>Rata rata nilai</span>
                                    </div>
                                    <div class="col-md-4 stat-item">
                                        2174 <span>Points</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END PROFILE HEADER -->
                        <!-- PROFILE DETAIL -->
                        <div class="profile-detail">
                            <div class="profile-info">
                                <h4 class="heading">Data diri</h4>
                                <ul class="list-unstyled list-justify">
                                    <li>Jenis Kelamin <span>{{$siswa->jenis_kelamin}}</span></li>
                                    <li>Agama <span>{{$siswa->agama}}</span></li>
                                    <li>Alamat <span>{{$siswa->alamat}}</span></li>
                                </ul>
                            </div>

                            <div class="text-center"><a href="/siswa/{{$siswa->id}}/edit" class="btn btn-primary">Edit Profile</a></div>
                        </div>
                        <!-- END PROFILE DETAIL -->
                    </div>
                    <!-- END LEFT COLUMN -->
                    <!-- RIGHT COLUMN -->
                    <div class="profile-right">

                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Mata Pelajaran</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Kode</th>
                                            <th>Nama</th>
                                            <th>Semester</th>
                                            <th>Nilai</th>
                                            <th>Guru</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($siswa->mapel as $mapel)
                                        <tr>
                                            <td>{{$mapel->kode}}</td>
                                            <td>{{$mapel->nama}}</td>
                                            <td>{{$mapel->semester}}</td>
                                            <td><a href="" class="nilai" data-type="text" data-pk="{{$mapel->id}}" data-url="/api/siswa/{{$siswa->id}}/editscore" data-title="Edit Nilai">{{$mapel->pivot->nilai}}</a></td>
                                            <td><a href="/guru/{{$mapel->guru_id}}/profile">{{$mapel->guru->nama}}</a></td>
                                            <td><a href="/siswa/{{$siswa->id}}/{{$mapel->id}}/deletescore" class="btn btn-danger btn-sm" onclick="return confirm('Yakin mau delete ?')">Delete</a></td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="chartNilai">

                            </div>
                        </div>
                    </div>
                    <!-- END RIGHT COLUMN -->
                </div>
            </div>
        </div>
    </div>
    <!-- END MAIN CONTENT -->
</div>

@endsection

@section('footer')
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
@endsection