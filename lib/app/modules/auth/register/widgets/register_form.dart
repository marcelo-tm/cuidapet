part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState
    extends ModularState<_RegisterForm, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CuidapetTextformField(
              label: 'Login',
              controller: _loginEC,
              validator: Validatorless.multiple([
                Validatorless.required('Login obrigatório'),
                Validatorless.email('Email inválido'),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            CuidapetTextformField(
              label: 'Senha',
              obscureText: true,
              controller: _passwordEC,
              validator: Validatorless.multiple([
                Validatorless.required('Senha obrigatória'),
                Validatorless.min(6, 'Senha precisa ter ao menos 6 caracteres')
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            CuidapetTextformField(
              label: 'Confirma senha',
              obscureText: true,
              validator: Validatorless.multiple([
                Validatorless.required('Confirmação de senha obrigatória'),
                Validatorless.min(6,
                    'Confirmação de senha precisa ter ao menos 6 caracteres'),
                Validatorless.compare(_passwordEC, 'Senhas não são iguais'),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              label: 'Cadastrar',
              onPressed: () {
                final formValid = _formKey.currentState?.validate() ?? false;

                if (formValid) {
                  controller.register(
                      email: _loginEC.text, password: _passwordEC.text);
                }
              },
            ),
          ],
        ));
  }
}
