import 'package:dictionary/bloc/dictionary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget getDictionaryWidget(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Text(
            "My Dictionary",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: cubit.queryController,
            decoration: InputDecoration(
                hintText: "Search Here",
                filled: true,
                prefixIcon: Icon(Icons.search_sharp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            color: Colors.amber,
            child: MaterialButton(
              child: const Text("Get Meaning"),
              onPressed: () {
                cubit.getWordSearchedResponse();
              },
            ),
          )
        ],
      ),
    );
  }

  getLoadingWidget() {
    return Center(child: CircularProgressIndicator());
  }

  getErrorWidget(String msg) {
    return Center(child: Text(msg));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    var state = cubit.state;
    return BlocListener(
      listener: (context, s) {
        if (s is WordSearchedState && s.words != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailsScreen(s.words)));
        }
      },
      bloc: cubit,
      child: Scaffold(
        body: state is NoWordSearchedState
            ? getDictionaryWidget(context)
            : state is LoadingState
                ? getLoadingWidget()
                : state is ErrorState
                    ? getErrorWidget(state.errorMsg)
                    : getDictionaryWidget(context),
      ),
    );
  }
}
