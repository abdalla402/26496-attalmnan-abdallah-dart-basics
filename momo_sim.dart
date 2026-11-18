// Student: Abdallah Awad Attalmnan
// Reg no: 26496
const String regNo = '26496';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by A.A.A.
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by A.A.A.
  bool isNegative = amount < 0;
  String digits = (isNegative ? -amount : amount).toString();
  String formatted = '';
  int count = 0;
  int i = digits.length - 1;

  while (i >= 0) {
    formatted = digits[i] + formatted;
    count++;
    if (count % 3 == 0 && i > 0) {
      formatted = ',$formatted';
    }
    i--;
  }

  return '${isNegative ? '-' : ''}$formatted RWF';
}

bool isValidPin(String pin) {
  // by A.A.A.
  if (pin.length != 5) return false;
  if (pin == '12345') return false;

  int i = 0;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) {
      return false;
    }
    i++;
  }

  bool allSame = true;
  int j = 1;
  while (j < pin.length) {
    if (pin[j] != pin[0]) {
      allSame = false;
      break;
    }
    j++;
  }
  if (allSame) return false;

  return true;
}

int sendMoney(int balance, int amount) {
  // by A.A.A.
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - (amount + fee);
  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by A.A.A.
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;
  print(
    'Bought ${formatRwf(amount)} airtime. New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

void main() {
  print('Reg no: $regNo | D=$d | T=$t');

  // 1. PIN validation checks
  print('12345 -> ${isValidPin('12345')}');
  print('77777 -> ${isValidPin('77777')}');
  print('4821 -> ${isValidPin('4821')}');
  print('48a21 -> ${isValidPin('48a21')}');
  print('4821$d -> ${isValidPin('4821$d')}');

  // 2. Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. Transactions in order
  int sendAmount = (d + 1) * 3000;
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. Final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5. Additional test cases (including edge cases)
  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(-1000000)); // Expected: -1,000,000 RWF
  print(isValidPin('00000')); // Expected: false (all digits same)
  print(isValidPin('12345 ')); // Expected: false (trailing space -> length 6)
  print(isValidPin('90817')); // Expected: true
}