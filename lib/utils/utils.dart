//import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null;
}

/**
 * Oculta o teclado
 * */
void hideSoftKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

String formatDate_ddMMyyyyHHmm_Human(int millisecondsSinceEpoch) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

  return "${formatDate_ddMMyyyy_Human(millisecondsSinceEpoch)} às ${DateFormat('kk:mm').format(date)}";
}

String formatDate_ddMMyyyy_Human(int millisecondsSinceEpoch) {
  DateTime now = DateTime.now();
  DateTime todayDate = DateTime(now.year, now.month, now.day);
  DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  DateTime dateDate = DateTime(date.year, date.month, date.day);

  switch (todayDate.difference(dateDate).inDays) {
    case -1:
      return "Amanhã";
    case 0:
      return "Hoje";
    case 1:
      return "Ontem";
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      return formateWeekDay(date.weekday);
    default:
      return DateFormat('dd/MM/yyyy').format(date);
  }
}

formateWeekDay(int diaDaSemana) {
  switch (diaDaSemana % 7) {
    case 0:
      return "Domingo";
    case 1:
      return "Segunda-Feira";
    case 2:
      return "Terça-Feira";
    case 3:
      return "Quarta-Feira";
    case 4:
      return "Quinta-Feira";
    case 5:
      return "Sexta-Feira";
    case 6:
      return "Sábado";
    default:
      return "?";
  }
}

void messageError(context,
    {String message =
        "Algum erro ocorreu. Verifique sua internet e tente novamente mais tarde.",
    String title = "Erro",
    bool dismissible = true,
    VoidCallback onTapOk}) {
  if (onTapOk == null) {
    onTapOk = () => Navigator.pop(context);
  }

  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: onTapOk,
              )
            ],
          ),
      barrierDismissible: dismissible);
}
