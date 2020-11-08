import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Shared {


  static String readTimestamp(Timestamp timestamp) {
  var now = DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
  var diff = now.difference(date);
  String time = '';
 
  if (diff.inSeconds < 60) {
    return time = 'Maintenant';
  } else if (diff.inMinutes > 0 && diff.inMinutes < 60) {
    if (diff.inMinutes == 1) {
     return time = diff.inMinutes.toString() + ' min';
    } else {
     return time = diff.inMinutes.toString() + ' min';
    }
  } else if (diff.inHours > 0 && diff.inHours < 24) {
    if (diff.inHours == 1) {
     return time = diff.inHours.toString() + ' heure';
    } else {
     return time = diff.inHours.toString() + ' heures';
    }
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
     return time = 'Il y a ' + diff.inDays.toString() + ' jour';
    } else {
     return time = 'Il y a ' + diff.inDays.toString() + ' jours';
    }
  } else {
    if (diff.inDays == 7) {
     return time = (diff.inDays / 7).floor().toString() + ' semaine';
    } else if (diff.inDays >= 7 && diff.inDays <30){
       return  time = (diff.inDays / 7).floor().toString() + ' semaines'; 
    } else if (diff.inDays  == 30 || diff.inDays  <= 364) {
       return time = (diff.inDays / 30).floor().toString() + ' mois';
      } else{
         return time = (diff.inDays / 364).floor().toString() + ' ans';
      }
    }
  }


}