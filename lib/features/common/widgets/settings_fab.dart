import 'package:flutter/material.dart';
import 'package:ktoapp/app/icons/icon.dart';
import 'package:provider/provider.dart';

import '../../../app/app_state.dart';
import '../../../app/langs/strings.g.dart';

class SettingsFab extends StatefulWidget {
  const SettingsFab({super.key});

  @override
  State<SettingsFab> createState() => _SettingsFabState();
}

class _SettingsFabState extends State<SettingsFab> {
  final LayerLink _link = LayerLink();
  OverlayEntry? _entry;

  bool get _open => _entry != null;

  void _toggle() => _open ? _hide() : _show();

  void _show() {
    final overlay = Overlay.of(context, rootOverlay: true);
    if (overlay == null) return;
    final themedChild = InheritedTheme.captureAll(
      context,
      _MenuPanel(onClose: _hide),
    );

    _entry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _hide,
            ),
          ),
          CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.topRight,
            followerAnchor: Alignment.bottomRight,
            offset: const Offset(0, -12),
            child: themedChild,
          ),
        ],
      ),
    );

    overlay.insert(_entry!);
  }

  void _hide() {
    _entry?.remove();
    _entry = null;
    // if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: FloatingActionButton(
        onPressed: _toggle,
        child: MyIcon.iconSystem("settings.svg"),
      ),
    );
  }
}

class _MenuPanel extends StatelessWidget {
  const _MenuPanel({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();
    final cs = Theme.of(context).colorScheme;

    Widget sectionTitle(String text) => Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: Theme.of(context).textTheme.labelLarge),
    );

    Widget chip({
      required String label,
      required bool active,
      required VoidCallback onTap,
      Widget? icon,
    }) {
      final fg = active ? cs.onPrimary : cs.onSurfaceVariant;
      final bg = active ? cs.primary : cs.surfaceVariant;
      return Material(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          onTap: () {
            onTap();
            onClose();
          },
          borderRadius: BorderRadius.circular(999),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  // Icon(icon, size: 18, color: fg),
                  icon,
                  const SizedBox(width: 6),
                ],
                Text(label, style: TextStyle(color: fg)),
              ],
            ),
          ),
        ),
      );
    }

    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('Theme'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                chip(
                  label: 'System',
                  // icon: Icons.brightness_auto,
                  active: appState.themeMode == ThemeMode.system,
                  onTap: () => appState.setThemeMode(ThemeMode.system),
                ),
                chip(
                  label: 'Light',
                  // icon: Icons.light_mode,
                  active: appState.themeMode == ThemeMode.light,
                  onTap: () => appState.setThemeMode(ThemeMode.light),
                ),
                chip(
                  label: 'Dark',
                  // icon: Icons.dark_mode,
                  active: appState.themeMode == ThemeMode.dark,
                  onTap: () => appState.setThemeMode(ThemeMode.dark),
                ),
              ],
            ),
            const SizedBox(height: 12),
            sectionTitle('Language'),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: AppLocale.values.map((locale) {
                AppLocale activeLocale = LocaleSettings.currentLocale;
                bool active = activeLocale == locale;
                return chip(
                  label: t.locales[locale.languageTag]!,
                  // icon: Icons.language,
                  active: active,
                  onTap: () => appState.setLocale(locale),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
