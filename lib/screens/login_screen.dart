import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';
import '../data/mock_data.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _hostController = TextEditingController(text: MockData.defaultHost);
  final _portController = TextEditingController(text: MockData.defaultPort);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _networkController = TextEditingController();
  bool _obscurePassword = true;

  void _login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  void _showSavedCredentials() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.backgroundDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'المحفوظات',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...MockData.savedCredentials.map((cred) {
                return ListTile(
                  title: Text(
                    '${cred['host']}:${cred['port']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '${cred['username']} - ${cred['network']}',
                    style: const TextStyle(color: Colors.white54),
                  ),
                  trailing: const Icon(Icons.arrow_back_ios, color: Colors.white54),
                  onTap: () {
                    setState(() {
                      _hostController.text = cred['host']!;
                      _portController.text = cred['port']!;
                      _usernameController.text = cred['username']!;
                      _networkController.text = cred['network']!;
                    });
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'بيانات تسجيل الدخول',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                
                // Host and Port row
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'المنفذ (Port)',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _portController,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.cardColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: AppColors.cardColorLight),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'الآي بي (Host)',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _hostController,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.cardColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: AppColors.cardColorLight),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Username
                CustomTextField(
                  label: 'اسم المستخدم',
                  hint: 'اسم المستخدم الخاص بك',
                  controller: _usernameController,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Password
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'كلمة المرور',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.cardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.cardColorLight),
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.white54,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Network Name
                CustomTextField(
                  label: 'اسم الشبكة',
                  hint: 'أدخل اسم الشبكة هنا',
                  controller: _networkController,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        title: 'حفظ',
                        onTap: () {},
                        backgroundColor: AppColors.accentTeal,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ActionButton(
                        title: 'دخول',
                        onTap: _login,
                        backgroundColor: AppColors.accentPink,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Saved credentials button
                SizedBox(
                  width: double.infinity,
                  child: ActionButton(
                    title: 'اختار من المحفوظات',
                    onTap: _showSavedCredentials,
                    isOutlined: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _networkController.dispose();
    super.dispose();
  }
}
