@extends('layout.master')

@section('header')
<link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" />
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
                                <img src="" class="img-circle" alt="Avatar">
                                <h3 class="name">{{$guru->nama}}</h3>
                                <span class="online-status status-available">Available</span>
                            </div>
                            <div class="profile-stat">
                                <div class="row">
                                    <div class="col-md-4 stat-item">
                                        {{$guru->mapel->count()}} <span>Mata Pelajaran</span>
                                    </div>
                                    <div class="col-md-4 stat-item">
                                        15 <span>Awards</span>
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
                                    <li>Telepon <span>{{$guru->telepon}}</span></li>
                                    <li>Alamat <span>{{$guru->alamat}}</span></li>
                                </ul>
                            </div>

                            <div class="text-center"><a href="/guru/{{$guru->id}}/edit" class="btn btn-primary">Edit Profile</a></div>
                        </div>
                        <!-- END PROFILE DETAIL -->
                    </div>
                    <!-- END LEFT COLUMN -->
                    <!-- RIGHT COLUMN -->
                    <div class="profile-right">

                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Mata Pelajaran yang diajar {{$guru->nama}}</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Kode</th>
                                            <th>Semester</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($guru->mapel as $mapel)
                                        <tr>
                                            <td>{{$mapel->nama}}</td>
                                            <td>{{$mapel->semester}}</td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
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

@endsection