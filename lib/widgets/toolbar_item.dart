import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToolbarItem extends StatelessWidget {
  const ToolbarItem({
    super.key,
    required this.icon,
    this.onPressedButton,
    this.tooltip,
    this.isExpandable = false,
    this.items,
    this.expandableBackground,
    this.iconColor,
  });

  final dynamic icon;
  final VoidCallback? onPressedButton;
  final String? tooltip;
  final bool isExpandable;
  final List<Widget>? items;
  final Color? expandableBackground;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return !isExpandable
        ? Material(
            type: MaterialType.transparency,
            child: IconButton(
              onPressed: onPressedButton,
              splashColor: Colors.teal.withOpacity(0.4),
              highlightColor: Colors.teal.withOpacity(0.4),
              icon: icon is String
                  ? Text(
                      icon,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: iconColor,
                      ),
                    )
                  : FaIcon(icon, size: 16, color: iconColor),
              tooltip: tooltip,
            ),
          )
        : ExpandableNotifier(
            child: Expandable(
              key: const Key("list_button"),
              collapsed: ExpandableButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: icon is String
                      ? Text(
                          icon,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: iconColor,
                          ),
                        )
                      : FaIcon(
                          icon,
                          size: 16,
                          color: iconColor,
                        ),
                ),
              ),
              expanded: Container(
                color: expandableBackground ?? Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Row(
                    children: [
                      for (var item in items!) item,
                      ExpandableButton(
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            size: 16,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
