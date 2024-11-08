import 'dart:io';

import 'package:flutter/material.dart';
import 'package:love_bird/chatBot/chatbot_welcome.dart';
import 'package:love_bird/createAccount/create_account1.dart';
import 'package:love_bird/createAccount/forgot/forgot.dart';
import 'package:love_bird/createAccount/forgot/newPassword.dart';
import 'package:love_bird/createAccount/forgot/otp.dart';
import 'package:love_bird/createAccount/interest.dart';
import 'package:love_bird/createAccount/distance_preference.dart';
import 'package:love_bird/createAccount/nickname.dart';
import 'package:love_bird/createAccount/choose_gender.dart';
import 'package:love_bird/createAccount/photoVerification/photoVerificationOne.dart';
import 'package:love_bird/createAccount/relationship.dart';
import 'package:love_bird/createAccount/upload_six_photo.dart';
import 'package:love_bird/createAccount/verify.dart';
import 'package:love_bird/homeScreen/homeScreen.dart';
import 'package:love_bird/onboarding/firstScreen.dart';
import 'package:love_bird/onboarding/slidable.dart';
import 'package:love_bird/sign/login_page.dart';
import 'package:love_bird/sign/sign.dart';

// Define route names as constants

const createAccountRoute = "/createAccount";
const verifyEmailRoute = "/verifyEmail";
const signUpRoute = "/signUp";
const firstScreen = "/firstScreen";
const slideableOnboardingScreen = "/slideableOnboardingScreen";
const loginPage = "/loginPage";
const homeScreen = "/homeScreen";
const forgotPassword = "/ForgotPassword";
const oTPVerificationPage = "/oTPVerificationPage";
const newPassword = "/newPassword";
const captchaVerificationPage = "/captchaVerificationPage";
const createNickname = "/createNickname";
const celebrateYouScreen = '/celebrateYouScreen';
const gender = "/gender";
const relationshipGoalsScreen = "/relationshipGoalsScreen";
const distancePreferenceScreen = "/distancePreferenceScreen";
const interestsSelectionScreen = "/ nterestsSelectionScreen";
const findingPeople = "/findingPeople";
const uploadPicturesScreen = "/uploadPicturesScreen";
const photoVerificationOne = "/PhotoVerificationOne";
const chatbotWelcomeScreen = "/chatbotWelcomeScreen";

// Map each route to the respective widget
final routes = <String, Widget Function(BuildContext)>{
  createAccountRoute: (_) => const CreateAcc1(),
  verifyEmailRoute: (_) => const EmailVerificationPage(),
  signUpRoute: (_) => const SignUpScreen(),
  firstScreen: (_) => const FirstScreen(),
  slideableOnboardingScreen: (_) => const SlideableOnboardingScreen(),
  loginPage: (_) => const LoginPage(),
  homeScreen: (_) => const HomeScreen(),
  forgotPassword: (_) => const ForgotPassword(),
  oTPVerificationPage: (_) => const OTPVerificationPage(),
  newPassword: (_) => const NewPassword(),
  captchaVerificationPage: (_) => const CaptchaVerificationPage(),
  createNickname: (_) => const CreateNickname(),
  celebrateYouScreen: (_) => const CelebrateYouScreen(),
  gender: (_) => const Gender(),
  relationshipGoalsScreen: (_) => const RelationshipGoalsScreen(),
  distancePreferenceScreen: (_) => const DistancePreferenceScreen(),
  interestsSelectionScreen: (_) => const InterestsSelectionScreen(),
  uploadPicturesScreen: (_) => const UploadPicturesScreen(),
  chatbotWelcomeScreen: (_) => const ChatbotWelcomeScreen(),
};

void navigateToPhotoVerificationOne(BuildContext context, List<File?> images) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PhotoVerificationOne(images: images),
    ),
  );
}
