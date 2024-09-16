import 'package:flutter/material.dart';

Widget employeeEditTextField(
    {required TextInputType keyboard,
    required TextEditingController controller,
    String? Function(String?)? editValidator,
    bool obscureTxt = false,
    String? obscuringCharacter,
    String? hint,
    Color? mcColor,
    BorderRadiusGeometry? mcBorder,
    required String feildName,
    required String lableName}) {
  return Row(
    children: [
      SizedBox(width: 80, child: Text(feildName)),
      const SizedBox(
        width: 14,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              keyboardType: keyboard,
              controller: controller,
              autocorrect: true,
              autofocus: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              minLines: 1,
              validator: editValidator,
              decoration: InputDecoration(
                label: Text(
                  lableName,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                hintText: hint,
              )),
        ),
      ),
    ],
  );
}
