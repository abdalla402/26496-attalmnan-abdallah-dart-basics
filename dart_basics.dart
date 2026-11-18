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

void drawTriangle(int height) {
  // by A.A.A.
  if (height <= 0) return;

  for (int row = 1; row <= height; row++) {
    String spaces = ' ' * (height - row);
    String symbol = row.isOdd ? '*' : '#';
    print('$spaces${symbol * row}');
  }
}

int momoFee(int amount) {
  // by A.A.A.
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by A.A.A.
  if (phone.length != 10) return 'INVALID';

  String firstThree = phone.substring(0, 3);
  String lastTwo = phone.substring(8);
  String maskedMiddle = '';
  int idx = 3;
  while (idx < 8) {
    maskedMiddle += '*';
    idx++;
  }
  return '$firstThree$maskedMiddle$lastTwo';
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

  // C5: Right-aligned triangle
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2: MoMo receipt printer (using while loop)
  int i = 1;
  int totalFees = 0;
  String phone = '0788123456';
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}