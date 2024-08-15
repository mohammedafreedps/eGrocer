import 'package:egrocer/helper/utils/timeDateFormator.dart';
import 'package:flutter/material.dart';

class Labreportscreen extends StatelessWidget {
  const Labreportscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return resultTile(context);
              }),
        ),
      ),
    );
  }
}

Widget resultTile(BuildContext context){
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${TimeDateFormator.formateDateTime(DateTime.now())} / ${TimeDateFormator.formateTimeOfDay(TimeOfDay.now())}'),
            Text('View Details',style: TextStyle(color: Colors.blue[300]),)
          ],
        ),
        Text('Result : Passed',style: TextStyle(color: Colors.green[300],fontWeight: FontWeight.bold,fontSize: 30),),
        Text("Rating : 8/10")
      ],
    ),
  );
}