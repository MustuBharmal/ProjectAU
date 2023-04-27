import '../providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class NotificationCards extends StatefulWidget {
  const NotificationCards({super.key});

  @override
  State<NotificationCards> createState() => _NotificationCardsState();
}

class _NotificationCardsState extends State<NotificationCards> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        StackedNotificationCards(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 2.0,
            )
          ],
          notificationCards: dataProvider.listOfNotification,
          cardColor: const Color(0xC7FFBE4D),
          padding: 14,
          actionTitle: const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // color:
            ),
          ),
          showLessAction: const Text(
            'Show less',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // color: Color(0xFF111111),
            ),
          ),
          onTapClearAll: () {
            setState(() {
              dataProvider.listOfNotification.clear();
            });
          },
          clearAllNotificationsAction: const Icon(Icons.close),
          clearAllStacked: const Text('Clear All'),
          cardClearButton: const Text('clear'),
          cardViewButton: const Text('view'),
          onTapClearCallback: (index) {
            setState(() {
              dataProvider.listOfNotification.removeAt(index);
            });
          },
          onTapViewCallback: (index) {},
          notificationCardTitle: 'Messages',
        ),
      ]),
    );
  }
}
