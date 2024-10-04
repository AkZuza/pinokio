class Message {
  final bool AI;
  final String time;
  final String text;
  Message({
    this.AI = false,
    this.time = "",
    this.text = "",
  });
}

List<Message> notes = [
  Message(
    AI: false,
    time: "3:40",
    text: "Hey",
  )
];
