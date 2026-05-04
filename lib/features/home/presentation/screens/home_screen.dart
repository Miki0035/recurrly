import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/core/constants/dummy_data.dart';
import 'package:recurrly/core/constants/icons.dart';
import 'package:recurrly/features/home/presentation/widgets/home_balance_card.dart';
import 'package:recurrly/features/home/presentation/widgets/home_profile_pic_username.dart';
import 'package:recurrly/features/home/presentation/widgets/home_subscription_detail_card.dart';
import 'package:recurrly/shared/home_subscription_tile.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onNavigateToSubscription;
  const HomeScreen({super.key, required this.onNavigateToSubscription});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          children: [
            HomeProfilePicUsername(),

            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (context) => CreateSubscriptionFormContainer(),
                );
              },
              child: Container(
                width: 42,
                padding: .all(8),
                decoration: BoxDecoration(
                  borderRadius: .circular(50),
                  border: .all(color: RColors.borderColor),
                ),

                child: Image.asset(RIcons.add, fit: .contain),
              ),
            ),
          ],
        ),

        SizedBox(height: 18),
        // BALANCE CONTAINER
        HomeBalanceCard(balance: 198.53, date: '04/21'),

        SizedBox(height: 18),

        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('Upcoming', style: TextStyle(fontWeight: .w700, fontSize: 18)),

            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                side: BorderSide(color: RColors.borderColor),
              ),
              child: Text(
                'View all',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .w700,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 18),

        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: subscriptions.length,
            scrollDirection: .horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 12),

            itemBuilder: (context, index) {
              final subscription = subscriptions[index];
              return HomeSubscriptionDetailCard(
                icon: subscription.icon,
                amount: subscription.amount,
                createdAt: subscription.createdAt,
                subscriptionName: subscription.subscriptionName,
              );
            },
          ),
        ),

        SizedBox(height: 18),

        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'All Subscriptions',
              style: TextStyle(fontWeight: .w700, fontSize: 18),
            ),

            TextButton(
              onPressed: onNavigateToSubscription,
              style: TextButton.styleFrom(
                side: BorderSide(color: RColors.borderColor),
              ),
              child: Text(
                'View all',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .w700,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 18),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeSubscriptions.length,
          itemBuilder: (context, index) {
            final tile = homeSubscriptions[index];
            return HomeSubscriptionTile(
              subscription: tile.subscription,
              titleBackgroundColor: tile.titleBackgroundColor,
              iconBackgroundColor: tile.iconBackgroundColor,
              onManage: () {},
              onChange: () {},
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 12),
        ),
      ],
    );
  }
}

class CreateSubscriptionFormContainer extends StatelessWidget {
  const CreateSubscriptionFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(vertical: kToolbarHeight),
      decoration: BoxDecoration(color: RColors.lightBeige),
      child: Column(
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
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  TextFormField(
                    cursorColor: RColors.darkBlack,
                    decoration: InputDecoration(labelText: "Name"),
                  ),

                  SizedBox(height: 18),
                  TextFormField(
                    cursorColor: RColors.darkBlack,
                    decoration: InputDecoration(labelText: "Price"),
                  ),

                  SizedBox(height: 18),

                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: Text(
                          'Frequency',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      //Frequency
                      FormField<String>(
                        initialValue: "Monthly",
                        validator: (value) {
                          if (value == null) {
                            return "Please select an option";
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
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? RColors.lightBeige
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
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
                                              fontWeight: isSelected
                                                  ? .w700
                                                  : .w400,
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
                  ),

                  SizedBox(height: 18),

                  // Category
                  Column(
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
                        initialValue: "",
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
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 8,
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
                                        color: isSelected
                                            ? RColors.orange
                                            : Colors.black,
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
                  ),

                  SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
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
