@extends('app')

@section('content')
    <form method="post" action="" enctype="multipart/form-data" class="p-6">
        @csrf
        <input type="file" name="image" />
        <button type="submit">Upload image</button>
    </form>
@endsection
