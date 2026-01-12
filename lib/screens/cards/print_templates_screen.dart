import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class PrintTemplatesScreen extends StatefulWidget {
  const PrintTemplatesScreen({super.key});

  @override
  State<PrintTemplatesScreen> createState() => _PrintTemplatesScreenState();
}

class _PrintTemplatesScreenState extends State<PrintTemplatesScreen> {
  final _templateNameController = TextEditingController();
  int _usernameLength = 15;
  int _passwordLength = 12;
  bool _includePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(title: 'إدارة قوالب الطباعة'),
                const SizedBox(height: 20),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Template name row
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _templateNameController,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'أدخل اسم القالب',
                                hintStyle: const TextStyle(color: AppColors.textGrey),
                                filled: true,
                                fillColor: AppColors.cardColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: AppColors.cardColorLight),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildSmallButton('اختيار'),
                          const SizedBox(width: 8),
                          _buildSmallButton('جديد'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'اسم القالب',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Preview area
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.cardColorLight),
                    ),
                    child: Stack(
                      children: [
                        // Username label
                        Positioned(
                          top: 40,
                          left: 40,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accentPink,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'username',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // Password label
                        Positioned(
                          bottom: 60,
                          right: 60,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accentGreen,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'password',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Username length
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildCircleButton(Icons.add, () {
                        setState(() {
                          _usernameLength++;
                        });
                      }),
                      const SizedBox(width: 8),
                      Container(
                        width: 50,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.cardColorLight),
                        ),
                        child: Text(
                          _usernameLength.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildCircleButton(Icons.remove, () {
                        setState(() {
                          if (_usernameLength > 1) _usernameLength--;
                        });
                      }),
                      const SizedBox(width: 16),
                      const Text(
                        'اسم مستخدم',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                
                // Password length
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildCircleButton(Icons.add, () {
                        setState(() {
                          _passwordLength++;
                        });
                      }),
                      const SizedBox(width: 8),
                      Container(
                        width: 50,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.cardColorLight),
                        ),
                        child: Text(
                          _passwordLength.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildCircleButton(Icons.remove, () {
                        setState(() {
                          if (_passwordLength > 1) _passwordLength--;
                        });
                      }),
                      const SizedBox(width: 8),
                      Checkbox(
                        value: _includePassword,
                        onChanged: (value) {
                          setState(() {
                            _includePassword = value!;
                          });
                        },
                        activeColor: AppColors.accentTeal,
                      ),
                      const Text(
                        'كلمة مرور',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Select image button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.cardColorLight),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'اختيار صورة',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Save button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('تم حفظ القالب بنجاح'),
                            backgroundColor: AppColors.accentTeal,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentPink,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'حفظ',
                        style: TextStyle(color: Colors.white),
                      ),
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

  Widget _buildSmallButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.cardColorLight),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  @override
  void dispose() {
    _templateNameController.dispose();
    super.dispose();
  }
}
