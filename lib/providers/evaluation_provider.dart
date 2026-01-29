import 'package:flutter/material.dart';
import '../services/api_service.dart';

class EvaluationProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<dynamic> _recommendations = [];
  bool _isLoading = false;
  String? _error;
  Map<String, dynamic>? _evaluation;

  List<dynamic> get recommendations => _recommendations;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Map<String, dynamic>? get evaluation => _evaluation;

  Future<void> evaluateStudent(int studentId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.post(
        '/evaluation/evaluate/$studentId',
        data: {},
      );
      _evaluation = response;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getRecommendations(int studentId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.get('/recommendations/$studentId');
      if (response is List) {
        _recommendations = response;
      } else {
        _recommendations = [response];
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> generateRecommendations(int studentId, int evaluationId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.post(
        '/recommendations/generate/$studentId',
        data: {'evaluation_id': evaluationId},
      );
      if (response is Map && response['recommendations'] != null) {
        _recommendations = response['recommendations'];
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
