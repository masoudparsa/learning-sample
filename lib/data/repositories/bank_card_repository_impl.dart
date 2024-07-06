import 'package:flutter_application_new_card/core/constant/consts.dart';
import 'package:flutter_application_new_card/domain/enities/bank_card.dart';
import 'package:flutter_application_new_card/domain/repositories/bank_card_repository.dart';

class BankCardRepositoryImpl extends BankCardRepository {
  @override
  Future addCard(BankCardEntity bankCardEntity) async {
    await Future.delayed(const Duration(seconds: 2));
    bankCardEntities.add(bankCardEntity);
  }

// https://dev-77kufm6dlmvfrfw.api.raw-labs.com/mytest/endpoint/employee
  @override
  Future deleteCard(String id) {
    // TODO: implement deleteCard
    throw UnimplementedError();
  }

  @override
  Future editCard(BankCardEntity bankCardEntity) {
    // TODO: implement editCard
    throw UnimplementedError();
  }

  @override
  Future<BankCardEntity> getCardById(String id) {
    // TODO: implement getCardById
    throw UnimplementedError();
  }

  @override
  Future<List<BankCardEntity>> getCards() async {
    await Future.delayed(const Duration(seconds: 2));
    return bankCardEntities;
  }
}
