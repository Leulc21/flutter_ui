// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
    ).animate(_rotationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D0D0D), Color(0xFF1A0B2E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            _buildBackgroundElements(),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Welcome to the Flutter Demo',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for button
                      },
                      child: Text('Get Started'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundElements() {
    return Stack(
      children: [
        ...List.generate(12, (index) {
          return AnimatedBuilder(
            animation: _rotationController,
            builder: (context, child) {
              final double angle = _rotationAnimation.value + (index * 0.5);
              final double radius = 150 + index * 20.0;
              final double x =
                  MediaQuery.of(context).size.width / 2 + radius * cos(angle);
              final double y =
                  MediaQuery.of(context).size.height / 2 + radius * sin(angle);
              return Positioned(
                top: x,
                right: y,
                child: Container(
                  width: 4 + (index % 3) * 2.0,
                  height: 4 + (index % 3) * 2.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.lerp(
                      Color(0xFF0D0D0D),
                      Color(0xFF1A0B2E),
                      index / 12,
                    )?.withOpacity(0.5),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF1A0B2E).withOpacity(0.5),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  transform: Matrix4.identity()
                    ..translate(100 + index * 20.0, 100 + index * 20.0)
                    ..rotateZ(_rotationAnimation.value + index * (3.14159 / 6)),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}
