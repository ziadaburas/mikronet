import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';

class DnsCacheScreen extends StatelessWidget {
  const DnsCacheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'درنش DNS-Cache'),
              const SizedBox(height: 16),
              
              // Table
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.cardColorLight),
                  ),
                  child: Column(
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: AppColors.cardColorLight,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Text(
                                'TTL',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Data',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Type',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Host',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Data rows
                      Expanded(
                        child: ListView.builder(
                          itemCount: MockData.dnsCache.length,
                          itemBuilder: (context, index) {
                            final cache = MockData.dnsCache[index];
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              decoration: BoxDecoration(
                                color: index % 2 == 0 
                                    ? AppColors.cardColor 
                                    : AppColors.cardColorLight.withValues(alpha: 0.3),
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.cardColorLight.withValues(alpha: 0.3),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      cache['ttl'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      cache['data'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      cache['type'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      cache['host'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('جاري تحديث الكاش...'),
              backgroundColor: AppColors.accentTeal,
            ),
          );
        },
        backgroundColor: AppColors.accentTeal,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
