library dashboard;

import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/dashboard/presentation/state/dashboard_state.dart';
import 'package:account/presentation/controller/account_controller.dart';

part 'features/dashboard/presentation/controller/dashboard_controller.dart';

part 'features/dashboard/presentation/ui/dashboard_screen.dart';
part 'features/dashboard/presentation/ui/widget/bottom_navigation_widget.dart';
part 'features/dashboard/presentation/ui/widget/cart_badge_widget.dart';
part 'features/dashboard/presentation/ui/widget/scroll_to_hide.dart';
