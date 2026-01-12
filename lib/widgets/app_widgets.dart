import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// Custom App Bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Menu Button Widget
class MenuButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback onTap;
  final Color? backgroundColor;

  const MenuButton({
    super.key,
    required this.title,
    this.icon,
    required this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        color: backgroundColor ?? AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (icon != null) ...[
                  const SizedBox(width: 12),
                  Icon(icon, color: Colors.white, size: 24),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Dashboard Grid Button
class DashboardGridButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DashboardGridButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom Text Field
class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextAlign textAlign;
  final TextDirection? textDirection;

  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.textAlign = TextAlign.right,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          textAlign: textAlign,
          textDirection: textDirection,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textGrey),
            filled: true,
            fillColor: AppColors.cardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.cardColorLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.cardColorLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.accentTeal, width: 2),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}

// Action Button
class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final bool isOutlined;

  const ActionButton({
    super.key,
    required this.title,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return SizedBox(
        width: width,
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: backgroundColor ?? AppColors.cardColorLight, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.accentPink,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Info Card Widget
class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;
  final Color? iconColor;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textDirection: TextDirection.ltr,
          ),
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: 8),
                Icon(icon, color: iconColor ?? AppColors.accentTeal, size: 20),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// Statistics Row Widget
class StatisticsTable extends StatelessWidget {
  final List<Map<String, String>> data;
  final List<String> headers;

  const StatisticsTable({
    super.key,
    required this.data,
    required this.headers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.cardColorLight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              children: headers.map((header) {
                return Expanded(
                  child: Text(
                    header,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Data rows
          ...data.map((row) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.cardColorLight, width: 0.5),
                ),
              ),
              child: Row(
                children: row.values.map((value) {
                  return Expanded(
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// User Stat Card
class UserStatCard extends StatelessWidget {
  final String title;
  final int count;
  final Color countColor;
  final VoidCallback onTap;

  const UserStatCard({
    super.key,
    required this.title,
    required this.count,
    required this.countColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardColorLight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: countColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Card Item Widget for cards list
class CardItemWidget extends StatelessWidget {
  final String cardNumber;
  final String packageValue;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback? onCheckboxChanged;

  const CardItemWidget({
    super.key,
    required this.cardNumber,
    required this.packageValue,
    required this.isSelected,
    required this.onTap,
    this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.cardColorLight),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (_) => onCheckboxChanged?.call(),
              activeColor: AppColors.accentTeal,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.cardColorLight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  cardNumber,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.accentPink,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                packageValue,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// User Item Widget
class UserItemWidget extends StatelessWidget {
  final String ip;
  final String mac;
  final String duration;
  final String download;
  final String upload;
  final VoidCallback onTap;

  const UserItemWidget({
    super.key,
    required this.ip,
    required this.mac,
    required this.duration,
    required this.download,
    required this.upload,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardColorLight),
        ),
        child: Row(
          children: [
            // Download/Upload info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.download, color: AppColors.accentTeal, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      'تحميل: $download',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.upload, color: AppColors.accentPink, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      'رفع: $upload',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            // Duration
            Expanded(
              child: Column(
                children: [
                  const Icon(Icons.access_time, color: Colors.white54, size: 20),
                  const SizedBox(height: 4),
                  Text(
                    duration,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            // IP and MAC
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ip,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  mac,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// DNS Item Widget
class DnsItemWidget extends StatelessWidget {
  final String address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const DnsItemWidget({
    super.key,
    required this.address,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white54),
                onPressed: onDelete,
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white54),
                onPressed: onEdit,
              ),
            ],
          ),
          Text(
            address,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Package Selection Dropdown
class PackageDropdown extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const PackageDropdown({
    super.key,
    required this.label,
    this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardColorLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                alignment: Alignment.centerRight,
                dropdownColor: AppColors.cardColor,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    alignment: Alignment.centerRight,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
