import 'package:flutter/material.dart';
import 'package:flutter_application_new_card/domain/enities/bank_card.dart';
import 'package:flutter_application_new_card/domain/usecases/add_card_usecase.dart';
import 'package:flutter_application_new_card/presentation/bank_card/widgets/date_card_widget.dart';
import 'package:flutter_application_new_card/presentation/bank_card/widgets/number_card_2_widget.dart';
import 'package:flutter_application_new_card/presentation/bank_card/widgets/number_card_widget.dart';

class NewCardScreen extends StatefulWidget {
  const NewCardScreen({super.key});

  @override
  State<NewCardScreen> createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  var focusNodes = List.generate(4, (_) => FocusNode());
  var dateFocusNodes = List.generate(2, (_) => FocusNode());
  var focusNodeCardName = FocusNode();
  var focusNodeNumberCard = FocusNode();
  bool validated = false;
  var formKey = GlobalKey<FormState>();
  var cardNameTextController = TextEditingController();

  String cardNumber = "";
  String expireDate = "";

  bool loading = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        FocusScope.of(context).requestFocus(focusNodes[0]);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "کارت جدید",
          style: TextStyle(
              color: Colors.amber, fontFamily: "IRANSans", fontSize: 18),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffD3D3D3),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  NumberCard2Widget(
                    focusNode: focusNodeNumberCard,
                    onCompleted: (value) {
                      FocusScope.of(context).requestFocus(dateFocusNodes[0]);
                      cardNumber = value;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  DateCardWidget(
                    focusNodes: dateFocusNodes,
                    onCompleted: (value) {
                      FocusScope.of(context).requestFocus(focusNodeCardName);
                      expireDate = value;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    children: [
                      const Text(
                        "نام کارت",
                        style: TextStyle(fontFamily: "IRANSans"),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            controller: cardNameTextController,
                            focusNode: focusNodeCardName,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  validated = true;
                                });
                              } else {
                                setState(() {
                                  validated = false;
                                });
                              }
                            },
                            validator: (value) {
                              if (value!.length < 3) {
                                return "نام کارت باید بیشتر از سه حرف باشد";
                              }

                              return null;
                            },
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          var bankCardEntity = BankCardEntity(
                              cardName: cardNameTextController.text,
                              cardNumber: cardNumber,
                              expireDate: expireDate);
                          await AddCardUsecase().execute(bankCardEntity);
                          setState(() {
                            loading = false;
                          });
                          Navigator.of(context).pop(bankCardEntity);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffff006a6c)
                                .withOpacity(validated ? 1.0 : 0.5),
                            foregroundColor: Colors.white),
                        child: loading == true
                            ? const CircularProgressIndicator()
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("ذخیره کارت",
                                      style: TextStyle(fontFamily: "IRANSans")),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.done,
                                  ),
                                ],
                              ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
