import 'package:flutter/material.dart';
import 'navigation_menu.dart';
import 'package:project1_mobdev_gaven_pearl_917592768/models/page_styles/styles.dart';

class MealOrderPage extends StatefulWidget {
  const MealOrderPage({super.key});

  @override
  _MealOrderPageState createState() => _MealOrderPageState();
}

class _MealOrderPageState extends State<MealOrderPage> {
  String? selectedBreakfast;
  String? selectedLunch;
  String? selectedDinner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Meal'),
        actions: const [
          NavigationMenu(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppStyles.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMealButton(
              context,
              label: 'Order Breakfast',
              icon: Icons.breakfast_dining,
              onPressed: () {
                _selectMeal('Breakfast');
              },
              color: AppStyles.mealButtonColor,
            ),
            const SizedBox(height: AppStyles.buttonSpacing),
            _buildMealButton(
              context,
              label: 'Order Lunch',
              icon: Icons.lunch_dining,
              onPressed: () {
                _selectMeal('Lunch');
              },
              color: AppStyles.mealButtonColor,
            ),
            const SizedBox(height: AppStyles.buttonSpacing),
            _buildMealButton(
              context,
              label: 'Order Dinner',
              icon: Icons.dinner_dining,
              onPressed: () {
                _selectMeal('Dinner');
              },
              color: AppStyles.mealButtonColor,
            ),
            const SizedBox(height: AppStyles.buttonSpacing),
            if (selectedBreakfast != null || selectedLunch != null || selectedDinner != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (selectedBreakfast != null)
                    Text(
                      'Breakfast: $selectedBreakfast',
                      style: AppStyles.mealSelectedTextStyle,
                    ),
                  if (selectedLunch != null)
                    Text(
                      'Lunch: $selectedLunch',
                      style: AppStyles.mealSelectedTextStyle,
                    ),
                  if (selectedDinner != null)
                    Text(
                      'Dinner: $selectedDinner',
                      style: AppStyles.mealSelectedTextStyle,
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _selectMeal(String mealType) {
    setState(() {
      if (mealType == 'Breakfast') {
        selectedBreakfast = 'Pancakes and Eggs';
      } else if (mealType == 'Lunch') {
        selectedLunch = 'Caesar Salad and Grilled Chicken';
      } else if (mealType == 'Dinner') {
        selectedDinner = 'Steak and Potatoes';
      }
    });
  }

  Widget _buildMealButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: AppStyles.iconSize),
      label: Text(
        label,
        style: AppStyles.buttonTextStyle,
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: AppStyles.buttonPadding),
        backgroundColor: color,
        shape: AppStyles.buttonShape,
      ),
      onPressed: onPressed,
    );
  }
}
