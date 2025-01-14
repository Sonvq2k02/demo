// lib/providers/auth_provider.dart

import 'package:demo_app/models/book.dart';
import 'package:demo_app/models/services/books_api_service.dart';
import 'package:demo_app/screens/loginVSregister/login_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usernameProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final isLoadingProvider = StateProvider<bool>((ref) => false);
final authServiceProvider = Provider((ref) => AuthService());
