import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';
import 'user_details_screen.dart';

class AllUsersScreen extends StatelessWidget {
  final String filter;

  const AllUsersScreen({super.key, required this.filter});

  String _getTitle() {
    switch (filter) {
      case 'active':
        return 'المستخدمين النشطين';
      case 'inactive':
        return 'المستخدمين غير النشطين';
      case 'banned':
        return 'المستخدمين المحظورين';
      case 'free':
        return 'المستخدمين المجانيين';
      default:
        return 'كل المستخدمين';
    }
  }

  List<Map<String, dynamic>> _getFilteredUsers() {
    if (filter == 'all') {
      return MockData.users;
    }
    return MockData.users.where((user) {
      if (filter == 'active') return user['status'] == 'active';
      if (filter == 'inactive') return user['status'] == 'inactive';
      if (filter == 'banned') return user['status'] == 'banned';
      if (filter == 'free') return user['status'] == 'free';
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final users = _getFilteredUsers();

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(title: _getTitle()),
              const SizedBox(height: 16),
              
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return UserItemWidget(
                      ip: user['ip'],
                      mac: user['mac'],
                      duration: user['connectionDuration'],
                      download: user['download'],
                      upload: user['upload'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailsScreen(user: user),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Refresh users
        },
        backgroundColor: AppColors.accentPink,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
