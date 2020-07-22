enum RequestState {
  IDLE,
  LOADING,
  SUCCESS,
  FAIL,
  EXPIRED_SECTION,
  TIMEOUT,
  NO_CONNECTION,
  NO_CONNECTION_WITH_SERVER,
  ZIP_NOT_EXISTS
}

isError(RequestState requestState) {
  switch (requestState) {
    case RequestState.NO_CONNECTION_WITH_SERVER:
    case RequestState.NO_CONNECTION:
    case RequestState.TIMEOUT:
    case RequestState.EXPIRED_SECTION:
    case RequestState.ZIP_NOT_EXISTS:
    case RequestState.FAIL:
      return true;
    default:
      return false;
  }
}

String titleRequest(RequestState requestState) {
  switch (requestState) {
    case RequestState.NO_CONNECTION_WITH_SERVER:
      return "Sem conexão com o servidor";
    case RequestState.NO_CONNECTION:
      return "Sem conexão com a internet";
    case RequestState.TIMEOUT:
      return "Tempo de resposta excedido";
    case RequestState.EXPIRED_SECTION:
      return "Sessão expirada";
      case RequestState.ZIP_NOT_EXISTS:
      return "CEP não existe";
    case RequestState.FAIL:
      return "Erro inesperado";
    case RequestState.SUCCESS:
      return "Sucesso";
    case RequestState.LOADING:
      return "Carregando ...";
    default:
      return "";
  }
}

String contentError(RequestState requestState) {
  switch (requestState) {
    case RequestState.NO_CONNECTION_WITH_SERVER:
      return "Não conseguimos conexão com o servidor.\nTente novamente mais tarde.";
    case RequestState.NO_CONNECTION:
      return "Não conseguimos conexão com a internet.\nVerifique a sua conexão e tente novamente.";
    case RequestState.TIMEOUT:
      return "O servidor demorou para responder.\nTente novamente mais tarde.";
      case RequestState.ZIP_NOT_EXISTS:
      return "O servidor não encontrou este CEP.\nTente buscar por outro.";
    case RequestState.EXPIRED_SECTION:
      return "Tente realizar o login novamente para ter acesso.";
    case RequestState.FAIL:
      return "Algo de errado aconteceu.\nTente mais tarde novamente.";
    default:
      return "";
  }
}
