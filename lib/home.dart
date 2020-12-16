import 'dart:math';

import 'package:dsi_app/constants.dart';
import 'package:dsi_app/infra.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.menu),
      title: Text('Home'),
      actions: <Widget>[
        ButtonTheme(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RaisedButton(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () { Navigator.push( context, MaterialPageRoute(builder: (context) => SignUpPage()));},  //_search,
            )),
        Icon(Icons.more_vert),
      ],
    );
  }

  Widget _buildBody() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff7ffe8), Color(0xffc2ca94)], // Color(0xffc7ffba)
            stops: [0.8, 1.0],
            transform: GradientRotation(pi / 2.03),
          ),
          image: DecorationImage(
            image: Images.bsiLogo,
          ),
        ),
      ),
    );
  }
}

  ////////////////////////////////////////////////////////////////

class SignUpPage extends StatelessWidget {
    @override
      Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
           title: Row(
            children: <Widget>[
            Text('Cadastro'),
              Spacer(),
          ],),),
        body: ListView(
          children: <Widget>[
            Image(
              image: Images.bsiLogo,
              height: 100,
            ),
            Constants.spaceSmallHeight,
            RegisterForm(),
          ],
        ),
      );
    }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  void _register() {
    if (!_formKey.currentState.validate()) return;

    dsiDialog.showInfo(
      context: context,
      message: 'O cadastro foi realizado com sucesso.',
      buttonPressed: () => dsiHelper..back(context)..back(context),
    );

    //A linha acima é equivalente a executar as duas linhas abaixo:
    //Navigator.of(context).pop();
    //Navigator.of(context).pop();
    //
    //Para maiores informações, leia sobre 'cascade notation' no Dart.
    //https://dart.dev/guides/language/language-tour
  }

  void _cancel() {
    dsiHelper.back(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: Constants.paddingMedium,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Nome*'),
              validator: (String value) {
                return value.isEmpty ? 'Nome inválido.' : null;
              },
            ),
            Constants.spaceSmallHeight,
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'CPF*'),
              validator: (String value) {
                return value.isEmpty ? 'CPF inválido.' : null;
              },
            ),
            Constants.spaceSmallHeight,
            TextFormField(
              keyboardType: TextInputType.text,
              // obscureText: true,
              decoration: const InputDecoration(labelText: 'Data de Nascimento*'),
              validator: (String value) {
                return value.isEmpty ? 'Data de nascimento inválida.' : null;
              },
            ),
            Constants.spaceMediumHeight,
            TextFormField(
              keyboardType: TextInputType.text,
              // obscureText: true,
              decoration:
              const InputDecoration(labelText: 'Email*'),
              validator: (String value) {
                return value.isEmpty
                    ? 'Email inválido.'
                    : null;
              },
            ),
            Constants.spaceSmallHeight,
            TextFormField(
              keyboardType: TextInputType.text,
              // obscureText: true,
              decoration:
              const InputDecoration(labelText: 'Telefone*'),
              validator: (String value) {
                return value.isEmpty
                    ? 'Telefone inválido.'
                    : null;
              },
            ),

            Constants.spaceMediumHeight,
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Salvar'),
                onPressed: _register,
              ),
            ),
            FlatButton(
              child: Text('Cancelar'),
              padding: Constants.paddingSmall,
              onPressed: _cancel,
            ),
          ],
        ),
      ),
    );
  }
}
