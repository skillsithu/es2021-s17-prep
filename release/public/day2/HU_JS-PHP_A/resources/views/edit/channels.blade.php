@extends('forms')

@section('form')
    <div class="mb-3 pt-3 pb-2">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
            <h2 class="h4">Create new channel</h2>
        </div>
    </div>

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form class="needs-validation" novalidate action="" method="post">
        @csrf
        <div class="row">
            <div class="col-12 col-lg-4 mb-3">
                <label for="inputName">Name</label>
                <input type="text" class="form-control id="inputName" name="name" placeholder="" value="">
                <div class="invalid-feedback">
                    Name is required.
                </div>
            </div>
        </div>

        <hr class="mb-4">
        <button class="btn btn-primary" type="submit">Save channel</button>
        <a href="{{ @route('detail', ['event' => $event->id]) }}" class="btn btn-link">Cancel</a>
    </form>
@endsection
