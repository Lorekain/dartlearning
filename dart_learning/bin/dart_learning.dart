import 'dart:io';
import 'package:http/http.dart' as http; // http request and responses
import 'dart:convert'; // json


const String token = '7331024389:AAEQENPYA49rzDZhZITWkmOTLH-9yUeUv7o';

void main() async {
  final urlSendMessage = Uri.parse('https://api.telegram.org/bot$token/sendMessage');
  final urlGetUpdates = Uri.parse('https://api.telegram.org/bot$token/getUpdates');
    final sendMessage = await http.post(urlSendMessage,body: {
        'chat_id' : '612763187',
        'text' : '*privet*',
    
    });
  final getUpdates = await http.get(urlGetUpdates);







   if (sendMessage.statusCode == 200) {
      print('message  delivered');
      
   }
     else { 
      print ('no');
     }

     if (getUpdates.statusCode == 200) {
          final dynamic data = jsonEncode(getUpdates.body);
          
            final message = data['message'];
            final text = data['text'];
        await http.post(urlSendMessage, body: {
          'chat_id' : '612763187',
          'text' : text,
        });
          
    }


}