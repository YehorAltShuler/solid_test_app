import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_app/theme_cubit.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Solid Test App',
            theme: context.read<ThemeCubit>().state,
            home: const ColorChangeScreen(title: 'Color Change Screen'),
          );
        },
      ),
    );
  }
}

class ColorChangeScreen extends StatefulWidget {
  const ColorChangeScreen({super.key, required this.title});

  final String title;

  @override
  State<ColorChangeScreen> createState() => _ColorChangeScreenState();
}

class _ColorChangeScreenState extends State<ColorChangeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final theme = Theme.of(context);

    return GestureDetector(
      // Using Cubit to change app's ThemeData
      onTap: () => themeCubit.changeTheme(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello there',
                style: TextStyle(color: theme.scaffoldBackgroundColor.invert()),
              ),
              Text(
                'Background Color now is: ${theme.scaffoldBackgroundColor}',
                style: TextStyle(color: theme.scaffoldBackgroundColor.invert()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Creating extension for Color inversion
extension InvertColorExtension on Color {
  Color invert() {
    return Color.fromRGBO(255 - red, 255 - green, 255 - blue, 1);
  }
}
