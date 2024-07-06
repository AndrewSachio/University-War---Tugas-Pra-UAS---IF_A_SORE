// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kopicow_application/components/Request_Provider.dart';
import 'package:provider/provider.dart';

class RequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
        backgroundColor: Color(0xffb29377),
      ),
      body: Consumer<RequestProvider>(
        builder: (context, requestProvider, child) {
          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: requestProvider.request.length,
            itemBuilder: (context, index){
              final request = requestProvider.requests[index];
              return Card(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Item Name: ${request.itemName}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Quantity Needed: ${request.quantity}'),
                      SizedBox(height: 8),
                      Text('Reason: ${request.reason}'),
                      SizedBox(height: 8),
                      if (request.isDepartmentRequest) ...[
                        Text('Department Name: ${request.departmentName}'),
                        SizedBox(height: 8),
                        Text(
                            'Responsible Person: ${request.responsiblePerson}'),
                      ],
                      SizedBox(height: 8),
                      Text('Requested by: ${request.username}'),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              )
            },
          )
        }
      ),
    );
  }
}
