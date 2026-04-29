import 'package:flutter/material.dart';
import 'package:recurrly/core/constants/colors.dart';
import 'package:recurrly/features/home/data/models/subscription_detail_model.dart';
import 'package:recurrly/features/subscription/presentation/widgets/subscription_tile_payment_info_container.dart';
import 'package:recurrly/features/subscription/presentation/widgets/subscription_tile_plan_detail_container.dart';
import 'package:recurrly/utils/date_formatter.dart' show RDateFormatters;

class HomeSubscriptionTile extends StatefulWidget {
  final SubscriptionDetailModel subscription;
  final Color titleBackgroundColor;
  final Color iconBackgroundColor;

  // PAYMENT DETAIL
  final VoidCallback onManage;

  // PLAN DETAIL
  final VoidCallback onChange;

  // for animation
  final bool isExpandable;

  const HomeSubscriptionTile({
    super.key,
    required this.titleBackgroundColor,
    required this.iconBackgroundColor,
    this.isExpandable = false,
    required this.onManage,
    required this.onChange,
    required this.subscription,
  });

  @override
  State<HomeSubscriptionTile> createState() => _HomeSubscriptionTileState();
}

class _HomeSubscriptionTileState extends State<HomeSubscriptionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final tileBackgroundColor = widget.isExpandable
        ? RColors.lightBeige
        : widget.titleBackgroundColor;

    final titleBorderRadius = widget.isExpandable
        ? BorderRadius.circular(15)
        : BorderRadius.only(topRight: .circular(25), bottomLeft: .circular(25));

    final tileBorderColor = widget.isExpandable
        ? RColors.borderColor
        : Colors.transparent;

    return GestureDetector(
      onTap: widget.isExpandable
          ? () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            }
          : () {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: _isExpanded ? 270 : 90,
        padding: .symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: _isExpanded
              ? widget.titleBackgroundColor
              : tileBackgroundColor,
          border: Border.all(
            color: _isExpanded ? Colors.transparent : tileBorderColor,
          ),
          borderRadius: _isExpanded
              ? BorderRadius.only(
                  topRight: .circular(25),
                  bottomLeft: .circular(25),
                )
              : titleBorderRadius,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: .start,
                mainAxisAlignment: .spaceBetween,
                children: [
                  // LEFT COLUMN
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 48,
                            padding: .all(8),
                            decoration: BoxDecoration(
                              color: widget.iconBackgroundColor,
                              borderRadius: .circular(12),
                            ),
                            child: Image.asset(
                              widget.subscription.icon,
                              fit: .contain,
                            ),
                          ),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                widget.subscription.subscriptionName,
                                overflow: .ellipsis,
                                style: TextStyle(
                                  fontWeight: .w700,
                                  fontSize: 18,
                                ),
                              ),

                              widget.isExpandable
                                  ? Text(
                                      widget.subscription.planType,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : Text(
                                      RDateFormatters.formatDate(
                                        widget.subscription.createdAt,
                                      ),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Text(
                        '\$${widget.subscription.amount}',
                        style: TextStyle(fontWeight: .w700, fontSize: 18),
                      ),

                      widget.isExpandable
                          ? Text(
                              RDateFormatters.formatMonthSinceSubscriptionCreated(
                                widget.subscription.createdAt,
                              ),
                              style: TextStyle(fontWeight: .w500, fontSize: 12),
                            )
                          : Text(
                              'per month',
                              style: TextStyle(fontWeight: .w500, fontSize: 12),
                            ),
                    ],
                  ),
                ],
              ),

              if (_isExpanded) ...[
                SizedBox(height: 18),
                // PAYMENT INFO
                SubscriptionTilePaymentInfoContainer(
                  cardNumber: widget.subscription.cardNumber,
                  onManage: widget.onManage,
                ),

                // PLAN DETAILS
                SubscriptionTilePlanDetailContainer(
                  planType: widget.subscription.planType,
                  onChange: widget.onChange,
                ),

                ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: .circular(50)),
                  ),
                  child: Text(
                    'Cancel Subscription',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: .w700,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
