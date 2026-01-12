import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';

class SalesReportsScreen extends StatelessWidget {
  const SalesReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'تقارير المبيعات'),
              const SizedBox(height: 16),
              
              // Summary cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildSummaryCard(
                        'إجمالي المبيعات',
                        '20,500',
                        Icons.attach_money,
                        AppColors.accentTeal,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSummaryCard(
                        'عدد الكروت',
                        '135',
                        Icons.credit_card,
                        AppColors.accentPink,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Sales table
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
                                'الإجمالي',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'العدد',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'الباقة',
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
                          itemCount: MockData.salesReports.length,
                          itemBuilder: (context, index) {
                            final report = MockData.salesReports[index];
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
                                      '${report['total']}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${report['count']}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      report['package'],
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
