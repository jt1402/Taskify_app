import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import 'package:todo_list/views/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:todo_list/views/bottom_sheets/settings_bottom_sheet_view.dart';
import 'package:todo_list/views/settings.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo_main.png',
                    width: 40,
                    height: 45,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Taskify",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: viewModel.clrLvl4,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(1, 2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        viewModel.bottomSheetBuilder(
                          const DeleteBottomSheetView(),
                          context,
                        );
                      },
                      child:
                          const Icon(Icons.delete, color: Colors.red, size: 30),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsForm(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.settings,
                        color: viewModel.clrLvl3,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
