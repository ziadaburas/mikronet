import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';

class UserDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  void _showActionsMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMenuItem(
                Icons.link_off,
                'قطع الاتصال',
                AppColors.accentPink,
                () {
                  Navigator.pop(context);
                  _showConfirmDialog('قطع الاتصال', 'هل تريد قطع اتصال هذا المستخدم؟');
                },
              ),
              _buildMenuItem(
                Icons.card_giftcard,
                'فتح مجاناً',
                AppColors.accentTeal,
                () {
                  Navigator.pop(context);
                  _showConfirmDialog('فتح مجاناً', 'هل تريد فتح الإنترنت مجاناً لهذا المستخدم؟');
                },
              ),
              _buildMenuItem(
                Icons.block,
                'حظر',
                AppColors.accentPink,
                () {
                  Navigator.pop(context);
                  _showConfirmDialog('حظر', 'هل تريد حظر هذا المستخدم؟');
                },
              ),
              _buildMenuItem(
                Icons.comment,
                'تعليق',
                Colors.white,
                () {
                  Navigator.pop(context);
                  _showCommentDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(IconData icon, String title, Color color, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        textAlign: TextAlign.right,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }

  void _showConfirmDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundDark,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('تم $title بنجاح'),
                    backgroundColor: AppColors.accentTeal,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPink,
              ),
              child: const Text('تأكيد'),
            ),
          ],
        );
      },
    );
  }

  void _showCommentDialog() {
    final controller = TextEditingController(text: widget.user['comment']);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundDark,
          title: const Text(
            'إضافة تعليق',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'أدخل التعليق هنا',
              hintStyle: const TextStyle(color: AppColors.textGrey),
              filled: true,
              fillColor: AppColors.cardColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم حفظ التعليق'),
                    backgroundColor: AppColors.accentTeal,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentTeal,
              ),
              child: const Text('حفظ'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final isActive = user['status'] == 'active';

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Custom app bar with menu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onPressed: _showActionsMenu,
                    ),
                    const Text(
                      'بيانات المستخدم',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Status row
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.cardColorLight),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: isActive ? AppColors.statusActive : AppColors.statusInactive,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                isActive ? 'نشط' : 'غير نشط',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                user['ip'],
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'الآيبي',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'الحالة',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    InfoCard(
                      title: 'عنوان الماك',
                      value: user['mac'],
                      icon: Icons.devices,
                      iconColor: AppColors.accentTeal,
                    ),
                    const SizedBox(height: 12),
                    
                    InfoCard(
                      title: 'مدة الاتصال',
                      value: user['connectionDuration'],
                      icon: Icons.access_time,
                      iconColor: AppColors.accentTeal,
                    ),
                    const SizedBox(height: 12),
                    
                    InfoCard(
                      title: 'التحميل',
                      value: user['download'],
                      icon: Icons.download,
                      iconColor: AppColors.accentPink,
                    ),
                    const SizedBox(height: 12),
                    
                    InfoCard(
                      title: 'الرفع',
                      value: user['upload'],
                      icon: Icons.upload,
                      iconColor: AppColors.accentPink,
                    ),
                    const SizedBox(height: 12),
                    
                    InfoCard(
                      title: 'التعليق',
                      value: user['comment'].isEmpty ? 'لا يوجد' : user['comment'],
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Action buttons
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showConfirmDialog('قطع الاتصال', 'هل تريد قطع اتصال هذا المستخدم؟');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentPink,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'قطع الاتصال',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          _showConfirmDialog('فتح مجاناً', 'هل تريد فتح الإنترنت مجاناً لهذا المستخدم؟');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.cardColorLight),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'فتح مجاناً',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showConfirmDialog('حظر', 'هل تريد حظر هذا المستخدم؟');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentPink,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'حظر',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
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
}
