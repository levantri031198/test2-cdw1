@extends('layouts.app')

@section('content')
  
  <main>
        <div class="container">
            <section>
               <h2>{{ $airport_from->city_name }} ({{ $airport_from->airport_code }}) <i class="glyphicon glyphicon-arrow-right"></i> {{ $airport_to->city_name }} ({{ $airport_to->airport_code }})</h2>
              @if(!$flight)
                  <h3>No results.</h3>
              @else
              
                <article>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <h4><strong><a href="">{{ $flight->airplane_name }} </a></strong></h4>
                                    <div class="row">
                                       <div class="col-sm-3">
                                            <label class="control-label">From:</label>
                                            <div><big class="time">{{ date("H:i", strtotime($flight->flight_departure_time)) }}</big></div>
                                            <div><span class="place">{{ $flight->city_from }} ({{ $flight->airport_from_code }})</span></div>
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label">To:</label>
                                            <div><big class="time">{{ date("H:i", strtotime($flight->flight_arrival_time)) }}</big></div>
                                            <div><span class="place">{{ $flight->city_to }} ({{ $flight->airport_to_code }})</span></div>
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label">Duration:</label>
                                            <div><big class="time">{{ date("h:i", strtotime($flight->duration)) }}</big></div>
                                            {{-- <div><strong class="text-danger">1 Transit</strong></div> --}}
                                        </div>
                                        <div class="col-sm-3 text-right">
                                            <h3 class="price text-danger"><strong>{{ str_replace(',', '.', number_format($flight->flight_cost)) }}</strong></h3>
                                            <div>
                                              
                                                <a href="{{ route('flightBooking', ['flight_id' => $flight->id]) }}" class="btn btn-primary">Choose</a>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a data-toggle="tab" href="#flight-detail-tab">Flight Details</a></li>
                                        <li><a data-toggle="tab" href="#flight-price-tab">Price Details</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="flight-detail-tab" class="tab-pane fade in active">
                                            <ul class="list-group">
                                                <li class="list-group-item">
                                                    <h5>
                                                        <strong class="airline">{{ $flight->airplane_name }} {{ $flight->flight_code }}</strong>
                                                        <p><span class="flight-class">{{ $flight->flight_class}}
                                                    </h5>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div><big class="time">{{ date("H:i", strtotime($flight->flight_departure_time)) }}</big></div>
                                                                    <div><small class="date">{{ $flight->flight_departure_date }}</small></div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div><span class="place">{{ $flight->city_from }} ({{ $flight->airport_from_code }})</span></div>
                                                                    <div><small class="airport">{{ $flight->airport_from_name }}</small></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-1">
                                                            <i class="glyphicon glyphicon-arrow-right"></i>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <div><big class="time">{{ date("h:i", strtotime($flight->flight_arrival_time)) }}</big></div>
                                                                    <div><small class="date">{{ date("d-m-y", strtotime($flight->flight_arrival_time)) }}</small></div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div><span class="place">{{ $flight->city_to }} ({{ $flight->airport_to_code }})</span></div>
                                                                    <div><small class="airport">{{ $flight->airport_to_name }}</small></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3 text-right">
                                                            <label class="control-label">Duration:</label>
                                                            <div><big class="time">{{ date("h:i", strtotime($flight->duration)) }}</big></div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div id="flight-price-tab" class="tab-pane fade">
                                            <h5>
                                                <strong class="airline">Qatar Airways</strong>
                                                <p><span class="flight-class">Economy</span></p>
                                            </h5>
                                            <ul class="list-group">
                                                <li class="list-group-item">
                                                    <div class="pull-left">
                                                        <strong>Price</strong>
                                                    </div>
                                                    <div class="pull-right">
                                                        <strong>{{$flight->flight_cost}}</strong>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="pull-left">
                                                        <span>Tax</span>
                                                    </div>
                                                    <div class="pull-right">
                                                        <span>Included</span>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </li>
                                                <li class="list-group-item list-group-item-info">
                                                    <div class="pull-left">
                                                        <strong>You Pay</strong>
                                                    </div>
                                                    <div class="pull-right">
                                                        <strong>{{$flight->flight_cost}}</strong>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
              
                @endif
            </section>
        </div>
    </main>
@endsection
