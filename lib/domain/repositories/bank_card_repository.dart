import 'package:flutter_application_new_card/domain/enities/bank_card.dart';

abstract class BankCardRepository{

  Future addCard(BankCardEntity bankCardEntity);
   Future editCard(BankCardEntity bankCardEntity);
    Future deleteCard(String id);

    Future<List<BankCardEntity>> getCards();

  Future<BankCardEntity> getCardById(String id);
}