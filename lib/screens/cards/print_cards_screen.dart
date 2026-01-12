import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';

class PrintCardsScreen extends StatefulWidget {
  const PrintCardsScreen({super.key});

  @override
  State<PrintCardsScreen> createState() => _PrintCardsScreenState();
}

class _PrintCardsScreenState extends State<PrintCardsScreen> {
  String? _selectedPackage;
  int _count = 100;
  final _prefixController = TextEditingController(text: 'CRD-');
  final _suffixController = TextEditingController(text: '-ABC');
  int _rows = 5;
  int _columns = 2;
  String _selectedTemplate = 'القالب الافتراضي';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(title: 'طباعة كروت'),
                const SizedBox(height: 20),
                
                // Form fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // Package selection
                      _buildFormRow(
                        'الباقة',
                        _buildDropdown(
                          'اختر الباقة',
                          _selectedPackage,
                          ['باقة يومية', 'باقة أسبوعية', 'باقة شهرية'],
                          (value) {
                            setState(() {
                              _selectedPackage = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Count
                      _buildFormRow(
                        'العدد',
                        _buildNumberInput(_count.toString(), (change) {
                          setState(() {
                            _count = (_count + change).clamp(1, 1000);
                          });
                        }),
                      ),
                      const SizedBox(height: 16),
                      
                      // Prefix
                      _buildFormRow(
                        'بادئة',
                        _buildTextInput('أدخل البادئة', _prefixController),
                      ),
                      const SizedBox(height: 16),
                      
                      // Suffix
                      _buildFormRow(
                        'لاحقة',
                        _buildTextInput('أدخل اللاحقة', _suffixController),
                      ),
                      const SizedBox(height: 16),
                      
                      // Rows
                      _buildFormRow(
                        'الصفوف',
                        _buildSmallNumberInput(_rows.toString()),
                      ),
                      const SizedBox(height: 16),
                      
                      // Columns
                      _buildFormRow(
                        'الاعمدة',
                        _buildSmallNumberInput(_columns.toString()),
                      ),
                      const SizedBox(height: 16),
                      
                      // Template
                      _buildFormRow(
                        'القالب',
                        _buildDropdown(
                          _selectedTemplate,
                          _selectedTemplate,
                          ['القالب الافتراضي', 'قالب مخصص 1', 'قالب مخصص 2'],
                          (value) {
                            setState(() {
                              _selectedTemplate = value!;
                            });
                          },
                        ),
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
                        child: ActionButton(
                          title: 'طباعة',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('جاري الطباعة...'),
                                backgroundColor: AppColors.accentPink,
                              ),
                            );
                          },
                          backgroundColor: AppColors.accentPink,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ActionButton(
                          title: 'معاينة',
                          onTap: () {
                            _showPreviewDialog();
                          },
                          backgroundColor: AppColors.accentTeal,
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

  Widget _buildFormRow(String label, Widget input) {
    return Row(
      children: [
        Expanded(flex: 2, child: input),
        const SizedBox(width: 16),
        SizedBox(
          width: 80,
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String hint, String? value, List<String> items, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hint, style: const TextStyle(color: AppColors.textGrey)),
          isExpanded: true,
          dropdownColor: AppColors.cardColor,
          style: const TextStyle(color: Colors.white),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildNumberInput(String value, Function(int) onChange) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
            onPressed: () => onChange(10),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            onPressed: () => onChange(-10),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallNumberInput(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildTextInput(String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.textGrey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  void _showPreviewDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundDark,
          title: const Text(
            'معاينة الطباعة',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          content: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'معاينة الكروت هنا',
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _prefixController.dispose();
    _suffixController.dispose();
    super.dispose();
  }
}
