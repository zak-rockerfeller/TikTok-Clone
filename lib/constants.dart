import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:nest_reels/controllers/controllers.dart';
import 'package:nest_reels/views/screens/screens.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  const HotScreen(),
  ProfileScreen(uid: authController.user.uid),
];

// COLORS
const backgroundColor = Color(0xFF3F4349);
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;
const Color nestBlue = Color(0xFF0757AC);

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;

//PHP API END-POINTS
const baseUrl = 'https://nest-keja.com/Nest/backend/public/api';
//Home Page Nests
const hotelsUrl = '$baseUrl/hotels';
const hdUrl = '$baseUrl/hd';

///---------Errors---------////
const serverError = "Internet connection lost";
const unauthorized = "Unauthorized";
const somethingWentWrong = "Something went wrong, try again";
