import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';
import 'card_details_screen.dart';

class ViewCardsScreen extends StatefulWidget {
  const ViewCardsScreen({super.key});

  @override
  State<ViewCardsScreen> createState() => _ViewCardsScreenState();
}

class _ViewCardsScreenState extends State<ViewCardsScreen> {
  List<bool> selectedCards = [];
  bool selectAll = false;
  int displayCount = 20;

  @override
  void initState() {
    super.initState();
    selectedCards = List.filled(MockData.cards.length, false);
  }

  void _toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      selectedCards = List.filled(MockData.cards.length, selectAll);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'عرض الكروت'),
              const SizedBox(height: 16),
              
              // Filter bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: selectAll,
                          onChanged: (_) => _toggleSelectAll(),
                          activeColor: AppColors.accentTeal,
                        ),
                        const Text(
                          'Select All',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {},
                    ),
                    _buildFilterButton('فرز'),
                    const SizedBox(width: 8),
                    _buildFilterButton('فلتر'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              
              // Cards list
              Expanded(
                child: ListView.builder(
                  itemCount: MockData.cards.length,
                  itemBuilder: (context, index) {
                    final card = MockData.cards[index];
                    return CardItemWidget(
                      cardNumber: card['number'],
                      packageValue: card['package'],
                      isSelected: selectedCards[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardDetailsScreen(card: card),
                          ),
                        );
                      },
                      onCheckboxChanged: () {
                        setState(() {
                          selectedCards[index] = !selectedCards[index];
                        });
                      },
                    );
                  },
                ),
              ),
              
              // Pagination bar
              Container(
                padding: const EdgeInsets.all(16),
                color: AppColors.cardColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPaginationButton('التالي', AppColors.cardColorLight),
                        const SizedBox(width: 8),
                        _buildPaginationButton('البداية', AppColors.accentTeal),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.accentTeal,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18),
                              Text(
                                'العرض_$displayCount',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPaginationButton('السابق', AppColors.cardColorLight),
                        const SizedBox(width: 8),
                        _buildPaginationButton('النهاية', AppColors.cardColorLight),
                        const SizedBox(width: 8),
                        _buildPaginationButton('انتقال', AppColors.accentPink),
                      ],
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

  Widget _buildFilterButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildPaginationButton(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
