class BankAccount {
  String accountId;
  double balance;

  // 1st constructor
  BankAccount(this.accountId, this.balance);
  // 2nd constructor
  BankAccount.withZeroBalance(this.accountId) : balance = 0;

  bool withdraw(double amount) {
    if (amount <= 0) {
      print('Error: Withdrawal amount must be positive');
      return false;
    }

    if (amount > balance) {
      print('Error: Insufficient balance');
      return false;
    }

    balance -= amount;
    return true;
  }

  void deposit(double amount) {
    if (amount <= 0) {
      print('Error: Deposit amount must be positive');
      return;
    }
    balance += amount;
  }

  void displayAccountInfo() {
    print('Account ID: $accountId');
    print('Current Balance: \$${balance.toStringAsFixed(2)}');
  }
}

void main() {
  var account1 = BankAccount('ACC1', 1000);
  var account2 = BankAccount.withZeroBalance('ACC2');

  print('Initial account states:');
  print('\nAccount 1:');
  account1.displayAccountInfo();
  print('\nAccount 2:');
  account2.displayAccountInfo();

  print('\nTesting deposits:');
  account1.deposit(500);
  account2.deposit(1000);
  account1.deposit(-100); 

  print('\nAfter deposits:');
  print('\nAccount 1:');
  account1.displayAccountInfo();
  print('\nAccount 2:');
  account2.displayAccountInfo();

  print('\nTesting withdrawals:');
  account1.withdraw(300);
  account2.withdraw(2000); 
  account1.withdraw(-50); 

  print('\nFinal account states:');
  print('\nAccount 1:');
  account1.displayAccountInfo();
  print('\nAccount 2:');
  account2.displayAccountInfo();
}
