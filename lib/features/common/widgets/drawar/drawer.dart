import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ktoapp/app/icons/icon.dart';
import 'package:ktoapp/app/themes/theme.dart';
import '../../../../core/utils/screen_helper.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  static const List<String> svgFiles = [
    'assets/images/banner_wave.svg',
    'assets/images/camera_2fa_invalid.svg',
    'assets/images/camera_2fa.svg',
    'assets/images/casino_footer_18.svg',
    'assets/images/casino_footer_limits.svg',
    'assets/images/casino_footer_responsible.svg',
    'assets/images/check_in_green_circle.svg',
    'assets/images/close_account.svg',
    'assets/images/close_in_red_circle.svg',
    'assets/images/clube-kto.svg',
    'assets/images/decoration_lines.svg',
    'assets/images/ellipse.svg',
    'assets/images/email_2fa.svg',
    'assets/images/email_validation_circle.svg',
    'assets/images/enable_pin.svg',
    'assets/images/ic_arrow_down.svg',
    'assets/images/ic_arrow_up.svg',
    'assets/images/ic_back_arrow.svg',
    'assets/images/ic_backspace.svg',
    'assets/images/ic_bankaccount.svg',
    'assets/images/ic_bell.svg',
    'assets/images/ic_burger.svg',
    'assets/images/ic_calendar.svg',
    'assets/images/ic_cashback_bonus.svg',
    'assets/images/ic_cashback.svg',
    'assets/images/ic_close_account_request.svg',
    'assets/images/ic_close_account.svg',
    'assets/images/ic_close.svg',
    'assets/images/ic_coupon.svg',
    'assets/images/ic_database.svg',
    'assets/images/ic_delete.svg',
    'assets/images/ic_edit.svg',
    'assets/images/ic_email.svg',
    'assets/images/ic_face_id.svg',
    'assets/images/ic_fingerprint.svg',
    'assets/images/ic_flag_br.svg',
    'assets/images/ic_gift.svg',
    'assets/images/ic_info.svg',
    'assets/images/ic_intercom.svg',
    'assets/images/ic_location.svg',
    'assets/images/ic_maitenance_mode.svg',
    'assets/images/ic_menu_atoz.svg',
    'assets/images/ic_menu_casino.svg',
    'assets/images/ic_menu_history.svg',
    'assets/images/ic_menu_home.svg',
    'assets/images/ic_menu_live.svg',
    'assets/images/ic_no_connected.svg',
    'assets/images/ic_passcode.svg',
    'assets/images/ic_password_hide.svg',
    'assets/images/ic_password_show.svg',
    'assets/images/ic_person.svg',
    'assets/images/ic_phone.svg',
    'assets/images/ic_plus.svg',
    'assets/images/ic_promotions.svg',
    'assets/images/ic_ref.svg',
    'assets/images/ic_shield.svg',
    'assets/images/ic_sms.svg',
    'assets/images/ic_tick.svg',
    'assets/images/ic_user.svg',
    'assets/images/ic_verification.svg',
    'assets/images/ic_yellow_check_in_black_circle.svg',
    'assets/images/liveness_wizard_correct.svg',
    'assets/images/liveness_wizard_face_scan.svg',
    'assets/images/liveness_wizard_glare.svg',
    'assets/images/liveness_wizard_glasses.svg',
    'assets/images/liveness_wizard_hat.svg',
    'assets/images/lock_2fa.svg',
    'assets/images/password_requirement_checked.svg',
    'assets/images/password_requirement_unchecked_black.svg',
    'assets/images/password_requirement_unchecked_white.svg',
    'assets/images/phone_validation_circle.svg',
    'assets/images/question_mark_in_red_circle.svg',
    'assets/images/radar_fraud.svg',
    'assets/images/radar_gps.svg',
    'assets/images/radar_location.svg',
    'assets/images/reality_check_clock.svg',
    'assets/images/register_law.svg',
    'assets/images/search.svg',
    'assets/images/self_id_circle.svg',
    'assets/images/sms_validation_circle.svg',
    'assets/images/ic_forword_arrow.svg',
    'assets/images/ic_intercom_w.svg',
    'assets/images/ic_crashgames.svg',
    'assets/images/ic_livecasino.svg',
  ];
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Drawer(
      elevation: 3,
      width: ScreenHelper.getScreenSize(context).width * .8,
      backgroundColor: colorScheme.surface, // Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          // color: Color(0xFF232323),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: MyIcon.icon("logo.svg", width: 100),
              ),
              _drawerItem(
                "ic_menu_home.svg",
                'Esportes',
                onTap: () => context.goNamed("sports"),
                color: colorScheme.onSurface,
                iconColor: colorScheme.onSurface,
              ),
              _drawerItem(
                'ic_menu_live.svg',
                'Ao Vivo',
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  context.goNamed("live");
                },
                color: colorScheme.onSurface,
                iconColor: colorScheme.onSurface,
              ),
              _drawerItem(
                'ic_menu_casino.svg',
                'Cassino',
                color: colorScheme.onSurface,
                iconColor: colorScheme.onSurface,
              ),
              _drawerItem(
                'ic_livecasino.svg',
                'Cassino Ao Vivo',
                color: colorScheme.onSurface,
                iconColor: colorScheme.onSurface,
              ),
              _drawerItem(
                'ic_crashgames.svg',
                'Crash Games',
                color: colorScheme.onSurface,
                iconColor: colorScheme.onSurface,
              ),
              _drawerItem(
                'ic_menu_live.svg',
                'Virtuais',
                color: colorScheme.onSurface,
                iconColor: colorScheme.onSurface,
              ),
              _drawerItem(
                'ic_promotions.svg',
                'Promoções',
                color: colorScheme.onSurface,
                iconColor: colorScheme.onSurface,
              ),
              _drawerItem(
                'ic_cashback.svg',
                'Cashback',
                color: colorScheme.onSurface,
              ),
              _drawerItem(
                'ic_intercom_w.svg',
                'Contate-nos',
                color: colorScheme.onSurface,
                iconColor: colorScheme.onSurface,
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: svgFiles.map((svgPath) {
                        return GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(
                              ClipboardData(text: svgPath),
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.white10,
                            child: SvgPicture.asset(
                              svgPath,
                              fit: BoxFit.contain,
                              placeholderBuilder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Version : v1.0',
                  // style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(
    String svgName,
    String title, {
    VoidCallback? onTap,
    Color? color,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            MyIcon.icon(svgName, width: 30, color: iconColor),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title, style: TextStyle(fontSize: 16, color: color)),
            ),
            MyIcon.icon("ic_forword_arrow.svg", width: 20, color: color),
          ],
        ),
      ),
    );
  }
}
