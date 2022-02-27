// ignore_for_file: constant_identifier_names

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:vt_hacks_submission/search_query.dart';
import 'dart:convert';

class ChatBot {
  static const String AUTH_CREDENTIALS_PATH = "assets/dialog_flow_auth.json";
  late final DialogFlowtter dialogFlowtterInst;

  static Future<ChatBot> load() async {
    return ChatBot()
      ..dialogFlowtterInst = await _getCredentials(AUTH_CREDENTIALS_PATH);
  }

  Future<SearchQuery> query(final String message) async {
    final QueryInput queryInput = QueryInput(
      text: TextInput(text: message),
    );

    DetectIntentResponse response =
        await dialogFlowtterInst.detectIntent(queryInput: queryInput);

    return parseResponse(jsonDecode(response.text!));
  }

  Future<SearchQuery> parseResponse(Map<String, dynamic> map) async {
    return SearchQuery.fromJson(map);
  }

  static Future<DialogFlowtter> _getCredentials(final String path) async {
    await Future.delayed(const Duration(seconds: 4));
    return await DialogFlowtter.fromFile(path: AUTH_CREDENTIALS_PATH);
  }
}
