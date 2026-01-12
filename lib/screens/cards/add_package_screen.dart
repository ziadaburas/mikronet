import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class AddPackageScreen extends StatefulWidget {
  const AddPackageScreen({super.key});

  @override
  State<AddPackageScreen> createState() => _AddPackageScreenState();
}

class _AddPackageScreenState extends State<AddPackageScreen> {
  final _nameController = TextEditingController();
  int _price = 0;

  // Time Limit
  int _timeWeeks = 0;
  int _timeDays = 0;
  int _timeHours = 0;
  int _timeMinutes = 0;
  bool _isTimeUnlimited = true;

  // Validity
  int _validityWeeks = 0;
  int _validityDays = 0;
  int _validityHours = 0;
  int _validityMinutes = 0;
  bool _isValidityUnlimited = false;

  // Transfer Limit
  int _transferLimit = 0;
  bool _isTransferUnlimited = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(title: 'إضافة باقة جديدة'),
                const SizedBox(height: 20),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // Package name
                      _buildInputField(
                        'اسم الباقة',
                        'مثال: 1GB-Monthly',
                        _nameController,
                      ),
                      const SizedBox(height: 16),
                      
                      // Price
                      _buildPriceField('السعر', _price),
                      const SizedBox(height: 24),
                      
                      // Time Limit section
                      _buildTimeSection(
                        'وقت الاستخدام (Time Limit)',
                        _isTimeUnlimited,
                        (value) => setState(() => _isTimeUnlimited = value!),
                        ['أسبوع', 'يوم', 'ساعة', 'دقيقة'],
                        [_timeWeeks, _timeDays, _timeHours, _timeMinutes],
                      ),
                      const SizedBox(height: 16),
                      
                      // Validity section
                      _buildTimeSection(
                        'الصلاحية (Validity)',
                        _isValidityUnlimited,
                        (value) => setState(() => _isValidityUnlimited = value!),
                        ['أسبوع', 'يوم', 'ساعة', 'دقيقة'],
                        [_validityWeeks, _validityDays, _validityHours, _validityMinutes],
                      ),
                      const SizedBox(height: 16),
                      
                      // Transfer Limit section
                      _buildTransferSection(
                        'حد التحميل (Transfer Limit)',
                        _isTransferUnlimited,
                        (value) => setState(() => _isTransferUnlimited = value!),
                        _transferLimit,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Action buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.cardColorLight),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'رجوع',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تم إضافة الباقة بنجاح'),
                                backgroundColor: AppColors.accentTeal,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentPink,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'إضافة',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
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

  Widget _buildInputField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textGrey),
            filled: true,
            fillColor: AppColors.cardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.cardColorLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.cardColorLight),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceField(String label, int value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.cardColorLight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.accentPink,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const SizedBox(width: 60),
              ),
              const SizedBox(width: 16),
              Text(
                value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSection(
    String title,
    bool isUnlimited,
    ValueChanged<bool?> onUnlimitedChanged,
    List<String> labels,
    List<int> values,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(labels.length, (index) {
            return Expanded(
              child: Column(
                children: [
                  Text(
                    labels[index],
                    style: const TextStyle(color: AppColors.textGrey, fontSize: 10),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.cardColorLight),
                    ),
                    child: Text(
                      values[index].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildTransferSection(
    String title,
    bool isUnlimited,
    ValueChanged<bool?> onUnlimitedChanged,
    int value,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.accentTeal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'GB',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.cardColorLight),
                ),
                child: Text(
                  value.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
