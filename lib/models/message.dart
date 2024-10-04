class Message {
  final bool ai;
  final String time;
  final String text;
  Message({
    this.ai = false,
    this.time = "",
    this.text = "",
  });
}

List<Message> notes = [
  Message(
    ai: false,
    time: "3:40",
    text: "Hey",
  )
];
