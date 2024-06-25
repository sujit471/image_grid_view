import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/model.dart';
import '../services/photo_service.dart';

class PhotoProvider with ChangeNotifier {
  List<Photo> _photos = [];
  bool _isLoading = true;

  List<Photo> get photos => _photos;
  bool get isLoading => _isLoading;

  PhotoProvider() {
    // Call _fetchPhotos() in the constructor to fetch photos on initialization
    _fetchPhotos();
  }

  Future<void> _fetchPhotos() async {
    try {
      // Fetch photos using PhotoService
      List<Photo> fetchedPhotos = await PhotoService.fetchPhotos();

      // Update _photos and isLoading
      _photos = fetchedPhotos;
      _isLoading = false;

      // Notify listeners that the state has changed
      notifyListeners();
    } catch (e) {
      print('Error fetching photos: $e');
      _isLoading = false;
      // Notify listeners even in case of error, if you want to handle UI updates
      notifyListeners();
    }
  }
}
