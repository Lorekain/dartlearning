import 'dart:io';
import 'package:http/http.dart' as http; // http request and responses
import 'dart:convert'; // json


const String token = '7331024389:AAEQENPYA49rzDZhZITWkmOTLH-9yUeUv7o';



void main() async {
  final sendMessageUrl = Uri.parse('https://api.telegram.org/bot$token/sendMessage');
  final getUpdatesUrl = Uri.parse('https://api.telegram.org/bot$token/getUpdates');

  final response = await http.get(getUpdatesUrl);

  if (response.statusCode == 200) {
    final Map<String, dynamic> updatesData = jsonDecode(response.body);

    if (updatesData.containsKey('result') && updatesData['result'] is List) {
      final List<dynamic> result = updatesData['result'];

      if (result.isNotEmpty) {

        for (var updatesData in result) {
          if (updatesData.containsKey('message')){

            final message = updatesData['message'];
            final chatId = message['chat']['id'];
            final text = message['text'];




            if (text == '/start') {
                final response = await http.post(sendMessageUrl, body:{
                  'chat_id' : chatId.toString(),
                  'text' : 'Привет ты нажал старт бота.'
                });
              if (response.statusCode == 200) {
                print ('Message delivered');
              } else {
                print ('error, ${response.statusCode}');

              }
            }
          }

        }
      }

    }
  }



}