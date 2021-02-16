import 'location.dart';
import 'network.dart';

class WeatherModel {
  getWeatherByLocation() async {
    Location l1 = Location();
    await l1.getCurrentLocation();
    print(l1.lat);
    print(l1.lon);
    
    Network n1 = Network("https://api.openweathermap.org/data/2.5/find?lat="+ l1.lat.toString()+ "&lon=" + l1.lon.toString() +"&cnt=2&appid=87c91f1d1e37cac2334effd38cf65270");
    var data = await n1.getData();
    print("Data");
    print(data);
    return data;
  }

  getWeatherByCity(String city) async{
    Network n1 = Network("https://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=87c91f1d1e37cac2334effd38cf65270");
    var data = await n1.getData();
    print("Data");
    print(data);
    return data;
  }



  getWeatherIcon(int condition){
    if(condition<300){
      return '⛈';
    } else if(condition<400){
      return '🌦';
    } else if(condition<600){
      return '🌧';
    } else if(condition<700){
      return '❄';
    } else if(condition<800){
      return '🕊';
    } else if(condition==800){
      return '☀';
    } else {
      return '☁';
    }
  }

  getMessage(){
    
  }

}