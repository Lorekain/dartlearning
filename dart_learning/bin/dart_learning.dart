import 'dart:io';
import 'package:http/http.dart' as http; // http request and responses
import 'dart:convert'; // json

const String token = '7331024389:AAEQENPYA49rzDZhZITWkmOTLH-9yUeUv7o';

Future sendMessage(int chatId, String text) async {
  final sendMessageUrl =
      Uri.parse('https://api.telegram.org/bot$token/sendMessage');
  final response = await http.post(sendMessageUrl, body: {
    'chat_id': chatId.toString(),
    'text': text,
  });
  if (response.statusCode == 200) {
    print('message sent');
  } else {
    print(
        'message didnt delivered (error), status code: ${response.statusCode}');
  }
}

Future<String> getCatFact() async {
  final catUrl = Uri.parse('https://catfact.ninja/fact');
  final response = await http.get(catUrl);

  if (response.statusCode == 200) {
    final randomCatFact = jsonDecode(response.body);
    print('Факт о котиках успешно отправлен');
    return randomCatFact['fact'];
    
  } else 
  {
    print('Не получилось подтянуть факт о котиках');
    return '';
  }
}

Future<void> sendMessageWithButtons(int chatId) async {
  final sendMessageUrl =
      Uri.parse('https://api.telegram.org/bot$token/sendMessage');

  final inlineKeyboard = {
    'inline_keyboard': [
      [
        {'text': 'Перша піпка', 'callback_data': 'button_1'}
      ],
      [
        {'text': 'Друга піпка', 'callback_data': 'button_2'}
      ]
    ]
  };

  final response = await http.post(sendMessageUrl, body: {
    'chat_id': chatId.toString(),
    'text': 'with buttons',
    'reply_markup': jsonEncode(inlineKeyboard),
  });

  if (response.statusCode == 200) {
    print('Сообщение с кнопками отправлено.');
  } else {
    print('Ошибка при отправке сообщения: ${response.statusCode}');
  }
}

void main() async {
  int offset = 0;
  while (true) {
    final sendMessageUrl =
        Uri.parse('https://api.telegram.org/bot$token/sendMessage');
    final getUpdatesUrl = Uri.parse(
        'https://api.telegram.org/bot$token/getUpdates?offset=$offset');

    final response = await http.get(getUpdatesUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> updatesData = jsonDecode(response.body);

      if (updatesData.containsKey('result') && updatesData['result'] is List) {
        final List<dynamic> result = updatesData['result'];

        if (result.isNotEmpty) {
          for (var updatesData in result) {
            if (updatesData.containsKey('message')) {
              final message = updatesData['message'];
              final chatId = message['chat']['id'];
              final text = message['text'];

              if (updatesData.containsKey('callback_query')) {
                final callbackQuery = updatesData['callback_query'];
                final chatId = callbackQuery['message']['chat']['id'];
                final callbackData = callbackQuery['data'];

                // Обработка действий в зависимости от callback_data
                if (callbackData == 'button_1') {
                  await sendMessage(chatId, 'pl');
                } else if (callbackData == 'button_2') {
                  await sendMessage(chatId, getCatFact().toString());
                }
              }

              if (text == '/options') {
                sendMessageWithButtons(chatId);
              }
              // Обновляем offset, чтобы не получать одно и то же сообщение
              offset = updatesData['update_id'] + 1;
            }
          }
        }
      }
    }
    await Future.delayed(Duration(seconds: 3));
  }
}
