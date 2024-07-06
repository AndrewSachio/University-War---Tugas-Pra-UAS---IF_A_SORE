import 'package:flutter/material.dart';

class BarcodePage extends StatelessWidget {
  const BarcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          backgroundColor: const Color(0xffb29377),
        ),
        body: Consumer<RequestProvider>(
        builder: (context, requestProvider, child) {
          final notifications = requestProvider.userNotifications;

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final request = notifications[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: ListTile(
                  title: Text(
                    request.status == 'accepted'
                        ? 'Your request for ${request.itemName} has been accepted.'
                        : 'Your request for ${request.itemName} has been rejected.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      request.isRead
                          ? Icons.mark_email_read
                          : Icons.mark_email_unread,
                      color: request.isRead ? Colors.green : Colors.red,
                    ),
                    onPressed: () {
                      if (request.isRead) {
                        requestProvider.markAsUnread(request);
                      } else {
                        requestProvider.markAsRead(request);
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
