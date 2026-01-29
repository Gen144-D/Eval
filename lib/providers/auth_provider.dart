import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import '../services/mock_auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  late SharedPreferences _prefs;

  bool _isLoading = false;
  String? _token;
  Map<String, dynamic>? _user;
  String? _error;
  bool _useMockAuth = false; // Set to true to use mock auth without backend

  bool get isLoading => _isLoading;
  String? get token => _token;
  Map<String, dynamic>? get user => _user;
  String? get error => _error;
  bool get isAuthenticated => _token != null;
  bool get useMockAuth => _useMockAuth;

  AuthProvider() {
    _init();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    _token = _prefs.getString('token');
    final userJson = _prefs.getString('user');
    if (userJson != null) {
      // Parse user JSON if needed
    }
  }

  Future<bool> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String role,
    String? studentId,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      Map<String, dynamic> response;

      if (_useMockAuth) {
        // Use mock auth for testing without backend
        response = await MockAuthService.register(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          role: role,
          studentId: studentId,
        );
      } else {
        // Use real backend API
        response = await _apiService.post(
          '/auth/register',
          data: {
            'email': email,
            'password': password,
            'first_name': firstName,
            'last_name': lastName,
            'role': role,
            'student_id': studentId,
          },
        );
      }

      _token = response['token'];
      _user = response['user'];
      await _prefs.setString('token', _token!);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      Map<String, dynamic> response;

      if (_useMockAuth) {
        // Use mock auth for testing without backend
        response = await MockAuthService.login(
          email: email,
          password: password,
        );
      } else {
        // Use real backend API
        response = await _apiService.post(
          '/auth/login',
          data: {'email': email, 'password': password},
        );
      }

      _token = response['token'];
      _user = response['user'];
      await _prefs.setString('token', _token!);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _token = null;
    _user = null;
    await MockAuthService.logout();
    await _prefs.remove('token');
    await _prefs.remove('user');
    notifyListeners();
  }

  Future<void> getCurrentUser() async {
    try {
      if (_useMockAuth) {
        _user = await MockAuthService.getCurrentUser();
      } else {
        final response = await _apiService.get('/auth/me');
        _user = response;
      }
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  /// Enable mock authentication for testing without backend
  void enableMockAuth() {
    _useMockAuth = true;
    notifyListeners();
  }

  /// Disable mock authentication and use real backend
  void disableMockAuth() {
    _useMockAuth = false;
    notifyListeners();
  }}