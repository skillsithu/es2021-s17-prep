@extends('menu')

@section('left')
    <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link active" href="{{ @route('events') }}">Manage Events</a></li>
    </ul>
@endsection

@section('right')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Manage Events</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group mr-2">
                <a href="{{ @route('new') }}" class="btn btn-sm btn-outline-secondary">Create new event</a>
            </div>
        </div>
    </div>

    <div class="row events">
        @foreach($events as $event)
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <a href="{{ @route('detail', ['event' => $event->id]) }}" class="btn text-left event">
                    <div class="card-body">
                        <h5 class="card-title">{{ $event->name }}</h5>
                        <p class="card-subtitle">{{ $event->date }}</p>
                        <hr>
                        <p class="card-text">{{ $event->reg_count }} registrations</p>
                    </div>
                </a>
            </div>
        </div>
        @endforeach
    </div>
@endsection
