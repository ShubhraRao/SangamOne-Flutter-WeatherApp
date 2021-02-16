import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  Network(this.url);

  getData() async {
    var response = await http.get(url);
    print(response.body);
    if(response.statusCode == 200){
      Map<String, dynamic> map = jsonDecode(response.body);
      print("MAp");
      print(map);
      return map;
    }
    else{
      print(response.body);
      print(response.statusCode);
    }
  }
}