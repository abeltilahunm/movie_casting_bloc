import 'package:flutter/material.dart';
import 'package:movie_casting_bloc/ui/shared/base_colors.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    Key? key,
    String? title,
    Widget? leading,
    GlobalKey<PopupMenuButtonState<int>>? popupMenuButtonKey,
    List<Widget>? actions,
    bool? showAction,
    Function? onSelected,
    String? popupMenuText,
    required bool centerTitle,
    required automaticallyImplyLeading,
  }) : super(
            key: key,
            automaticallyImplyLeading: automaticallyImplyLeading,
            elevation: 0,
            title: Text(
              "$title",
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 15),
            ),
            iconTheme: const IconThemeData(
              color: BaseColors.black, //change your color here
            ),
            centerTitle: centerTitle,
            leading: leading,
            actions: showAction == null
                ? null
                : [
                    PopupMenuButton<int>(
                      key: popupMenuButtonKey,
                      onSelected: (int val) => onSelected!(val),
                      icon: const Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.black,
                      ),
                      itemBuilder: (context) {
                        return <PopupMenuEntry<int>>[
                          PopupMenuItem(child: Text(popupMenuText!), value: 0),
                          const PopupMenuItem(child: Text('Logout'), value: 1),
                        ];
                      },
                    ),
                  ],
            backgroundColor: Colors.white);
}
