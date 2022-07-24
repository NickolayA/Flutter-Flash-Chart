class Message {
  final String text;
  final String sender;

  Message({required this.text, required this.sender});

  factory Message.fromJson(Map<String, dynamic> json) {
    final text = json['text'];
    final sender = json['sender'];

    return Message(text: text, sender: sender);
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'sender': sender,
    };
  }
}
