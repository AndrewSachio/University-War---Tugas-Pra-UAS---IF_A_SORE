import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kopicow_application/components/Borrow_Provider.dart';

class BorrowRequestsPage extends StatelessWidget {
  const BorrowRequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borrowProvider = Provider.of<BorrowProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Borrow Requests',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xffb29377),
      ),
      body: ListView.builder(
        itemCount: borrowProvider.borrowRequests.length,
        itemBuilder: (context, index) {
          final request = borrowProvider.borrowRequests[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(request.username),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ${request.amount}'),
                  Text('Duration: ${request.duration.inDays} days'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.check, color: Colors.green),
                    onPressed: () {
                      borrowProvider.acceptRequest(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                      borrowProvider.rejectRequest(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
