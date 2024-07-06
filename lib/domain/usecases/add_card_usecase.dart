import 'package:flutter_application_new_card/data/repositories/bank_card_repository_impl.dart';
import 'package:flutter_application_new_card/domain/enities/bank_card.dart';

class AddCardUsecase {


  Future execute(BankCardEntity bankCardEntity)async
  {
    return await BankCardRepositoryImpl().addCard(bankCardEntity);
  }

}