import '../exports.dart';

class Taskx {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;

  Taskx({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiConstants.idFrom: idFrom,
      ApiConstants.idTo: idTo,
      ApiConstants.timestamp: timestamp,
      ApiConstants.content: content,
      ApiConstants.type: type,
    };
  }

  /*factory Task.fromDocument(DocumentSnapshot doc) {
    String idFrom = doc.get(FirestoreConstants.idFrom);
    String idTo = doc.get(FirestoreConstants.idTo);
    String timestamp = doc.get(FirestoreConstants.timestamp);
    String content = doc.get(FirestoreConstants.content);
    int type = doc.get(FirestoreConstants.type);
    
    return MessageChat(
      idFrom: idFrom,
      idTo: idTo,
      timestamp: timestamp,
      content: content,
      type: type,
    );
  }*/
}
