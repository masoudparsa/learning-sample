import 'package:flutter/material.dart';

class DateCardWidget extends StatefulWidget {
    final List<FocusNode> focusNodes;
      final Function(String value) onCompleted;
  const DateCardWidget({super.key, required this.focusNodes, required this.onCompleted});

  @override
  State<DateCardWidget> createState() => _DateCardWidgetState();
}

class _DateCardWidgetState extends State<DateCardWidget> {
  TextEditingController monthTextEditingController =TextEditingController();
  TextEditingController yearTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
   const Text("تاریخ انقضا",style: TextStyle(fontFamily: "IRANSans"),),
   const SizedBox(height: 16,),

Row(children: [
  Expanded(child: TextFormField(
      textAlign: TextAlign.center,
      maxLength: 2,
      keyboardType: TextInputType.number,
      controller: yearTextEditingController,
      focusNode:widget.focusNodes[0],
      decoration: const InputDecoration(
        counterText: '',
border: OutlineInputBorder(

  borderRadius: BorderRadius.all(Radius.circular(8))
),


      ), onChanged: (value) {
         if(value.length==2)
        {
          _moveToNextFiled(0);
        }
      

      },)),

     const Text(" / "),

        Expanded(child: TextFormField(
      textAlign: TextAlign.center,
      maxLength: 2,
      keyboardType: TextInputType.number,
      controller: monthTextEditingController,
      focusNode: widget.focusNodes[1],
      decoration: const InputDecoration(
        counterText: '',
border: OutlineInputBorder(

  borderRadius: BorderRadius.all(Radius.circular(8))
),


      ), onChanged: (value) {
          if(value.isEmpty)
        {
          _moveToPreviousField(1);
        }

        if(value.length==2)
        {
          widget.onCompleted("${yearTextEditingController.text}/${monthTextEditingController.text}");
        }

      },))
],)

    ],);
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