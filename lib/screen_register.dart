import 'package:aula_18_flutter_exercicio/user_data.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _cepController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberHouseController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final UserData user = UserData();

  _restart() {
    _formKey.currentState.reset();
    setState(() {
      _nameController.clear();
      _emailController.clear();
      _cpfController.clear();
      _cepController.clear();
      _streetController.clear();
      _numberHouseController.clear();
      _neighborhoodController.clear();
      _cityController.clear();
      _stateController.clear();
      _countryController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Cadastro de usuario'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.restore_page),
              onPressed: () {
                _restart();
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(
                height: 500,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Nome',
                                hintStyle: TextStyle(color: Colors.blue)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Nome Vazio';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              user.name = newValue;
                            },
                          ),
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'email',
                                hintStyle: TextStyle(color: Colors.blue)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email Vazio';
                              }
                              if (!value.contains('@')) {
                                return 'Esqueceu o @';
                              }
                            },
                            onSaved: (newValue) {
                              user.email = newValue;
                            },
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                controller: _cpfController,
                                maxLength: 11,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'CPF',
                                    hintStyle: TextStyle(color: Colors.blue)),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'CPF Vazio';
                                  }
                                  if (value.length < 11) {
                                    return 'Falta numeros';
                                  }
                                },
                                onSaved: (newValue) {
                                  user.cpf = newValue;
                                },
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.all(1),
                                child: TextFormField(
                                  controller: _cepController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 8,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Cep',
                                      hintStyle: TextStyle(color: Colors.blue)),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'CEP Vazio';
                                    }
                                    if (value.length < 8) {
                                      return 'Falta numeros';
                                    }
                                  },
                                  onSaved: (newValue) {
                                    user.cep = newValue;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              flex: 2,
                              child: TextFormField(
                                controller: _streetController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Rua',
                                    hintStyle: TextStyle(color: Colors.blue)),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Rua esta Vazio';
                                  }
                                },
                                onSaved: (newValue) {
                                  user.street = newValue;
                                },
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: _numberHouseController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Numero',
                                      hintStyle: TextStyle(color: Colors.blue)),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Numero esta Vazio';
                                    }
                                  },
                                  onSaved: (newValue) {
                                    user.numberHouse = newValue;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 2,
                              child: TextFormField(
                                controller: _neighborhoodController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Bairro',
                                    hintStyle: TextStyle(color: Colors.blue)),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Bairro esta Vazio';
                                  }
                                },
                                onSaved: (newValue) {
                                  user.neighborhood = newValue;
                                },
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: _cityController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Cidade',
                                      hintStyle: TextStyle(color: Colors.blue)),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Cidade esta Vazio';
                                    }
                                  },
                                  onSaved: (newValue) {
                                    user.city = newValue;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 2,
                              child: TextFormField(
                                controller: _stateController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Estado',
                                    hintStyle: TextStyle(color: Colors.blue)),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Estado esta Vazio';
                                  }
                                },
                                onSaved: (newValue) {
                                  user.state = newValue;
                                },
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  controller: _countryController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'País',
                                      hintStyle: TextStyle(color: Colors.blue)),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'País esta Vazio';
                                    }
                                  },
                                  onSaved: (newValue) {
                                    user.country = newValue;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        RaisedButton(
                          child: Text('Save'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                _formKey.currentState.save();
                              });
                              _onSucess();
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      title: Text(
                                        'Dados Salvos',
                                      ),
                                      content: Text('Nome:${user.name}\n'
                                          'Email: ${user.email}\n'
                                          'Rua: ${user.street}\n'
                                          'Cpf: ${_cpf(user.cpf)}\n'
                                          'Cep: ${_cep(user.cep)}\n'
                                          'Numero: ${user.numberHouse}\n'
                                          'Bairro: ${user.neighborhood}\n'
                                          'Cidade: ${user.city}\n'
                                          'País: ${user.country}'),
                                    );
                                  });
                            }
                          },
                          color: Colors.deepPurple,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _cpf(String number) {
    if (number.length <= 11) {
      number.padLeft(11, '0');
      return '${number.substring(0, 3)}.${number.substring(3, 6)}.${number.substring(6, 9)}-${number.substring(9, 11)}';
    }
  }

  String _cep(String number) {
    if (number.length <= 8) {
      number.padLeft(8, '0');
      return '${number.substring(0, 4)}.${number.substring(5, 8)}';
    }
  }

  void _onSucess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuario Criado com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 3),
    ));
  }
}
