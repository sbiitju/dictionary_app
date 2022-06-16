import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/word_response.dart';
import '../repo/word_repo.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _wordRepository;

  DictionaryCubit(this._wordRepository) : super(NoWordSearchedState());
  final queryController = TextEditingController();

  Future getWordSearchedResponse() async {
    emit(LoadingState());
    try {
      final words = await _wordRepository
          .getWordResponseFromDictionary(queryController.text);
      if (words == null) {
        emit(ErrorState("No Data Found"));
      } else {
        print(words.toString());
        emit(WordSearchedState(words));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(ErrorState(e.toString()));
    }
  }
}

abstract class DictionaryState {

}

class NoWordSearchedState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final List<WordResponse> words;

  WordSearchedState(this.words);
}

class ErrorState extends DictionaryState {
  final String errorMsg;
  ErrorState(this.errorMsg);
}

class LoadingState extends DictionaryState {}
