import 'package:book_rental_app/core/errors/api_error_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class ApiErrorHundler {
  static ApiErrorModel apiHundle(dynamic e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.cancel:
          return ApiErrorModel(
            errorMessage: "The request was cancelled before being sent.",
          );

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            errorMessage:
                "Connection to the server timed out. Please try again later.",
          );

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            errorMessage: "Sending data took too long. Please try again.",
          );

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            errorMessage: "The app couldn't receive data in time.",
          );

        case DioExceptionType.badCertificate:
          return ApiErrorModel(
            errorMessage:
                "There is a problem with the server's security certificate.",
          );

        case DioExceptionType.badResponse:
          return errorHundle(e.response?.data);

        case DioExceptionType.connectionError:
          return ApiErrorModel(
            errorMessage:
                "Please check your internet connection and try again.",
          );

        case DioExceptionType.unknown:
          return ApiErrorModel(
            errorMessage: "An unexpected error occurred. Please try again.",
          );
      }
    } else {
      return ApiErrorModel(errorMessage: "Unknown error occurred");
    }
  }

  static ApiErrorModel errorHundle(dynamic data) {
    return ApiErrorModel(errorMessage: data.toString());
  }

  static ApiErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case "too-many-requests":
            return ApiErrorModel(
              errorMessage:
                  "This device has been temporarily blocked. Please try again later.",
            );
          case 'invalid-credential':
            return ApiErrorModel(
              errorMessage:
                  "There is an issue with the login credentials: they may be incorrect, expired, or the password is weak.",
            );
          case 'operation-not-allowed':
            return ApiErrorModel(
              errorMessage:
                  "Google Sign-In is not enabled in your Firebase settings.",
            );
          case 'account-exists-with-different-credential':
            return ApiErrorModel(
              errorMessage:
                  "An account already exists with this email using a different sign-in method.",
            );
          case 'invalid-email':
            return ApiErrorModel(
              errorMessage: "The email address is not valid.",
            );
          case 'user-disabled':
            return ApiErrorModel(
              errorMessage: "This user account has been disabled.",
            );
          case 'user-not-found':
            return ApiErrorModel(
              errorMessage: "No account found with this email.",
            );
          case 'wrong-password':
            return ApiErrorModel(errorMessage: "The password is incorrect.");
          case 'email-already-in-use':
            return ApiErrorModel(errorMessage: "This email is already in use.");
          case 'weak-password':
            return ApiErrorModel(errorMessage: "The password is too weak.");
          case 'network-request-failed':
            return ApiErrorModel(
              errorMessage:
                  "Please check your internet connection and try again.",
            );
          case 'invalid-verification-code':
            return ApiErrorModel(
              errorMessage: "The verification code is incorrect.",
            );
          case 'invalid-verification-id':
            return ApiErrorModel(
              errorMessage: "The verification ID is invalid.",
            );
          case 'credential-already-in-use':
            return ApiErrorModel(
              errorMessage: "These credentials are already in use.",
            );
          case 'requires-recent-login':
            return ApiErrorModel(
              errorMessage:
                  "Recent login is required to perform this operation.",
            );
          case 'user-mismatch':
            return ApiErrorModel(
              errorMessage:
                  "The provided credentials do not match the current user.",
            );
          case 'expired-action-code':
            return ApiErrorModel(errorMessage: "The action code has expired.");
          case 'invalid-action-code':
            return ApiErrorModel(errorMessage: "The action code is invalid.");
          case 'session-expired':
            return ApiErrorModel(
              errorMessage: "The session has expired. Please try again.",
            );
          case 'missing-verification-code':
            return ApiErrorModel(
              errorMessage: "The verification code was not entered.",
            );
          case 'internal-error':
            return ApiErrorModel(
              errorMessage: "An internal error occurred. Please try again.",
            );
          case 'sign_in_failed':
            return ApiErrorModel(
              errorMessage: "Sign-in failed. Please try again.",
            );
          default:
            return ApiErrorModel(
              errorMessage:
                  "An unexpected error occurred. Please try again later.",
            );
        }
      } else if (e is PlatformException) {
        final code = e.code;
        final details = e.details?.toString();
        final message = e.message ?? '';
        if (code == 'network_error ' ||
            message.contains('7:') ||
            details == '7') {
          return ApiErrorModel(
            errorMessage:
                "Failed to connect to the server (check your internet connection).",
          );
        } else if (details == '8') {
          return ApiErrorModel(
            errorMessage: "Unknown service name (DNS issue).",
          );
        } else if (details == '101') {
          return ApiErrorModel(
            errorMessage:
                "Network unavailable (no Wi-Fi or mobile data connection).",
          );
        } else if (details == '110') {
          return ApiErrorModel(
            errorMessage: "Connection timeout (server did not respond).",
          );
        } else if (details == '111') {
          return ApiErrorModel(
            errorMessage:
                "Server refused the connection (might be unavailable).",
          );
        } else if (details == '113') {
          return ApiErrorModel(
            errorMessage: "No route to server (network issues).",
          );
        } else if (details == '-2') {
          return ApiErrorModel(
            errorMessage: "Temporary failure in name resolution (DNS error).",
          );
        } else if (details == 'ERROR_NETWORK_REQUEST_FAILED' || code.isEmpty) {
          return ApiErrorModel(
            errorMessage:
                "Failed to connect to the server (check your internet connection).",
          );
        }
      }
    }

    return ApiErrorModel(errorMessage: e.toString());
  }
}
