import 'package:flutter/material.dart';
import 'package:recurrly/core/auth/global_auth.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/features/home/data/data_sources/local/subscription_local_datasource.dart';
import 'package:recurrly/features/home/data/data_sources/remote/subscription_remote_datasource.dart';
import 'package:recurrly/features/home/data/repositories/subscription_repository_impl.dart';
import 'package:recurrly/features/home/domain/usecases/get_all_subsciption_usecase.dart';
import 'package:recurrly/features/home/domain/usecases/save_subscription_usecase.dart';
import 'package:recurrly/features/home/presentation/controllers/subscription_controller.dart';
import 'package:recurrly/features/home/presentation/widgets/form/category_form_field.dart';
import 'package:recurrly/features/home/presentation/widgets/form/frequency_form_field.dart';
import 'package:recurrly/shared/ui/app_snackbar.dart';
import 'package:recurrly/utils/validator.dart';

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

  bool _isLoading = false;

  late SubscriptionController subscriptionController;

  @override
  void initState() {
    super.initState();
    subscriptionController = SubscriptionController(
      saveSubscriptionUsecase: SaveSubscriptionUsecase(
        repository: SubscriptionRepositoryImpl(
          datasource: SubscriptionRemoteDataSource(),
          localDatasource: SubscriptionLocalDatasource(),
        ),
      ),
      getAllSubsciptionUsecase: GetAllSubsciptionUsecase(
        repository: SubscriptionRepositoryImpl(
          datasource: SubscriptionRemoteDataSource(),
          localDatasource: SubscriptionLocalDatasource(),
        ),
      ),
    );
  }

  // Handles Subscription creation
  Future<void> _handleCreateSubscription() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      // call controller
      final result = await subscriptionController.saveSubscription(
        name: subscriptionNameController.text.trim(),
        price: double.parse(priceController.text),
        category: _category!.toLowerCase(),
        frequency: _frequency.toLowerCase(),
        userId: authState.currentUser!.id!,
      );
      if (result.isSuccess) {
        if (!mounted) return;
        setState(() {
          _isLoading = false;
        });
        AppSnackbar.showSuccess(
          context: context,
          message: "Subscription saved successfully",
        );
        Navigator.pop(context);
        return;
      }

      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      Navigator.pop(context);
      AppSnackbar.showError(context: context, message: result.error!);
      return;
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

          _isLoading
              ? SizedBox(
                  height: 450,
                  child: Center(child: CircularProgressIndicator()),
                )
              :
                // FORM
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 18,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        TextFormField(
                          controller: subscriptionNameController,
                          validator: (val) =>
                              RValidator.emptyString(val!, "Subscription name"),
                          cursorColor: RColors.darkBlack,
                          decoration: InputDecoration(labelText: "Name"),
                        ),

                        SizedBox(height: 18),

                        TextFormField(
                          controller: priceController,
                          validator: (value) =>
                              RValidator.validateCurrency(value ?? ""),
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
