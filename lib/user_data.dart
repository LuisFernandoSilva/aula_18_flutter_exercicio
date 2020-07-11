class UserData {
  String name;
  String email;
  String cpf;
  String cep;
  String street;
  String numberHouse;
  String neighborhood;
  String city;
  String state;
  String country;

  String printData() {
    return 'Dados salvos: \n'
        'Nome: $name\n'
        'Email: $email\n'
        'Cpf: ${_cepCpf(cpf)}\n'
        'Cep: ${_cepCpf(cep)}\n'
        'Rua: $street\n'
        'Numero: $numberHouse\n'
        'Bairro: $neighborhood\n'
        'Cidade: $city\n'
        'País: $country';
  }

  String _cepCpf(String number) {
    if (number.length <= 11) {
      number.padLeft(11, '0');
      return '${number.substring(0, 3)}.${number.substring(3, 6)}.${number.substring(6, 9)}-${number.substring(9, 11)}';
    }
    if (number.length <= 8) {
      number.padLeft(8, '0');
      return '${number.substring(0, 5)}.${number.substring(6, 8)}';
    }
  }
}
