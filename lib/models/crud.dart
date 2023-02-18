import 'dart:convert';
import 'package:http/http.dart' as http;

class Crud {
  postRequest(String url) async {
    try {
      var responce = await http.post(Uri.parse(url));
      if (responce.statusCode == 200) {
        var responcebody = jsonDecode(responce.body);
        return responcebody;
      } else {
        print("error ${responce.statusCode}");
      }
    } catch (e) {
      print("error catch $e");
    }
  }
}
