import 'package:flutter_application_new_card/data/repositories/bank_card_repository_impl.dart';
import 'package:flutter_application_new_card/domain/enities/bank_card.dart';
import 'package:flutter_application_new_card/domain/repositories/employee_repositiry.dart';

class GetCardsUsecase {
  GetCardsUsecase();
  Future<List<BankCardEntity>> execute() async {
    return await BankCardRepositoryImpl().getCards();
  }
}
