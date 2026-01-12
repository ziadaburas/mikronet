import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';
import 'card_sessions_screen.dart';

class CardDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> card;

  const CardDetailsScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'بيانات الكرت'),
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
                    card['number'],
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
              
              // Statistics table
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: StatisticsTable(
                  headers: const ['المتبقي', 'المستخدم', 'إحصائيات'],
                  data: [
                    {
                      'remaining': card['timeRemaining'],
                      'used': card['timeUsed'],
                      'stat': 'الوقت',
                    },
                    {
                      'remaining': card['validityRemaining'],
                      'used': card['validityUsed'],
                      'stat': 'الصلاحية',
                    },
                    {
                      'remaining': card['downloadRemaining'],
                      'used': card['downloadUsed'],
                      'stat': 'التنزيل',
                    },
                    {
                      'remaining': card['uploadRemaining'],
                      'used': card['uploadUsed'],
                      'stat': 'الرفع',
                    },
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // View sessions button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardSessionsScreen(
                            cardNumber: card['number'],
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cardColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'عرض الجلسات',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Active and expired packages
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildPackagesList(
                        'الباقات المنتهية',
                        MockData.expiredPackages,
                        null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildPackagesList(
                        'الباقات الشغالة',
                        MockData.activePackages,
                        AppColors.accentPink,
                      ),
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Bottom action buttons
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBottomButton('رجوع >', AppColors.cardColor, () {
                      Navigator.pop(context);
                    }),
                    const SizedBox(width: 8),
                    _buildBottomButton('[+]', AppColors.cardColor, () {}),
                    const SizedBox(width: 8),
                    _buildBottomButton('اضافة_20', AppColors.accentTeal, () {}),
                    const SizedBox(width: 8),
                    _buildBottomButton('تجديد', AppColors.accentPink, () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPackagesList(String title, List<int> packages, Color? removeColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...packages.map((pkg) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (removeColor != null)
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: removeColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                if (removeColor != null) const SizedBox(width: 8),
                Text(
                  pkg.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildBottomButton(String text, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
