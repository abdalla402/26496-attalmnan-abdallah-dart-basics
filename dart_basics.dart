// Student: Abdallah Awad Attalmnan
// Reg no: 26496
const String regNo = '26496';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by A.A.A.
  String lower = text.toLowerCase();
  int count = 0;
  for (int i = 0; i < lower.length; i++) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
  }
  return count;
}

String initials(String fullName) {
  // by A.A.A.
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';

  List<String> parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  for (int i = 0; i < parts.length; i++) {
    result += '${parts[i][0].toUpperCase()}.';
  }
  return result;
}

void main() {
  print('Reg no: $regNo | D=$d | T=$t');

  // B2: Count vowels in full name
  String fullName = 'Abdallah Awad Attalmnan';
  print('$fullName has ${countVowels(fullName)} vowels');

  // B3: Initials tests
  print(initials(fullName));
  print(initials('  ana   uwase  '));
  print(initials('   '));
}