import 'package:flutter/material.dart';

class NumberCardWidget extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final Function(String value) onCompleted;
  const NumberCardWidget({super.key, required this.focusNodes, required this.onCompleted});

  @override
  State<NumberCardWidget> createState() => _NumberCardWidgetState();
}

class _NumberCardWidgetState extends State<NumberCardWidget> {

  final _cardNumberControllers =List.generate(4, (_) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Column(children: [

   const Text("شماره کارت",style: TextStyle(fontFamily: "IRANSans")),
   const SizedBox(height: 16,),
    
Row(children: [
  
       _getTextField(_cardNumberControllers[0] ,widget.focusNodes[0] ,0),
       const Text(" - "),
          _getTextField(_cardNumberControllers[1],widget.focusNodes[1],1),
             const Text(" - "),
             _getTextField(_cardNumberControllers[2],widget.focusNodes[2],2),
                const Text(" - "),
                _getTextField(_cardNumberControllers[3],widget.focusNodes[3],3)

],)
    ],);
  }


  Widget _getTextField(TextEditingController textEditingController ,FocusNode focusNode ,int index)
  {
     return Expanded(child: 
     TextFormField(
      textAlign: TextAlign.center,
      maxLength: 4,
      keyboardType: TextInputType.number,
      controller: textEditingController,
      focusNode: focusNode,
      decoration: const InputDecoration(
        counterText: '',
border: OutlineInputBorder(

  borderRadius: BorderRadius.all(Radius.circular(8))
),


      ), onChanged: (value) {
        if(value.length==4)
        {
          _moveToNextFiled(index);
        }
        if(value.isEmpty)
        {
          _moveToPreviousField(index);
        }
        if(_cardNumberControllers[0].text.length==4 &&
        _cardNumberControllers[1].text.length==4&&
        _cardNumberControllers[2].text.length==4 &&
        _cardNumberControllers[3].text.length==4 && index==3
        )
        {
             widget.onCompleted(_cardNumberControllers[0].text + _cardNumberControllers[1].text+ _cardNumberControllers[2].text+ _cardNumberControllers[3].text);
        }

      },));
  }
  
  void _moveToNextFiled(int currentIndex) {
      if(currentIndex < widget.focusNodes.length -1)
      {
        FocusScope.of(context).requestFocus(widget.focusNodes[currentIndex + 1]);
      }
      
  }
  
  void _moveToPreviousField(int currentIndex) {

    if(currentIndex>0)
    {
       FocusScope.of(context).requestFocus(widget.focusNodes[currentIndex - 1]);
    }
  }
}