@extends('layout.frontend')

@section('content')
<section class="banner-area relative about-banner" id="home">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white">
                    Pendaftaran
                </h1>
                <p class="text-white link-nav"><a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span> <a href="about.html"> Register</a></p>
            </div>
        </div>
    </div>
</section>
<section class="search-course-area relative" style="background:unset">
    <div class="container">
        <div class="row justify-content-between align-items-center">
            <div class="col-lg-6 col-md-6 search-course-left">
                <h1>
                    Ayo gabung, <br>
                    bersama kami!
                </h1>
                <p>
                    Dengan kelas online yang kami buat sudah akan memenuhi kebutuhan pasar,
                    kurikulum yang kami terapkan juga adalah kurikulum internasional. Selain itu
                    anda akan mendapatkan sertifikat standar internasional
                </p>
            </div>
            <div class="col-lg-6 col-md-6 search-course-right section-gap">
                {!! Form::open(['url' => '/postregister','class'=>'form-wrap']) !!}
                <h4 class="pb-20 text-center mb-30">Form Pendaftaran</h4>
                {!! Form::text('nama_depan', '',['class' => 'form-control','placeholder' => 'Nama Depan'])!!}
                {!! Form::text('nama_belakang', '',['class' => 'form-control','placeholder' => 'Nama Belakang'])!!}
                {!! Form::text('agama', '',['class' => 'form-control','placeholder' => 'Agama'])!!}
                {!! Form::textarea('alamat', '',['class' => 'form-control','placeholder' => 'Alamat'])!!}
                <div class="form-select" id="service-select">
                    {!! Form::select('jenis_kelamin', [''=>'Jenis Kelamin','L' => 'Laki-laki', 'S' => 'Perempuan'],['style' => 'display:none;']);!!}
                </div>

                {!! Form::email('email','', ['class' => 'form-control','placeholder' => 'Email'])!!}
                {!! Form::password('password', ['class' => 'form-control','placeholder' => 'Password'])!!}

                <input type="submit" class="primary-btn text-uppercase" value="REGISTER" style="text-align:center;">
                {!! Form::close() !!}
            </div>
        </div>
    </div>
</section>
@endsection