import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class NotificationCards extends StatefulWidget {
  const NotificationCards({Key? key}) : super(key: key);

  @override
  State<NotificationCards> createState() => _NotificationCardsState();
}

class _NotificationCardsState extends State<NotificationCards> {
  final List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'OakTree 1',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'OakTree 2',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 10),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'OakTree 3',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 30),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'OakTree 4',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 44),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
        color: Color(0xFFFFFFFF),
      ),
      title: 'OakTree 5',
      subtitle: 'We believe in the power of mobile computing.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        StackedNotificationCards(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 2.0,
            )
          ],
          notificationCards: [..._listOfNotification],
          cardColor:  const Color(0xFFFFB950),
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
              _listOfNotification.clear();
            });
          },
          clearAllNotificationsAction: Icon(Icons.close),
          clearAllStacked: const Text('Clear All'),
          cardClearButton: const Text('clear'),
          cardViewButton: const Text('view'),
          onTapClearCallback: (index) {
            print(index);
            setState(() {
              _listOfNotification.removeAt(index);
            });
          },
          onTapViewCallback: (index) {
            print(index);
          },
          notificationCardTitle: 'Messages',
        ),
      ]),
    );
  }
}
