import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/features/home/presentation/widgets/form/category_form_field.dart';
import 'package:recurrly/features/home/presentation/widgets/form/frequency_form_field.dart';

class CreateSubscriptionFormContainer extends StatefulWidget {
  const CreateSubscriptionFormContainer({super.key});

  @override
  State<CreateSubscriptionFormContainer> createState() =>
      _CreateSubscriptionFormContainerState();
}

class _CreateSubscriptionFormContainerState
    extends State<CreateSubscriptionFormContainer> {
  final _formKey = GlobalKey<FormState>();
  final subscriptionNameController = TextEditingController();
  final priceController = TextEditingController();
  String _frequency = "Monthly";
  String? _category;

  // Handles Subscription creation
  Future<void> _handleCreateSubscription() async {
    if (_formKey.currentState!.validate()) {
      print('form is valid');
      print(_frequency);
      print(_category);
    } else {
      print('form is valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .only(
        top: 24,
        bottom: MediaQuery.of(context).viewPadding.bottom,
      ),
      decoration: BoxDecoration(color: RColors.lightBeige),
      child: Column(
        mainAxisSize: .min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'New Subscription',
                  style: TextStyle(fontWeight: .w700, fontSize: 18),
                ),

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    side: BorderSide(color: RColors.borderColor),
                  ),
                  icon: Icon(Icons.close),
                ),
              ],
            ),
          ),

          Divider(thickness: 1, color: RColors.borderColor),

          SizedBox(height: 12),

          // FORM
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  TextFormField(
                    controller: subscriptionNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Subscription name is required';
                      }
                      return null;
                    },
                    cursorColor: RColors.darkBlack,
                    decoration: InputDecoration(labelText: "Name"),
                  ),

                  SizedBox(height: 18),

                  TextFormField(
                    controller: priceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a price';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid price';
                      }

                      if (double.parse(value) <= 0) {
                        return 'Price must be greater than 0';
                      }
                      return null;
                    },
                    cursorColor: RColors.darkBlack,
                    decoration: InputDecoration(labelText: "Price"),
                  ),

                  SizedBox(height: 18),

                  //Frequency
                  FrequencyFormField(
                    onChange: (value) {
                      setState(() {
                        _frequency = value;
                      });
                    },
                    frequency: _frequency,
                  ),

                  SizedBox(height: 18),

                  // Category
                  CategoryFormField(
                    onChanged: (value) {
                      setState(() {
                        _category = value;
                      });
                    },
                    category: _category,
                  ),
                  SizedBox(height: 48),

                  // CREATE BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleCreateSubscription,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: RColors.orange,
                        padding: .symmetric(vertical: 18.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(10),
                        ),
                      ),
                      child: Text(
                        'Create Subscription',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: .w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
