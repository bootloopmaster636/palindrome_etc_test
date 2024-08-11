bool palindromeChecker(String str) {
  str = str.toLowerCase().replaceAll(' ', '');
  final reversed = str.split('').reversed.join('');
  return str == reversed;
}
