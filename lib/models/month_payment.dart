class MonthlyCreditPayment {
  final double amount;
  final double fee;

  MonthlyCreditPayment({required num amount, required num fee})
      : amount = amount.toDouble(),
        fee = fee.toDouble();
}
