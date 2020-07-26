// Import the test package and Counter class
import 'package:busca_cep_app/models/address_model.dart';
import 'package:test/test.dart';

void main() {
  test(
      'Deve montar um endereco vazio quando crio um endereço pelo construtor padrão',
      () {
    final address = Address();

    expect(address.localidade, null);
    expect(address.bairro, null);
    expect(address.logradouro, null);
    expect(address.id, null);
    expect(address.uf, null);
    expect(address.cep, null);
    expect(address.unidade, null);
    expect(address.ibge, null);
    expect(address.gia, null);
    expect(address.complemento, null);
  });

  test(
      'Deve montar um endereco preenchido quando crio um endereço pelo construtor padrão',
      () {
    final address = Address(
        cep: "01001-000",
        logradouro: "Praça da Sé",
        complemento: "lado ímpar",
        bairro: "Sé",
        localidade: "São Paulo",
        uf: "SP",
        unidade: "",
        ibge: "3550308",
        gia: "1004");

    expect(address.localidade, "São Paulo");
    expect(address.bairro, "Sé");
    expect(address.logradouro, "Praça da Sé");
    expect(address.id, null);
    expect(address.uf, "SP");
    expect(address.cep, "01001-000");
    expect(address.unidade, "");
    expect(address.ibge, "3550308");
    expect(address.gia, "1004");
    expect(address.complemento, "lado ímpar");
  });

  test(
      'Deve montar um endereco preenchido quando crio um endereço pelo construtor from json',
      () {
    final address = Address.fromJson({
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
      "unidade": "",
      "ibge": "3550308",
      "gia": "1004"
    });

    expect(address.localidade, "São Paulo");
    expect(address.bairro, "Sé");
    expect(address.logradouro, "Praça da Sé");
    expect(address.id, null);
    expect(address.uf, "SP");
    expect(address.cep, "01001-000");
    expect(address.unidade, "");
    expect(address.ibge, "3550308");
    expect(address.gia, "1004");
    expect(address.complemento, "lado ímpar");
  });

  test('Deve montar um mapa quando chama o método toJson', () {
    final address = Address(
        cep: "01001-000",
        logradouro: "Praça da Sé",
        complemento: "lado ímpar",
        bairro: "Sé",
        localidade: "São Paulo",
        uf: "SP",
        unidade: "",
        ibge: "3550308",
        gia: "1004");

    expect(address.toJson(), {
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
      "unidade": "",
      "ibge": "3550308",
      "gia": "1004"
    });
  });
}
