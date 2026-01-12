import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';

class DnsScreen extends StatefulWidget {
  const DnsScreen({super.key});

  @override
  State<DnsScreen> createState() => _DnsScreenState();
}

class _DnsScreenState extends State<DnsScreen> {
  List<Map<String, dynamic>> _dnsServers = [];

  @override
  void initState() {
    super.initState();
    _dnsServers = List.from(MockData.dnsServers);
  }

  void _addDns() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundDark,
          title: const Text(
            'إضافة DNS',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '8.8.8.8',
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
                if (controller.text.isNotEmpty) {
                  setState(() {
                    _dnsServers.add({
                      'id': DateTime.now().millisecondsSinceEpoch.toString(),
                      'address': controller.text,
                    });
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم إضافة DNS بنجاح'),
                      backgroundColor: AppColors.accentTeal,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentTeal,
              ),
              child: const Text('إضافة'),
            ),
          ],
        );
      },
    );
  }

  void _editDns(int index) {
    final controller = TextEditingController(text: _dnsServers[index]['address']);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundDark,
          title: const Text(
            'تعديل DNS',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
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
                setState(() {
                  _dnsServers[index]['address'] = controller.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم تعديل DNS بنجاح'),
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

  void _deleteDns(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundDark,
          title: const Text(
            'حذف DNS',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'هل تريد حذف ${_dnsServers[index]['address']}؟',
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
                setState(() {
                  _dnsServers.removeAt(index);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم حذف DNS بنجاح'),
                    backgroundColor: AppColors.accentPink,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPink,
              ),
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'عرض DNS'),
              const SizedBox(height: 16),
              
              Expanded(
                child: ListView.builder(
                  itemCount: _dnsServers.length,
                  itemBuilder: (context, index) {
                    final dns = _dnsServers[index];
                    return DnsItemWidget(
                      address: dns['address'],
                      onEdit: () => _editDns(index),
                      onDelete: () => _deleteDns(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDns,
        backgroundColor: AppColors.accentPink,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
