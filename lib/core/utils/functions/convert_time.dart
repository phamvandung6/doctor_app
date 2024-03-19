import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Timestamp dateTimeToTimestamp(DateTime dateTime) {
  return Timestamp.fromDate(dateTime);
}

DateTime timestampToDateTime(Timestamp timestamp) {
  return timestamp.toDate();
}

DateTime convertStringToDateTime(String dateString) {
  // Định dạng của chuỗi thời gian đầu vào
  DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.S");

  // Chuyển đổi chuỗi thành DateTime
  DateTime dateTime = inputFormat.parse(dateString);

  // Định dạng mới của DateTime
  DateFormat outputFormat = DateFormat("dd-MM-yyyy");

  // Chuyển đổi DateTime thành chuỗi theo định dạng mới
  String formattedDate = outputFormat.format(dateTime);

  // Chuyển đổi chuỗi đã định dạng về DateTime
  DateTime resultDateTime = outputFormat.parse(formattedDate);

  return resultDateTime;
}

String formatTimestampToDateTime(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}

Timestamp stringToTimestamp(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  Timestamp timestamp = Timestamp.fromDate(dateTime);
  return timestamp;
}
