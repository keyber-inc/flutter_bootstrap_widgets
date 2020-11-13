import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_bootstrap_widgets/flutter_bootstrap_widgets.dart';
import 'package:flutter_bootstrap_widgets_example/default_layout.dart';

class IconsPage extends StatefulWidget {
  static const route = '/icons';
  static const title = 'Icons';

  @override
  _IconsPageState createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  String _searchText = '';
  bool _willSearch = true;
  Timer _timer;
  int _inputedTick;
  List<Map<String, dynamic>> _resultIconInfos = [];
  int _searchMaxCount = 100;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_willSearch) {
        if (_inputedTick != null && timer.tick > _inputedTick) {
          _willSearch = true;
        }
      }
      if (_willSearch) {
        _willSearch = false;
        _inputedTick = null;
        setState(() {
          _resultIconInfos = _searchIconInfos(_searchText, _searchMaxCount);
          print(
              'searched: text = $_searchText, count = ${_resultIconInfos.length} / $_searchMaxCount');
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _timer = null;
  }

  void _onChangedSearchText(String text) {
    if (text.length < 2) {
      return;
    }

    _searchText = text;
    _willSearch = false;
    _inputedTick = _timer.tick;
  }

  void _onChangedSearchMaxCount(dynamic max) {
    setState(() {
      _searchMaxCount = int.parse(max);
      _willSearch = true;
    });
  }

  List<Map<String, dynamic>> _searchIconInfos(String text, int max) {
    List<Map<String, dynamic>> results = [];
    for (Map<String, dynamic> info in _iconInfos) {
      final name = info['name'] as String;
      if (name.contains(text)) {
        results.add(info);
      }
      if (results.length >= max) {
        break;
      }
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      route: IconsPage.route,
      children: [
        BootstrapRow(
          height: 0,
          children: [
            BootstrapCol(
              sizes: 'col-12',
              child: BootstrapHeading.h1(
                child: SelectableText(IconsPage.title),
                type: BootstrapHeadingType.pageHeader,
              ),
            ),
          ],
        ),
        BootstrapRow(
          height: 0,
          children: [
            BootstrapCol(
              sizes: 'col-12',
              child: BootstrapPanel(
                header: Row(
                  children: [
                    SelectableText('All available icons'),
                    Spacer(),
                    BootstrapLabelText(
                      bottomPadding: 0,
                      child: Text('Search Count: '),
                    ),
                    BootstrapSelect(
                      isExpanded: false,
                      value: 100,
                      options: [
                        BootstrapOption(name: '50', value: 50),
                        BootstrapOption(name: '100', value: 100),
                        BootstrapOption(name: '200', value: 200),
                        BootstrapOption(name: '500', value: 500),
                      ],
                      onChanged: _onChangedSearchMaxCount,
                    ),
                  ],
                ),
                body: BootstrapContainer(
                  fluid: true,
                  children: [
                    BootstrapRow(
                      height: 0,
                      children: [
                        BootstrapCol(
                          sizes: 'col-xl-4 col-lg-12',
                          child: BootstrapFormGroup(
                            children: [
                              TextFormField(
                                onChanged: _onChangedSearchText,
                                decoration: BootstrapInputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    BootstrapRow(
                      height: 0,
                      children: _buildIconCols(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<BootstrapCol> _buildIconCols() {
    return _resultIconInfos.map((info) {
      return _buildIconCol(info['icon'], info['name']);
    }).toList();
  }

  BootstrapCol _buildIconCol(IconData icon, String name) {
    return BootstrapCol(
      sizes: 'col-xl-3 col-lg-6 col-md-6',
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(icon),
          ),
          SelectableText(name),
        ],
      ),
    );
  }

  final _iconInfos = [
    {'icon': Icons.ac_unit, 'name': 'ac_unit'},
    {'icon': Icons.ac_unit_outlined, 'name': 'ac_unit_outlined'},
    {'icon': Icons.ac_unit_rounded, 'name': 'ac_unit_rounded'},
    {'icon': Icons.ac_unit_sharp, 'name': 'ac_unit_sharp'},
    {'icon': Icons.access_alarm, 'name': 'access_alarm'},
    {'icon': Icons.access_alarm_outlined, 'name': 'access_alarm_outlined'},
    {'icon': Icons.access_alarm_rounded, 'name': 'access_alarm_rounded'},
    {'icon': Icons.access_alarm_sharp, 'name': 'access_alarm_sharp'},
    {'icon': Icons.access_alarms, 'name': 'access_alarms'},
    {'icon': Icons.access_alarms_outlined, 'name': 'access_alarms_outlined'},
    {'icon': Icons.access_alarms_rounded, 'name': 'access_alarms_rounded'},
    {'icon': Icons.access_alarms_sharp, 'name': 'access_alarms_sharp'},
    {'icon': Icons.access_time, 'name': 'access_time'},
    {'icon': Icons.access_time_outlined, 'name': 'access_time_outlined'},
    {'icon': Icons.access_time_rounded, 'name': 'access_time_rounded'},
    {'icon': Icons.access_time_sharp, 'name': 'access_time_sharp'},
    {'icon': Icons.accessibility, 'name': 'accessibility'},
    {'icon': Icons.accessibility_new, 'name': 'accessibility_new'},
    {
      'icon': Icons.accessibility_new_outlined,
      'name': 'accessibility_new_outlined'
    },
    {
      'icon': Icons.accessibility_new_rounded,
      'name': 'accessibility_new_rounded'
    },
    {'icon': Icons.accessibility_new_sharp, 'name': 'accessibility_new_sharp'},
    {'icon': Icons.accessibility_outlined, 'name': 'accessibility_outlined'},
    {'icon': Icons.accessibility_rounded, 'name': 'accessibility_rounded'},
    {'icon': Icons.accessibility_sharp, 'name': 'accessibility_sharp'},
    {'icon': Icons.accessible, 'name': 'accessible'},
    {'icon': Icons.accessible_forward, 'name': 'accessible_forward'},
    {
      'icon': Icons.accessible_forward_outlined,
      'name': 'accessible_forward_outlined'
    },
    {
      'icon': Icons.accessible_forward_rounded,
      'name': 'accessible_forward_rounded'
    },
    {
      'icon': Icons.accessible_forward_sharp,
      'name': 'accessible_forward_sharp'
    },
    {'icon': Icons.accessible_outlined, 'name': 'accessible_outlined'},
    {'icon': Icons.accessible_rounded, 'name': 'accessible_rounded'},
    {'icon': Icons.accessible_sharp, 'name': 'accessible_sharp'},
    {'icon': Icons.account_balance, 'name': 'account_balance'},
    {
      'icon': Icons.account_balance_outlined,
      'name': 'account_balance_outlined'
    },
    {'icon': Icons.account_balance_rounded, 'name': 'account_balance_rounded'},
    {'icon': Icons.account_balance_sharp, 'name': 'account_balance_sharp'},
    {'icon': Icons.account_balance_wallet, 'name': 'account_balance_wallet'},
    {
      'icon': Icons.account_balance_wallet_outlined,
      'name': 'account_balance_wallet_outlined'
    },
    {
      'icon': Icons.account_balance_wallet_rounded,
      'name': 'account_balance_wallet_rounded'
    },
    {
      'icon': Icons.account_balance_wallet_sharp,
      'name': 'account_balance_wallet_sharp'
    },
    {'icon': Icons.account_box, 'name': 'account_box'},
    {'icon': Icons.account_box_outlined, 'name': 'account_box_outlined'},
    {'icon': Icons.account_box_rounded, 'name': 'account_box_rounded'},
    {'icon': Icons.account_box_sharp, 'name': 'account_box_sharp'},
    {'icon': Icons.account_circle, 'name': 'account_circle'},
    {'icon': Icons.account_circle_outlined, 'name': 'account_circle_outlined'},
    {'icon': Icons.account_circle_rounded, 'name': 'account_circle_rounded'},
    {'icon': Icons.account_circle_sharp, 'name': 'account_circle_sharp'},
    {'icon': Icons.account_tree, 'name': 'account_tree'},
    {'icon': Icons.account_tree_outlined, 'name': 'account_tree_outlined'},
    {'icon': Icons.account_tree_rounded, 'name': 'account_tree_rounded'},
    {'icon': Icons.account_tree_sharp, 'name': 'account_tree_sharp'},
    {'icon': Icons.ad_units, 'name': 'ad_units'},
    {'icon': Icons.ad_units_outlined, 'name': 'ad_units_outlined'},
    {'icon': Icons.ad_units_rounded, 'name': 'ad_units_rounded'},
    {'icon': Icons.ad_units_sharp, 'name': 'ad_units_sharp'},
    {'icon': Icons.adb, 'name': 'adb'},
    {'icon': Icons.adb_outlined, 'name': 'adb_outlined'},
    {'icon': Icons.adb_rounded, 'name': 'adb_rounded'},
    {'icon': Icons.adb_sharp, 'name': 'adb_sharp'},
    {'icon': Icons.add, 'name': 'add'},
    {'icon': Icons.add_a_photo, 'name': 'add_a_photo'},
    {'icon': Icons.add_a_photo_outlined, 'name': 'add_a_photo_outlined'},
    {'icon': Icons.add_a_photo_rounded, 'name': 'add_a_photo_rounded'},
    {'icon': Icons.add_a_photo_sharp, 'name': 'add_a_photo_sharp'},
    {'icon': Icons.add_alarm, 'name': 'add_alarm'},
    {'icon': Icons.add_alarm_outlined, 'name': 'add_alarm_outlined'},
    {'icon': Icons.add_alarm_rounded, 'name': 'add_alarm_rounded'},
    {'icon': Icons.add_alarm_sharp, 'name': 'add_alarm_sharp'},
    {'icon': Icons.add_alert, 'name': 'add_alert'},
    {'icon': Icons.add_alert_outlined, 'name': 'add_alert_outlined'},
    {'icon': Icons.add_alert_rounded, 'name': 'add_alert_rounded'},
    {'icon': Icons.add_alert_sharp, 'name': 'add_alert_sharp'},
    {'icon': Icons.add_box, 'name': 'add_box'},
    {'icon': Icons.add_box_outlined, 'name': 'add_box_outlined'},
    {'icon': Icons.add_box_rounded, 'name': 'add_box_rounded'},
    {'icon': Icons.add_box_sharp, 'name': 'add_box_sharp'},
    {'icon': Icons.add_business, 'name': 'add_business'},
    {'icon': Icons.add_business_outlined, 'name': 'add_business_outlined'},
    {'icon': Icons.add_business_rounded, 'name': 'add_business_rounded'},
    {'icon': Icons.add_business_sharp, 'name': 'add_business_sharp'},
    {'icon': Icons.add_call, 'name': 'add_call'},
    {'icon': Icons.add_chart, 'name': 'add_chart'},
    {'icon': Icons.add_circle, 'name': 'add_circle'},
    {'icon': Icons.add_circle_outline, 'name': 'add_circle_outline'},
    {
      'icon': Icons.add_circle_outline_outlined,
      'name': 'add_circle_outline_outlined'
    },
    {
      'icon': Icons.add_circle_outline_rounded,
      'name': 'add_circle_outline_rounded'
    },
    {
      'icon': Icons.add_circle_outline_sharp,
      'name': 'add_circle_outline_sharp'
    },
    {'icon': Icons.add_circle_outlined, 'name': 'add_circle_outlined'},
    {'icon': Icons.add_circle_rounded, 'name': 'add_circle_rounded'},
    {'icon': Icons.add_circle_sharp, 'name': 'add_circle_sharp'},
    {'icon': Icons.add_comment, 'name': 'add_comment'},
    {'icon': Icons.add_comment_outlined, 'name': 'add_comment_outlined'},
    {'icon': Icons.add_comment_rounded, 'name': 'add_comment_rounded'},
    {'icon': Icons.add_comment_sharp, 'name': 'add_comment_sharp'},
    {'icon': Icons.add_ic_call, 'name': 'add_ic_call'},
    {'icon': Icons.add_ic_call_outlined, 'name': 'add_ic_call_outlined'},
    {'icon': Icons.add_ic_call_rounded, 'name': 'add_ic_call_rounded'},
    {'icon': Icons.add_ic_call_sharp, 'name': 'add_ic_call_sharp'},
    {'icon': Icons.add_link, 'name': 'add_link'},
    {'icon': Icons.add_location, 'name': 'add_location'},
    {'icon': Icons.add_location_alt, 'name': 'add_location_alt'},
    {
      'icon': Icons.add_location_alt_outlined,
      'name': 'add_location_alt_outlined'
    },
    {
      'icon': Icons.add_location_alt_rounded,
      'name': 'add_location_alt_rounded'
    },
    {'icon': Icons.add_location_alt_sharp, 'name': 'add_location_alt_sharp'},
    {'icon': Icons.add_location_outlined, 'name': 'add_location_outlined'},
    {'icon': Icons.add_location_rounded, 'name': 'add_location_rounded'},
    {'icon': Icons.add_location_sharp, 'name': 'add_location_sharp'},
    {'icon': Icons.add_moderator, 'name': 'add_moderator'},
    {'icon': Icons.add_outlined, 'name': 'add_outlined'},
    {'icon': Icons.add_photo_alternate, 'name': 'add_photo_alternate'},
    {
      'icon': Icons.add_photo_alternate_outlined,
      'name': 'add_photo_alternate_outlined'
    },
    {
      'icon': Icons.add_photo_alternate_rounded,
      'name': 'add_photo_alternate_rounded'
    },
    {
      'icon': Icons.add_photo_alternate_sharp,
      'name': 'add_photo_alternate_sharp'
    },
    {'icon': Icons.add_road, 'name': 'add_road'},
    {'icon': Icons.add_road_outlined, 'name': 'add_road_outlined'},
    {'icon': Icons.add_road_rounded, 'name': 'add_road_rounded'},
    {'icon': Icons.add_road_sharp, 'name': 'add_road_sharp'},
    {'icon': Icons.add_rounded, 'name': 'add_rounded'},
    {'icon': Icons.add_sharp, 'name': 'add_sharp'},
    {'icon': Icons.add_shopping_cart, 'name': 'add_shopping_cart'},
    {
      'icon': Icons.add_shopping_cart_outlined,
      'name': 'add_shopping_cart_outlined'
    },
    {
      'icon': Icons.add_shopping_cart_rounded,
      'name': 'add_shopping_cart_rounded'
    },
    {'icon': Icons.add_shopping_cart_sharp, 'name': 'add_shopping_cart_sharp'},
    {'icon': Icons.add_to_drive, 'name': 'add_to_drive'},
    {'icon': Icons.add_to_home_screen, 'name': 'add_to_home_screen'},
    {
      'icon': Icons.add_to_home_screen_outlined,
      'name': 'add_to_home_screen_outlined'
    },
    {
      'icon': Icons.add_to_home_screen_rounded,
      'name': 'add_to_home_screen_rounded'
    },
    {
      'icon': Icons.add_to_home_screen_sharp,
      'name': 'add_to_home_screen_sharp'
    },
    {'icon': Icons.add_to_photos, 'name': 'add_to_photos'},
    {'icon': Icons.add_to_photos_outlined, 'name': 'add_to_photos_outlined'},
    {'icon': Icons.add_to_photos_rounded, 'name': 'add_to_photos_rounded'},
    {'icon': Icons.add_to_photos_sharp, 'name': 'add_to_photos_sharp'},
    {'icon': Icons.add_to_queue, 'name': 'add_to_queue'},
    {'icon': Icons.add_to_queue_outlined, 'name': 'add_to_queue_outlined'},
    {'icon': Icons.add_to_queue_rounded, 'name': 'add_to_queue_rounded'},
    {'icon': Icons.add_to_queue_sharp, 'name': 'add_to_queue_sharp'},
    {'icon': Icons.addchart, 'name': 'addchart'},
    {'icon': Icons.addchart_outlined, 'name': 'addchart_outlined'},
    {'icon': Icons.addchart_rounded, 'name': 'addchart_rounded'},
    {'icon': Icons.addchart_sharp, 'name': 'addchart_sharp'},
    {'icon': Icons.adjust, 'name': 'adjust'},
    {'icon': Icons.adjust_outlined, 'name': 'adjust_outlined'},
    {'icon': Icons.adjust_rounded, 'name': 'adjust_rounded'},
    {'icon': Icons.adjust_sharp, 'name': 'adjust_sharp'},
    {'icon': Icons.admin_panel_settings, 'name': 'admin_panel_settings'},
    {
      'icon': Icons.admin_panel_settings_outlined,
      'name': 'admin_panel_settings_outlined'
    },
    {
      'icon': Icons.admin_panel_settings_rounded,
      'name': 'admin_panel_settings_rounded'
    },
    {
      'icon': Icons.admin_panel_settings_sharp,
      'name': 'admin_panel_settings_sharp'
    },
    {'icon': Icons.agriculture, 'name': 'agriculture'},
    {'icon': Icons.agriculture_outlined, 'name': 'agriculture_outlined'},
    {'icon': Icons.agriculture_rounded, 'name': 'agriculture_rounded'},
    {'icon': Icons.agriculture_sharp, 'name': 'agriculture_sharp'},
    {'icon': Icons.airline_seat_flat, 'name': 'airline_seat_flat'},
    {
      'icon': Icons.airline_seat_flat_angled,
      'name': 'airline_seat_flat_angled'
    },
    {
      'icon': Icons.airline_seat_flat_angled_outlined,
      'name': 'airline_seat_flat_angled_outlined'
    },
    {
      'icon': Icons.airline_seat_flat_angled_rounded,
      'name': 'airline_seat_flat_angled_rounded'
    },
    {
      'icon': Icons.airline_seat_flat_angled_sharp,
      'name': 'airline_seat_flat_angled_sharp'
    },
    {
      'icon': Icons.airline_seat_flat_outlined,
      'name': 'airline_seat_flat_outlined'
    },
    {
      'icon': Icons.airline_seat_flat_rounded,
      'name': 'airline_seat_flat_rounded'
    },
    {'icon': Icons.airline_seat_flat_sharp, 'name': 'airline_seat_flat_sharp'},
    {
      'icon': Icons.airline_seat_individual_suite,
      'name': 'airline_seat_individual_suite'
    },
    {
      'icon': Icons.airline_seat_individual_suite_outlined,
      'name': 'airline_seat_individual_suite_outlined'
    },
    {
      'icon': Icons.airline_seat_individual_suite_rounded,
      'name': 'airline_seat_individual_suite_rounded'
    },
    {
      'icon': Icons.airline_seat_individual_suite_sharp,
      'name': 'airline_seat_individual_suite_sharp'
    },
    {
      'icon': Icons.airline_seat_legroom_extra,
      'name': 'airline_seat_legroom_extra'
    },
    {
      'icon': Icons.airline_seat_legroom_extra_outlined,
      'name': 'airline_seat_legroom_extra_outlined'
    },
    {
      'icon': Icons.airline_seat_legroom_extra_rounded,
      'name': 'airline_seat_legroom_extra_rounded'
    },
    {
      'icon': Icons.airline_seat_legroom_extra_sharp,
      'name': 'airline_seat_legroom_extra_sharp'
    },
    {
      'icon': Icons.airline_seat_legroom_normal,
      'name': 'airline_seat_legroom_normal'
    },
    {
      'icon': Icons.airline_seat_legroom_normal_outlined,
      'name': 'airline_seat_legroom_normal_outlined'
    },
    {
      'icon': Icons.airline_seat_legroom_normal_rounded,
      'name': 'airline_seat_legroom_normal_rounded'
    },
    {
      'icon': Icons.airline_seat_legroom_normal_sharp,
      'name': 'airline_seat_legroom_normal_sharp'
    },
    {
      'icon': Icons.airline_seat_legroom_reduced,
      'name': 'airline_seat_legroom_reduced'
    },
    {
      'icon': Icons.airline_seat_legroom_reduced_outlined,
      'name': 'airline_seat_legroom_reduced_outlined'
    },
    {
      'icon': Icons.airline_seat_legroom_reduced_rounded,
      'name': 'airline_seat_legroom_reduced_rounded'
    },
    {
      'icon': Icons.airline_seat_legroom_reduced_sharp,
      'name': 'airline_seat_legroom_reduced_sharp'
    },
    {
      'icon': Icons.airline_seat_recline_extra,
      'name': 'airline_seat_recline_extra'
    },
    {
      'icon': Icons.airline_seat_recline_extra_outlined,
      'name': 'airline_seat_recline_extra_outlined'
    },
    {
      'icon': Icons.airline_seat_recline_extra_rounded,
      'name': 'airline_seat_recline_extra_rounded'
    },
    {
      'icon': Icons.airline_seat_recline_extra_sharp,
      'name': 'airline_seat_recline_extra_sharp'
    },
    {
      'icon': Icons.airline_seat_recline_normal,
      'name': 'airline_seat_recline_normal'
    },
    {
      'icon': Icons.airline_seat_recline_normal_outlined,
      'name': 'airline_seat_recline_normal_outlined'
    },
    {
      'icon': Icons.airline_seat_recline_normal_rounded,
      'name': 'airline_seat_recline_normal_rounded'
    },
    {
      'icon': Icons.airline_seat_recline_normal_sharp,
      'name': 'airline_seat_recline_normal_sharp'
    },
    {'icon': Icons.airplanemode_active, 'name': 'airplanemode_active'},
    {
      'icon': Icons.airplanemode_active_outlined,
      'name': 'airplanemode_active_outlined'
    },
    {
      'icon': Icons.airplanemode_active_rounded,
      'name': 'airplanemode_active_rounded'
    },
    {
      'icon': Icons.airplanemode_active_sharp,
      'name': 'airplanemode_active_sharp'
    },
    {'icon': Icons.airplanemode_inactive, 'name': 'airplanemode_inactive'},
    {
      'icon': Icons.airplanemode_inactive_outlined,
      'name': 'airplanemode_inactive_outlined'
    },
    {
      'icon': Icons.airplanemode_inactive_rounded,
      'name': 'airplanemode_inactive_rounded'
    },
    {
      'icon': Icons.airplanemode_inactive_sharp,
      'name': 'airplanemode_inactive_sharp'
    },
    {'icon': Icons.airplanemode_off, 'name': 'airplanemode_off'},
    {
      'icon': Icons.airplanemode_off_outlined,
      'name': 'airplanemode_off_outlined'
    },
    {
      'icon': Icons.airplanemode_off_rounded,
      'name': 'airplanemode_off_rounded'
    },
    {'icon': Icons.airplanemode_off_sharp, 'name': 'airplanemode_off_sharp'},
    {'icon': Icons.airplanemode_on, 'name': 'airplanemode_on'},
    {
      'icon': Icons.airplanemode_on_outlined,
      'name': 'airplanemode_on_outlined'
    },
    {'icon': Icons.airplanemode_on_rounded, 'name': 'airplanemode_on_rounded'},
    {'icon': Icons.airplanemode_on_sharp, 'name': 'airplanemode_on_sharp'},
    {'icon': Icons.airplay, 'name': 'airplay'},
    {'icon': Icons.airplay_outlined, 'name': 'airplay_outlined'},
    {'icon': Icons.airplay_rounded, 'name': 'airplay_rounded'},
    {'icon': Icons.airplay_sharp, 'name': 'airplay_sharp'},
    {'icon': Icons.airport_shuttle, 'name': 'airport_shuttle'},
    {
      'icon': Icons.airport_shuttle_outlined,
      'name': 'airport_shuttle_outlined'
    },
    {'icon': Icons.airport_shuttle_rounded, 'name': 'airport_shuttle_rounded'},
    {'icon': Icons.airport_shuttle_sharp, 'name': 'airport_shuttle_sharp'},
    {'icon': Icons.alarm, 'name': 'alarm'},
    {'icon': Icons.alarm_add, 'name': 'alarm_add'},
    {'icon': Icons.alarm_add_outlined, 'name': 'alarm_add_outlined'},
    {'icon': Icons.alarm_add_rounded, 'name': 'alarm_add_rounded'},
    {'icon': Icons.alarm_add_sharp, 'name': 'alarm_add_sharp'},
    {'icon': Icons.alarm_off, 'name': 'alarm_off'},
    {'icon': Icons.alarm_off_outlined, 'name': 'alarm_off_outlined'},
    {'icon': Icons.alarm_off_rounded, 'name': 'alarm_off_rounded'},
    {'icon': Icons.alarm_off_sharp, 'name': 'alarm_off_sharp'},
    {'icon': Icons.alarm_on, 'name': 'alarm_on'},
    {'icon': Icons.alarm_on_outlined, 'name': 'alarm_on_outlined'},
    {'icon': Icons.alarm_on_rounded, 'name': 'alarm_on_rounded'},
    {'icon': Icons.alarm_on_sharp, 'name': 'alarm_on_sharp'},
    {'icon': Icons.alarm_outlined, 'name': 'alarm_outlined'},
    {'icon': Icons.alarm_rounded, 'name': 'alarm_rounded'},
    {'icon': Icons.alarm_sharp, 'name': 'alarm_sharp'},
    {'icon': Icons.album, 'name': 'album'},
    {'icon': Icons.album_outlined, 'name': 'album_outlined'},
    {'icon': Icons.album_rounded, 'name': 'album_rounded'},
    {'icon': Icons.album_sharp, 'name': 'album_sharp'},
    {'icon': Icons.all_inbox, 'name': 'all_inbox'},
    {'icon': Icons.all_inbox_outlined, 'name': 'all_inbox_outlined'},
    {'icon': Icons.all_inbox_rounded, 'name': 'all_inbox_rounded'},
    {'icon': Icons.all_inbox_sharp, 'name': 'all_inbox_sharp'},
    {'icon': Icons.all_inclusive, 'name': 'all_inclusive'},
    {'icon': Icons.all_inclusive_outlined, 'name': 'all_inclusive_outlined'},
    {'icon': Icons.all_inclusive_rounded, 'name': 'all_inclusive_rounded'},
    {'icon': Icons.all_inclusive_sharp, 'name': 'all_inclusive_sharp'},
    {'icon': Icons.all_out, 'name': 'all_out'},
    {'icon': Icons.all_out_outlined, 'name': 'all_out_outlined'},
    {'icon': Icons.all_out_rounded, 'name': 'all_out_rounded'},
    {'icon': Icons.all_out_sharp, 'name': 'all_out_sharp'},
    {'icon': Icons.alt_route, 'name': 'alt_route'},
    {'icon': Icons.alt_route_outlined, 'name': 'alt_route_outlined'},
    {'icon': Icons.alt_route_rounded, 'name': 'alt_route_rounded'},
    {'icon': Icons.alt_route_sharp, 'name': 'alt_route_sharp'},
    {'icon': Icons.alternate_email, 'name': 'alternate_email'},
    {
      'icon': Icons.alternate_email_outlined,
      'name': 'alternate_email_outlined'
    },
    {'icon': Icons.alternate_email_rounded, 'name': 'alternate_email_rounded'},
    {'icon': Icons.alternate_email_sharp, 'name': 'alternate_email_sharp'},
    {'icon': Icons.amp_stories, 'name': 'amp_stories'},
    {'icon': Icons.amp_stories_outlined, 'name': 'amp_stories_outlined'},
    {'icon': Icons.amp_stories_rounded, 'name': 'amp_stories_rounded'},
    {'icon': Icons.amp_stories_sharp, 'name': 'amp_stories_sharp'},
    {'icon': Icons.analytics, 'name': 'analytics'},
    {'icon': Icons.analytics_outlined, 'name': 'analytics_outlined'},
    {'icon': Icons.analytics_rounded, 'name': 'analytics_rounded'},
    {'icon': Icons.analytics_sharp, 'name': 'analytics_sharp'},
    {'icon': Icons.anchor, 'name': 'anchor'},
    {'icon': Icons.anchor_outlined, 'name': 'anchor_outlined'},
    {'icon': Icons.anchor_rounded, 'name': 'anchor_rounded'},
    {'icon': Icons.anchor_sharp, 'name': 'anchor_sharp'},
    {'icon': Icons.android, 'name': 'android'},
    {'icon': Icons.android_outlined, 'name': 'android_outlined'},
    {'icon': Icons.android_rounded, 'name': 'android_rounded'},
    {'icon': Icons.android_sharp, 'name': 'android_sharp'},
    {'icon': Icons.animation, 'name': 'animation'},
    {'icon': Icons.announcement, 'name': 'announcement'},
    {'icon': Icons.announcement_outlined, 'name': 'announcement_outlined'},
    {'icon': Icons.announcement_rounded, 'name': 'announcement_rounded'},
    {'icon': Icons.announcement_sharp, 'name': 'announcement_sharp'},
    {'icon': Icons.apartment, 'name': 'apartment'},
    {'icon': Icons.apartment_outlined, 'name': 'apartment_outlined'},
    {'icon': Icons.apartment_rounded, 'name': 'apartment_rounded'},
    {'icon': Icons.apartment_sharp, 'name': 'apartment_sharp'},
    {'icon': Icons.api, 'name': 'api'},
    {'icon': Icons.api_outlined, 'name': 'api_outlined'},
    {'icon': Icons.api_rounded, 'name': 'api_rounded'},
    {'icon': Icons.api_sharp, 'name': 'api_sharp'},
    {'icon': Icons.app_blocking, 'name': 'app_blocking'},
    {'icon': Icons.app_blocking_outlined, 'name': 'app_blocking_outlined'},
    {'icon': Icons.app_blocking_rounded, 'name': 'app_blocking_rounded'},
    {'icon': Icons.app_blocking_sharp, 'name': 'app_blocking_sharp'},
    {'icon': Icons.app_registration, 'name': 'app_registration'},
    {'icon': Icons.app_settings_alt, 'name': 'app_settings_alt'},
    {
      'icon': Icons.app_settings_alt_outlined,
      'name': 'app_settings_alt_outlined'
    },
    {
      'icon': Icons.app_settings_alt_rounded,
      'name': 'app_settings_alt_rounded'
    },
    {'icon': Icons.app_settings_alt_sharp, 'name': 'app_settings_alt_sharp'},
    {'icon': Icons.approval, 'name': 'approval'},
    {'icon': Icons.apps, 'name': 'apps'},
    {'icon': Icons.apps_outlined, 'name': 'apps_outlined'},
    {'icon': Icons.apps_rounded, 'name': 'apps_rounded'},
    {'icon': Icons.apps_sharp, 'name': 'apps_sharp'},
    {'icon': Icons.architecture, 'name': 'architecture'},
    {'icon': Icons.architecture_outlined, 'name': 'architecture_outlined'},
    {'icon': Icons.architecture_rounded, 'name': 'architecture_rounded'},
    {'icon': Icons.architecture_sharp, 'name': 'architecture_sharp'},
    {'icon': Icons.archive, 'name': 'archive'},
    {'icon': Icons.archive_outlined, 'name': 'archive_outlined'},
    {'icon': Icons.archive_rounded, 'name': 'archive_rounded'},
    {'icon': Icons.archive_sharp, 'name': 'archive_sharp'},
    {'icon': Icons.arrow_back, 'name': 'arrow_back'},
    {'icon': Icons.arrow_back_ios, 'name': 'arrow_back_ios'},
    {'icon': Icons.arrow_back_ios_outlined, 'name': 'arrow_back_ios_outlined'},
    {'icon': Icons.arrow_back_ios_rounded, 'name': 'arrow_back_ios_rounded'},
    {'icon': Icons.arrow_back_ios_sharp, 'name': 'arrow_back_ios_sharp'},
    {'icon': Icons.arrow_back_outlined, 'name': 'arrow_back_outlined'},
    {'icon': Icons.arrow_back_rounded, 'name': 'arrow_back_rounded'},
    {'icon': Icons.arrow_back_sharp, 'name': 'arrow_back_sharp'},
    {'icon': Icons.arrow_circle_down, 'name': 'arrow_circle_down'},
    {
      'icon': Icons.arrow_circle_down_outlined,
      'name': 'arrow_circle_down_outlined'
    },
    {
      'icon': Icons.arrow_circle_down_rounded,
      'name': 'arrow_circle_down_rounded'
    },
    {'icon': Icons.arrow_circle_down_sharp, 'name': 'arrow_circle_down_sharp'},
    {'icon': Icons.arrow_circle_up, 'name': 'arrow_circle_up'},
    {
      'icon': Icons.arrow_circle_up_outlined,
      'name': 'arrow_circle_up_outlined'
    },
    {'icon': Icons.arrow_circle_up_rounded, 'name': 'arrow_circle_up_rounded'},
    {'icon': Icons.arrow_circle_up_sharp, 'name': 'arrow_circle_up_sharp'},
    {'icon': Icons.arrow_downward, 'name': 'arrow_downward'},
    {'icon': Icons.arrow_downward_outlined, 'name': 'arrow_downward_outlined'},
    {'icon': Icons.arrow_downward_rounded, 'name': 'arrow_downward_rounded'},
    {'icon': Icons.arrow_downward_sharp, 'name': 'arrow_downward_sharp'},
    {'icon': Icons.arrow_drop_down, 'name': 'arrow_drop_down'},
    {'icon': Icons.arrow_drop_down_circle, 'name': 'arrow_drop_down_circle'},
    {
      'icon': Icons.arrow_drop_down_circle_outlined,
      'name': 'arrow_drop_down_circle_outlined'
    },
    {
      'icon': Icons.arrow_drop_down_circle_rounded,
      'name': 'arrow_drop_down_circle_rounded'
    },
    {
      'icon': Icons.arrow_drop_down_circle_sharp,
      'name': 'arrow_drop_down_circle_sharp'
    },
    {
      'icon': Icons.arrow_drop_down_outlined,
      'name': 'arrow_drop_down_outlined'
    },
    {'icon': Icons.arrow_drop_down_rounded, 'name': 'arrow_drop_down_rounded'},
    {'icon': Icons.arrow_drop_down_sharp, 'name': 'arrow_drop_down_sharp'},
    {'icon': Icons.arrow_drop_up, 'name': 'arrow_drop_up'},
    {'icon': Icons.arrow_drop_up_outlined, 'name': 'arrow_drop_up_outlined'},
    {'icon': Icons.arrow_drop_up_rounded, 'name': 'arrow_drop_up_rounded'},
    {'icon': Icons.arrow_drop_up_sharp, 'name': 'arrow_drop_up_sharp'},
    {'icon': Icons.arrow_forward, 'name': 'arrow_forward'},
    {'icon': Icons.arrow_forward_ios, 'name': 'arrow_forward_ios'},
    {
      'icon': Icons.arrow_forward_ios_outlined,
      'name': 'arrow_forward_ios_outlined'
    },
    {
      'icon': Icons.arrow_forward_ios_rounded,
      'name': 'arrow_forward_ios_rounded'
    },
    {'icon': Icons.arrow_forward_ios_sharp, 'name': 'arrow_forward_ios_sharp'},
    {'icon': Icons.arrow_forward_outlined, 'name': 'arrow_forward_outlined'},
    {'icon': Icons.arrow_forward_rounded, 'name': 'arrow_forward_rounded'},
    {'icon': Icons.arrow_forward_sharp, 'name': 'arrow_forward_sharp'},
    {'icon': Icons.arrow_left, 'name': 'arrow_left'},
    {'icon': Icons.arrow_left_outlined, 'name': 'arrow_left_outlined'},
    {'icon': Icons.arrow_left_rounded, 'name': 'arrow_left_rounded'},
    {'icon': Icons.arrow_left_sharp, 'name': 'arrow_left_sharp'},
    {'icon': Icons.arrow_right, 'name': 'arrow_right'},
    {'icon': Icons.arrow_right_alt, 'name': 'arrow_right_alt'},
    {
      'icon': Icons.arrow_right_alt_outlined,
      'name': 'arrow_right_alt_outlined'
    },
    {'icon': Icons.arrow_right_alt_rounded, 'name': 'arrow_right_alt_rounded'},
    {'icon': Icons.arrow_right_alt_sharp, 'name': 'arrow_right_alt_sharp'},
    {'icon': Icons.arrow_right_outlined, 'name': 'arrow_right_outlined'},
    {'icon': Icons.arrow_right_rounded, 'name': 'arrow_right_rounded'},
    {'icon': Icons.arrow_right_sharp, 'name': 'arrow_right_sharp'},
    {'icon': Icons.arrow_upward, 'name': 'arrow_upward'},
    {'icon': Icons.arrow_upward_outlined, 'name': 'arrow_upward_outlined'},
    {'icon': Icons.arrow_upward_rounded, 'name': 'arrow_upward_rounded'},
    {'icon': Icons.arrow_upward_sharp, 'name': 'arrow_upward_sharp'},
    {'icon': Icons.art_track, 'name': 'art_track'},
    {'icon': Icons.art_track_outlined, 'name': 'art_track_outlined'},
    {'icon': Icons.art_track_rounded, 'name': 'art_track_rounded'},
    {'icon': Icons.art_track_sharp, 'name': 'art_track_sharp'},
    {'icon': Icons.article, 'name': 'article'},
    {'icon': Icons.article_outlined, 'name': 'article_outlined'},
    {'icon': Icons.article_rounded, 'name': 'article_rounded'},
    {'icon': Icons.article_sharp, 'name': 'article_sharp'},
    {'icon': Icons.aspect_ratio, 'name': 'aspect_ratio'},
    {'icon': Icons.aspect_ratio_outlined, 'name': 'aspect_ratio_outlined'},
    {'icon': Icons.aspect_ratio_rounded, 'name': 'aspect_ratio_rounded'},
    {'icon': Icons.aspect_ratio_sharp, 'name': 'aspect_ratio_sharp'},
    {'icon': Icons.assessment, 'name': 'assessment'},
    {'icon': Icons.assessment_outlined, 'name': 'assessment_outlined'},
    {'icon': Icons.assessment_rounded, 'name': 'assessment_rounded'},
    {'icon': Icons.assessment_sharp, 'name': 'assessment_sharp'},
    {'icon': Icons.assignment, 'name': 'assignment'},
    {'icon': Icons.assignment_ind, 'name': 'assignment_ind'},
    {'icon': Icons.assignment_ind_outlined, 'name': 'assignment_ind_outlined'},
    {'icon': Icons.assignment_ind_rounded, 'name': 'assignment_ind_rounded'},
    {'icon': Icons.assignment_ind_sharp, 'name': 'assignment_ind_sharp'},
    {'icon': Icons.assignment_late, 'name': 'assignment_late'},
    {
      'icon': Icons.assignment_late_outlined,
      'name': 'assignment_late_outlined'
    },
    {'icon': Icons.assignment_late_rounded, 'name': 'assignment_late_rounded'},
    {'icon': Icons.assignment_late_sharp, 'name': 'assignment_late_sharp'},
    {'icon': Icons.assignment_outlined, 'name': 'assignment_outlined'},
    {'icon': Icons.assignment_return, 'name': 'assignment_return'},
    {
      'icon': Icons.assignment_return_outlined,
      'name': 'assignment_return_outlined'
    },
    {
      'icon': Icons.assignment_return_rounded,
      'name': 'assignment_return_rounded'
    },
    {'icon': Icons.assignment_return_sharp, 'name': 'assignment_return_sharp'},
    {'icon': Icons.assignment_returned, 'name': 'assignment_returned'},
    {
      'icon': Icons.assignment_returned_outlined,
      'name': 'assignment_returned_outlined'
    },
    {
      'icon': Icons.assignment_returned_rounded,
      'name': 'assignment_returned_rounded'
    },
    {
      'icon': Icons.assignment_returned_sharp,
      'name': 'assignment_returned_sharp'
    },
    {'icon': Icons.assignment_rounded, 'name': 'assignment_rounded'},
    {'icon': Icons.assignment_sharp, 'name': 'assignment_sharp'},
    {'icon': Icons.assignment_turned_in, 'name': 'assignment_turned_in'},
    {
      'icon': Icons.assignment_turned_in_outlined,
      'name': 'assignment_turned_in_outlined'
    },
    {
      'icon': Icons.assignment_turned_in_rounded,
      'name': 'assignment_turned_in_rounded'
    },
    {
      'icon': Icons.assignment_turned_in_sharp,
      'name': 'assignment_turned_in_sharp'
    },
    {'icon': Icons.assistant, 'name': 'assistant'},
    {'icon': Icons.assistant_direction, 'name': 'assistant_direction'},
    {'icon': Icons.assistant_navigation, 'name': 'assistant_navigation'},
    {'icon': Icons.assistant_outlined, 'name': 'assistant_outlined'},
    {'icon': Icons.assistant_photo, 'name': 'assistant_photo'},
    {
      'icon': Icons.assistant_photo_outlined,
      'name': 'assistant_photo_outlined'
    },
    {'icon': Icons.assistant_photo_rounded, 'name': 'assistant_photo_rounded'},
    {'icon': Icons.assistant_photo_sharp, 'name': 'assistant_photo_sharp'},
    {'icon': Icons.assistant_rounded, 'name': 'assistant_rounded'},
    {'icon': Icons.assistant_sharp, 'name': 'assistant_sharp'},
    {'icon': Icons.atm, 'name': 'atm'},
    {'icon': Icons.atm_outlined, 'name': 'atm_outlined'},
    {'icon': Icons.atm_rounded, 'name': 'atm_rounded'},
    {'icon': Icons.atm_sharp, 'name': 'atm_sharp'},
    {'icon': Icons.attach_email, 'name': 'attach_email'},
    {'icon': Icons.attach_email_outlined, 'name': 'attach_email_outlined'},
    {'icon': Icons.attach_email_rounded, 'name': 'attach_email_rounded'},
    {'icon': Icons.attach_email_sharp, 'name': 'attach_email_sharp'},
    {'icon': Icons.attach_file, 'name': 'attach_file'},
    {'icon': Icons.attach_file_outlined, 'name': 'attach_file_outlined'},
    {'icon': Icons.attach_file_rounded, 'name': 'attach_file_rounded'},
    {'icon': Icons.attach_file_sharp, 'name': 'attach_file_sharp'},
    {'icon': Icons.attach_money, 'name': 'attach_money'},
    {'icon': Icons.attach_money_outlined, 'name': 'attach_money_outlined'},
    {'icon': Icons.attach_money_rounded, 'name': 'attach_money_rounded'},
    {'icon': Icons.attach_money_sharp, 'name': 'attach_money_sharp'},
    {'icon': Icons.attachment, 'name': 'attachment'},
    {'icon': Icons.attachment_outlined, 'name': 'attachment_outlined'},
    {'icon': Icons.attachment_rounded, 'name': 'attachment_rounded'},
    {'icon': Icons.attachment_sharp, 'name': 'attachment_sharp'},
    {'icon': Icons.attractions, 'name': 'attractions'},
    {'icon': Icons.attribution_outlined, 'name': 'attribution_outlined'},
    {'icon': Icons.attribution_rounded, 'name': 'attribution_rounded'},
    {'icon': Icons.attribution_sharp, 'name': 'attribution_sharp'},
    {'icon': Icons.audiotrack, 'name': 'audiotrack'},
    {'icon': Icons.audiotrack_outlined, 'name': 'audiotrack_outlined'},
    {'icon': Icons.audiotrack_rounded, 'name': 'audiotrack_rounded'},
    {'icon': Icons.audiotrack_sharp, 'name': 'audiotrack_sharp'},
    {'icon': Icons.auto_awesome, 'name': 'auto_awesome'},
    {'icon': Icons.auto_awesome_mosaic, 'name': 'auto_awesome_mosaic'},
    {'icon': Icons.auto_awesome_motion, 'name': 'auto_awesome_motion'},
    {'icon': Icons.auto_delete, 'name': 'auto_delete'},
    {'icon': Icons.auto_delete_outlined, 'name': 'auto_delete_outlined'},
    {'icon': Icons.auto_delete_rounded, 'name': 'auto_delete_rounded'},
    {'icon': Icons.auto_delete_sharp, 'name': 'auto_delete_sharp'},
    {'icon': Icons.auto_fix_high, 'name': 'auto_fix_high'},
    {'icon': Icons.auto_fix_normal, 'name': 'auto_fix_normal'},
    {'icon': Icons.auto_fix_off, 'name': 'auto_fix_off'},
    {'icon': Icons.auto_stories, 'name': 'auto_stories'},
    {'icon': Icons.autorenew, 'name': 'autorenew'},
    {'icon': Icons.autorenew_outlined, 'name': 'autorenew_outlined'},
    {'icon': Icons.autorenew_rounded, 'name': 'autorenew_rounded'},
    {'icon': Icons.autorenew_sharp, 'name': 'autorenew_sharp'},
    {'icon': Icons.av_timer, 'name': 'av_timer'},
    {'icon': Icons.av_timer_outlined, 'name': 'av_timer_outlined'},
    {'icon': Icons.av_timer_rounded, 'name': 'av_timer_rounded'},
    {'icon': Icons.av_timer_sharp, 'name': 'av_timer_sharp'},
    {'icon': Icons.baby_changing_station, 'name': 'baby_changing_station'},
    {
      'icon': Icons.baby_changing_station_outlined,
      'name': 'baby_changing_station_outlined'
    },
    {
      'icon': Icons.baby_changing_station_rounded,
      'name': 'baby_changing_station_rounded'
    },
    {
      'icon': Icons.baby_changing_station_sharp,
      'name': 'baby_changing_station_sharp'
    },
    {'icon': Icons.backpack, 'name': 'backpack'},
    {'icon': Icons.backpack_outlined, 'name': 'backpack_outlined'},
    {'icon': Icons.backpack_rounded, 'name': 'backpack_rounded'},
    {'icon': Icons.backpack_sharp, 'name': 'backpack_sharp'},
    {'icon': Icons.backspace, 'name': 'backspace'},
    {'icon': Icons.backspace_outlined, 'name': 'backspace_outlined'},
    {'icon': Icons.backspace_rounded, 'name': 'backspace_rounded'},
    {'icon': Icons.backspace_sharp, 'name': 'backspace_sharp'},
    {'icon': Icons.backup, 'name': 'backup'},
    {'icon': Icons.backup_outlined, 'name': 'backup_outlined'},
    {'icon': Icons.backup_rounded, 'name': 'backup_rounded'},
    {'icon': Icons.backup_sharp, 'name': 'backup_sharp'},
    {'icon': Icons.backup_table, 'name': 'backup_table'},
    {'icon': Icons.backup_table_outlined, 'name': 'backup_table_outlined'},
    {'icon': Icons.backup_table_rounded, 'name': 'backup_table_rounded'},
    {'icon': Icons.backup_table_sharp, 'name': 'backup_table_sharp'},
    {'icon': Icons.badge, 'name': 'badge'},
    {'icon': Icons.bakery_dining, 'name': 'bakery_dining'},
    {'icon': Icons.ballot, 'name': 'ballot'},
    {'icon': Icons.ballot_outlined, 'name': 'ballot_outlined'},
    {'icon': Icons.ballot_rounded, 'name': 'ballot_rounded'},
    {'icon': Icons.ballot_sharp, 'name': 'ballot_sharp'},
    {'icon': Icons.bar_chart, 'name': 'bar_chart'},
    {'icon': Icons.bar_chart_outlined, 'name': 'bar_chart_outlined'},
    {'icon': Icons.bar_chart_rounded, 'name': 'bar_chart_rounded'},
    {'icon': Icons.bar_chart_sharp, 'name': 'bar_chart_sharp'},
    {'icon': Icons.batch_prediction, 'name': 'batch_prediction'},
    {
      'icon': Icons.batch_prediction_outlined,
      'name': 'batch_prediction_outlined'
    },
    {
      'icon': Icons.batch_prediction_rounded,
      'name': 'batch_prediction_rounded'
    },
    {'icon': Icons.batch_prediction_sharp, 'name': 'batch_prediction_sharp'},
    {'icon': Icons.bathtub, 'name': 'bathtub'},
    {'icon': Icons.bathtub_outlined, 'name': 'bathtub_outlined'},
    {'icon': Icons.bathtub_rounded, 'name': 'bathtub_rounded'},
    {'icon': Icons.bathtub_sharp, 'name': 'bathtub_sharp'},
    {'icon': Icons.battery_alert, 'name': 'battery_alert'},
    {'icon': Icons.battery_alert_outlined, 'name': 'battery_alert_outlined'},
    {'icon': Icons.battery_alert_rounded, 'name': 'battery_alert_rounded'},
    {'icon': Icons.battery_alert_sharp, 'name': 'battery_alert_sharp'},
    {'icon': Icons.battery_charging_full, 'name': 'battery_charging_full'},
    {
      'icon': Icons.battery_charging_full_outlined,
      'name': 'battery_charging_full_outlined'
    },
    {
      'icon': Icons.battery_charging_full_rounded,
      'name': 'battery_charging_full_rounded'
    },
    {
      'icon': Icons.battery_charging_full_sharp,
      'name': 'battery_charging_full_sharp'
    },
    {'icon': Icons.battery_full, 'name': 'battery_full'},
    {'icon': Icons.battery_full_outlined, 'name': 'battery_full_outlined'},
    {'icon': Icons.battery_full_rounded, 'name': 'battery_full_rounded'},
    {'icon': Icons.battery_full_sharp, 'name': 'battery_full_sharp'},
    {'icon': Icons.battery_std, 'name': 'battery_std'},
    {'icon': Icons.battery_std_outlined, 'name': 'battery_std_outlined'},
    {'icon': Icons.battery_std_rounded, 'name': 'battery_std_rounded'},
    {'icon': Icons.battery_std_sharp, 'name': 'battery_std_sharp'},
    {'icon': Icons.battery_unknown, 'name': 'battery_unknown'},
    {
      'icon': Icons.battery_unknown_outlined,
      'name': 'battery_unknown_outlined'
    },
    {'icon': Icons.battery_unknown_rounded, 'name': 'battery_unknown_rounded'},
    {'icon': Icons.battery_unknown_sharp, 'name': 'battery_unknown_sharp'},
    {'icon': Icons.beach_access, 'name': 'beach_access'},
    {'icon': Icons.beach_access_outlined, 'name': 'beach_access_outlined'},
    {'icon': Icons.beach_access_rounded, 'name': 'beach_access_rounded'},
    {'icon': Icons.beach_access_sharp, 'name': 'beach_access_sharp'},
    {'icon': Icons.bedtime, 'name': 'bedtime'},
    {'icon': Icons.bedtime_outlined, 'name': 'bedtime_outlined'},
    {'icon': Icons.bedtime_rounded, 'name': 'bedtime_rounded'},
    {'icon': Icons.bedtime_sharp, 'name': 'bedtime_sharp'},
    {'icon': Icons.beenhere, 'name': 'beenhere'},
    {'icon': Icons.beenhere_outlined, 'name': 'beenhere_outlined'},
    {'icon': Icons.beenhere_rounded, 'name': 'beenhere_rounded'},
    {'icon': Icons.beenhere_sharp, 'name': 'beenhere_sharp'},
    {'icon': Icons.bento, 'name': 'bento'},
    {'icon': Icons.bento_outlined, 'name': 'bento_outlined'},
    {'icon': Icons.bento_rounded, 'name': 'bento_rounded'},
    {'icon': Icons.bento_sharp, 'name': 'bento_sharp'},
    {'icon': Icons.bike_scooter, 'name': 'bike_scooter'},
    {'icon': Icons.bike_scooter_outlined, 'name': 'bike_scooter_outlined'},
    {'icon': Icons.bike_scooter_rounded, 'name': 'bike_scooter_rounded'},
    {'icon': Icons.bike_scooter_sharp, 'name': 'bike_scooter_sharp'},
    {'icon': Icons.biotech, 'name': 'biotech'},
    {'icon': Icons.biotech_outlined, 'name': 'biotech_outlined'},
    {'icon': Icons.biotech_rounded, 'name': 'biotech_rounded'},
    {'icon': Icons.biotech_sharp, 'name': 'biotech_sharp'},
    {'icon': Icons.block, 'name': 'block'},
    {'icon': Icons.block_flipped, 'name': 'block_flipped'},
    {'icon': Icons.block_outlined, 'name': 'block_outlined'},
    {'icon': Icons.block_rounded, 'name': 'block_rounded'},
    {'icon': Icons.block_sharp, 'name': 'block_sharp'},
    {'icon': Icons.bluetooth, 'name': 'bluetooth'},
    {'icon': Icons.bluetooth_audio, 'name': 'bluetooth_audio'},
    {
      'icon': Icons.bluetooth_audio_outlined,
      'name': 'bluetooth_audio_outlined'
    },
    {'icon': Icons.bluetooth_audio_rounded, 'name': 'bluetooth_audio_rounded'},
    {'icon': Icons.bluetooth_audio_sharp, 'name': 'bluetooth_audio_sharp'},
    {'icon': Icons.bluetooth_connected, 'name': 'bluetooth_connected'},
    {
      'icon': Icons.bluetooth_connected_outlined,
      'name': 'bluetooth_connected_outlined'
    },
    {
      'icon': Icons.bluetooth_connected_rounded,
      'name': 'bluetooth_connected_rounded'
    },
    {
      'icon': Icons.bluetooth_connected_sharp,
      'name': 'bluetooth_connected_sharp'
    },
    {'icon': Icons.bluetooth_disabled, 'name': 'bluetooth_disabled'},
    {
      'icon': Icons.bluetooth_disabled_outlined,
      'name': 'bluetooth_disabled_outlined'
    },
    {
      'icon': Icons.bluetooth_disabled_rounded,
      'name': 'bluetooth_disabled_rounded'
    },
    {
      'icon': Icons.bluetooth_disabled_sharp,
      'name': 'bluetooth_disabled_sharp'
    },
    {'icon': Icons.bluetooth_outlined, 'name': 'bluetooth_outlined'},
    {'icon': Icons.bluetooth_rounded, 'name': 'bluetooth_rounded'},
    {'icon': Icons.bluetooth_searching, 'name': 'bluetooth_searching'},
    {
      'icon': Icons.bluetooth_searching_outlined,
      'name': 'bluetooth_searching_outlined'
    },
    {
      'icon': Icons.bluetooth_searching_rounded,
      'name': 'bluetooth_searching_rounded'
    },
    {
      'icon': Icons.bluetooth_searching_sharp,
      'name': 'bluetooth_searching_sharp'
    },
    {'icon': Icons.bluetooth_sharp, 'name': 'bluetooth_sharp'},
    {'icon': Icons.blur_circular, 'name': 'blur_circular'},
    {'icon': Icons.blur_circular_outlined, 'name': 'blur_circular_outlined'},
    {'icon': Icons.blur_circular_rounded, 'name': 'blur_circular_rounded'},
    {'icon': Icons.blur_circular_sharp, 'name': 'blur_circular_sharp'},
    {'icon': Icons.blur_linear, 'name': 'blur_linear'},
    {'icon': Icons.blur_linear_outlined, 'name': 'blur_linear_outlined'},
    {'icon': Icons.blur_linear_rounded, 'name': 'blur_linear_rounded'},
    {'icon': Icons.blur_linear_sharp, 'name': 'blur_linear_sharp'},
    {'icon': Icons.blur_off, 'name': 'blur_off'},
    {'icon': Icons.blur_off_outlined, 'name': 'blur_off_outlined'},
    {'icon': Icons.blur_off_rounded, 'name': 'blur_off_rounded'},
    {'icon': Icons.blur_off_sharp, 'name': 'blur_off_sharp'},
    {'icon': Icons.blur_on, 'name': 'blur_on'},
    {'icon': Icons.blur_on_outlined, 'name': 'blur_on_outlined'},
    {'icon': Icons.blur_on_rounded, 'name': 'blur_on_rounded'},
    {'icon': Icons.blur_on_sharp, 'name': 'blur_on_sharp'},
    {'icon': Icons.bolt, 'name': 'bolt'},
    {'icon': Icons.book, 'name': 'book'},
    {'icon': Icons.book_online, 'name': 'book_online'},
    {'icon': Icons.book_online_outlined, 'name': 'book_online_outlined'},
    {'icon': Icons.book_online_rounded, 'name': 'book_online_rounded'},
    {'icon': Icons.book_online_sharp, 'name': 'book_online_sharp'},
    {'icon': Icons.book_outlined, 'name': 'book_outlined'},
    {'icon': Icons.book_rounded, 'name': 'book_rounded'},
    {'icon': Icons.book_sharp, 'name': 'book_sharp'},
    {'icon': Icons.bookmark, 'name': 'bookmark'},
    {'icon': Icons.bookmark_border, 'name': 'bookmark_border'},
    {
      'icon': Icons.bookmark_border_outlined,
      'name': 'bookmark_border_outlined'
    },
    {'icon': Icons.bookmark_border_rounded, 'name': 'bookmark_border_rounded'},
    {'icon': Icons.bookmark_border_sharp, 'name': 'bookmark_border_sharp'},
    {'icon': Icons.bookmark_outline, 'name': 'bookmark_outline'},
    {
      'icon': Icons.bookmark_outline_outlined,
      'name': 'bookmark_outline_outlined'
    },
    {
      'icon': Icons.bookmark_outline_rounded,
      'name': 'bookmark_outline_rounded'
    },
    {'icon': Icons.bookmark_outline_sharp, 'name': 'bookmark_outline_sharp'},
    {'icon': Icons.bookmark_outlined, 'name': 'bookmark_outlined'},
    {'icon': Icons.bookmark_rounded, 'name': 'bookmark_rounded'},
    {'icon': Icons.bookmark_sharp, 'name': 'bookmark_sharp'},
    {'icon': Icons.bookmarks, 'name': 'bookmarks'},
    {'icon': Icons.bookmarks_outlined, 'name': 'bookmarks_outlined'},
    {'icon': Icons.bookmarks_rounded, 'name': 'bookmarks_rounded'},
    {'icon': Icons.bookmarks_sharp, 'name': 'bookmarks_sharp'},
    {'icon': Icons.border_all, 'name': 'border_all'},
    {'icon': Icons.border_all_outlined, 'name': 'border_all_outlined'},
    {'icon': Icons.border_all_rounded, 'name': 'border_all_rounded'},
    {'icon': Icons.border_all_sharp, 'name': 'border_all_sharp'},
    {'icon': Icons.border_bottom, 'name': 'border_bottom'},
    {'icon': Icons.border_bottom_outlined, 'name': 'border_bottom_outlined'},
    {'icon': Icons.border_bottom_rounded, 'name': 'border_bottom_rounded'},
    {'icon': Icons.border_bottom_sharp, 'name': 'border_bottom_sharp'},
    {'icon': Icons.border_clear, 'name': 'border_clear'},
    {'icon': Icons.border_clear_outlined, 'name': 'border_clear_outlined'},
    {'icon': Icons.border_clear_rounded, 'name': 'border_clear_rounded'},
    {'icon': Icons.border_clear_sharp, 'name': 'border_clear_sharp'},
    {'icon': Icons.border_color, 'name': 'border_color'},
    {'icon': Icons.border_horizontal, 'name': 'border_horizontal'},
    {
      'icon': Icons.border_horizontal_outlined,
      'name': 'border_horizontal_outlined'
    },
    {
      'icon': Icons.border_horizontal_rounded,
      'name': 'border_horizontal_rounded'
    },
    {'icon': Icons.border_horizontal_sharp, 'name': 'border_horizontal_sharp'},
    {'icon': Icons.border_inner, 'name': 'border_inner'},
    {'icon': Icons.border_inner_outlined, 'name': 'border_inner_outlined'},
    {'icon': Icons.border_inner_rounded, 'name': 'border_inner_rounded'},
    {'icon': Icons.border_inner_sharp, 'name': 'border_inner_sharp'},
    {'icon': Icons.border_left, 'name': 'border_left'},
    {'icon': Icons.border_left_outlined, 'name': 'border_left_outlined'},
    {'icon': Icons.border_left_rounded, 'name': 'border_left_rounded'},
    {'icon': Icons.border_left_sharp, 'name': 'border_left_sharp'},
    {'icon': Icons.border_outer, 'name': 'border_outer'},
    {'icon': Icons.border_outer_outlined, 'name': 'border_outer_outlined'},
    {'icon': Icons.border_outer_rounded, 'name': 'border_outer_rounded'},
    {'icon': Icons.border_outer_sharp, 'name': 'border_outer_sharp'},
    {'icon': Icons.border_right, 'name': 'border_right'},
    {'icon': Icons.border_right_outlined, 'name': 'border_right_outlined'},
    {'icon': Icons.border_right_rounded, 'name': 'border_right_rounded'},
    {'icon': Icons.border_right_sharp, 'name': 'border_right_sharp'},
    {'icon': Icons.border_style, 'name': 'border_style'},
    {'icon': Icons.border_style_outlined, 'name': 'border_style_outlined'},
    {'icon': Icons.border_style_rounded, 'name': 'border_style_rounded'},
    {'icon': Icons.border_style_sharp, 'name': 'border_style_sharp'},
    {'icon': Icons.border_top, 'name': 'border_top'},
    {'icon': Icons.border_top_outlined, 'name': 'border_top_outlined'},
    {'icon': Icons.border_top_rounded, 'name': 'border_top_rounded'},
    {'icon': Icons.border_top_sharp, 'name': 'border_top_sharp'},
    {'icon': Icons.border_vertical, 'name': 'border_vertical'},
    {
      'icon': Icons.border_vertical_outlined,
      'name': 'border_vertical_outlined'
    },
    {'icon': Icons.border_vertical_rounded, 'name': 'border_vertical_rounded'},
    {'icon': Icons.border_vertical_sharp, 'name': 'border_vertical_sharp'},
    {'icon': Icons.branding_watermark, 'name': 'branding_watermark'},
    {
      'icon': Icons.branding_watermark_outlined,
      'name': 'branding_watermark_outlined'
    },
    {
      'icon': Icons.branding_watermark_rounded,
      'name': 'branding_watermark_rounded'
    },
    {
      'icon': Icons.branding_watermark_sharp,
      'name': 'branding_watermark_sharp'
    },
    {'icon': Icons.breakfast_dining, 'name': 'breakfast_dining'},
    {'icon': Icons.brightness_1, 'name': 'brightness_1'},
    {'icon': Icons.brightness_1_outlined, 'name': 'brightness_1_outlined'},
    {'icon': Icons.brightness_1_rounded, 'name': 'brightness_1_rounded'},
    {'icon': Icons.brightness_1_sharp, 'name': 'brightness_1_sharp'},
    {'icon': Icons.brightness_2, 'name': 'brightness_2'},
    {'icon': Icons.brightness_2_outlined, 'name': 'brightness_2_outlined'},
    {'icon': Icons.brightness_2_rounded, 'name': 'brightness_2_rounded'},
    {'icon': Icons.brightness_2_sharp, 'name': 'brightness_2_sharp'},
    {'icon': Icons.brightness_3, 'name': 'brightness_3'},
    {'icon': Icons.brightness_3_outlined, 'name': 'brightness_3_outlined'},
    {'icon': Icons.brightness_3_rounded, 'name': 'brightness_3_rounded'},
    {'icon': Icons.brightness_3_sharp, 'name': 'brightness_3_sharp'},
    {'icon': Icons.brightness_4, 'name': 'brightness_4'},
    {'icon': Icons.brightness_4_outlined, 'name': 'brightness_4_outlined'},
    {'icon': Icons.brightness_4_rounded, 'name': 'brightness_4_rounded'},
    {'icon': Icons.brightness_4_sharp, 'name': 'brightness_4_sharp'},
    {'icon': Icons.brightness_5, 'name': 'brightness_5'},
    {'icon': Icons.brightness_5_outlined, 'name': 'brightness_5_outlined'},
    {'icon': Icons.brightness_5_rounded, 'name': 'brightness_5_rounded'},
    {'icon': Icons.brightness_5_sharp, 'name': 'brightness_5_sharp'},
    {'icon': Icons.brightness_6, 'name': 'brightness_6'},
    {'icon': Icons.brightness_6_outlined, 'name': 'brightness_6_outlined'},
    {'icon': Icons.brightness_6_rounded, 'name': 'brightness_6_rounded'},
    {'icon': Icons.brightness_6_sharp, 'name': 'brightness_6_sharp'},
    {'icon': Icons.brightness_7, 'name': 'brightness_7'},
    {'icon': Icons.brightness_7_outlined, 'name': 'brightness_7_outlined'},
    {'icon': Icons.brightness_7_rounded, 'name': 'brightness_7_rounded'},
    {'icon': Icons.brightness_7_sharp, 'name': 'brightness_7_sharp'},
    {'icon': Icons.brightness_auto, 'name': 'brightness_auto'},
    {
      'icon': Icons.brightness_auto_outlined,
      'name': 'brightness_auto_outlined'
    },
    {'icon': Icons.brightness_auto_rounded, 'name': 'brightness_auto_rounded'},
    {'icon': Icons.brightness_auto_sharp, 'name': 'brightness_auto_sharp'},
    {'icon': Icons.brightness_high, 'name': 'brightness_high'},
    {
      'icon': Icons.brightness_high_outlined,
      'name': 'brightness_high_outlined'
    },
    {'icon': Icons.brightness_high_rounded, 'name': 'brightness_high_rounded'},
    {'icon': Icons.brightness_high_sharp, 'name': 'brightness_high_sharp'},
    {'icon': Icons.brightness_low, 'name': 'brightness_low'},
    {'icon': Icons.brightness_low_outlined, 'name': 'brightness_low_outlined'},
    {'icon': Icons.brightness_low_rounded, 'name': 'brightness_low_rounded'},
    {'icon': Icons.brightness_low_sharp, 'name': 'brightness_low_sharp'},
    {'icon': Icons.brightness_medium, 'name': 'brightness_medium'},
    {
      'icon': Icons.brightness_medium_outlined,
      'name': 'brightness_medium_outlined'
    },
    {
      'icon': Icons.brightness_medium_rounded,
      'name': 'brightness_medium_rounded'
    },
    {'icon': Icons.brightness_medium_sharp, 'name': 'brightness_medium_sharp'},
    {'icon': Icons.broken_image, 'name': 'broken_image'},
    {'icon': Icons.broken_image_outlined, 'name': 'broken_image_outlined'},
    {'icon': Icons.broken_image_rounded, 'name': 'broken_image_rounded'},
    {'icon': Icons.broken_image_sharp, 'name': 'broken_image_sharp'},
    {'icon': Icons.browser_not_supported, 'name': 'browser_not_supported'},
    {
      'icon': Icons.browser_not_supported_outlined,
      'name': 'browser_not_supported_outlined'
    },
    {
      'icon': Icons.browser_not_supported_rounded,
      'name': 'browser_not_supported_rounded'
    },
    {
      'icon': Icons.browser_not_supported_sharp,
      'name': 'browser_not_supported_sharp'
    },
    {'icon': Icons.brunch_dining, 'name': 'brunch_dining'},
    {'icon': Icons.brush, 'name': 'brush'},
    {'icon': Icons.brush_outlined, 'name': 'brush_outlined'},
    {'icon': Icons.brush_rounded, 'name': 'brush_rounded'},
    {'icon': Icons.brush_sharp, 'name': 'brush_sharp'},
    {'icon': Icons.bubble_chart, 'name': 'bubble_chart'},
    {'icon': Icons.bubble_chart_outlined, 'name': 'bubble_chart_outlined'},
    {'icon': Icons.bubble_chart_rounded, 'name': 'bubble_chart_rounded'},
    {'icon': Icons.bubble_chart_sharp, 'name': 'bubble_chart_sharp'},
    {'icon': Icons.bug_report, 'name': 'bug_report'},
    {'icon': Icons.bug_report_outlined, 'name': 'bug_report_outlined'},
    {'icon': Icons.bug_report_rounded, 'name': 'bug_report_rounded'},
    {'icon': Icons.bug_report_sharp, 'name': 'bug_report_sharp'},
    {'icon': Icons.build, 'name': 'build'},
    {'icon': Icons.build_circle, 'name': 'build_circle'},
    {'icon': Icons.build_circle_outlined, 'name': 'build_circle_outlined'},
    {'icon': Icons.build_circle_rounded, 'name': 'build_circle_rounded'},
    {'icon': Icons.build_circle_sharp, 'name': 'build_circle_sharp'},
    {'icon': Icons.build_outlined, 'name': 'build_outlined'},
    {'icon': Icons.build_rounded, 'name': 'build_rounded'},
    {'icon': Icons.build_sharp, 'name': 'build_sharp'},
    {'icon': Icons.burst_mode, 'name': 'burst_mode'},
    {'icon': Icons.burst_mode_outlined, 'name': 'burst_mode_outlined'},
    {'icon': Icons.burst_mode_rounded, 'name': 'burst_mode_rounded'},
    {'icon': Icons.burst_mode_sharp, 'name': 'burst_mode_sharp'},
    {'icon': Icons.bus_alert, 'name': 'bus_alert'},
    {'icon': Icons.business, 'name': 'business'},
    {'icon': Icons.business_center, 'name': 'business_center'},
    {
      'icon': Icons.business_center_outlined,
      'name': 'business_center_outlined'
    },
    {'icon': Icons.business_center_rounded, 'name': 'business_center_rounded'},
    {'icon': Icons.business_center_sharp, 'name': 'business_center_sharp'},
    {'icon': Icons.business_outlined, 'name': 'business_outlined'},
    {'icon': Icons.business_rounded, 'name': 'business_rounded'},
    {'icon': Icons.business_sharp, 'name': 'business_sharp'},
    {'icon': Icons.cached, 'name': 'cached'},
    {'icon': Icons.cached_outlined, 'name': 'cached_outlined'},
    {'icon': Icons.cached_rounded, 'name': 'cached_rounded'},
    {'icon': Icons.cached_sharp, 'name': 'cached_sharp'},
    {'icon': Icons.cake, 'name': 'cake'},
    {'icon': Icons.cake_outlined, 'name': 'cake_outlined'},
    {'icon': Icons.cake_rounded, 'name': 'cake_rounded'},
    {'icon': Icons.cake_sharp, 'name': 'cake_sharp'},
    {'icon': Icons.calculate, 'name': 'calculate'},
    {'icon': Icons.calculate_outlined, 'name': 'calculate_outlined'},
    {'icon': Icons.calculate_rounded, 'name': 'calculate_rounded'},
    {'icon': Icons.calculate_sharp, 'name': 'calculate_sharp'},
    {'icon': Icons.calendar_today, 'name': 'calendar_today'},
    {'icon': Icons.calendar_today_outlined, 'name': 'calendar_today_outlined'},
    {'icon': Icons.calendar_today_rounded, 'name': 'calendar_today_rounded'},
    {'icon': Icons.calendar_today_sharp, 'name': 'calendar_today_sharp'},
    {'icon': Icons.calendar_view_day, 'name': 'calendar_view_day'},
    {
      'icon': Icons.calendar_view_day_outlined,
      'name': 'calendar_view_day_outlined'
    },
    {
      'icon': Icons.calendar_view_day_rounded,
      'name': 'calendar_view_day_rounded'
    },
    {'icon': Icons.calendar_view_day_sharp, 'name': 'calendar_view_day_sharp'},
    {'icon': Icons.call, 'name': 'call'},
    {'icon': Icons.call_end, 'name': 'call_end'},
    {'icon': Icons.call_end_outlined, 'name': 'call_end_outlined'},
    {'icon': Icons.call_end_rounded, 'name': 'call_end_rounded'},
    {'icon': Icons.call_end_sharp, 'name': 'call_end_sharp'},
    {'icon': Icons.call_made, 'name': 'call_made'},
    {'icon': Icons.call_made_outlined, 'name': 'call_made_outlined'},
    {'icon': Icons.call_made_rounded, 'name': 'call_made_rounded'},
    {'icon': Icons.call_made_sharp, 'name': 'call_made_sharp'},
    {'icon': Icons.call_merge, 'name': 'call_merge'},
    {'icon': Icons.call_merge_outlined, 'name': 'call_merge_outlined'},
    {'icon': Icons.call_merge_rounded, 'name': 'call_merge_rounded'},
    {'icon': Icons.call_merge_sharp, 'name': 'call_merge_sharp'},
    {'icon': Icons.call_missed, 'name': 'call_missed'},
    {'icon': Icons.call_missed_outgoing, 'name': 'call_missed_outgoing'},
    {
      'icon': Icons.call_missed_outgoing_outlined,
      'name': 'call_missed_outgoing_outlined'
    },
    {
      'icon': Icons.call_missed_outgoing_rounded,
      'name': 'call_missed_outgoing_rounded'
    },
    {
      'icon': Icons.call_missed_outgoing_sharp,
      'name': 'call_missed_outgoing_sharp'
    },
    {'icon': Icons.call_missed_outlined, 'name': 'call_missed_outlined'},
    {'icon': Icons.call_missed_rounded, 'name': 'call_missed_rounded'},
    {'icon': Icons.call_missed_sharp, 'name': 'call_missed_sharp'},
    {'icon': Icons.call_outlined, 'name': 'call_outlined'},
    {'icon': Icons.call_received, 'name': 'call_received'},
    {'icon': Icons.call_received_outlined, 'name': 'call_received_outlined'},
    {'icon': Icons.call_received_rounded, 'name': 'call_received_rounded'},
    {'icon': Icons.call_received_sharp, 'name': 'call_received_sharp'},
    {'icon': Icons.call_rounded, 'name': 'call_rounded'},
    {'icon': Icons.call_sharp, 'name': 'call_sharp'},
    {'icon': Icons.call_split, 'name': 'call_split'},
    {'icon': Icons.call_split_outlined, 'name': 'call_split_outlined'},
    {'icon': Icons.call_split_rounded, 'name': 'call_split_rounded'},
    {'icon': Icons.call_split_sharp, 'name': 'call_split_sharp'},
    {'icon': Icons.call_to_action, 'name': 'call_to_action'},
    {'icon': Icons.call_to_action_outlined, 'name': 'call_to_action_outlined'},
    {'icon': Icons.call_to_action_rounded, 'name': 'call_to_action_rounded'},
    {'icon': Icons.call_to_action_sharp, 'name': 'call_to_action_sharp'},
    {'icon': Icons.camera, 'name': 'camera'},
    {'icon': Icons.camera_alt, 'name': 'camera_alt'},
    {'icon': Icons.camera_alt_outlined, 'name': 'camera_alt_outlined'},
    {'icon': Icons.camera_alt_rounded, 'name': 'camera_alt_rounded'},
    {'icon': Icons.camera_alt_sharp, 'name': 'camera_alt_sharp'},
    {'icon': Icons.camera_enhance, 'name': 'camera_enhance'},
    {'icon': Icons.camera_enhance_outlined, 'name': 'camera_enhance_outlined'},
    {'icon': Icons.camera_enhance_rounded, 'name': 'camera_enhance_rounded'},
    {'icon': Icons.camera_enhance_sharp, 'name': 'camera_enhance_sharp'},
    {'icon': Icons.camera_front, 'name': 'camera_front'},
    {'icon': Icons.camera_front_outlined, 'name': 'camera_front_outlined'},
    {'icon': Icons.camera_front_rounded, 'name': 'camera_front_rounded'},
    {'icon': Icons.camera_front_sharp, 'name': 'camera_front_sharp'},
    {'icon': Icons.camera_outlined, 'name': 'camera_outlined'},
    {'icon': Icons.camera_rear, 'name': 'camera_rear'},
    {'icon': Icons.camera_rear_outlined, 'name': 'camera_rear_outlined'},
    {'icon': Icons.camera_rear_rounded, 'name': 'camera_rear_rounded'},
    {'icon': Icons.camera_rear_sharp, 'name': 'camera_rear_sharp'},
    {'icon': Icons.camera_roll, 'name': 'camera_roll'},
    {'icon': Icons.camera_roll_outlined, 'name': 'camera_roll_outlined'},
    {'icon': Icons.camera_roll_rounded, 'name': 'camera_roll_rounded'},
    {'icon': Icons.camera_roll_sharp, 'name': 'camera_roll_sharp'},
    {'icon': Icons.camera_rounded, 'name': 'camera_rounded'},
    {'icon': Icons.camera_sharp, 'name': 'camera_sharp'},
    {'icon': Icons.campaign, 'name': 'campaign'},
    {'icon': Icons.campaign_outlined, 'name': 'campaign_outlined'},
    {'icon': Icons.campaign_rounded, 'name': 'campaign_rounded'},
    {'icon': Icons.campaign_sharp, 'name': 'campaign_sharp'},
    {'icon': Icons.cancel, 'name': 'cancel'},
    {'icon': Icons.cancel_outlined, 'name': 'cancel_outlined'},
    {'icon': Icons.cancel_presentation, 'name': 'cancel_presentation'},
    {
      'icon': Icons.cancel_presentation_outlined,
      'name': 'cancel_presentation_outlined'
    },
    {
      'icon': Icons.cancel_presentation_rounded,
      'name': 'cancel_presentation_rounded'
    },
    {
      'icon': Icons.cancel_presentation_sharp,
      'name': 'cancel_presentation_sharp'
    },
    {'icon': Icons.cancel_rounded, 'name': 'cancel_rounded'},
    {'icon': Icons.cancel_schedule_send, 'name': 'cancel_schedule_send'},
    {
      'icon': Icons.cancel_schedule_send_outlined,
      'name': 'cancel_schedule_send_outlined'
    },
    {
      'icon': Icons.cancel_schedule_send_rounded,
      'name': 'cancel_schedule_send_rounded'
    },
    {
      'icon': Icons.cancel_schedule_send_sharp,
      'name': 'cancel_schedule_send_sharp'
    },
    {'icon': Icons.cancel_sharp, 'name': 'cancel_sharp'},
    {'icon': Icons.car_rental, 'name': 'car_rental'},
    {'icon': Icons.car_repair, 'name': 'car_repair'},
    {'icon': Icons.card_giftcard, 'name': 'card_giftcard'},
    {'icon': Icons.card_giftcard_outlined, 'name': 'card_giftcard_outlined'},
    {'icon': Icons.card_giftcard_rounded, 'name': 'card_giftcard_rounded'},
    {'icon': Icons.card_giftcard_sharp, 'name': 'card_giftcard_sharp'},
    {'icon': Icons.card_membership, 'name': 'card_membership'},
    {
      'icon': Icons.card_membership_outlined,
      'name': 'card_membership_outlined'
    },
    {'icon': Icons.card_membership_rounded, 'name': 'card_membership_rounded'},
    {'icon': Icons.card_membership_sharp, 'name': 'card_membership_sharp'},
    {'icon': Icons.card_travel, 'name': 'card_travel'},
    {'icon': Icons.card_travel_outlined, 'name': 'card_travel_outlined'},
    {'icon': Icons.card_travel_rounded, 'name': 'card_travel_rounded'},
    {'icon': Icons.card_travel_sharp, 'name': 'card_travel_sharp'},
    {'icon': Icons.carpenter, 'name': 'carpenter'},
    {'icon': Icons.carpenter_outlined, 'name': 'carpenter_outlined'},
    {'icon': Icons.carpenter_rounded, 'name': 'carpenter_rounded'},
    {'icon': Icons.carpenter_sharp, 'name': 'carpenter_sharp'},
    {'icon': Icons.cases, 'name': 'cases'},
    {'icon': Icons.casino, 'name': 'casino'},
    {'icon': Icons.casino_outlined, 'name': 'casino_outlined'},
    {'icon': Icons.casino_rounded, 'name': 'casino_rounded'},
    {'icon': Icons.casino_sharp, 'name': 'casino_sharp'},
    {'icon': Icons.cast, 'name': 'cast'},
    {'icon': Icons.cast_connected, 'name': 'cast_connected'},
    {'icon': Icons.cast_connected_outlined, 'name': 'cast_connected_outlined'},
    {'icon': Icons.cast_connected_rounded, 'name': 'cast_connected_rounded'},
    {'icon': Icons.cast_connected_sharp, 'name': 'cast_connected_sharp'},
    {'icon': Icons.cast_for_education, 'name': 'cast_for_education'},
    {
      'icon': Icons.cast_for_education_outlined,
      'name': 'cast_for_education_outlined'
    },
    {
      'icon': Icons.cast_for_education_rounded,
      'name': 'cast_for_education_rounded'
    },
    {
      'icon': Icons.cast_for_education_sharp,
      'name': 'cast_for_education_sharp'
    },
    {'icon': Icons.cast_outlined, 'name': 'cast_outlined'},
    {'icon': Icons.cast_rounded, 'name': 'cast_rounded'},
    {'icon': Icons.cast_sharp, 'name': 'cast_sharp'},
    {'icon': Icons.category, 'name': 'category'},
    {'icon': Icons.category_outlined, 'name': 'category_outlined'},
    {'icon': Icons.category_rounded, 'name': 'category_rounded'},
    {'icon': Icons.category_sharp, 'name': 'category_sharp'},
    {'icon': Icons.celebration, 'name': 'celebration'},
    {'icon': Icons.center_focus_strong, 'name': 'center_focus_strong'},
    {
      'icon': Icons.center_focus_strong_outlined,
      'name': 'center_focus_strong_outlined'
    },
    {
      'icon': Icons.center_focus_strong_rounded,
      'name': 'center_focus_strong_rounded'
    },
    {
      'icon': Icons.center_focus_strong_sharp,
      'name': 'center_focus_strong_sharp'
    },
    {'icon': Icons.center_focus_weak, 'name': 'center_focus_weak'},
    {
      'icon': Icons.center_focus_weak_outlined,
      'name': 'center_focus_weak_outlined'
    },
    {
      'icon': Icons.center_focus_weak_rounded,
      'name': 'center_focus_weak_rounded'
    },
    {'icon': Icons.center_focus_weak_sharp, 'name': 'center_focus_weak_sharp'},
    {'icon': Icons.change_history, 'name': 'change_history'},
    {'icon': Icons.change_history_outlined, 'name': 'change_history_outlined'},
    {'icon': Icons.change_history_rounded, 'name': 'change_history_rounded'},
    {'icon': Icons.change_history_sharp, 'name': 'change_history_sharp'},
    {'icon': Icons.charging_station, 'name': 'charging_station'},
    {
      'icon': Icons.charging_station_outlined,
      'name': 'charging_station_outlined'
    },
    {
      'icon': Icons.charging_station_rounded,
      'name': 'charging_station_rounded'
    },
    {'icon': Icons.charging_station_sharp, 'name': 'charging_station_sharp'},
    {'icon': Icons.chat, 'name': 'chat'},
    {'icon': Icons.chat_bubble, 'name': 'chat_bubble'},
    {'icon': Icons.chat_bubble_outline, 'name': 'chat_bubble_outline'},
    {
      'icon': Icons.chat_bubble_outline_outlined,
      'name': 'chat_bubble_outline_outlined'
    },
    {
      'icon': Icons.chat_bubble_outline_rounded,
      'name': 'chat_bubble_outline_rounded'
    },
    {
      'icon': Icons.chat_bubble_outline_sharp,
      'name': 'chat_bubble_outline_sharp'
    },
    {'icon': Icons.chat_bubble_outlined, 'name': 'chat_bubble_outlined'},
    {'icon': Icons.chat_bubble_rounded, 'name': 'chat_bubble_rounded'},
    {'icon': Icons.chat_bubble_sharp, 'name': 'chat_bubble_sharp'},
    {'icon': Icons.chat_outlined, 'name': 'chat_outlined'},
    {'icon': Icons.chat_rounded, 'name': 'chat_rounded'},
    {'icon': Icons.chat_sharp, 'name': 'chat_sharp'},
    {'icon': Icons.check, 'name': 'check'},
    {'icon': Icons.check_box, 'name': 'check_box'},
    {'icon': Icons.check_box_outline_blank, 'name': 'check_box_outline_blank'},
    {
      'icon': Icons.check_box_outline_blank_outlined,
      'name': 'check_box_outline_blank_outlined'
    },
    {
      'icon': Icons.check_box_outline_blank_rounded,
      'name': 'check_box_outline_blank_rounded'
    },
    {
      'icon': Icons.check_box_outline_blank_sharp,
      'name': 'check_box_outline_blank_sharp'
    },
    {'icon': Icons.check_box_outlined, 'name': 'check_box_outlined'},
    {'icon': Icons.check_box_rounded, 'name': 'check_box_rounded'},
    {'icon': Icons.check_box_sharp, 'name': 'check_box_sharp'},
    {'icon': Icons.check_circle, 'name': 'check_circle'},
    {'icon': Icons.check_circle_outline, 'name': 'check_circle_outline'},
    {
      'icon': Icons.check_circle_outline_outlined,
      'name': 'check_circle_outline_outlined'
    },
    {
      'icon': Icons.check_circle_outline_rounded,
      'name': 'check_circle_outline_rounded'
    },
    {
      'icon': Icons.check_circle_outline_sharp,
      'name': 'check_circle_outline_sharp'
    },
    {'icon': Icons.check_circle_outlined, 'name': 'check_circle_outlined'},
    {'icon': Icons.check_circle_rounded, 'name': 'check_circle_rounded'},
    {'icon': Icons.check_circle_sharp, 'name': 'check_circle_sharp'},
    {'icon': Icons.check_outlined, 'name': 'check_outlined'},
    {'icon': Icons.check_rounded, 'name': 'check_rounded'},
    {'icon': Icons.check_sharp, 'name': 'check_sharp'},
    {'icon': Icons.checkroom, 'name': 'checkroom'},
    {'icon': Icons.checkroom_outlined, 'name': 'checkroom_outlined'},
    {'icon': Icons.checkroom_rounded, 'name': 'checkroom_rounded'},
    {'icon': Icons.checkroom_sharp, 'name': 'checkroom_sharp'},
    {'icon': Icons.chevron_left, 'name': 'chevron_left'},
    {'icon': Icons.chevron_left_outlined, 'name': 'chevron_left_outlined'},
    {'icon': Icons.chevron_left_rounded, 'name': 'chevron_left_rounded'},
    {'icon': Icons.chevron_left_sharp, 'name': 'chevron_left_sharp'},
    {'icon': Icons.chevron_right, 'name': 'chevron_right'},
    {'icon': Icons.chevron_right_outlined, 'name': 'chevron_right_outlined'},
    {'icon': Icons.chevron_right_rounded, 'name': 'chevron_right_rounded'},
    {'icon': Icons.chevron_right_sharp, 'name': 'chevron_right_sharp'},
    {'icon': Icons.child_care, 'name': 'child_care'},
    {'icon': Icons.child_care_outlined, 'name': 'child_care_outlined'},
    {'icon': Icons.child_care_rounded, 'name': 'child_care_rounded'},
    {'icon': Icons.child_care_sharp, 'name': 'child_care_sharp'},
    {'icon': Icons.child_friendly, 'name': 'child_friendly'},
    {'icon': Icons.child_friendly_outlined, 'name': 'child_friendly_outlined'},
    {'icon': Icons.child_friendly_rounded, 'name': 'child_friendly_rounded'},
    {'icon': Icons.child_friendly_sharp, 'name': 'child_friendly_sharp'},
    {'icon': Icons.chrome_reader_mode, 'name': 'chrome_reader_mode'},
    {
      'icon': Icons.chrome_reader_mode_outlined,
      'name': 'chrome_reader_mode_outlined'
    },
    {
      'icon': Icons.chrome_reader_mode_rounded,
      'name': 'chrome_reader_mode_rounded'
    },
    {
      'icon': Icons.chrome_reader_mode_sharp,
      'name': 'chrome_reader_mode_sharp'
    },
    {'icon': Icons.circle, 'name': 'circle'},
    {'icon': Icons.circle_notifications, 'name': 'circle_notifications'},
    {'icon': Icons.class_, 'name': 'class_'},
    {'icon': Icons.class__outlined, 'name': 'class__outlined'},
    {'icon': Icons.class__rounded, 'name': 'class__rounded'},
    {'icon': Icons.class__sharp, 'name': 'class__sharp'},
    {'icon': Icons.clean_hands, 'name': 'clean_hands'},
    {'icon': Icons.clean_hands_outlined, 'name': 'clean_hands_outlined'},
    {'icon': Icons.clean_hands_rounded, 'name': 'clean_hands_rounded'},
    {'icon': Icons.clean_hands_sharp, 'name': 'clean_hands_sharp'},
    {'icon': Icons.cleaning_services, 'name': 'cleaning_services'},
    {
      'icon': Icons.cleaning_services_outlined,
      'name': 'cleaning_services_outlined'
    },
    {
      'icon': Icons.cleaning_services_rounded,
      'name': 'cleaning_services_rounded'
    },
    {'icon': Icons.cleaning_services_sharp, 'name': 'cleaning_services_sharp'},
    {'icon': Icons.clear, 'name': 'clear'},
    {'icon': Icons.clear_all, 'name': 'clear_all'},
    {'icon': Icons.clear_all_outlined, 'name': 'clear_all_outlined'},
    {'icon': Icons.clear_all_rounded, 'name': 'clear_all_rounded'},
    {'icon': Icons.clear_all_sharp, 'name': 'clear_all_sharp'},
    {'icon': Icons.clear_outlined, 'name': 'clear_outlined'},
    {'icon': Icons.clear_rounded, 'name': 'clear_rounded'},
    {'icon': Icons.clear_sharp, 'name': 'clear_sharp'},
    {'icon': Icons.close, 'name': 'close'},
    {'icon': Icons.close_fullscreen, 'name': 'close_fullscreen'},
    {
      'icon': Icons.close_fullscreen_outlined,
      'name': 'close_fullscreen_outlined'
    },
    {
      'icon': Icons.close_fullscreen_rounded,
      'name': 'close_fullscreen_rounded'
    },
    {'icon': Icons.close_fullscreen_sharp, 'name': 'close_fullscreen_sharp'},
    {'icon': Icons.close_outlined, 'name': 'close_outlined'},
    {'icon': Icons.close_rounded, 'name': 'close_rounded'},
    {'icon': Icons.close_sharp, 'name': 'close_sharp'},
    {'icon': Icons.closed_caption, 'name': 'closed_caption'},
    {'icon': Icons.closed_caption_disabled, 'name': 'closed_caption_disabled'},
    {
      'icon': Icons.closed_caption_disabled_outlined,
      'name': 'closed_caption_disabled_outlined'
    },
    {
      'icon': Icons.closed_caption_disabled_rounded,
      'name': 'closed_caption_disabled_rounded'
    },
    {
      'icon': Icons.closed_caption_disabled_sharp,
      'name': 'closed_caption_disabled_sharp'
    },
    {'icon': Icons.closed_caption_off, 'name': 'closed_caption_off'},
    {'icon': Icons.closed_caption_outlined, 'name': 'closed_caption_outlined'},
    {'icon': Icons.closed_caption_rounded, 'name': 'closed_caption_rounded'},
    {'icon': Icons.closed_caption_sharp, 'name': 'closed_caption_sharp'},
    {'icon': Icons.cloud, 'name': 'cloud'},
    {'icon': Icons.cloud_circle, 'name': 'cloud_circle'},
    {'icon': Icons.cloud_circle_outlined, 'name': 'cloud_circle_outlined'},
    {'icon': Icons.cloud_circle_rounded, 'name': 'cloud_circle_rounded'},
    {'icon': Icons.cloud_circle_sharp, 'name': 'cloud_circle_sharp'},
    {'icon': Icons.cloud_done, 'name': 'cloud_done'},
    {'icon': Icons.cloud_done_outlined, 'name': 'cloud_done_outlined'},
    {'icon': Icons.cloud_done_rounded, 'name': 'cloud_done_rounded'},
    {'icon': Icons.cloud_done_sharp, 'name': 'cloud_done_sharp'},
    {'icon': Icons.cloud_download, 'name': 'cloud_download'},
    {'icon': Icons.cloud_download_outlined, 'name': 'cloud_download_outlined'},
    {'icon': Icons.cloud_download_rounded, 'name': 'cloud_download_rounded'},
    {'icon': Icons.cloud_download_sharp, 'name': 'cloud_download_sharp'},
    {'icon': Icons.cloud_off, 'name': 'cloud_off'},
    {'icon': Icons.cloud_off_outlined, 'name': 'cloud_off_outlined'},
    {'icon': Icons.cloud_off_rounded, 'name': 'cloud_off_rounded'},
    {'icon': Icons.cloud_off_sharp, 'name': 'cloud_off_sharp'},
    {'icon': Icons.cloud_outlined, 'name': 'cloud_outlined'},
    {'icon': Icons.cloud_queue, 'name': 'cloud_queue'},
    {'icon': Icons.cloud_queue_outlined, 'name': 'cloud_queue_outlined'},
    {'icon': Icons.cloud_queue_rounded, 'name': 'cloud_queue_rounded'},
    {'icon': Icons.cloud_queue_sharp, 'name': 'cloud_queue_sharp'},
    {'icon': Icons.cloud_rounded, 'name': 'cloud_rounded'},
    {'icon': Icons.cloud_sharp, 'name': 'cloud_sharp'},
    {'icon': Icons.cloud_upload, 'name': 'cloud_upload'},
    {'icon': Icons.cloud_upload_outlined, 'name': 'cloud_upload_outlined'},
    {'icon': Icons.cloud_upload_rounded, 'name': 'cloud_upload_rounded'},
    {'icon': Icons.cloud_upload_sharp, 'name': 'cloud_upload_sharp'},
    {'icon': Icons.code, 'name': 'code'},
    {'icon': Icons.code_outlined, 'name': 'code_outlined'},
    {'icon': Icons.code_rounded, 'name': 'code_rounded'},
    {'icon': Icons.code_sharp, 'name': 'code_sharp'},
    {'icon': Icons.collections, 'name': 'collections'},
    {'icon': Icons.collections_bookmark, 'name': 'collections_bookmark'},
    {
      'icon': Icons.collections_bookmark_outlined,
      'name': 'collections_bookmark_outlined'
    },
    {
      'icon': Icons.collections_bookmark_rounded,
      'name': 'collections_bookmark_rounded'
    },
    {
      'icon': Icons.collections_bookmark_sharp,
      'name': 'collections_bookmark_sharp'
    },
    {'icon': Icons.collections_outlined, 'name': 'collections_outlined'},
    {'icon': Icons.collections_rounded, 'name': 'collections_rounded'},
    {'icon': Icons.collections_sharp, 'name': 'collections_sharp'},
    {'icon': Icons.color_lens, 'name': 'color_lens'},
    {'icon': Icons.color_lens_outlined, 'name': 'color_lens_outlined'},
    {'icon': Icons.color_lens_rounded, 'name': 'color_lens_rounded'},
    {'icon': Icons.color_lens_sharp, 'name': 'color_lens_sharp'},
    {'icon': Icons.colorize, 'name': 'colorize'},
    {'icon': Icons.colorize_outlined, 'name': 'colorize_outlined'},
    {'icon': Icons.colorize_rounded, 'name': 'colorize_rounded'},
    {'icon': Icons.colorize_sharp, 'name': 'colorize_sharp'},
    {'icon': Icons.comment, 'name': 'comment'},
    {'icon': Icons.comment_bank, 'name': 'comment_bank'},
    {'icon': Icons.comment_bank_outlined, 'name': 'comment_bank_outlined'},
    {'icon': Icons.comment_bank_rounded, 'name': 'comment_bank_rounded'},
    {'icon': Icons.comment_bank_sharp, 'name': 'comment_bank_sharp'},
    {'icon': Icons.comment_outlined, 'name': 'comment_outlined'},
    {'icon': Icons.comment_rounded, 'name': 'comment_rounded'},
    {'icon': Icons.comment_sharp, 'name': 'comment_sharp'},
    {'icon': Icons.commute, 'name': 'commute'},
    {'icon': Icons.commute_outlined, 'name': 'commute_outlined'},
    {'icon': Icons.commute_rounded, 'name': 'commute_rounded'},
    {'icon': Icons.commute_sharp, 'name': 'commute_sharp'},
    {'icon': Icons.compare, 'name': 'compare'},
    {'icon': Icons.compare_arrows, 'name': 'compare_arrows'},
    {'icon': Icons.compare_arrows_outlined, 'name': 'compare_arrows_outlined'},
    {'icon': Icons.compare_arrows_rounded, 'name': 'compare_arrows_rounded'},
    {'icon': Icons.compare_arrows_sharp, 'name': 'compare_arrows_sharp'},
    {'icon': Icons.compare_outlined, 'name': 'compare_outlined'},
    {'icon': Icons.compare_rounded, 'name': 'compare_rounded'},
    {'icon': Icons.compare_sharp, 'name': 'compare_sharp'},
    {'icon': Icons.compass_calibration, 'name': 'compass_calibration'},
    {
      'icon': Icons.compass_calibration_outlined,
      'name': 'compass_calibration_outlined'
    },
    {
      'icon': Icons.compass_calibration_rounded,
      'name': 'compass_calibration_rounded'
    },
    {
      'icon': Icons.compass_calibration_sharp,
      'name': 'compass_calibration_sharp'
    },
    {'icon': Icons.compress, 'name': 'compress'},
    {'icon': Icons.computer, 'name': 'computer'},
    {'icon': Icons.computer_outlined, 'name': 'computer_outlined'},
    {'icon': Icons.computer_rounded, 'name': 'computer_rounded'},
    {'icon': Icons.computer_sharp, 'name': 'computer_sharp'},
    {'icon': Icons.confirmation_num, 'name': 'confirmation_num'},
    {
      'icon': Icons.confirmation_num_outlined,
      'name': 'confirmation_num_outlined'
    },
    {
      'icon': Icons.confirmation_num_rounded,
      'name': 'confirmation_num_rounded'
    },
    {'icon': Icons.confirmation_num_sharp, 'name': 'confirmation_num_sharp'},
    {'icon': Icons.confirmation_number, 'name': 'confirmation_number'},
    {
      'icon': Icons.confirmation_number_outlined,
      'name': 'confirmation_number_outlined'
    },
    {
      'icon': Icons.confirmation_number_rounded,
      'name': 'confirmation_number_rounded'
    },
    {
      'icon': Icons.confirmation_number_sharp,
      'name': 'confirmation_number_sharp'
    },
    {'icon': Icons.connect_without_contact, 'name': 'connect_without_contact'},
    {
      'icon': Icons.connect_without_contact_outlined,
      'name': 'connect_without_contact_outlined'
    },
    {
      'icon': Icons.connect_without_contact_rounded,
      'name': 'connect_without_contact_rounded'
    },
    {
      'icon': Icons.connect_without_contact_sharp,
      'name': 'connect_without_contact_sharp'
    },
    {'icon': Icons.connected_tv, 'name': 'connected_tv'},
    {'icon': Icons.construction, 'name': 'construction'},
    {'icon': Icons.construction_outlined, 'name': 'construction_outlined'},
    {'icon': Icons.construction_rounded, 'name': 'construction_rounded'},
    {'icon': Icons.construction_sharp, 'name': 'construction_sharp'},
    {'icon': Icons.contact_mail, 'name': 'contact_mail'},
    {'icon': Icons.contact_mail_outlined, 'name': 'contact_mail_outlined'},
    {'icon': Icons.contact_mail_rounded, 'name': 'contact_mail_rounded'},
    {'icon': Icons.contact_mail_sharp, 'name': 'contact_mail_sharp'},
    {'icon': Icons.contact_page, 'name': 'contact_page'},
    {'icon': Icons.contact_page_outlined, 'name': 'contact_page_outlined'},
    {'icon': Icons.contact_page_rounded, 'name': 'contact_page_rounded'},
    {'icon': Icons.contact_page_sharp, 'name': 'contact_page_sharp'},
    {'icon': Icons.contact_phone, 'name': 'contact_phone'},
    {'icon': Icons.contact_phone_outlined, 'name': 'contact_phone_outlined'},
    {'icon': Icons.contact_phone_rounded, 'name': 'contact_phone_rounded'},
    {'icon': Icons.contact_phone_sharp, 'name': 'contact_phone_sharp'},
    {'icon': Icons.contact_support, 'name': 'contact_support'},
    {
      'icon': Icons.contact_support_outlined,
      'name': 'contact_support_outlined'
    },
    {'icon': Icons.contact_support_rounded, 'name': 'contact_support_rounded'},
    {'icon': Icons.contact_support_sharp, 'name': 'contact_support_sharp'},
    {'icon': Icons.contactless, 'name': 'contactless'},
    {'icon': Icons.contactless_outlined, 'name': 'contactless_outlined'},
    {'icon': Icons.contactless_rounded, 'name': 'contactless_rounded'},
    {'icon': Icons.contactless_sharp, 'name': 'contactless_sharp'},
    {'icon': Icons.contacts, 'name': 'contacts'},
    {'icon': Icons.contacts_outlined, 'name': 'contacts_outlined'},
    {'icon': Icons.contacts_rounded, 'name': 'contacts_rounded'},
    {'icon': Icons.contacts_sharp, 'name': 'contacts_sharp'},
    {'icon': Icons.content_copy, 'name': 'content_copy'},
    {'icon': Icons.content_copy_outlined, 'name': 'content_copy_outlined'},
    {'icon': Icons.content_copy_rounded, 'name': 'content_copy_rounded'},
    {'icon': Icons.content_copy_sharp, 'name': 'content_copy_sharp'},
    {'icon': Icons.content_cut, 'name': 'content_cut'},
    {'icon': Icons.content_cut_outlined, 'name': 'content_cut_outlined'},
    {'icon': Icons.content_cut_rounded, 'name': 'content_cut_rounded'},
    {'icon': Icons.content_cut_sharp, 'name': 'content_cut_sharp'},
    {'icon': Icons.content_paste, 'name': 'content_paste'},
    {'icon': Icons.content_paste_outlined, 'name': 'content_paste_outlined'},
    {'icon': Icons.content_paste_rounded, 'name': 'content_paste_rounded'},
    {'icon': Icons.content_paste_sharp, 'name': 'content_paste_sharp'},
    {'icon': Icons.control_camera, 'name': 'control_camera'},
    {'icon': Icons.control_camera_outlined, 'name': 'control_camera_outlined'},
    {'icon': Icons.control_camera_rounded, 'name': 'control_camera_rounded'},
    {'icon': Icons.control_camera_sharp, 'name': 'control_camera_sharp'},
    {'icon': Icons.control_point, 'name': 'control_point'},
    {'icon': Icons.control_point_duplicate, 'name': 'control_point_duplicate'},
    {
      'icon': Icons.control_point_duplicate_outlined,
      'name': 'control_point_duplicate_outlined'
    },
    {
      'icon': Icons.control_point_duplicate_rounded,
      'name': 'control_point_duplicate_rounded'
    },
    {
      'icon': Icons.control_point_duplicate_sharp,
      'name': 'control_point_duplicate_sharp'
    },
    {'icon': Icons.control_point_outlined, 'name': 'control_point_outlined'},
    {'icon': Icons.control_point_rounded, 'name': 'control_point_rounded'},
    {'icon': Icons.control_point_sharp, 'name': 'control_point_sharp'},
    {'icon': Icons.copy, 'name': 'copy'},
    {'icon': Icons.copy_outlined, 'name': 'copy_outlined'},
    {'icon': Icons.copy_rounded, 'name': 'copy_rounded'},
    {'icon': Icons.copy_sharp, 'name': 'copy_sharp'},
    {'icon': Icons.copyright, 'name': 'copyright'},
    {'icon': Icons.copyright_outlined, 'name': 'copyright_outlined'},
    {'icon': Icons.copyright_rounded, 'name': 'copyright_rounded'},
    {'icon': Icons.copyright_sharp, 'name': 'copyright_sharp'},
    {'icon': Icons.coronavirus, 'name': 'coronavirus'},
    {'icon': Icons.coronavirus_outlined, 'name': 'coronavirus_outlined'},
    {'icon': Icons.coronavirus_rounded, 'name': 'coronavirus_rounded'},
    {'icon': Icons.coronavirus_sharp, 'name': 'coronavirus_sharp'},
    {'icon': Icons.corporate_fare, 'name': 'corporate_fare'},
    {'icon': Icons.corporate_fare_outlined, 'name': 'corporate_fare_outlined'},
    {'icon': Icons.corporate_fare_rounded, 'name': 'corporate_fare_rounded'},
    {'icon': Icons.corporate_fare_sharp, 'name': 'corporate_fare_sharp'},
    {'icon': Icons.countertops, 'name': 'countertops'},
    {'icon': Icons.countertops_outlined, 'name': 'countertops_outlined'},
    {'icon': Icons.countertops_rounded, 'name': 'countertops_rounded'},
    {'icon': Icons.countertops_sharp, 'name': 'countertops_sharp'},
    {'icon': Icons.create, 'name': 'create'},
    {'icon': Icons.create_new_folder, 'name': 'create_new_folder'},
    {
      'icon': Icons.create_new_folder_outlined,
      'name': 'create_new_folder_outlined'
    },
    {
      'icon': Icons.create_new_folder_rounded,
      'name': 'create_new_folder_rounded'
    },
    {'icon': Icons.create_new_folder_sharp, 'name': 'create_new_folder_sharp'},
    {'icon': Icons.create_outlined, 'name': 'create_outlined'},
    {'icon': Icons.create_rounded, 'name': 'create_rounded'},
    {'icon': Icons.create_sharp, 'name': 'create_sharp'},
    {'icon': Icons.credit_card, 'name': 'credit_card'},
    {'icon': Icons.credit_card_outlined, 'name': 'credit_card_outlined'},
    {'icon': Icons.credit_card_rounded, 'name': 'credit_card_rounded'},
    {'icon': Icons.credit_card_sharp, 'name': 'credit_card_sharp'},
    {'icon': Icons.crop, 'name': 'crop'},
    {'icon': Icons.crop_3_2, 'name': 'crop_3_2'},
    {'icon': Icons.crop_3_2_outlined, 'name': 'crop_3_2_outlined'},
    {'icon': Icons.crop_3_2_rounded, 'name': 'crop_3_2_rounded'},
    {'icon': Icons.crop_3_2_sharp, 'name': 'crop_3_2_sharp'},
    {'icon': Icons.crop_5_4, 'name': 'crop_5_4'},
    {'icon': Icons.crop_5_4_outlined, 'name': 'crop_5_4_outlined'},
    {'icon': Icons.crop_5_4_rounded, 'name': 'crop_5_4_rounded'},
    {'icon': Icons.crop_5_4_sharp, 'name': 'crop_5_4_sharp'},
    {'icon': Icons.crop_7_5, 'name': 'crop_7_5'},
    {'icon': Icons.crop_7_5_outlined, 'name': 'crop_7_5_outlined'},
    {'icon': Icons.crop_7_5_rounded, 'name': 'crop_7_5_rounded'},
    {'icon': Icons.crop_7_5_sharp, 'name': 'crop_7_5_sharp'},
    {'icon': Icons.crop_16_9, 'name': 'crop_16_9'},
    {'icon': Icons.crop_16_9_outlined, 'name': 'crop_16_9_outlined'},
    {'icon': Icons.crop_16_9_rounded, 'name': 'crop_16_9_rounded'},
    {'icon': Icons.crop_16_9_sharp, 'name': 'crop_16_9_sharp'},
    {'icon': Icons.crop_din, 'name': 'crop_din'},
    {'icon': Icons.crop_din_outlined, 'name': 'crop_din_outlined'},
    {'icon': Icons.crop_din_rounded, 'name': 'crop_din_rounded'},
    {'icon': Icons.crop_din_sharp, 'name': 'crop_din_sharp'},
    {'icon': Icons.crop_free, 'name': 'crop_free'},
    {'icon': Icons.crop_free_outlined, 'name': 'crop_free_outlined'},
    {'icon': Icons.crop_free_rounded, 'name': 'crop_free_rounded'},
    {'icon': Icons.crop_free_sharp, 'name': 'crop_free_sharp'},
    {'icon': Icons.crop_landscape, 'name': 'crop_landscape'},
    {'icon': Icons.crop_landscape_outlined, 'name': 'crop_landscape_outlined'},
    {'icon': Icons.crop_landscape_rounded, 'name': 'crop_landscape_rounded'},
    {'icon': Icons.crop_landscape_sharp, 'name': 'crop_landscape_sharp'},
    {'icon': Icons.crop_original, 'name': 'crop_original'},
    {'icon': Icons.crop_original_outlined, 'name': 'crop_original_outlined'},
    {'icon': Icons.crop_original_rounded, 'name': 'crop_original_rounded'},
    {'icon': Icons.crop_original_sharp, 'name': 'crop_original_sharp'},
    {'icon': Icons.crop_outlined, 'name': 'crop_outlined'},
    {'icon': Icons.crop_portrait, 'name': 'crop_portrait'},
    {'icon': Icons.crop_portrait_outlined, 'name': 'crop_portrait_outlined'},
    {'icon': Icons.crop_portrait_rounded, 'name': 'crop_portrait_rounded'},
    {'icon': Icons.crop_portrait_sharp, 'name': 'crop_portrait_sharp'},
    {'icon': Icons.crop_rotate, 'name': 'crop_rotate'},
    {'icon': Icons.crop_rotate_outlined, 'name': 'crop_rotate_outlined'},
    {'icon': Icons.crop_rotate_rounded, 'name': 'crop_rotate_rounded'},
    {'icon': Icons.crop_rotate_sharp, 'name': 'crop_rotate_sharp'},
    {'icon': Icons.crop_rounded, 'name': 'crop_rounded'},
    {'icon': Icons.crop_sharp, 'name': 'crop_sharp'},
    {'icon': Icons.crop_square, 'name': 'crop_square'},
    {'icon': Icons.crop_square_outlined, 'name': 'crop_square_outlined'},
    {'icon': Icons.crop_square_rounded, 'name': 'crop_square_rounded'},
    {'icon': Icons.crop_square_sharp, 'name': 'crop_square_sharp'},
    {'icon': Icons.cut, 'name': 'cut'},
    {'icon': Icons.cut_outlined, 'name': 'cut_outlined'},
    {'icon': Icons.cut_rounded, 'name': 'cut_rounded'},
    {'icon': Icons.cut_sharp, 'name': 'cut_sharp'},
    {'icon': Icons.dangerous, 'name': 'dangerous'},
    {'icon': Icons.dashboard, 'name': 'dashboard'},
    {'icon': Icons.dashboard_customize, 'name': 'dashboard_customize'},
    {'icon': Icons.dashboard_outlined, 'name': 'dashboard_outlined'},
    {'icon': Icons.dashboard_rounded, 'name': 'dashboard_rounded'},
    {'icon': Icons.dashboard_sharp, 'name': 'dashboard_sharp'},
    {'icon': Icons.data_usage, 'name': 'data_usage'},
    {'icon': Icons.data_usage_outlined, 'name': 'data_usage_outlined'},
    {'icon': Icons.data_usage_rounded, 'name': 'data_usage_rounded'},
    {'icon': Icons.data_usage_sharp, 'name': 'data_usage_sharp'},
    {'icon': Icons.date_range, 'name': 'date_range'},
    {'icon': Icons.date_range_outlined, 'name': 'date_range_outlined'},
    {'icon': Icons.date_range_rounded, 'name': 'date_range_rounded'},
    {'icon': Icons.date_range_sharp, 'name': 'date_range_sharp'},
    {'icon': Icons.deck, 'name': 'deck'},
    {'icon': Icons.deck_outlined, 'name': 'deck_outlined'},
    {'icon': Icons.deck_rounded, 'name': 'deck_rounded'},
    {'icon': Icons.deck_sharp, 'name': 'deck_sharp'},
    {'icon': Icons.dehaze, 'name': 'dehaze'},
    {'icon': Icons.dehaze_outlined, 'name': 'dehaze_outlined'},
    {'icon': Icons.dehaze_rounded, 'name': 'dehaze_rounded'},
    {'icon': Icons.dehaze_sharp, 'name': 'dehaze_sharp'},
    {'icon': Icons.delete, 'name': 'delete'},
    {'icon': Icons.delete_forever, 'name': 'delete_forever'},
    {'icon': Icons.delete_forever_outlined, 'name': 'delete_forever_outlined'},
    {'icon': Icons.delete_forever_rounded, 'name': 'delete_forever_rounded'},
    {'icon': Icons.delete_forever_sharp, 'name': 'delete_forever_sharp'},
    {'icon': Icons.delete_outline, 'name': 'delete_outline'},
    {'icon': Icons.delete_outline_outlined, 'name': 'delete_outline_outlined'},
    {'icon': Icons.delete_outline_rounded, 'name': 'delete_outline_rounded'},
    {'icon': Icons.delete_outline_sharp, 'name': 'delete_outline_sharp'},
    {'icon': Icons.delete_outlined, 'name': 'delete_outlined'},
    {'icon': Icons.delete_rounded, 'name': 'delete_rounded'},
    {'icon': Icons.delete_sharp, 'name': 'delete_sharp'},
    {'icon': Icons.delete_sweep, 'name': 'delete_sweep'},
    {'icon': Icons.delete_sweep_outlined, 'name': 'delete_sweep_outlined'},
    {'icon': Icons.delete_sweep_rounded, 'name': 'delete_sweep_rounded'},
    {'icon': Icons.delete_sweep_sharp, 'name': 'delete_sweep_sharp'},
    {'icon': Icons.delivery_dining, 'name': 'delivery_dining'},
    {'icon': Icons.departure_board, 'name': 'departure_board'},
    {
      'icon': Icons.departure_board_outlined,
      'name': 'departure_board_outlined'
    },
    {'icon': Icons.departure_board_rounded, 'name': 'departure_board_rounded'},
    {'icon': Icons.departure_board_sharp, 'name': 'departure_board_sharp'},
    {'icon': Icons.description, 'name': 'description'},
    {'icon': Icons.description_outlined, 'name': 'description_outlined'},
    {'icon': Icons.description_rounded, 'name': 'description_rounded'},
    {'icon': Icons.description_sharp, 'name': 'description_sharp'},
    {'icon': Icons.design_services, 'name': 'design_services'},
    {
      'icon': Icons.design_services_outlined,
      'name': 'design_services_outlined'
    },
    {'icon': Icons.design_services_rounded, 'name': 'design_services_rounded'},
    {'icon': Icons.design_services_sharp, 'name': 'design_services_sharp'},
    {'icon': Icons.desktop_access_disabled, 'name': 'desktop_access_disabled'},
    {
      'icon': Icons.desktop_access_disabled_outlined,
      'name': 'desktop_access_disabled_outlined'
    },
    {
      'icon': Icons.desktop_access_disabled_rounded,
      'name': 'desktop_access_disabled_rounded'
    },
    {
      'icon': Icons.desktop_access_disabled_sharp,
      'name': 'desktop_access_disabled_sharp'
    },
    {'icon': Icons.desktop_mac, 'name': 'desktop_mac'},
    {'icon': Icons.desktop_mac_outlined, 'name': 'desktop_mac_outlined'},
    {'icon': Icons.desktop_mac_rounded, 'name': 'desktop_mac_rounded'},
    {'icon': Icons.desktop_mac_sharp, 'name': 'desktop_mac_sharp'},
    {'icon': Icons.desktop_windows, 'name': 'desktop_windows'},
    {
      'icon': Icons.desktop_windows_outlined,
      'name': 'desktop_windows_outlined'
    },
    {'icon': Icons.desktop_windows_rounded, 'name': 'desktop_windows_rounded'},
    {'icon': Icons.desktop_windows_sharp, 'name': 'desktop_windows_sharp'},
    {'icon': Icons.details, 'name': 'details'},
    {'icon': Icons.details_outlined, 'name': 'details_outlined'},
    {'icon': Icons.details_rounded, 'name': 'details_rounded'},
    {'icon': Icons.details_sharp, 'name': 'details_sharp'},
    {'icon': Icons.developer_board, 'name': 'developer_board'},
    {
      'icon': Icons.developer_board_outlined,
      'name': 'developer_board_outlined'
    },
    {'icon': Icons.developer_board_rounded, 'name': 'developer_board_rounded'},
    {'icon': Icons.developer_board_sharp, 'name': 'developer_board_sharp'},
    {'icon': Icons.developer_mode, 'name': 'developer_mode'},
    {'icon': Icons.developer_mode_outlined, 'name': 'developer_mode_outlined'},
    {'icon': Icons.developer_mode_rounded, 'name': 'developer_mode_rounded'},
    {'icon': Icons.developer_mode_sharp, 'name': 'developer_mode_sharp'},
    {'icon': Icons.device_hub, 'name': 'device_hub'},
    {'icon': Icons.device_hub_outlined, 'name': 'device_hub_outlined'},
    {'icon': Icons.device_hub_rounded, 'name': 'device_hub_rounded'},
    {'icon': Icons.device_hub_sharp, 'name': 'device_hub_sharp'},
    {'icon': Icons.device_thermostat, 'name': 'device_thermostat'},
    {'icon': Icons.device_unknown, 'name': 'device_unknown'},
    {'icon': Icons.device_unknown_outlined, 'name': 'device_unknown_outlined'},
    {'icon': Icons.device_unknown_rounded, 'name': 'device_unknown_rounded'},
    {'icon': Icons.device_unknown_sharp, 'name': 'device_unknown_sharp'},
    {'icon': Icons.devices, 'name': 'devices'},
    {'icon': Icons.devices_other, 'name': 'devices_other'},
    {'icon': Icons.devices_other_outlined, 'name': 'devices_other_outlined'},
    {'icon': Icons.devices_other_rounded, 'name': 'devices_other_rounded'},
    {'icon': Icons.devices_other_sharp, 'name': 'devices_other_sharp'},
    {'icon': Icons.devices_outlined, 'name': 'devices_outlined'},
    {'icon': Icons.devices_rounded, 'name': 'devices_rounded'},
    {'icon': Icons.devices_sharp, 'name': 'devices_sharp'},
    {'icon': Icons.dialer_sip, 'name': 'dialer_sip'},
    {'icon': Icons.dialer_sip_outlined, 'name': 'dialer_sip_outlined'},
    {'icon': Icons.dialer_sip_rounded, 'name': 'dialer_sip_rounded'},
    {'icon': Icons.dialer_sip_sharp, 'name': 'dialer_sip_sharp'},
    {'icon': Icons.dialpad, 'name': 'dialpad'},
    {'icon': Icons.dialpad_outlined, 'name': 'dialpad_outlined'},
    {'icon': Icons.dialpad_rounded, 'name': 'dialpad_rounded'},
    {'icon': Icons.dialpad_sharp, 'name': 'dialpad_sharp'},
    {'icon': Icons.dinner_dining, 'name': 'dinner_dining'},
    {'icon': Icons.directions, 'name': 'directions'},
    {'icon': Icons.directions_bike, 'name': 'directions_bike'},
    {
      'icon': Icons.directions_bike_outlined,
      'name': 'directions_bike_outlined'
    },
    {'icon': Icons.directions_bike_rounded, 'name': 'directions_bike_rounded'},
    {'icon': Icons.directions_bike_sharp, 'name': 'directions_bike_sharp'},
    {'icon': Icons.directions_boat, 'name': 'directions_boat'},
    {
      'icon': Icons.directions_boat_outlined,
      'name': 'directions_boat_outlined'
    },
    {'icon': Icons.directions_boat_rounded, 'name': 'directions_boat_rounded'},
    {'icon': Icons.directions_boat_sharp, 'name': 'directions_boat_sharp'},
    {'icon': Icons.directions_bus, 'name': 'directions_bus'},
    {'icon': Icons.directions_bus_outlined, 'name': 'directions_bus_outlined'},
    {'icon': Icons.directions_bus_rounded, 'name': 'directions_bus_rounded'},
    {'icon': Icons.directions_bus_sharp, 'name': 'directions_bus_sharp'},
    {'icon': Icons.directions_car, 'name': 'directions_car'},
    {'icon': Icons.directions_car_outlined, 'name': 'directions_car_outlined'},
    {'icon': Icons.directions_car_rounded, 'name': 'directions_car_rounded'},
    {'icon': Icons.directions_car_sharp, 'name': 'directions_car_sharp'},
    {'icon': Icons.directions_ferry, 'name': 'directions_ferry'},
    {
      'icon': Icons.directions_ferry_outlined,
      'name': 'directions_ferry_outlined'
    },
    {
      'icon': Icons.directions_ferry_rounded,
      'name': 'directions_ferry_rounded'
    },
    {'icon': Icons.directions_ferry_sharp, 'name': 'directions_ferry_sharp'},
    {'icon': Icons.directions_off, 'name': 'directions_off'},
    {'icon': Icons.directions_off_outlined, 'name': 'directions_off_outlined'},
    {'icon': Icons.directions_off_rounded, 'name': 'directions_off_rounded'},
    {'icon': Icons.directions_off_sharp, 'name': 'directions_off_sharp'},
    {'icon': Icons.directions_outlined, 'name': 'directions_outlined'},
    {'icon': Icons.directions_railway, 'name': 'directions_railway'},
    {
      'icon': Icons.directions_railway_outlined,
      'name': 'directions_railway_outlined'
    },
    {
      'icon': Icons.directions_railway_rounded,
      'name': 'directions_railway_rounded'
    },
    {
      'icon': Icons.directions_railway_sharp,
      'name': 'directions_railway_sharp'
    },
    {'icon': Icons.directions_rounded, 'name': 'directions_rounded'},
    {'icon': Icons.directions_run, 'name': 'directions_run'},
    {'icon': Icons.directions_run_outlined, 'name': 'directions_run_outlined'},
    {'icon': Icons.directions_run_rounded, 'name': 'directions_run_rounded'},
    {'icon': Icons.directions_run_sharp, 'name': 'directions_run_sharp'},
    {'icon': Icons.directions_sharp, 'name': 'directions_sharp'},
    {'icon': Icons.directions_subway, 'name': 'directions_subway'},
    {
      'icon': Icons.directions_subway_outlined,
      'name': 'directions_subway_outlined'
    },
    {
      'icon': Icons.directions_subway_rounded,
      'name': 'directions_subway_rounded'
    },
    {'icon': Icons.directions_subway_sharp, 'name': 'directions_subway_sharp'},
    {'icon': Icons.directions_train, 'name': 'directions_train'},
    {
      'icon': Icons.directions_train_outlined,
      'name': 'directions_train_outlined'
    },
    {
      'icon': Icons.directions_train_rounded,
      'name': 'directions_train_rounded'
    },
    {'icon': Icons.directions_train_sharp, 'name': 'directions_train_sharp'},
    {'icon': Icons.directions_transit, 'name': 'directions_transit'},
    {
      'icon': Icons.directions_transit_outlined,
      'name': 'directions_transit_outlined'
    },
    {
      'icon': Icons.directions_transit_rounded,
      'name': 'directions_transit_rounded'
    },
    {
      'icon': Icons.directions_transit_sharp,
      'name': 'directions_transit_sharp'
    },
    {'icon': Icons.directions_walk, 'name': 'directions_walk'},
    {
      'icon': Icons.directions_walk_outlined,
      'name': 'directions_walk_outlined'
    },
    {'icon': Icons.directions_walk_rounded, 'name': 'directions_walk_rounded'},
    {'icon': Icons.directions_walk_sharp, 'name': 'directions_walk_sharp'},
    {'icon': Icons.dirty_lens, 'name': 'dirty_lens'},
    {'icon': Icons.disc_full, 'name': 'disc_full'},
    {'icon': Icons.disc_full_outlined, 'name': 'disc_full_outlined'},
    {'icon': Icons.disc_full_rounded, 'name': 'disc_full_rounded'},
    {'icon': Icons.disc_full_sharp, 'name': 'disc_full_sharp'},
    {'icon': Icons.dnd_forwardslash, 'name': 'dnd_forwardslash'},
    {'icon': Icons.dns, 'name': 'dns'},
    {'icon': Icons.dns_outlined, 'name': 'dns_outlined'},
    {'icon': Icons.dns_rounded, 'name': 'dns_rounded'},
    {'icon': Icons.dns_sharp, 'name': 'dns_sharp'},
    {'icon': Icons.do_disturb_alt_outlined, 'name': 'do_disturb_alt_outlined'},
    {'icon': Icons.do_disturb_alt_rounded, 'name': 'do_disturb_alt_rounded'},
    {'icon': Icons.do_disturb_alt_sharp, 'name': 'do_disturb_alt_sharp'},
    {'icon': Icons.do_disturb_off_outlined, 'name': 'do_disturb_off_outlined'},
    {'icon': Icons.do_disturb_off_rounded, 'name': 'do_disturb_off_rounded'},
    {'icon': Icons.do_disturb_off_sharp, 'name': 'do_disturb_off_sharp'},
    {'icon': Icons.do_disturb_on_outlined, 'name': 'do_disturb_on_outlined'},
    {'icon': Icons.do_disturb_on_rounded, 'name': 'do_disturb_on_rounded'},
    {'icon': Icons.do_disturb_on_sharp, 'name': 'do_disturb_on_sharp'},
    {'icon': Icons.do_disturb_outlined, 'name': 'do_disturb_outlined'},
    {'icon': Icons.do_disturb_rounded, 'name': 'do_disturb_rounded'},
    {'icon': Icons.do_disturb_sharp, 'name': 'do_disturb_sharp'},
    {'icon': Icons.do_not_disturb, 'name': 'do_not_disturb'},
    {'icon': Icons.do_not_disturb_alt, 'name': 'do_not_disturb_alt'},
    {'icon': Icons.do_not_disturb_off, 'name': 'do_not_disturb_off'},
    {'icon': Icons.do_not_disturb_on, 'name': 'do_not_disturb_on'},
    {'icon': Icons.do_not_step, 'name': 'do_not_step'},
    {'icon': Icons.do_not_step_outlined, 'name': 'do_not_step_outlined'},
    {'icon': Icons.do_not_step_rounded, 'name': 'do_not_step_rounded'},
    {'icon': Icons.do_not_step_sharp, 'name': 'do_not_step_sharp'},
    {'icon': Icons.do_not_touch, 'name': 'do_not_touch'},
    {'icon': Icons.do_not_touch_outlined, 'name': 'do_not_touch_outlined'},
    {'icon': Icons.do_not_touch_rounded, 'name': 'do_not_touch_rounded'},
    {'icon': Icons.do_not_touch_sharp, 'name': 'do_not_touch_sharp'},
    {'icon': Icons.dock, 'name': 'dock'},
    {'icon': Icons.dock_outlined, 'name': 'dock_outlined'},
    {'icon': Icons.dock_rounded, 'name': 'dock_rounded'},
    {'icon': Icons.dock_sharp, 'name': 'dock_sharp'},
    {'icon': Icons.domain, 'name': 'domain'},
    {'icon': Icons.domain_disabled, 'name': 'domain_disabled'},
    {
      'icon': Icons.domain_disabled_outlined,
      'name': 'domain_disabled_outlined'
    },
    {'icon': Icons.domain_disabled_rounded, 'name': 'domain_disabled_rounded'},
    {'icon': Icons.domain_disabled_sharp, 'name': 'domain_disabled_sharp'},
    {'icon': Icons.domain_outlined, 'name': 'domain_outlined'},
    {'icon': Icons.domain_rounded, 'name': 'domain_rounded'},
    {'icon': Icons.domain_sharp, 'name': 'domain_sharp'},
    {'icon': Icons.domain_verification, 'name': 'domain_verification'},
    {
      'icon': Icons.domain_verification_outlined,
      'name': 'domain_verification_outlined'
    },
    {
      'icon': Icons.domain_verification_rounded,
      'name': 'domain_verification_rounded'
    },
    {
      'icon': Icons.domain_verification_sharp,
      'name': 'domain_verification_sharp'
    },
    {'icon': Icons.done, 'name': 'done'},
    {'icon': Icons.done_all, 'name': 'done_all'},
    {'icon': Icons.done_all_outlined, 'name': 'done_all_outlined'},
    {'icon': Icons.done_all_rounded, 'name': 'done_all_rounded'},
    {'icon': Icons.done_all_sharp, 'name': 'done_all_sharp'},
    {'icon': Icons.done_outline, 'name': 'done_outline'},
    {'icon': Icons.done_outline_outlined, 'name': 'done_outline_outlined'},
    {'icon': Icons.done_outline_rounded, 'name': 'done_outline_rounded'},
    {'icon': Icons.done_outline_sharp, 'name': 'done_outline_sharp'},
    {'icon': Icons.done_outlined, 'name': 'done_outlined'},
    {'icon': Icons.done_rounded, 'name': 'done_rounded'},
    {'icon': Icons.done_sharp, 'name': 'done_sharp'},
    {'icon': Icons.donut_large, 'name': 'donut_large'},
    {'icon': Icons.donut_large_outlined, 'name': 'donut_large_outlined'},
    {'icon': Icons.donut_large_rounded, 'name': 'donut_large_rounded'},
    {'icon': Icons.donut_large_sharp, 'name': 'donut_large_sharp'},
    {'icon': Icons.donut_small, 'name': 'donut_small'},
    {'icon': Icons.donut_small_outlined, 'name': 'donut_small_outlined'},
    {'icon': Icons.donut_small_rounded, 'name': 'donut_small_rounded'},
    {'icon': Icons.donut_small_sharp, 'name': 'donut_small_sharp'},
    {'icon': Icons.double_arrow, 'name': 'double_arrow'},
    {'icon': Icons.double_arrow_outlined, 'name': 'double_arrow_outlined'},
    {'icon': Icons.double_arrow_rounded, 'name': 'double_arrow_rounded'},
    {'icon': Icons.double_arrow_sharp, 'name': 'double_arrow_sharp'},
    {'icon': Icons.download_done_outlined, 'name': 'download_done_outlined'},
    {'icon': Icons.download_done_rounded, 'name': 'download_done_rounded'},
    {'icon': Icons.download_done_sharp, 'name': 'download_done_sharp'},
    {'icon': Icons.download_outlined, 'name': 'download_outlined'},
    {'icon': Icons.download_rounded, 'name': 'download_rounded'},
    {'icon': Icons.download_sharp, 'name': 'download_sharp'},
    {'icon': Icons.drafts, 'name': 'drafts'},
    {'icon': Icons.drafts_outlined, 'name': 'drafts_outlined'},
    {'icon': Icons.drafts_rounded, 'name': 'drafts_rounded'},
    {'icon': Icons.drafts_sharp, 'name': 'drafts_sharp'},
    {'icon': Icons.drag_handle, 'name': 'drag_handle'},
    {'icon': Icons.drag_handle_outlined, 'name': 'drag_handle_outlined'},
    {'icon': Icons.drag_handle_rounded, 'name': 'drag_handle_rounded'},
    {'icon': Icons.drag_handle_sharp, 'name': 'drag_handle_sharp'},
    {'icon': Icons.drag_indicator, 'name': 'drag_indicator'},
    {'icon': Icons.drag_indicator_outlined, 'name': 'drag_indicator_outlined'},
    {'icon': Icons.drag_indicator_rounded, 'name': 'drag_indicator_rounded'},
    {'icon': Icons.drag_indicator_sharp, 'name': 'drag_indicator_sharp'},
    {'icon': Icons.drive_eta, 'name': 'drive_eta'},
    {'icon': Icons.drive_eta_outlined, 'name': 'drive_eta_outlined'},
    {'icon': Icons.drive_eta_rounded, 'name': 'drive_eta_rounded'},
    {'icon': Icons.drive_eta_sharp, 'name': 'drive_eta_sharp'},
    {'icon': Icons.drive_file_move, 'name': 'drive_file_move'},
    {'icon': Icons.drive_file_move_outline, 'name': 'drive_file_move_outline'},
    {
      'icon': Icons.drive_file_rename_outline,
      'name': 'drive_file_rename_outline'
    },
    {'icon': Icons.drive_folder_upload, 'name': 'drive_folder_upload'},
    {'icon': Icons.dry, 'name': 'dry'},
    {'icon': Icons.dry_cleaning, 'name': 'dry_cleaning'},
    {'icon': Icons.dry_outlined, 'name': 'dry_outlined'},
    {'icon': Icons.dry_rounded, 'name': 'dry_rounded'},
    {'icon': Icons.dry_sharp, 'name': 'dry_sharp'},
    {'icon': Icons.duo, 'name': 'duo'},
    {'icon': Icons.duo_outlined, 'name': 'duo_outlined'},
    {'icon': Icons.duo_rounded, 'name': 'duo_rounded'},
    {'icon': Icons.duo_sharp, 'name': 'duo_sharp'},
    {'icon': Icons.dvr, 'name': 'dvr'},
    {'icon': Icons.dvr_outlined, 'name': 'dvr_outlined'},
    {'icon': Icons.dvr_rounded, 'name': 'dvr_rounded'},
    {'icon': Icons.dvr_sharp, 'name': 'dvr_sharp'},
    {'icon': Icons.dynamic_feed, 'name': 'dynamic_feed'},
    {'icon': Icons.dynamic_feed_outlined, 'name': 'dynamic_feed_outlined'},
    {'icon': Icons.dynamic_feed_rounded, 'name': 'dynamic_feed_rounded'},
    {'icon': Icons.dynamic_feed_sharp, 'name': 'dynamic_feed_sharp'},
    {'icon': Icons.dynamic_form, 'name': 'dynamic_form'},
    {'icon': Icons.dynamic_form_outlined, 'name': 'dynamic_form_outlined'},
    {'icon': Icons.dynamic_form_rounded, 'name': 'dynamic_form_rounded'},
    {'icon': Icons.dynamic_form_sharp, 'name': 'dynamic_form_sharp'},
    {'icon': Icons.east, 'name': 'east'},
    {'icon': Icons.east_outlined, 'name': 'east_outlined'},
    {'icon': Icons.east_rounded, 'name': 'east_rounded'},
    {'icon': Icons.east_sharp, 'name': 'east_sharp'},
    {'icon': Icons.eco, 'name': 'eco'},
    {'icon': Icons.eco_outlined, 'name': 'eco_outlined'},
    {'icon': Icons.eco_rounded, 'name': 'eco_rounded'},
    {'icon': Icons.eco_sharp, 'name': 'eco_sharp'},
    {'icon': Icons.edit, 'name': 'edit'},
    {'icon': Icons.edit_attributes, 'name': 'edit_attributes'},
    {
      'icon': Icons.edit_attributes_outlined,
      'name': 'edit_attributes_outlined'
    },
    {'icon': Icons.edit_attributes_rounded, 'name': 'edit_attributes_rounded'},
    {'icon': Icons.edit_attributes_sharp, 'name': 'edit_attributes_sharp'},
    {'icon': Icons.edit_location, 'name': 'edit_location'},
    {'icon': Icons.edit_location_outlined, 'name': 'edit_location_outlined'},
    {'icon': Icons.edit_location_rounded, 'name': 'edit_location_rounded'},
    {'icon': Icons.edit_location_sharp, 'name': 'edit_location_sharp'},
    {'icon': Icons.edit_off, 'name': 'edit_off'},
    {'icon': Icons.edit_outlined, 'name': 'edit_outlined'},
    {'icon': Icons.edit_road, 'name': 'edit_road'},
    {'icon': Icons.edit_road_outlined, 'name': 'edit_road_outlined'},
    {'icon': Icons.edit_road_rounded, 'name': 'edit_road_rounded'},
    {'icon': Icons.edit_road_sharp, 'name': 'edit_road_sharp'},
    {'icon': Icons.edit_rounded, 'name': 'edit_rounded'},
    {'icon': Icons.edit_sharp, 'name': 'edit_sharp'},
    {'icon': Icons.eight_k, 'name': 'eight_k'},
    {'icon': Icons.eight_k_plus, 'name': 'eight_k_plus'},
    {'icon': Icons.eight_mp, 'name': 'eight_mp'},
    {'icon': Icons.eighteen_mp, 'name': 'eighteen_mp'},
    {'icon': Icons.eject, 'name': 'eject'},
    {'icon': Icons.eject_outlined, 'name': 'eject_outlined'},
    {'icon': Icons.eject_rounded, 'name': 'eject_rounded'},
    {'icon': Icons.eject_sharp, 'name': 'eject_sharp'},
    {'icon': Icons.elderly, 'name': 'elderly'},
    {'icon': Icons.elderly_outlined, 'name': 'elderly_outlined'},
    {'icon': Icons.elderly_rounded, 'name': 'elderly_rounded'},
    {'icon': Icons.elderly_sharp, 'name': 'elderly_sharp'},
    {'icon': Icons.electric_bike, 'name': 'electric_bike'},
    {'icon': Icons.electric_bike_outlined, 'name': 'electric_bike_outlined'},
    {'icon': Icons.electric_bike_rounded, 'name': 'electric_bike_rounded'},
    {'icon': Icons.electric_bike_sharp, 'name': 'electric_bike_sharp'},
    {'icon': Icons.electric_car, 'name': 'electric_car'},
    {'icon': Icons.electric_car_outlined, 'name': 'electric_car_outlined'},
    {'icon': Icons.electric_car_rounded, 'name': 'electric_car_rounded'},
    {'icon': Icons.electric_car_sharp, 'name': 'electric_car_sharp'},
    {'icon': Icons.electric_moped, 'name': 'electric_moped'},
    {'icon': Icons.electric_moped_outlined, 'name': 'electric_moped_outlined'},
    {'icon': Icons.electric_moped_rounded, 'name': 'electric_moped_rounded'},
    {'icon': Icons.electric_moped_sharp, 'name': 'electric_moped_sharp'},
    {'icon': Icons.electric_rickshaw, 'name': 'electric_rickshaw'},
    {
      'icon': Icons.electric_rickshaw_rounded,
      'name': 'electric_rickshaw_rounded'
    },
    {'icon': Icons.electric_rickshaw_sharp, 'name': 'electric_rickshaw_sharp'},
    {'icon': Icons.electric_scooter, 'name': 'electric_scooter'},
    {
      'icon': Icons.electric_scooter_outlined,
      'name': 'electric_scooter_outlined'
    },
    {
      'icon': Icons.electric_scooter_rounded,
      'name': 'electric_scooter_rounded'
    },
    {'icon': Icons.electric_scooter_sharp, 'name': 'electric_scooter_sharp'},
    {'icon': Icons.electrical_services, 'name': 'electrical_services'},
    {
      'icon': Icons.electrical_services_outlined,
      'name': 'electrical_services_outlined'
    },
    {
      'icon': Icons.electrical_services_rounded,
      'name': 'electrical_services_rounded'
    },
    {
      'icon': Icons.electrical_services_sharp,
      'name': 'electrical_services_sharp'
    },
    {'icon': Icons.elevator, 'name': 'elevator'},
    {'icon': Icons.elevator_outlined, 'name': 'elevator_outlined'},
    {'icon': Icons.elevator_rounded, 'name': 'elevator_rounded'},
    {'icon': Icons.elevator_sharp, 'name': 'elevator_sharp'},
    {'icon': Icons.eleven_mp, 'name': 'eleven_mp'},
    {'icon': Icons.email, 'name': 'email'},
    {'icon': Icons.email_outlined, 'name': 'email_outlined'},
    {'icon': Icons.email_rounded, 'name': 'email_rounded'},
    {'icon': Icons.email_sharp, 'name': 'email_sharp'},
    {'icon': Icons.emoji_emotions, 'name': 'emoji_emotions'},
    {'icon': Icons.emoji_emotions_outlined, 'name': 'emoji_emotions_outlined'},
    {'icon': Icons.emoji_emotions_rounded, 'name': 'emoji_emotions_rounded'},
    {'icon': Icons.emoji_emotions_sharp, 'name': 'emoji_emotions_sharp'},
    {'icon': Icons.emoji_events, 'name': 'emoji_events'},
    {'icon': Icons.emoji_events_outlined, 'name': 'emoji_events_outlined'},
    {'icon': Icons.emoji_events_rounded, 'name': 'emoji_events_rounded'},
    {'icon': Icons.emoji_events_sharp, 'name': 'emoji_events_sharp'},
    {'icon': Icons.emoji_flags, 'name': 'emoji_flags'},
    {'icon': Icons.emoji_flags_outlined, 'name': 'emoji_flags_outlined'},
    {'icon': Icons.emoji_flags_rounded, 'name': 'emoji_flags_rounded'},
    {'icon': Icons.emoji_flags_sharp, 'name': 'emoji_flags_sharp'},
    {'icon': Icons.emoji_food_beverage, 'name': 'emoji_food_beverage'},
    {
      'icon': Icons.emoji_food_beverage_outlined,
      'name': 'emoji_food_beverage_outlined'
    },
    {
      'icon': Icons.emoji_food_beverage_rounded,
      'name': 'emoji_food_beverage_rounded'
    },
    {
      'icon': Icons.emoji_food_beverage_sharp,
      'name': 'emoji_food_beverage_sharp'
    },
    {'icon': Icons.emoji_nature, 'name': 'emoji_nature'},
    {'icon': Icons.emoji_nature_outlined, 'name': 'emoji_nature_outlined'},
    {'icon': Icons.emoji_nature_rounded, 'name': 'emoji_nature_rounded'},
    {'icon': Icons.emoji_nature_sharp, 'name': 'emoji_nature_sharp'},
    {'icon': Icons.emoji_objects, 'name': 'emoji_objects'},
    {'icon': Icons.emoji_objects_outlined, 'name': 'emoji_objects_outlined'},
    {'icon': Icons.emoji_objects_rounded, 'name': 'emoji_objects_rounded'},
    {'icon': Icons.emoji_objects_sharp, 'name': 'emoji_objects_sharp'},
    {'icon': Icons.emoji_people, 'name': 'emoji_people'},
    {'icon': Icons.emoji_people_outlined, 'name': 'emoji_people_outlined'},
    {'icon': Icons.emoji_people_rounded, 'name': 'emoji_people_rounded'},
    {'icon': Icons.emoji_people_sharp, 'name': 'emoji_people_sharp'},
    {'icon': Icons.emoji_symbols, 'name': 'emoji_symbols'},
    {'icon': Icons.emoji_symbols_outlined, 'name': 'emoji_symbols_outlined'},
    {'icon': Icons.emoji_symbols_rounded, 'name': 'emoji_symbols_rounded'},
    {'icon': Icons.emoji_symbols_sharp, 'name': 'emoji_symbols_sharp'},
    {'icon': Icons.emoji_transportation, 'name': 'emoji_transportation'},
    {
      'icon': Icons.emoji_transportation_outlined,
      'name': 'emoji_transportation_outlined'
    },
    {
      'icon': Icons.emoji_transportation_rounded,
      'name': 'emoji_transportation_rounded'
    },
    {
      'icon': Icons.emoji_transportation_sharp,
      'name': 'emoji_transportation_sharp'
    },
    {'icon': Icons.engineering, 'name': 'engineering'},
    {'icon': Icons.engineering_outlined, 'name': 'engineering_outlined'},
    {'icon': Icons.engineering_rounded, 'name': 'engineering_rounded'},
    {'icon': Icons.engineering_sharp, 'name': 'engineering_sharp'},
    {'icon': Icons.enhance_photo_translate, 'name': 'enhance_photo_translate'},
    {
      'icon': Icons.enhance_photo_translate_outlined,
      'name': 'enhance_photo_translate_outlined'
    },
    {
      'icon': Icons.enhance_photo_translate_rounded,
      'name': 'enhance_photo_translate_rounded'
    },
    {
      'icon': Icons.enhance_photo_translate_sharp,
      'name': 'enhance_photo_translate_sharp'
    },
    {'icon': Icons.enhanced_encryption, 'name': 'enhanced_encryption'},
    {
      'icon': Icons.enhanced_encryption_outlined,
      'name': 'enhanced_encryption_outlined'
    },
    {
      'icon': Icons.enhanced_encryption_rounded,
      'name': 'enhanced_encryption_rounded'
    },
    {
      'icon': Icons.enhanced_encryption_sharp,
      'name': 'enhanced_encryption_sharp'
    },
    {'icon': Icons.equalizer, 'name': 'equalizer'},
    {'icon': Icons.equalizer_outlined, 'name': 'equalizer_outlined'},
    {'icon': Icons.equalizer_rounded, 'name': 'equalizer_rounded'},
    {'icon': Icons.equalizer_sharp, 'name': 'equalizer_sharp'},
    {'icon': Icons.error, 'name': 'error'},
    {'icon': Icons.error_outline, 'name': 'error_outline'},
    {'icon': Icons.error_outline_outlined, 'name': 'error_outline_outlined'},
    {'icon': Icons.error_outline_rounded, 'name': 'error_outline_rounded'},
    {'icon': Icons.error_outline_sharp, 'name': 'error_outline_sharp'},
    {'icon': Icons.error_outlined, 'name': 'error_outlined'},
    {'icon': Icons.error_rounded, 'name': 'error_rounded'},
    {'icon': Icons.error_sharp, 'name': 'error_sharp'},
    {'icon': Icons.escalator, 'name': 'escalator'},
    {'icon': Icons.escalator_outlined, 'name': 'escalator_outlined'},
    {'icon': Icons.escalator_rounded, 'name': 'escalator_rounded'},
    {'icon': Icons.escalator_sharp, 'name': 'escalator_sharp'},
    {'icon': Icons.escalator_warning, 'name': 'escalator_warning'},
    {
      'icon': Icons.escalator_warning_outlined,
      'name': 'escalator_warning_outlined'
    },
    {
      'icon': Icons.escalator_warning_rounded,
      'name': 'escalator_warning_rounded'
    },
    {'icon': Icons.escalator_warning_sharp, 'name': 'escalator_warning_sharp'},
    {'icon': Icons.euro, 'name': 'euro'},
    {'icon': Icons.euro_outlined, 'name': 'euro_outlined'},
    {'icon': Icons.euro_rounded, 'name': 'euro_rounded'},
    {'icon': Icons.euro_sharp, 'name': 'euro_sharp'},
    {'icon': Icons.euro_symbol, 'name': 'euro_symbol'},
    {'icon': Icons.euro_symbol_outlined, 'name': 'euro_symbol_outlined'},
    {'icon': Icons.euro_symbol_rounded, 'name': 'euro_symbol_rounded'},
    {'icon': Icons.euro_symbol_sharp, 'name': 'euro_symbol_sharp'},
    {'icon': Icons.ev_station, 'name': 'ev_station'},
    {'icon': Icons.ev_station_outlined, 'name': 'ev_station_outlined'},
    {'icon': Icons.ev_station_rounded, 'name': 'ev_station_rounded'},
    {'icon': Icons.ev_station_sharp, 'name': 'ev_station_sharp'},
    {'icon': Icons.event, 'name': 'event'},
    {'icon': Icons.event_available, 'name': 'event_available'},
    {
      'icon': Icons.event_available_outlined,
      'name': 'event_available_outlined'
    },
    {'icon': Icons.event_available_rounded, 'name': 'event_available_rounded'},
    {'icon': Icons.event_available_sharp, 'name': 'event_available_sharp'},
    {'icon': Icons.event_busy, 'name': 'event_busy'},
    {'icon': Icons.event_busy_outlined, 'name': 'event_busy_outlined'},
    {'icon': Icons.event_busy_rounded, 'name': 'event_busy_rounded'},
    {'icon': Icons.event_busy_sharp, 'name': 'event_busy_sharp'},
    {'icon': Icons.event_note, 'name': 'event_note'},
    {'icon': Icons.event_note_outlined, 'name': 'event_note_outlined'},
    {'icon': Icons.event_note_rounded, 'name': 'event_note_rounded'},
    {'icon': Icons.event_note_sharp, 'name': 'event_note_sharp'},
    {'icon': Icons.event_outlined, 'name': 'event_outlined'},
    {'icon': Icons.event_rounded, 'name': 'event_rounded'},
    {'icon': Icons.event_seat, 'name': 'event_seat'},
    {'icon': Icons.event_seat_outlined, 'name': 'event_seat_outlined'},
    {'icon': Icons.event_seat_rounded, 'name': 'event_seat_rounded'},
    {'icon': Icons.event_seat_sharp, 'name': 'event_seat_sharp'},
    {'icon': Icons.event_sharp, 'name': 'event_sharp'},
    {'icon': Icons.exit_to_app, 'name': 'exit_to_app'},
    {'icon': Icons.exit_to_app_outlined, 'name': 'exit_to_app_outlined'},
    {'icon': Icons.exit_to_app_rounded, 'name': 'exit_to_app_rounded'},
    {'icon': Icons.exit_to_app_sharp, 'name': 'exit_to_app_sharp'},
    {'icon': Icons.expand, 'name': 'expand'},
    {'icon': Icons.expand_less, 'name': 'expand_less'},
    {'icon': Icons.expand_less_outlined, 'name': 'expand_less_outlined'},
    {'icon': Icons.expand_less_rounded, 'name': 'expand_less_rounded'},
    {'icon': Icons.expand_less_sharp, 'name': 'expand_less_sharp'},
    {'icon': Icons.expand_more, 'name': 'expand_more'},
    {'icon': Icons.expand_more_outlined, 'name': 'expand_more_outlined'},
    {'icon': Icons.expand_more_rounded, 'name': 'expand_more_rounded'},
    {'icon': Icons.expand_more_sharp, 'name': 'expand_more_sharp'},
    {'icon': Icons.explicit, 'name': 'explicit'},
    {'icon': Icons.explicit_outlined, 'name': 'explicit_outlined'},
    {'icon': Icons.explicit_rounded, 'name': 'explicit_rounded'},
    {'icon': Icons.explicit_sharp, 'name': 'explicit_sharp'},
    {'icon': Icons.explore, 'name': 'explore'},
    {'icon': Icons.explore_off, 'name': 'explore_off'},
    {'icon': Icons.explore_off_outlined, 'name': 'explore_off_outlined'},
    {'icon': Icons.explore_off_rounded, 'name': 'explore_off_rounded'},
    {'icon': Icons.explore_off_sharp, 'name': 'explore_off_sharp'},
    {'icon': Icons.explore_outlined, 'name': 'explore_outlined'},
    {'icon': Icons.explore_rounded, 'name': 'explore_rounded'},
    {'icon': Icons.explore_sharp, 'name': 'explore_sharp'},
    {'icon': Icons.exposure, 'name': 'exposure'},
    {'icon': Icons.exposure_minus_1, 'name': 'exposure_minus_1'},
    {
      'icon': Icons.exposure_minus_1_outlined,
      'name': 'exposure_minus_1_outlined'
    },
    {
      'icon': Icons.exposure_minus_1_rounded,
      'name': 'exposure_minus_1_rounded'
    },
    {'icon': Icons.exposure_minus_1_sharp, 'name': 'exposure_minus_1_sharp'},
    {'icon': Icons.exposure_minus_2, 'name': 'exposure_minus_2'},
    {
      'icon': Icons.exposure_minus_2_outlined,
      'name': 'exposure_minus_2_outlined'
    },
    {
      'icon': Icons.exposure_minus_2_rounded,
      'name': 'exposure_minus_2_rounded'
    },
    {'icon': Icons.exposure_minus_2_sharp, 'name': 'exposure_minus_2_sharp'},
    {'icon': Icons.exposure_neg_1, 'name': 'exposure_neg_1'},
    {'icon': Icons.exposure_neg_1_outlined, 'name': 'exposure_neg_1_outlined'},
    {'icon': Icons.exposure_neg_1_rounded, 'name': 'exposure_neg_1_rounded'},
    {'icon': Icons.exposure_neg_1_sharp, 'name': 'exposure_neg_1_sharp'},
    {'icon': Icons.exposure_neg_2, 'name': 'exposure_neg_2'},
    {'icon': Icons.exposure_neg_2_outlined, 'name': 'exposure_neg_2_outlined'},
    {'icon': Icons.exposure_neg_2_rounded, 'name': 'exposure_neg_2_rounded'},
    {'icon': Icons.exposure_neg_2_sharp, 'name': 'exposure_neg_2_sharp'},
    {'icon': Icons.exposure_outlined, 'name': 'exposure_outlined'},
    {'icon': Icons.exposure_plus_1, 'name': 'exposure_plus_1'},
    {
      'icon': Icons.exposure_plus_1_outlined,
      'name': 'exposure_plus_1_outlined'
    },
    {'icon': Icons.exposure_plus_1_rounded, 'name': 'exposure_plus_1_rounded'},
    {'icon': Icons.exposure_plus_1_sharp, 'name': 'exposure_plus_1_sharp'},
    {'icon': Icons.exposure_plus_2, 'name': 'exposure_plus_2'},
    {
      'icon': Icons.exposure_plus_2_outlined,
      'name': 'exposure_plus_2_outlined'
    },
    {'icon': Icons.exposure_plus_2_rounded, 'name': 'exposure_plus_2_rounded'},
    {'icon': Icons.exposure_plus_2_sharp, 'name': 'exposure_plus_2_sharp'},
    {'icon': Icons.exposure_rounded, 'name': 'exposure_rounded'},
    {'icon': Icons.exposure_sharp, 'name': 'exposure_sharp'},
    {'icon': Icons.exposure_zero, 'name': 'exposure_zero'},
    {'icon': Icons.exposure_zero_outlined, 'name': 'exposure_zero_outlined'},
    {'icon': Icons.exposure_zero_rounded, 'name': 'exposure_zero_rounded'},
    {'icon': Icons.exposure_zero_sharp, 'name': 'exposure_zero_sharp'},
    {'icon': Icons.extension, 'name': 'extension'},
    {'icon': Icons.extension_outlined, 'name': 'extension_outlined'},
    {'icon': Icons.extension_rounded, 'name': 'extension_rounded'},
    {'icon': Icons.extension_sharp, 'name': 'extension_sharp'},
    {'icon': Icons.face, 'name': 'face'},
    {'icon': Icons.face_outlined, 'name': 'face_outlined'},
    {'icon': Icons.face_retouching_natural, 'name': 'face_retouching_natural'},
    {'icon': Icons.face_rounded, 'name': 'face_rounded'},
    {'icon': Icons.face_sharp, 'name': 'face_sharp'},
    {'icon': Icons.face_unlock_outlined, 'name': 'face_unlock_outlined'},
    {'icon': Icons.face_unlock_rounded, 'name': 'face_unlock_rounded'},
    {'icon': Icons.face_unlock_sharp, 'name': 'face_unlock_sharp'},
    {'icon': Icons.fact_check, 'name': 'fact_check'},
    {'icon': Icons.fact_check_outlined, 'name': 'fact_check_outlined'},
    {'icon': Icons.fact_check_rounded, 'name': 'fact_check_rounded'},
    {'icon': Icons.fact_check_sharp, 'name': 'fact_check_sharp'},
    {'icon': Icons.family_restroom, 'name': 'family_restroom'},
    {
      'icon': Icons.family_restroom_outlined,
      'name': 'family_restroom_outlined'
    },
    {'icon': Icons.family_restroom_rounded, 'name': 'family_restroom_rounded'},
    {'icon': Icons.family_restroom_sharp, 'name': 'family_restroom_sharp'},
    {'icon': Icons.fast_forward, 'name': 'fast_forward'},
    {'icon': Icons.fast_forward_outlined, 'name': 'fast_forward_outlined'},
    {'icon': Icons.fast_forward_rounded, 'name': 'fast_forward_rounded'},
    {'icon': Icons.fast_forward_sharp, 'name': 'fast_forward_sharp'},
    {'icon': Icons.fast_rewind, 'name': 'fast_rewind'},
    {'icon': Icons.fast_rewind_outlined, 'name': 'fast_rewind_outlined'},
    {'icon': Icons.fast_rewind_rounded, 'name': 'fast_rewind_rounded'},
    {'icon': Icons.fast_rewind_sharp, 'name': 'fast_rewind_sharp'},
    {'icon': Icons.fastfood, 'name': 'fastfood'},
    {'icon': Icons.fastfood_outlined, 'name': 'fastfood_outlined'},
    {'icon': Icons.fastfood_rounded, 'name': 'fastfood_rounded'},
    {'icon': Icons.fastfood_sharp, 'name': 'fastfood_sharp'},
    {'icon': Icons.favorite, 'name': 'favorite'},
    {'icon': Icons.favorite_border, 'name': 'favorite_border'},
    {
      'icon': Icons.favorite_border_outlined,
      'name': 'favorite_border_outlined'
    },
    {'icon': Icons.favorite_border_rounded, 'name': 'favorite_border_rounded'},
    {'icon': Icons.favorite_border_sharp, 'name': 'favorite_border_sharp'},
    {'icon': Icons.favorite_outline, 'name': 'favorite_outline'},
    {
      'icon': Icons.favorite_outline_outlined,
      'name': 'favorite_outline_outlined'
    },
    {
      'icon': Icons.favorite_outline_rounded,
      'name': 'favorite_outline_rounded'
    },
    {'icon': Icons.favorite_outline_sharp, 'name': 'favorite_outline_sharp'},
    {'icon': Icons.favorite_outlined, 'name': 'favorite_outlined'},
    {'icon': Icons.favorite_rounded, 'name': 'favorite_rounded'},
    {'icon': Icons.favorite_sharp, 'name': 'favorite_sharp'},
    {'icon': Icons.featured_play_list, 'name': 'featured_play_list'},
    {
      'icon': Icons.featured_play_list_outlined,
      'name': 'featured_play_list_outlined'
    },
    {
      'icon': Icons.featured_play_list_rounded,
      'name': 'featured_play_list_rounded'
    },
    {
      'icon': Icons.featured_play_list_sharp,
      'name': 'featured_play_list_sharp'
    },
    {'icon': Icons.featured_video, 'name': 'featured_video'},
    {'icon': Icons.featured_video_outlined, 'name': 'featured_video_outlined'},
    {'icon': Icons.featured_video_rounded, 'name': 'featured_video_rounded'},
    {'icon': Icons.featured_video_sharp, 'name': 'featured_video_sharp'},
    {'icon': Icons.feedback, 'name': 'feedback'},
    {'icon': Icons.feedback_outlined, 'name': 'feedback_outlined'},
    {'icon': Icons.feedback_rounded, 'name': 'feedback_rounded'},
    {'icon': Icons.feedback_sharp, 'name': 'feedback_sharp'},
    {'icon': Icons.fence, 'name': 'fence'},
    {'icon': Icons.fence_outlined, 'name': 'fence_outlined'},
    {'icon': Icons.fence_rounded, 'name': 'fence_rounded'},
    {'icon': Icons.fence_sharp, 'name': 'fence_sharp'},
    {'icon': Icons.festival, 'name': 'festival'},
    {'icon': Icons.fiber_dvr, 'name': 'fiber_dvr'},
    {'icon': Icons.fiber_dvr_outlined, 'name': 'fiber_dvr_outlined'},
    {'icon': Icons.fiber_dvr_rounded, 'name': 'fiber_dvr_rounded'},
    {'icon': Icons.fiber_dvr_sharp, 'name': 'fiber_dvr_sharp'},
    {'icon': Icons.fiber_manual_record, 'name': 'fiber_manual_record'},
    {
      'icon': Icons.fiber_manual_record_outlined,
      'name': 'fiber_manual_record_outlined'
    },
    {
      'icon': Icons.fiber_manual_record_rounded,
      'name': 'fiber_manual_record_rounded'
    },
    {
      'icon': Icons.fiber_manual_record_sharp,
      'name': 'fiber_manual_record_sharp'
    },
    {'icon': Icons.fiber_new, 'name': 'fiber_new'},
    {'icon': Icons.fiber_new_outlined, 'name': 'fiber_new_outlined'},
    {'icon': Icons.fiber_new_rounded, 'name': 'fiber_new_rounded'},
    {'icon': Icons.fiber_new_sharp, 'name': 'fiber_new_sharp'},
    {'icon': Icons.fiber_pin, 'name': 'fiber_pin'},
    {'icon': Icons.fiber_pin_outlined, 'name': 'fiber_pin_outlined'},
    {'icon': Icons.fiber_pin_rounded, 'name': 'fiber_pin_rounded'},
    {'icon': Icons.fiber_pin_sharp, 'name': 'fiber_pin_sharp'},
    {'icon': Icons.fiber_smart_record, 'name': 'fiber_smart_record'},
    {
      'icon': Icons.fiber_smart_record_outlined,
      'name': 'fiber_smart_record_outlined'
    },
    {
      'icon': Icons.fiber_smart_record_rounded,
      'name': 'fiber_smart_record_rounded'
    },
    {
      'icon': Icons.fiber_smart_record_sharp,
      'name': 'fiber_smart_record_sharp'
    },
    {'icon': Icons.fifteen_mp, 'name': 'fifteen_mp'},
    {'icon': Icons.file_copy, 'name': 'file_copy'},
    {'icon': Icons.file_copy_outlined, 'name': 'file_copy_outlined'},
    {'icon': Icons.file_copy_rounded, 'name': 'file_copy_rounded'},
    {'icon': Icons.file_copy_sharp, 'name': 'file_copy_sharp'},
    {'icon': Icons.file_download, 'name': 'file_download'},
    {'icon': Icons.file_download_done, 'name': 'file_download_done'},
    {'icon': Icons.file_present, 'name': 'file_present'},
    {'icon': Icons.file_upload, 'name': 'file_upload'},
    {'icon': Icons.filter, 'name': 'filter'},
    {'icon': Icons.filter_1, 'name': 'filter_1'},
    {'icon': Icons.filter_1_outlined, 'name': 'filter_1_outlined'},
    {'icon': Icons.filter_1_rounded, 'name': 'filter_1_rounded'},
    {'icon': Icons.filter_1_sharp, 'name': 'filter_1_sharp'},
    {'icon': Icons.filter_2, 'name': 'filter_2'},
    {'icon': Icons.filter_2_outlined, 'name': 'filter_2_outlined'},
    {'icon': Icons.filter_2_rounded, 'name': 'filter_2_rounded'},
    {'icon': Icons.filter_2_sharp, 'name': 'filter_2_sharp'},
    {'icon': Icons.filter_3, 'name': 'filter_3'},
    {'icon': Icons.filter_3_outlined, 'name': 'filter_3_outlined'},
    {'icon': Icons.filter_3_rounded, 'name': 'filter_3_rounded'},
    {'icon': Icons.filter_3_sharp, 'name': 'filter_3_sharp'},
    {'icon': Icons.filter_4, 'name': 'filter_4'},
    {'icon': Icons.filter_4_outlined, 'name': 'filter_4_outlined'},
    {'icon': Icons.filter_4_rounded, 'name': 'filter_4_rounded'},
    {'icon': Icons.filter_4_sharp, 'name': 'filter_4_sharp'},
    {'icon': Icons.filter_5, 'name': 'filter_5'},
    {'icon': Icons.filter_5_outlined, 'name': 'filter_5_outlined'},
    {'icon': Icons.filter_5_rounded, 'name': 'filter_5_rounded'},
    {'icon': Icons.filter_5_sharp, 'name': 'filter_5_sharp'},
    {'icon': Icons.filter_6, 'name': 'filter_6'},
    {'icon': Icons.filter_6_outlined, 'name': 'filter_6_outlined'},
    {'icon': Icons.filter_6_rounded, 'name': 'filter_6_rounded'},
    {'icon': Icons.filter_6_sharp, 'name': 'filter_6_sharp'},
    {'icon': Icons.filter_7, 'name': 'filter_7'},
    {'icon': Icons.filter_7_outlined, 'name': 'filter_7_outlined'},
    {'icon': Icons.filter_7_rounded, 'name': 'filter_7_rounded'},
    {'icon': Icons.filter_7_sharp, 'name': 'filter_7_sharp'},
    {'icon': Icons.filter_8, 'name': 'filter_8'},
    {'icon': Icons.filter_8_outlined, 'name': 'filter_8_outlined'},
    {'icon': Icons.filter_8_rounded, 'name': 'filter_8_rounded'},
    {'icon': Icons.filter_8_sharp, 'name': 'filter_8_sharp'},
    {'icon': Icons.filter_9, 'name': 'filter_9'},
    {'icon': Icons.filter_9_outlined, 'name': 'filter_9_outlined'},
    {'icon': Icons.filter_9_plus, 'name': 'filter_9_plus'},
    {'icon': Icons.filter_9_plus_outlined, 'name': 'filter_9_plus_outlined'},
    {'icon': Icons.filter_9_plus_rounded, 'name': 'filter_9_plus_rounded'},
    {'icon': Icons.filter_9_plus_sharp, 'name': 'filter_9_plus_sharp'},
    {'icon': Icons.filter_9_rounded, 'name': 'filter_9_rounded'},
    {'icon': Icons.filter_9_sharp, 'name': 'filter_9_sharp'},
    {'icon': Icons.filter_alt, 'name': 'filter_alt'},
    {'icon': Icons.filter_alt_outlined, 'name': 'filter_alt_outlined'},
    {'icon': Icons.filter_alt_rounded, 'name': 'filter_alt_rounded'},
    {'icon': Icons.filter_alt_sharp, 'name': 'filter_alt_sharp'},
    {'icon': Icons.filter_b_and_w, 'name': 'filter_b_and_w'},
    {'icon': Icons.filter_b_and_w_outlined, 'name': 'filter_b_and_w_outlined'},
    {'icon': Icons.filter_b_and_w_rounded, 'name': 'filter_b_and_w_rounded'},
    {'icon': Icons.filter_b_and_w_sharp, 'name': 'filter_b_and_w_sharp'},
    {'icon': Icons.filter_center_focus, 'name': 'filter_center_focus'},
    {
      'icon': Icons.filter_center_focus_outlined,
      'name': 'filter_center_focus_outlined'
    },
    {
      'icon': Icons.filter_center_focus_rounded,
      'name': 'filter_center_focus_rounded'
    },
    {
      'icon': Icons.filter_center_focus_sharp,
      'name': 'filter_center_focus_sharp'
    },
    {'icon': Icons.filter_drama, 'name': 'filter_drama'},
    {'icon': Icons.filter_drama_outlined, 'name': 'filter_drama_outlined'},
    {'icon': Icons.filter_drama_rounded, 'name': 'filter_drama_rounded'},
    {'icon': Icons.filter_drama_sharp, 'name': 'filter_drama_sharp'},
    {'icon': Icons.filter_frames, 'name': 'filter_frames'},
    {'icon': Icons.filter_frames_outlined, 'name': 'filter_frames_outlined'},
    {'icon': Icons.filter_frames_rounded, 'name': 'filter_frames_rounded'},
    {'icon': Icons.filter_frames_sharp, 'name': 'filter_frames_sharp'},
    {'icon': Icons.filter_hdr, 'name': 'filter_hdr'},
    {'icon': Icons.filter_hdr_outlined, 'name': 'filter_hdr_outlined'},
    {'icon': Icons.filter_hdr_rounded, 'name': 'filter_hdr_rounded'},
    {'icon': Icons.filter_hdr_sharp, 'name': 'filter_hdr_sharp'},
    {'icon': Icons.filter_list, 'name': 'filter_list'},
    {'icon': Icons.filter_list_alt, 'name': 'filter_list_alt'},
    {'icon': Icons.filter_list_outlined, 'name': 'filter_list_outlined'},
    {'icon': Icons.filter_list_rounded, 'name': 'filter_list_rounded'},
    {'icon': Icons.filter_list_sharp, 'name': 'filter_list_sharp'},
    {'icon': Icons.filter_none, 'name': 'filter_none'},
    {'icon': Icons.filter_none_outlined, 'name': 'filter_none_outlined'},
    {'icon': Icons.filter_none_rounded, 'name': 'filter_none_rounded'},
    {'icon': Icons.filter_none_sharp, 'name': 'filter_none_sharp'},
    {'icon': Icons.filter_outlined, 'name': 'filter_outlined'},
    {'icon': Icons.filter_rounded, 'name': 'filter_rounded'},
    {'icon': Icons.filter_sharp, 'name': 'filter_sharp'},
    {'icon': Icons.filter_tilt_shift, 'name': 'filter_tilt_shift'},
    {
      'icon': Icons.filter_tilt_shift_outlined,
      'name': 'filter_tilt_shift_outlined'
    },
    {
      'icon': Icons.filter_tilt_shift_rounded,
      'name': 'filter_tilt_shift_rounded'
    },
    {'icon': Icons.filter_tilt_shift_sharp, 'name': 'filter_tilt_shift_sharp'},
    {'icon': Icons.filter_vintage, 'name': 'filter_vintage'},
    {'icon': Icons.filter_vintage_outlined, 'name': 'filter_vintage_outlined'},
    {'icon': Icons.filter_vintage_rounded, 'name': 'filter_vintage_rounded'},
    {'icon': Icons.filter_vintage_sharp, 'name': 'filter_vintage_sharp'},
    {'icon': Icons.find_in_page, 'name': 'find_in_page'},
    {'icon': Icons.find_in_page_outlined, 'name': 'find_in_page_outlined'},
    {'icon': Icons.find_in_page_rounded, 'name': 'find_in_page_rounded'},
    {'icon': Icons.find_in_page_sharp, 'name': 'find_in_page_sharp'},
    {'icon': Icons.find_replace, 'name': 'find_replace'},
    {'icon': Icons.find_replace_outlined, 'name': 'find_replace_outlined'},
    {'icon': Icons.find_replace_rounded, 'name': 'find_replace_rounded'},
    {'icon': Icons.find_replace_sharp, 'name': 'find_replace_sharp'},
    {'icon': Icons.fingerprint, 'name': 'fingerprint'},
    {'icon': Icons.fingerprint_outlined, 'name': 'fingerprint_outlined'},
    {'icon': Icons.fingerprint_rounded, 'name': 'fingerprint_rounded'},
    {'icon': Icons.fingerprint_sharp, 'name': 'fingerprint_sharp'},
    {'icon': Icons.fire_extinguisher, 'name': 'fire_extinguisher'},
    {
      'icon': Icons.fire_extinguisher_outlined,
      'name': 'fire_extinguisher_outlined'
    },
    {
      'icon': Icons.fire_extinguisher_rounded,
      'name': 'fire_extinguisher_rounded'
    },
    {'icon': Icons.fire_extinguisher_sharp, 'name': 'fire_extinguisher_sharp'},
    {'icon': Icons.fire_hydrant, 'name': 'fire_hydrant'},
    {'icon': Icons.fireplace, 'name': 'fireplace'},
    {'icon': Icons.fireplace_outlined, 'name': 'fireplace_outlined'},
    {'icon': Icons.fireplace_rounded, 'name': 'fireplace_rounded'},
    {'icon': Icons.fireplace_sharp, 'name': 'fireplace_sharp'},
    {'icon': Icons.first_page, 'name': 'first_page'},
    {'icon': Icons.first_page_outlined, 'name': 'first_page_outlined'},
    {'icon': Icons.first_page_rounded, 'name': 'first_page_rounded'},
    {'icon': Icons.first_page_sharp, 'name': 'first_page_sharp'},
    {'icon': Icons.fit_screen, 'name': 'fit_screen'},
    {'icon': Icons.fitness_center, 'name': 'fitness_center'},
    {'icon': Icons.fitness_center_outlined, 'name': 'fitness_center_outlined'},
    {'icon': Icons.fitness_center_rounded, 'name': 'fitness_center_rounded'},
    {'icon': Icons.fitness_center_sharp, 'name': 'fitness_center_sharp'},
    {'icon': Icons.five_g, 'name': 'five_g'},
    {'icon': Icons.five_g_outlined, 'name': 'five_g_outlined'},
    {'icon': Icons.five_g_rounded, 'name': 'five_g_rounded'},
    {'icon': Icons.five_g_sharp, 'name': 'five_g_sharp'},
    {'icon': Icons.five_k, 'name': 'five_k'},
    {'icon': Icons.five_k_plus, 'name': 'five_k_plus'},
    {'icon': Icons.five_mp, 'name': 'five_mp'},
    {'icon': Icons.flag, 'name': 'flag'},
    {'icon': Icons.flag_outlined, 'name': 'flag_outlined'},
    {'icon': Icons.flag_rounded, 'name': 'flag_rounded'},
    {'icon': Icons.flag_sharp, 'name': 'flag_sharp'},
    {'icon': Icons.flaky, 'name': 'flaky'},
    {'icon': Icons.flaky_outlined, 'name': 'flaky_outlined'},
    {'icon': Icons.flaky_rounded, 'name': 'flaky_rounded'},
    {'icon': Icons.flaky_sharp, 'name': 'flaky_sharp'},
    {'icon': Icons.flare, 'name': 'flare'},
    {'icon': Icons.flare_outlined, 'name': 'flare_outlined'},
    {'icon': Icons.flare_rounded, 'name': 'flare_rounded'},
    {'icon': Icons.flare_sharp, 'name': 'flare_sharp'},
    {'icon': Icons.flash_auto, 'name': 'flash_auto'},
    {'icon': Icons.flash_auto_outlined, 'name': 'flash_auto_outlined'},
    {'icon': Icons.flash_auto_rounded, 'name': 'flash_auto_rounded'},
    {'icon': Icons.flash_auto_sharp, 'name': 'flash_auto_sharp'},
    {'icon': Icons.flash_off, 'name': 'flash_off'},
    {'icon': Icons.flash_off_outlined, 'name': 'flash_off_outlined'},
    {'icon': Icons.flash_off_rounded, 'name': 'flash_off_rounded'},
    {'icon': Icons.flash_off_sharp, 'name': 'flash_off_sharp'},
    {'icon': Icons.flash_on, 'name': 'flash_on'},
    {'icon': Icons.flash_on_outlined, 'name': 'flash_on_outlined'},
    {'icon': Icons.flash_on_rounded, 'name': 'flash_on_rounded'},
    {'icon': Icons.flash_on_sharp, 'name': 'flash_on_sharp'},
    {'icon': Icons.flight, 'name': 'flight'},
    {'icon': Icons.flight_land, 'name': 'flight_land'},
    {'icon': Icons.flight_land_outlined, 'name': 'flight_land_outlined'},
    {'icon': Icons.flight_land_rounded, 'name': 'flight_land_rounded'},
    {'icon': Icons.flight_land_sharp, 'name': 'flight_land_sharp'},
    {'icon': Icons.flight_outlined, 'name': 'flight_outlined'},
    {'icon': Icons.flight_rounded, 'name': 'flight_rounded'},
    {'icon': Icons.flight_sharp, 'name': 'flight_sharp'},
    {'icon': Icons.flight_takeoff, 'name': 'flight_takeoff'},
    {'icon': Icons.flight_takeoff_outlined, 'name': 'flight_takeoff_outlined'},
    {'icon': Icons.flight_takeoff_rounded, 'name': 'flight_takeoff_rounded'},
    {'icon': Icons.flight_takeoff_sharp, 'name': 'flight_takeoff_sharp'},
    {'icon': Icons.flip, 'name': 'flip'},
    {'icon': Icons.flip_camera_android, 'name': 'flip_camera_android'},
    {
      'icon': Icons.flip_camera_android_outlined,
      'name': 'flip_camera_android_outlined'
    },
    {
      'icon': Icons.flip_camera_android_rounded,
      'name': 'flip_camera_android_rounded'
    },
    {
      'icon': Icons.flip_camera_android_sharp,
      'name': 'flip_camera_android_sharp'
    },
    {'icon': Icons.flip_camera_ios, 'name': 'flip_camera_ios'},
    {
      'icon': Icons.flip_camera_ios_outlined,
      'name': 'flip_camera_ios_outlined'
    },
    {'icon': Icons.flip_camera_ios_rounded, 'name': 'flip_camera_ios_rounded'},
    {'icon': Icons.flip_camera_ios_sharp, 'name': 'flip_camera_ios_sharp'},
    {'icon': Icons.flip_outlined, 'name': 'flip_outlined'},
    {'icon': Icons.flip_rounded, 'name': 'flip_rounded'},
    {'icon': Icons.flip_sharp, 'name': 'flip_sharp'},
    {'icon': Icons.flip_to_back, 'name': 'flip_to_back'},
    {'icon': Icons.flip_to_back_outlined, 'name': 'flip_to_back_outlined'},
    {'icon': Icons.flip_to_back_rounded, 'name': 'flip_to_back_rounded'},
    {'icon': Icons.flip_to_back_sharp, 'name': 'flip_to_back_sharp'},
    {'icon': Icons.flip_to_front, 'name': 'flip_to_front'},
    {'icon': Icons.flip_to_front_outlined, 'name': 'flip_to_front_outlined'},
    {'icon': Icons.flip_to_front_rounded, 'name': 'flip_to_front_rounded'},
    {'icon': Icons.flip_to_front_sharp, 'name': 'flip_to_front_sharp'},
    {'icon': Icons.folder, 'name': 'folder'},
    {'icon': Icons.folder_open, 'name': 'folder_open'},
    {'icon': Icons.folder_open_outlined, 'name': 'folder_open_outlined'},
    {'icon': Icons.folder_open_rounded, 'name': 'folder_open_rounded'},
    {'icon': Icons.folder_open_sharp, 'name': 'folder_open_sharp'},
    {'icon': Icons.folder_outlined, 'name': 'folder_outlined'},
    {'icon': Icons.folder_rounded, 'name': 'folder_rounded'},
    {'icon': Icons.folder_shared, 'name': 'folder_shared'},
    {'icon': Icons.folder_shared_outlined, 'name': 'folder_shared_outlined'},
    {'icon': Icons.folder_shared_rounded, 'name': 'folder_shared_rounded'},
    {'icon': Icons.folder_shared_sharp, 'name': 'folder_shared_sharp'},
    {'icon': Icons.folder_sharp, 'name': 'folder_sharp'},
    {'icon': Icons.folder_special, 'name': 'folder_special'},
    {'icon': Icons.folder_special_outlined, 'name': 'folder_special_outlined'},
    {'icon': Icons.folder_special_rounded, 'name': 'folder_special_rounded'},
    {'icon': Icons.folder_special_sharp, 'name': 'folder_special_sharp'},
    {'icon': Icons.follow_the_signs, 'name': 'follow_the_signs'},
    {
      'icon': Icons.follow_the_signs_outlined,
      'name': 'follow_the_signs_outlined'
    },
    {
      'icon': Icons.follow_the_signs_rounded,
      'name': 'follow_the_signs_rounded'
    },
    {'icon': Icons.follow_the_signs_sharp, 'name': 'follow_the_signs_sharp'},
    {'icon': Icons.font_download, 'name': 'font_download'},
    {'icon': Icons.font_download_outlined, 'name': 'font_download_outlined'},
    {'icon': Icons.font_download_rounded, 'name': 'font_download_rounded'},
    {'icon': Icons.font_download_sharp, 'name': 'font_download_sharp'},
    {'icon': Icons.food_bank, 'name': 'food_bank'},
    {'icon': Icons.food_bank_outlined, 'name': 'food_bank_outlined'},
    {'icon': Icons.food_bank_rounded, 'name': 'food_bank_rounded'},
    {'icon': Icons.food_bank_sharp, 'name': 'food_bank_sharp'},
    {'icon': Icons.format_align_center, 'name': 'format_align_center'},
    {
      'icon': Icons.format_align_center_outlined,
      'name': 'format_align_center_outlined'
    },
    {
      'icon': Icons.format_align_center_rounded,
      'name': 'format_align_center_rounded'
    },
    {
      'icon': Icons.format_align_center_sharp,
      'name': 'format_align_center_sharp'
    },
    {'icon': Icons.format_align_justify, 'name': 'format_align_justify'},
    {
      'icon': Icons.format_align_justify_outlined,
      'name': 'format_align_justify_outlined'
    },
    {
      'icon': Icons.format_align_justify_rounded,
      'name': 'format_align_justify_rounded'
    },
    {
      'icon': Icons.format_align_justify_sharp,
      'name': 'format_align_justify_sharp'
    },
    {'icon': Icons.format_align_left, 'name': 'format_align_left'},
    {
      'icon': Icons.format_align_left_outlined,
      'name': 'format_align_left_outlined'
    },
    {
      'icon': Icons.format_align_left_rounded,
      'name': 'format_align_left_rounded'
    },
    {'icon': Icons.format_align_left_sharp, 'name': 'format_align_left_sharp'},
    {'icon': Icons.format_align_right, 'name': 'format_align_right'},
    {
      'icon': Icons.format_align_right_outlined,
      'name': 'format_align_right_outlined'
    },
    {
      'icon': Icons.format_align_right_rounded,
      'name': 'format_align_right_rounded'
    },
    {
      'icon': Icons.format_align_right_sharp,
      'name': 'format_align_right_sharp'
    },
    {'icon': Icons.format_bold, 'name': 'format_bold'},
    {'icon': Icons.format_bold_outlined, 'name': 'format_bold_outlined'},
    {'icon': Icons.format_bold_rounded, 'name': 'format_bold_rounded'},
    {'icon': Icons.format_bold_sharp, 'name': 'format_bold_sharp'},
    {'icon': Icons.format_clear, 'name': 'format_clear'},
    {'icon': Icons.format_clear_outlined, 'name': 'format_clear_outlined'},
    {'icon': Icons.format_clear_rounded, 'name': 'format_clear_rounded'},
    {'icon': Icons.format_clear_sharp, 'name': 'format_clear_sharp'},
    {'icon': Icons.format_color_fill, 'name': 'format_color_fill'},
    {'icon': Icons.format_color_reset, 'name': 'format_color_reset'},
    {
      'icon': Icons.format_color_reset_outlined,
      'name': 'format_color_reset_outlined'
    },
    {
      'icon': Icons.format_color_reset_rounded,
      'name': 'format_color_reset_rounded'
    },
    {
      'icon': Icons.format_color_reset_sharp,
      'name': 'format_color_reset_sharp'
    },
    {'icon': Icons.format_color_text, 'name': 'format_color_text'},
    {'icon': Icons.format_indent_decrease, 'name': 'format_indent_decrease'},
    {
      'icon': Icons.format_indent_decrease_outlined,
      'name': 'format_indent_decrease_outlined'
    },
    {
      'icon': Icons.format_indent_decrease_rounded,
      'name': 'format_indent_decrease_rounded'
    },
    {
      'icon': Icons.format_indent_decrease_sharp,
      'name': 'format_indent_decrease_sharp'
    },
    {'icon': Icons.format_indent_increase, 'name': 'format_indent_increase'},
    {
      'icon': Icons.format_indent_increase_outlined,
      'name': 'format_indent_increase_outlined'
    },
    {
      'icon': Icons.format_indent_increase_rounded,
      'name': 'format_indent_increase_rounded'
    },
    {
      'icon': Icons.format_indent_increase_sharp,
      'name': 'format_indent_increase_sharp'
    },
    {'icon': Icons.format_italic, 'name': 'format_italic'},
    {'icon': Icons.format_italic_outlined, 'name': 'format_italic_outlined'},
    {'icon': Icons.format_italic_rounded, 'name': 'format_italic_rounded'},
    {'icon': Icons.format_italic_sharp, 'name': 'format_italic_sharp'},
    {'icon': Icons.format_line_spacing, 'name': 'format_line_spacing'},
    {
      'icon': Icons.format_line_spacing_outlined,
      'name': 'format_line_spacing_outlined'
    },
    {
      'icon': Icons.format_line_spacing_rounded,
      'name': 'format_line_spacing_rounded'
    },
    {
      'icon': Icons.format_line_spacing_sharp,
      'name': 'format_line_spacing_sharp'
    },
    {'icon': Icons.format_list_bulleted, 'name': 'format_list_bulleted'},
    {
      'icon': Icons.format_list_bulleted_outlined,
      'name': 'format_list_bulleted_outlined'
    },
    {
      'icon': Icons.format_list_bulleted_rounded,
      'name': 'format_list_bulleted_rounded'
    },
    {
      'icon': Icons.format_list_bulleted_sharp,
      'name': 'format_list_bulleted_sharp'
    },
    {'icon': Icons.format_list_numbered, 'name': 'format_list_numbered'},
    {
      'icon': Icons.format_list_numbered_outlined,
      'name': 'format_list_numbered_outlined'
    },
    {
      'icon': Icons.format_list_numbered_rounded,
      'name': 'format_list_numbered_rounded'
    },
    {
      'icon': Icons.format_list_numbered_rtl,
      'name': 'format_list_numbered_rtl'
    },
    {
      'icon': Icons.format_list_numbered_rtl_outlined,
      'name': 'format_list_numbered_rtl_outlined'
    },
    {
      'icon': Icons.format_list_numbered_rtl_rounded,
      'name': 'format_list_numbered_rtl_rounded'
    },
    {
      'icon': Icons.format_list_numbered_rtl_sharp,
      'name': 'format_list_numbered_rtl_sharp'
    },
    {
      'icon': Icons.format_list_numbered_sharp,
      'name': 'format_list_numbered_sharp'
    },
    {'icon': Icons.format_paint, 'name': 'format_paint'},
    {'icon': Icons.format_paint_outlined, 'name': 'format_paint_outlined'},
    {'icon': Icons.format_paint_rounded, 'name': 'format_paint_rounded'},
    {'icon': Icons.format_paint_sharp, 'name': 'format_paint_sharp'},
    {'icon': Icons.format_quote, 'name': 'format_quote'},
    {'icon': Icons.format_quote_outlined, 'name': 'format_quote_outlined'},
    {'icon': Icons.format_quote_rounded, 'name': 'format_quote_rounded'},
    {'icon': Icons.format_quote_sharp, 'name': 'format_quote_sharp'},
    {'icon': Icons.format_shapes, 'name': 'format_shapes'},
    {'icon': Icons.format_shapes_outlined, 'name': 'format_shapes_outlined'},
    {'icon': Icons.format_shapes_rounded, 'name': 'format_shapes_rounded'},
    {'icon': Icons.format_shapes_sharp, 'name': 'format_shapes_sharp'},
    {'icon': Icons.format_size, 'name': 'format_size'},
    {'icon': Icons.format_size_outlined, 'name': 'format_size_outlined'},
    {'icon': Icons.format_size_rounded, 'name': 'format_size_rounded'},
    {'icon': Icons.format_size_sharp, 'name': 'format_size_sharp'},
    {'icon': Icons.format_strikethrough, 'name': 'format_strikethrough'},
    {
      'icon': Icons.format_strikethrough_outlined,
      'name': 'format_strikethrough_outlined'
    },
    {
      'icon': Icons.format_strikethrough_rounded,
      'name': 'format_strikethrough_rounded'
    },
    {
      'icon': Icons.format_strikethrough_sharp,
      'name': 'format_strikethrough_sharp'
    },
    {
      'icon': Icons.format_textdirection_l_to_r,
      'name': 'format_textdirection_l_to_r'
    },
    {
      'icon': Icons.format_textdirection_l_to_r_outlined,
      'name': 'format_textdirection_l_to_r_outlined'
    },
    {
      'icon': Icons.format_textdirection_l_to_r_rounded,
      'name': 'format_textdirection_l_to_r_rounded'
    },
    {
      'icon': Icons.format_textdirection_l_to_r_sharp,
      'name': 'format_textdirection_l_to_r_sharp'
    },
    {
      'icon': Icons.format_textdirection_r_to_l,
      'name': 'format_textdirection_r_to_l'
    },
    {
      'icon': Icons.format_textdirection_r_to_l_outlined,
      'name': 'format_textdirection_r_to_l_outlined'
    },
    {
      'icon': Icons.format_textdirection_r_to_l_rounded,
      'name': 'format_textdirection_r_to_l_rounded'
    },
    {
      'icon': Icons.format_textdirection_r_to_l_sharp,
      'name': 'format_textdirection_r_to_l_sharp'
    },
    {'icon': Icons.format_underline, 'name': 'format_underline'},
    {
      'icon': Icons.format_underline_outlined,
      'name': 'format_underline_outlined'
    },
    {
      'icon': Icons.format_underline_rounded,
      'name': 'format_underline_rounded'
    },
    {'icon': Icons.format_underline_sharp, 'name': 'format_underline_sharp'},
    {'icon': Icons.format_underlined, 'name': 'format_underlined'},
    {
      'icon': Icons.format_underlined_outlined,
      'name': 'format_underlined_outlined'
    },
    {
      'icon': Icons.format_underlined_rounded,
      'name': 'format_underlined_rounded'
    },
    {'icon': Icons.format_underlined_sharp, 'name': 'format_underlined_sharp'},
    {'icon': Icons.forum, 'name': 'forum'},
    {'icon': Icons.forum_outlined, 'name': 'forum_outlined'},
    {'icon': Icons.forum_rounded, 'name': 'forum_rounded'},
    {'icon': Icons.forum_sharp, 'name': 'forum_sharp'},
    {'icon': Icons.forward, 'name': 'forward'},
    {'icon': Icons.forward_5, 'name': 'forward_5'},
    {'icon': Icons.forward_5_outlined, 'name': 'forward_5_outlined'},
    {'icon': Icons.forward_5_rounded, 'name': 'forward_5_rounded'},
    {'icon': Icons.forward_5_sharp, 'name': 'forward_5_sharp'},
    {'icon': Icons.forward_10, 'name': 'forward_10'},
    {'icon': Icons.forward_10_outlined, 'name': 'forward_10_outlined'},
    {'icon': Icons.forward_10_rounded, 'name': 'forward_10_rounded'},
    {'icon': Icons.forward_10_sharp, 'name': 'forward_10_sharp'},
    {'icon': Icons.forward_30, 'name': 'forward_30'},
    {'icon': Icons.forward_30_outlined, 'name': 'forward_30_outlined'},
    {'icon': Icons.forward_30_rounded, 'name': 'forward_30_rounded'},
    {'icon': Icons.forward_30_sharp, 'name': 'forward_30_sharp'},
    {'icon': Icons.forward_outlined, 'name': 'forward_outlined'},
    {'icon': Icons.forward_rounded, 'name': 'forward_rounded'},
    {'icon': Icons.forward_sharp, 'name': 'forward_sharp'},
    {'icon': Icons.forward_to_inbox, 'name': 'forward_to_inbox'},
    {
      'icon': Icons.forward_to_inbox_outlined,
      'name': 'forward_to_inbox_outlined'
    },
    {
      'icon': Icons.forward_to_inbox_rounded,
      'name': 'forward_to_inbox_rounded'
    },
    {'icon': Icons.forward_to_inbox_sharp, 'name': 'forward_to_inbox_sharp'},
    {'icon': Icons.foundation, 'name': 'foundation'},
    {'icon': Icons.foundation_outlined, 'name': 'foundation_outlined'},
    {'icon': Icons.foundation_rounded, 'name': 'foundation_rounded'},
    {'icon': Icons.foundation_sharp, 'name': 'foundation_sharp'},
    {'icon': Icons.four_k, 'name': 'four_k'},
    {'icon': Icons.four_k_outlined, 'name': 'four_k_outlined'},
    {'icon': Icons.four_k_plus, 'name': 'four_k_plus'},
    {'icon': Icons.four_k_rounded, 'name': 'four_k_rounded'},
    {'icon': Icons.four_k_sharp, 'name': 'four_k_sharp'},
    {'icon': Icons.four_mp, 'name': 'four_mp'},
    {'icon': Icons.fourteen_mp, 'name': 'fourteen_mp'},
    {'icon': Icons.free_breakfast, 'name': 'free_breakfast'},
    {'icon': Icons.free_breakfast_outlined, 'name': 'free_breakfast_outlined'},
    {'icon': Icons.free_breakfast_rounded, 'name': 'free_breakfast_rounded'},
    {'icon': Icons.free_breakfast_sharp, 'name': 'free_breakfast_sharp'},
    {'icon': Icons.fullscreen, 'name': 'fullscreen'},
    {'icon': Icons.fullscreen_exit, 'name': 'fullscreen_exit'},
    {
      'icon': Icons.fullscreen_exit_outlined,
      'name': 'fullscreen_exit_outlined'
    },
    {'icon': Icons.fullscreen_exit_rounded, 'name': 'fullscreen_exit_rounded'},
    {'icon': Icons.fullscreen_exit_sharp, 'name': 'fullscreen_exit_sharp'},
    {'icon': Icons.fullscreen_outlined, 'name': 'fullscreen_outlined'},
    {'icon': Icons.fullscreen_rounded, 'name': 'fullscreen_rounded'},
    {'icon': Icons.fullscreen_sharp, 'name': 'fullscreen_sharp'},
    {'icon': Icons.functions, 'name': 'functions'},
    {'icon': Icons.functions_outlined, 'name': 'functions_outlined'},
    {'icon': Icons.functions_rounded, 'name': 'functions_rounded'},
    {'icon': Icons.functions_sharp, 'name': 'functions_sharp'},
    {'icon': Icons.g_translate, 'name': 'g_translate'},
    {'icon': Icons.g_translate_outlined, 'name': 'g_translate_outlined'},
    {'icon': Icons.g_translate_rounded, 'name': 'g_translate_rounded'},
    {'icon': Icons.g_translate_sharp, 'name': 'g_translate_sharp'},
    {'icon': Icons.gamepad, 'name': 'gamepad'},
    {'icon': Icons.gamepad_outlined, 'name': 'gamepad_outlined'},
    {'icon': Icons.gamepad_rounded, 'name': 'gamepad_rounded'},
    {'icon': Icons.gamepad_sharp, 'name': 'gamepad_sharp'},
    {'icon': Icons.games, 'name': 'games'},
    {'icon': Icons.games_outlined, 'name': 'games_outlined'},
    {'icon': Icons.games_rounded, 'name': 'games_rounded'},
    {'icon': Icons.games_sharp, 'name': 'games_sharp'},
    {'icon': Icons.gavel, 'name': 'gavel'},
    {'icon': Icons.gavel_outlined, 'name': 'gavel_outlined'},
    {'icon': Icons.gavel_rounded, 'name': 'gavel_rounded'},
    {'icon': Icons.gavel_sharp, 'name': 'gavel_sharp'},
    {'icon': Icons.gesture, 'name': 'gesture'},
    {'icon': Icons.gesture_outlined, 'name': 'gesture_outlined'},
    {'icon': Icons.gesture_rounded, 'name': 'gesture_rounded'},
    {'icon': Icons.gesture_sharp, 'name': 'gesture_sharp'},
    {'icon': Icons.get_app, 'name': 'get_app'},
    {'icon': Icons.get_app_outlined, 'name': 'get_app_outlined'},
    {'icon': Icons.get_app_rounded, 'name': 'get_app_rounded'},
    {'icon': Icons.get_app_sharp, 'name': 'get_app_sharp'},
    {'icon': Icons.gif, 'name': 'gif'},
    {'icon': Icons.gif_outlined, 'name': 'gif_outlined'},
    {'icon': Icons.gif_rounded, 'name': 'gif_rounded'},
    {'icon': Icons.gif_sharp, 'name': 'gif_sharp'},
    {'icon': Icons.golf_course, 'name': 'golf_course'},
    {'icon': Icons.golf_course_outlined, 'name': 'golf_course_outlined'},
    {'icon': Icons.golf_course_rounded, 'name': 'golf_course_rounded'},
    {'icon': Icons.golf_course_sharp, 'name': 'golf_course_sharp'},
    {'icon': Icons.gps_fixed, 'name': 'gps_fixed'},
    {'icon': Icons.gps_fixed_outlined, 'name': 'gps_fixed_outlined'},
    {'icon': Icons.gps_fixed_rounded, 'name': 'gps_fixed_rounded'},
    {'icon': Icons.gps_fixed_sharp, 'name': 'gps_fixed_sharp'},
    {'icon': Icons.gps_not_fixed, 'name': 'gps_not_fixed'},
    {'icon': Icons.gps_not_fixed_outlined, 'name': 'gps_not_fixed_outlined'},
    {'icon': Icons.gps_not_fixed_rounded, 'name': 'gps_not_fixed_rounded'},
    {'icon': Icons.gps_not_fixed_sharp, 'name': 'gps_not_fixed_sharp'},
    {'icon': Icons.gps_off, 'name': 'gps_off'},
    {'icon': Icons.gps_off_outlined, 'name': 'gps_off_outlined'},
    {'icon': Icons.gps_off_rounded, 'name': 'gps_off_rounded'},
    {'icon': Icons.gps_off_sharp, 'name': 'gps_off_sharp'},
    {'icon': Icons.grade, 'name': 'grade'},
    {'icon': Icons.grade_outlined, 'name': 'grade_outlined'},
    {'icon': Icons.grade_rounded, 'name': 'grade_rounded'},
    {'icon': Icons.grade_sharp, 'name': 'grade_sharp'},
    {'icon': Icons.gradient, 'name': 'gradient'},
    {'icon': Icons.gradient_outlined, 'name': 'gradient_outlined'},
    {'icon': Icons.gradient_rounded, 'name': 'gradient_rounded'},
    {'icon': Icons.gradient_sharp, 'name': 'gradient_sharp'},
    {'icon': Icons.grading, 'name': 'grading'},
    {'icon': Icons.grading_outlined, 'name': 'grading_outlined'},
    {'icon': Icons.grading_rounded, 'name': 'grading_rounded'},
    {'icon': Icons.grading_sharp, 'name': 'grading_sharp'},
    {'icon': Icons.grain, 'name': 'grain'},
    {'icon': Icons.grain_outlined, 'name': 'grain_outlined'},
    {'icon': Icons.grain_rounded, 'name': 'grain_rounded'},
    {'icon': Icons.grain_sharp, 'name': 'grain_sharp'},
    {'icon': Icons.graphic_eq, 'name': 'graphic_eq'},
    {'icon': Icons.graphic_eq_outlined, 'name': 'graphic_eq_outlined'},
    {'icon': Icons.graphic_eq_rounded, 'name': 'graphic_eq_rounded'},
    {'icon': Icons.graphic_eq_sharp, 'name': 'graphic_eq_sharp'},
    {'icon': Icons.grass, 'name': 'grass'},
    {'icon': Icons.grass_outlined, 'name': 'grass_outlined'},
    {'icon': Icons.grass_rounded, 'name': 'grass_rounded'},
    {'icon': Icons.grass_sharp, 'name': 'grass_sharp'},
    {'icon': Icons.grid_off, 'name': 'grid_off'},
    {'icon': Icons.grid_off_outlined, 'name': 'grid_off_outlined'},
    {'icon': Icons.grid_off_rounded, 'name': 'grid_off_rounded'},
    {'icon': Icons.grid_off_sharp, 'name': 'grid_off_sharp'},
    {'icon': Icons.grid_on, 'name': 'grid_on'},
    {'icon': Icons.grid_on_outlined, 'name': 'grid_on_outlined'},
    {'icon': Icons.grid_on_rounded, 'name': 'grid_on_rounded'},
    {'icon': Icons.grid_on_sharp, 'name': 'grid_on_sharp'},
    {'icon': Icons.grid_view, 'name': 'grid_view'},
    {'icon': Icons.group, 'name': 'group'},
    {'icon': Icons.group_add, 'name': 'group_add'},
    {'icon': Icons.group_add_outlined, 'name': 'group_add_outlined'},
    {'icon': Icons.group_add_rounded, 'name': 'group_add_rounded'},
    {'icon': Icons.group_add_sharp, 'name': 'group_add_sharp'},
    {'icon': Icons.group_outlined, 'name': 'group_outlined'},
    {'icon': Icons.group_rounded, 'name': 'group_rounded'},
    {'icon': Icons.group_sharp, 'name': 'group_sharp'},
    {'icon': Icons.group_work, 'name': 'group_work'},
    {'icon': Icons.group_work_outlined, 'name': 'group_work_outlined'},
    {'icon': Icons.group_work_rounded, 'name': 'group_work_rounded'},
    {'icon': Icons.group_work_sharp, 'name': 'group_work_sharp'},
    {'icon': Icons.hail, 'name': 'hail'},
    {'icon': Icons.handyman, 'name': 'handyman'},
    {'icon': Icons.handyman_outlined, 'name': 'handyman_outlined'},
    {'icon': Icons.handyman_rounded, 'name': 'handyman_rounded'},
    {'icon': Icons.handyman_sharp, 'name': 'handyman_sharp'},
    {'icon': Icons.hardware, 'name': 'hardware'},
    {'icon': Icons.hd, 'name': 'hd'},
    {'icon': Icons.hd_outlined, 'name': 'hd_outlined'},
    {'icon': Icons.hd_rounded, 'name': 'hd_rounded'},
    {'icon': Icons.hd_sharp, 'name': 'hd_sharp'},
    {'icon': Icons.hdr_enhanced_select, 'name': 'hdr_enhanced_select'},
    {'icon': Icons.hdr_off, 'name': 'hdr_off'},
    {'icon': Icons.hdr_off_outlined, 'name': 'hdr_off_outlined'},
    {'icon': Icons.hdr_off_rounded, 'name': 'hdr_off_rounded'},
    {'icon': Icons.hdr_off_sharp, 'name': 'hdr_off_sharp'},
    {'icon': Icons.hdr_on, 'name': 'hdr_on'},
    {'icon': Icons.hdr_on_outlined, 'name': 'hdr_on_outlined'},
    {'icon': Icons.hdr_on_rounded, 'name': 'hdr_on_rounded'},
    {'icon': Icons.hdr_on_sharp, 'name': 'hdr_on_sharp'},
    {'icon': Icons.hdr_strong, 'name': 'hdr_strong'},
    {'icon': Icons.hdr_strong_outlined, 'name': 'hdr_strong_outlined'},
    {'icon': Icons.hdr_strong_rounded, 'name': 'hdr_strong_rounded'},
    {'icon': Icons.hdr_strong_sharp, 'name': 'hdr_strong_sharp'},
    {'icon': Icons.hdr_weak, 'name': 'hdr_weak'},
    {'icon': Icons.hdr_weak_outlined, 'name': 'hdr_weak_outlined'},
    {'icon': Icons.hdr_weak_rounded, 'name': 'hdr_weak_rounded'},
    {'icon': Icons.hdr_weak_sharp, 'name': 'hdr_weak_sharp'},
    {'icon': Icons.headset, 'name': 'headset'},
    {'icon': Icons.headset_mic, 'name': 'headset_mic'},
    {'icon': Icons.headset_mic_outlined, 'name': 'headset_mic_outlined'},
    {'icon': Icons.headset_mic_rounded, 'name': 'headset_mic_rounded'},
    {'icon': Icons.headset_mic_sharp, 'name': 'headset_mic_sharp'},
    {'icon': Icons.headset_off, 'name': 'headset_off'},
    {'icon': Icons.headset_outlined, 'name': 'headset_outlined'},
    {'icon': Icons.headset_rounded, 'name': 'headset_rounded'},
    {'icon': Icons.headset_sharp, 'name': 'headset_sharp'},
    {'icon': Icons.healing, 'name': 'healing'},
    {'icon': Icons.healing_outlined, 'name': 'healing_outlined'},
    {'icon': Icons.healing_rounded, 'name': 'healing_rounded'},
    {'icon': Icons.healing_sharp, 'name': 'healing_sharp'},
    {'icon': Icons.hearing, 'name': 'hearing'},
    {'icon': Icons.hearing_disabled, 'name': 'hearing_disabled'},
    {
      'icon': Icons.hearing_disabled_outlined,
      'name': 'hearing_disabled_outlined'
    },
    {
      'icon': Icons.hearing_disabled_rounded,
      'name': 'hearing_disabled_rounded'
    },
    {'icon': Icons.hearing_disabled_sharp, 'name': 'hearing_disabled_sharp'},
    {'icon': Icons.hearing_outlined, 'name': 'hearing_outlined'},
    {'icon': Icons.hearing_rounded, 'name': 'hearing_rounded'},
    {'icon': Icons.hearing_sharp, 'name': 'hearing_sharp'},
    {'icon': Icons.height, 'name': 'height'},
    {'icon': Icons.height_outlined, 'name': 'height_outlined'},
    {'icon': Icons.height_rounded, 'name': 'height_rounded'},
    {'icon': Icons.height_sharp, 'name': 'height_sharp'},
    {'icon': Icons.help, 'name': 'help'},
    {'icon': Icons.help_center, 'name': 'help_center'},
    {'icon': Icons.help_center_outlined, 'name': 'help_center_outlined'},
    {'icon': Icons.help_center_rounded, 'name': 'help_center_rounded'},
    {'icon': Icons.help_center_sharp, 'name': 'help_center_sharp'},
    {'icon': Icons.help_outline, 'name': 'help_outline'},
    {'icon': Icons.help_outline_outlined, 'name': 'help_outline_outlined'},
    {'icon': Icons.help_outline_rounded, 'name': 'help_outline_rounded'},
    {'icon': Icons.help_outline_sharp, 'name': 'help_outline_sharp'},
    {'icon': Icons.help_outlined, 'name': 'help_outlined'},
    {'icon': Icons.help_rounded, 'name': 'help_rounded'},
    {'icon': Icons.help_sharp, 'name': 'help_sharp'},
    {'icon': Icons.high_quality, 'name': 'high_quality'},
    {'icon': Icons.high_quality_outlined, 'name': 'high_quality_outlined'},
    {'icon': Icons.high_quality_rounded, 'name': 'high_quality_rounded'},
    {'icon': Icons.high_quality_sharp, 'name': 'high_quality_sharp'},
    {'icon': Icons.highlight, 'name': 'highlight'},
    {'icon': Icons.highlight_alt, 'name': 'highlight_alt'},
    {'icon': Icons.highlight_alt_outlined, 'name': 'highlight_alt_outlined'},
    {'icon': Icons.highlight_alt_rounded, 'name': 'highlight_alt_rounded'},
    {'icon': Icons.highlight_alt_sharp, 'name': 'highlight_alt_sharp'},
    {'icon': Icons.highlight_off, 'name': 'highlight_off'},
    {'icon': Icons.highlight_off_outlined, 'name': 'highlight_off_outlined'},
    {'icon': Icons.highlight_off_rounded, 'name': 'highlight_off_rounded'},
    {'icon': Icons.highlight_off_sharp, 'name': 'highlight_off_sharp'},
    {'icon': Icons.highlight_outlined, 'name': 'highlight_outlined'},
    {'icon': Icons.highlight_remove, 'name': 'highlight_remove'},
    {
      'icon': Icons.highlight_remove_outlined,
      'name': 'highlight_remove_outlined'
    },
    {
      'icon': Icons.highlight_remove_rounded,
      'name': 'highlight_remove_rounded'
    },
    {'icon': Icons.highlight_remove_sharp, 'name': 'highlight_remove_sharp'},
    {'icon': Icons.highlight_rounded, 'name': 'highlight_rounded'},
    {'icon': Icons.highlight_sharp, 'name': 'highlight_sharp'},
    {'icon': Icons.history, 'name': 'history'},
    {'icon': Icons.history_edu, 'name': 'history_edu'},
    {'icon': Icons.history_edu_outlined, 'name': 'history_edu_outlined'},
    {'icon': Icons.history_edu_rounded, 'name': 'history_edu_rounded'},
    {'icon': Icons.history_edu_sharp, 'name': 'history_edu_sharp'},
    {'icon': Icons.history_outlined, 'name': 'history_outlined'},
    {'icon': Icons.history_rounded, 'name': 'history_rounded'},
    {'icon': Icons.history_sharp, 'name': 'history_sharp'},
    {'icon': Icons.history_toggle_off, 'name': 'history_toggle_off'},
    {
      'icon': Icons.history_toggle_off_outlined,
      'name': 'history_toggle_off_outlined'
    },
    {
      'icon': Icons.history_toggle_off_rounded,
      'name': 'history_toggle_off_rounded'
    },
    {
      'icon': Icons.history_toggle_off_sharp,
      'name': 'history_toggle_off_sharp'
    },
    {'icon': Icons.home, 'name': 'home'},
    {'icon': Icons.home_filled, 'name': 'home_filled'},
    {'icon': Icons.home_outlined, 'name': 'home_outlined'},
    {'icon': Icons.home_repair_service, 'name': 'home_repair_service'},
    {
      'icon': Icons.home_repair_service_outlined,
      'name': 'home_repair_service_outlined'
    },
    {
      'icon': Icons.home_repair_service_rounded,
      'name': 'home_repair_service_rounded'
    },
    {
      'icon': Icons.home_repair_service_sharp,
      'name': 'home_repair_service_sharp'
    },
    {'icon': Icons.home_rounded, 'name': 'home_rounded'},
    {'icon': Icons.home_sharp, 'name': 'home_sharp'},
    {'icon': Icons.home_work, 'name': 'home_work'},
    {'icon': Icons.home_work_outlined, 'name': 'home_work_outlined'},
    {'icon': Icons.home_work_rounded, 'name': 'home_work_rounded'},
    {'icon': Icons.home_work_sharp, 'name': 'home_work_sharp'},
    {'icon': Icons.horizontal_rule, 'name': 'horizontal_rule'},
    {
      'icon': Icons.horizontal_rule_outlined,
      'name': 'horizontal_rule_outlined'
    },
    {'icon': Icons.horizontal_rule_rounded, 'name': 'horizontal_rule_rounded'},
    {'icon': Icons.horizontal_rule_sharp, 'name': 'horizontal_rule_sharp'},
    {'icon': Icons.horizontal_split, 'name': 'horizontal_split'},
    {
      'icon': Icons.horizontal_split_outlined,
      'name': 'horizontal_split_outlined'
    },
    {
      'icon': Icons.horizontal_split_rounded,
      'name': 'horizontal_split_rounded'
    },
    {'icon': Icons.horizontal_split_sharp, 'name': 'horizontal_split_sharp'},
    {'icon': Icons.hot_tub, 'name': 'hot_tub'},
    {'icon': Icons.hot_tub_outlined, 'name': 'hot_tub_outlined'},
    {'icon': Icons.hot_tub_rounded, 'name': 'hot_tub_rounded'},
    {'icon': Icons.hot_tub_sharp, 'name': 'hot_tub_sharp'},
    {'icon': Icons.hotel, 'name': 'hotel'},
    {'icon': Icons.hotel_outlined, 'name': 'hotel_outlined'},
    {'icon': Icons.hotel_rounded, 'name': 'hotel_rounded'},
    {'icon': Icons.hotel_sharp, 'name': 'hotel_sharp'},
    {'icon': Icons.hourglass_bottom, 'name': 'hourglass_bottom'},
    {
      'icon': Icons.hourglass_bottom_outlined,
      'name': 'hourglass_bottom_outlined'
    },
    {
      'icon': Icons.hourglass_bottom_rounded,
      'name': 'hourglass_bottom_rounded'
    },
    {'icon': Icons.hourglass_bottom_sharp, 'name': 'hourglass_bottom_sharp'},
    {'icon': Icons.hourglass_disabled, 'name': 'hourglass_disabled'},
    {
      'icon': Icons.hourglass_disabled_outlined,
      'name': 'hourglass_disabled_outlined'
    },
    {
      'icon': Icons.hourglass_disabled_rounded,
      'name': 'hourglass_disabled_rounded'
    },
    {
      'icon': Icons.hourglass_disabled_sharp,
      'name': 'hourglass_disabled_sharp'
    },
    {'icon': Icons.hourglass_empty, 'name': 'hourglass_empty'},
    {
      'icon': Icons.hourglass_empty_outlined,
      'name': 'hourglass_empty_outlined'
    },
    {'icon': Icons.hourglass_empty_rounded, 'name': 'hourglass_empty_rounded'},
    {'icon': Icons.hourglass_empty_sharp, 'name': 'hourglass_empty_sharp'},
    {'icon': Icons.hourglass_full, 'name': 'hourglass_full'},
    {'icon': Icons.hourglass_full_outlined, 'name': 'hourglass_full_outlined'},
    {'icon': Icons.hourglass_full_rounded, 'name': 'hourglass_full_rounded'},
    {'icon': Icons.hourglass_full_sharp, 'name': 'hourglass_full_sharp'},
    {'icon': Icons.hourglass_top, 'name': 'hourglass_top'},
    {'icon': Icons.hourglass_top_outlined, 'name': 'hourglass_top_outlined'},
    {'icon': Icons.hourglass_top_rounded, 'name': 'hourglass_top_rounded'},
    {'icon': Icons.hourglass_top_sharp, 'name': 'hourglass_top_sharp'},
    {'icon': Icons.house, 'name': 'house'},
    {'icon': Icons.house_outlined, 'name': 'house_outlined'},
    {'icon': Icons.house_rounded, 'name': 'house_rounded'},
    {'icon': Icons.house_sharp, 'name': 'house_sharp'},
    {'icon': Icons.house_siding, 'name': 'house_siding'},
    {'icon': Icons.house_siding_outlined, 'name': 'house_siding_outlined'},
    {'icon': Icons.house_siding_rounded, 'name': 'house_siding_rounded'},
    {'icon': Icons.house_siding_sharp, 'name': 'house_siding_sharp'},
    {'icon': Icons.how_to_reg, 'name': 'how_to_reg'},
    {'icon': Icons.how_to_reg_outlined, 'name': 'how_to_reg_outlined'},
    {'icon': Icons.how_to_reg_rounded, 'name': 'how_to_reg_rounded'},
    {'icon': Icons.how_to_reg_sharp, 'name': 'how_to_reg_sharp'},
    {'icon': Icons.how_to_vote, 'name': 'how_to_vote'},
    {'icon': Icons.how_to_vote_outlined, 'name': 'how_to_vote_outlined'},
    {'icon': Icons.how_to_vote_rounded, 'name': 'how_to_vote_rounded'},
    {'icon': Icons.how_to_vote_sharp, 'name': 'how_to_vote_sharp'},
    {'icon': Icons.http, 'name': 'http'},
    {'icon': Icons.http_outlined, 'name': 'http_outlined'},
    {'icon': Icons.http_rounded, 'name': 'http_rounded'},
    {'icon': Icons.http_sharp, 'name': 'http_sharp'},
    {'icon': Icons.https, 'name': 'https'},
    {'icon': Icons.https_outlined, 'name': 'https_outlined'},
    {'icon': Icons.https_rounded, 'name': 'https_rounded'},
    {'icon': Icons.https_sharp, 'name': 'https_sharp'},
    {'icon': Icons.hvac, 'name': 'hvac'},
    {'icon': Icons.hvac_outlined, 'name': 'hvac_outlined'},
    {'icon': Icons.hvac_rounded, 'name': 'hvac_rounded'},
    {'icon': Icons.hvac_sharp, 'name': 'hvac_sharp'},
    {'icon': Icons.icecream, 'name': 'icecream'},
    {'icon': Icons.image, 'name': 'image'},
    {'icon': Icons.image_aspect_ratio, 'name': 'image_aspect_ratio'},
    {
      'icon': Icons.image_aspect_ratio_outlined,
      'name': 'image_aspect_ratio_outlined'
    },
    {
      'icon': Icons.image_aspect_ratio_rounded,
      'name': 'image_aspect_ratio_rounded'
    },
    {
      'icon': Icons.image_aspect_ratio_sharp,
      'name': 'image_aspect_ratio_sharp'
    },
    {'icon': Icons.image_not_supported, 'name': 'image_not_supported'},
    {
      'icon': Icons.image_not_supported_outlined,
      'name': 'image_not_supported_outlined'
    },
    {
      'icon': Icons.image_not_supported_rounded,
      'name': 'image_not_supported_rounded'
    },
    {
      'icon': Icons.image_not_supported_sharp,
      'name': 'image_not_supported_sharp'
    },
    {'icon': Icons.image_outlined, 'name': 'image_outlined'},
    {'icon': Icons.image_rounded, 'name': 'image_rounded'},
    {'icon': Icons.image_search, 'name': 'image_search'},
    {'icon': Icons.image_search_outlined, 'name': 'image_search_outlined'},
    {'icon': Icons.image_search_rounded, 'name': 'image_search_rounded'},
    {'icon': Icons.image_search_sharp, 'name': 'image_search_sharp'},
    {'icon': Icons.image_sharp, 'name': 'image_sharp'},
    {'icon': Icons.imagesearch_roller, 'name': 'imagesearch_roller'},
    {'icon': Icons.import_contacts, 'name': 'import_contacts'},
    {
      'icon': Icons.import_contacts_outlined,
      'name': 'import_contacts_outlined'
    },
    {'icon': Icons.import_contacts_rounded, 'name': 'import_contacts_rounded'},
    {'icon': Icons.import_contacts_sharp, 'name': 'import_contacts_sharp'},
    {'icon': Icons.import_export, 'name': 'import_export'},
    {'icon': Icons.import_export_outlined, 'name': 'import_export_outlined'},
    {'icon': Icons.import_export_rounded, 'name': 'import_export_rounded'},
    {'icon': Icons.import_export_sharp, 'name': 'import_export_sharp'},
    {'icon': Icons.important_devices, 'name': 'important_devices'},
    {
      'icon': Icons.important_devices_outlined,
      'name': 'important_devices_outlined'
    },
    {
      'icon': Icons.important_devices_rounded,
      'name': 'important_devices_rounded'
    },
    {'icon': Icons.important_devices_sharp, 'name': 'important_devices_sharp'},
    {'icon': Icons.inbox, 'name': 'inbox'},
    {'icon': Icons.inbox_outlined, 'name': 'inbox_outlined'},
    {'icon': Icons.inbox_rounded, 'name': 'inbox_rounded'},
    {'icon': Icons.inbox_sharp, 'name': 'inbox_sharp'},
    {'icon': Icons.indeterminate_check_box, 'name': 'indeterminate_check_box'},
    {
      'icon': Icons.indeterminate_check_box_outlined,
      'name': 'indeterminate_check_box_outlined'
    },
    {
      'icon': Icons.indeterminate_check_box_rounded,
      'name': 'indeterminate_check_box_rounded'
    },
    {
      'icon': Icons.indeterminate_check_box_sharp,
      'name': 'indeterminate_check_box_sharp'
    },
    {'icon': Icons.info, 'name': 'info'},
    {'icon': Icons.info_outline, 'name': 'info_outline'},
    {'icon': Icons.info_outline_rounded, 'name': 'info_outline_rounded'},
    {'icon': Icons.info_outline_sharp, 'name': 'info_outline_sharp'},
    {'icon': Icons.info_outlined, 'name': 'info_outlined'},
    {'icon': Icons.info_rounded, 'name': 'info_rounded'},
    {'icon': Icons.info_sharp, 'name': 'info_sharp'},
    {'icon': Icons.input, 'name': 'input'},
    {'icon': Icons.input_outlined, 'name': 'input_outlined'},
    {'icon': Icons.input_rounded, 'name': 'input_rounded'},
    {'icon': Icons.input_sharp, 'name': 'input_sharp'},
    {'icon': Icons.insert_chart, 'name': 'insert_chart'},
    {'icon': Icons.insert_chart_outlined, 'name': 'insert_chart_outlined'},
    {
      'icon': Icons.insert_chart_outlined_outlined,
      'name': 'insert_chart_outlined_outlined'
    },
    {
      'icon': Icons.insert_chart_outlined_rounded,
      'name': 'insert_chart_outlined_rounded'
    },
    {
      'icon': Icons.insert_chart_outlined_sharp,
      'name': 'insert_chart_outlined_sharp'
    },
    {'icon': Icons.insert_chart_rounded, 'name': 'insert_chart_rounded'},
    {'icon': Icons.insert_chart_sharp, 'name': 'insert_chart_sharp'},
    {'icon': Icons.insert_comment, 'name': 'insert_comment'},
    {'icon': Icons.insert_comment_outlined, 'name': 'insert_comment_outlined'},
    {'icon': Icons.insert_comment_rounded, 'name': 'insert_comment_rounded'},
    {'icon': Icons.insert_comment_sharp, 'name': 'insert_comment_sharp'},
    {'icon': Icons.insert_drive_file, 'name': 'insert_drive_file'},
    {
      'icon': Icons.insert_drive_file_outlined,
      'name': 'insert_drive_file_outlined'
    },
    {
      'icon': Icons.insert_drive_file_rounded,
      'name': 'insert_drive_file_rounded'
    },
    {'icon': Icons.insert_drive_file_sharp, 'name': 'insert_drive_file_sharp'},
    {'icon': Icons.insert_emoticon, 'name': 'insert_emoticon'},
    {
      'icon': Icons.insert_emoticon_outlined,
      'name': 'insert_emoticon_outlined'
    },
    {'icon': Icons.insert_emoticon_rounded, 'name': 'insert_emoticon_rounded'},
    {'icon': Icons.insert_emoticon_sharp, 'name': 'insert_emoticon_sharp'},
    {'icon': Icons.insert_invitation, 'name': 'insert_invitation'},
    {
      'icon': Icons.insert_invitation_outlined,
      'name': 'insert_invitation_outlined'
    },
    {
      'icon': Icons.insert_invitation_rounded,
      'name': 'insert_invitation_rounded'
    },
    {'icon': Icons.insert_invitation_sharp, 'name': 'insert_invitation_sharp'},
    {'icon': Icons.insert_link, 'name': 'insert_link'},
    {'icon': Icons.insert_link_outlined, 'name': 'insert_link_outlined'},
    {'icon': Icons.insert_link_rounded, 'name': 'insert_link_rounded'},
    {'icon': Icons.insert_link_sharp, 'name': 'insert_link_sharp'},
    {'icon': Icons.insert_photo, 'name': 'insert_photo'},
    {'icon': Icons.insert_photo_outlined, 'name': 'insert_photo_outlined'},
    {'icon': Icons.insert_photo_rounded, 'name': 'insert_photo_rounded'},
    {'icon': Icons.insert_photo_sharp, 'name': 'insert_photo_sharp'},
    {'icon': Icons.insights, 'name': 'insights'},
    {'icon': Icons.insights_outlined, 'name': 'insights_outlined'},
    {'icon': Icons.insights_rounded, 'name': 'insights_rounded'},
    {'icon': Icons.insights_sharp, 'name': 'insights_sharp'},
    {
      'icon': Icons.integration_instructions,
      'name': 'integration_instructions'
    },
    {
      'icon': Icons.integration_instructions_outlined,
      'name': 'integration_instructions_outlined'
    },
    {
      'icon': Icons.integration_instructions_rounded,
      'name': 'integration_instructions_rounded'
    },
    {
      'icon': Icons.integration_instructions_sharp,
      'name': 'integration_instructions_sharp'
    },
    {'icon': Icons.inventory, 'name': 'inventory'},
    {'icon': Icons.invert_colors, 'name': 'invert_colors'},
    {'icon': Icons.invert_colors_off, 'name': 'invert_colors_off'},
    {
      'icon': Icons.invert_colors_off_outlined,
      'name': 'invert_colors_off_outlined'
    },
    {
      'icon': Icons.invert_colors_off_rounded,
      'name': 'invert_colors_off_rounded'
    },
    {'icon': Icons.invert_colors_off_sharp, 'name': 'invert_colors_off_sharp'},
    {'icon': Icons.invert_colors_on, 'name': 'invert_colors_on'},
    {
      'icon': Icons.invert_colors_on_outlined,
      'name': 'invert_colors_on_outlined'
    },
    {
      'icon': Icons.invert_colors_on_rounded,
      'name': 'invert_colors_on_rounded'
    },
    {'icon': Icons.invert_colors_on_sharp, 'name': 'invert_colors_on_sharp'},
    {'icon': Icons.invert_colors_outlined, 'name': 'invert_colors_outlined'},
    {'icon': Icons.invert_colors_rounded, 'name': 'invert_colors_rounded'},
    {'icon': Icons.invert_colors_sharp, 'name': 'invert_colors_sharp'},
    {'icon': Icons.ios_share, 'name': 'ios_share'},
    {'icon': Icons.iso, 'name': 'iso'},
    {'icon': Icons.iso_outlined, 'name': 'iso_outlined'},
    {'icon': Icons.iso_rounded, 'name': 'iso_rounded'},
    {'icon': Icons.iso_sharp, 'name': 'iso_sharp'},
    {'icon': Icons.keyboard, 'name': 'keyboard'},
    {'icon': Icons.keyboard_arrow_down, 'name': 'keyboard_arrow_down'},
    {
      'icon': Icons.keyboard_arrow_down_outlined,
      'name': 'keyboard_arrow_down_outlined'
    },
    {
      'icon': Icons.keyboard_arrow_down_rounded,
      'name': 'keyboard_arrow_down_rounded'
    },
    {
      'icon': Icons.keyboard_arrow_down_sharp,
      'name': 'keyboard_arrow_down_sharp'
    },
    {'icon': Icons.keyboard_arrow_left, 'name': 'keyboard_arrow_left'},
    {
      'icon': Icons.keyboard_arrow_left_outlined,
      'name': 'keyboard_arrow_left_outlined'
    },
    {
      'icon': Icons.keyboard_arrow_left_rounded,
      'name': 'keyboard_arrow_left_rounded'
    },
    {
      'icon': Icons.keyboard_arrow_left_sharp,
      'name': 'keyboard_arrow_left_sharp'
    },
    {'icon': Icons.keyboard_arrow_right, 'name': 'keyboard_arrow_right'},
    {
      'icon': Icons.keyboard_arrow_right_outlined,
      'name': 'keyboard_arrow_right_outlined'
    },
    {
      'icon': Icons.keyboard_arrow_right_rounded,
      'name': 'keyboard_arrow_right_rounded'
    },
    {
      'icon': Icons.keyboard_arrow_right_sharp,
      'name': 'keyboard_arrow_right_sharp'
    },
    {'icon': Icons.keyboard_arrow_up, 'name': 'keyboard_arrow_up'},
    {
      'icon': Icons.keyboard_arrow_up_outlined,
      'name': 'keyboard_arrow_up_outlined'
    },
    {
      'icon': Icons.keyboard_arrow_up_rounded,
      'name': 'keyboard_arrow_up_rounded'
    },
    {'icon': Icons.keyboard_arrow_up_sharp, 'name': 'keyboard_arrow_up_sharp'},
    {'icon': Icons.keyboard_backspace, 'name': 'keyboard_backspace'},
    {
      'icon': Icons.keyboard_backspace_outlined,
      'name': 'keyboard_backspace_outlined'
    },
    {
      'icon': Icons.keyboard_backspace_rounded,
      'name': 'keyboard_backspace_rounded'
    },
    {
      'icon': Icons.keyboard_backspace_sharp,
      'name': 'keyboard_backspace_sharp'
    },
    {'icon': Icons.keyboard_capslock, 'name': 'keyboard_capslock'},
    {
      'icon': Icons.keyboard_capslock_outlined,
      'name': 'keyboard_capslock_outlined'
    },
    {
      'icon': Icons.keyboard_capslock_rounded,
      'name': 'keyboard_capslock_rounded'
    },
    {'icon': Icons.keyboard_capslock_sharp, 'name': 'keyboard_capslock_sharp'},
    {'icon': Icons.keyboard_control, 'name': 'keyboard_control'},
    {
      'icon': Icons.keyboard_control_outlined,
      'name': 'keyboard_control_outlined'
    },
    {
      'icon': Icons.keyboard_control_rounded,
      'name': 'keyboard_control_rounded'
    },
    {'icon': Icons.keyboard_control_sharp, 'name': 'keyboard_control_sharp'},
    {'icon': Icons.keyboard_hide, 'name': 'keyboard_hide'},
    {'icon': Icons.keyboard_hide_outlined, 'name': 'keyboard_hide_outlined'},
    {'icon': Icons.keyboard_hide_rounded, 'name': 'keyboard_hide_rounded'},
    {'icon': Icons.keyboard_hide_sharp, 'name': 'keyboard_hide_sharp'},
    {'icon': Icons.keyboard_outlined, 'name': 'keyboard_outlined'},
    {'icon': Icons.keyboard_return, 'name': 'keyboard_return'},
    {
      'icon': Icons.keyboard_return_outlined,
      'name': 'keyboard_return_outlined'
    },
    {'icon': Icons.keyboard_return_rounded, 'name': 'keyboard_return_rounded'},
    {'icon': Icons.keyboard_return_sharp, 'name': 'keyboard_return_sharp'},
    {'icon': Icons.keyboard_rounded, 'name': 'keyboard_rounded'},
    {'icon': Icons.keyboard_sharp, 'name': 'keyboard_sharp'},
    {'icon': Icons.keyboard_tab, 'name': 'keyboard_tab'},
    {'icon': Icons.keyboard_tab_outlined, 'name': 'keyboard_tab_outlined'},
    {'icon': Icons.keyboard_tab_rounded, 'name': 'keyboard_tab_rounded'},
    {'icon': Icons.keyboard_tab_sharp, 'name': 'keyboard_tab_sharp'},
    {'icon': Icons.keyboard_voice, 'name': 'keyboard_voice'},
    {'icon': Icons.keyboard_voice_outlined, 'name': 'keyboard_voice_outlined'},
    {'icon': Icons.keyboard_voice_rounded, 'name': 'keyboard_voice_rounded'},
    {'icon': Icons.keyboard_voice_sharp, 'name': 'keyboard_voice_sharp'},
    {'icon': Icons.king_bed, 'name': 'king_bed'},
    {'icon': Icons.king_bed_outlined, 'name': 'king_bed_outlined'},
    {'icon': Icons.king_bed_rounded, 'name': 'king_bed_rounded'},
    {'icon': Icons.king_bed_sharp, 'name': 'king_bed_sharp'},
    {'icon': Icons.kitchen, 'name': 'kitchen'},
    {'icon': Icons.kitchen_outlined, 'name': 'kitchen_outlined'},
    {'icon': Icons.kitchen_rounded, 'name': 'kitchen_rounded'},
    {'icon': Icons.kitchen_sharp, 'name': 'kitchen_sharp'},
    {'icon': Icons.label, 'name': 'label'},
    {'icon': Icons.label_important, 'name': 'label_important'},
    {'icon': Icons.label_important_outline, 'name': 'label_important_outline'},
    {
      'icon': Icons.label_important_outline_rounded,
      'name': 'label_important_outline_rounded'
    },
    {
      'icon': Icons.label_important_outline_sharp,
      'name': 'label_important_outline_sharp'
    },
    {
      'icon': Icons.label_important_outlined,
      'name': 'label_important_outlined'
    },
    {'icon': Icons.label_important_rounded, 'name': 'label_important_rounded'},
    {'icon': Icons.label_important_sharp, 'name': 'label_important_sharp'},
    {'icon': Icons.label_off, 'name': 'label_off'},
    {'icon': Icons.label_off_outlined, 'name': 'label_off_outlined'},
    {'icon': Icons.label_off_rounded, 'name': 'label_off_rounded'},
    {'icon': Icons.label_off_sharp, 'name': 'label_off_sharp'},
    {'icon': Icons.label_outline, 'name': 'label_outline'},
    {'icon': Icons.label_outline_rounded, 'name': 'label_outline_rounded'},
    {'icon': Icons.label_outline_sharp, 'name': 'label_outline_sharp'},
    {'icon': Icons.label_outlined, 'name': 'label_outlined'},
    {'icon': Icons.label_rounded, 'name': 'label_rounded'},
    {'icon': Icons.label_sharp, 'name': 'label_sharp'},
    {'icon': Icons.landscape, 'name': 'landscape'},
    {'icon': Icons.landscape_outlined, 'name': 'landscape_outlined'},
    {'icon': Icons.landscape_rounded, 'name': 'landscape_rounded'},
    {'icon': Icons.landscape_sharp, 'name': 'landscape_sharp'},
    {'icon': Icons.language, 'name': 'language'},
    {'icon': Icons.language_outlined, 'name': 'language_outlined'},
    {'icon': Icons.language_rounded, 'name': 'language_rounded'},
    {'icon': Icons.language_sharp, 'name': 'language_sharp'},
    {'icon': Icons.laptop, 'name': 'laptop'},
    {'icon': Icons.laptop_chromebook, 'name': 'laptop_chromebook'},
    {
      'icon': Icons.laptop_chromebook_outlined,
      'name': 'laptop_chromebook_outlined'
    },
    {
      'icon': Icons.laptop_chromebook_rounded,
      'name': 'laptop_chromebook_rounded'
    },
    {'icon': Icons.laptop_chromebook_sharp, 'name': 'laptop_chromebook_sharp'},
    {'icon': Icons.laptop_mac, 'name': 'laptop_mac'},
    {'icon': Icons.laptop_mac_outlined, 'name': 'laptop_mac_outlined'},
    {'icon': Icons.laptop_mac_rounded, 'name': 'laptop_mac_rounded'},
    {'icon': Icons.laptop_mac_sharp, 'name': 'laptop_mac_sharp'},
    {'icon': Icons.laptop_outlined, 'name': 'laptop_outlined'},
    {'icon': Icons.laptop_rounded, 'name': 'laptop_rounded'},
    {'icon': Icons.laptop_sharp, 'name': 'laptop_sharp'},
    {'icon': Icons.laptop_windows, 'name': 'laptop_windows'},
    {'icon': Icons.laptop_windows_outlined, 'name': 'laptop_windows_outlined'},
    {'icon': Icons.laptop_windows_rounded, 'name': 'laptop_windows_rounded'},
    {'icon': Icons.laptop_windows_sharp, 'name': 'laptop_windows_sharp'},
    {'icon': Icons.last_page, 'name': 'last_page'},
    {'icon': Icons.last_page_outlined, 'name': 'last_page_outlined'},
    {'icon': Icons.last_page_rounded, 'name': 'last_page_rounded'},
    {'icon': Icons.last_page_sharp, 'name': 'last_page_sharp'},
    {'icon': Icons.launch, 'name': 'launch'},
    {'icon': Icons.launch_outlined, 'name': 'launch_outlined'},
    {'icon': Icons.launch_rounded, 'name': 'launch_rounded'},
    {'icon': Icons.launch_sharp, 'name': 'launch_sharp'},
    {'icon': Icons.layers, 'name': 'layers'},
    {'icon': Icons.layers_clear, 'name': 'layers_clear'},
    {'icon': Icons.layers_clear_outlined, 'name': 'layers_clear_outlined'},
    {'icon': Icons.layers_clear_rounded, 'name': 'layers_clear_rounded'},
    {'icon': Icons.layers_clear_sharp, 'name': 'layers_clear_sharp'},
    {'icon': Icons.layers_outlined, 'name': 'layers_outlined'},
    {'icon': Icons.layers_rounded, 'name': 'layers_rounded'},
    {'icon': Icons.layers_sharp, 'name': 'layers_sharp'},
    {'icon': Icons.leaderboard, 'name': 'leaderboard'},
    {'icon': Icons.leaderboard_outlined, 'name': 'leaderboard_outlined'},
    {'icon': Icons.leaderboard_rounded, 'name': 'leaderboard_rounded'},
    {'icon': Icons.leaderboard_sharp, 'name': 'leaderboard_sharp'},
    {'icon': Icons.leak_add, 'name': 'leak_add'},
    {'icon': Icons.leak_add_outlined, 'name': 'leak_add_outlined'},
    {'icon': Icons.leak_add_rounded, 'name': 'leak_add_rounded'},
    {'icon': Icons.leak_add_sharp, 'name': 'leak_add_sharp'},
    {'icon': Icons.leak_remove, 'name': 'leak_remove'},
    {'icon': Icons.leak_remove_outlined, 'name': 'leak_remove_outlined'},
    {'icon': Icons.leak_remove_rounded, 'name': 'leak_remove_rounded'},
    {'icon': Icons.leak_remove_sharp, 'name': 'leak_remove_sharp'},
    {'icon': Icons.leave_bags_at_home, 'name': 'leave_bags_at_home'},
    {
      'icon': Icons.leave_bags_at_home_outlined,
      'name': 'leave_bags_at_home_outlined'
    },
    {
      'icon': Icons.leave_bags_at_home_rounded,
      'name': 'leave_bags_at_home_rounded'
    },
    {
      'icon': Icons.leave_bags_at_home_sharp,
      'name': 'leave_bags_at_home_sharp'
    },
    {'icon': Icons.legend_toggle, 'name': 'legend_toggle'},
    {'icon': Icons.legend_toggle_outlined, 'name': 'legend_toggle_outlined'},
    {'icon': Icons.legend_toggle_rounded, 'name': 'legend_toggle_rounded'},
    {'icon': Icons.legend_toggle_sharp, 'name': 'legend_toggle_sharp'},
    {'icon': Icons.lens, 'name': 'lens'},
    {'icon': Icons.lens_outlined, 'name': 'lens_outlined'},
    {'icon': Icons.lens_rounded, 'name': 'lens_rounded'},
    {'icon': Icons.lens_sharp, 'name': 'lens_sharp'},
    {'icon': Icons.library_add, 'name': 'library_add'},
    {'icon': Icons.library_add_check, 'name': 'library_add_check'},
    {
      'icon': Icons.library_add_check_outlined,
      'name': 'library_add_check_outlined'
    },
    {
      'icon': Icons.library_add_check_rounded,
      'name': 'library_add_check_rounded'
    },
    {'icon': Icons.library_add_check_sharp, 'name': 'library_add_check_sharp'},
    {'icon': Icons.library_add_outlined, 'name': 'library_add_outlined'},
    {'icon': Icons.library_add_rounded, 'name': 'library_add_rounded'},
    {'icon': Icons.library_add_sharp, 'name': 'library_add_sharp'},
    {'icon': Icons.library_books, 'name': 'library_books'},
    {'icon': Icons.library_books_outlined, 'name': 'library_books_outlined'},
    {'icon': Icons.library_books_rounded, 'name': 'library_books_rounded'},
    {'icon': Icons.library_books_sharp, 'name': 'library_books_sharp'},
    {'icon': Icons.library_music, 'name': 'library_music'},
    {'icon': Icons.library_music_outlined, 'name': 'library_music_outlined'},
    {'icon': Icons.library_music_rounded, 'name': 'library_music_rounded'},
    {'icon': Icons.library_music_sharp, 'name': 'library_music_sharp'},
    {'icon': Icons.lightbulb, 'name': 'lightbulb'},
    {'icon': Icons.lightbulb_outline, 'name': 'lightbulb_outline'},
    {
      'icon': Icons.lightbulb_outline_rounded,
      'name': 'lightbulb_outline_rounded'
    },
    {'icon': Icons.lightbulb_outline_sharp, 'name': 'lightbulb_outline_sharp'},
    {'icon': Icons.lightbulb_outlined, 'name': 'lightbulb_outlined'},
    {'icon': Icons.line_style, 'name': 'line_style'},
    {'icon': Icons.line_style_outlined, 'name': 'line_style_outlined'},
    {'icon': Icons.line_style_rounded, 'name': 'line_style_rounded'},
    {'icon': Icons.line_style_sharp, 'name': 'line_style_sharp'},
    {'icon': Icons.line_weight, 'name': 'line_weight'},
    {'icon': Icons.line_weight_outlined, 'name': 'line_weight_outlined'},
    {'icon': Icons.line_weight_rounded, 'name': 'line_weight_rounded'},
    {'icon': Icons.line_weight_sharp, 'name': 'line_weight_sharp'},
    {'icon': Icons.linear_scale, 'name': 'linear_scale'},
    {'icon': Icons.linear_scale_outlined, 'name': 'linear_scale_outlined'},
    {'icon': Icons.linear_scale_rounded, 'name': 'linear_scale_rounded'},
    {'icon': Icons.linear_scale_sharp, 'name': 'linear_scale_sharp'},
    {'icon': Icons.link, 'name': 'link'},
    {'icon': Icons.link_off, 'name': 'link_off'},
    {'icon': Icons.link_off_outlined, 'name': 'link_off_outlined'},
    {'icon': Icons.link_off_rounded, 'name': 'link_off_rounded'},
    {'icon': Icons.link_off_sharp, 'name': 'link_off_sharp'},
    {'icon': Icons.link_outlined, 'name': 'link_outlined'},
    {'icon': Icons.link_rounded, 'name': 'link_rounded'},
    {'icon': Icons.link_sharp, 'name': 'link_sharp'},
    {'icon': Icons.linked_camera, 'name': 'linked_camera'},
    {'icon': Icons.linked_camera_outlined, 'name': 'linked_camera_outlined'},
    {'icon': Icons.linked_camera_rounded, 'name': 'linked_camera_rounded'},
    {'icon': Icons.linked_camera_sharp, 'name': 'linked_camera_sharp'},
    {'icon': Icons.liquor, 'name': 'liquor'},
    {'icon': Icons.list, 'name': 'list'},
    {'icon': Icons.list_alt, 'name': 'list_alt'},
    {'icon': Icons.list_alt_outlined, 'name': 'list_alt_outlined'},
    {'icon': Icons.list_alt_rounded, 'name': 'list_alt_rounded'},
    {'icon': Icons.list_alt_sharp, 'name': 'list_alt_sharp'},
    {'icon': Icons.list_outlined, 'name': 'list_outlined'},
    {'icon': Icons.list_rounded, 'name': 'list_rounded'},
    {'icon': Icons.list_sharp, 'name': 'list_sharp'},
    {'icon': Icons.live_help, 'name': 'live_help'},
    {'icon': Icons.live_help_outlined, 'name': 'live_help_outlined'},
    {'icon': Icons.live_help_rounded, 'name': 'live_help_rounded'},
    {'icon': Icons.live_help_sharp, 'name': 'live_help_sharp'},
    {'icon': Icons.live_tv, 'name': 'live_tv'},
    {'icon': Icons.live_tv_outlined, 'name': 'live_tv_outlined'},
    {'icon': Icons.live_tv_rounded, 'name': 'live_tv_rounded'},
    {'icon': Icons.live_tv_sharp, 'name': 'live_tv_sharp'},
    {'icon': Icons.local_activity, 'name': 'local_activity'},
    {'icon': Icons.local_activity_outlined, 'name': 'local_activity_outlined'},
    {'icon': Icons.local_activity_rounded, 'name': 'local_activity_rounded'},
    {'icon': Icons.local_activity_sharp, 'name': 'local_activity_sharp'},
    {'icon': Icons.local_airport, 'name': 'local_airport'},
    {'icon': Icons.local_airport_outlined, 'name': 'local_airport_outlined'},
    {'icon': Icons.local_airport_rounded, 'name': 'local_airport_rounded'},
    {'icon': Icons.local_airport_sharp, 'name': 'local_airport_sharp'},
    {'icon': Icons.local_atm, 'name': 'local_atm'},
    {'icon': Icons.local_atm_outlined, 'name': 'local_atm_outlined'},
    {'icon': Icons.local_atm_rounded, 'name': 'local_atm_rounded'},
    {'icon': Icons.local_atm_sharp, 'name': 'local_atm_sharp'},
    {'icon': Icons.local_attraction, 'name': 'local_attraction'},
    {
      'icon': Icons.local_attraction_outlined,
      'name': 'local_attraction_outlined'
    },
    {
      'icon': Icons.local_attraction_rounded,
      'name': 'local_attraction_rounded'
    },
    {'icon': Icons.local_attraction_sharp, 'name': 'local_attraction_sharp'},
    {'icon': Icons.local_bar, 'name': 'local_bar'},
    {'icon': Icons.local_bar_outlined, 'name': 'local_bar_outlined'},
    {'icon': Icons.local_bar_rounded, 'name': 'local_bar_rounded'},
    {'icon': Icons.local_bar_sharp, 'name': 'local_bar_sharp'},
    {'icon': Icons.local_cafe, 'name': 'local_cafe'},
    {'icon': Icons.local_cafe_outlined, 'name': 'local_cafe_outlined'},
    {'icon': Icons.local_cafe_rounded, 'name': 'local_cafe_rounded'},
    {'icon': Icons.local_cafe_sharp, 'name': 'local_cafe_sharp'},
    {'icon': Icons.local_car_wash, 'name': 'local_car_wash'},
    {'icon': Icons.local_car_wash_outlined, 'name': 'local_car_wash_outlined'},
    {'icon': Icons.local_car_wash_rounded, 'name': 'local_car_wash_rounded'},
    {'icon': Icons.local_car_wash_sharp, 'name': 'local_car_wash_sharp'},
    {'icon': Icons.local_convenience_store, 'name': 'local_convenience_store'},
    {
      'icon': Icons.local_convenience_store_outlined,
      'name': 'local_convenience_store_outlined'
    },
    {
      'icon': Icons.local_convenience_store_rounded,
      'name': 'local_convenience_store_rounded'
    },
    {
      'icon': Icons.local_convenience_store_sharp,
      'name': 'local_convenience_store_sharp'
    },
    {'icon': Icons.local_dining, 'name': 'local_dining'},
    {'icon': Icons.local_dining_outlined, 'name': 'local_dining_outlined'},
    {'icon': Icons.local_dining_rounded, 'name': 'local_dining_rounded'},
    {'icon': Icons.local_dining_sharp, 'name': 'local_dining_sharp'},
    {'icon': Icons.local_drink, 'name': 'local_drink'},
    {'icon': Icons.local_drink_outlined, 'name': 'local_drink_outlined'},
    {'icon': Icons.local_drink_rounded, 'name': 'local_drink_rounded'},
    {'icon': Icons.local_drink_sharp, 'name': 'local_drink_sharp'},
    {'icon': Icons.local_fire_department, 'name': 'local_fire_department'},
    {
      'icon': Icons.local_fire_department_outlined,
      'name': 'local_fire_department_outlined'
    },
    {
      'icon': Icons.local_fire_department_rounded,
      'name': 'local_fire_department_rounded'
    },
    {
      'icon': Icons.local_fire_department_sharp,
      'name': 'local_fire_department_sharp'
    },
    {'icon': Icons.local_florist, 'name': 'local_florist'},
    {'icon': Icons.local_florist_outlined, 'name': 'local_florist_outlined'},
    {'icon': Icons.local_florist_rounded, 'name': 'local_florist_rounded'},
    {'icon': Icons.local_florist_sharp, 'name': 'local_florist_sharp'},
    {'icon': Icons.local_gas_station, 'name': 'local_gas_station'},
    {
      'icon': Icons.local_gas_station_outlined,
      'name': 'local_gas_station_outlined'
    },
    {
      'icon': Icons.local_gas_station_rounded,
      'name': 'local_gas_station_rounded'
    },
    {'icon': Icons.local_gas_station_sharp, 'name': 'local_gas_station_sharp'},
    {'icon': Icons.local_grocery_store, 'name': 'local_grocery_store'},
    {
      'icon': Icons.local_grocery_store_outlined,
      'name': 'local_grocery_store_outlined'
    },
    {
      'icon': Icons.local_grocery_store_rounded,
      'name': 'local_grocery_store_rounded'
    },
    {
      'icon': Icons.local_grocery_store_sharp,
      'name': 'local_grocery_store_sharp'
    },
    {'icon': Icons.local_hospital, 'name': 'local_hospital'},
    {'icon': Icons.local_hospital_outlined, 'name': 'local_hospital_outlined'},
    {'icon': Icons.local_hospital_rounded, 'name': 'local_hospital_rounded'},
    {'icon': Icons.local_hospital_sharp, 'name': 'local_hospital_sharp'},
    {'icon': Icons.local_hotel, 'name': 'local_hotel'},
    {'icon': Icons.local_hotel_outlined, 'name': 'local_hotel_outlined'},
    {'icon': Icons.local_hotel_rounded, 'name': 'local_hotel_rounded'},
    {'icon': Icons.local_hotel_sharp, 'name': 'local_hotel_sharp'},
    {'icon': Icons.local_laundry_service, 'name': 'local_laundry_service'},
    {
      'icon': Icons.local_laundry_service_outlined,
      'name': 'local_laundry_service_outlined'
    },
    {
      'icon': Icons.local_laundry_service_rounded,
      'name': 'local_laundry_service_rounded'
    },
    {
      'icon': Icons.local_laundry_service_sharp,
      'name': 'local_laundry_service_sharp'
    },
    {'icon': Icons.local_library, 'name': 'local_library'},
    {'icon': Icons.local_library_outlined, 'name': 'local_library_outlined'},
    {'icon': Icons.local_library_rounded, 'name': 'local_library_rounded'},
    {'icon': Icons.local_library_sharp, 'name': 'local_library_sharp'},
    {'icon': Icons.local_mall, 'name': 'local_mall'},
    {'icon': Icons.local_mall_outlined, 'name': 'local_mall_outlined'},
    {'icon': Icons.local_mall_rounded, 'name': 'local_mall_rounded'},
    {'icon': Icons.local_mall_sharp, 'name': 'local_mall_sharp'},
    {'icon': Icons.local_movies, 'name': 'local_movies'},
    {'icon': Icons.local_movies_outlined, 'name': 'local_movies_outlined'},
    {'icon': Icons.local_movies_rounded, 'name': 'local_movies_rounded'},
    {'icon': Icons.local_movies_sharp, 'name': 'local_movies_sharp'},
    {'icon': Icons.local_offer, 'name': 'local_offer'},
    {'icon': Icons.local_offer_outlined, 'name': 'local_offer_outlined'},
    {'icon': Icons.local_offer_rounded, 'name': 'local_offer_rounded'},
    {'icon': Icons.local_offer_sharp, 'name': 'local_offer_sharp'},
    {'icon': Icons.local_parking, 'name': 'local_parking'},
    {'icon': Icons.local_parking_outlined, 'name': 'local_parking_outlined'},
    {'icon': Icons.local_parking_rounded, 'name': 'local_parking_rounded'},
    {'icon': Icons.local_parking_sharp, 'name': 'local_parking_sharp'},
    {'icon': Icons.local_pharmacy, 'name': 'local_pharmacy'},
    {'icon': Icons.local_pharmacy_outlined, 'name': 'local_pharmacy_outlined'},
    {'icon': Icons.local_pharmacy_rounded, 'name': 'local_pharmacy_rounded'},
    {'icon': Icons.local_pharmacy_sharp, 'name': 'local_pharmacy_sharp'},
    {'icon': Icons.local_phone, 'name': 'local_phone'},
    {'icon': Icons.local_phone_outlined, 'name': 'local_phone_outlined'},
    {'icon': Icons.local_phone_rounded, 'name': 'local_phone_rounded'},
    {'icon': Icons.local_phone_sharp, 'name': 'local_phone_sharp'},
    {'icon': Icons.local_pizza, 'name': 'local_pizza'},
    {'icon': Icons.local_pizza_outlined, 'name': 'local_pizza_outlined'},
    {'icon': Icons.local_pizza_rounded, 'name': 'local_pizza_rounded'},
    {'icon': Icons.local_pizza_sharp, 'name': 'local_pizza_sharp'},
    {'icon': Icons.local_play, 'name': 'local_play'},
    {'icon': Icons.local_play_outlined, 'name': 'local_play_outlined'},
    {'icon': Icons.local_play_rounded, 'name': 'local_play_rounded'},
    {'icon': Icons.local_play_sharp, 'name': 'local_play_sharp'},
    {'icon': Icons.local_police, 'name': 'local_police'},
    {'icon': Icons.local_police_outlined, 'name': 'local_police_outlined'},
    {'icon': Icons.local_police_rounded, 'name': 'local_police_rounded'},
    {'icon': Icons.local_police_sharp, 'name': 'local_police_sharp'},
    {'icon': Icons.local_post_office, 'name': 'local_post_office'},
    {
      'icon': Icons.local_post_office_outlined,
      'name': 'local_post_office_outlined'
    },
    {
      'icon': Icons.local_post_office_rounded,
      'name': 'local_post_office_rounded'
    },
    {'icon': Icons.local_post_office_sharp, 'name': 'local_post_office_sharp'},
    {'icon': Icons.local_print_shop, 'name': 'local_print_shop'},
    {
      'icon': Icons.local_print_shop_outlined,
      'name': 'local_print_shop_outlined'
    },
    {
      'icon': Icons.local_print_shop_rounded,
      'name': 'local_print_shop_rounded'
    },
    {'icon': Icons.local_print_shop_sharp, 'name': 'local_print_shop_sharp'},
    {'icon': Icons.local_printshop, 'name': 'local_printshop'},
    {
      'icon': Icons.local_printshop_outlined,
      'name': 'local_printshop_outlined'
    },
    {'icon': Icons.local_printshop_rounded, 'name': 'local_printshop_rounded'},
    {'icon': Icons.local_printshop_sharp, 'name': 'local_printshop_sharp'},
    {'icon': Icons.local_restaurant, 'name': 'local_restaurant'},
    {
      'icon': Icons.local_restaurant_outlined,
      'name': 'local_restaurant_outlined'
    },
    {
      'icon': Icons.local_restaurant_rounded,
      'name': 'local_restaurant_rounded'
    },
    {'icon': Icons.local_restaurant_sharp, 'name': 'local_restaurant_sharp'},
    {'icon': Icons.local_see, 'name': 'local_see'},
    {'icon': Icons.local_see_outlined, 'name': 'local_see_outlined'},
    {'icon': Icons.local_see_rounded, 'name': 'local_see_rounded'},
    {'icon': Icons.local_see_sharp, 'name': 'local_see_sharp'},
    {'icon': Icons.local_shipping, 'name': 'local_shipping'},
    {'icon': Icons.local_shipping_outlined, 'name': 'local_shipping_outlined'},
    {'icon': Icons.local_shipping_rounded, 'name': 'local_shipping_rounded'},
    {'icon': Icons.local_shipping_sharp, 'name': 'local_shipping_sharp'},
    {'icon': Icons.local_taxi, 'name': 'local_taxi'},
    {'icon': Icons.local_taxi_outlined, 'name': 'local_taxi_outlined'},
    {'icon': Icons.local_taxi_rounded, 'name': 'local_taxi_rounded'},
    {'icon': Icons.local_taxi_sharp, 'name': 'local_taxi_sharp'},
    {'icon': Icons.location_city, 'name': 'location_city'},
    {'icon': Icons.location_city_outlined, 'name': 'location_city_outlined'},
    {'icon': Icons.location_city_rounded, 'name': 'location_city_rounded'},
    {'icon': Icons.location_city_sharp, 'name': 'location_city_sharp'},
    {'icon': Icons.location_disabled, 'name': 'location_disabled'},
    {
      'icon': Icons.location_disabled_outlined,
      'name': 'location_disabled_outlined'
    },
    {
      'icon': Icons.location_disabled_rounded,
      'name': 'location_disabled_rounded'
    },
    {'icon': Icons.location_disabled_sharp, 'name': 'location_disabled_sharp'},
    {'icon': Icons.location_history, 'name': 'location_history'},
    {
      'icon': Icons.location_history_outlined,
      'name': 'location_history_outlined'
    },
    {
      'icon': Icons.location_history_rounded,
      'name': 'location_history_rounded'
    },
    {'icon': Icons.location_history_sharp, 'name': 'location_history_sharp'},
    {'icon': Icons.location_off, 'name': 'location_off'},
    {'icon': Icons.location_off_outlined, 'name': 'location_off_outlined'},
    {'icon': Icons.location_off_rounded, 'name': 'location_off_rounded'},
    {'icon': Icons.location_off_sharp, 'name': 'location_off_sharp'},
    {'icon': Icons.location_on, 'name': 'location_on'},
    {'icon': Icons.location_on_outlined, 'name': 'location_on_outlined'},
    {'icon': Icons.location_on_rounded, 'name': 'location_on_rounded'},
    {'icon': Icons.location_on_sharp, 'name': 'location_on_sharp'},
    {'icon': Icons.location_pin, 'name': 'location_pin'},
    {'icon': Icons.location_searching, 'name': 'location_searching'},
    {
      'icon': Icons.location_searching_outlined,
      'name': 'location_searching_outlined'
    },
    {
      'icon': Icons.location_searching_rounded,
      'name': 'location_searching_rounded'
    },
    {
      'icon': Icons.location_searching_sharp,
      'name': 'location_searching_sharp'
    },
    {'icon': Icons.lock, 'name': 'lock'},
    {'icon': Icons.lock_clock, 'name': 'lock_clock'},
    {'icon': Icons.lock_open, 'name': 'lock_open'},
    {'icon': Icons.lock_open_outlined, 'name': 'lock_open_outlined'},
    {'icon': Icons.lock_open_rounded, 'name': 'lock_open_rounded'},
    {'icon': Icons.lock_open_sharp, 'name': 'lock_open_sharp'},
    {'icon': Icons.lock_outline, 'name': 'lock_outline'},
    {'icon': Icons.lock_outline_rounded, 'name': 'lock_outline_rounded'},
    {'icon': Icons.lock_outline_sharp, 'name': 'lock_outline_sharp'},
    {'icon': Icons.lock_outlined, 'name': 'lock_outlined'},
    {'icon': Icons.lock_rounded, 'name': 'lock_rounded'},
    {'icon': Icons.lock_sharp, 'name': 'lock_sharp'},
    {'icon': Icons.login, 'name': 'login'},
    {'icon': Icons.login_outlined, 'name': 'login_outlined'},
    {'icon': Icons.login_rounded, 'name': 'login_rounded'},
    {'icon': Icons.login_sharp, 'name': 'login_sharp'},
    {'icon': Icons.logout, 'name': 'logout'},
    {'icon': Icons.looks, 'name': 'looks'},
    {'icon': Icons.looks_3, 'name': 'looks_3'},
    {'icon': Icons.looks_3_outlined, 'name': 'looks_3_outlined'},
    {'icon': Icons.looks_3_rounded, 'name': 'looks_3_rounded'},
    {'icon': Icons.looks_3_sharp, 'name': 'looks_3_sharp'},
    {'icon': Icons.looks_4, 'name': 'looks_4'},
    {'icon': Icons.looks_4_outlined, 'name': 'looks_4_outlined'},
    {'icon': Icons.looks_4_rounded, 'name': 'looks_4_rounded'},
    {'icon': Icons.looks_4_sharp, 'name': 'looks_4_sharp'},
    {'icon': Icons.looks_5, 'name': 'looks_5'},
    {'icon': Icons.looks_5_outlined, 'name': 'looks_5_outlined'},
    {'icon': Icons.looks_5_rounded, 'name': 'looks_5_rounded'},
    {'icon': Icons.looks_5_sharp, 'name': 'looks_5_sharp'},
    {'icon': Icons.looks_6, 'name': 'looks_6'},
    {'icon': Icons.looks_6_outlined, 'name': 'looks_6_outlined'},
    {'icon': Icons.looks_6_rounded, 'name': 'looks_6_rounded'},
    {'icon': Icons.looks_6_sharp, 'name': 'looks_6_sharp'},
    {'icon': Icons.looks_one, 'name': 'looks_one'},
    {'icon': Icons.looks_one_outlined, 'name': 'looks_one_outlined'},
    {'icon': Icons.looks_one_rounded, 'name': 'looks_one_rounded'},
    {'icon': Icons.looks_one_sharp, 'name': 'looks_one_sharp'},
    {'icon': Icons.looks_outlined, 'name': 'looks_outlined'},
    {'icon': Icons.looks_rounded, 'name': 'looks_rounded'},
    {'icon': Icons.looks_sharp, 'name': 'looks_sharp'},
    {'icon': Icons.looks_two, 'name': 'looks_two'},
    {'icon': Icons.looks_two_outlined, 'name': 'looks_two_outlined'},
    {'icon': Icons.looks_two_rounded, 'name': 'looks_two_rounded'},
    {'icon': Icons.looks_two_sharp, 'name': 'looks_two_sharp'},
    {'icon': Icons.loop, 'name': 'loop'},
    {'icon': Icons.loop_outlined, 'name': 'loop_outlined'},
    {'icon': Icons.loop_rounded, 'name': 'loop_rounded'},
    {'icon': Icons.loop_sharp, 'name': 'loop_sharp'},
    {'icon': Icons.loupe, 'name': 'loupe'},
    {'icon': Icons.loupe_outlined, 'name': 'loupe_outlined'},
    {'icon': Icons.loupe_rounded, 'name': 'loupe_rounded'},
    {'icon': Icons.loupe_sharp, 'name': 'loupe_sharp'},
    {'icon': Icons.low_priority, 'name': 'low_priority'},
    {'icon': Icons.low_priority_outlined, 'name': 'low_priority_outlined'},
    {'icon': Icons.low_priority_rounded, 'name': 'low_priority_rounded'},
    {'icon': Icons.low_priority_sharp, 'name': 'low_priority_sharp'},
    {'icon': Icons.loyalty, 'name': 'loyalty'},
    {'icon': Icons.loyalty_outlined, 'name': 'loyalty_outlined'},
    {'icon': Icons.loyalty_rounded, 'name': 'loyalty_rounded'},
    {'icon': Icons.loyalty_sharp, 'name': 'loyalty_sharp'},
    {'icon': Icons.lunch_dining, 'name': 'lunch_dining'},
    {'icon': Icons.mail, 'name': 'mail'},
    {'icon': Icons.mail_outline, 'name': 'mail_outline'},
    {'icon': Icons.mail_outline_outlined, 'name': 'mail_outline_outlined'},
    {'icon': Icons.mail_outline_rounded, 'name': 'mail_outline_rounded'},
    {'icon': Icons.mail_outline_sharp, 'name': 'mail_outline_sharp'},
    {'icon': Icons.mail_outlined, 'name': 'mail_outlined'},
    {'icon': Icons.mail_rounded, 'name': 'mail_rounded'},
    {'icon': Icons.mail_sharp, 'name': 'mail_sharp'},
    {'icon': Icons.map, 'name': 'map'},
    {'icon': Icons.map_outlined, 'name': 'map_outlined'},
    {'icon': Icons.map_rounded, 'name': 'map_rounded'},
    {'icon': Icons.map_sharp, 'name': 'map_sharp'},
    {'icon': Icons.maps_ugc, 'name': 'maps_ugc'},
    {'icon': Icons.maps_ugc_outlined, 'name': 'maps_ugc_outlined'},
    {'icon': Icons.maps_ugc_rounded, 'name': 'maps_ugc_rounded'},
    {'icon': Icons.maps_ugc_sharp, 'name': 'maps_ugc_sharp'},
    {'icon': Icons.margin, 'name': 'margin'},
    {'icon': Icons.mark_as_unread, 'name': 'mark_as_unread'},
    {'icon': Icons.mark_chat_read, 'name': 'mark_chat_read'},
    {'icon': Icons.mark_chat_read_outlined, 'name': 'mark_chat_read_outlined'},
    {'icon': Icons.mark_chat_read_rounded, 'name': 'mark_chat_read_rounded'},
    {'icon': Icons.mark_chat_read_sharp, 'name': 'mark_chat_read_sharp'},
    {'icon': Icons.mark_chat_unread, 'name': 'mark_chat_unread'},
    {
      'icon': Icons.mark_chat_unread_outlined,
      'name': 'mark_chat_unread_outlined'
    },
    {
      'icon': Icons.mark_chat_unread_rounded,
      'name': 'mark_chat_unread_rounded'
    },
    {'icon': Icons.mark_chat_unread_sharp, 'name': 'mark_chat_unread_sharp'},
    {'icon': Icons.mark_email_read, 'name': 'mark_email_read'},
    {
      'icon': Icons.mark_email_read_outlined,
      'name': 'mark_email_read_outlined'
    },
    {'icon': Icons.mark_email_read_rounded, 'name': 'mark_email_read_rounded'},
    {'icon': Icons.mark_email_read_sharp, 'name': 'mark_email_read_sharp'},
    {'icon': Icons.mark_email_unread, 'name': 'mark_email_unread'},
    {
      'icon': Icons.mark_email_unread_outlined,
      'name': 'mark_email_unread_outlined'
    },
    {
      'icon': Icons.mark_email_unread_rounded,
      'name': 'mark_email_unread_rounded'
    },
    {'icon': Icons.mark_email_unread_sharp, 'name': 'mark_email_unread_sharp'},
    {'icon': Icons.markunread, 'name': 'markunread'},
    {'icon': Icons.markunread_mailbox, 'name': 'markunread_mailbox'},
    {
      'icon': Icons.markunread_mailbox_outlined,
      'name': 'markunread_mailbox_outlined'
    },
    {
      'icon': Icons.markunread_mailbox_rounded,
      'name': 'markunread_mailbox_rounded'
    },
    {
      'icon': Icons.markunread_mailbox_sharp,
      'name': 'markunread_mailbox_sharp'
    },
    {'icon': Icons.markunread_outlined, 'name': 'markunread_outlined'},
    {'icon': Icons.markunread_rounded, 'name': 'markunread_rounded'},
    {'icon': Icons.markunread_sharp, 'name': 'markunread_sharp'},
    {'icon': Icons.masks, 'name': 'masks'},
    {'icon': Icons.masks_outlined, 'name': 'masks_outlined'},
    {'icon': Icons.masks_rounded, 'name': 'masks_rounded'},
    {'icon': Icons.masks_sharp, 'name': 'masks_sharp'},
    {'icon': Icons.maximize, 'name': 'maximize'},
    {'icon': Icons.maximize_outlined, 'name': 'maximize_outlined'},
    {'icon': Icons.maximize_rounded, 'name': 'maximize_rounded'},
    {'icon': Icons.maximize_sharp, 'name': 'maximize_sharp'},
    {'icon': Icons.mediation, 'name': 'mediation'},
    {'icon': Icons.mediation_outlined, 'name': 'mediation_outlined'},
    {'icon': Icons.mediation_rounded, 'name': 'mediation_rounded'},
    {'icon': Icons.mediation_sharp, 'name': 'mediation_sharp'},
    {'icon': Icons.medical_services, 'name': 'medical_services'},
    {
      'icon': Icons.medical_services_outlined,
      'name': 'medical_services_outlined'
    },
    {
      'icon': Icons.medical_services_rounded,
      'name': 'medical_services_rounded'
    },
    {'icon': Icons.medical_services_sharp, 'name': 'medical_services_sharp'},
    {'icon': Icons.meeting_room, 'name': 'meeting_room'},
    {'icon': Icons.meeting_room_outlined, 'name': 'meeting_room_outlined'},
    {'icon': Icons.meeting_room_rounded, 'name': 'meeting_room_rounded'},
    {'icon': Icons.meeting_room_sharp, 'name': 'meeting_room_sharp'},
    {'icon': Icons.memory, 'name': 'memory'},
    {'icon': Icons.memory_outlined, 'name': 'memory_outlined'},
    {'icon': Icons.memory_rounded, 'name': 'memory_rounded'},
    {'icon': Icons.memory_sharp, 'name': 'memory_sharp'},
    {'icon': Icons.menu, 'name': 'menu'},
    {'icon': Icons.menu_book, 'name': 'menu_book'},
    {'icon': Icons.menu_book_outlined, 'name': 'menu_book_outlined'},
    {'icon': Icons.menu_book_rounded, 'name': 'menu_book_rounded'},
    {'icon': Icons.menu_book_sharp, 'name': 'menu_book_sharp'},
    {'icon': Icons.menu_open, 'name': 'menu_open'},
    {'icon': Icons.menu_open_outlined, 'name': 'menu_open_outlined'},
    {'icon': Icons.menu_open_rounded, 'name': 'menu_open_rounded'},
    {'icon': Icons.menu_open_sharp, 'name': 'menu_open_sharp'},
    {'icon': Icons.menu_outlined, 'name': 'menu_outlined'},
    {'icon': Icons.menu_rounded, 'name': 'menu_rounded'},
    {'icon': Icons.menu_sharp, 'name': 'menu_sharp'},
    {'icon': Icons.merge_type, 'name': 'merge_type'},
    {'icon': Icons.merge_type_outlined, 'name': 'merge_type_outlined'},
    {'icon': Icons.merge_type_rounded, 'name': 'merge_type_rounded'},
    {'icon': Icons.merge_type_sharp, 'name': 'merge_type_sharp'},
    {'icon': Icons.message, 'name': 'message'},
    {'icon': Icons.message_outlined, 'name': 'message_outlined'},
    {'icon': Icons.message_rounded, 'name': 'message_rounded'},
    {'icon': Icons.message_sharp, 'name': 'message_sharp'},
    {'icon': Icons.messenger, 'name': 'messenger'},
    {'icon': Icons.messenger_outline, 'name': 'messenger_outline'},
    {
      'icon': Icons.messenger_outline_outlined,
      'name': 'messenger_outline_outlined'
    },
    {
      'icon': Icons.messenger_outline_rounded,
      'name': 'messenger_outline_rounded'
    },
    {'icon': Icons.messenger_outline_sharp, 'name': 'messenger_outline_sharp'},
    {'icon': Icons.messenger_outlined, 'name': 'messenger_outlined'},
    {'icon': Icons.messenger_rounded, 'name': 'messenger_rounded'},
    {'icon': Icons.messenger_sharp, 'name': 'messenger_sharp'},
    {'icon': Icons.mic, 'name': 'mic'},
    {'icon': Icons.mic_external_off, 'name': 'mic_external_off'},
    {'icon': Icons.mic_external_on, 'name': 'mic_external_on'},
    {'icon': Icons.mic_none, 'name': 'mic_none'},
    {'icon': Icons.mic_none_outlined, 'name': 'mic_none_outlined'},
    {'icon': Icons.mic_none_rounded, 'name': 'mic_none_rounded'},
    {'icon': Icons.mic_none_sharp, 'name': 'mic_none_sharp'},
    {'icon': Icons.mic_off, 'name': 'mic_off'},
    {'icon': Icons.mic_off_outlined, 'name': 'mic_off_outlined'},
    {'icon': Icons.mic_off_rounded, 'name': 'mic_off_rounded'},
    {'icon': Icons.mic_off_sharp, 'name': 'mic_off_sharp'},
    {'icon': Icons.mic_outlined, 'name': 'mic_outlined'},
    {'icon': Icons.mic_rounded, 'name': 'mic_rounded'},
    {'icon': Icons.mic_sharp, 'name': 'mic_sharp'},
    {'icon': Icons.microwave, 'name': 'microwave'},
    {'icon': Icons.microwave_outlined, 'name': 'microwave_outlined'},
    {'icon': Icons.microwave_rounded, 'name': 'microwave_rounded'},
    {'icon': Icons.microwave_sharp, 'name': 'microwave_sharp'},
    {'icon': Icons.military_tech, 'name': 'military_tech'},
    {'icon': Icons.military_tech_outlined, 'name': 'military_tech_outlined'},
    {'icon': Icons.military_tech_rounded, 'name': 'military_tech_rounded'},
    {'icon': Icons.military_tech_sharp, 'name': 'military_tech_sharp'},
    {'icon': Icons.minimize, 'name': 'minimize'},
    {'icon': Icons.minimize_outlined, 'name': 'minimize_outlined'},
    {'icon': Icons.minimize_rounded, 'name': 'minimize_rounded'},
    {'icon': Icons.minimize_sharp, 'name': 'minimize_sharp'},
    {'icon': Icons.miscellaneous_services, 'name': 'miscellaneous_services'},
    {
      'icon': Icons.miscellaneous_services_outlined,
      'name': 'miscellaneous_services_outlined'
    },
    {
      'icon': Icons.miscellaneous_services_rounded,
      'name': 'miscellaneous_services_rounded'
    },
    {
      'icon': Icons.miscellaneous_services_sharp,
      'name': 'miscellaneous_services_sharp'
    },
    {'icon': Icons.missed_video_call, 'name': 'missed_video_call'},
    {
      'icon': Icons.missed_video_call_outlined,
      'name': 'missed_video_call_outlined'
    },
    {
      'icon': Icons.missed_video_call_rounded,
      'name': 'missed_video_call_rounded'
    },
    {'icon': Icons.missed_video_call_sharp, 'name': 'missed_video_call_sharp'},
    {'icon': Icons.mms, 'name': 'mms'},
    {'icon': Icons.mms_outlined, 'name': 'mms_outlined'},
    {'icon': Icons.mms_rounded, 'name': 'mms_rounded'},
    {'icon': Icons.mms_sharp, 'name': 'mms_sharp'},
    {'icon': Icons.mobile_friendly, 'name': 'mobile_friendly'},
    {
      'icon': Icons.mobile_friendly_outlined,
      'name': 'mobile_friendly_outlined'
    },
    {'icon': Icons.mobile_friendly_rounded, 'name': 'mobile_friendly_rounded'},
    {'icon': Icons.mobile_friendly_sharp, 'name': 'mobile_friendly_sharp'},
    {'icon': Icons.mobile_off, 'name': 'mobile_off'},
    {'icon': Icons.mobile_off_outlined, 'name': 'mobile_off_outlined'},
    {'icon': Icons.mobile_off_rounded, 'name': 'mobile_off_rounded'},
    {'icon': Icons.mobile_off_sharp, 'name': 'mobile_off_sharp'},
    {'icon': Icons.mobile_screen_share, 'name': 'mobile_screen_share'},
    {
      'icon': Icons.mobile_screen_share_outlined,
      'name': 'mobile_screen_share_outlined'
    },
    {
      'icon': Icons.mobile_screen_share_rounded,
      'name': 'mobile_screen_share_rounded'
    },
    {
      'icon': Icons.mobile_screen_share_sharp,
      'name': 'mobile_screen_share_sharp'
    },
    {'icon': Icons.mode_comment, 'name': 'mode_comment'},
    {'icon': Icons.mode_comment_outlined, 'name': 'mode_comment_outlined'},
    {'icon': Icons.mode_comment_rounded, 'name': 'mode_comment_rounded'},
    {'icon': Icons.mode_comment_sharp, 'name': 'mode_comment_sharp'},
    {'icon': Icons.mode_edit, 'name': 'mode_edit'},
    {'icon': Icons.mode_outlined, 'name': 'mode_outlined'},
    {'icon': Icons.mode_rounded, 'name': 'mode_rounded'},
    {'icon': Icons.mode_sharp, 'name': 'mode_sharp'},
    {'icon': Icons.model_training, 'name': 'model_training'},
    {'icon': Icons.model_training_outlined, 'name': 'model_training_outlined'},
    {'icon': Icons.model_training_rounded, 'name': 'model_training_rounded'},
    {'icon': Icons.model_training_sharp, 'name': 'model_training_sharp'},
    {'icon': Icons.monetization_on, 'name': 'monetization_on'},
    {
      'icon': Icons.monetization_on_outlined,
      'name': 'monetization_on_outlined'
    },
    {'icon': Icons.monetization_on_rounded, 'name': 'monetization_on_rounded'},
    {'icon': Icons.monetization_on_sharp, 'name': 'monetization_on_sharp'},
    {'icon': Icons.money, 'name': 'money'},
    {'icon': Icons.money_off, 'name': 'money_off'},
    {
      'icon': Icons.money_off_csred_outlined,
      'name': 'money_off_csred_outlined'
    },
    {'icon': Icons.money_off_csred_rounded, 'name': 'money_off_csred_rounded'},
    {'icon': Icons.money_off_csred_sharp, 'name': 'money_off_csred_sharp'},
    {'icon': Icons.money_off_outlined, 'name': 'money_off_outlined'},
    {'icon': Icons.money_off_rounded, 'name': 'money_off_rounded'},
    {'icon': Icons.money_off_sharp, 'name': 'money_off_sharp'},
    {'icon': Icons.money_outlined, 'name': 'money_outlined'},
    {'icon': Icons.money_rounded, 'name': 'money_rounded'},
    {'icon': Icons.money_sharp, 'name': 'money_sharp'},
    {'icon': Icons.monitor, 'name': 'monitor'},
    {'icon': Icons.monochrome_photos, 'name': 'monochrome_photos'},
    {
      'icon': Icons.monochrome_photos_outlined,
      'name': 'monochrome_photos_outlined'
    },
    {
      'icon': Icons.monochrome_photos_rounded,
      'name': 'monochrome_photos_rounded'
    },
    {'icon': Icons.monochrome_photos_sharp, 'name': 'monochrome_photos_sharp'},
    {'icon': Icons.mood, 'name': 'mood'},
    {'icon': Icons.mood_bad, 'name': 'mood_bad'},
    {'icon': Icons.mood_bad_outlined, 'name': 'mood_bad_outlined'},
    {'icon': Icons.mood_bad_rounded, 'name': 'mood_bad_rounded'},
    {'icon': Icons.mood_bad_sharp, 'name': 'mood_bad_sharp'},
    {'icon': Icons.mood_outlined, 'name': 'mood_outlined'},
    {'icon': Icons.mood_rounded, 'name': 'mood_rounded'},
    {'icon': Icons.mood_sharp, 'name': 'mood_sharp'},
    {'icon': Icons.moped, 'name': 'moped'},
    {'icon': Icons.moped_outlined, 'name': 'moped_outlined'},
    {'icon': Icons.moped_rounded, 'name': 'moped_rounded'},
    {'icon': Icons.moped_sharp, 'name': 'moped_sharp'},
    {'icon': Icons.more, 'name': 'more'},
    {'icon': Icons.more_horiz, 'name': 'more_horiz'},
    {'icon': Icons.more_horiz_outlined, 'name': 'more_horiz_outlined'},
    {'icon': Icons.more_horiz_rounded, 'name': 'more_horiz_rounded'},
    {'icon': Icons.more_horiz_sharp, 'name': 'more_horiz_sharp'},
    {'icon': Icons.more_outlined, 'name': 'more_outlined'},
    {'icon': Icons.more_rounded, 'name': 'more_rounded'},
    {'icon': Icons.more_sharp, 'name': 'more_sharp'},
    {'icon': Icons.more_time, 'name': 'more_time'},
    {'icon': Icons.more_time_outlined, 'name': 'more_time_outlined'},
    {'icon': Icons.more_time_rounded, 'name': 'more_time_rounded'},
    {'icon': Icons.more_time_sharp, 'name': 'more_time_sharp'},
    {'icon': Icons.more_vert, 'name': 'more_vert'},
    {'icon': Icons.more_vert_outlined, 'name': 'more_vert_outlined'},
    {'icon': Icons.more_vert_rounded, 'name': 'more_vert_rounded'},
    {'icon': Icons.more_vert_sharp, 'name': 'more_vert_sharp'},
    {'icon': Icons.motion_photos_off, 'name': 'motion_photos_off'},
    {'icon': Icons.motion_photos_on, 'name': 'motion_photos_on'},
    {
      'icon': Icons.motion_photos_on_outlined,
      'name': 'motion_photos_on_outlined'
    },
    {
      'icon': Icons.motion_photos_on_rounded,
      'name': 'motion_photos_on_rounded'
    },
    {'icon': Icons.motion_photos_on_sharp, 'name': 'motion_photos_on_sharp'},
    {'icon': Icons.motion_photos_pause, 'name': 'motion_photos_pause'},
    {
      'icon': Icons.motion_photos_pause_outlined,
      'name': 'motion_photos_pause_outlined'
    },
    {
      'icon': Icons.motion_photos_pause_rounded,
      'name': 'motion_photos_pause_rounded'
    },
    {
      'icon': Icons.motion_photos_pause_sharp,
      'name': 'motion_photos_pause_sharp'
    },
    {'icon': Icons.motion_photos_paused, 'name': 'motion_photos_paused'},
    {
      'icon': Icons.motion_photos_paused_outlined,
      'name': 'motion_photos_paused_outlined'
    },
    {
      'icon': Icons.motion_photos_paused_rounded,
      'name': 'motion_photos_paused_rounded'
    },
    {
      'icon': Icons.motion_photos_paused_sharp,
      'name': 'motion_photos_paused_sharp'
    },
    {'icon': Icons.motorcycle, 'name': 'motorcycle'},
    {'icon': Icons.motorcycle_outlined, 'name': 'motorcycle_outlined'},
    {'icon': Icons.motorcycle_rounded, 'name': 'motorcycle_rounded'},
    {'icon': Icons.motorcycle_sharp, 'name': 'motorcycle_sharp'},
    {'icon': Icons.mouse, 'name': 'mouse'},
    {'icon': Icons.mouse_outlined, 'name': 'mouse_outlined'},
    {'icon': Icons.mouse_rounded, 'name': 'mouse_rounded'},
    {'icon': Icons.mouse_sharp, 'name': 'mouse_sharp'},
    {'icon': Icons.move_to_inbox, 'name': 'move_to_inbox'},
    {'icon': Icons.move_to_inbox_outlined, 'name': 'move_to_inbox_outlined'},
    {'icon': Icons.move_to_inbox_rounded, 'name': 'move_to_inbox_rounded'},
    {'icon': Icons.move_to_inbox_sharp, 'name': 'move_to_inbox_sharp'},
    {'icon': Icons.movie, 'name': 'movie'},
    {'icon': Icons.movie_creation, 'name': 'movie_creation'},
    {'icon': Icons.movie_creation_outlined, 'name': 'movie_creation_outlined'},
    {'icon': Icons.movie_creation_rounded, 'name': 'movie_creation_rounded'},
    {'icon': Icons.movie_creation_sharp, 'name': 'movie_creation_sharp'},
    {'icon': Icons.movie_filter, 'name': 'movie_filter'},
    {'icon': Icons.movie_filter_outlined, 'name': 'movie_filter_outlined'},
    {'icon': Icons.movie_filter_rounded, 'name': 'movie_filter_rounded'},
    {'icon': Icons.movie_filter_sharp, 'name': 'movie_filter_sharp'},
    {'icon': Icons.movie_outlined, 'name': 'movie_outlined'},
    {'icon': Icons.movie_rounded, 'name': 'movie_rounded'},
    {'icon': Icons.movie_sharp, 'name': 'movie_sharp'},
    {'icon': Icons.mp, 'name': 'mp'},
    {'icon': Icons.multiline_chart, 'name': 'multiline_chart'},
    {
      'icon': Icons.multiline_chart_outlined,
      'name': 'multiline_chart_outlined'
    },
    {'icon': Icons.multiline_chart_rounded, 'name': 'multiline_chart_rounded'},
    {'icon': Icons.multiline_chart_sharp, 'name': 'multiline_chart_sharp'},
    {'icon': Icons.multiple_stop, 'name': 'multiple_stop'},
    {'icon': Icons.multiple_stop_outlined, 'name': 'multiple_stop_outlined'},
    {'icon': Icons.multiple_stop_rounded, 'name': 'multiple_stop_rounded'},
    {'icon': Icons.multiple_stop_sharp, 'name': 'multiple_stop_sharp'},
    {'icon': Icons.multitrack_audio, 'name': 'multitrack_audio'},
    {
      'icon': Icons.multitrack_audio_outlined,
      'name': 'multitrack_audio_outlined'
    },
    {
      'icon': Icons.multitrack_audio_rounded,
      'name': 'multitrack_audio_rounded'
    },
    {'icon': Icons.multitrack_audio_sharp, 'name': 'multitrack_audio_sharp'},
    {'icon': Icons.museum, 'name': 'museum'},
    {'icon': Icons.museum_outlined, 'name': 'museum_outlined'},
    {'icon': Icons.museum_rounded, 'name': 'museum_rounded'},
    {'icon': Icons.museum_sharp, 'name': 'museum_sharp'},
    {'icon': Icons.music_note, 'name': 'music_note'},
    {'icon': Icons.music_note_outlined, 'name': 'music_note_outlined'},
    {'icon': Icons.music_note_rounded, 'name': 'music_note_rounded'},
    {'icon': Icons.music_note_sharp, 'name': 'music_note_sharp'},
    {'icon': Icons.music_off, 'name': 'music_off'},
    {'icon': Icons.music_off_outlined, 'name': 'music_off_outlined'},
    {'icon': Icons.music_off_rounded, 'name': 'music_off_rounded'},
    {'icon': Icons.music_off_sharp, 'name': 'music_off_sharp'},
    {'icon': Icons.music_video, 'name': 'music_video'},
    {'icon': Icons.music_video_outlined, 'name': 'music_video_outlined'},
    {'icon': Icons.music_video_rounded, 'name': 'music_video_rounded'},
    {'icon': Icons.music_video_sharp, 'name': 'music_video_sharp'},
    {'icon': Icons.my_library_add, 'name': 'my_library_add'},
    {'icon': Icons.my_library_add_outlined, 'name': 'my_library_add_outlined'},
    {'icon': Icons.my_library_add_rounded, 'name': 'my_library_add_rounded'},
    {'icon': Icons.my_library_add_sharp, 'name': 'my_library_add_sharp'},
    {'icon': Icons.my_library_books, 'name': 'my_library_books'},
    {
      'icon': Icons.my_library_books_outlined,
      'name': 'my_library_books_outlined'
    },
    {
      'icon': Icons.my_library_books_rounded,
      'name': 'my_library_books_rounded'
    },
    {'icon': Icons.my_library_books_sharp, 'name': 'my_library_books_sharp'},
    {'icon': Icons.my_library_music, 'name': 'my_library_music'},
    {
      'icon': Icons.my_library_music_outlined,
      'name': 'my_library_music_outlined'
    },
    {
      'icon': Icons.my_library_music_rounded,
      'name': 'my_library_music_rounded'
    },
    {'icon': Icons.my_library_music_sharp, 'name': 'my_library_music_sharp'},
    {'icon': Icons.my_location, 'name': 'my_location'},
    {'icon': Icons.my_location_outlined, 'name': 'my_location_outlined'},
    {'icon': Icons.my_location_rounded, 'name': 'my_location_rounded'},
    {'icon': Icons.my_location_sharp, 'name': 'my_location_sharp'},
    {'icon': Icons.nat, 'name': 'nat'},
    {'icon': Icons.nat_outlined, 'name': 'nat_outlined'},
    {'icon': Icons.nat_rounded, 'name': 'nat_rounded'},
    {'icon': Icons.nat_sharp, 'name': 'nat_sharp'},
    {'icon': Icons.nature, 'name': 'nature'},
    {'icon': Icons.nature_outlined, 'name': 'nature_outlined'},
    {'icon': Icons.nature_people, 'name': 'nature_people'},
    {'icon': Icons.nature_people_outlined, 'name': 'nature_people_outlined'},
    {'icon': Icons.nature_people_rounded, 'name': 'nature_people_rounded'},
    {'icon': Icons.nature_people_sharp, 'name': 'nature_people_sharp'},
    {'icon': Icons.nature_rounded, 'name': 'nature_rounded'},
    {'icon': Icons.nature_sharp, 'name': 'nature_sharp'},
    {'icon': Icons.navigate_before, 'name': 'navigate_before'},
    {
      'icon': Icons.navigate_before_outlined,
      'name': 'navigate_before_outlined'
    },
    {'icon': Icons.navigate_before_rounded, 'name': 'navigate_before_rounded'},
    {'icon': Icons.navigate_before_sharp, 'name': 'navigate_before_sharp'},
    {'icon': Icons.navigate_next, 'name': 'navigate_next'},
    {'icon': Icons.navigate_next_outlined, 'name': 'navigate_next_outlined'},
    {'icon': Icons.navigate_next_rounded, 'name': 'navigate_next_rounded'},
    {'icon': Icons.navigate_next_sharp, 'name': 'navigate_next_sharp'},
    {'icon': Icons.navigation, 'name': 'navigation'},
    {'icon': Icons.navigation_outlined, 'name': 'navigation_outlined'},
    {'icon': Icons.navigation_rounded, 'name': 'navigation_rounded'},
    {'icon': Icons.navigation_sharp, 'name': 'navigation_sharp'},
    {'icon': Icons.near_me, 'name': 'near_me'},
    {'icon': Icons.near_me_disabled, 'name': 'near_me_disabled'},
    {
      'icon': Icons.near_me_disabled_outlined,
      'name': 'near_me_disabled_outlined'
    },
    {
      'icon': Icons.near_me_disabled_rounded,
      'name': 'near_me_disabled_rounded'
    },
    {'icon': Icons.near_me_disabled_sharp, 'name': 'near_me_disabled_sharp'},
    {'icon': Icons.near_me_outlined, 'name': 'near_me_outlined'},
    {'icon': Icons.near_me_rounded, 'name': 'near_me_rounded'},
    {'icon': Icons.near_me_sharp, 'name': 'near_me_sharp'},
    {'icon': Icons.network_cell, 'name': 'network_cell'},
    {'icon': Icons.network_check, 'name': 'network_check'},
    {'icon': Icons.network_check_outlined, 'name': 'network_check_outlined'},
    {'icon': Icons.network_check_rounded, 'name': 'network_check_rounded'},
    {'icon': Icons.network_check_sharp, 'name': 'network_check_sharp'},
    {'icon': Icons.network_locked, 'name': 'network_locked'},
    {'icon': Icons.network_locked_outlined, 'name': 'network_locked_outlined'},
    {'icon': Icons.network_locked_rounded, 'name': 'network_locked_rounded'},
    {'icon': Icons.network_locked_sharp, 'name': 'network_locked_sharp'},
    {'icon': Icons.network_wifi, 'name': 'network_wifi'},
    {'icon': Icons.new_releases, 'name': 'new_releases'},
    {'icon': Icons.new_releases_outlined, 'name': 'new_releases_outlined'},
    {'icon': Icons.new_releases_rounded, 'name': 'new_releases_rounded'},
    {'icon': Icons.new_releases_sharp, 'name': 'new_releases_sharp'},
    {'icon': Icons.next_plan, 'name': 'next_plan'},
    {'icon': Icons.next_plan_outlined, 'name': 'next_plan_outlined'},
    {'icon': Icons.next_plan_rounded, 'name': 'next_plan_rounded'},
    {'icon': Icons.next_plan_sharp, 'name': 'next_plan_sharp'},
    {'icon': Icons.next_week, 'name': 'next_week'},
    {'icon': Icons.next_week_outlined, 'name': 'next_week_outlined'},
    {'icon': Icons.next_week_rounded, 'name': 'next_week_rounded'},
    {'icon': Icons.next_week_sharp, 'name': 'next_week_sharp'},
    {'icon': Icons.nfc, 'name': 'nfc'},
    {'icon': Icons.nfc_outlined, 'name': 'nfc_outlined'},
    {'icon': Icons.nfc_rounded, 'name': 'nfc_rounded'},
    {'icon': Icons.nfc_sharp, 'name': 'nfc_sharp'},
    {'icon': Icons.night_shelter, 'name': 'night_shelter'},
    {'icon': Icons.night_shelter_outlined, 'name': 'night_shelter_outlined'},
    {'icon': Icons.night_shelter_rounded, 'name': 'night_shelter_rounded'},
    {'icon': Icons.night_shelter_sharp, 'name': 'night_shelter_sharp'},
    {'icon': Icons.nightlife, 'name': 'nightlife'},
    {'icon': Icons.nightlight_round, 'name': 'nightlight_round'},
    {'icon': Icons.nights_stay, 'name': 'nights_stay'},
    {'icon': Icons.nights_stay_outlined, 'name': 'nights_stay_outlined'},
    {'icon': Icons.nights_stay_rounded, 'name': 'nights_stay_rounded'},
    {'icon': Icons.nights_stay_sharp, 'name': 'nights_stay_sharp'},
    {'icon': Icons.nine_k, 'name': 'nine_k'},
    {'icon': Icons.nine_k_plus, 'name': 'nine_k_plus'},
    {'icon': Icons.nine_mp, 'name': 'nine_mp'},
    {'icon': Icons.nineteen_mp, 'name': 'nineteen_mp'},
    {'icon': Icons.no_cell, 'name': 'no_cell'},
    {'icon': Icons.no_cell_outlined, 'name': 'no_cell_outlined'},
    {'icon': Icons.no_cell_rounded, 'name': 'no_cell_rounded'},
    {'icon': Icons.no_cell_sharp, 'name': 'no_cell_sharp'},
    {'icon': Icons.no_drinks, 'name': 'no_drinks'},
    {'icon': Icons.no_drinks_outlined, 'name': 'no_drinks_outlined'},
    {'icon': Icons.no_drinks_rounded, 'name': 'no_drinks_rounded'},
    {'icon': Icons.no_drinks_sharp, 'name': 'no_drinks_sharp'},
    {'icon': Icons.no_encryption, 'name': 'no_encryption'},
    {
      'icon': Icons.no_encryption_gmailerrorred_outlined,
      'name': 'no_encryption_gmailerrorred_outlined'
    },
    {
      'icon': Icons.no_encryption_gmailerrorred_rounded,
      'name': 'no_encryption_gmailerrorred_rounded'
    },
    {
      'icon': Icons.no_encryption_gmailerrorred_sharp,
      'name': 'no_encryption_gmailerrorred_sharp'
    },
    {'icon': Icons.no_encryption_outlined, 'name': 'no_encryption_outlined'},
    {'icon': Icons.no_encryption_rounded, 'name': 'no_encryption_rounded'},
    {'icon': Icons.no_encryption_sharp, 'name': 'no_encryption_sharp'},
    {'icon': Icons.no_flash, 'name': 'no_flash'},
    {'icon': Icons.no_flash_outlined, 'name': 'no_flash_outlined'},
    {'icon': Icons.no_flash_rounded, 'name': 'no_flash_rounded'},
    {'icon': Icons.no_flash_sharp, 'name': 'no_flash_sharp'},
    {'icon': Icons.no_food, 'name': 'no_food'},
    {'icon': Icons.no_food_outlined, 'name': 'no_food_outlined'},
    {'icon': Icons.no_food_rounded, 'name': 'no_food_rounded'},
    {'icon': Icons.no_food_sharp, 'name': 'no_food_sharp'},
    {'icon': Icons.no_meals, 'name': 'no_meals'},
    {'icon': Icons.no_meals_ouline, 'name': 'no_meals_ouline'},
    {'icon': Icons.no_meals_outlined, 'name': 'no_meals_outlined'},
    {'icon': Icons.no_meals_rounded, 'name': 'no_meals_rounded'},
    {'icon': Icons.no_meals_sharp, 'name': 'no_meals_sharp'},
    {'icon': Icons.no_meeting_room, 'name': 'no_meeting_room'},
    {
      'icon': Icons.no_meeting_room_outlined,
      'name': 'no_meeting_room_outlined'
    },
    {'icon': Icons.no_meeting_room_rounded, 'name': 'no_meeting_room_rounded'},
    {'icon': Icons.no_meeting_room_sharp, 'name': 'no_meeting_room_sharp'},
    {'icon': Icons.no_photography, 'name': 'no_photography'},
    {'icon': Icons.no_photography_outlined, 'name': 'no_photography_outlined'},
    {'icon': Icons.no_photography_rounded, 'name': 'no_photography_rounded'},
    {'icon': Icons.no_photography_sharp, 'name': 'no_photography_sharp'},
    {'icon': Icons.no_sim, 'name': 'no_sim'},
    {'icon': Icons.no_sim_outlined, 'name': 'no_sim_outlined'},
    {'icon': Icons.no_sim_rounded, 'name': 'no_sim_rounded'},
    {'icon': Icons.no_sim_sharp, 'name': 'no_sim_sharp'},
    {'icon': Icons.no_stroller, 'name': 'no_stroller'},
    {'icon': Icons.no_stroller_outlined, 'name': 'no_stroller_outlined'},
    {'icon': Icons.no_stroller_rounded, 'name': 'no_stroller_rounded'},
    {'icon': Icons.no_stroller_sharp, 'name': 'no_stroller_sharp'},
    {'icon': Icons.no_transfer, 'name': 'no_transfer'},
    {'icon': Icons.no_transfer_outlined, 'name': 'no_transfer_outlined'},
    {'icon': Icons.no_transfer_rounded, 'name': 'no_transfer_rounded'},
    {'icon': Icons.no_transfer_sharp, 'name': 'no_transfer_sharp'},
    {'icon': Icons.north, 'name': 'north'},
    {'icon': Icons.north_east, 'name': 'north_east'},
    {'icon': Icons.north_east_outlined, 'name': 'north_east_outlined'},
    {'icon': Icons.north_east_rounded, 'name': 'north_east_rounded'},
    {'icon': Icons.north_east_sharp, 'name': 'north_east_sharp'},
    {'icon': Icons.north_outlined, 'name': 'north_outlined'},
    {'icon': Icons.north_rounded, 'name': 'north_rounded'},
    {'icon': Icons.north_sharp, 'name': 'north_sharp'},
    {'icon': Icons.north_west, 'name': 'north_west'},
    {'icon': Icons.north_west_outlined, 'name': 'north_west_outlined'},
    {'icon': Icons.north_west_rounded, 'name': 'north_west_rounded'},
    {'icon': Icons.north_west_sharp, 'name': 'north_west_sharp'},
    {'icon': Icons.not_accessible, 'name': 'not_accessible'},
    {'icon': Icons.not_accessible_outlined, 'name': 'not_accessible_outlined'},
    {'icon': Icons.not_accessible_rounded, 'name': 'not_accessible_rounded'},
    {'icon': Icons.not_accessible_sharp, 'name': 'not_accessible_sharp'},
    {'icon': Icons.not_interested, 'name': 'not_interested'},
    {'icon': Icons.not_interested_outlined, 'name': 'not_interested_outlined'},
    {'icon': Icons.not_interested_rounded, 'name': 'not_interested_rounded'},
    {'icon': Icons.not_interested_sharp, 'name': 'not_interested_sharp'},
    {'icon': Icons.not_listed_location, 'name': 'not_listed_location'},
    {
      'icon': Icons.not_listed_location_outlined,
      'name': 'not_listed_location_outlined'
    },
    {
      'icon': Icons.not_listed_location_rounded,
      'name': 'not_listed_location_rounded'
    },
    {
      'icon': Icons.not_listed_location_sharp,
      'name': 'not_listed_location_sharp'
    },
    {'icon': Icons.not_started, 'name': 'not_started'},
    {'icon': Icons.not_started_outlined, 'name': 'not_started_outlined'},
    {'icon': Icons.not_started_rounded, 'name': 'not_started_rounded'},
    {'icon': Icons.not_started_sharp, 'name': 'not_started_sharp'},
    {'icon': Icons.note, 'name': 'note'},
    {'icon': Icons.note_add, 'name': 'note_add'},
    {'icon': Icons.note_add_outlined, 'name': 'note_add_outlined'},
    {'icon': Icons.note_add_rounded, 'name': 'note_add_rounded'},
    {'icon': Icons.note_add_sharp, 'name': 'note_add_sharp'},
    {'icon': Icons.note_outlined, 'name': 'note_outlined'},
    {'icon': Icons.note_rounded, 'name': 'note_rounded'},
    {'icon': Icons.note_sharp, 'name': 'note_sharp'},
    {'icon': Icons.notes, 'name': 'notes'},
    {'icon': Icons.notes_outlined, 'name': 'notes_outlined'},
    {'icon': Icons.notes_rounded, 'name': 'notes_rounded'},
    {'icon': Icons.notes_sharp, 'name': 'notes_sharp'},
    {'icon': Icons.notification_important, 'name': 'notification_important'},
    {
      'icon': Icons.notification_important_outlined,
      'name': 'notification_important_outlined'
    },
    {
      'icon': Icons.notification_important_rounded,
      'name': 'notification_important_rounded'
    },
    {
      'icon': Icons.notification_important_sharp,
      'name': 'notification_important_sharp'
    },
    {'icon': Icons.notifications, 'name': 'notifications'},
    {'icon': Icons.notifications_active, 'name': 'notifications_active'},
    {
      'icon': Icons.notifications_active_outlined,
      'name': 'notifications_active_outlined'
    },
    {
      'icon': Icons.notifications_active_rounded,
      'name': 'notifications_active_rounded'
    },
    {
      'icon': Icons.notifications_active_sharp,
      'name': 'notifications_active_sharp'
    },
    {'icon': Icons.notifications_none, 'name': 'notifications_none'},
    {
      'icon': Icons.notifications_none_outlined,
      'name': 'notifications_none_outlined'
    },
    {
      'icon': Icons.notifications_none_rounded,
      'name': 'notifications_none_rounded'
    },
    {
      'icon': Icons.notifications_none_sharp,
      'name': 'notifications_none_sharp'
    },
    {'icon': Icons.notifications_off, 'name': 'notifications_off'},
    {
      'icon': Icons.notifications_off_outlined,
      'name': 'notifications_off_outlined'
    },
    {
      'icon': Icons.notifications_off_rounded,
      'name': 'notifications_off_rounded'
    },
    {'icon': Icons.notifications_off_sharp, 'name': 'notifications_off_sharp'},
    {'icon': Icons.notifications_on, 'name': 'notifications_on'},
    {
      'icon': Icons.notifications_on_outlined,
      'name': 'notifications_on_outlined'
    },
    {
      'icon': Icons.notifications_on_rounded,
      'name': 'notifications_on_rounded'
    },
    {'icon': Icons.notifications_on_sharp, 'name': 'notifications_on_sharp'},
    {'icon': Icons.notifications_outlined, 'name': 'notifications_outlined'},
    {'icon': Icons.notifications_paused, 'name': 'notifications_paused'},
    {
      'icon': Icons.notifications_paused_outlined,
      'name': 'notifications_paused_outlined'
    },
    {
      'icon': Icons.notifications_paused_rounded,
      'name': 'notifications_paused_rounded'
    },
    {
      'icon': Icons.notifications_paused_sharp,
      'name': 'notifications_paused_sharp'
    },
    {'icon': Icons.notifications_rounded, 'name': 'notifications_rounded'},
    {'icon': Icons.notifications_sharp, 'name': 'notifications_sharp'},
    {'icon': Icons.now_wallpaper, 'name': 'now_wallpaper'},
    {'icon': Icons.now_wallpaper_outlined, 'name': 'now_wallpaper_outlined'},
    {'icon': Icons.now_wallpaper_rounded, 'name': 'now_wallpaper_rounded'},
    {'icon': Icons.now_wallpaper_sharp, 'name': 'now_wallpaper_sharp'},
    {'icon': Icons.now_widgets, 'name': 'now_widgets'},
    {'icon': Icons.now_widgets_outlined, 'name': 'now_widgets_outlined'},
    {'icon': Icons.now_widgets_rounded, 'name': 'now_widgets_rounded'},
    {'icon': Icons.now_widgets_sharp, 'name': 'now_widgets_sharp'},
    {'icon': Icons.offline_bolt, 'name': 'offline_bolt'},
    {'icon': Icons.offline_bolt_outlined, 'name': 'offline_bolt_outlined'},
    {'icon': Icons.offline_bolt_rounded, 'name': 'offline_bolt_rounded'},
    {'icon': Icons.offline_bolt_sharp, 'name': 'offline_bolt_sharp'},
    {'icon': Icons.offline_pin, 'name': 'offline_pin'},
    {'icon': Icons.offline_pin_outlined, 'name': 'offline_pin_outlined'},
    {'icon': Icons.offline_pin_rounded, 'name': 'offline_pin_rounded'},
    {'icon': Icons.offline_pin_sharp, 'name': 'offline_pin_sharp'},
    {'icon': Icons.offline_share, 'name': 'offline_share'},
    {'icon': Icons.ondemand_video, 'name': 'ondemand_video'},
    {'icon': Icons.ondemand_video_outlined, 'name': 'ondemand_video_outlined'},
    {'icon': Icons.ondemand_video_rounded, 'name': 'ondemand_video_rounded'},
    {'icon': Icons.ondemand_video_sharp, 'name': 'ondemand_video_sharp'},
    {'icon': Icons.one_k, 'name': 'one_k'},
    {'icon': Icons.one_k_plus, 'name': 'one_k_plus'},
    {'icon': Icons.online_prediction, 'name': 'online_prediction'},
    {
      'icon': Icons.online_prediction_outlined,
      'name': 'online_prediction_outlined'
    },
    {
      'icon': Icons.online_prediction_rounded,
      'name': 'online_prediction_rounded'
    },
    {'icon': Icons.online_prediction_sharp, 'name': 'online_prediction_sharp'},
    {'icon': Icons.opacity, 'name': 'opacity'},
    {'icon': Icons.opacity_outlined, 'name': 'opacity_outlined'},
    {'icon': Icons.opacity_rounded, 'name': 'opacity_rounded'},
    {'icon': Icons.opacity_sharp, 'name': 'opacity_sharp'},
    {'icon': Icons.open_in_browser, 'name': 'open_in_browser'},
    {
      'icon': Icons.open_in_browser_outlined,
      'name': 'open_in_browser_outlined'
    },
    {'icon': Icons.open_in_browser_rounded, 'name': 'open_in_browser_rounded'},
    {'icon': Icons.open_in_browser_sharp, 'name': 'open_in_browser_sharp'},
    {'icon': Icons.open_in_full, 'name': 'open_in_full'},
    {'icon': Icons.open_in_full_outlined, 'name': 'open_in_full_outlined'},
    {'icon': Icons.open_in_full_rounded, 'name': 'open_in_full_rounded'},
    {'icon': Icons.open_in_full_sharp, 'name': 'open_in_full_sharp'},
    {'icon': Icons.open_in_new, 'name': 'open_in_new'},
    {'icon': Icons.open_in_new_outlined, 'name': 'open_in_new_outlined'},
    {'icon': Icons.open_in_new_rounded, 'name': 'open_in_new_rounded'},
    {'icon': Icons.open_in_new_sharp, 'name': 'open_in_new_sharp'},
    {'icon': Icons.open_with, 'name': 'open_with'},
    {'icon': Icons.open_with_outlined, 'name': 'open_with_outlined'},
    {'icon': Icons.open_with_rounded, 'name': 'open_with_rounded'},
    {'icon': Icons.open_with_sharp, 'name': 'open_with_sharp'},
    {'icon': Icons.outbond, 'name': 'outbond'},
    {'icon': Icons.outbond_outlined, 'name': 'outbond_outlined'},
    {'icon': Icons.outbond_rounded, 'name': 'outbond_rounded'},
    {'icon': Icons.outbond_sharp, 'name': 'outbond_sharp'},
    {'icon': Icons.outbox, 'name': 'outbox'},
    {'icon': Icons.outdoor_grill, 'name': 'outdoor_grill'},
    {'icon': Icons.outdoor_grill_outlined, 'name': 'outdoor_grill_outlined'},
    {'icon': Icons.outdoor_grill_rounded, 'name': 'outdoor_grill_rounded'},
    {'icon': Icons.outdoor_grill_sharp, 'name': 'outdoor_grill_sharp'},
    {'icon': Icons.outgoing_mail, 'name': 'outgoing_mail'},
    {'icon': Icons.outlet, 'name': 'outlet'},
    {'icon': Icons.outlet_outlined, 'name': 'outlet_outlined'},
    {'icon': Icons.outlet_rounded, 'name': 'outlet_rounded'},
    {'icon': Icons.outlet_sharp, 'name': 'outlet_sharp'},
    {'icon': Icons.outlined_flag, 'name': 'outlined_flag'},
    {'icon': Icons.outlined_flag_outlined, 'name': 'outlined_flag_outlined'},
    {'icon': Icons.outlined_flag_rounded, 'name': 'outlined_flag_rounded'},
    {'icon': Icons.outlined_flag_sharp, 'name': 'outlined_flag_sharp'},
    {'icon': Icons.padding, 'name': 'padding'},
    {'icon': Icons.pages, 'name': 'pages'},
    {'icon': Icons.pages_outlined, 'name': 'pages_outlined'},
    {'icon': Icons.pages_rounded, 'name': 'pages_rounded'},
    {'icon': Icons.pages_sharp, 'name': 'pages_sharp'},
    {'icon': Icons.pageview, 'name': 'pageview'},
    {'icon': Icons.pageview_outlined, 'name': 'pageview_outlined'},
    {'icon': Icons.pageview_rounded, 'name': 'pageview_rounded'},
    {'icon': Icons.pageview_sharp, 'name': 'pageview_sharp'},
    {'icon': Icons.palette, 'name': 'palette'},
    {'icon': Icons.palette_outlined, 'name': 'palette_outlined'},
    {'icon': Icons.palette_rounded, 'name': 'palette_rounded'},
    {'icon': Icons.palette_sharp, 'name': 'palette_sharp'},
    {'icon': Icons.pan_tool, 'name': 'pan_tool'},
    {'icon': Icons.pan_tool_outlined, 'name': 'pan_tool_outlined'},
    {'icon': Icons.pan_tool_rounded, 'name': 'pan_tool_rounded'},
    {'icon': Icons.pan_tool_sharp, 'name': 'pan_tool_sharp'},
    {'icon': Icons.panorama, 'name': 'panorama'},
    {'icon': Icons.panorama_fish_eye, 'name': 'panorama_fish_eye'},
    {
      'icon': Icons.panorama_fish_eye_outlined,
      'name': 'panorama_fish_eye_outlined'
    },
    {
      'icon': Icons.panorama_fish_eye_rounded,
      'name': 'panorama_fish_eye_rounded'
    },
    {'icon': Icons.panorama_fish_eye_sharp, 'name': 'panorama_fish_eye_sharp'},
    {'icon': Icons.panorama_fisheye, 'name': 'panorama_fisheye'},
    {
      'icon': Icons.panorama_fisheye_outlined,
      'name': 'panorama_fisheye_outlined'
    },
    {
      'icon': Icons.panorama_fisheye_rounded,
      'name': 'panorama_fisheye_rounded'
    },
    {'icon': Icons.panorama_fisheye_sharp, 'name': 'panorama_fisheye_sharp'},
    {'icon': Icons.panorama_horizontal, 'name': 'panorama_horizontal'},
    {
      'icon': Icons.panorama_horizontal_outlined,
      'name': 'panorama_horizontal_outlined'
    },
    {
      'icon': Icons.panorama_horizontal_rounded,
      'name': 'panorama_horizontal_rounded'
    },
    {
      'icon': Icons.panorama_horizontal_select,
      'name': 'panorama_horizontal_select'
    },
    {
      'icon': Icons.panorama_horizontal_sharp,
      'name': 'panorama_horizontal_sharp'
    },
    {'icon': Icons.panorama_outlined, 'name': 'panorama_outlined'},
    {'icon': Icons.panorama_photosphere, 'name': 'panorama_photosphere'},
    {
      'icon': Icons.panorama_photosphere_select,
      'name': 'panorama_photosphere_select'
    },
    {'icon': Icons.panorama_rounded, 'name': 'panorama_rounded'},
    {'icon': Icons.panorama_sharp, 'name': 'panorama_sharp'},
    {'icon': Icons.panorama_vertical, 'name': 'panorama_vertical'},
    {
      'icon': Icons.panorama_vertical_outlined,
      'name': 'panorama_vertical_outlined'
    },
    {
      'icon': Icons.panorama_vertical_rounded,
      'name': 'panorama_vertical_rounded'
    },
    {
      'icon': Icons.panorama_vertical_select,
      'name': 'panorama_vertical_select'
    },
    {'icon': Icons.panorama_vertical_sharp, 'name': 'panorama_vertical_sharp'},
    {'icon': Icons.panorama_wide_angle, 'name': 'panorama_wide_angle'},
    {
      'icon': Icons.panorama_wide_angle_outlined,
      'name': 'panorama_wide_angle_outlined'
    },
    {
      'icon': Icons.panorama_wide_angle_rounded,
      'name': 'panorama_wide_angle_rounded'
    },
    {
      'icon': Icons.panorama_wide_angle_select,
      'name': 'panorama_wide_angle_select'
    },
    {
      'icon': Icons.panorama_wide_angle_sharp,
      'name': 'panorama_wide_angle_sharp'
    },
    {'icon': Icons.park, 'name': 'park'},
    {'icon': Icons.party_mode, 'name': 'party_mode'},
    {'icon': Icons.party_mode_outlined, 'name': 'party_mode_outlined'},
    {'icon': Icons.party_mode_rounded, 'name': 'party_mode_rounded'},
    {'icon': Icons.party_mode_sharp, 'name': 'party_mode_sharp'},
    {'icon': Icons.paste, 'name': 'paste'},
    {'icon': Icons.paste_outlined, 'name': 'paste_outlined'},
    {'icon': Icons.paste_rounded, 'name': 'paste_rounded'},
    {'icon': Icons.paste_sharp, 'name': 'paste_sharp'},
    {'icon': Icons.pause, 'name': 'pause'},
    {'icon': Icons.pause_circle_filled, 'name': 'pause_circle_filled'},
    {
      'icon': Icons.pause_circle_filled_outlined,
      'name': 'pause_circle_filled_outlined'
    },
    {
      'icon': Icons.pause_circle_filled_rounded,
      'name': 'pause_circle_filled_rounded'
    },
    {
      'icon': Icons.pause_circle_filled_sharp,
      'name': 'pause_circle_filled_sharp'
    },
    {'icon': Icons.pause_circle_outline, 'name': 'pause_circle_outline'},
    {
      'icon': Icons.pause_circle_outline_outlined,
      'name': 'pause_circle_outline_outlined'
    },
    {
      'icon': Icons.pause_circle_outline_rounded,
      'name': 'pause_circle_outline_rounded'
    },
    {
      'icon': Icons.pause_circle_outline_sharp,
      'name': 'pause_circle_outline_sharp'
    },
    {'icon': Icons.pause_outlined, 'name': 'pause_outlined'},
    {'icon': Icons.pause_presentation, 'name': 'pause_presentation'},
    {
      'icon': Icons.pause_presentation_outlined,
      'name': 'pause_presentation_outlined'
    },
    {
      'icon': Icons.pause_presentation_rounded,
      'name': 'pause_presentation_rounded'
    },
    {
      'icon': Icons.pause_presentation_sharp,
      'name': 'pause_presentation_sharp'
    },
    {'icon': Icons.pause_rounded, 'name': 'pause_rounded'},
    {'icon': Icons.pause_sharp, 'name': 'pause_sharp'},
    {'icon': Icons.payment, 'name': 'payment'},
    {'icon': Icons.payment_outlined, 'name': 'payment_outlined'},
    {'icon': Icons.payment_rounded, 'name': 'payment_rounded'},
    {'icon': Icons.payment_sharp, 'name': 'payment_sharp'},
    {'icon': Icons.payments, 'name': 'payments'},
    {'icon': Icons.payments_outlined, 'name': 'payments_outlined'},
    {'icon': Icons.payments_rounded, 'name': 'payments_rounded'},
    {'icon': Icons.payments_sharp, 'name': 'payments_sharp'},
    {'icon': Icons.pedal_bike, 'name': 'pedal_bike'},
    {'icon': Icons.pedal_bike_outlined, 'name': 'pedal_bike_outlined'},
    {'icon': Icons.pedal_bike_rounded, 'name': 'pedal_bike_rounded'},
    {'icon': Icons.pedal_bike_sharp, 'name': 'pedal_bike_sharp'},
    {'icon': Icons.pending, 'name': 'pending'},
    {'icon': Icons.pending_actions, 'name': 'pending_actions'},
    {
      'icon': Icons.pending_actions_outlined,
      'name': 'pending_actions_outlined'
    },
    {'icon': Icons.pending_actions_rounded, 'name': 'pending_actions_rounded'},
    {'icon': Icons.pending_actions_sharp, 'name': 'pending_actions_sharp'},
    {'icon': Icons.pending_outlined, 'name': 'pending_outlined'},
    {'icon': Icons.pending_rounded, 'name': 'pending_rounded'},
    {'icon': Icons.pending_sharp, 'name': 'pending_sharp'},
    {'icon': Icons.people, 'name': 'people'},
    {'icon': Icons.people_alt, 'name': 'people_alt'},
    {'icon': Icons.people_alt_outlined, 'name': 'people_alt_outlined'},
    {'icon': Icons.people_alt_rounded, 'name': 'people_alt_rounded'},
    {'icon': Icons.people_alt_sharp, 'name': 'people_alt_sharp'},
    {'icon': Icons.people_outline, 'name': 'people_outline'},
    {'icon': Icons.people_outline_outlined, 'name': 'people_outline_outlined'},
    {'icon': Icons.people_outline_rounded, 'name': 'people_outline_rounded'},
    {'icon': Icons.people_outline_sharp, 'name': 'people_outline_sharp'},
    {'icon': Icons.people_outlined, 'name': 'people_outlined'},
    {'icon': Icons.people_rounded, 'name': 'people_rounded'},
    {'icon': Icons.people_sharp, 'name': 'people_sharp'},
    {'icon': Icons.perm_camera_mic, 'name': 'perm_camera_mic'},
    {
      'icon': Icons.perm_camera_mic_outlined,
      'name': 'perm_camera_mic_outlined'
    },
    {'icon': Icons.perm_camera_mic_rounded, 'name': 'perm_camera_mic_rounded'},
    {'icon': Icons.perm_camera_mic_sharp, 'name': 'perm_camera_mic_sharp'},
    {'icon': Icons.perm_contact_cal, 'name': 'perm_contact_cal'},
    {
      'icon': Icons.perm_contact_cal_outlined,
      'name': 'perm_contact_cal_outlined'
    },
    {
      'icon': Icons.perm_contact_cal_rounded,
      'name': 'perm_contact_cal_rounded'
    },
    {'icon': Icons.perm_contact_cal_sharp, 'name': 'perm_contact_cal_sharp'},
    {'icon': Icons.perm_contact_calendar, 'name': 'perm_contact_calendar'},
    {
      'icon': Icons.perm_contact_calendar_outlined,
      'name': 'perm_contact_calendar_outlined'
    },
    {
      'icon': Icons.perm_contact_calendar_rounded,
      'name': 'perm_contact_calendar_rounded'
    },
    {
      'icon': Icons.perm_contact_calendar_sharp,
      'name': 'perm_contact_calendar_sharp'
    },
    {'icon': Icons.perm_data_setting, 'name': 'perm_data_setting'},
    {
      'icon': Icons.perm_data_setting_outlined,
      'name': 'perm_data_setting_outlined'
    },
    {
      'icon': Icons.perm_data_setting_rounded,
      'name': 'perm_data_setting_rounded'
    },
    {'icon': Icons.perm_data_setting_sharp, 'name': 'perm_data_setting_sharp'},
    {'icon': Icons.perm_device_info, 'name': 'perm_device_info'},
    {
      'icon': Icons.perm_device_info_outlined,
      'name': 'perm_device_info_outlined'
    },
    {
      'icon': Icons.perm_device_info_rounded,
      'name': 'perm_device_info_rounded'
    },
    {'icon': Icons.perm_device_info_sharp, 'name': 'perm_device_info_sharp'},
    {'icon': Icons.perm_device_information, 'name': 'perm_device_information'},
    {
      'icon': Icons.perm_device_information_outlined,
      'name': 'perm_device_information_outlined'
    },
    {
      'icon': Icons.perm_device_information_rounded,
      'name': 'perm_device_information_rounded'
    },
    {
      'icon': Icons.perm_device_information_sharp,
      'name': 'perm_device_information_sharp'
    },
    {'icon': Icons.perm_identity, 'name': 'perm_identity'},
    {'icon': Icons.perm_identity_outlined, 'name': 'perm_identity_outlined'},
    {'icon': Icons.perm_identity_rounded, 'name': 'perm_identity_rounded'},
    {'icon': Icons.perm_identity_sharp, 'name': 'perm_identity_sharp'},
    {'icon': Icons.perm_media, 'name': 'perm_media'},
    {'icon': Icons.perm_media_outlined, 'name': 'perm_media_outlined'},
    {'icon': Icons.perm_media_rounded, 'name': 'perm_media_rounded'},
    {'icon': Icons.perm_media_sharp, 'name': 'perm_media_sharp'},
    {'icon': Icons.perm_phone_msg, 'name': 'perm_phone_msg'},
    {'icon': Icons.perm_phone_msg_outlined, 'name': 'perm_phone_msg_outlined'},
    {'icon': Icons.perm_phone_msg_rounded, 'name': 'perm_phone_msg_rounded'},
    {'icon': Icons.perm_phone_msg_sharp, 'name': 'perm_phone_msg_sharp'},
    {'icon': Icons.perm_scan_wifi, 'name': 'perm_scan_wifi'},
    {'icon': Icons.perm_scan_wifi_outlined, 'name': 'perm_scan_wifi_outlined'},
    {'icon': Icons.perm_scan_wifi_rounded, 'name': 'perm_scan_wifi_rounded'},
    {'icon': Icons.perm_scan_wifi_sharp, 'name': 'perm_scan_wifi_sharp'},
    {'icon': Icons.person, 'name': 'person'},
    {'icon': Icons.person_add, 'name': 'person_add'},
    {'icon': Icons.person_add_alt, 'name': 'person_add_alt'},
    {'icon': Icons.person_add_alt_1, 'name': 'person_add_alt_1'},
    {
      'icon': Icons.person_add_alt_1_outlined,
      'name': 'person_add_alt_1_outlined'
    },
    {
      'icon': Icons.person_add_alt_1_rounded,
      'name': 'person_add_alt_1_rounded'
    },
    {'icon': Icons.person_add_alt_1_sharp, 'name': 'person_add_alt_1_sharp'},
    {'icon': Icons.person_add_disabled, 'name': 'person_add_disabled'},
    {
      'icon': Icons.person_add_disabled_outlined,
      'name': 'person_add_disabled_outlined'
    },
    {
      'icon': Icons.person_add_disabled_rounded,
      'name': 'person_add_disabled_rounded'
    },
    {
      'icon': Icons.person_add_disabled_sharp,
      'name': 'person_add_disabled_sharp'
    },
    {'icon': Icons.person_add_outlined, 'name': 'person_add_outlined'},
    {'icon': Icons.person_add_rounded, 'name': 'person_add_rounded'},
    {'icon': Icons.person_add_sharp, 'name': 'person_add_sharp'},
    {'icon': Icons.person_outline, 'name': 'person_outline'},
    {'icon': Icons.person_outline_outlined, 'name': 'person_outline_outlined'},
    {'icon': Icons.person_outline_rounded, 'name': 'person_outline_rounded'},
    {'icon': Icons.person_outline_sharp, 'name': 'person_outline_sharp'},
    {'icon': Icons.person_outlined, 'name': 'person_outlined'},
    {'icon': Icons.person_pin, 'name': 'person_pin'},
    {'icon': Icons.person_pin_circle, 'name': 'person_pin_circle'},
    {
      'icon': Icons.person_pin_circle_outlined,
      'name': 'person_pin_circle_outlined'
    },
    {
      'icon': Icons.person_pin_circle_rounded,
      'name': 'person_pin_circle_rounded'
    },
    {'icon': Icons.person_pin_circle_sharp, 'name': 'person_pin_circle_sharp'},
    {'icon': Icons.person_pin_outlined, 'name': 'person_pin_outlined'},
    {'icon': Icons.person_pin_rounded, 'name': 'person_pin_rounded'},
    {'icon': Icons.person_pin_sharp, 'name': 'person_pin_sharp'},
    {'icon': Icons.person_remove, 'name': 'person_remove'},
    {'icon': Icons.person_remove_alt_1, 'name': 'person_remove_alt_1'},
    {
      'icon': Icons.person_remove_alt_1_outlined,
      'name': 'person_remove_alt_1_outlined'
    },
    {
      'icon': Icons.person_remove_alt_1_rounded,
      'name': 'person_remove_alt_1_rounded'
    },
    {
      'icon': Icons.person_remove_alt_1_sharp,
      'name': 'person_remove_alt_1_sharp'
    },
    {'icon': Icons.person_remove_outlined, 'name': 'person_remove_outlined'},
    {'icon': Icons.person_remove_rounded, 'name': 'person_remove_rounded'},
    {'icon': Icons.person_remove_sharp, 'name': 'person_remove_sharp'},
    {'icon': Icons.person_rounded, 'name': 'person_rounded'},
    {'icon': Icons.person_search, 'name': 'person_search'},
    {'icon': Icons.person_search_outlined, 'name': 'person_search_outlined'},
    {'icon': Icons.person_search_rounded, 'name': 'person_search_rounded'},
    {'icon': Icons.person_search_sharp, 'name': 'person_search_sharp'},
    {'icon': Icons.person_sharp, 'name': 'person_sharp'},
    {'icon': Icons.personal_video, 'name': 'personal_video'},
    {'icon': Icons.personal_video_outlined, 'name': 'personal_video_outlined'},
    {'icon': Icons.personal_video_rounded, 'name': 'personal_video_rounded'},
    {'icon': Icons.personal_video_sharp, 'name': 'personal_video_sharp'},
    {'icon': Icons.pest_control, 'name': 'pest_control'},
    {'icon': Icons.pest_control_outlined, 'name': 'pest_control_outlined'},
    {'icon': Icons.pest_control_rodent, 'name': 'pest_control_rodent'},
    {
      'icon': Icons.pest_control_rodent_outlined,
      'name': 'pest_control_rodent_outlined'
    },
    {
      'icon': Icons.pest_control_rodent_rounded,
      'name': 'pest_control_rodent_rounded'
    },
    {
      'icon': Icons.pest_control_rodent_sharp,
      'name': 'pest_control_rodent_sharp'
    },
    {'icon': Icons.pest_control_rounded, 'name': 'pest_control_rounded'},
    {'icon': Icons.pest_control_sharp, 'name': 'pest_control_sharp'},
    {'icon': Icons.pets, 'name': 'pets'},
    {'icon': Icons.pets_outlined, 'name': 'pets_outlined'},
    {'icon': Icons.pets_rounded, 'name': 'pets_rounded'},
    {'icon': Icons.pets_sharp, 'name': 'pets_sharp'},
    {'icon': Icons.phone, 'name': 'phone'},
    {'icon': Icons.phone_android, 'name': 'phone_android'},
    {'icon': Icons.phone_android_outlined, 'name': 'phone_android_outlined'},
    {'icon': Icons.phone_android_rounded, 'name': 'phone_android_rounded'},
    {'icon': Icons.phone_android_sharp, 'name': 'phone_android_sharp'},
    {'icon': Icons.phone_bluetooth_speaker, 'name': 'phone_bluetooth_speaker'},
    {
      'icon': Icons.phone_bluetooth_speaker_outlined,
      'name': 'phone_bluetooth_speaker_outlined'
    },
    {
      'icon': Icons.phone_bluetooth_speaker_rounded,
      'name': 'phone_bluetooth_speaker_rounded'
    },
    {
      'icon': Icons.phone_bluetooth_speaker_sharp,
      'name': 'phone_bluetooth_speaker_sharp'
    },
    {'icon': Icons.phone_callback, 'name': 'phone_callback'},
    {'icon': Icons.phone_callback_outlined, 'name': 'phone_callback_outlined'},
    {'icon': Icons.phone_callback_rounded, 'name': 'phone_callback_rounded'},
    {'icon': Icons.phone_callback_sharp, 'name': 'phone_callback_sharp'},
    {'icon': Icons.phone_disabled, 'name': 'phone_disabled'},
    {'icon': Icons.phone_disabled_outlined, 'name': 'phone_disabled_outlined'},
    {'icon': Icons.phone_disabled_rounded, 'name': 'phone_disabled_rounded'},
    {'icon': Icons.phone_disabled_sharp, 'name': 'phone_disabled_sharp'},
    {'icon': Icons.phone_enabled, 'name': 'phone_enabled'},
    {'icon': Icons.phone_enabled_outlined, 'name': 'phone_enabled_outlined'},
    {'icon': Icons.phone_enabled_rounded, 'name': 'phone_enabled_rounded'},
    {'icon': Icons.phone_enabled_sharp, 'name': 'phone_enabled_sharp'},
    {'icon': Icons.phone_forwarded, 'name': 'phone_forwarded'},
    {
      'icon': Icons.phone_forwarded_outlined,
      'name': 'phone_forwarded_outlined'
    },
    {'icon': Icons.phone_forwarded_rounded, 'name': 'phone_forwarded_rounded'},
    {'icon': Icons.phone_forwarded_sharp, 'name': 'phone_forwarded_sharp'},
    {'icon': Icons.phone_in_talk, 'name': 'phone_in_talk'},
    {'icon': Icons.phone_in_talk_outlined, 'name': 'phone_in_talk_outlined'},
    {'icon': Icons.phone_in_talk_rounded, 'name': 'phone_in_talk_rounded'},
    {'icon': Icons.phone_in_talk_sharp, 'name': 'phone_in_talk_sharp'},
    {'icon': Icons.phone_iphone, 'name': 'phone_iphone'},
    {'icon': Icons.phone_iphone_outlined, 'name': 'phone_iphone_outlined'},
    {'icon': Icons.phone_iphone_rounded, 'name': 'phone_iphone_rounded'},
    {'icon': Icons.phone_iphone_sharp, 'name': 'phone_iphone_sharp'},
    {'icon': Icons.phone_locked, 'name': 'phone_locked'},
    {'icon': Icons.phone_locked_outlined, 'name': 'phone_locked_outlined'},
    {'icon': Icons.phone_locked_rounded, 'name': 'phone_locked_rounded'},
    {'icon': Icons.phone_locked_sharp, 'name': 'phone_locked_sharp'},
    {'icon': Icons.phone_missed, 'name': 'phone_missed'},
    {'icon': Icons.phone_missed_outlined, 'name': 'phone_missed_outlined'},
    {'icon': Icons.phone_missed_rounded, 'name': 'phone_missed_rounded'},
    {'icon': Icons.phone_missed_sharp, 'name': 'phone_missed_sharp'},
    {'icon': Icons.phone_outlined, 'name': 'phone_outlined'},
    {'icon': Icons.phone_paused, 'name': 'phone_paused'},
    {'icon': Icons.phone_paused_outlined, 'name': 'phone_paused_outlined'},
    {'icon': Icons.phone_paused_rounded, 'name': 'phone_paused_rounded'},
    {'icon': Icons.phone_paused_sharp, 'name': 'phone_paused_sharp'},
    {'icon': Icons.phone_rounded, 'name': 'phone_rounded'},
    {'icon': Icons.phone_sharp, 'name': 'phone_sharp'},
    {'icon': Icons.phonelink, 'name': 'phonelink'},
    {'icon': Icons.phonelink_erase, 'name': 'phonelink_erase'},
    {
      'icon': Icons.phonelink_erase_outlined,
      'name': 'phonelink_erase_outlined'
    },
    {'icon': Icons.phonelink_erase_rounded, 'name': 'phonelink_erase_rounded'},
    {'icon': Icons.phonelink_erase_sharp, 'name': 'phonelink_erase_sharp'},
    {'icon': Icons.phonelink_lock, 'name': 'phonelink_lock'},
    {'icon': Icons.phonelink_lock_outlined, 'name': 'phonelink_lock_outlined'},
    {'icon': Icons.phonelink_lock_rounded, 'name': 'phonelink_lock_rounded'},
    {'icon': Icons.phonelink_lock_sharp, 'name': 'phonelink_lock_sharp'},
    {'icon': Icons.phonelink_off, 'name': 'phonelink_off'},
    {'icon': Icons.phonelink_off_outlined, 'name': 'phonelink_off_outlined'},
    {'icon': Icons.phonelink_off_rounded, 'name': 'phonelink_off_rounded'},
    {'icon': Icons.phonelink_off_sharp, 'name': 'phonelink_off_sharp'},
    {'icon': Icons.phonelink_outlined, 'name': 'phonelink_outlined'},
    {'icon': Icons.phonelink_ring, 'name': 'phonelink_ring'},
    {'icon': Icons.phonelink_ring_outlined, 'name': 'phonelink_ring_outlined'},
    {'icon': Icons.phonelink_ring_rounded, 'name': 'phonelink_ring_rounded'},
    {'icon': Icons.phonelink_ring_sharp, 'name': 'phonelink_ring_sharp'},
    {'icon': Icons.phonelink_rounded, 'name': 'phonelink_rounded'},
    {'icon': Icons.phonelink_setup, 'name': 'phonelink_setup'},
    {
      'icon': Icons.phonelink_setup_outlined,
      'name': 'phonelink_setup_outlined'
    },
    {'icon': Icons.phonelink_setup_rounded, 'name': 'phonelink_setup_rounded'},
    {'icon': Icons.phonelink_setup_sharp, 'name': 'phonelink_setup_sharp'},
    {'icon': Icons.phonelink_sharp, 'name': 'phonelink_sharp'},
    {'icon': Icons.photo, 'name': 'photo'},
    {'icon': Icons.photo_album, 'name': 'photo_album'},
    {'icon': Icons.photo_album_outlined, 'name': 'photo_album_outlined'},
    {'icon': Icons.photo_album_rounded, 'name': 'photo_album_rounded'},
    {'icon': Icons.photo_album_sharp, 'name': 'photo_album_sharp'},
    {'icon': Icons.photo_camera, 'name': 'photo_camera'},
    {'icon': Icons.photo_camera_back, 'name': 'photo_camera_back'},
    {'icon': Icons.photo_camera_front, 'name': 'photo_camera_front'},
    {'icon': Icons.photo_camera_outlined, 'name': 'photo_camera_outlined'},
    {'icon': Icons.photo_camera_rounded, 'name': 'photo_camera_rounded'},
    {'icon': Icons.photo_camera_sharp, 'name': 'photo_camera_sharp'},
    {'icon': Icons.photo_filter, 'name': 'photo_filter'},
    {'icon': Icons.photo_filter_outlined, 'name': 'photo_filter_outlined'},
    {'icon': Icons.photo_filter_rounded, 'name': 'photo_filter_rounded'},
    {'icon': Icons.photo_filter_sharp, 'name': 'photo_filter_sharp'},
    {'icon': Icons.photo_library, 'name': 'photo_library'},
    {'icon': Icons.photo_library_outlined, 'name': 'photo_library_outlined'},
    {'icon': Icons.photo_library_rounded, 'name': 'photo_library_rounded'},
    {'icon': Icons.photo_library_sharp, 'name': 'photo_library_sharp'},
    {'icon': Icons.photo_outlined, 'name': 'photo_outlined'},
    {'icon': Icons.photo_rounded, 'name': 'photo_rounded'},
    {'icon': Icons.photo_sharp, 'name': 'photo_sharp'},
    {
      'icon': Icons.photo_size_select_actual,
      'name': 'photo_size_select_actual'
    },
    {
      'icon': Icons.photo_size_select_actual_outlined,
      'name': 'photo_size_select_actual_outlined'
    },
    {
      'icon': Icons.photo_size_select_actual_rounded,
      'name': 'photo_size_select_actual_rounded'
    },
    {
      'icon': Icons.photo_size_select_actual_sharp,
      'name': 'photo_size_select_actual_sharp'
    },
    {'icon': Icons.photo_size_select_large, 'name': 'photo_size_select_large'},
    {
      'icon': Icons.photo_size_select_large_outlined,
      'name': 'photo_size_select_large_outlined'
    },
    {
      'icon': Icons.photo_size_select_large_rounded,
      'name': 'photo_size_select_large_rounded'
    },
    {
      'icon': Icons.photo_size_select_large_sharp,
      'name': 'photo_size_select_large_sharp'
    },
    {'icon': Icons.photo_size_select_small, 'name': 'photo_size_select_small'},
    {
      'icon': Icons.photo_size_select_small_outlined,
      'name': 'photo_size_select_small_outlined'
    },
    {
      'icon': Icons.photo_size_select_small_rounded,
      'name': 'photo_size_select_small_rounded'
    },
    {
      'icon': Icons.photo_size_select_small_sharp,
      'name': 'photo_size_select_small_sharp'
    },
    {'icon': Icons.picture_as_pdf, 'name': 'picture_as_pdf'},
    {'icon': Icons.picture_as_pdf_outlined, 'name': 'picture_as_pdf_outlined'},
    {'icon': Icons.picture_as_pdf_rounded, 'name': 'picture_as_pdf_rounded'},
    {'icon': Icons.picture_as_pdf_sharp, 'name': 'picture_as_pdf_sharp'},
    {'icon': Icons.picture_in_picture, 'name': 'picture_in_picture'},
    {'icon': Icons.picture_in_picture_alt, 'name': 'picture_in_picture_alt'},
    {
      'icon': Icons.picture_in_picture_alt_outlined,
      'name': 'picture_in_picture_alt_outlined'
    },
    {
      'icon': Icons.picture_in_picture_alt_rounded,
      'name': 'picture_in_picture_alt_rounded'
    },
    {
      'icon': Icons.picture_in_picture_alt_sharp,
      'name': 'picture_in_picture_alt_sharp'
    },
    {
      'icon': Icons.picture_in_picture_outlined,
      'name': 'picture_in_picture_outlined'
    },
    {
      'icon': Icons.picture_in_picture_rounded,
      'name': 'picture_in_picture_rounded'
    },
    {
      'icon': Icons.picture_in_picture_sharp,
      'name': 'picture_in_picture_sharp'
    },
    {'icon': Icons.pie_chart, 'name': 'pie_chart'},
    {
      'icon': Icons.pie_chart_outline_outlined,
      'name': 'pie_chart_outline_outlined'
    },
    {
      'icon': Icons.pie_chart_outline_rounded,
      'name': 'pie_chart_outline_rounded'
    },
    {'icon': Icons.pie_chart_outline_sharp, 'name': 'pie_chart_outline_sharp'},
    {'icon': Icons.pie_chart_outlined, 'name': 'pie_chart_outlined'},
    {'icon': Icons.pie_chart_rounded, 'name': 'pie_chart_rounded'},
    {'icon': Icons.pie_chart_sharp, 'name': 'pie_chart_sharp'},
    {'icon': Icons.pin_drop, 'name': 'pin_drop'},
    {'icon': Icons.pin_drop_outlined, 'name': 'pin_drop_outlined'},
    {'icon': Icons.pin_drop_rounded, 'name': 'pin_drop_rounded'},
    {'icon': Icons.pin_drop_sharp, 'name': 'pin_drop_sharp'},
    {'icon': Icons.pivot_table_chart, 'name': 'pivot_table_chart'},
    {'icon': Icons.place, 'name': 'place'},
    {'icon': Icons.place_outlined, 'name': 'place_outlined'},
    {'icon': Icons.place_rounded, 'name': 'place_rounded'},
    {'icon': Icons.place_sharp, 'name': 'place_sharp'},
    {'icon': Icons.plagiarism, 'name': 'plagiarism'},
    {'icon': Icons.plagiarism_outlined, 'name': 'plagiarism_outlined'},
    {'icon': Icons.plagiarism_rounded, 'name': 'plagiarism_rounded'},
    {'icon': Icons.plagiarism_sharp, 'name': 'plagiarism_sharp'},
    {'icon': Icons.play_arrow, 'name': 'play_arrow'},
    {'icon': Icons.play_arrow_outlined, 'name': 'play_arrow_outlined'},
    {'icon': Icons.play_arrow_rounded, 'name': 'play_arrow_rounded'},
    {'icon': Icons.play_arrow_sharp, 'name': 'play_arrow_sharp'},
    {'icon': Icons.play_circle_fill, 'name': 'play_circle_fill'},
    {
      'icon': Icons.play_circle_fill_outlined,
      'name': 'play_circle_fill_outlined'
    },
    {
      'icon': Icons.play_circle_fill_rounded,
      'name': 'play_circle_fill_rounded'
    },
    {'icon': Icons.play_circle_fill_sharp, 'name': 'play_circle_fill_sharp'},
    {'icon': Icons.play_circle_filled, 'name': 'play_circle_filled'},
    {
      'icon': Icons.play_circle_filled_outlined,
      'name': 'play_circle_filled_outlined'
    },
    {
      'icon': Icons.play_circle_filled_rounded,
      'name': 'play_circle_filled_rounded'
    },
    {
      'icon': Icons.play_circle_filled_sharp,
      'name': 'play_circle_filled_sharp'
    },
    {'icon': Icons.play_circle_outline, 'name': 'play_circle_outline'},
    {
      'icon': Icons.play_circle_outline_outlined,
      'name': 'play_circle_outline_outlined'
    },
    {
      'icon': Icons.play_circle_outline_rounded,
      'name': 'play_circle_outline_rounded'
    },
    {
      'icon': Icons.play_circle_outline_sharp,
      'name': 'play_circle_outline_sharp'
    },
    {'icon': Icons.play_disabled, 'name': 'play_disabled'},
    {'icon': Icons.play_for_work, 'name': 'play_for_work'},
    {'icon': Icons.play_for_work_outlined, 'name': 'play_for_work_outlined'},
    {'icon': Icons.play_for_work_rounded, 'name': 'play_for_work_rounded'},
    {'icon': Icons.play_for_work_sharp, 'name': 'play_for_work_sharp'},
    {'icon': Icons.playlist_add, 'name': 'playlist_add'},
    {'icon': Icons.playlist_add_check, 'name': 'playlist_add_check'},
    {
      'icon': Icons.playlist_add_check_outlined,
      'name': 'playlist_add_check_outlined'
    },
    {
      'icon': Icons.playlist_add_check_rounded,
      'name': 'playlist_add_check_rounded'
    },
    {
      'icon': Icons.playlist_add_check_sharp,
      'name': 'playlist_add_check_sharp'
    },
    {'icon': Icons.playlist_add_outlined, 'name': 'playlist_add_outlined'},
    {'icon': Icons.playlist_add_rounded, 'name': 'playlist_add_rounded'},
    {'icon': Icons.playlist_add_sharp, 'name': 'playlist_add_sharp'},
    {'icon': Icons.playlist_play, 'name': 'playlist_play'},
    {'icon': Icons.playlist_play_outlined, 'name': 'playlist_play_outlined'},
    {'icon': Icons.playlist_play_rounded, 'name': 'playlist_play_rounded'},
    {'icon': Icons.playlist_play_sharp, 'name': 'playlist_play_sharp'},
    {'icon': Icons.plumbing, 'name': 'plumbing'},
    {'icon': Icons.plumbing_outlined, 'name': 'plumbing_outlined'},
    {'icon': Icons.plumbing_rounded, 'name': 'plumbing_rounded'},
    {'icon': Icons.plumbing_sharp, 'name': 'plumbing_sharp'},
    {'icon': Icons.plus_one, 'name': 'plus_one'},
    {'icon': Icons.plus_one_outlined, 'name': 'plus_one_outlined'},
    {'icon': Icons.plus_one_rounded, 'name': 'plus_one_rounded'},
    {'icon': Icons.plus_one_sharp, 'name': 'plus_one_sharp'},
    {'icon': Icons.point_of_sale, 'name': 'point_of_sale'},
    {'icon': Icons.point_of_sale_outlined, 'name': 'point_of_sale_outlined'},
    {'icon': Icons.point_of_sale_rounded, 'name': 'point_of_sale_rounded'},
    {'icon': Icons.point_of_sale_sharp, 'name': 'point_of_sale_sharp'},
    {'icon': Icons.policy, 'name': 'policy'},
    {'icon': Icons.policy_outlined, 'name': 'policy_outlined'},
    {'icon': Icons.policy_rounded, 'name': 'policy_rounded'},
    {'icon': Icons.policy_sharp, 'name': 'policy_sharp'},
    {'icon': Icons.poll, 'name': 'poll'},
    {'icon': Icons.poll_outlined, 'name': 'poll_outlined'},
    {'icon': Icons.poll_rounded, 'name': 'poll_rounded'},
    {'icon': Icons.poll_sharp, 'name': 'poll_sharp'},
    {'icon': Icons.polymer, 'name': 'polymer'},
    {'icon': Icons.polymer_outlined, 'name': 'polymer_outlined'},
    {'icon': Icons.polymer_rounded, 'name': 'polymer_rounded'},
    {'icon': Icons.polymer_sharp, 'name': 'polymer_sharp'},
    {'icon': Icons.pool, 'name': 'pool'},
    {'icon': Icons.pool_outlined, 'name': 'pool_outlined'},
    {'icon': Icons.pool_rounded, 'name': 'pool_rounded'},
    {'icon': Icons.pool_sharp, 'name': 'pool_sharp'},
    {'icon': Icons.portable_wifi_off, 'name': 'portable_wifi_off'},
    {
      'icon': Icons.portable_wifi_off_outlined,
      'name': 'portable_wifi_off_outlined'
    },
    {
      'icon': Icons.portable_wifi_off_rounded,
      'name': 'portable_wifi_off_rounded'
    },
    {'icon': Icons.portable_wifi_off_sharp, 'name': 'portable_wifi_off_sharp'},
    {'icon': Icons.portrait, 'name': 'portrait'},
    {'icon': Icons.portrait_outlined, 'name': 'portrait_outlined'},
    {'icon': Icons.portrait_rounded, 'name': 'portrait_rounded'},
    {'icon': Icons.portrait_sharp, 'name': 'portrait_sharp'},
    {'icon': Icons.post_add, 'name': 'post_add'},
    {'icon': Icons.post_add_outlined, 'name': 'post_add_outlined'},
    {'icon': Icons.post_add_rounded, 'name': 'post_add_rounded'},
    {'icon': Icons.post_add_sharp, 'name': 'post_add_sharp'},
    {'icon': Icons.power, 'name': 'power'},
    {'icon': Icons.power_input, 'name': 'power_input'},
    {'icon': Icons.power_input_outlined, 'name': 'power_input_outlined'},
    {'icon': Icons.power_input_rounded, 'name': 'power_input_rounded'},
    {'icon': Icons.power_input_sharp, 'name': 'power_input_sharp'},
    {'icon': Icons.power_off, 'name': 'power_off'},
    {'icon': Icons.power_off_outlined, 'name': 'power_off_outlined'},
    {'icon': Icons.power_off_rounded, 'name': 'power_off_rounded'},
    {'icon': Icons.power_off_sharp, 'name': 'power_off_sharp'},
    {'icon': Icons.power_outlined, 'name': 'power_outlined'},
    {'icon': Icons.power_rounded, 'name': 'power_rounded'},
    {'icon': Icons.power_settings_new, 'name': 'power_settings_new'},
    {
      'icon': Icons.power_settings_new_outlined,
      'name': 'power_settings_new_outlined'
    },
    {
      'icon': Icons.power_settings_new_rounded,
      'name': 'power_settings_new_rounded'
    },
    {
      'icon': Icons.power_settings_new_sharp,
      'name': 'power_settings_new_sharp'
    },
    {'icon': Icons.power_sharp, 'name': 'power_sharp'},
    {
      'icon': Icons.precision_manufacturing_outlined,
      'name': 'precision_manufacturing_outlined'
    },
    {
      'icon': Icons.precision_manufacturing_rounded,
      'name': 'precision_manufacturing_rounded'
    },
    {
      'icon': Icons.precision_manufacturing_sharp,
      'name': 'precision_manufacturing_sharp'
    },
    {'icon': Icons.pregnant_woman, 'name': 'pregnant_woman'},
    {'icon': Icons.pregnant_woman_outlined, 'name': 'pregnant_woman_outlined'},
    {'icon': Icons.pregnant_woman_rounded, 'name': 'pregnant_woman_rounded'},
    {'icon': Icons.pregnant_woman_sharp, 'name': 'pregnant_woman_sharp'},
    {'icon': Icons.present_to_all, 'name': 'present_to_all'},
    {'icon': Icons.present_to_all_outlined, 'name': 'present_to_all_outlined'},
    {'icon': Icons.present_to_all_rounded, 'name': 'present_to_all_rounded'},
    {'icon': Icons.present_to_all_sharp, 'name': 'present_to_all_sharp'},
    {'icon': Icons.preview, 'name': 'preview'},
    {'icon': Icons.preview_outlined, 'name': 'preview_outlined'},
    {'icon': Icons.preview_rounded, 'name': 'preview_rounded'},
    {'icon': Icons.preview_sharp, 'name': 'preview_sharp'},
    {'icon': Icons.print, 'name': 'print'},
    {'icon': Icons.print_disabled, 'name': 'print_disabled'},
    {'icon': Icons.print_disabled_outlined, 'name': 'print_disabled_outlined'},
    {'icon': Icons.print_disabled_rounded, 'name': 'print_disabled_rounded'},
    {'icon': Icons.print_disabled_sharp, 'name': 'print_disabled_sharp'},
    {'icon': Icons.print_outlined, 'name': 'print_outlined'},
    {'icon': Icons.print_rounded, 'name': 'print_rounded'},
    {'icon': Icons.print_sharp, 'name': 'print_sharp'},
    {'icon': Icons.priority_high, 'name': 'priority_high'},
    {'icon': Icons.priority_high_outlined, 'name': 'priority_high_outlined'},
    {'icon': Icons.priority_high_rounded, 'name': 'priority_high_rounded'},
    {'icon': Icons.priority_high_sharp, 'name': 'priority_high_sharp'},
    {'icon': Icons.privacy_tip, 'name': 'privacy_tip'},
    {'icon': Icons.privacy_tip_outlined, 'name': 'privacy_tip_outlined'},
    {'icon': Icons.privacy_tip_rounded, 'name': 'privacy_tip_rounded'},
    {'icon': Icons.privacy_tip_sharp, 'name': 'privacy_tip_sharp'},
    {'icon': Icons.psychology, 'name': 'psychology'},
    {'icon': Icons.psychology_outlined, 'name': 'psychology_outlined'},
    {'icon': Icons.psychology_rounded, 'name': 'psychology_rounded'},
    {'icon': Icons.psychology_sharp, 'name': 'psychology_sharp'},
    {'icon': Icons.public, 'name': 'public'},
    {'icon': Icons.public_off, 'name': 'public_off'},
    {'icon': Icons.public_off_outlined, 'name': 'public_off_outlined'},
    {'icon': Icons.public_off_rounded, 'name': 'public_off_rounded'},
    {'icon': Icons.public_off_sharp, 'name': 'public_off_sharp'},
    {'icon': Icons.public_outlined, 'name': 'public_outlined'},
    {'icon': Icons.public_rounded, 'name': 'public_rounded'},
    {'icon': Icons.public_sharp, 'name': 'public_sharp'},
    {'icon': Icons.publish, 'name': 'publish'},
    {'icon': Icons.publish_outlined, 'name': 'publish_outlined'},
    {'icon': Icons.publish_rounded, 'name': 'publish_rounded'},
    {'icon': Icons.publish_sharp, 'name': 'publish_sharp'},
    {'icon': Icons.push_pin, 'name': 'push_pin'},
    {'icon': Icons.push_pin_outlined, 'name': 'push_pin_outlined'},
    {'icon': Icons.push_pin_rounded, 'name': 'push_pin_rounded'},
    {'icon': Icons.push_pin_sharp, 'name': 'push_pin_sharp'},
    {'icon': Icons.qr_code, 'name': 'qr_code'},
    {'icon': Icons.qr_code_outlined, 'name': 'qr_code_outlined'},
    {'icon': Icons.qr_code_rounded, 'name': 'qr_code_rounded'},
    {'icon': Icons.qr_code_scanner, 'name': 'qr_code_scanner'},
    {
      'icon': Icons.qr_code_scanner_outlined,
      'name': 'qr_code_scanner_outlined'
    },
    {'icon': Icons.qr_code_scanner_rounded, 'name': 'qr_code_scanner_rounded'},
    {'icon': Icons.qr_code_scanner_sharp, 'name': 'qr_code_scanner_sharp'},
    {'icon': Icons.qr_code_sharp, 'name': 'qr_code_sharp'},
    {'icon': Icons.query_builder, 'name': 'query_builder'},
    {'icon': Icons.query_builder_outlined, 'name': 'query_builder_outlined'},
    {'icon': Icons.query_builder_rounded, 'name': 'query_builder_rounded'},
    {'icon': Icons.query_builder_sharp, 'name': 'query_builder_sharp'},
    {'icon': Icons.question_answer, 'name': 'question_answer'},
    {
      'icon': Icons.question_answer_outlined,
      'name': 'question_answer_outlined'
    },
    {'icon': Icons.question_answer_rounded, 'name': 'question_answer_rounded'},
    {'icon': Icons.question_answer_sharp, 'name': 'question_answer_sharp'},
    {'icon': Icons.queue, 'name': 'queue'},
    {'icon': Icons.queue_music, 'name': 'queue_music'},
    {'icon': Icons.queue_music_outlined, 'name': 'queue_music_outlined'},
    {'icon': Icons.queue_music_rounded, 'name': 'queue_music_rounded'},
    {'icon': Icons.queue_music_sharp, 'name': 'queue_music_sharp'},
    {'icon': Icons.queue_outlined, 'name': 'queue_outlined'},
    {'icon': Icons.queue_play_next, 'name': 'queue_play_next'},
    {
      'icon': Icons.queue_play_next_outlined,
      'name': 'queue_play_next_outlined'
    },
    {'icon': Icons.queue_play_next_rounded, 'name': 'queue_play_next_rounded'},
    {'icon': Icons.queue_play_next_sharp, 'name': 'queue_play_next_sharp'},
    {'icon': Icons.queue_rounded, 'name': 'queue_rounded'},
    {'icon': Icons.queue_sharp, 'name': 'queue_sharp'},
    {'icon': Icons.quick_contacts_dialer, 'name': 'quick_contacts_dialer'},
    {
      'icon': Icons.quick_contacts_dialer_outlined,
      'name': 'quick_contacts_dialer_outlined'
    },
    {
      'icon': Icons.quick_contacts_dialer_rounded,
      'name': 'quick_contacts_dialer_rounded'
    },
    {
      'icon': Icons.quick_contacts_dialer_sharp,
      'name': 'quick_contacts_dialer_sharp'
    },
    {'icon': Icons.quick_contacts_mail, 'name': 'quick_contacts_mail'},
    {
      'icon': Icons.quick_contacts_mail_outlined,
      'name': 'quick_contacts_mail_outlined'
    },
    {
      'icon': Icons.quick_contacts_mail_rounded,
      'name': 'quick_contacts_mail_rounded'
    },
    {
      'icon': Icons.quick_contacts_mail_sharp,
      'name': 'quick_contacts_mail_sharp'
    },
    {'icon': Icons.quickreply, 'name': 'quickreply'},
    {'icon': Icons.quickreply_outlined, 'name': 'quickreply_outlined'},
    {'icon': Icons.quickreply_rounded, 'name': 'quickreply_rounded'},
    {'icon': Icons.quickreply_sharp, 'name': 'quickreply_sharp'},
    {'icon': Icons.radio, 'name': 'radio'},
    {'icon': Icons.radio_button_checked, 'name': 'radio_button_checked'},
    {
      'icon': Icons.radio_button_checked_outlined,
      'name': 'radio_button_checked_outlined'
    },
    {
      'icon': Icons.radio_button_checked_rounded,
      'name': 'radio_button_checked_rounded'
    },
    {
      'icon': Icons.radio_button_checked_sharp,
      'name': 'radio_button_checked_sharp'
    },
    {'icon': Icons.radio_button_off, 'name': 'radio_button_off'},
    {
      'icon': Icons.radio_button_off_outlined,
      'name': 'radio_button_off_outlined'
    },
    {
      'icon': Icons.radio_button_off_rounded,
      'name': 'radio_button_off_rounded'
    },
    {'icon': Icons.radio_button_off_sharp, 'name': 'radio_button_off_sharp'},
    {'icon': Icons.radio_button_on, 'name': 'radio_button_on'},
    {
      'icon': Icons.radio_button_on_outlined,
      'name': 'radio_button_on_outlined'
    },
    {'icon': Icons.radio_button_on_rounded, 'name': 'radio_button_on_rounded'},
    {'icon': Icons.radio_button_on_sharp, 'name': 'radio_button_on_sharp'},
    {'icon': Icons.radio_button_unchecked, 'name': 'radio_button_unchecked'},
    {
      'icon': Icons.radio_button_unchecked_outlined,
      'name': 'radio_button_unchecked_outlined'
    },
    {
      'icon': Icons.radio_button_unchecked_rounded,
      'name': 'radio_button_unchecked_rounded'
    },
    {
      'icon': Icons.radio_button_unchecked_sharp,
      'name': 'radio_button_unchecked_sharp'
    },
    {'icon': Icons.radio_outlined, 'name': 'radio_outlined'},
    {'icon': Icons.radio_rounded, 'name': 'radio_rounded'},
    {'icon': Icons.radio_sharp, 'name': 'radio_sharp'},
    {'icon': Icons.railway_alert, 'name': 'railway_alert'},
    {'icon': Icons.ramen_dining, 'name': 'ramen_dining'},
    {'icon': Icons.rate_review, 'name': 'rate_review'},
    {'icon': Icons.rate_review_outlined, 'name': 'rate_review_outlined'},
    {'icon': Icons.rate_review_rounded, 'name': 'rate_review_rounded'},
    {'icon': Icons.rate_review_sharp, 'name': 'rate_review_sharp'},
    {'icon': Icons.read_more, 'name': 'read_more'},
    {'icon': Icons.read_more_outlined, 'name': 'read_more_outlined'},
    {'icon': Icons.read_more_rounded, 'name': 'read_more_rounded'},
    {'icon': Icons.read_more_sharp, 'name': 'read_more_sharp'},
    {'icon': Icons.receipt, 'name': 'receipt'},
    {'icon': Icons.receipt_long, 'name': 'receipt_long'},
    {'icon': Icons.receipt_long_outlined, 'name': 'receipt_long_outlined'},
    {'icon': Icons.receipt_long_rounded, 'name': 'receipt_long_rounded'},
    {'icon': Icons.receipt_long_sharp, 'name': 'receipt_long_sharp'},
    {'icon': Icons.receipt_outlined, 'name': 'receipt_outlined'},
    {'icon': Icons.receipt_rounded, 'name': 'receipt_rounded'},
    {'icon': Icons.receipt_sharp, 'name': 'receipt_sharp'},
    {'icon': Icons.recent_actors, 'name': 'recent_actors'},
    {'icon': Icons.recent_actors_outlined, 'name': 'recent_actors_outlined'},
    {'icon': Icons.recent_actors_rounded, 'name': 'recent_actors_rounded'},
    {'icon': Icons.recent_actors_sharp, 'name': 'recent_actors_sharp'},
    {'icon': Icons.recommend, 'name': 'recommend'},
    {'icon': Icons.record_voice_over, 'name': 'record_voice_over'},
    {
      'icon': Icons.record_voice_over_outlined,
      'name': 'record_voice_over_outlined'
    },
    {
      'icon': Icons.record_voice_over_rounded,
      'name': 'record_voice_over_rounded'
    },
    {'icon': Icons.record_voice_over_sharp, 'name': 'record_voice_over_sharp'},
    {'icon': Icons.redeem, 'name': 'redeem'},
    {'icon': Icons.redeem_outlined, 'name': 'redeem_outlined'},
    {'icon': Icons.redeem_rounded, 'name': 'redeem_rounded'},
    {'icon': Icons.redeem_sharp, 'name': 'redeem_sharp'},
    {'icon': Icons.redo, 'name': 'redo'},
    {'icon': Icons.redo_outlined, 'name': 'redo_outlined'},
    {'icon': Icons.redo_rounded, 'name': 'redo_rounded'},
    {'icon': Icons.redo_sharp, 'name': 'redo_sharp'},
    {'icon': Icons.reduce_capacity, 'name': 'reduce_capacity'},
    {
      'icon': Icons.reduce_capacity_outlined,
      'name': 'reduce_capacity_outlined'
    },
    {'icon': Icons.reduce_capacity_rounded, 'name': 'reduce_capacity_rounded'},
    {'icon': Icons.reduce_capacity_sharp, 'name': 'reduce_capacity_sharp'},
    {'icon': Icons.refresh, 'name': 'refresh'},
    {'icon': Icons.refresh_outlined, 'name': 'refresh_outlined'},
    {'icon': Icons.refresh_rounded, 'name': 'refresh_rounded'},
    {'icon': Icons.refresh_sharp, 'name': 'refresh_sharp'},
    {'icon': Icons.remove, 'name': 'remove'},
    {'icon': Icons.remove_circle, 'name': 'remove_circle'},
    {'icon': Icons.remove_circle_outline, 'name': 'remove_circle_outline'},
    {
      'icon': Icons.remove_circle_outline_outlined,
      'name': 'remove_circle_outline_outlined'
    },
    {
      'icon': Icons.remove_circle_outline_rounded,
      'name': 'remove_circle_outline_rounded'
    },
    {
      'icon': Icons.remove_circle_outline_sharp,
      'name': 'remove_circle_outline_sharp'
    },
    {'icon': Icons.remove_circle_outlined, 'name': 'remove_circle_outlined'},
    {'icon': Icons.remove_circle_rounded, 'name': 'remove_circle_rounded'},
    {'icon': Icons.remove_circle_sharp, 'name': 'remove_circle_sharp'},
    {'icon': Icons.remove_done, 'name': 'remove_done'},
    {'icon': Icons.remove_from_queue, 'name': 'remove_from_queue'},
    {
      'icon': Icons.remove_from_queue_outlined,
      'name': 'remove_from_queue_outlined'
    },
    {
      'icon': Icons.remove_from_queue_rounded,
      'name': 'remove_from_queue_rounded'
    },
    {'icon': Icons.remove_from_queue_sharp, 'name': 'remove_from_queue_sharp'},
    {'icon': Icons.remove_moderator, 'name': 'remove_moderator'},
    {'icon': Icons.remove_outlined, 'name': 'remove_outlined'},
    {'icon': Icons.remove_red_eye, 'name': 'remove_red_eye'},
    {'icon': Icons.remove_red_eye_outlined, 'name': 'remove_red_eye_outlined'},
    {'icon': Icons.remove_red_eye_rounded, 'name': 'remove_red_eye_rounded'},
    {'icon': Icons.remove_red_eye_sharp, 'name': 'remove_red_eye_sharp'},
    {'icon': Icons.remove_rounded, 'name': 'remove_rounded'},
    {'icon': Icons.remove_sharp, 'name': 'remove_sharp'},
    {'icon': Icons.remove_shopping_cart, 'name': 'remove_shopping_cart'},
    {
      'icon': Icons.remove_shopping_cart_outlined,
      'name': 'remove_shopping_cart_outlined'
    },
    {
      'icon': Icons.remove_shopping_cart_rounded,
      'name': 'remove_shopping_cart_rounded'
    },
    {
      'icon': Icons.remove_shopping_cart_sharp,
      'name': 'remove_shopping_cart_sharp'
    },
    {'icon': Icons.reorder, 'name': 'reorder'},
    {'icon': Icons.reorder_outlined, 'name': 'reorder_outlined'},
    {'icon': Icons.reorder_rounded, 'name': 'reorder_rounded'},
    {'icon': Icons.reorder_sharp, 'name': 'reorder_sharp'},
    {'icon': Icons.repeat, 'name': 'repeat'},
    {'icon': Icons.repeat_on, 'name': 'repeat_on'},
    {'icon': Icons.repeat_one, 'name': 'repeat_one'},
    {'icon': Icons.repeat_one_on, 'name': 'repeat_one_on'},
    {'icon': Icons.repeat_one_outlined, 'name': 'repeat_one_outlined'},
    {'icon': Icons.repeat_one_rounded, 'name': 'repeat_one_rounded'},
    {'icon': Icons.repeat_one_sharp, 'name': 'repeat_one_sharp'},
    {'icon': Icons.repeat_outlined, 'name': 'repeat_outlined'},
    {'icon': Icons.repeat_rounded, 'name': 'repeat_rounded'},
    {'icon': Icons.repeat_sharp, 'name': 'repeat_sharp'},
    {'icon': Icons.replay, 'name': 'replay'},
    {'icon': Icons.replay_5, 'name': 'replay_5'},
    {'icon': Icons.replay_5_outlined, 'name': 'replay_5_outlined'},
    {'icon': Icons.replay_5_rounded, 'name': 'replay_5_rounded'},
    {'icon': Icons.replay_5_sharp, 'name': 'replay_5_sharp'},
    {'icon': Icons.replay_10, 'name': 'replay_10'},
    {'icon': Icons.replay_10_outlined, 'name': 'replay_10_outlined'},
    {'icon': Icons.replay_10_rounded, 'name': 'replay_10_rounded'},
    {'icon': Icons.replay_10_sharp, 'name': 'replay_10_sharp'},
    {'icon': Icons.replay_30, 'name': 'replay_30'},
    {'icon': Icons.replay_30_outlined, 'name': 'replay_30_outlined'},
    {'icon': Icons.replay_30_rounded, 'name': 'replay_30_rounded'},
    {'icon': Icons.replay_30_sharp, 'name': 'replay_30_sharp'},
    {'icon': Icons.replay_circle_filled, 'name': 'replay_circle_filled'},
    {'icon': Icons.replay_outlined, 'name': 'replay_outlined'},
    {'icon': Icons.replay_rounded, 'name': 'replay_rounded'},
    {'icon': Icons.replay_sharp, 'name': 'replay_sharp'},
    {'icon': Icons.reply, 'name': 'reply'},
    {'icon': Icons.reply_all, 'name': 'reply_all'},
    {'icon': Icons.reply_all_outlined, 'name': 'reply_all_outlined'},
    {'icon': Icons.reply_all_rounded, 'name': 'reply_all_rounded'},
    {'icon': Icons.reply_all_sharp, 'name': 'reply_all_sharp'},
    {'icon': Icons.reply_outlined, 'name': 'reply_outlined'},
    {'icon': Icons.reply_rounded, 'name': 'reply_rounded'},
    {'icon': Icons.reply_sharp, 'name': 'reply_sharp'},
    {'icon': Icons.report, 'name': 'report'},
    {
      'icon': Icons.report_gmailerrorred_outlined,
      'name': 'report_gmailerrorred_outlined'
    },
    {
      'icon': Icons.report_gmailerrorred_rounded,
      'name': 'report_gmailerrorred_rounded'
    },
    {
      'icon': Icons.report_gmailerrorred_sharp,
      'name': 'report_gmailerrorred_sharp'
    },
    {'icon': Icons.report_off, 'name': 'report_off'},
    {'icon': Icons.report_off_outlined, 'name': 'report_off_outlined'},
    {'icon': Icons.report_off_rounded, 'name': 'report_off_rounded'},
    {'icon': Icons.report_off_sharp, 'name': 'report_off_sharp'},
    {'icon': Icons.report_outlined, 'name': 'report_outlined'},
    {'icon': Icons.report_problem, 'name': 'report_problem'},
    {'icon': Icons.report_problem_outlined, 'name': 'report_problem_outlined'},
    {'icon': Icons.report_problem_rounded, 'name': 'report_problem_rounded'},
    {'icon': Icons.report_problem_sharp, 'name': 'report_problem_sharp'},
    {'icon': Icons.report_rounded, 'name': 'report_rounded'},
    {'icon': Icons.report_sharp, 'name': 'report_sharp'},
    {'icon': Icons.request_page, 'name': 'request_page'},
    {'icon': Icons.request_page_outlined, 'name': 'request_page_outlined'},
    {'icon': Icons.request_page_rounded, 'name': 'request_page_rounded'},
    {'icon': Icons.request_page_sharp, 'name': 'request_page_sharp'},
    {'icon': Icons.request_quote, 'name': 'request_quote'},
    {'icon': Icons.request_quote_outlined, 'name': 'request_quote_outlined'},
    {'icon': Icons.request_quote_rounded, 'name': 'request_quote_rounded'},
    {'icon': Icons.request_quote_sharp, 'name': 'request_quote_sharp'},
    {'icon': Icons.reset_tv, 'name': 'reset_tv'},
    {'icon': Icons.restaurant, 'name': 'restaurant'},
    {'icon': Icons.restaurant_menu, 'name': 'restaurant_menu'},
    {
      'icon': Icons.restaurant_menu_outlined,
      'name': 'restaurant_menu_outlined'
    },
    {'icon': Icons.restaurant_menu_rounded, 'name': 'restaurant_menu_rounded'},
    {'icon': Icons.restaurant_menu_sharp, 'name': 'restaurant_menu_sharp'},
    {'icon': Icons.restaurant_outlined, 'name': 'restaurant_outlined'},
    {'icon': Icons.restaurant_rounded, 'name': 'restaurant_rounded'},
    {'icon': Icons.restaurant_sharp, 'name': 'restaurant_sharp'},
    {'icon': Icons.restore, 'name': 'restore'},
    {'icon': Icons.restore_from_trash, 'name': 'restore_from_trash'},
    {
      'icon': Icons.restore_from_trash_outlined,
      'name': 'restore_from_trash_outlined'
    },
    {
      'icon': Icons.restore_from_trash_rounded,
      'name': 'restore_from_trash_rounded'
    },
    {
      'icon': Icons.restore_from_trash_sharp,
      'name': 'restore_from_trash_sharp'
    },
    {'icon': Icons.restore_outlined, 'name': 'restore_outlined'},
    {'icon': Icons.restore_page, 'name': 'restore_page'},
    {'icon': Icons.restore_page_outlined, 'name': 'restore_page_outlined'},
    {'icon': Icons.restore_page_rounded, 'name': 'restore_page_rounded'},
    {'icon': Icons.restore_page_sharp, 'name': 'restore_page_sharp'},
    {'icon': Icons.restore_rounded, 'name': 'restore_rounded'},
    {'icon': Icons.restore_sharp, 'name': 'restore_sharp'},
    {'icon': Icons.rice_bowl, 'name': 'rice_bowl'},
    {'icon': Icons.rice_bowl_outlined, 'name': 'rice_bowl_outlined'},
    {'icon': Icons.rice_bowl_rounded, 'name': 'rice_bowl_rounded'},
    {'icon': Icons.rice_bowl_sharp, 'name': 'rice_bowl_sharp'},
    {'icon': Icons.ring_volume, 'name': 'ring_volume'},
    {'icon': Icons.ring_volume_outlined, 'name': 'ring_volume_outlined'},
    {'icon': Icons.ring_volume_rounded, 'name': 'ring_volume_rounded'},
    {'icon': Icons.ring_volume_sharp, 'name': 'ring_volume_sharp'},
    {'icon': Icons.roofing, 'name': 'roofing'},
    {'icon': Icons.roofing_outlined, 'name': 'roofing_outlined'},
    {'icon': Icons.roofing_rounded, 'name': 'roofing_rounded'},
    {'icon': Icons.roofing_sharp, 'name': 'roofing_sharp'},
    {'icon': Icons.room, 'name': 'room'},
    {'icon': Icons.room_outlined, 'name': 'room_outlined'},
    {'icon': Icons.room_preferences, 'name': 'room_preferences'},
    {
      'icon': Icons.room_preferences_outlined,
      'name': 'room_preferences_outlined'
    },
    {
      'icon': Icons.room_preferences_rounded,
      'name': 'room_preferences_rounded'
    },
    {'icon': Icons.room_preferences_sharp, 'name': 'room_preferences_sharp'},
    {'icon': Icons.room_rounded, 'name': 'room_rounded'},
    {'icon': Icons.room_service, 'name': 'room_service'},
    {'icon': Icons.room_service_outlined, 'name': 'room_service_outlined'},
    {'icon': Icons.room_service_rounded, 'name': 'room_service_rounded'},
    {'icon': Icons.room_service_sharp, 'name': 'room_service_sharp'},
    {'icon': Icons.room_sharp, 'name': 'room_sharp'},
    {'icon': Icons.rotate_90_degrees_ccw, 'name': 'rotate_90_degrees_ccw'},
    {
      'icon': Icons.rotate_90_degrees_ccw_outlined,
      'name': 'rotate_90_degrees_ccw_outlined'
    },
    {
      'icon': Icons.rotate_90_degrees_ccw_rounded,
      'name': 'rotate_90_degrees_ccw_rounded'
    },
    {
      'icon': Icons.rotate_90_degrees_ccw_sharp,
      'name': 'rotate_90_degrees_ccw_sharp'
    },
    {'icon': Icons.rotate_left, 'name': 'rotate_left'},
    {'icon': Icons.rotate_left_outlined, 'name': 'rotate_left_outlined'},
    {'icon': Icons.rotate_left_rounded, 'name': 'rotate_left_rounded'},
    {'icon': Icons.rotate_left_sharp, 'name': 'rotate_left_sharp'},
    {'icon': Icons.rotate_right, 'name': 'rotate_right'},
    {'icon': Icons.rotate_right_outlined, 'name': 'rotate_right_outlined'},
    {'icon': Icons.rotate_right_rounded, 'name': 'rotate_right_rounded'},
    {'icon': Icons.rotate_right_sharp, 'name': 'rotate_right_sharp'},
    {'icon': Icons.rounded_corner, 'name': 'rounded_corner'},
    {'icon': Icons.rounded_corner_outlined, 'name': 'rounded_corner_outlined'},
    {'icon': Icons.rounded_corner_rounded, 'name': 'rounded_corner_rounded'},
    {'icon': Icons.rounded_corner_sharp, 'name': 'rounded_corner_sharp'},
    {'icon': Icons.router, 'name': 'router'},
    {'icon': Icons.router_outlined, 'name': 'router_outlined'},
    {'icon': Icons.router_rounded, 'name': 'router_rounded'},
    {'icon': Icons.router_sharp, 'name': 'router_sharp'},
    {'icon': Icons.rowing, 'name': 'rowing'},
    {'icon': Icons.rowing_outlined, 'name': 'rowing_outlined'},
    {'icon': Icons.rowing_rounded, 'name': 'rowing_rounded'},
    {'icon': Icons.rowing_sharp, 'name': 'rowing_sharp'},
    {'icon': Icons.rss_feed, 'name': 'rss_feed'},
    {'icon': Icons.rss_feed_outlined, 'name': 'rss_feed_outlined'},
    {'icon': Icons.rss_feed_rounded, 'name': 'rss_feed_rounded'},
    {'icon': Icons.rss_feed_sharp, 'name': 'rss_feed_sharp'},
    {'icon': Icons.rtt, 'name': 'rtt'},
    {'icon': Icons.rule, 'name': 'rule'},
    {'icon': Icons.rule_folder, 'name': 'rule_folder'},
    {'icon': Icons.rule_folder_outlined, 'name': 'rule_folder_outlined'},
    {'icon': Icons.rule_folder_rounded, 'name': 'rule_folder_rounded'},
    {'icon': Icons.rule_folder_sharp, 'name': 'rule_folder_sharp'},
    {'icon': Icons.rule_outlined, 'name': 'rule_outlined'},
    {'icon': Icons.rule_rounded, 'name': 'rule_rounded'},
    {'icon': Icons.rule_sharp, 'name': 'rule_sharp'},
    {'icon': Icons.run_circle, 'name': 'run_circle'},
    {'icon': Icons.run_circle_outlined, 'name': 'run_circle_outlined'},
    {'icon': Icons.run_circle_rounded, 'name': 'run_circle_rounded'},
    {'icon': Icons.run_circle_sharp, 'name': 'run_circle_sharp'},
    {'icon': Icons.rv_hookup, 'name': 'rv_hookup'},
    {'icon': Icons.rv_hookup_outlined, 'name': 'rv_hookup_outlined'},
    {'icon': Icons.rv_hookup_rounded, 'name': 'rv_hookup_rounded'},
    {'icon': Icons.rv_hookup_sharp, 'name': 'rv_hookup_sharp'},
    {'icon': Icons.sanitizer, 'name': 'sanitizer'},
    {'icon': Icons.sanitizer_outlined, 'name': 'sanitizer_outlined'},
    {'icon': Icons.sanitizer_rounded, 'name': 'sanitizer_rounded'},
    {'icon': Icons.sanitizer_sharp, 'name': 'sanitizer_sharp'},
    {'icon': Icons.satellite, 'name': 'satellite'},
    {'icon': Icons.satellite_outlined, 'name': 'satellite_outlined'},
    {'icon': Icons.satellite_rounded, 'name': 'satellite_rounded'},
    {'icon': Icons.satellite_sharp, 'name': 'satellite_sharp'},
    {'icon': Icons.save, 'name': 'save'},
    {'icon': Icons.save_alt, 'name': 'save_alt'},
    {'icon': Icons.save_alt_outlined, 'name': 'save_alt_outlined'},
    {'icon': Icons.save_alt_rounded, 'name': 'save_alt_rounded'},
    {'icon': Icons.save_alt_sharp, 'name': 'save_alt_sharp'},
    {'icon': Icons.save_outlined, 'name': 'save_outlined'},
    {'icon': Icons.save_rounded, 'name': 'save_rounded'},
    {'icon': Icons.save_sharp, 'name': 'save_sharp'},
    {'icon': Icons.saved_search, 'name': 'saved_search'},
    {'icon': Icons.scanner, 'name': 'scanner'},
    {'icon': Icons.scanner_outlined, 'name': 'scanner_outlined'},
    {'icon': Icons.scanner_rounded, 'name': 'scanner_rounded'},
    {'icon': Icons.scanner_sharp, 'name': 'scanner_sharp'},
    {'icon': Icons.scatter_plot, 'name': 'scatter_plot'},
    {'icon': Icons.scatter_plot_outlined, 'name': 'scatter_plot_outlined'},
    {'icon': Icons.scatter_plot_rounded, 'name': 'scatter_plot_rounded'},
    {'icon': Icons.scatter_plot_sharp, 'name': 'scatter_plot_sharp'},
    {'icon': Icons.schedule, 'name': 'schedule'},
    {'icon': Icons.schedule_outlined, 'name': 'schedule_outlined'},
    {'icon': Icons.schedule_rounded, 'name': 'schedule_rounded'},
    {'icon': Icons.schedule_send, 'name': 'schedule_send'},
    {'icon': Icons.schedule_sharp, 'name': 'schedule_sharp'},
    {'icon': Icons.school, 'name': 'school'},
    {'icon': Icons.school_outlined, 'name': 'school_outlined'},
    {'icon': Icons.school_rounded, 'name': 'school_rounded'},
    {'icon': Icons.school_sharp, 'name': 'school_sharp'},
    {'icon': Icons.science, 'name': 'science'},
    {'icon': Icons.science_outlined, 'name': 'science_outlined'},
    {'icon': Icons.science_rounded, 'name': 'science_rounded'},
    {'icon': Icons.science_sharp, 'name': 'science_sharp'},
    {'icon': Icons.score, 'name': 'score'},
    {'icon': Icons.score_outlined, 'name': 'score_outlined'},
    {'icon': Icons.score_rounded, 'name': 'score_rounded'},
    {'icon': Icons.score_sharp, 'name': 'score_sharp'},
    {'icon': Icons.screen_lock_landscape, 'name': 'screen_lock_landscape'},
    {
      'icon': Icons.screen_lock_landscape_outlined,
      'name': 'screen_lock_landscape_outlined'
    },
    {
      'icon': Icons.screen_lock_landscape_rounded,
      'name': 'screen_lock_landscape_rounded'
    },
    {
      'icon': Icons.screen_lock_landscape_sharp,
      'name': 'screen_lock_landscape_sharp'
    },
    {'icon': Icons.screen_lock_portrait, 'name': 'screen_lock_portrait'},
    {
      'icon': Icons.screen_lock_portrait_outlined,
      'name': 'screen_lock_portrait_outlined'
    },
    {
      'icon': Icons.screen_lock_portrait_rounded,
      'name': 'screen_lock_portrait_rounded'
    },
    {
      'icon': Icons.screen_lock_portrait_sharp,
      'name': 'screen_lock_portrait_sharp'
    },
    {'icon': Icons.screen_lock_rotation, 'name': 'screen_lock_rotation'},
    {
      'icon': Icons.screen_lock_rotation_outlined,
      'name': 'screen_lock_rotation_outlined'
    },
    {
      'icon': Icons.screen_lock_rotation_rounded,
      'name': 'screen_lock_rotation_rounded'
    },
    {
      'icon': Icons.screen_lock_rotation_sharp,
      'name': 'screen_lock_rotation_sharp'
    },
    {'icon': Icons.screen_rotation, 'name': 'screen_rotation'},
    {
      'icon': Icons.screen_rotation_outlined,
      'name': 'screen_rotation_outlined'
    },
    {'icon': Icons.screen_rotation_rounded, 'name': 'screen_rotation_rounded'},
    {'icon': Icons.screen_rotation_sharp, 'name': 'screen_rotation_sharp'},
    {'icon': Icons.screen_search_desktop, 'name': 'screen_search_desktop'},
    {'icon': Icons.screen_share, 'name': 'screen_share'},
    {'icon': Icons.screen_share_outlined, 'name': 'screen_share_outlined'},
    {'icon': Icons.screen_share_rounded, 'name': 'screen_share_rounded'},
    {'icon': Icons.screen_share_sharp, 'name': 'screen_share_sharp'},
    {'icon': Icons.sd, 'name': 'sd'},
    {'icon': Icons.sd_card, 'name': 'sd_card'},
    {'icon': Icons.sd_card_alert_outlined, 'name': 'sd_card_alert_outlined'},
    {'icon': Icons.sd_card_alert_rounded, 'name': 'sd_card_alert_rounded'},
    {'icon': Icons.sd_card_alert_sharp, 'name': 'sd_card_alert_sharp'},
    {'icon': Icons.sd_card_outlined, 'name': 'sd_card_outlined'},
    {'icon': Icons.sd_card_rounded, 'name': 'sd_card_rounded'},
    {'icon': Icons.sd_card_sharp, 'name': 'sd_card_sharp'},
    {'icon': Icons.sd_storage, 'name': 'sd_storage'},
    {'icon': Icons.sd_storage_outlined, 'name': 'sd_storage_outlined'},
    {'icon': Icons.sd_storage_rounded, 'name': 'sd_storage_rounded'},
    {'icon': Icons.sd_storage_sharp, 'name': 'sd_storage_sharp'},
    {'icon': Icons.search, 'name': 'search'},
    {'icon': Icons.search_off, 'name': 'search_off'},
    {'icon': Icons.search_off_outlined, 'name': 'search_off_outlined'},
    {'icon': Icons.search_off_rounded, 'name': 'search_off_rounded'},
    {'icon': Icons.search_off_sharp, 'name': 'search_off_sharp'},
    {'icon': Icons.search_outlined, 'name': 'search_outlined'},
    {'icon': Icons.search_rounded, 'name': 'search_rounded'},
    {'icon': Icons.search_sharp, 'name': 'search_sharp'},
    {'icon': Icons.security, 'name': 'security'},
    {'icon': Icons.security_outlined, 'name': 'security_outlined'},
    {'icon': Icons.security_rounded, 'name': 'security_rounded'},
    {'icon': Icons.security_sharp, 'name': 'security_sharp'},
    {'icon': Icons.segment, 'name': 'segment'},
    {'icon': Icons.select_all, 'name': 'select_all'},
    {'icon': Icons.select_all_outlined, 'name': 'select_all_outlined'},
    {'icon': Icons.select_all_rounded, 'name': 'select_all_rounded'},
    {'icon': Icons.select_all_sharp, 'name': 'select_all_sharp'},
    {'icon': Icons.self_improvement, 'name': 'self_improvement'},
    {
      'icon': Icons.self_improvement_outlined,
      'name': 'self_improvement_outlined'
    },
    {
      'icon': Icons.self_improvement_rounded,
      'name': 'self_improvement_rounded'
    },
    {'icon': Icons.self_improvement_sharp, 'name': 'self_improvement_sharp'},
    {'icon': Icons.send, 'name': 'send'},
    {'icon': Icons.send_and_archive, 'name': 'send_and_archive'},
    {'icon': Icons.send_outlined, 'name': 'send_outlined'},
    {'icon': Icons.send_rounded, 'name': 'send_rounded'},
    {'icon': Icons.send_sharp, 'name': 'send_sharp'},
    {'icon': Icons.send_to_mobile, 'name': 'send_to_mobile'},
    {'icon': Icons.sensor_door, 'name': 'sensor_door'},
    {'icon': Icons.sensor_door_outlined, 'name': 'sensor_door_outlined'},
    {'icon': Icons.sensor_door_rounded, 'name': 'sensor_door_rounded'},
    {'icon': Icons.sensor_door_sharp, 'name': 'sensor_door_sharp'},
    {'icon': Icons.sensor_window, 'name': 'sensor_window'},
    {'icon': Icons.sensor_window_outlined, 'name': 'sensor_window_outlined'},
    {'icon': Icons.sensor_window_rounded, 'name': 'sensor_window_rounded'},
    {'icon': Icons.sensor_window_sharp, 'name': 'sensor_window_sharp'},
    {'icon': Icons.sentiment_dissatisfied, 'name': 'sentiment_dissatisfied'},
    {
      'icon': Icons.sentiment_dissatisfied_outlined,
      'name': 'sentiment_dissatisfied_outlined'
    },
    {
      'icon': Icons.sentiment_dissatisfied_rounded,
      'name': 'sentiment_dissatisfied_rounded'
    },
    {
      'icon': Icons.sentiment_dissatisfied_sharp,
      'name': 'sentiment_dissatisfied_sharp'
    },
    {'icon': Icons.sentiment_neutral, 'name': 'sentiment_neutral'},
    {
      'icon': Icons.sentiment_neutral_outlined,
      'name': 'sentiment_neutral_outlined'
    },
    {
      'icon': Icons.sentiment_neutral_rounded,
      'name': 'sentiment_neutral_rounded'
    },
    {'icon': Icons.sentiment_satisfied, 'name': 'sentiment_satisfied'},
    {'icon': Icons.sentiment_satisfied_alt, 'name': 'sentiment_satisfied_alt'},
    {
      'icon': Icons.sentiment_satisfied_alt_outlined,
      'name': 'sentiment_satisfied_alt_outlined'
    },
    {
      'icon': Icons.sentiment_satisfied_alt_rounded,
      'name': 'sentiment_satisfied_alt_rounded'
    },
    {
      'icon': Icons.sentiment_satisfied_alt_sharp,
      'name': 'sentiment_satisfied_alt_sharp'
    },
    {
      'icon': Icons.sentiment_satisfied_outlined,
      'name': 'sentiment_satisfied_outlined'
    },
    {
      'icon': Icons.sentiment_satisfied_rounded,
      'name': 'sentiment_satisfied_rounded'
    },
    {
      'icon': Icons.sentiment_satisfied_sharp,
      'name': 'sentiment_satisfied_sharp'
    },
    {
      'icon': Icons.sentiment_very_dissatisfied,
      'name': 'sentiment_very_dissatisfied'
    },
    {
      'icon': Icons.sentiment_very_dissatisfied_outlined,
      'name': 'sentiment_very_dissatisfied_outlined'
    },
    {
      'icon': Icons.sentiment_very_dissatisfied_rounded,
      'name': 'sentiment_very_dissatisfied_rounded'
    },
    {
      'icon': Icons.sentiment_very_dissatisfied_sharp,
      'name': 'sentiment_very_dissatisfied_sharp'
    },
    {
      'icon': Icons.sentiment_very_satisfied,
      'name': 'sentiment_very_satisfied'
    },
    {
      'icon': Icons.sentiment_very_satisfied_outlined,
      'name': 'sentiment_very_satisfied_outlined'
    },
    {
      'icon': Icons.sentiment_very_satisfied_rounded,
      'name': 'sentiment_very_satisfied_rounded'
    },
    {
      'icon': Icons.sentiment_very_satisfied_sharp,
      'name': 'sentiment_very_satisfied_sharp'
    },
    {'icon': Icons.set_meal, 'name': 'set_meal'},
    {'icon': Icons.set_meal_outlined, 'name': 'set_meal_outlined'},
    {'icon': Icons.set_meal_rounded, 'name': 'set_meal_rounded'},
    {'icon': Icons.set_meal_sharp, 'name': 'set_meal_sharp'},
    {'icon': Icons.settings, 'name': 'settings'},
    {'icon': Icons.settings_applications, 'name': 'settings_applications'},
    {
      'icon': Icons.settings_applications_outlined,
      'name': 'settings_applications_outlined'
    },
    {
      'icon': Icons.settings_applications_rounded,
      'name': 'settings_applications_rounded'
    },
    {
      'icon': Icons.settings_applications_sharp,
      'name': 'settings_applications_sharp'
    },
    {'icon': Icons.settings_backup_restore, 'name': 'settings_backup_restore'},
    {
      'icon': Icons.settings_backup_restore_outlined,
      'name': 'settings_backup_restore_outlined'
    },
    {
      'icon': Icons.settings_backup_restore_rounded,
      'name': 'settings_backup_restore_rounded'
    },
    {
      'icon': Icons.settings_backup_restore_sharp,
      'name': 'settings_backup_restore_sharp'
    },
    {'icon': Icons.settings_bluetooth, 'name': 'settings_bluetooth'},
    {
      'icon': Icons.settings_bluetooth_outlined,
      'name': 'settings_bluetooth_outlined'
    },
    {
      'icon': Icons.settings_bluetooth_rounded,
      'name': 'settings_bluetooth_rounded'
    },
    {
      'icon': Icons.settings_bluetooth_sharp,
      'name': 'settings_bluetooth_sharp'
    },
    {'icon': Icons.settings_brightness, 'name': 'settings_brightness'},
    {
      'icon': Icons.settings_brightness_outlined,
      'name': 'settings_brightness_outlined'
    },
    {
      'icon': Icons.settings_brightness_rounded,
      'name': 'settings_brightness_rounded'
    },
    {
      'icon': Icons.settings_brightness_sharp,
      'name': 'settings_brightness_sharp'
    },
    {'icon': Icons.settings_cell, 'name': 'settings_cell'},
    {'icon': Icons.settings_cell_outlined, 'name': 'settings_cell_outlined'},
    {'icon': Icons.settings_cell_rounded, 'name': 'settings_cell_rounded'},
    {'icon': Icons.settings_cell_sharp, 'name': 'settings_cell_sharp'},
    {'icon': Icons.settings_display, 'name': 'settings_display'},
    {
      'icon': Icons.settings_display_outlined,
      'name': 'settings_display_outlined'
    },
    {
      'icon': Icons.settings_display_rounded,
      'name': 'settings_display_rounded'
    },
    {'icon': Icons.settings_display_sharp, 'name': 'settings_display_sharp'},
    {'icon': Icons.settings_ethernet, 'name': 'settings_ethernet'},
    {
      'icon': Icons.settings_ethernet_outlined,
      'name': 'settings_ethernet_outlined'
    },
    {
      'icon': Icons.settings_ethernet_rounded,
      'name': 'settings_ethernet_rounded'
    },
    {'icon': Icons.settings_ethernet_sharp, 'name': 'settings_ethernet_sharp'},
    {'icon': Icons.settings_input_antenna, 'name': 'settings_input_antenna'},
    {
      'icon': Icons.settings_input_antenna_outlined,
      'name': 'settings_input_antenna_outlined'
    },
    {
      'icon': Icons.settings_input_antenna_rounded,
      'name': 'settings_input_antenna_rounded'
    },
    {
      'icon': Icons.settings_input_antenna_sharp,
      'name': 'settings_input_antenna_sharp'
    },
    {
      'icon': Icons.settings_input_component,
      'name': 'settings_input_component'
    },
    {
      'icon': Icons.settings_input_component_outlined,
      'name': 'settings_input_component_outlined'
    },
    {
      'icon': Icons.settings_input_component_rounded,
      'name': 'settings_input_component_rounded'
    },
    {
      'icon': Icons.settings_input_component_sharp,
      'name': 'settings_input_component_sharp'
    },
    {
      'icon': Icons.settings_input_composite,
      'name': 'settings_input_composite'
    },
    {
      'icon': Icons.settings_input_composite_outlined,
      'name': 'settings_input_composite_outlined'
    },
    {
      'icon': Icons.settings_input_composite_rounded,
      'name': 'settings_input_composite_rounded'
    },
    {
      'icon': Icons.settings_input_composite_sharp,
      'name': 'settings_input_composite_sharp'
    },
    {'icon': Icons.settings_input_hdmi, 'name': 'settings_input_hdmi'},
    {
      'icon': Icons.settings_input_hdmi_outlined,
      'name': 'settings_input_hdmi_outlined'
    },
    {
      'icon': Icons.settings_input_hdmi_rounded,
      'name': 'settings_input_hdmi_rounded'
    },
    {
      'icon': Icons.settings_input_hdmi_sharp,
      'name': 'settings_input_hdmi_sharp'
    },
    {'icon': Icons.settings_input_svideo, 'name': 'settings_input_svideo'},
    {
      'icon': Icons.settings_input_svideo_outlined,
      'name': 'settings_input_svideo_outlined'
    },
    {
      'icon': Icons.settings_input_svideo_rounded,
      'name': 'settings_input_svideo_rounded'
    },
    {
      'icon': Icons.settings_input_svideo_sharp,
      'name': 'settings_input_svideo_sharp'
    },
    {'icon': Icons.settings_outlined, 'name': 'settings_outlined'},
    {'icon': Icons.settings_overscan, 'name': 'settings_overscan'},
    {
      'icon': Icons.settings_overscan_outlined,
      'name': 'settings_overscan_outlined'
    },
    {
      'icon': Icons.settings_overscan_rounded,
      'name': 'settings_overscan_rounded'
    },
    {'icon': Icons.settings_overscan_sharp, 'name': 'settings_overscan_sharp'},
    {'icon': Icons.settings_phone, 'name': 'settings_phone'},
    {'icon': Icons.settings_phone_outlined, 'name': 'settings_phone_outlined'},
    {'icon': Icons.settings_phone_rounded, 'name': 'settings_phone_rounded'},
    {'icon': Icons.settings_phone_sharp, 'name': 'settings_phone_sharp'},
    {'icon': Icons.settings_power, 'name': 'settings_power'},
    {'icon': Icons.settings_power_outlined, 'name': 'settings_power_outlined'},
    {'icon': Icons.settings_power_rounded, 'name': 'settings_power_rounded'},
    {'icon': Icons.settings_power_sharp, 'name': 'settings_power_sharp'},
    {'icon': Icons.settings_remote, 'name': 'settings_remote'},
    {
      'icon': Icons.settings_remote_outlined,
      'name': 'settings_remote_outlined'
    },
    {'icon': Icons.settings_remote_rounded, 'name': 'settings_remote_rounded'},
    {'icon': Icons.settings_remote_sharp, 'name': 'settings_remote_sharp'},
    {'icon': Icons.settings_rounded, 'name': 'settings_rounded'},
    {'icon': Icons.settings_sharp, 'name': 'settings_sharp'},
    {
      'icon': Icons.settings_system_daydream,
      'name': 'settings_system_daydream'
    },
    {
      'icon': Icons.settings_system_daydream_outlined,
      'name': 'settings_system_daydream_outlined'
    },
    {
      'icon': Icons.settings_system_daydream_rounded,
      'name': 'settings_system_daydream_rounded'
    },
    {
      'icon': Icons.settings_system_daydream_sharp,
      'name': 'settings_system_daydream_sharp'
    },
    {'icon': Icons.settings_voice, 'name': 'settings_voice'},
    {'icon': Icons.settings_voice_outlined, 'name': 'settings_voice_outlined'},
    {'icon': Icons.settings_voice_rounded, 'name': 'settings_voice_rounded'},
    {'icon': Icons.settings_voice_sharp, 'name': 'settings_voice_sharp'},
    {'icon': Icons.seven_k, 'name': 'seven_k'},
    {'icon': Icons.seven_k_plus, 'name': 'seven_k_plus'},
    {'icon': Icons.seven_mp, 'name': 'seven_mp'},
    {'icon': Icons.seventeen_mp, 'name': 'seventeen_mp'},
    {'icon': Icons.share, 'name': 'share'},
    {'icon': Icons.share_outlined, 'name': 'share_outlined'},
    {'icon': Icons.share_rounded, 'name': 'share_rounded'},
    {'icon': Icons.share_sharp, 'name': 'share_sharp'},
    {'icon': Icons.shield, 'name': 'shield'},
    {'icon': Icons.shop, 'name': 'shop'},
    {'icon': Icons.shop_outlined, 'name': 'shop_outlined'},
    {'icon': Icons.shop_rounded, 'name': 'shop_rounded'},
    {'icon': Icons.shop_sharp, 'name': 'shop_sharp'},
    {'icon': Icons.shop_two, 'name': 'shop_two'},
    {'icon': Icons.shop_two_outlined, 'name': 'shop_two_outlined'},
    {'icon': Icons.shop_two_rounded, 'name': 'shop_two_rounded'},
    {'icon': Icons.shop_two_sharp, 'name': 'shop_two_sharp'},
    {'icon': Icons.shopping_bag, 'name': 'shopping_bag'},
    {'icon': Icons.shopping_bag_outlined, 'name': 'shopping_bag_outlined'},
    {'icon': Icons.shopping_bag_rounded, 'name': 'shopping_bag_rounded'},
    {'icon': Icons.shopping_bag_sharp, 'name': 'shopping_bag_sharp'},
    {'icon': Icons.shopping_basket, 'name': 'shopping_basket'},
    {
      'icon': Icons.shopping_basket_outlined,
      'name': 'shopping_basket_outlined'
    },
    {'icon': Icons.shopping_basket_rounded, 'name': 'shopping_basket_rounded'},
    {'icon': Icons.shopping_basket_sharp, 'name': 'shopping_basket_sharp'},
    {'icon': Icons.shopping_cart, 'name': 'shopping_cart'},
    {'icon': Icons.shopping_cart_outlined, 'name': 'shopping_cart_outlined'},
    {'icon': Icons.shopping_cart_rounded, 'name': 'shopping_cart_rounded'},
    {'icon': Icons.shopping_cart_sharp, 'name': 'shopping_cart_sharp'},
    {'icon': Icons.short_text, 'name': 'short_text'},
    {'icon': Icons.short_text_outlined, 'name': 'short_text_outlined'},
    {'icon': Icons.short_text_rounded, 'name': 'short_text_rounded'},
    {'icon': Icons.short_text_sharp, 'name': 'short_text_sharp'},
    {'icon': Icons.show_chart, 'name': 'show_chart'},
    {'icon': Icons.show_chart_outlined, 'name': 'show_chart_outlined'},
    {'icon': Icons.show_chart_rounded, 'name': 'show_chart_rounded'},
    {'icon': Icons.show_chart_sharp, 'name': 'show_chart_sharp'},
    {'icon': Icons.shuffle, 'name': 'shuffle'},
    {'icon': Icons.shuffle_on, 'name': 'shuffle_on'},
    {'icon': Icons.shuffle_outlined, 'name': 'shuffle_outlined'},
    {'icon': Icons.shuffle_rounded, 'name': 'shuffle_rounded'},
    {'icon': Icons.shuffle_sharp, 'name': 'shuffle_sharp'},
    {'icon': Icons.shutter_speed, 'name': 'shutter_speed'},
    {'icon': Icons.shutter_speed_outlined, 'name': 'shutter_speed_outlined'},
    {'icon': Icons.shutter_speed_rounded, 'name': 'shutter_speed_rounded'},
    {'icon': Icons.shutter_speed_sharp, 'name': 'shutter_speed_sharp'},
    {'icon': Icons.sick, 'name': 'sick'},
    {'icon': Icons.sick_outlined, 'name': 'sick_outlined'},
    {'icon': Icons.sick_rounded, 'name': 'sick_rounded'},
    {'icon': Icons.sick_sharp, 'name': 'sick_sharp'},
    {'icon': Icons.signal_cellular_4_bar, 'name': 'signal_cellular_4_bar'},
    {
      'icon': Icons.signal_cellular_4_bar_outlined,
      'name': 'signal_cellular_4_bar_outlined'
    },
    {
      'icon': Icons.signal_cellular_4_bar_rounded,
      'name': 'signal_cellular_4_bar_rounded'
    },
    {
      'icon': Icons.signal_cellular_4_bar_sharp,
      'name': 'signal_cellular_4_bar_sharp'
    },
    {'icon': Icons.signal_cellular_alt, 'name': 'signal_cellular_alt'},
    {
      'icon': Icons.signal_cellular_alt_outlined,
      'name': 'signal_cellular_alt_outlined'
    },
    {
      'icon': Icons.signal_cellular_alt_rounded,
      'name': 'signal_cellular_alt_rounded'
    },
    {
      'icon': Icons.signal_cellular_alt_sharp,
      'name': 'signal_cellular_alt_sharp'
    },
    {
      'icon': Icons.signal_cellular_connected_no_internet_4_bar,
      'name': 'signal_cellular_connected_no_internet_4_bar'
    },
    {
      'icon': Icons.signal_cellular_connected_no_internet_4_bar_outlined,
      'name': 'signal_cellular_connected_no_internet_4_bar_outlined'
    },
    {
      'icon': Icons.signal_cellular_connected_no_internet_4_bar_rounded,
      'name': 'signal_cellular_connected_no_internet_4_bar_rounded'
    },
    {
      'icon': Icons.signal_cellular_connected_no_internet_4_bar_sharp,
      'name': 'signal_cellular_connected_no_internet_4_bar_sharp'
    },
    {'icon': Icons.signal_cellular_no_sim, 'name': 'signal_cellular_no_sim'},
    {
      'icon': Icons.signal_cellular_no_sim_outlined,
      'name': 'signal_cellular_no_sim_outlined'
    },
    {
      'icon': Icons.signal_cellular_no_sim_rounded,
      'name': 'signal_cellular_no_sim_rounded'
    },
    {
      'icon': Icons.signal_cellular_no_sim_sharp,
      'name': 'signal_cellular_no_sim_sharp'
    },
    {'icon': Icons.signal_cellular_null, 'name': 'signal_cellular_null'},
    {
      'icon': Icons.signal_cellular_null_outlined,
      'name': 'signal_cellular_null_outlined'
    },
    {
      'icon': Icons.signal_cellular_null_rounded,
      'name': 'signal_cellular_null_rounded'
    },
    {
      'icon': Icons.signal_cellular_null_sharp,
      'name': 'signal_cellular_null_sharp'
    },
    {'icon': Icons.signal_cellular_off, 'name': 'signal_cellular_off'},
    {
      'icon': Icons.signal_cellular_off_outlined,
      'name': 'signal_cellular_off_outlined'
    },
    {
      'icon': Icons.signal_cellular_off_rounded,
      'name': 'signal_cellular_off_rounded'
    },
    {
      'icon': Icons.signal_cellular_off_sharp,
      'name': 'signal_cellular_off_sharp'
    },
    {'icon': Icons.signal_wifi_4_bar, 'name': 'signal_wifi_4_bar'},
    {'icon': Icons.signal_wifi_4_bar_lock, 'name': 'signal_wifi_4_bar_lock'},
    {
      'icon': Icons.signal_wifi_4_bar_lock_outlined,
      'name': 'signal_wifi_4_bar_lock_outlined'
    },
    {
      'icon': Icons.signal_wifi_4_bar_lock_rounded,
      'name': 'signal_wifi_4_bar_lock_rounded'
    },
    {
      'icon': Icons.signal_wifi_4_bar_lock_sharp,
      'name': 'signal_wifi_4_bar_lock_sharp'
    },
    {
      'icon': Icons.signal_wifi_4_bar_outlined,
      'name': 'signal_wifi_4_bar_outlined'
    },
    {
      'icon': Icons.signal_wifi_4_bar_rounded,
      'name': 'signal_wifi_4_bar_rounded'
    },
    {'icon': Icons.signal_wifi_4_bar_sharp, 'name': 'signal_wifi_4_bar_sharp'},
    {'icon': Icons.signal_wifi_off, 'name': 'signal_wifi_off'},
    {
      'icon': Icons.signal_wifi_off_outlined,
      'name': 'signal_wifi_off_outlined'
    },
    {'icon': Icons.signal_wifi_off_rounded, 'name': 'signal_wifi_off_rounded'},
    {'icon': Icons.signal_wifi_off_sharp, 'name': 'signal_wifi_off_sharp'},
    {'icon': Icons.sim_card, 'name': 'sim_card'},
    {'icon': Icons.sim_card_alert, 'name': 'sim_card_alert'},
    {'icon': Icons.sim_card_outlined, 'name': 'sim_card_outlined'},
    {'icon': Icons.sim_card_rounded, 'name': 'sim_card_rounded'},
    {'icon': Icons.sim_card_sharp, 'name': 'sim_card_sharp'},
    {'icon': Icons.single_bed, 'name': 'single_bed'},
    {'icon': Icons.single_bed_outlined, 'name': 'single_bed_outlined'},
    {'icon': Icons.single_bed_rounded, 'name': 'single_bed_rounded'},
    {'icon': Icons.single_bed_sharp, 'name': 'single_bed_sharp'},
    {'icon': Icons.six_ft_apart, 'name': 'six_ft_apart'},
    {'icon': Icons.six_ft_apart_outlined, 'name': 'six_ft_apart_outlined'},
    {'icon': Icons.six_ft_apart_rounded, 'name': 'six_ft_apart_rounded'},
    {'icon': Icons.six_ft_apart_sharp, 'name': 'six_ft_apart_sharp'},
    {'icon': Icons.six_k, 'name': 'six_k'},
    {'icon': Icons.six_k_plus, 'name': 'six_k_plus'},
    {'icon': Icons.six_mp, 'name': 'six_mp'},
    {'icon': Icons.sixteen_mp, 'name': 'sixteen_mp'},
    {'icon': Icons.skip_next, 'name': 'skip_next'},
    {'icon': Icons.skip_next_outlined, 'name': 'skip_next_outlined'},
    {'icon': Icons.skip_next_rounded, 'name': 'skip_next_rounded'},
    {'icon': Icons.skip_next_sharp, 'name': 'skip_next_sharp'},
    {'icon': Icons.skip_previous, 'name': 'skip_previous'},
    {'icon': Icons.skip_previous_outlined, 'name': 'skip_previous_outlined'},
    {'icon': Icons.skip_previous_rounded, 'name': 'skip_previous_rounded'},
    {'icon': Icons.skip_previous_sharp, 'name': 'skip_previous_sharp'},
    {'icon': Icons.slideshow, 'name': 'slideshow'},
    {'icon': Icons.slideshow_outlined, 'name': 'slideshow_outlined'},
    {'icon': Icons.slideshow_rounded, 'name': 'slideshow_rounded'},
    {'icon': Icons.slideshow_sharp, 'name': 'slideshow_sharp'},
    {'icon': Icons.slow_motion_video, 'name': 'slow_motion_video'},
    {
      'icon': Icons.slow_motion_video_outlined,
      'name': 'slow_motion_video_outlined'
    },
    {
      'icon': Icons.slow_motion_video_rounded,
      'name': 'slow_motion_video_rounded'
    },
    {'icon': Icons.slow_motion_video_sharp, 'name': 'slow_motion_video_sharp'},
    {'icon': Icons.smart_button, 'name': 'smart_button'},
    {'icon': Icons.smart_button_outlined, 'name': 'smart_button_outlined'},
    {'icon': Icons.smart_button_rounded, 'name': 'smart_button_rounded'},
    {'icon': Icons.smart_button_sharp, 'name': 'smart_button_sharp'},
    {'icon': Icons.smartphone, 'name': 'smartphone'},
    {'icon': Icons.smartphone_outlined, 'name': 'smartphone_outlined'},
    {'icon': Icons.smartphone_rounded, 'name': 'smartphone_rounded'},
    {'icon': Icons.smartphone_sharp, 'name': 'smartphone_sharp'},
    {'icon': Icons.smoke_free, 'name': 'smoke_free'},
    {'icon': Icons.smoke_free_outlined, 'name': 'smoke_free_outlined'},
    {'icon': Icons.smoke_free_rounded, 'name': 'smoke_free_rounded'},
    {'icon': Icons.smoke_free_sharp, 'name': 'smoke_free_sharp'},
    {'icon': Icons.smoking_rooms, 'name': 'smoking_rooms'},
    {'icon': Icons.smoking_rooms_outlined, 'name': 'smoking_rooms_outlined'},
    {'icon': Icons.smoking_rooms_rounded, 'name': 'smoking_rooms_rounded'},
    {'icon': Icons.smoking_rooms_sharp, 'name': 'smoking_rooms_sharp'},
    {'icon': Icons.sms, 'name': 'sms'},
    {'icon': Icons.sms_failed, 'name': 'sms_failed'},
    {'icon': Icons.sms_failed_outlined, 'name': 'sms_failed_outlined'},
    {'icon': Icons.sms_failed_rounded, 'name': 'sms_failed_rounded'},
    {'icon': Icons.sms_failed_sharp, 'name': 'sms_failed_sharp'},
    {'icon': Icons.sms_outlined, 'name': 'sms_outlined'},
    {'icon': Icons.sms_rounded, 'name': 'sms_rounded'},
    {'icon': Icons.sms_sharp, 'name': 'sms_sharp'},
    {'icon': Icons.snippet_folder, 'name': 'snippet_folder'},
    {'icon': Icons.snippet_folder_outlined, 'name': 'snippet_folder_outlined'},
    {'icon': Icons.snippet_folder_rounded, 'name': 'snippet_folder_rounded'},
    {'icon': Icons.snippet_folder_sharp, 'name': 'snippet_folder_sharp'},
    {'icon': Icons.snooze, 'name': 'snooze'},
    {'icon': Icons.snooze_outlined, 'name': 'snooze_outlined'},
    {'icon': Icons.snooze_rounded, 'name': 'snooze_rounded'},
    {'icon': Icons.snooze_sharp, 'name': 'snooze_sharp'},
    {'icon': Icons.soap, 'name': 'soap'},
    {'icon': Icons.soap_outlined, 'name': 'soap_outlined'},
    {'icon': Icons.soap_rounded, 'name': 'soap_rounded'},
    {'icon': Icons.soap_sharp, 'name': 'soap_sharp'},
    {'icon': Icons.sort, 'name': 'sort'},
    {'icon': Icons.sort_by_alpha, 'name': 'sort_by_alpha'},
    {'icon': Icons.sort_by_alpha_outlined, 'name': 'sort_by_alpha_outlined'},
    {'icon': Icons.sort_by_alpha_rounded, 'name': 'sort_by_alpha_rounded'},
    {'icon': Icons.sort_by_alpha_sharp, 'name': 'sort_by_alpha_sharp'},
    {'icon': Icons.sort_outlined, 'name': 'sort_outlined'},
    {'icon': Icons.sort_rounded, 'name': 'sort_rounded'},
    {'icon': Icons.sort_sharp, 'name': 'sort_sharp'},
    {'icon': Icons.source, 'name': 'source'},
    {'icon': Icons.source_outlined, 'name': 'source_outlined'},
    {'icon': Icons.source_rounded, 'name': 'source_rounded'},
    {'icon': Icons.source_sharp, 'name': 'source_sharp'},
    {'icon': Icons.south, 'name': 'south'},
    {'icon': Icons.south_east, 'name': 'south_east'},
    {'icon': Icons.south_east_outlined, 'name': 'south_east_outlined'},
    {'icon': Icons.south_east_rounded, 'name': 'south_east_rounded'},
    {'icon': Icons.south_east_sharp, 'name': 'south_east_sharp'},
    {'icon': Icons.south_outlined, 'name': 'south_outlined'},
    {'icon': Icons.south_rounded, 'name': 'south_rounded'},
    {'icon': Icons.south_sharp, 'name': 'south_sharp'},
    {'icon': Icons.south_west, 'name': 'south_west'},
    {'icon': Icons.south_west_outlined, 'name': 'south_west_outlined'},
    {'icon': Icons.south_west_rounded, 'name': 'south_west_rounded'},
    {'icon': Icons.south_west_sharp, 'name': 'south_west_sharp'},
    {'icon': Icons.spa, 'name': 'spa'},
    {'icon': Icons.spa_outlined, 'name': 'spa_outlined'},
    {'icon': Icons.spa_rounded, 'name': 'spa_rounded'},
    {'icon': Icons.spa_sharp, 'name': 'spa_sharp'},
    {'icon': Icons.space_bar, 'name': 'space_bar'},
    {'icon': Icons.space_bar_outlined, 'name': 'space_bar_outlined'},
    {'icon': Icons.space_bar_rounded, 'name': 'space_bar_rounded'},
    {'icon': Icons.space_bar_sharp, 'name': 'space_bar_sharp'},
    {'icon': Icons.speaker, 'name': 'speaker'},
    {'icon': Icons.speaker_group, 'name': 'speaker_group'},
    {'icon': Icons.speaker_group_outlined, 'name': 'speaker_group_outlined'},
    {'icon': Icons.speaker_group_rounded, 'name': 'speaker_group_rounded'},
    {'icon': Icons.speaker_group_sharp, 'name': 'speaker_group_sharp'},
    {'icon': Icons.speaker_notes, 'name': 'speaker_notes'},
    {'icon': Icons.speaker_notes_off, 'name': 'speaker_notes_off'},
    {
      'icon': Icons.speaker_notes_off_outlined,
      'name': 'speaker_notes_off_outlined'
    },
    {
      'icon': Icons.speaker_notes_off_rounded,
      'name': 'speaker_notes_off_rounded'
    },
    {'icon': Icons.speaker_notes_off_sharp, 'name': 'speaker_notes_off_sharp'},
    {'icon': Icons.speaker_notes_outlined, 'name': 'speaker_notes_outlined'},
    {'icon': Icons.speaker_notes_rounded, 'name': 'speaker_notes_rounded'},
    {'icon': Icons.speaker_notes_sharp, 'name': 'speaker_notes_sharp'},
    {'icon': Icons.speaker_outlined, 'name': 'speaker_outlined'},
    {'icon': Icons.speaker_phone, 'name': 'speaker_phone'},
    {'icon': Icons.speaker_phone_outlined, 'name': 'speaker_phone_outlined'},
    {'icon': Icons.speaker_phone_rounded, 'name': 'speaker_phone_rounded'},
    {'icon': Icons.speaker_phone_sharp, 'name': 'speaker_phone_sharp'},
    {'icon': Icons.speaker_rounded, 'name': 'speaker_rounded'},
    {'icon': Icons.speaker_sharp, 'name': 'speaker_sharp'},
    {'icon': Icons.speed, 'name': 'speed'},
    {'icon': Icons.speed_outlined, 'name': 'speed_outlined'},
    {'icon': Icons.speed_rounded, 'name': 'speed_rounded'},
    {'icon': Icons.speed_sharp, 'name': 'speed_sharp'},
    {'icon': Icons.spellcheck, 'name': 'spellcheck'},
    {'icon': Icons.spellcheck_outlined, 'name': 'spellcheck_outlined'},
    {'icon': Icons.spellcheck_rounded, 'name': 'spellcheck_rounded'},
    {'icon': Icons.spellcheck_sharp, 'name': 'spellcheck_sharp'},
    {'icon': Icons.sports, 'name': 'sports'},
    {'icon': Icons.sports_bar, 'name': 'sports_bar'},
    {'icon': Icons.sports_bar_outlined, 'name': 'sports_bar_outlined'},
    {'icon': Icons.sports_bar_rounded, 'name': 'sports_bar_rounded'},
    {'icon': Icons.sports_bar_sharp, 'name': 'sports_bar_sharp'},
    {'icon': Icons.sports_baseball, 'name': 'sports_baseball'},
    {
      'icon': Icons.sports_baseball_outlined,
      'name': 'sports_baseball_outlined'
    },
    {'icon': Icons.sports_baseball_rounded, 'name': 'sports_baseball_rounded'},
    {'icon': Icons.sports_baseball_sharp, 'name': 'sports_baseball_sharp'},
    {'icon': Icons.sports_basketball, 'name': 'sports_basketball'},
    {
      'icon': Icons.sports_basketball_outlined,
      'name': 'sports_basketball_outlined'
    },
    {
      'icon': Icons.sports_basketball_rounded,
      'name': 'sports_basketball_rounded'
    },
    {'icon': Icons.sports_basketball_sharp, 'name': 'sports_basketball_sharp'},
    {'icon': Icons.sports_cricket, 'name': 'sports_cricket'},
    {'icon': Icons.sports_cricket_outlined, 'name': 'sports_cricket_outlined'},
    {'icon': Icons.sports_cricket_rounded, 'name': 'sports_cricket_rounded'},
    {'icon': Icons.sports_cricket_sharp, 'name': 'sports_cricket_sharp'},
    {'icon': Icons.sports_esports, 'name': 'sports_esports'},
    {'icon': Icons.sports_esports_outlined, 'name': 'sports_esports_outlined'},
    {'icon': Icons.sports_esports_rounded, 'name': 'sports_esports_rounded'},
    {'icon': Icons.sports_esports_sharp, 'name': 'sports_esports_sharp'},
    {'icon': Icons.sports_football, 'name': 'sports_football'},
    {
      'icon': Icons.sports_football_outlined,
      'name': 'sports_football_outlined'
    },
    {'icon': Icons.sports_football_rounded, 'name': 'sports_football_rounded'},
    {'icon': Icons.sports_football_sharp, 'name': 'sports_football_sharp'},
    {'icon': Icons.sports_golf, 'name': 'sports_golf'},
    {'icon': Icons.sports_golf_outlined, 'name': 'sports_golf_outlined'},
    {'icon': Icons.sports_golf_rounded, 'name': 'sports_golf_rounded'},
    {'icon': Icons.sports_golf_sharp, 'name': 'sports_golf_sharp'},
    {'icon': Icons.sports_handball, 'name': 'sports_handball'},
    {
      'icon': Icons.sports_handball_outlined,
      'name': 'sports_handball_outlined'
    },
    {'icon': Icons.sports_handball_rounded, 'name': 'sports_handball_rounded'},
    {'icon': Icons.sports_handball_sharp, 'name': 'sports_handball_sharp'},
    {'icon': Icons.sports_hockey, 'name': 'sports_hockey'},
    {'icon': Icons.sports_hockey_outlined, 'name': 'sports_hockey_outlined'},
    {'icon': Icons.sports_hockey_rounded, 'name': 'sports_hockey_rounded'},
    {'icon': Icons.sports_hockey_sharp, 'name': 'sports_hockey_sharp'},
    {'icon': Icons.sports_kabaddi, 'name': 'sports_kabaddi'},
    {'icon': Icons.sports_kabaddi_outlined, 'name': 'sports_kabaddi_outlined'},
    {'icon': Icons.sports_kabaddi_rounded, 'name': 'sports_kabaddi_rounded'},
    {'icon': Icons.sports_kabaddi_sharp, 'name': 'sports_kabaddi_sharp'},
    {'icon': Icons.sports_mma, 'name': 'sports_mma'},
    {'icon': Icons.sports_mma_outlined, 'name': 'sports_mma_outlined'},
    {'icon': Icons.sports_mma_rounded, 'name': 'sports_mma_rounded'},
    {'icon': Icons.sports_mma_sharp, 'name': 'sports_mma_sharp'},
    {'icon': Icons.sports_motorsports, 'name': 'sports_motorsports'},
    {
      'icon': Icons.sports_motorsports_outlined,
      'name': 'sports_motorsports_outlined'
    },
    {
      'icon': Icons.sports_motorsports_rounded,
      'name': 'sports_motorsports_rounded'
    },
    {
      'icon': Icons.sports_motorsports_sharp,
      'name': 'sports_motorsports_sharp'
    },
    {'icon': Icons.sports_outlined, 'name': 'sports_outlined'},
    {'icon': Icons.sports_rounded, 'name': 'sports_rounded'},
    {'icon': Icons.sports_rugby, 'name': 'sports_rugby'},
    {'icon': Icons.sports_rugby_outlined, 'name': 'sports_rugby_outlined'},
    {'icon': Icons.sports_rugby_rounded, 'name': 'sports_rugby_rounded'},
    {'icon': Icons.sports_rugby_sharp, 'name': 'sports_rugby_sharp'},
    {'icon': Icons.sports_sharp, 'name': 'sports_sharp'},
    {'icon': Icons.sports_soccer, 'name': 'sports_soccer'},
    {'icon': Icons.sports_soccer_outlined, 'name': 'sports_soccer_outlined'},
    {'icon': Icons.sports_soccer_rounded, 'name': 'sports_soccer_rounded'},
    {'icon': Icons.sports_soccer_sharp, 'name': 'sports_soccer_sharp'},
    {'icon': Icons.sports_tennis, 'name': 'sports_tennis'},
    {'icon': Icons.sports_tennis_outlined, 'name': 'sports_tennis_outlined'},
    {'icon': Icons.sports_tennis_rounded, 'name': 'sports_tennis_rounded'},
    {'icon': Icons.sports_tennis_sharp, 'name': 'sports_tennis_sharp'},
    {'icon': Icons.sports_volleyball, 'name': 'sports_volleyball'},
    {
      'icon': Icons.sports_volleyball_outlined,
      'name': 'sports_volleyball_outlined'
    },
    {
      'icon': Icons.sports_volleyball_rounded,
      'name': 'sports_volleyball_rounded'
    },
    {'icon': Icons.sports_volleyball_sharp, 'name': 'sports_volleyball_sharp'},
    {'icon': Icons.square_foot, 'name': 'square_foot'},
    {'icon': Icons.square_foot_outlined, 'name': 'square_foot_outlined'},
    {'icon': Icons.square_foot_rounded, 'name': 'square_foot_rounded'},
    {'icon': Icons.square_foot_sharp, 'name': 'square_foot_sharp'},
    {'icon': Icons.stacked_bar_chart, 'name': 'stacked_bar_chart'},
    {'icon': Icons.stacked_line_chart, 'name': 'stacked_line_chart'},
    {
      'icon': Icons.stacked_line_chart_outlined,
      'name': 'stacked_line_chart_outlined'
    },
    {
      'icon': Icons.stacked_line_chart_rounded,
      'name': 'stacked_line_chart_rounded'
    },
    {
      'icon': Icons.stacked_line_chart_sharp,
      'name': 'stacked_line_chart_sharp'
    },
    {'icon': Icons.stairs, 'name': 'stairs'},
    {'icon': Icons.stairs_outlined, 'name': 'stairs_outlined'},
    {'icon': Icons.stairs_rounded, 'name': 'stairs_rounded'},
    {'icon': Icons.stairs_sharp, 'name': 'stairs_sharp'},
    {'icon': Icons.star, 'name': 'star'},
    {'icon': Icons.star_border, 'name': 'star_border'},
    {'icon': Icons.star_border_outlined, 'name': 'star_border_outlined'},
    {
      'icon': Icons.star_border_purple500_outlined,
      'name': 'star_border_purple500_outlined'
    },
    {
      'icon': Icons.star_border_purple500_sharp,
      'name': 'star_border_purple500_sharp'
    },
    {'icon': Icons.star_border_rounded, 'name': 'star_border_rounded'},
    {'icon': Icons.star_border_sharp, 'name': 'star_border_sharp'},
    {'icon': Icons.star_half, 'name': 'star_half'},
    {'icon': Icons.star_half_outlined, 'name': 'star_half_outlined'},
    {'icon': Icons.star_half_rounded, 'name': 'star_half_rounded'},
    {'icon': Icons.star_half_sharp, 'name': 'star_half_sharp'},
    {'icon': Icons.star_outline, 'name': 'star_outline'},
    {'icon': Icons.star_outline_outlined, 'name': 'star_outline_outlined'},
    {'icon': Icons.star_outline_rounded, 'name': 'star_outline_rounded'},
    {'icon': Icons.star_outline_sharp, 'name': 'star_outline_sharp'},
    {'icon': Icons.star_outlined, 'name': 'star_outlined'},
    {'icon': Icons.star_purple500_outlined, 'name': 'star_purple500_outlined'},
    {'icon': Icons.star_purple500_sharp, 'name': 'star_purple500_sharp'},
    {'icon': Icons.star_rate, 'name': 'star_rate'},
    {'icon': Icons.star_rate_outlined, 'name': 'star_rate_outlined'},
    {'icon': Icons.star_rate_rounded, 'name': 'star_rate_rounded'},
    {'icon': Icons.star_rate_sharp, 'name': 'star_rate_sharp'},
    {'icon': Icons.star_rounded, 'name': 'star_rounded'},
    {'icon': Icons.star_sharp, 'name': 'star_sharp'},
    {'icon': Icons.stars, 'name': 'stars'},
    {'icon': Icons.stars_outlined, 'name': 'stars_outlined'},
    {'icon': Icons.stars_rounded, 'name': 'stars_rounded'},
    {'icon': Icons.stars_sharp, 'name': 'stars_sharp'},
    {'icon': Icons.stay_current_landscape, 'name': 'stay_current_landscape'},
    {
      'icon': Icons.stay_current_landscape_outlined,
      'name': 'stay_current_landscape_outlined'
    },
    {
      'icon': Icons.stay_current_landscape_rounded,
      'name': 'stay_current_landscape_rounded'
    },
    {
      'icon': Icons.stay_current_landscape_sharp,
      'name': 'stay_current_landscape_sharp'
    },
    {'icon': Icons.stay_current_portrait, 'name': 'stay_current_portrait'},
    {
      'icon': Icons.stay_current_portrait_outlined,
      'name': 'stay_current_portrait_outlined'
    },
    {
      'icon': Icons.stay_current_portrait_rounded,
      'name': 'stay_current_portrait_rounded'
    },
    {
      'icon': Icons.stay_current_portrait_sharp,
      'name': 'stay_current_portrait_sharp'
    },
    {'icon': Icons.stay_primary_landscape, 'name': 'stay_primary_landscape'},
    {
      'icon': Icons.stay_primary_landscape_outlined,
      'name': 'stay_primary_landscape_outlined'
    },
    {
      'icon': Icons.stay_primary_landscape_rounded,
      'name': 'stay_primary_landscape_rounded'
    },
    {
      'icon': Icons.stay_primary_landscape_sharp,
      'name': 'stay_primary_landscape_sharp'
    },
    {'icon': Icons.stay_primary_portrait, 'name': 'stay_primary_portrait'},
    {
      'icon': Icons.stay_primary_portrait_outlined,
      'name': 'stay_primary_portrait_outlined'
    },
    {
      'icon': Icons.stay_primary_portrait_rounded,
      'name': 'stay_primary_portrait_rounded'
    },
    {
      'icon': Icons.stay_primary_portrait_sharp,
      'name': 'stay_primary_portrait_sharp'
    },
    {'icon': Icons.sticky_note_2, 'name': 'sticky_note_2'},
    {'icon': Icons.sticky_note_2_outlined, 'name': 'sticky_note_2_outlined'},
    {'icon': Icons.sticky_note_2_rounded, 'name': 'sticky_note_2_rounded'},
    {'icon': Icons.sticky_note_2_sharp, 'name': 'sticky_note_2_sharp'},
    {'icon': Icons.stop, 'name': 'stop'},
    {'icon': Icons.stop_circle, 'name': 'stop_circle'},
    {'icon': Icons.stop_circle_outlined, 'name': 'stop_circle_outlined'},
    {'icon': Icons.stop_circle_rounded, 'name': 'stop_circle_rounded'},
    {'icon': Icons.stop_circle_sharp, 'name': 'stop_circle_sharp'},
    {'icon': Icons.stop_outlined, 'name': 'stop_outlined'},
    {'icon': Icons.stop_rounded, 'name': 'stop_rounded'},
    {'icon': Icons.stop_screen_share, 'name': 'stop_screen_share'},
    {
      'icon': Icons.stop_screen_share_outlined,
      'name': 'stop_screen_share_outlined'
    },
    {
      'icon': Icons.stop_screen_share_rounded,
      'name': 'stop_screen_share_rounded'
    },
    {'icon': Icons.stop_screen_share_sharp, 'name': 'stop_screen_share_sharp'},
    {'icon': Icons.stop_sharp, 'name': 'stop_sharp'},
    {'icon': Icons.storage, 'name': 'storage'},
    {'icon': Icons.storage_outlined, 'name': 'storage_outlined'},
    {'icon': Icons.storage_rounded, 'name': 'storage_rounded'},
    {'icon': Icons.storage_sharp, 'name': 'storage_sharp'},
    {'icon': Icons.store, 'name': 'store'},
    {'icon': Icons.store_mall_directory, 'name': 'store_mall_directory'},
    {
      'icon': Icons.store_mall_directory_outlined,
      'name': 'store_mall_directory_outlined'
    },
    {
      'icon': Icons.store_mall_directory_rounded,
      'name': 'store_mall_directory_rounded'
    },
    {
      'icon': Icons.store_mall_directory_sharp,
      'name': 'store_mall_directory_sharp'
    },
    {'icon': Icons.store_outlined, 'name': 'store_outlined'},
    {'icon': Icons.store_rounded, 'name': 'store_rounded'},
    {'icon': Icons.store_sharp, 'name': 'store_sharp'},
    {'icon': Icons.storefront, 'name': 'storefront'},
    {'icon': Icons.storefront_outlined, 'name': 'storefront_outlined'},
    {'icon': Icons.storefront_rounded, 'name': 'storefront_rounded'},
    {'icon': Icons.storefront_sharp, 'name': 'storefront_sharp'},
    {'icon': Icons.straighten, 'name': 'straighten'},
    {'icon': Icons.straighten_outlined, 'name': 'straighten_outlined'},
    {'icon': Icons.straighten_rounded, 'name': 'straighten_rounded'},
    {'icon': Icons.straighten_sharp, 'name': 'straighten_sharp'},
    {'icon': Icons.stream, 'name': 'stream'},
    {'icon': Icons.streetview, 'name': 'streetview'},
    {'icon': Icons.streetview_outlined, 'name': 'streetview_outlined'},
    {'icon': Icons.streetview_rounded, 'name': 'streetview_rounded'},
    {'icon': Icons.streetview_sharp, 'name': 'streetview_sharp'},
    {'icon': Icons.strikethrough_s, 'name': 'strikethrough_s'},
    {
      'icon': Icons.strikethrough_s_outlined,
      'name': 'strikethrough_s_outlined'
    },
    {'icon': Icons.strikethrough_s_rounded, 'name': 'strikethrough_s_rounded'},
    {'icon': Icons.strikethrough_s_sharp, 'name': 'strikethrough_s_sharp'},
    {'icon': Icons.stroller, 'name': 'stroller'},
    {'icon': Icons.stroller_outlined, 'name': 'stroller_outlined'},
    {'icon': Icons.stroller_rounded, 'name': 'stroller_rounded'},
    {'icon': Icons.stroller_sharp, 'name': 'stroller_sharp'},
    {'icon': Icons.style, 'name': 'style'},
    {'icon': Icons.style_outlined, 'name': 'style_outlined'},
    {'icon': Icons.style_rounded, 'name': 'style_rounded'},
    {'icon': Icons.style_sharp, 'name': 'style_sharp'},
    {'icon': Icons.subdirectory_arrow_left, 'name': 'subdirectory_arrow_left'},
    {
      'icon': Icons.subdirectory_arrow_left_outlined,
      'name': 'subdirectory_arrow_left_outlined'
    },
    {
      'icon': Icons.subdirectory_arrow_left_rounded,
      'name': 'subdirectory_arrow_left_rounded'
    },
    {
      'icon': Icons.subdirectory_arrow_left_sharp,
      'name': 'subdirectory_arrow_left_sharp'
    },
    {
      'icon': Icons.subdirectory_arrow_right,
      'name': 'subdirectory_arrow_right'
    },
    {
      'icon': Icons.subdirectory_arrow_right_outlined,
      'name': 'subdirectory_arrow_right_outlined'
    },
    {
      'icon': Icons.subdirectory_arrow_right_rounded,
      'name': 'subdirectory_arrow_right_rounded'
    },
    {
      'icon': Icons.subdirectory_arrow_right_sharp,
      'name': 'subdirectory_arrow_right_sharp'
    },
    {'icon': Icons.subject, 'name': 'subject'},
    {'icon': Icons.subject_outlined, 'name': 'subject_outlined'},
    {'icon': Icons.subject_rounded, 'name': 'subject_rounded'},
    {'icon': Icons.subject_sharp, 'name': 'subject_sharp'},
    {'icon': Icons.subscript, 'name': 'subscript'},
    {'icon': Icons.subscript_outlined, 'name': 'subscript_outlined'},
    {'icon': Icons.subscript_rounded, 'name': 'subscript_rounded'},
    {'icon': Icons.subscript_sharp, 'name': 'subscript_sharp'},
    {'icon': Icons.subscriptions, 'name': 'subscriptions'},
    {'icon': Icons.subscriptions_outlined, 'name': 'subscriptions_outlined'},
    {'icon': Icons.subscriptions_rounded, 'name': 'subscriptions_rounded'},
    {'icon': Icons.subscriptions_sharp, 'name': 'subscriptions_sharp'},
    {'icon': Icons.subtitles, 'name': 'subtitles'},
    {'icon': Icons.subtitles_off, 'name': 'subtitles_off'},
    {'icon': Icons.subtitles_off_outlined, 'name': 'subtitles_off_outlined'},
    {'icon': Icons.subtitles_off_rounded, 'name': 'subtitles_off_rounded'},
    {'icon': Icons.subtitles_off_sharp, 'name': 'subtitles_off_sharp'},
    {'icon': Icons.subtitles_outlined, 'name': 'subtitles_outlined'},
    {'icon': Icons.subtitles_rounded, 'name': 'subtitles_rounded'},
    {'icon': Icons.subtitles_sharp, 'name': 'subtitles_sharp'},
    {'icon': Icons.subway, 'name': 'subway'},
    {'icon': Icons.subway_outlined, 'name': 'subway_outlined'},
    {'icon': Icons.subway_rounded, 'name': 'subway_rounded'},
    {'icon': Icons.subway_sharp, 'name': 'subway_sharp'},
    {'icon': Icons.superscript, 'name': 'superscript'},
    {'icon': Icons.superscript_outlined, 'name': 'superscript_outlined'},
    {'icon': Icons.superscript_rounded, 'name': 'superscript_rounded'},
    {'icon': Icons.superscript_sharp, 'name': 'superscript_sharp'},
    {'icon': Icons.supervised_user_circle, 'name': 'supervised_user_circle'},
    {
      'icon': Icons.supervised_user_circle_outlined,
      'name': 'supervised_user_circle_outlined'
    },
    {
      'icon': Icons.supervised_user_circle_rounded,
      'name': 'supervised_user_circle_rounded'
    },
    {
      'icon': Icons.supervised_user_circle_sharp,
      'name': 'supervised_user_circle_sharp'
    },
    {'icon': Icons.supervisor_account, 'name': 'supervisor_account'},
    {
      'icon': Icons.supervisor_account_outlined,
      'name': 'supervisor_account_outlined'
    },
    {
      'icon': Icons.supervisor_account_rounded,
      'name': 'supervisor_account_rounded'
    },
    {
      'icon': Icons.supervisor_account_sharp,
      'name': 'supervisor_account_sharp'
    },
    {'icon': Icons.support, 'name': 'support'},
    {'icon': Icons.support_agent, 'name': 'support_agent'},
    {'icon': Icons.support_agent_outlined, 'name': 'support_agent_outlined'},
    {'icon': Icons.support_agent_rounded, 'name': 'support_agent_rounded'},
    {'icon': Icons.support_agent_sharp, 'name': 'support_agent_sharp'},
    {'icon': Icons.support_outlined, 'name': 'support_outlined'},
    {'icon': Icons.support_rounded, 'name': 'support_rounded'},
    {'icon': Icons.support_sharp, 'name': 'support_sharp'},
    {'icon': Icons.surround_sound, 'name': 'surround_sound'},
    {'icon': Icons.surround_sound_outlined, 'name': 'surround_sound_outlined'},
    {'icon': Icons.surround_sound_rounded, 'name': 'surround_sound_rounded'},
    {'icon': Icons.surround_sound_sharp, 'name': 'surround_sound_sharp'},
    {'icon': Icons.swap_calls, 'name': 'swap_calls'},
    {'icon': Icons.swap_calls_outlined, 'name': 'swap_calls_outlined'},
    {'icon': Icons.swap_calls_rounded, 'name': 'swap_calls_rounded'},
    {'icon': Icons.swap_calls_sharp, 'name': 'swap_calls_sharp'},
    {'icon': Icons.swap_horiz, 'name': 'swap_horiz'},
    {'icon': Icons.swap_horiz_outlined, 'name': 'swap_horiz_outlined'},
    {'icon': Icons.swap_horiz_rounded, 'name': 'swap_horiz_rounded'},
    {'icon': Icons.swap_horiz_sharp, 'name': 'swap_horiz_sharp'},
    {'icon': Icons.swap_horizontal_circle, 'name': 'swap_horizontal_circle'},
    {
      'icon': Icons.swap_horizontal_circle_outlined,
      'name': 'swap_horizontal_circle_outlined'
    },
    {
      'icon': Icons.swap_horizontal_circle_rounded,
      'name': 'swap_horizontal_circle_rounded'
    },
    {
      'icon': Icons.swap_horizontal_circle_sharp,
      'name': 'swap_horizontal_circle_sharp'
    },
    {'icon': Icons.swap_vert, 'name': 'swap_vert'},
    {'icon': Icons.swap_vert_circle, 'name': 'swap_vert_circle'},
    {
      'icon': Icons.swap_vert_circle_outlined,
      'name': 'swap_vert_circle_outlined'
    },
    {
      'icon': Icons.swap_vert_circle_rounded,
      'name': 'swap_vert_circle_rounded'
    },
    {'icon': Icons.swap_vert_circle_sharp, 'name': 'swap_vert_circle_sharp'},
    {'icon': Icons.swap_vert_outlined, 'name': 'swap_vert_outlined'},
    {'icon': Icons.swap_vert_rounded, 'name': 'swap_vert_rounded'},
    {'icon': Icons.swap_vert_sharp, 'name': 'swap_vert_sharp'},
    {'icon': Icons.swap_vertical_circle, 'name': 'swap_vertical_circle'},
    {
      'icon': Icons.swap_vertical_circle_outlined,
      'name': 'swap_vertical_circle_outlined'
    },
    {
      'icon': Icons.swap_vertical_circle_rounded,
      'name': 'swap_vertical_circle_rounded'
    },
    {
      'icon': Icons.swap_vertical_circle_sharp,
      'name': 'swap_vertical_circle_sharp'
    },
    {'icon': Icons.swipe, 'name': 'swipe'},
    {'icon': Icons.switch_account, 'name': 'switch_account'},
    {'icon': Icons.switch_camera, 'name': 'switch_camera'},
    {'icon': Icons.switch_camera_outlined, 'name': 'switch_camera_outlined'},
    {'icon': Icons.switch_camera_rounded, 'name': 'switch_camera_rounded'},
    {'icon': Icons.switch_camera_sharp, 'name': 'switch_camera_sharp'},
    {'icon': Icons.switch_left, 'name': 'switch_left'},
    {'icon': Icons.switch_left_outlined, 'name': 'switch_left_outlined'},
    {'icon': Icons.switch_left_rounded, 'name': 'switch_left_rounded'},
    {'icon': Icons.switch_left_sharp, 'name': 'switch_left_sharp'},
    {'icon': Icons.switch_right, 'name': 'switch_right'},
    {'icon': Icons.switch_right_outlined, 'name': 'switch_right_outlined'},
    {'icon': Icons.switch_right_rounded, 'name': 'switch_right_rounded'},
    {'icon': Icons.switch_right_sharp, 'name': 'switch_right_sharp'},
    {'icon': Icons.switch_video, 'name': 'switch_video'},
    {'icon': Icons.switch_video_outlined, 'name': 'switch_video_outlined'},
    {'icon': Icons.switch_video_rounded, 'name': 'switch_video_rounded'},
    {'icon': Icons.switch_video_sharp, 'name': 'switch_video_sharp'},
    {'icon': Icons.sync, 'name': 'sync'},
    {'icon': Icons.sync_alt, 'name': 'sync_alt'},
    {'icon': Icons.sync_alt_outlined, 'name': 'sync_alt_outlined'},
    {'icon': Icons.sync_alt_rounded, 'name': 'sync_alt_rounded'},
    {'icon': Icons.sync_alt_sharp, 'name': 'sync_alt_sharp'},
    {'icon': Icons.sync_disabled, 'name': 'sync_disabled'},
    {'icon': Icons.sync_disabled_outlined, 'name': 'sync_disabled_outlined'},
    {'icon': Icons.sync_disabled_rounded, 'name': 'sync_disabled_rounded'},
    {'icon': Icons.sync_disabled_sharp, 'name': 'sync_disabled_sharp'},
    {'icon': Icons.sync_outlined, 'name': 'sync_outlined'},
    {'icon': Icons.sync_problem, 'name': 'sync_problem'},
    {'icon': Icons.sync_problem_outlined, 'name': 'sync_problem_outlined'},
    {'icon': Icons.sync_problem_rounded, 'name': 'sync_problem_rounded'},
    {'icon': Icons.sync_problem_sharp, 'name': 'sync_problem_sharp'},
    {'icon': Icons.sync_rounded, 'name': 'sync_rounded'},
    {'icon': Icons.sync_sharp, 'name': 'sync_sharp'},
    {'icon': Icons.system_update, 'name': 'system_update'},
    {'icon': Icons.system_update_alt, 'name': 'system_update_alt'},
    {
      'icon': Icons.system_update_alt_outlined,
      'name': 'system_update_alt_outlined'
    },
    {
      'icon': Icons.system_update_alt_rounded,
      'name': 'system_update_alt_rounded'
    },
    {'icon': Icons.system_update_alt_sharp, 'name': 'system_update_alt_sharp'},
    {'icon': Icons.system_update_outlined, 'name': 'system_update_outlined'},
    {'icon': Icons.system_update_rounded, 'name': 'system_update_rounded'},
    {'icon': Icons.system_update_sharp, 'name': 'system_update_sharp'},
    {'icon': Icons.system_update_tv, 'name': 'system_update_tv'},
    {
      'icon': Icons.system_update_tv_outlined,
      'name': 'system_update_tv_outlined'
    },
    {
      'icon': Icons.system_update_tv_rounded,
      'name': 'system_update_tv_rounded'
    },
    {'icon': Icons.system_update_tv_sharp, 'name': 'system_update_tv_sharp'},
    {'icon': Icons.tab, 'name': 'tab'},
    {'icon': Icons.tab_outlined, 'name': 'tab_outlined'},
    {'icon': Icons.tab_rounded, 'name': 'tab_rounded'},
    {'icon': Icons.tab_sharp, 'name': 'tab_sharp'},
    {'icon': Icons.tab_unselected, 'name': 'tab_unselected'},
    {'icon': Icons.tab_unselected_outlined, 'name': 'tab_unselected_outlined'},
    {'icon': Icons.tab_unselected_rounded, 'name': 'tab_unselected_rounded'},
    {'icon': Icons.tab_unselected_sharp, 'name': 'tab_unselected_sharp'},
    {'icon': Icons.table_chart, 'name': 'table_chart'},
    {'icon': Icons.table_chart_outlined, 'name': 'table_chart_outlined'},
    {'icon': Icons.table_chart_rounded, 'name': 'table_chart_rounded'},
    {'icon': Icons.table_chart_sharp, 'name': 'table_chart_sharp'},
    {'icon': Icons.table_rows, 'name': 'table_rows'},
    {'icon': Icons.table_rows_outlined, 'name': 'table_rows_outlined'},
    {'icon': Icons.table_rows_rounded, 'name': 'table_rows_rounded'},
    {'icon': Icons.table_rows_sharp, 'name': 'table_rows_sharp'},
    {'icon': Icons.table_view, 'name': 'table_view'},
    {'icon': Icons.table_view_outlined, 'name': 'table_view_outlined'},
    {'icon': Icons.table_view_rounded, 'name': 'table_view_rounded'},
    {'icon': Icons.table_view_sharp, 'name': 'table_view_sharp'},
    {'icon': Icons.tablet, 'name': 'tablet'},
    {'icon': Icons.tablet_android, 'name': 'tablet_android'},
    {'icon': Icons.tablet_android_outlined, 'name': 'tablet_android_outlined'},
    {'icon': Icons.tablet_android_rounded, 'name': 'tablet_android_rounded'},
    {'icon': Icons.tablet_android_sharp, 'name': 'tablet_android_sharp'},
    {'icon': Icons.tablet_mac, 'name': 'tablet_mac'},
    {'icon': Icons.tablet_mac_outlined, 'name': 'tablet_mac_outlined'},
    {'icon': Icons.tablet_mac_rounded, 'name': 'tablet_mac_rounded'},
    {'icon': Icons.tablet_mac_sharp, 'name': 'tablet_mac_sharp'},
    {'icon': Icons.tablet_outlined, 'name': 'tablet_outlined'},
    {'icon': Icons.tablet_rounded, 'name': 'tablet_rounded'},
    {'icon': Icons.tablet_sharp, 'name': 'tablet_sharp'},
    {'icon': Icons.tag, 'name': 'tag'},
    {'icon': Icons.tag_faces, 'name': 'tag_faces'},
    {'icon': Icons.tag_faces_outlined, 'name': 'tag_faces_outlined'},
    {'icon': Icons.tag_faces_rounded, 'name': 'tag_faces_rounded'},
    {'icon': Icons.tag_faces_sharp, 'name': 'tag_faces_sharp'},
    {'icon': Icons.takeout_dining, 'name': 'takeout_dining'},
    {'icon': Icons.tap_and_play, 'name': 'tap_and_play'},
    {'icon': Icons.tap_and_play_outlined, 'name': 'tap_and_play_outlined'},
    {'icon': Icons.tap_and_play_rounded, 'name': 'tap_and_play_rounded'},
    {'icon': Icons.tap_and_play_sharp, 'name': 'tap_and_play_sharp'},
    {'icon': Icons.tapas, 'name': 'tapas'},
    {'icon': Icons.tapas_outlined, 'name': 'tapas_outlined'},
    {'icon': Icons.tapas_rounded, 'name': 'tapas_rounded'},
    {'icon': Icons.tapas_sharp, 'name': 'tapas_sharp'},
    {'icon': Icons.taxi_alert, 'name': 'taxi_alert'},
    {'icon': Icons.ten_k, 'name': 'ten_k'},
    {'icon': Icons.ten_mp, 'name': 'ten_mp'},
    {'icon': Icons.terrain, 'name': 'terrain'},
    {'icon': Icons.terrain_outlined, 'name': 'terrain_outlined'},
    {'icon': Icons.terrain_rounded, 'name': 'terrain_rounded'},
    {'icon': Icons.terrain_sharp, 'name': 'terrain_sharp'},
    {'icon': Icons.text_fields, 'name': 'text_fields'},
    {'icon': Icons.text_fields_outlined, 'name': 'text_fields_outlined'},
    {'icon': Icons.text_fields_rounded, 'name': 'text_fields_rounded'},
    {'icon': Icons.text_fields_sharp, 'name': 'text_fields_sharp'},
    {'icon': Icons.text_format, 'name': 'text_format'},
    {'icon': Icons.text_format_outlined, 'name': 'text_format_outlined'},
    {'icon': Icons.text_format_rounded, 'name': 'text_format_rounded'},
    {'icon': Icons.text_format_sharp, 'name': 'text_format_sharp'},
    {'icon': Icons.text_rotate_up, 'name': 'text_rotate_up'},
    {'icon': Icons.text_rotate_up_outlined, 'name': 'text_rotate_up_outlined'},
    {'icon': Icons.text_rotate_up_rounded, 'name': 'text_rotate_up_rounded'},
    {'icon': Icons.text_rotate_up_sharp, 'name': 'text_rotate_up_sharp'},
    {'icon': Icons.text_rotate_vertical, 'name': 'text_rotate_vertical'},
    {
      'icon': Icons.text_rotate_vertical_outlined,
      'name': 'text_rotate_vertical_outlined'
    },
    {
      'icon': Icons.text_rotate_vertical_rounded,
      'name': 'text_rotate_vertical_rounded'
    },
    {
      'icon': Icons.text_rotate_vertical_sharp,
      'name': 'text_rotate_vertical_sharp'
    },
    {'icon': Icons.text_rotation_angledown, 'name': 'text_rotation_angledown'},
    {
      'icon': Icons.text_rotation_angledown_outlined,
      'name': 'text_rotation_angledown_outlined'
    },
    {
      'icon': Icons.text_rotation_angledown_rounded,
      'name': 'text_rotation_angledown_rounded'
    },
    {
      'icon': Icons.text_rotation_angledown_sharp,
      'name': 'text_rotation_angledown_sharp'
    },
    {'icon': Icons.text_rotation_angleup, 'name': 'text_rotation_angleup'},
    {
      'icon': Icons.text_rotation_angleup_outlined,
      'name': 'text_rotation_angleup_outlined'
    },
    {
      'icon': Icons.text_rotation_angleup_rounded,
      'name': 'text_rotation_angleup_rounded'
    },
    {
      'icon': Icons.text_rotation_angleup_sharp,
      'name': 'text_rotation_angleup_sharp'
    },
    {'icon': Icons.text_rotation_down, 'name': 'text_rotation_down'},
    {
      'icon': Icons.text_rotation_down_outlined,
      'name': 'text_rotation_down_outlined'
    },
    {
      'icon': Icons.text_rotation_down_rounded,
      'name': 'text_rotation_down_rounded'
    },
    {
      'icon': Icons.text_rotation_down_sharp,
      'name': 'text_rotation_down_sharp'
    },
    {'icon': Icons.text_rotation_none, 'name': 'text_rotation_none'},
    {
      'icon': Icons.text_rotation_none_outlined,
      'name': 'text_rotation_none_outlined'
    },
    {
      'icon': Icons.text_rotation_none_rounded,
      'name': 'text_rotation_none_rounded'
    },
    {
      'icon': Icons.text_rotation_none_sharp,
      'name': 'text_rotation_none_sharp'
    },
    {'icon': Icons.text_snippet, 'name': 'text_snippet'},
    {'icon': Icons.text_snippet_outlined, 'name': 'text_snippet_outlined'},
    {'icon': Icons.text_snippet_rounded, 'name': 'text_snippet_rounded'},
    {'icon': Icons.text_snippet_sharp, 'name': 'text_snippet_sharp'},
    {'icon': Icons.textsms, 'name': 'textsms'},
    {'icon': Icons.textsms_outlined, 'name': 'textsms_outlined'},
    {'icon': Icons.textsms_rounded, 'name': 'textsms_rounded'},
    {'icon': Icons.textsms_sharp, 'name': 'textsms_sharp'},
    {'icon': Icons.texture, 'name': 'texture'},
    {'icon': Icons.texture_outlined, 'name': 'texture_outlined'},
    {'icon': Icons.texture_rounded, 'name': 'texture_rounded'},
    {'icon': Icons.texture_sharp, 'name': 'texture_sharp'},
    {'icon': Icons.theater_comedy, 'name': 'theater_comedy'},
    {'icon': Icons.theaters, 'name': 'theaters'},
    {'icon': Icons.theaters_outlined, 'name': 'theaters_outlined'},
    {'icon': Icons.theaters_rounded, 'name': 'theaters_rounded'},
    {'icon': Icons.theaters_sharp, 'name': 'theaters_sharp'},
    {'icon': Icons.thermostat_outlined, 'name': 'thermostat_outlined'},
    {'icon': Icons.thermostat_rounded, 'name': 'thermostat_rounded'},
    {'icon': Icons.thermostat_sharp, 'name': 'thermostat_sharp'},
    {'icon': Icons.thirteen_mp, 'name': 'thirteen_mp'},
    {'icon': Icons.three_k, 'name': 'three_k'},
    {'icon': Icons.three_k_plus, 'name': 'three_k_plus'},
    {'icon': Icons.three_mp, 'name': 'three_mp'},
    {'icon': Icons.threed_rotation, 'name': 'threed_rotation'},
    {
      'icon': Icons.threed_rotation_outlined,
      'name': 'threed_rotation_outlined'
    },
    {'icon': Icons.threed_rotation_rounded, 'name': 'threed_rotation_rounded'},
    {'icon': Icons.threed_rotation_sharp, 'name': 'threed_rotation_sharp'},
    {'icon': Icons.threesixty, 'name': 'threesixty'},
    {'icon': Icons.threesixty_outlined, 'name': 'threesixty_outlined'},
    {'icon': Icons.threesixty_rounded, 'name': 'threesixty_rounded'},
    {'icon': Icons.threesixty_sharp, 'name': 'threesixty_sharp'},
    {'icon': Icons.thumb_down, 'name': 'thumb_down'},
    {'icon': Icons.thumb_down_alt, 'name': 'thumb_down_alt'},
    {'icon': Icons.thumb_down_alt_outlined, 'name': 'thumb_down_alt_outlined'},
    {'icon': Icons.thumb_down_alt_rounded, 'name': 'thumb_down_alt_rounded'},
    {'icon': Icons.thumb_down_alt_sharp, 'name': 'thumb_down_alt_sharp'},
    {'icon': Icons.thumb_down_off_alt, 'name': 'thumb_down_off_alt'},
    {'icon': Icons.thumb_down_outlined, 'name': 'thumb_down_outlined'},
    {'icon': Icons.thumb_down_rounded, 'name': 'thumb_down_rounded'},
    {'icon': Icons.thumb_down_sharp, 'name': 'thumb_down_sharp'},
    {'icon': Icons.thumb_up, 'name': 'thumb_up'},
    {'icon': Icons.thumb_up_alt, 'name': 'thumb_up_alt'},
    {'icon': Icons.thumb_up_alt_outlined, 'name': 'thumb_up_alt_outlined'},
    {'icon': Icons.thumb_up_alt_rounded, 'name': 'thumb_up_alt_rounded'},
    {'icon': Icons.thumb_up_alt_sharp, 'name': 'thumb_up_alt_sharp'},
    {'icon': Icons.thumb_up_off_alt, 'name': 'thumb_up_off_alt'},
    {'icon': Icons.thumb_up_outlined, 'name': 'thumb_up_outlined'},
    {'icon': Icons.thumb_up_rounded, 'name': 'thumb_up_rounded'},
    {'icon': Icons.thumb_up_sharp, 'name': 'thumb_up_sharp'},
    {'icon': Icons.thumbs_up_down, 'name': 'thumbs_up_down'},
    {'icon': Icons.thumbs_up_down_outlined, 'name': 'thumbs_up_down_outlined'},
    {'icon': Icons.thumbs_up_down_rounded, 'name': 'thumbs_up_down_rounded'},
    {'icon': Icons.thumbs_up_down_sharp, 'name': 'thumbs_up_down_sharp'},
    {'icon': Icons.time_to_leave, 'name': 'time_to_leave'},
    {'icon': Icons.time_to_leave_outlined, 'name': 'time_to_leave_outlined'},
    {'icon': Icons.time_to_leave_rounded, 'name': 'time_to_leave_rounded'},
    {'icon': Icons.time_to_leave_sharp, 'name': 'time_to_leave_sharp'},
    {'icon': Icons.timelapse, 'name': 'timelapse'},
    {'icon': Icons.timelapse_outlined, 'name': 'timelapse_outlined'},
    {'icon': Icons.timelapse_rounded, 'name': 'timelapse_rounded'},
    {'icon': Icons.timelapse_sharp, 'name': 'timelapse_sharp'},
    {'icon': Icons.timeline, 'name': 'timeline'},
    {'icon': Icons.timeline_outlined, 'name': 'timeline_outlined'},
    {'icon': Icons.timeline_rounded, 'name': 'timeline_rounded'},
    {'icon': Icons.timeline_sharp, 'name': 'timeline_sharp'},
    {'icon': Icons.timer, 'name': 'timer'},
    {'icon': Icons.timer_3, 'name': 'timer_3'},
    {'icon': Icons.timer_3_outlined, 'name': 'timer_3_outlined'},
    {'icon': Icons.timer_3_rounded, 'name': 'timer_3_rounded'},
    {'icon': Icons.timer_3_sharp, 'name': 'timer_3_sharp'},
    {'icon': Icons.timer_10, 'name': 'timer_10'},
    {'icon': Icons.timer_10_outlined, 'name': 'timer_10_outlined'},
    {'icon': Icons.timer_10_rounded, 'name': 'timer_10_rounded'},
    {'icon': Icons.timer_10_sharp, 'name': 'timer_10_sharp'},
    {'icon': Icons.timer_off, 'name': 'timer_off'},
    {'icon': Icons.timer_off_outlined, 'name': 'timer_off_outlined'},
    {'icon': Icons.timer_off_rounded, 'name': 'timer_off_rounded'},
    {'icon': Icons.timer_off_sharp, 'name': 'timer_off_sharp'},
    {'icon': Icons.timer_outlined, 'name': 'timer_outlined'},
    {'icon': Icons.timer_rounded, 'name': 'timer_rounded'},
    {'icon': Icons.timer_sharp, 'name': 'timer_sharp'},
    {'icon': Icons.title, 'name': 'title'},
    {'icon': Icons.title_outlined, 'name': 'title_outlined'},
    {'icon': Icons.title_rounded, 'name': 'title_rounded'},
    {'icon': Icons.title_sharp, 'name': 'title_sharp'},
    {'icon': Icons.toc, 'name': 'toc'},
    {'icon': Icons.toc_outlined, 'name': 'toc_outlined'},
    {'icon': Icons.toc_rounded, 'name': 'toc_rounded'},
    {'icon': Icons.toc_sharp, 'name': 'toc_sharp'},
    {'icon': Icons.today, 'name': 'today'},
    {'icon': Icons.today_outlined, 'name': 'today_outlined'},
    {'icon': Icons.today_rounded, 'name': 'today_rounded'},
    {'icon': Icons.today_sharp, 'name': 'today_sharp'},
    {'icon': Icons.toggle_off, 'name': 'toggle_off'},
    {'icon': Icons.toggle_off_outlined, 'name': 'toggle_off_outlined'},
    {'icon': Icons.toggle_off_rounded, 'name': 'toggle_off_rounded'},
    {'icon': Icons.toggle_off_sharp, 'name': 'toggle_off_sharp'},
    {'icon': Icons.toggle_on, 'name': 'toggle_on'},
    {'icon': Icons.toggle_on_outlined, 'name': 'toggle_on_outlined'},
    {'icon': Icons.toggle_on_rounded, 'name': 'toggle_on_rounded'},
    {'icon': Icons.toggle_on_sharp, 'name': 'toggle_on_sharp'},
    {'icon': Icons.toll, 'name': 'toll'},
    {'icon': Icons.toll_outlined, 'name': 'toll_outlined'},
    {'icon': Icons.toll_rounded, 'name': 'toll_rounded'},
    {'icon': Icons.toll_sharp, 'name': 'toll_sharp'},
    {'icon': Icons.tonality, 'name': 'tonality'},
    {'icon': Icons.tonality_outlined, 'name': 'tonality_outlined'},
    {'icon': Icons.tonality_rounded, 'name': 'tonality_rounded'},
    {'icon': Icons.tonality_sharp, 'name': 'tonality_sharp'},
    {'icon': Icons.topic, 'name': 'topic'},
    {'icon': Icons.topic_outlined, 'name': 'topic_outlined'},
    {'icon': Icons.topic_rounded, 'name': 'topic_rounded'},
    {'icon': Icons.topic_sharp, 'name': 'topic_sharp'},
    {'icon': Icons.touch_app, 'name': 'touch_app'},
    {'icon': Icons.touch_app_outlined, 'name': 'touch_app_outlined'},
    {'icon': Icons.touch_app_rounded, 'name': 'touch_app_rounded'},
    {'icon': Icons.touch_app_sharp, 'name': 'touch_app_sharp'},
    {'icon': Icons.tour, 'name': 'tour'},
    {'icon': Icons.tour_outlined, 'name': 'tour_outlined'},
    {'icon': Icons.tour_rounded, 'name': 'tour_rounded'},
    {'icon': Icons.tour_sharp, 'name': 'tour_sharp'},
    {'icon': Icons.toys, 'name': 'toys'},
    {'icon': Icons.toys_outlined, 'name': 'toys_outlined'},
    {'icon': Icons.toys_rounded, 'name': 'toys_rounded'},
    {'icon': Icons.toys_sharp, 'name': 'toys_sharp'},
    {'icon': Icons.track_changes, 'name': 'track_changes'},
    {'icon': Icons.track_changes_outlined, 'name': 'track_changes_outlined'},
    {'icon': Icons.track_changes_rounded, 'name': 'track_changes_rounded'},
    {'icon': Icons.track_changes_sharp, 'name': 'track_changes_sharp'},
    {'icon': Icons.traffic, 'name': 'traffic'},
    {'icon': Icons.traffic_outlined, 'name': 'traffic_outlined'},
    {'icon': Icons.traffic_rounded, 'name': 'traffic_rounded'},
    {'icon': Icons.traffic_sharp, 'name': 'traffic_sharp'},
    {'icon': Icons.train, 'name': 'train'},
    {'icon': Icons.train_outlined, 'name': 'train_outlined'},
    {'icon': Icons.train_rounded, 'name': 'train_rounded'},
    {'icon': Icons.train_sharp, 'name': 'train_sharp'},
    {'icon': Icons.tram, 'name': 'tram'},
    {'icon': Icons.tram_outlined, 'name': 'tram_outlined'},
    {'icon': Icons.tram_rounded, 'name': 'tram_rounded'},
    {'icon': Icons.tram_sharp, 'name': 'tram_sharp'},
    {
      'icon': Icons.transfer_within_a_station,
      'name': 'transfer_within_a_station'
    },
    {
      'icon': Icons.transfer_within_a_station_outlined,
      'name': 'transfer_within_a_station_outlined'
    },
    {
      'icon': Icons.transfer_within_a_station_rounded,
      'name': 'transfer_within_a_station_rounded'
    },
    {
      'icon': Icons.transfer_within_a_station_sharp,
      'name': 'transfer_within_a_station_sharp'
    },
    {'icon': Icons.transform, 'name': 'transform'},
    {'icon': Icons.transform_outlined, 'name': 'transform_outlined'},
    {'icon': Icons.transform_rounded, 'name': 'transform_rounded'},
    {'icon': Icons.transform_sharp, 'name': 'transform_sharp'},
    {'icon': Icons.transit_enterexit, 'name': 'transit_enterexit'},
    {
      'icon': Icons.transit_enterexit_outlined,
      'name': 'transit_enterexit_outlined'
    },
    {
      'icon': Icons.transit_enterexit_rounded,
      'name': 'transit_enterexit_rounded'
    },
    {'icon': Icons.transit_enterexit_sharp, 'name': 'transit_enterexit_sharp'},
    {'icon': Icons.translate, 'name': 'translate'},
    {'icon': Icons.translate_outlined, 'name': 'translate_outlined'},
    {'icon': Icons.translate_rounded, 'name': 'translate_rounded'},
    {'icon': Icons.translate_sharp, 'name': 'translate_sharp'},
    {'icon': Icons.trending_down, 'name': 'trending_down'},
    {'icon': Icons.trending_down_outlined, 'name': 'trending_down_outlined'},
    {'icon': Icons.trending_down_rounded, 'name': 'trending_down_rounded'},
    {'icon': Icons.trending_down_sharp, 'name': 'trending_down_sharp'},
    {'icon': Icons.trending_flat, 'name': 'trending_flat'},
    {'icon': Icons.trending_flat_outlined, 'name': 'trending_flat_outlined'},
    {'icon': Icons.trending_flat_rounded, 'name': 'trending_flat_rounded'},
    {'icon': Icons.trending_flat_sharp, 'name': 'trending_flat_sharp'},
    {'icon': Icons.trending_neutral, 'name': 'trending_neutral'},
    {
      'icon': Icons.trending_neutral_outlined,
      'name': 'trending_neutral_outlined'
    },
    {
      'icon': Icons.trending_neutral_rounded,
      'name': 'trending_neutral_rounded'
    },
    {'icon': Icons.trending_neutral_sharp, 'name': 'trending_neutral_sharp'},
    {'icon': Icons.trending_up, 'name': 'trending_up'},
    {'icon': Icons.trending_up_outlined, 'name': 'trending_up_outlined'},
    {'icon': Icons.trending_up_rounded, 'name': 'trending_up_rounded'},
    {'icon': Icons.trending_up_sharp, 'name': 'trending_up_sharp'},
    {'icon': Icons.trip_origin, 'name': 'trip_origin'},
    {'icon': Icons.trip_origin_outlined, 'name': 'trip_origin_outlined'},
    {'icon': Icons.trip_origin_rounded, 'name': 'trip_origin_rounded'},
    {'icon': Icons.trip_origin_sharp, 'name': 'trip_origin_sharp'},
    {'icon': Icons.tty, 'name': 'tty'},
    {'icon': Icons.tty_outlined, 'name': 'tty_outlined'},
    {'icon': Icons.tty_rounded, 'name': 'tty_rounded'},
    {'icon': Icons.tty_sharp, 'name': 'tty_sharp'},
    {'icon': Icons.tune, 'name': 'tune'},
    {'icon': Icons.tune_outlined, 'name': 'tune_outlined'},
    {'icon': Icons.tune_rounded, 'name': 'tune_rounded'},
    {'icon': Icons.tune_sharp, 'name': 'tune_sharp'},
    {'icon': Icons.turned_in, 'name': 'turned_in'},
    {'icon': Icons.turned_in_not, 'name': 'turned_in_not'},
    {'icon': Icons.turned_in_not_outlined, 'name': 'turned_in_not_outlined'},
    {'icon': Icons.turned_in_not_rounded, 'name': 'turned_in_not_rounded'},
    {'icon': Icons.turned_in_not_sharp, 'name': 'turned_in_not_sharp'},
    {'icon': Icons.turned_in_outlined, 'name': 'turned_in_outlined'},
    {'icon': Icons.turned_in_rounded, 'name': 'turned_in_rounded'},
    {'icon': Icons.turned_in_sharp, 'name': 'turned_in_sharp'},
    {'icon': Icons.tv, 'name': 'tv'},
    {'icon': Icons.tv_off, 'name': 'tv_off'},
    {'icon': Icons.tv_off_outlined, 'name': 'tv_off_outlined'},
    {'icon': Icons.tv_off_rounded, 'name': 'tv_off_rounded'},
    {'icon': Icons.tv_off_sharp, 'name': 'tv_off_sharp'},
    {'icon': Icons.tv_outlined, 'name': 'tv_outlined'},
    {'icon': Icons.tv_rounded, 'name': 'tv_rounded'},
    {'icon': Icons.tv_sharp, 'name': 'tv_sharp'},
    {'icon': Icons.twelve_mp, 'name': 'twelve_mp'},
    {'icon': Icons.twenty_four_mp, 'name': 'twenty_four_mp'},
    {'icon': Icons.twenty_mp, 'name': 'twenty_mp'},
    {'icon': Icons.twenty_one_mp, 'name': 'twenty_one_mp'},
    {'icon': Icons.twenty_three_mp, 'name': 'twenty_three_mp'},
    {'icon': Icons.twenty_two_mp, 'name': 'twenty_two_mp'},
    {'icon': Icons.two_k, 'name': 'two_k'},
    {'icon': Icons.two_k_plus, 'name': 'two_k_plus'},
    {'icon': Icons.two_mp, 'name': 'two_mp'},
    {'icon': Icons.two_wheeler, 'name': 'two_wheeler'},
    {'icon': Icons.two_wheeler_outlined, 'name': 'two_wheeler_outlined'},
    {'icon': Icons.two_wheeler_rounded, 'name': 'two_wheeler_rounded'},
    {'icon': Icons.two_wheeler_sharp, 'name': 'two_wheeler_sharp'},
    {'icon': Icons.umbrella, 'name': 'umbrella'},
    {'icon': Icons.umbrella_outlined, 'name': 'umbrella_outlined'},
    {'icon': Icons.umbrella_rounded, 'name': 'umbrella_rounded'},
    {'icon': Icons.umbrella_sharp, 'name': 'umbrella_sharp'},
    {'icon': Icons.unarchive, 'name': 'unarchive'},
    {'icon': Icons.unarchive_outlined, 'name': 'unarchive_outlined'},
    {'icon': Icons.unarchive_rounded, 'name': 'unarchive_rounded'},
    {'icon': Icons.unarchive_sharp, 'name': 'unarchive_sharp'},
    {'icon': Icons.undo, 'name': 'undo'},
    {'icon': Icons.undo_outlined, 'name': 'undo_outlined'},
    {'icon': Icons.undo_rounded, 'name': 'undo_rounded'},
    {'icon': Icons.undo_sharp, 'name': 'undo_sharp'},
    {'icon': Icons.unfold_less, 'name': 'unfold_less'},
    {'icon': Icons.unfold_less_outlined, 'name': 'unfold_less_outlined'},
    {'icon': Icons.unfold_less_rounded, 'name': 'unfold_less_rounded'},
    {'icon': Icons.unfold_less_sharp, 'name': 'unfold_less_sharp'},
    {'icon': Icons.unfold_more, 'name': 'unfold_more'},
    {'icon': Icons.unfold_more_outlined, 'name': 'unfold_more_outlined'},
    {'icon': Icons.unfold_more_rounded, 'name': 'unfold_more_rounded'},
    {'icon': Icons.unfold_more_sharp, 'name': 'unfold_more_sharp'},
    {'icon': Icons.unsubscribe, 'name': 'unsubscribe'},
    {'icon': Icons.unsubscribe_outlined, 'name': 'unsubscribe_outlined'},
    {'icon': Icons.unsubscribe_rounded, 'name': 'unsubscribe_rounded'},
    {'icon': Icons.unsubscribe_sharp, 'name': 'unsubscribe_sharp'},
    {'icon': Icons.update, 'name': 'update'},
    {'icon': Icons.update_outlined, 'name': 'update_outlined'},
    {'icon': Icons.update_rounded, 'name': 'update_rounded'},
    {'icon': Icons.update_sharp, 'name': 'update_sharp'},
    {'icon': Icons.upgrade, 'name': 'upgrade'},
    {'icon': Icons.upgrade_outlined, 'name': 'upgrade_outlined'},
    {'icon': Icons.upgrade_rounded, 'name': 'upgrade_rounded'},
    {'icon': Icons.upgrade_sharp, 'name': 'upgrade_sharp'},
    {'icon': Icons.upload_file, 'name': 'upload_file'},
    {'icon': Icons.upload_outlined, 'name': 'upload_outlined'},
    {'icon': Icons.upload_rounded, 'name': 'upload_rounded'},
    {'icon': Icons.upload_sharp, 'name': 'upload_sharp'},
    {'icon': Icons.usb, 'name': 'usb'},
    {'icon': Icons.usb_outlined, 'name': 'usb_outlined'},
    {'icon': Icons.usb_rounded, 'name': 'usb_rounded'},
    {'icon': Icons.usb_sharp, 'name': 'usb_sharp'},
    {'icon': Icons.verified, 'name': 'verified'},
    {'icon': Icons.verified_outlined, 'name': 'verified_outlined'},
    {'icon': Icons.verified_rounded, 'name': 'verified_rounded'},
    {'icon': Icons.verified_sharp, 'name': 'verified_sharp'},
    {'icon': Icons.verified_user, 'name': 'verified_user'},
    {'icon': Icons.verified_user_outlined, 'name': 'verified_user_outlined'},
    {'icon': Icons.verified_user_rounded, 'name': 'verified_user_rounded'},
    {'icon': Icons.verified_user_sharp, 'name': 'verified_user_sharp'},
    {'icon': Icons.vertical_align_bottom, 'name': 'vertical_align_bottom'},
    {
      'icon': Icons.vertical_align_bottom_outlined,
      'name': 'vertical_align_bottom_outlined'
    },
    {
      'icon': Icons.vertical_align_bottom_rounded,
      'name': 'vertical_align_bottom_rounded'
    },
    {
      'icon': Icons.vertical_align_bottom_sharp,
      'name': 'vertical_align_bottom_sharp'
    },
    {'icon': Icons.vertical_align_center, 'name': 'vertical_align_center'},
    {
      'icon': Icons.vertical_align_center_outlined,
      'name': 'vertical_align_center_outlined'
    },
    {
      'icon': Icons.vertical_align_center_rounded,
      'name': 'vertical_align_center_rounded'
    },
    {
      'icon': Icons.vertical_align_center_sharp,
      'name': 'vertical_align_center_sharp'
    },
    {'icon': Icons.vertical_align_top, 'name': 'vertical_align_top'},
    {
      'icon': Icons.vertical_align_top_outlined,
      'name': 'vertical_align_top_outlined'
    },
    {
      'icon': Icons.vertical_align_top_rounded,
      'name': 'vertical_align_top_rounded'
    },
    {
      'icon': Icons.vertical_align_top_sharp,
      'name': 'vertical_align_top_sharp'
    },
    {'icon': Icons.vertical_split, 'name': 'vertical_split'},
    {'icon': Icons.vertical_split_outlined, 'name': 'vertical_split_outlined'},
    {'icon': Icons.vertical_split_rounded, 'name': 'vertical_split_rounded'},
    {'icon': Icons.vertical_split_sharp, 'name': 'vertical_split_sharp'},
    {'icon': Icons.vibration, 'name': 'vibration'},
    {'icon': Icons.vibration_outlined, 'name': 'vibration_outlined'},
    {'icon': Icons.vibration_rounded, 'name': 'vibration_rounded'},
    {'icon': Icons.vibration_sharp, 'name': 'vibration_sharp'},
    {'icon': Icons.video_call, 'name': 'video_call'},
    {'icon': Icons.video_call_outlined, 'name': 'video_call_outlined'},
    {'icon': Icons.video_call_rounded, 'name': 'video_call_rounded'},
    {'icon': Icons.video_call_sharp, 'name': 'video_call_sharp'},
    {'icon': Icons.video_collection, 'name': 'video_collection'},
    {
      'icon': Icons.video_collection_outlined,
      'name': 'video_collection_outlined'
    },
    {
      'icon': Icons.video_collection_rounded,
      'name': 'video_collection_rounded'
    },
    {'icon': Icons.video_collection_sharp, 'name': 'video_collection_sharp'},
    {'icon': Icons.video_label, 'name': 'video_label'},
    {'icon': Icons.video_label_outlined, 'name': 'video_label_outlined'},
    {'icon': Icons.video_label_rounded, 'name': 'video_label_rounded'},
    {'icon': Icons.video_label_sharp, 'name': 'video_label_sharp'},
    {'icon': Icons.video_library, 'name': 'video_library'},
    {'icon': Icons.video_library_outlined, 'name': 'video_library_outlined'},
    {'icon': Icons.video_library_rounded, 'name': 'video_library_rounded'},
    {'icon': Icons.video_library_sharp, 'name': 'video_library_sharp'},
    {'icon': Icons.video_settings, 'name': 'video_settings'},
    {'icon': Icons.video_settings_outlined, 'name': 'video_settings_outlined'},
    {'icon': Icons.video_settings_rounded, 'name': 'video_settings_rounded'},
    {'icon': Icons.video_settings_sharp, 'name': 'video_settings_sharp'},
    {'icon': Icons.videocam, 'name': 'videocam'},
    {'icon': Icons.videocam_off, 'name': 'videocam_off'},
    {'icon': Icons.videocam_off_outlined, 'name': 'videocam_off_outlined'},
    {'icon': Icons.videocam_off_rounded, 'name': 'videocam_off_rounded'},
    {'icon': Icons.videocam_off_sharp, 'name': 'videocam_off_sharp'},
    {'icon': Icons.videocam_outlined, 'name': 'videocam_outlined'},
    {'icon': Icons.videocam_rounded, 'name': 'videocam_rounded'},
    {'icon': Icons.videocam_sharp, 'name': 'videocam_sharp'},
    {'icon': Icons.videogame_asset, 'name': 'videogame_asset'},
    {
      'icon': Icons.videogame_asset_outlined,
      'name': 'videogame_asset_outlined'
    },
    {'icon': Icons.videogame_asset_rounded, 'name': 'videogame_asset_rounded'},
    {'icon': Icons.videogame_asset_sharp, 'name': 'videogame_asset_sharp'},
    {'icon': Icons.view_agenda, 'name': 'view_agenda'},
    {'icon': Icons.view_agenda_outlined, 'name': 'view_agenda_outlined'},
    {'icon': Icons.view_agenda_rounded, 'name': 'view_agenda_rounded'},
    {'icon': Icons.view_agenda_sharp, 'name': 'view_agenda_sharp'},
    {'icon': Icons.view_array, 'name': 'view_array'},
    {'icon': Icons.view_array_outlined, 'name': 'view_array_outlined'},
    {'icon': Icons.view_array_rounded, 'name': 'view_array_rounded'},
    {'icon': Icons.view_array_sharp, 'name': 'view_array_sharp'},
    {'icon': Icons.view_carousel, 'name': 'view_carousel'},
    {'icon': Icons.view_carousel_outlined, 'name': 'view_carousel_outlined'},
    {'icon': Icons.view_carousel_rounded, 'name': 'view_carousel_rounded'},
    {'icon': Icons.view_carousel_sharp, 'name': 'view_carousel_sharp'},
    {'icon': Icons.view_column, 'name': 'view_column'},
    {'icon': Icons.view_column_outlined, 'name': 'view_column_outlined'},
    {'icon': Icons.view_column_rounded, 'name': 'view_column_rounded'},
    {'icon': Icons.view_column_sharp, 'name': 'view_column_sharp'},
    {'icon': Icons.view_comfortable, 'name': 'view_comfortable'},
    {
      'icon': Icons.view_comfortable_outlined,
      'name': 'view_comfortable_outlined'
    },
    {
      'icon': Icons.view_comfortable_rounded,
      'name': 'view_comfortable_rounded'
    },
    {'icon': Icons.view_comfortable_sharp, 'name': 'view_comfortable_sharp'},
    {'icon': Icons.view_comfy, 'name': 'view_comfy'},
    {'icon': Icons.view_comfy_outlined, 'name': 'view_comfy_outlined'},
    {'icon': Icons.view_comfy_rounded, 'name': 'view_comfy_rounded'},
    {'icon': Icons.view_comfy_sharp, 'name': 'view_comfy_sharp'},
    {'icon': Icons.view_compact, 'name': 'view_compact'},
    {'icon': Icons.view_compact_outlined, 'name': 'view_compact_outlined'},
    {'icon': Icons.view_compact_rounded, 'name': 'view_compact_rounded'},
    {'icon': Icons.view_compact_sharp, 'name': 'view_compact_sharp'},
    {'icon': Icons.view_day, 'name': 'view_day'},
    {'icon': Icons.view_day_outlined, 'name': 'view_day_outlined'},
    {'icon': Icons.view_day_rounded, 'name': 'view_day_rounded'},
    {'icon': Icons.view_day_sharp, 'name': 'view_day_sharp'},
    {'icon': Icons.view_headline, 'name': 'view_headline'},
    {'icon': Icons.view_headline_outlined, 'name': 'view_headline_outlined'},
    {'icon': Icons.view_headline_rounded, 'name': 'view_headline_rounded'},
    {'icon': Icons.view_headline_sharp, 'name': 'view_headline_sharp'},
    {'icon': Icons.view_in_ar, 'name': 'view_in_ar'},
    {'icon': Icons.view_list, 'name': 'view_list'},
    {'icon': Icons.view_list_outlined, 'name': 'view_list_outlined'},
    {'icon': Icons.view_list_rounded, 'name': 'view_list_rounded'},
    {'icon': Icons.view_list_sharp, 'name': 'view_list_sharp'},
    {'icon': Icons.view_module, 'name': 'view_module'},
    {'icon': Icons.view_module_outlined, 'name': 'view_module_outlined'},
    {'icon': Icons.view_module_rounded, 'name': 'view_module_rounded'},
    {'icon': Icons.view_module_sharp, 'name': 'view_module_sharp'},
    {'icon': Icons.view_quilt, 'name': 'view_quilt'},
    {'icon': Icons.view_quilt_outlined, 'name': 'view_quilt_outlined'},
    {'icon': Icons.view_quilt_rounded, 'name': 'view_quilt_rounded'},
    {'icon': Icons.view_quilt_sharp, 'name': 'view_quilt_sharp'},
    {'icon': Icons.view_sidebar, 'name': 'view_sidebar'},
    {'icon': Icons.view_sidebar_outlined, 'name': 'view_sidebar_outlined'},
    {'icon': Icons.view_sidebar_rounded, 'name': 'view_sidebar_rounded'},
    {'icon': Icons.view_sidebar_sharp, 'name': 'view_sidebar_sharp'},
    {'icon': Icons.view_stream, 'name': 'view_stream'},
    {'icon': Icons.view_stream_outlined, 'name': 'view_stream_outlined'},
    {'icon': Icons.view_stream_rounded, 'name': 'view_stream_rounded'},
    {'icon': Icons.view_stream_sharp, 'name': 'view_stream_sharp'},
    {'icon': Icons.view_week, 'name': 'view_week'},
    {'icon': Icons.view_week_outlined, 'name': 'view_week_outlined'},
    {'icon': Icons.view_week_rounded, 'name': 'view_week_rounded'},
    {'icon': Icons.view_week_sharp, 'name': 'view_week_sharp'},
    {'icon': Icons.vignette, 'name': 'vignette'},
    {'icon': Icons.vignette_outlined, 'name': 'vignette_outlined'},
    {'icon': Icons.vignette_rounded, 'name': 'vignette_rounded'},
    {'icon': Icons.vignette_sharp, 'name': 'vignette_sharp'},
    {'icon': Icons.visibility, 'name': 'visibility'},
    {'icon': Icons.visibility_off, 'name': 'visibility_off'},
    {'icon': Icons.visibility_off_outlined, 'name': 'visibility_off_outlined'},
    {'icon': Icons.visibility_off_rounded, 'name': 'visibility_off_rounded'},
    {'icon': Icons.visibility_off_sharp, 'name': 'visibility_off_sharp'},
    {'icon': Icons.visibility_outlined, 'name': 'visibility_outlined'},
    {'icon': Icons.visibility_rounded, 'name': 'visibility_rounded'},
    {'icon': Icons.visibility_sharp, 'name': 'visibility_sharp'},
    {'icon': Icons.voice_chat, 'name': 'voice_chat'},
    {'icon': Icons.voice_chat_outlined, 'name': 'voice_chat_outlined'},
    {'icon': Icons.voice_chat_rounded, 'name': 'voice_chat_rounded'},
    {'icon': Icons.voice_chat_sharp, 'name': 'voice_chat_sharp'},
    {'icon': Icons.voice_over_off, 'name': 'voice_over_off'},
    {'icon': Icons.voice_over_off_outlined, 'name': 'voice_over_off_outlined'},
    {'icon': Icons.voice_over_off_rounded, 'name': 'voice_over_off_rounded'},
    {'icon': Icons.voice_over_off_sharp, 'name': 'voice_over_off_sharp'},
    {'icon': Icons.voicemail, 'name': 'voicemail'},
    {'icon': Icons.voicemail_outlined, 'name': 'voicemail_outlined'},
    {'icon': Icons.voicemail_rounded, 'name': 'voicemail_rounded'},
    {'icon': Icons.voicemail_sharp, 'name': 'voicemail_sharp'},
    {'icon': Icons.volume_down, 'name': 'volume_down'},
    {'icon': Icons.volume_down_outlined, 'name': 'volume_down_outlined'},
    {'icon': Icons.volume_down_rounded, 'name': 'volume_down_rounded'},
    {'icon': Icons.volume_down_sharp, 'name': 'volume_down_sharp'},
    {'icon': Icons.volume_mute, 'name': 'volume_mute'},
    {'icon': Icons.volume_mute_outlined, 'name': 'volume_mute_outlined'},
    {'icon': Icons.volume_mute_rounded, 'name': 'volume_mute_rounded'},
    {'icon': Icons.volume_mute_sharp, 'name': 'volume_mute_sharp'},
    {'icon': Icons.volume_off, 'name': 'volume_off'},
    {'icon': Icons.volume_off_outlined, 'name': 'volume_off_outlined'},
    {'icon': Icons.volume_off_rounded, 'name': 'volume_off_rounded'},
    {'icon': Icons.volume_off_sharp, 'name': 'volume_off_sharp'},
    {'icon': Icons.volume_up, 'name': 'volume_up'},
    {'icon': Icons.volume_up_outlined, 'name': 'volume_up_outlined'},
    {'icon': Icons.volume_up_rounded, 'name': 'volume_up_rounded'},
    {'icon': Icons.volume_up_sharp, 'name': 'volume_up_sharp'},
    {'icon': Icons.volunteer_activism, 'name': 'volunteer_activism'},
    {'icon': Icons.vpn_key, 'name': 'vpn_key'},
    {'icon': Icons.vpn_key_outlined, 'name': 'vpn_key_outlined'},
    {'icon': Icons.vpn_key_rounded, 'name': 'vpn_key_rounded'},
    {'icon': Icons.vpn_key_sharp, 'name': 'vpn_key_sharp'},
    {'icon': Icons.vpn_lock, 'name': 'vpn_lock'},
    {'icon': Icons.vpn_lock_outlined, 'name': 'vpn_lock_outlined'},
    {'icon': Icons.vpn_lock_rounded, 'name': 'vpn_lock_rounded'},
    {'icon': Icons.vpn_lock_sharp, 'name': 'vpn_lock_sharp'},
    {'icon': Icons.wallet_giftcard, 'name': 'wallet_giftcard'},
    {
      'icon': Icons.wallet_giftcard_outlined,
      'name': 'wallet_giftcard_outlined'
    },
    {'icon': Icons.wallet_giftcard_rounded, 'name': 'wallet_giftcard_rounded'},
    {'icon': Icons.wallet_giftcard_sharp, 'name': 'wallet_giftcard_sharp'},
    {'icon': Icons.wallet_membership, 'name': 'wallet_membership'},
    {
      'icon': Icons.wallet_membership_outlined,
      'name': 'wallet_membership_outlined'
    },
    {
      'icon': Icons.wallet_membership_rounded,
      'name': 'wallet_membership_rounded'
    },
    {'icon': Icons.wallet_membership_sharp, 'name': 'wallet_membership_sharp'},
    {'icon': Icons.wallet_travel, 'name': 'wallet_travel'},
    {'icon': Icons.wallet_travel_outlined, 'name': 'wallet_travel_outlined'},
    {'icon': Icons.wallet_travel_rounded, 'name': 'wallet_travel_rounded'},
    {'icon': Icons.wallet_travel_sharp, 'name': 'wallet_travel_sharp'},
    {'icon': Icons.wallpaper, 'name': 'wallpaper'},
    {'icon': Icons.wallpaper_outlined, 'name': 'wallpaper_outlined'},
    {'icon': Icons.wallpaper_rounded, 'name': 'wallpaper_rounded'},
    {'icon': Icons.wallpaper_sharp, 'name': 'wallpaper_sharp'},
    {'icon': Icons.warning, 'name': 'warning'},
    {'icon': Icons.warning_amber_outlined, 'name': 'warning_amber_outlined'},
    {'icon': Icons.warning_amber_rounded, 'name': 'warning_amber_rounded'},
    {'icon': Icons.warning_amber_sharp, 'name': 'warning_amber_sharp'},
    {'icon': Icons.warning_outlined, 'name': 'warning_outlined'},
    {'icon': Icons.warning_rounded, 'name': 'warning_rounded'},
    {'icon': Icons.warning_sharp, 'name': 'warning_sharp'},
    {'icon': Icons.wash, 'name': 'wash'},
    {'icon': Icons.wash_outlined, 'name': 'wash_outlined'},
    {'icon': Icons.wash_rounded, 'name': 'wash_rounded'},
    {'icon': Icons.wash_sharp, 'name': 'wash_sharp'},
    {'icon': Icons.watch, 'name': 'watch'},
    {'icon': Icons.watch_later, 'name': 'watch_later'},
    {'icon': Icons.watch_later_outlined, 'name': 'watch_later_outlined'},
    {'icon': Icons.watch_later_rounded, 'name': 'watch_later_rounded'},
    {'icon': Icons.watch_later_sharp, 'name': 'watch_later_sharp'},
    {'icon': Icons.watch_outlined, 'name': 'watch_outlined'},
    {'icon': Icons.watch_rounded, 'name': 'watch_rounded'},
    {'icon': Icons.watch_sharp, 'name': 'watch_sharp'},
    {'icon': Icons.water_damage, 'name': 'water_damage'},
    {'icon': Icons.water_damage_outlined, 'name': 'water_damage_outlined'},
    {'icon': Icons.water_damage_rounded, 'name': 'water_damage_rounded'},
    {'icon': Icons.water_damage_sharp, 'name': 'water_damage_sharp'},
    {'icon': Icons.waterfall_chart, 'name': 'waterfall_chart'},
    {'icon': Icons.waves, 'name': 'waves'},
    {'icon': Icons.waves_outlined, 'name': 'waves_outlined'},
    {'icon': Icons.waves_rounded, 'name': 'waves_rounded'},
    {'icon': Icons.waves_sharp, 'name': 'waves_sharp'},
    {'icon': Icons.wb_auto, 'name': 'wb_auto'},
    {'icon': Icons.wb_auto_outlined, 'name': 'wb_auto_outlined'},
    {'icon': Icons.wb_auto_rounded, 'name': 'wb_auto_rounded'},
    {'icon': Icons.wb_auto_sharp, 'name': 'wb_auto_sharp'},
    {'icon': Icons.wb_cloudy, 'name': 'wb_cloudy'},
    {'icon': Icons.wb_cloudy_outlined, 'name': 'wb_cloudy_outlined'},
    {'icon': Icons.wb_cloudy_rounded, 'name': 'wb_cloudy_rounded'},
    {'icon': Icons.wb_cloudy_sharp, 'name': 'wb_cloudy_sharp'},
    {'icon': Icons.wb_incandescent, 'name': 'wb_incandescent'},
    {
      'icon': Icons.wb_incandescent_outlined,
      'name': 'wb_incandescent_outlined'
    },
    {'icon': Icons.wb_incandescent_rounded, 'name': 'wb_incandescent_rounded'},
    {'icon': Icons.wb_incandescent_sharp, 'name': 'wb_incandescent_sharp'},
    {'icon': Icons.wb_iridescent, 'name': 'wb_iridescent'},
    {'icon': Icons.wb_iridescent_outlined, 'name': 'wb_iridescent_outlined'},
    {'icon': Icons.wb_iridescent_rounded, 'name': 'wb_iridescent_rounded'},
    {'icon': Icons.wb_iridescent_sharp, 'name': 'wb_iridescent_sharp'},
    {'icon': Icons.wb_shade, 'name': 'wb_shade'},
    {'icon': Icons.wb_sunny, 'name': 'wb_sunny'},
    {'icon': Icons.wb_sunny_outlined, 'name': 'wb_sunny_outlined'},
    {'icon': Icons.wb_sunny_rounded, 'name': 'wb_sunny_rounded'},
    {'icon': Icons.wb_sunny_sharp, 'name': 'wb_sunny_sharp'},
    {'icon': Icons.wb_twighlight, 'name': 'wb_twighlight'},
    {'icon': Icons.wc, 'name': 'wc'},
    {'icon': Icons.wc_outlined, 'name': 'wc_outlined'},
    {'icon': Icons.wc_rounded, 'name': 'wc_rounded'},
    {'icon': Icons.wc_sharp, 'name': 'wc_sharp'},
    {'icon': Icons.web, 'name': 'web'},
    {'icon': Icons.web_asset, 'name': 'web_asset'},
    {'icon': Icons.web_asset_outlined, 'name': 'web_asset_outlined'},
    {'icon': Icons.web_asset_rounded, 'name': 'web_asset_rounded'},
    {'icon': Icons.web_asset_sharp, 'name': 'web_asset_sharp'},
    {'icon': Icons.web_outlined, 'name': 'web_outlined'},
    {'icon': Icons.web_rounded, 'name': 'web_rounded'},
    {'icon': Icons.web_sharp, 'name': 'web_sharp'},
    {'icon': Icons.weekend, 'name': 'weekend'},
    {'icon': Icons.weekend_outlined, 'name': 'weekend_outlined'},
    {'icon': Icons.weekend_rounded, 'name': 'weekend_rounded'},
    {'icon': Icons.weekend_sharp, 'name': 'weekend_sharp'},
    {'icon': Icons.west, 'name': 'west'},
    {'icon': Icons.west_outlined, 'name': 'west_outlined'},
    {'icon': Icons.west_rounded, 'name': 'west_rounded'},
    {'icon': Icons.west_sharp, 'name': 'west_sharp'},
    {'icon': Icons.whatshot, 'name': 'whatshot'},
    {'icon': Icons.whatshot_outlined, 'name': 'whatshot_outlined'},
    {'icon': Icons.whatshot_rounded, 'name': 'whatshot_rounded'},
    {'icon': Icons.whatshot_sharp, 'name': 'whatshot_sharp'},
    {'icon': Icons.wheelchair_pickup, 'name': 'wheelchair_pickup'},
    {
      'icon': Icons.wheelchair_pickup_outlined,
      'name': 'wheelchair_pickup_outlined'
    },
    {
      'icon': Icons.wheelchair_pickup_rounded,
      'name': 'wheelchair_pickup_rounded'
    },
    {'icon': Icons.wheelchair_pickup_sharp, 'name': 'wheelchair_pickup_sharp'},
    {'icon': Icons.where_to_vote, 'name': 'where_to_vote'},
    {'icon': Icons.where_to_vote_outlined, 'name': 'where_to_vote_outlined'},
    {'icon': Icons.where_to_vote_rounded, 'name': 'where_to_vote_rounded'},
    {'icon': Icons.where_to_vote_sharp, 'name': 'where_to_vote_sharp'},
    {'icon': Icons.widgets, 'name': 'widgets'},
    {'icon': Icons.widgets_outlined, 'name': 'widgets_outlined'},
    {'icon': Icons.widgets_rounded, 'name': 'widgets_rounded'},
    {'icon': Icons.widgets_sharp, 'name': 'widgets_sharp'},
    {'icon': Icons.wifi, 'name': 'wifi'},
    {'icon': Icons.wifi_calling, 'name': 'wifi_calling'},
    {'icon': Icons.wifi_calling_outlined, 'name': 'wifi_calling_outlined'},
    {'icon': Icons.wifi_calling_rounded, 'name': 'wifi_calling_rounded'},
    {'icon': Icons.wifi_calling_sharp, 'name': 'wifi_calling_sharp'},
    {'icon': Icons.wifi_lock, 'name': 'wifi_lock'},
    {'icon': Icons.wifi_lock_outlined, 'name': 'wifi_lock_outlined'},
    {'icon': Icons.wifi_lock_rounded, 'name': 'wifi_lock_rounded'},
    {'icon': Icons.wifi_lock_sharp, 'name': 'wifi_lock_sharp'},
    {'icon': Icons.wifi_off, 'name': 'wifi_off'},
    {'icon': Icons.wifi_off_outlined, 'name': 'wifi_off_outlined'},
    {'icon': Icons.wifi_off_rounded, 'name': 'wifi_off_rounded'},
    {'icon': Icons.wifi_off_sharp, 'name': 'wifi_off_sharp'},
    {'icon': Icons.wifi_outlined, 'name': 'wifi_outlined'},
    {'icon': Icons.wifi_protected_setup, 'name': 'wifi_protected_setup'},
    {
      'icon': Icons.wifi_protected_setup_outlined,
      'name': 'wifi_protected_setup_outlined'
    },
    {
      'icon': Icons.wifi_protected_setup_rounded,
      'name': 'wifi_protected_setup_rounded'
    },
    {
      'icon': Icons.wifi_protected_setup_sharp,
      'name': 'wifi_protected_setup_sharp'
    },
    {'icon': Icons.wifi_rounded, 'name': 'wifi_rounded'},
    {'icon': Icons.wifi_sharp, 'name': 'wifi_sharp'},
    {'icon': Icons.wifi_tethering, 'name': 'wifi_tethering'},
    {'icon': Icons.wifi_tethering_outlined, 'name': 'wifi_tethering_outlined'},
    {'icon': Icons.wifi_tethering_rounded, 'name': 'wifi_tethering_rounded'},
    {'icon': Icons.wifi_tethering_sharp, 'name': 'wifi_tethering_sharp'},
    {'icon': Icons.wine_bar, 'name': 'wine_bar'},
    {'icon': Icons.wine_bar_outlined, 'name': 'wine_bar_outlined'},
    {'icon': Icons.wine_bar_rounded, 'name': 'wine_bar_rounded'},
    {'icon': Icons.wine_bar_sharp, 'name': 'wine_bar_sharp'},
    {'icon': Icons.work, 'name': 'work'},
    {'icon': Icons.work_off, 'name': 'work_off'},
    {'icon': Icons.work_off_outlined, 'name': 'work_off_outlined'},
    {'icon': Icons.work_off_rounded, 'name': 'work_off_rounded'},
    {'icon': Icons.work_off_sharp, 'name': 'work_off_sharp'},
    {'icon': Icons.work_outline, 'name': 'work_outline'},
    {'icon': Icons.work_outline_outlined, 'name': 'work_outline_outlined'},
    {'icon': Icons.work_outline_rounded, 'name': 'work_outline_rounded'},
    {'icon': Icons.work_outline_sharp, 'name': 'work_outline_sharp'},
    {'icon': Icons.work_outlined, 'name': 'work_outlined'},
    {'icon': Icons.work_rounded, 'name': 'work_rounded'},
    {'icon': Icons.work_sharp, 'name': 'work_sharp'},
    {'icon': Icons.workspaces_filled, 'name': 'workspaces_filled'},
    {'icon': Icons.workspaces_outline, 'name': 'workspaces_outline'},
    {'icon': Icons.wrap_text, 'name': 'wrap_text'},
    {'icon': Icons.wrap_text_outlined, 'name': 'wrap_text_outlined'},
    {'icon': Icons.wrap_text_rounded, 'name': 'wrap_text_rounded'},
    {'icon': Icons.wrap_text_sharp, 'name': 'wrap_text_sharp'},
    {'icon': Icons.wrong_location, 'name': 'wrong_location'},
    {'icon': Icons.wrong_location_outlined, 'name': 'wrong_location_outlined'},
    {'icon': Icons.wrong_location_rounded, 'name': 'wrong_location_rounded'},
    {'icon': Icons.wrong_location_sharp, 'name': 'wrong_location_sharp'},
    {'icon': Icons.wysiwyg, 'name': 'wysiwyg'},
    {'icon': Icons.wysiwyg_outlined, 'name': 'wysiwyg_outlined'},
    {'icon': Icons.wysiwyg_rounded, 'name': 'wysiwyg_rounded'},
    {'icon': Icons.wysiwyg_sharp, 'name': 'wysiwyg_sharp'},
    {'icon': Icons.youtube_searched_for, 'name': 'youtube_searched_for'},
    {
      'icon': Icons.youtube_searched_for_outlined,
      'name': 'youtube_searched_for_outlined'
    },
    {
      'icon': Icons.youtube_searched_for_rounded,
      'name': 'youtube_searched_for_rounded'
    },
    {
      'icon': Icons.youtube_searched_for_sharp,
      'name': 'youtube_searched_for_sharp'
    },
    {'icon': Icons.zoom_in, 'name': 'zoom_in'},
    {'icon': Icons.zoom_in_outlined, 'name': 'zoom_in_outlined'},
    {'icon': Icons.zoom_in_rounded, 'name': 'zoom_in_rounded'},
    {'icon': Icons.zoom_in_sharp, 'name': 'zoom_in_sharp'},
    {'icon': Icons.zoom_out, 'name': 'zoom_out'},
    {'icon': Icons.zoom_out_map, 'name': 'zoom_out_map'},
    {'icon': Icons.zoom_out_map_outlined, 'name': 'zoom_out_map_outlined'},
    {'icon': Icons.zoom_out_map_rounded, 'name': 'zoom_out_map_rounded'},
    {'icon': Icons.zoom_out_map_sharp, 'name': 'zoom_out_map_sharp'},
    {'icon': Icons.zoom_out_outlined, 'name': 'zoom_out_outlined'},
    {'icon': Icons.zoom_out_rounded, 'name': 'zoom_out_rounded'},
    {'icon': Icons.zoom_out_sharp, 'name': 'zoom_out_sharp'},
  ];
}
