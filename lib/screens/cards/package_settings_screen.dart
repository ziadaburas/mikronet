import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';
import 'add_package_screen.dart';

class PackageSettingsScreen extends StatefulWidget {
  const PackageSettingsScreen({super.key});

  @override
  State<PackageSettingsScreen> createState() => _PackageSettingsScreenState();
}

class _PackageSettingsScreenState extends State<PackageSettingsScreen> {
  String? _selectedPackage;
  int _timeMinutes = 0;
  int _timeHours = 0;
  int _timeDays = 30;
  bool _isTimeUnlimited = true;

  int _validityMinutes = 0;
  int _validityHours = 0;
  int _validityDays = 60;
  bool _isValidityUnlimited = true;

  int _downloadLimit = 100;
  bool _isDownloadUnlimited = true;

  int _speedLimit = 50;
  bool _isSpeedUnlimited = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(title: 'اعدادات الباقات'),
                const SizedBox(height: 20),
                
                // Package selection header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddPackageScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: AppColors.cardColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.cardColorLight),
                            ),
                            child: const Center(
                              child: Text(
                                'جديد',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.cardColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.cardColorLight),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedPackage,
                              hint: const Text(
                                'اسم الباقة',
                                style: TextStyle(color: AppColors.textGrey),
                              ),
                              isExpanded: true,
                              dropdownColor: AppColors.cardColor,
                              style: const TextStyle(color: Colors.white),
                              items: MockData.packages.map((pkg) {
                                return DropdownMenuItem<String>(
                                  value: pkg['name'],
                                  child: Text(pkg['name']),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedPackage = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColors.cardColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.cardColorLight),
                          ),
                          child: const Center(
                            child: Text(
                              'اختيار',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Time settings
                _buildSettingRow(
                  'الوقت',
                  [
                    _buildTimeField('دقائق', _timeMinutes.toString()),
                    _buildTimeField('ساعات', _timeHours.toString()),
                    _buildTimeField('أيام', _timeDays.toString()),
                  ],
                  _isTimeUnlimited,
                  (value) {
                    setState(() {
                      _isTimeUnlimited = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                
                // Validity settings
                _buildSettingRow(
                  'الصلاحية',
                  [
                    _buildTimeField('دقائق', _validityMinutes.toString()),
                    _buildTimeField('ساعات', _validityHours.toString()),
                    _buildTimeField('أيام', _validityDays.toString()),
                  ],
                  _isValidityUnlimited,
                  (value) {
                    setState(() {
                      _isValidityUnlimited = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                
                // Download limit
                _buildSingleSettingRow(
                  'التحميل',
                  '$_downloadLimit جيجابايت',
                  _isDownloadUnlimited,
                  (value) {
                    setState(() {
                      _isDownloadUnlimited = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                
                // Speed limit
                _buildSingleSettingRow(
                  'السرعة',
                  '$_speedLimit ميجابت/ثانية',
                  _isSpeedUnlimited,
                  (value) {
                    setState(() {
                      _isSpeedUnlimited = value!;
                    });
                  },
                ),
                const SizedBox(height: 32),
                
                // Save button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ActionButton(
                      title: 'حفظ',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('تم حفظ الإعدادات'),
                            backgroundColor: AppColors.accentTeal,
                          ),
                        );
                      },
                      backgroundColor: AppColors.accentPink,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingRow(
    String label,
    List<Widget> fields,
    bool isUnlimited,
    ValueChanged<bool?> onUnlimitedChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Unlimited checkbox
          Row(
            children: [
              Checkbox(
                value: isUnlimited,
                onChanged: onUnlimitedChanged,
                activeColor: AppColors.accentTeal,
              ),
              const Text(
                'مفتوح',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 8),
          // Time fields
          ...fields,
          const SizedBox(width: 16),
          // Label
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeField(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(color: AppColors.textGrey, fontSize: 10),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.cardColorLight),
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleSettingRow(
    String label,
    String value,
    bool isUnlimited,
    ValueChanged<bool?> onUnlimitedChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Unlimited checkbox
          Row(
            children: [
              Checkbox(
                value: isUnlimited,
                onChanged: onUnlimitedChanged,
                activeColor: AppColors.accentTeal,
              ),
              const Text(
                'مفتوح',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 8),
          // Value field
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.cardColorLight),
              ),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Label
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
