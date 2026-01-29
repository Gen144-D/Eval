import 'package:shared_preferences/shared_preferences.dart';

/// Mock Authentication Service for Testing
/// Use this when backend is not available
class MockAuthService {
  static const String _tokenKey = 'mock_token';
  static const String _userKey = 'mock_user';

  // Pre-created test accounts
  static const Map<String, String> _testAccounts = {
    'student@test.com': 'password123',
    'instructor@test.com': 'password123',
    'admin@test.com': 'password123',
  };

  static final Map<String, dynamic> _testUsers = {
    'student@test.com': {
      'id': '1',
      'email': 'student@test.com',
      'first_name': 'John',
      'last_name': 'Student',
      'role': 'student',
      'student_id': 'STU001',
    },
    'instructor@test.com': {
      'id': '2',
      'email': 'instructor@test.com',
      'first_name': 'Jane',
      'last_name': 'Instructor',
      'role': 'instructor',
    },
    'admin@test.com': {
      'id': '3',
      'email': 'admin@test.com',
      'first_name': 'Admin',
      'last_name': 'User',
      'role': 'admin',
    },
  };

  /// Login with mock credentials
  /// Test accounts:
  /// - student@test.com / password123
  /// - instructor@test.com / password123
  /// - admin@test.com / password123
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    ); // Simulate network delay

    if (!_testAccounts.containsKey(email)) {
      throw Exception('Account not found');
    }

    if (_testAccounts[email] != password) {
      throw Exception('Invalid password');
    }

    final user = _testUsers[email]!;
    final token =
        'mock_token_${email}_${DateTime.now().millisecondsSinceEpoch}';

    // Save to preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userKey, email);

    return {
      'token': token,
      'user': user,
      'message': 'Login successful (MOCK MODE)',
    };
  }

  /// Register with mock service
  static Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String role,
    String? studentId,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    ); // Simulate network delay

    if (_testAccounts.containsKey(email)) {
      throw Exception('Account already exists');
    }

    if (password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }

    // Add new test account
    _testAccounts[email] = password;
    _testUsers[email] = {
      'id': '${_testUsers.length + 1}',
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
      if (role == 'student')
        'student_id': studentId ?? 'STU${_testUsers.length + 1}',
    };

    final token =
        'mock_token_${email}_${DateTime.now().millisecondsSinceEpoch}';

    // Save to preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userKey, email);

    return {
      'token': token,
      'user': _testUsers[email],
      'message': 'Registration successful (MOCK MODE)',
    };
  }

  /// Get currently logged in user
  static Future<Map<String, dynamic>?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_userKey);

    if (email == null) {
      return null;
    }

    return _testUsers[email];
  }

  /// Get current token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }

  /// Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_tokenKey);
  }
}
