import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';

class FrequencyFormField extends StatelessWidget {
  final String? frequency;
  final ValueChanged<String> onChange;
  const FrequencyFormField({super.key, this.frequency, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,

      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 8),
          child: Text(
            'Frequency',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        FormField<String>(
          initialValue: frequency,
          validator: (value) {
            if (value == null) {
              return "How often do you pay for this?";
            }
            return null;
          },

          builder: (FormFieldState<String> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: ["Monthly", "Yearly"].map((value) {
                    final isSelected = state.value == value;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          state.didChange(value);
                          onChange(value);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? RColors.lightBeige
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: isSelected ? 2 : 1,
                              color: isSelected
                                  ? RColors.orange
                                  : RColors.borderColor,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              value,
                              style: TextStyle(
                                color: isSelected
                                    ? RColors.orange
                                    : Colors.black,
                                fontWeight: isSelected ? .w700 : .w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                // 🔴 validation message
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      state.errorText!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
