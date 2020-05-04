@extends('layout.master')

@section('content')

<div class="main">
    <div class="main-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <div>
                                <h3 class="panel-title">Add Post</h3>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-8">
                                <form action="{{route('posts.create')}}" method="POST" enctype="multipart/form-data">
                                    {{csrf_field()}}
                                    <div class="form-group{{$errors->has('title') ? 'has-error' : ''}}">
                                        <label for="exampleInputEmail1">Title</label>
                                        <input value="{{old('title')}}" type="text" class="form-control" name="title" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Title">
                                        @if($errors->has('title'))
                                        <span class="help-block">{{$errors->first('title')}}</span>
                                        @endif
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Content</label>
                                        <textarea class="form-control" name="content" id="content" cols="30" rows="3">{{old('content')}}</textarea>
                                    </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary">
                                            <i class="fa fa-picture-o"></i> Choose
                                        </a>
                                    </span>
                                    <input id="thumbnail" class="form-control" type="text" name="thumbnail">
                                </div>
                                <img id="holder" style="margin-top:15px;max-height:100px;">
                                <div class="input-group">
                                    <input type="submit" class="btn btn-info" value="Submit">
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@section('footer')
<script src="/vendor/laravel-filemanager/js/lfm.js"></script>
<script>
    ClassicEditor
        .create(document.querySelector('#content'))
        .catch(error => {
            console.error(error);
        });
    $(document).ready(function() {
        $('#lfm').filemanager('image');
    });
</script>
@endsection