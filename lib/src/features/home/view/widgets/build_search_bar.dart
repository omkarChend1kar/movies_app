import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/core/common/services/service_locator.dart';
import 'package:movies_app/src/features/home/view/state/searchresults/search_results_notifier_impl.dart';

TextField buildSearchBar(
  TextEditingController textEditingController,
  ValueNotifier<bool> isSearched,
) {
  return TextField(
    cursorColor: Colors.deepOrangeAccent,
    controller: textEditingController,
    scribbleEnabled: true,
    autocorrect: true,
    decoration: InputDecoration(
      hoverColor: Colors.deepOrangeAccent,
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent)),
      focusColor: Colors.deepOrangeAccent,
      // constraints: BoxConstraints(minHeight: 52, minWidth: 366),
      suffixIcon: Consumer(
        builder: (context, ref, child) {
          return InkWell(
            onTap: () {
              ///
              isSearched.value = true;

              ///
              sl<SearchResultsNotifierImpl>().emptySearchResults();

              ///
              sl<SearchResultsNotifierImpl>().notifySearchResults(
                textEditingController.text,
              );
            },
            child: Container(
              height: 50,
              width: 50,
              color: Colors.black45,
              child: const Icon(
                Icons.search_sharp,
                size: 30,
                color: Colors.deepOrangeAccent,
              ),
            ),
          );
        },
      ),
      hintText: 'Enter keywords..',
      fillColor: Colors.grey.shade500,
      filled: true,
      iconColor: Colors.deepOrangeAccent,
      suffixIconConstraints: const BoxConstraints(minHeight: 30, minWidth: 60),
    ),
  );
}
