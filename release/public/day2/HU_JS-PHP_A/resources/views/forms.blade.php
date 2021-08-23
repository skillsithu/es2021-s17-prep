@extends('menu')

@section('left')
    <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link" href="{{ @route('events') }}">Manage Events</a></li>
    </ul>

    <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
        <span>{{ $event->name }}</span>
    </h6>
    <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link" href="{{ @route('detail', ['event' => $event->id]) }}">Overview</a></li>
    </ul>

    <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
        <span>Reports</span>
    </h6>
    <ul class="nav flex-column mb-2">
        <li class="nav-item"><a class="nav-link" href="reports/index.html">Room capacity</a></li>
    </ul>
@endsection

@section('right')
    <div class="border-bottom mb-3 pt-3 pb-2 event-title">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
            <h1 class="h2">{{ $event->name }}</h1>
        </div>
        <span class="h6">{{ $event->date }}</span>
    </div>

    @yield('form')
@endsection
