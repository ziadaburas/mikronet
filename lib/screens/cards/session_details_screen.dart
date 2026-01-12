import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class SessionDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> session;

  const SessionDetailsScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'بيانات الجلسة'),
              const SizedBox(height: 16),
              
              // Card number display
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.accentTeal,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    session['cardNumber'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Session details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    InfoCard(
                      title: 'وقت البداية',
                      value: session['startTime'],
                      icon: Icons.access_time,
                      iconColor: AppColors.accentTeal,
                    ),
                    const SizedBox(height: 12),
                    InfoCard(
                      title: 'وقت النهاية',
                      value: session['endTime'],
                      icon: Icons.access_time_filled,
                      iconColor: AppColors.accentTeal,
                    ),
                    const SizedBox(height: 12),
                    InfoCard(
                      title: 'التحميل',
                      value: session['download'],
                      icon: Icons.download,
                      iconColor: AppColors.accentPink,
                    ),
                    const SizedBox(height: 12),
                    InfoCard(
                      title: 'المستخدم',
                      value: session['used'],
                      icon: Icons.data_usage,
                      iconColor: AppColors.accentTeal,
                    ),
                    const SizedBox(height: 12),
                    InfoCard(
                      title: 'الرفع',
                      value: session['upload'],
                      icon: Icons.upload,
                      iconColor: AppColors.accentPink,
                    ),
                    const SizedBox(height: 12),
                    InfoCard(
                      title: 'الآيبي',
                      value: session['ip'],
                      icon: Icons.computer,
                      iconColor: AppColors.accentTeal,
                    ),
                    const SizedBox(height: 12),
                    InfoCard(
                      title: 'ماك',
                      value: session['mac'],
                      icon: Icons.devices,
                      iconColor: AppColors.accentTeal,
                    ),
                    const SizedBox(height: 12),
                    InfoCard(
                      title: 'المدة',
                      value: session['duration'],
                      icon: Icons.timer,
                      iconColor: AppColors.accentTeal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
