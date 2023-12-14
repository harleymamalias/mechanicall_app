import 'package:flutter/material.dart';
import 'forms.dart';
import '../roadside_assistance_id.dart';

class ReceiveRequest extends StatelessWidget {
  final List<String> requestIds; // Add a field to hold request IDs

  // Add a constructor to accept request IDs
  ReceiveRequest({Key? key, required this.requestIds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 338,
        height: 540,
        color: Color(0xFF273E47),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Request Received',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: requestIds.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Request ${requestIds[index]}',
                      
                      style: TextStyle(color: Colors.white),
                    ),
                    
                    onTap: () {
                      globalRoadsideAssistanceDocId = requestIds[index];
                      Navigator.pop(context); // Close the current dialog
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return RequestForm();
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
