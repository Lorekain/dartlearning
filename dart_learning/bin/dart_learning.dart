import 'dart:io';
import 'package:http/http.dart' as http; // http request and responses
import 'dart:convert'; // json
import 'package:translator/translator.dart';

const String token = '7331024389:AAEQENPYA49rzDZhZITWkmOTLH-9yUeUv7o';
// Функция отправки сообщения на вход принимает кому и сам текст отправки
Future sendMessage(int chatId, String text) async {
  final sendMessageUrl =
      Uri.parse('https://api.telegram.org/bot$token/sendMessage');
  final response = await http.post(sendMessageUrl, body: {
    'chat_id': chatId.toString(),
    'text': text,
  });
  if (response.statusCode == 200) {
    print('Сообщение отправлено(функция sendMessage)');
  } else {
    print(
        'Сообщение не отправлено, status code: ${response.statusCode}');
  }
}

Future<String> translate(String text) async {
  final translator = GoogleTranslator();
  var translation = await translator.translate(text, to: 'uk');
  return '$translation';

}
Future<String> catApi() async{
  final String apiKey = 'live_t0hv3sUJS31fd7UYQpxbVM0Y8WnSaSDq1dLhR3aj5JObLvLhFVMXM1UyeSjR6XOL';
  final catApiUrl = Uri.parse('https://api.thecatapi.com/v1/images/search');
  final response = await http.get(catApiUrl);
  if (response.statusCode == 200) {
    final List<dynamic> catData = jsonDecode(response.body);
    final catImageUrl = catData[0]['url'];
    return catImageUrl;
  } else { return '';}

}
// Функция API кітиків отдает случайный факт в виде строки
Future<String> getCatFact() async {
  final catUrl = Uri.parse('https://catfact.ninja/fact');
  final response = await http.get(catUrl);

  if (response.statusCode == 200) {
    final randomCatFact = jsonDecode(response.body);
    print('Факт о котиках успешно отправлен');
    return randomCatFact['fact'];
  } else {
    print('Не получилось подтянуть факт о котиках');
    return '';
  }
}

Future<void> sendMessageWithButtons(int chatId) async {
  final sendMessageUrl = Uri.parse('https://api.telegram.org/bot$token/sendMessage');

  final inlineKeyboard = {
    'inline_keyboard': [
      [
        {'text': 'Перша подушечка', 'callback_data': 'button_1'}
      ],
      [
        {'text': 'Взнати цікавий факт', 'callback_data': 'button_2'},
        {'text': 'Випадкове фото', 'callback_data': 'button_3'}
      ]
    ]
  };

  final response = await http.post(sendMessageUrl, body: {
    'chat_id': chatId.toString(),
    'text': 'Виберіть функцію яка вас цікавить! 🐾',
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
    final getUpdatesUrl = Uri.parse(
        'https://api.telegram.org/bot$token/getUpdates?offset=$offset');

    final response = await http.get(getUpdatesUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> updatesData = jsonDecode(response.body);

      if (updatesData.containsKey('result') && updatesData['result'] is List) {
        final List<dynamic> result = updatesData['result'];

        if (result.isNotEmpty) {
          
          for (var update in result) {
            // Перевіряємо чи є callback_query
            if (update.containsKey('callback_query')) {
              final callbackQuery = update['callback_query'];
              final chatId = callbackQuery['message']['chat']['id'];
              final callbackData = callbackQuery['data'];
              print(callbackData);

              // Обробка callback_data
              if (callbackData == 'button_1') {
                await sendMessage(chatId, 'Ви натиснули першу подушечку');
              } else if (callbackData == 'button_2') {
                final String catFactUkranian = await translate(await getCatFact());
                  await sendMessage(chatId, catFactUkranian);
                
              } else if (callbackData == 'button_3') {
                sendMessage(chatId, await catApi());

              }

              // Оновлюємо offset після обробки callback_query
              offset = update['update_id'] + 1;
            }

            // Перевіряємо чи є звичайне повідомлення
            if (update.containsKey('message')) {
              final message = update['message'];
              final chatId = message['chat']['id'];
              final text = message['text'];

              if (text == '/options') {
                sendMessageWithButtons(chatId);
              }
              if (text == '/start') {
                sendMessage(chatId, 'Вітаю в чат боті кітиків!');
                sendMessage(chatId, await catApi());
              }

              // Оновлюємо offset після обробки повідомлення
              offset = update['update_id'] + 1;
            }
          }
        }
      }
    }

    await Future.delayed(Duration(seconds: 2));
  }
}
