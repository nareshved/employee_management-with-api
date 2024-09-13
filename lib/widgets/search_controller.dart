import 'package:flutter/material.dart';

TextFormField searchTextField(
    {required TextEditingController searchController}) {
  return TextFormField(
    autocorrect: true,
    autofocus: true,
    controller: searchController,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    textInputAction: TextInputAction.search,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        hintText: "Search here",
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
  );
}
