# busca_cep_app

Buscador de CEP em Flutter

## Getting Started

Este projeto busca endereços através dos CEPs cadastrados.

### Principais tecnologias envolvidas
 - [MobX](https://pub.dev/packages/mobx)
 - [GetIt](https://pub.dev/packages/get_it)
 - [Dio](https://pub.dev/packages/dio)
 - [Sqflite](https://pub.dev/packages/sqflite)

## Screenshots
Principais telas
<p float="left">
  <img src="/screenshots/APP1.PNG" width="200" title="Splash"/>
  <img src="/screenshots/APP2.PNG" width="200" title="Endereços já cadastrados"/> 
  <img src="/screenshots/APP3.PNG" width="200" title="Visualização dos dados de um CEP"/>
  <img src="/screenshots/APP4.jpeg" width="200" title="Adicionando um endereço através do CEP"/>
</p>

Telas de fluxo alternativo
<p float="left">
  <img src="/screenshots/APP5.PNG" width="200" title="Inicialmente o usuário não possui nenhum endereço cadastrado"/>
  <img src="/screenshots/APP6.PNG" width="200" title="Nenhum endereço encontrado para o CEP informado"/> 
  <img src="/screenshots/APP7.PNG" width="200" title="Alguns fluxos alternativos são cobertos pelo app, dentre eles Timeout, sem conexão com a internet e sem conexão com o servidor"/>
  <img src="/screenshots/APP8.PNG" width="200" title="Antes de cadastrar um CEP é verificado inicialmente a sua vailidade"/>
</p>

## Setup
Para executar este projeto siga os seguintes passos:
- Entre na pasta do projeto
- Para executar em um dispositivo Android, 
    - esteja certo que há um emulador configurado e ligado ou um dispositivo Android conectado ao computador
    - execute o comando flutter run android 
- Para executar em um dispositivo iOS 
    - esteja certo que tem o XCode instalado no seu MacOS.
    - ajuste o Team para o que estiver cadastrado no seu XCode
    - execute o comando flutter run ios 
