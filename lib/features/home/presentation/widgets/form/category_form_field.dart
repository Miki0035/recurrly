import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';

class CategoryFormField extends StatelessWidget {
  final String? category;
  final ValueChanged<String?> onChanged;
  const CategoryFormField({super.key, this.category, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Text(
            'Category',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),

        FormField<String>(
          initialValue: category,
          validator: (value) {
            if (value == null) {
              return "Please select an option";
            }
            return null;
          },

          builder: (FormFieldState<String> state) {
            return Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                ...[
                  "Entertainment",
                  "AI Tools",
                  "Developer Tools",
                  "Design",
                  "Productivity",
                  "Other",
                ].map((value) {
                  final isSelected = state.value == value;

                  return GestureDetector(
                    onTap: () {
                      state.didChange(value);
                      onChanged(value);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? RColors.lightBeige
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: isSelected ? 2 : 1,
                          color: isSelected
                              ? RColors.orange
                              : RColors.borderColor,
                        ),
                      ),
                      child: Text(
                        value,
                        style: TextStyle(
                          color: isSelected ? RColors.orange : Colors.black,
                          fontWeight: isSelected ? .w700 : .w400,
                        ),
                      ),
                    ),
                  );
                }),

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
