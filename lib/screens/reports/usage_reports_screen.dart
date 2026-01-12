import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';

class UsageReportsScreen extends StatelessWidget {
  const UsageReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'تقارير استهلاك الانترنت'),
              const SizedBox(height: 16),
              
              // Summary cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildSummaryCard(
                        'إجمالي التحميل',
                        '450 GB',
                        Icons.download,
                        AppColors.accentTeal,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSummaryCard(
                        'إجمالي الرفع',
                        '90 GB',
                        Icons.upload,
                        AppColors.accentPink,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Usage table
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.cardColorLight),
                  ),
                  child: Column(
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: AppColors.cardColorLight,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'المستخدمين',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'الرفع',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'التحميل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'التاريخ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Data rows
                      Expanded(
                        child: ListView.builder(
                          itemCount: MockData.usageReports.length,
                          itemBuilder: (context, index) {
                            final report = MockData.usageReports[index];
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.cardColorLight.withValues(alpha: 0.3),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${report['users']}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      report['upload'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      report['download'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      report['date'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
