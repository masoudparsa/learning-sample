import 'package:flutter_application_new_card/domain/enities/bank_card.dart';

List<BankCardEntity> bankCardEntities = List.empty(growable: true);

enum BlocState { initial, loading, loaded, adding, added, error }
