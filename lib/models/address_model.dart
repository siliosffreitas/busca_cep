class Address {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String unidade;
  String ibge;
  String gia;
  DateTime createdAt;
  int id;

  Address(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.unidade,
      this.ibge,
      this.gia,
      this.createdAt,
      this.id});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? null;
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    unidade = json['unidade'];
    ibge = json['ibge'];
    gia = json['gia'];
    createdAt =
        json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['localidade'] = this.localidade;
    data['uf'] = this.uf;
    data['unidade'] = this.unidade;
    data['ibge'] = this.ibge;
    data['gia'] = this.gia;
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt.toString();
    }
    if (id != null) {
      data['id'] = this.id;
    }

    return data;
  }

  int compareTo(Address b) {
    return b.createdAt.compareTo(createdAt);
  }

  @override
  String toString() {
    return "Address(id $id, cep: $cep, createdAt: $createdAt)";
  }
}
