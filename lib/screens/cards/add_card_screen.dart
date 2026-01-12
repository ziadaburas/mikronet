import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _cardNumberController = TextEditingController();
  String? _selectedPackage;
  bool _isPackageExpanded = false;

  final List<String> _packageOptions = ['باقة يومية', 'باقة أسبوعية', 'باقة شهرية'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'إضافة كرت'),
              const SizedBox(height: 40),
              
              // Card number input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.cardColorLight),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'رقم الكرت',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _cardNumberController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'أدخل رقم الكرت هنا',
                          hintStyle: const TextStyle(color: AppColors.textGrey),
                          filled: true,
                          fillColor: AppColors.cardColorLight,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Package selection
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.cardColorLight),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isPackageExpanded = !_isPackageExpanded;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              _isPackageExpanded 
                                  ? Icons.keyboard_arrow_up 
                                  : Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                            const Text(
                              'اختيار الباقة',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_isPackageExpanded) ...[
                        const SizedBox(height: 12),
                        ..._packageOptions.map((package) {
                          final isSelected = _selectedPackage == package;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _selectedPackage = package;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.accentPink
                                    : AppColors.cardColorLight,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (isSelected)
                                    const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  const SizedBox(width: 8),
                                  Text(
                                    package,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ],
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Action buttons
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        title: 'متقدم',
                        onTap: () {},
                        backgroundColor: AppColors.accentTeal,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ActionButton(
                        title: 'إضافة',
                        onTap: () {
                          // Add card logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم إضافة الكرت بنجاح'),
                              backgroundColor: AppColors.accentTeal,
                            ),
                          );
                          Navigator.pop(context);
                        },
                        backgroundColor: AppColors.accentPink,
                      ),
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

  @override
  void dispose() {
    _cardNumberController.dispose();
    super.dispose();
  }
}
