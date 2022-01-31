class Order {
  int id;
  String orderName;
  String clientName;
  bool isDone;

  Order({this.id, this.orderName, this.clientName, this.isDone});

  Order.fromMap(Map map) {
    this.id = map['id'];
    this.orderName = map['orderName'];
    this.clientName = map['clientName'];
    this.isDone = map['isDone'] == 1 ? true : false;
  }
  toMap() {
    return {
      'id': this.id,
      'orderName': this.orderName,
      'clientName': this.clientName,
      'isDone': this.isDone ? 1 : 0
    };
  }
}
