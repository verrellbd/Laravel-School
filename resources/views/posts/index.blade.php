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
                                    <a href="{{route('posts.add')}}" class="btn btn-primary btn-sm">Add New Post</a>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>TITLE</th>
                                        <th>USER</th>
                                        <th>ACTION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($posts as $post)
                                    <tr>
                                        <td>{{$post->id}}</td>
                                        <td>{{$post->title}}</td>
                                        <td>{{$post->user->name}}</td>
                                        <td>
                                            <a target="_blank" href="{{route('site.single.post',$post->slug)}}" class="btn btn-info btn-sm">View</a>
                                            <a href="#" class="btn btn-warning btn-sm">Edit</a>
                                            <a href="#" class="btn btn-danger btn-sm delete">Delete</a>
                                        </td>
                                    </tr>
                                    @endforeach
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

@section('footer')
<script>
    $('.delete').click(function() {
        var siswa_id = $(this).attr('siswa-id');
        swal({
            title: " Yakin data mau di hapus?",
            text: "Sekali hapus, kamu tidak akan bisa mengembalikan data" + siswa_id + "!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                window.location = "/siswa/" + siswa_id + "/delete";
            } else {
                swal("Your imaginary file is safe!");
            }
        });
    });
</script>
@endsection