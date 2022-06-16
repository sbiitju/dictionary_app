import 'package:dictionary/model/word_response.dart';
import 'package:dictionary/service/http_service.dart';

class WordRepository{
  Future<List<WordResponse>?> getWordResponseFromDictionary(String query) async {
   try{
     final response= await HttpService.getResponse("en/$query");
     if(response.statusCode == 200){
       final wordResponse = wordResponseFromJson(response.body);
       return wordResponse;
     }else{
       return null;
     }
   }catch(e){
     rethrow;
   }
  }
}