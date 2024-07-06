import 'package:equatable/equatable.dart';

class BankCardEntity extends Equatable {
  final String cardNumber;
  final String expireDate;
  final String cardName;

  const BankCardEntity(
      {required this.cardName,
      required this.cardNumber,
      required this.expireDate});

  BankCardEntity copyWith(
      {String? cardNumber, String? expireDate, String? cardName}) {
    return BankCardEntity(
        cardName: cardName ?? this.cardName,
        cardNumber: cardNumber ?? this.cardNumber,
        expireDate: expireDate ?? this.expireDate);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [cardNumber, cardName ,expireDate];
}
