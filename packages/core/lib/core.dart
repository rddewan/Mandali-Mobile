library core;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:analytic/analytic.dart';
import 'package:common/common.dart';
import 'package:common/dto/refresh_token_response.dart';
import 'package:common/exception/status_code.dart';
import 'package:core/env/env.dart';
import 'package:core/local/db/entity/setting_entity.dart';
import 'package:core/local/db/isar_db.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'env/env_reader.dart';
part 'flavor/flavor.dart';

part 'firebase/auth/firebase_auth_provider.dart';
part 'firebase/crashlytics/crashlytics.dart';
part 'firebase/crashlytics/firebase_crashlytics_provider.dart';
part 'firebase/performance/firebase_performance_provider.dart';
part 'firebase/performance/performance.dart';
part 'firebase/remote_config/firebase_remote_config_provider.dart';
part 'firebase/remote_config/remote_config.dart';

part 'local/secure_storage/flutter_secure_storage_provider.dart';
part 'local/secure_storage/isecure_storage.dart';
part 'local/secure_storage/secure_storage_const.dart';
part 'local/secure_storage/secure_storage.dart';

part 'providers/app_background_state_provider.dart';
part 'providers/flavor_provider.dart';
part 'providers/setting_provider.dart';

part 'remote/network_service.dart';
part 'remote/network_service_interceptor.dart';

part 'route/go_router_notifier.dart';
part 'route/route_observer_provider.dart';
