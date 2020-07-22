import 'package:busca_cep_app/repository/network/request_state.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final RequestState requestState;
  final VoidCallback onTryAgain;
  final String textButtonTryAgain;

  const ErrorView(
      {Key key,
      @required this.requestState,
      @required this.onTryAgain,
      this.textButtonTryAgain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            titleRequest(requestState),
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            contentError(requestState),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            child: Text(textButtonTryAgain ?? "Tentar novamente"),
            onPressed: onTryAgain,
          )
        ],
      ),
    );
  }
}
