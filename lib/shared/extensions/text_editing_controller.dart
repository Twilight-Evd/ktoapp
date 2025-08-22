import 'package:flutter/material.dart';

extension NumberTextController on TextEditingController {
  /// 输入验证
  void validate({double? maxValue, int? decimalPlaces}) {
    String text = this.text;

    if (text.isEmpty) return;

    // 处理以 '.' 开头的情况，自动补 0
    if (text.startsWith('.')) {
      text = '0$text';
    }

    // 只保留数字和一个小数点
    final firstDotIndex = text.indexOf('.');
    text = text.replaceAll(RegExp(r'[^0-9.]'), '');
    if (firstDotIndex >= 0) {
      // 保留第一个小数点
      final parts = text.split('.');
      text = '${parts[0]}.${parts.sublist(1).join('')}';
    }

    // 不能以多个0开头（除 '0.' 情况）
    if (text.startsWith('0') && !text.startsWith('0.') && text.length > 1) {
      text = text.replaceFirst(RegExp(r'^0+'), '');
    }

    // 限制小数点后位数
    if (decimalPlaces != null && text.contains('.')) {
      final parts = text.split('.');
      final intPart = parts[0];
      var decPart = parts[1];
      if (decPart.length > decimalPlaces) {
        decPart = decPart.substring(0, decimalPlaces);
      }
      text = '$intPart.$decPart';
    }

    // 限制最大值
    if (maxValue != null) {
      final numValue = double.tryParse(text);
      if (numValue != null && numValue > maxValue) {
        text = maxValue.toStringAsFixed(decimalPlaces ?? 0);
      }
    }

    this.text = text;
    selection = TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
