import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<FetchWeather>((event, emit)async {
      emit(BlocLoading());
      try{
        WeatherFactory wf=WeatherFactory("fd9c9e7602043a5952ed84e85e93aea9",language: Language.ENGLISH);
     
        
        Weather weather=await wf.currentWeatherByLocation(event.position.latitude, event.position.longitude);
        emit(BlocSuccess(weather));
        print(weather);
        print('time');
        final now = DateTime.now();
  final formatter = DateFormat('HH:mm');
  print(formatter.format(now));
      } catch(e){
        emit(BlocFailure());
      }
    });
  }
}
