abstract class MessagingService {
  void sendMessage(String message);
}

class EmailService implements MessagingService {
  @override
  void sendMessage(String message) {
    print("Sending email: $message");
  }
}

class SmsService implements MessagingService {
  @override
  void sendMessage(String message) {
    print("Sending sms: $message");
  }
}

class User {
  final MessagingService service;

  User({required this.service});

  void sendMessage(String message) {
    service.sendMessage(message);
  }
}
