class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}

// void main() {
//   try {
//     throwException();
//   } on CustomException {
// //    print("custom exception is been obtained");
//   }
// }

// throwException() {
//   throw new CustomException('This is my first custom exception');
// }
