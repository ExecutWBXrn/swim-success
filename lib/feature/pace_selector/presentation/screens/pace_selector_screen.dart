import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swim_success/core/extension/color_extension.dart';
import 'package:swim_success/core/extension/theme_extension.dart';
import 'package:swim_success/feature/pace_selector/presentation/widgets/widgets.dart';

/// pace selector screen with 100m fastest user run
class PaceSelectorScreen extends ConsumerWidget {
  const PaceSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "What is your fastest 100m freestyle?",
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "This helps build more accurate plan for you",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
                const SizedBox(height: 25),
                const TimerPaceWidget(),
                const SizedBox(height: 35),
                const Text(
                  "THAT PUTS YOU AT",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Beginner",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: context.theme.appColors.beginner,
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: PaceLevelSlider(),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      context.theme.appColors.beginner,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        "Continue",
                        style: TextStyle(
                          color: context.theme.appColors.background,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: context.theme.appColors.background,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "I don't know my pace, skip this",
                    style: TextStyle(
                      color: Colors.white70,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white70,
                      decorationStyle: TextDecorationStyle.dotted,
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
