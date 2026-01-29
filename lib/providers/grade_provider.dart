import 'package:flutter/material.dart';
import '../services/api_service.dart';

class GradeProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<dynamic> _grades = [];
  bool _isLoading = false;
  String? _error;

  List<dynamic> get grades => _grades;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getStudentGrades(int studentId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.get('/grades/student/$studentId');
      if (response is List) {
        _grades = response;
      } else {
        _grades = [response];
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> uploadGrades({
    required List<Map<String, dynamic>> gradesData,
    required String semester,
    required String academicYear,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _apiService.post(
        '/grades/upload',
        data: {
          'grades_data': gradesData,
          'semester': semester,
          'academic_year': academicYear,
        },
      );
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

  Future<Map<String, dynamic>?> checkPrerequisites(
    int studentId,
    int courseId,
  ) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response =
          await _apiService.get(
                '/evaluation/prerequisites/$studentId/$courseId',
              )
              as Map<String, dynamic>;
      _isLoading = false;
      notifyListeners();
      return response;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
