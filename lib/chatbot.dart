// ignore_for_file: constant_identifier_names

import 'package:dialog_flowtter/dialog_flowtter.dart';

class ChatBot {
  static const String AUTH_CREDENTIALS_PATH = "dialog_flow_auth.json";
  late final DialogFlowtter dialogFlowtterInst;

  ChatBot(Function callback) {
    _getCredentials(AUTH_CREDENTIALS_PATH).then((value) {
      dialogFlowtterInst = value;
      callback.call();
    });
  }

  Future<Message> query(final String message) async {
    final QueryInput queryInput = QueryInput(
      text: TextInput(text: message),
    );

    DetectIntentResponse response =
        await dialogFlowtterInst.detectIntent(queryInput: queryInput);

    return response.message!;
  }

  Future<DialogFlowtter> _getCredentials(final String path) async {
    return await DialogFlowtter.fromFile(path: AUTH_CREDENTIALS_PATH);
  }
}
