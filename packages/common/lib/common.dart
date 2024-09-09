library common;

import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/enum/church_service_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logging/logging.dart';
import 'package:go_router/go_router.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
//import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:upgrader/upgrader.dart';

part 'class/break_point.dart';
part 'class/string_to_color.dart';
part 'class/country_code_item.dart';

part 'error/no_internet_connection_screen.dart';
part 'error/no_route_screen.dart';
part 'error/flutter_error_widget.dart';

part 'exception/failure.dart';
part 'exception/mixin/dio_exception_mixin.dart';

/// extensions
part 'extensions/provider_cache.dart';
part 'extensions/string_hardcoded.dart';
part 'extensions/string_to_bool.dart';
part 'extensions/date_time_formatter.dart';
part 'extensions/text_theme.dart';
part 'extensions/color_theme.dart';
part 'extensions/translations.dart';
part 'extensions/string_to_snake_case.dart';
part 'extensions/string_extension.dart';
part 'extensions/go_router_extension.dart';
part 'extensions/church_service_type.dart';
part 'extensions/dark_mode.dart';
part 'extensions/user_guild_extension.dart';

part 'logging/logger_provider.dart';
part 'logging/logging_provider.dart';

part 'mixin/input_phone_formatter_mixin.dart';
part 'mixin/input_validation_mixin.dart';
part 'mixin/loading_overlay.dart';
part 'mixin/sliver_progress_indicator.dart';

part 'enum/stock_status.dart';
part 'enum/product_type.dart';
part 'enum/gender.dart';
part 'enum/order_status.dart';
part 'enum/toast_type.dart';
part 'enum/error/cart_user_input_error_type.dart';
part 'enum/notification_status.dart';
part 'enum/notification_type.dart';
part 'enum/media_type.dart';
part 'enum/user_role.dart';
part 'enum/user_guild.dart';

part 'providers/cache_manager_provider.dart';
part 'providers/currency_code_provider.dart';
//part 'providers/internet_connection_observer.dart';
part 'providers/scroll_controller_povider.dart';
part 'providers/ui_date_time_formater.dart';
part 'providers/api_date_time_formater.dart';
part 'providers/time_zone_provider.dart';

part 'styles/dimens.dart';

part 'widget/checkbox/check_box_widget.dart';
part 'widget/responsive/responsive_center_box.dart';
part 'widget/app_scaffold.dart';
part 'widget/app_scaffold_scrollable.dart';
part 'widget/app_scaffold_scrollable_center.dart';
part 'widget/app_scaffold_sliver.dart';
part 'widget/async_value_widget.dart';
part 'widget/cache_image.dart';
part 'widget/product_price_widget.dart';
part 'widget/widget_key.dart';
part 'widget/button/primary_button.dart';
part 'widget/button/sales_product_button.dart';
part 'widget/button/new_product_button.dart';
part 'widget/form/custom_text_form_field.dart';
part 'widget/dialog/confirm_dialog.dart';
part 'widget/dialog/error_dialog.dart';
part 'upgrader/custom_upgrader_message.dart';
part 'widget/main_app_scaffold_sliver.dart';
part 'widget/main_app_scaffold.dart';
part 'widget/main_app_drawer.dart';
part 'widget/dialog/success_dialog.dart';
part 'widget/loading/base_loading_indicator.dart';
part 'widget/status/order_status_widget.dart';
part 'widget/toast/base_toast.dart';
part 'upgrader/upgrader_translation_messages.dart';

part 'localization/app_localizations.dart';

part 'animation/tag.dart';
part 'animation/animation.dart';

/// Theme
part 'theme/colors.dart';

part 'utils/countries.dart';
