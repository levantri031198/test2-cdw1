<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Airport;
use App\Flight;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class FlightController extends Controller
{
    public function index()
    {     
      //Lay gia tri bang airport
      $airports = DB::table('airports')->get();
      //Lay gia tri bang flight class
      $flightClasses = DB::table('flight_classes')->get();
      return view('index', [
        'airports' => $airports,
        'flightClasses' => $flightClasses
      ]);
    }

    public function create()
    {
        //Lay gia tri bang airport
        $airports = DB::table('airports')->get();
        //Lay gia tri bagn airplanes
        $airplanes = DB::table('airplanes')->get();
        //Lay gia tri bang flightClass
        $flightClasses = DB::table('flight_classes')->get();

        //tra ve view dang mang gia tri hang ve, san bay, hang bay
        return view('admin.create-flight', [
          'flightClasses' => $flightClasses,
           'airports' => $airports,
           'airplanes' => $airplanes,
        ]);
    }

   
    public function store(Request $request)
    {
        //Xac nhan gia tri nhap vao de tao chuyen bay
        $validator = Validator::make($request->all(), [  
          'flight_code' => 'required|unique:flights',
          'flight_airport_from' => 'required|different:flight_airport_to',
          'distance' => 'required',
          'return-date' => 'after_or_equal:departure-date|nullable',
          'arrival-datetime' => 'required|after_or_equal:departure-datetime',
          'departure-datetime' => 'required|after_or_equal:departure-date', 
           'departure-date' => 'required|after_or_equal:today',
        ]);
        //neu gia tri nhap vao loi thi quay lai trang nhap
        if ($validator->fails()) {
            return redirect()
            ->back() //quay lai
            ->withErrors($validator->errors()) //bao loi
            ->withInput(); //nhap lai
        } else {

          $input = $request->all(); //lay tat ca gia tri
          $flight = new Flight;  //tao gia tri moi trong bang flight
          
         
          $flight->flight_airplane_id = $input['airplane'];
          
          $flight->flight_airport_to_id = $input['flight_airport_to'];
      $flight->flight_class_id = $input['flightClass'];
           $flight->flight_type = $input['flight_type'];
           $flight->flight_airport_from_id = $input['flight_airport_from'];
          $flight->flight_code = $input['flight_code'];
          // Quy dinh gia may bay
          switch ($input['distance']) {
            case $input['distance'] >= 0 && $input['distance'] <= 100:
              $flight->flight_cost = 500000;
              break;
            case $input['distance'] >= 101 && $input['distance'] <= 200:
              $flight->flight_cost = 1000000;
              break;
            case $input['distance'] >= 201 && $input['distance'] <= 500:
              $flight->flight_cost = 2000000;
              break;
            case $input['distance'] >= 501 && $input['distance'] <= 1000:
              $flight->flight_cost = 3000000;
              break;
            case $input['distance'] >= 1001 && $input['distance'] <= 2000:
              $flight->flight_cost = 6000000;
              break;
            case $input['distance'] >= 2001 && $input['distance'] <= 5000:
              $flight->flight_cost = 20000000;
              break;
            case $input['distance'] >= 5001:
                $flight->flight_cost = 30000000;
                break;
            default:
              break;
          }

          $flight->flight_departure_date = $input['departure-date'];
         $flight->flight_return_date = $input['return-date'];


          $flight->flight_departure_time = $input['departure-datetime'];
      $flight->flight_arrival_time = $input['arrival-datetime'];
          $flight->duration = date('H:i', strtotime($input['arrival-datetime']) - strtotime($input['departure-datetime']));
          $flight->save(); //luu gia tri vao bang
          return redirect()->action('FlightController@create')->with([
            'status' => [
              'created' => "OK"
            ],
            'input' => $input,
          ]);
        }

    }


     public function detailsFlights($flight_id){
       $airports = new airport();

        $flights = DB::table('flights')
                      ->join('airplanes', 'flights.flight_airplane_id', 'airplanes.id')
                      ->join('airports as airport_from', 'flights.flight_airport_from_id', 'airport_from.id')
                      ->join('airports as airport_to', 'flights.flight_airport_to_id', 'airport_to.id')
                      ->join('flight_classes','flights.flight_class_id', 'flight_classes.id')
                      ->select(
                        'flights.*',
                        'airplanes.airplane_name',
                        'airport_from.airport_code as airport_from_code',
                        'airport_from.city_name as city_from',
                        'airport_from.airport_name as airport_from_name',
                        'airport_to.airport_code as airport_to_code',
                        'airport_to.city_name as city_to',
                        'airport_to.airport_name as airport_to_name',
                        'flight_classes.flight_class_name as flight_class'
                      );
        $detail = $flights->where('flights.id',$flight_id)->get();

        $airport_from = $airports->where('airports.id',$detail[0]->flight_airport_from_id)->get();
        $airport_to= $airports->where('airports.id',$detail[0]->flight_airport_to_id)->get();

        $flightDetail = $flights->where('flights.id', $flight_id)->get();
        return view('detail_flight', [
            'flight' => $flightDetail[0],
            'airport_from' => $airport_from[0],
            'airport_to' => $airport_to[0]
          ]);
      }
 

    public function searchFlights(Request $request)
    {
      //Xac dinh gia tri can nhap vao
        $validator = Validator::make($request->all(), [
          'from' => 'required|different:to'
        ]);


        //neu gia nhap vao loi
        if ($validator->fails()) {
            return redirect()
                        ->back() //quay lai
                        ->withErrors($validator->errors()) //bao loi
                        ->withInput(); //nhap lai
        } else {
          $input = $request->all(); //lay tat ca gia tri

          $flights = DB::table('flights')
                              ->join('airplanes', 'flights.flight_airplane_id', 'airplanes.id')
                  ->join('airports as airport_from', 'flights.flight_airport_from_id', 'airport_from.id')
                  ->join('airports as airport_to', 'flights.flight_airport_to_id', 'airport_to.id')
                              ->select(
                                'flights.*',
                  'airplanes.airplane_name',              
                                'airport_to.airport_code as airport_to_code',
                                'airport_from.city_name as city_from',                         
     'airport_to.city_name as city_to',                           
                                 'airport_from.airport_code as airport_from_code'
                              );

          $flights->where('flight_class_id', '=', $input['flight-class']);
          $flights = $flights->where('flight_type', '=', $input['flight_type']);
          $flights->where('flight_airport_from_id', '=', $input['from']);
          $flights->where('flight_airport_to_id', '=', $input['to']);

          // Check if departure-date is selected
          if (isset($input['departure-date'])) {
            $flights = $flights->where('flight_departure_date', '=', $input['departure-date']);
          }
          
          // Check if return-date is selected
          if (isset($input['departure-date'])) {
            $flights = $flights->where('flight_return_date', '=', $input['return-date']);
          }

          // Paginate
          $flights = $flights->paginate(5);
          $flights->appends(request()->input())->links();

          $airports = DB::table('airports')->get();
           $airport_to = $airports[$input['to'] - 1];
          $airport_from = $airports[$input['from'] - 1];
         

          return view('flight-list', [
            'input' => $input,
            'airport_from' => $airport_from,
            'flights' => $flights,
            'airport_to' => $airport_to
          ]);
        }
    }
}
