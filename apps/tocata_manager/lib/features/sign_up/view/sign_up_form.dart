import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tocata_manager/features/sign_up/sign_up.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 32),
            Image.asset(
              TocataImages.logo,
              package: TocataImages.packageName,
            ),
            const SizedBox(height: 32),
            _NameInput(),
            const SizedBox(height: 8),
            _EmailInput(),
            const SizedBox(height: 8),
            _PasswordInput(),
            const SizedBox(height: 8),
            _ConfirmPasswordInput(),
            const SizedBox(height: 8),
            const _UserRoleInput(),
            const SizedBox(height: 8),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          style: const TextStyle(color: Colors.white),
          key: const Key('signUpForm_nameInput_textField'),
          onChanged: (name) => context.read<SignUpCubit>().nameChanged(name),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'Nome',
            helperText: '',
            errorText:
                state.email.displayError != null ? 'Nome inválido' : null,
            errorStyle: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          style: const TextStyle(color: Colors.white),
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            helperText: '',
            errorText:
                state.email.displayError != null ? 'invalid email' : null,
            errorStyle: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          style: const TextStyle(color: Colors.white),
          key: const Key('signUpForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<SignUpCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Senha',
            helperText: '',
            errorText:
                state.password.displayError != null ? 'Senha inválida' : null,
            errorStyle: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return TextField(
          style: const TextStyle(color: Colors.white),
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChanged: (confirmPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirme a senha',
            helperText: '',
            errorText: state.confirmedPassword.displayError != null
                ? 'As senhas não são iguais'
                : null,
            errorStyle: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}

class _UserRoleInput extends StatefulWidget {
  const _UserRoleInput();

  @override
  State<_UserRoleInput> createState() => _UserRoleInputState();
}

class _UserRoleInputState extends State<_UserRoleInput> {
  Role selectedValue = Role.estudante;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _buildItems(),
      onChanged: _onChagedCallback,
      value: selectedValue,
      isExpanded: true,
      style: const TextStyle(color: Colors.white),
      iconEnabledColor: Colors.white,
      dropdownColor: Colors.blue.shade800,
      underline: Container(
        height: 1,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<Role>>? _buildItems() {
    return Role.values
        .map(
          (e) => DropdownMenuItem<Role>(
            value: e,
            child: Text('Perfil: ${e.name}'),
          ),
        )
        .toList();
  }

  void _onChagedCallback(Role? role) {
    setState(() {
      selectedValue = role ?? selectedValue;
      context.read<SignUpCubit>().roleChanged(role!);
    });
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('signUpForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: state.isValid
                    ? () => context.read<SignUpCubit>().signUpFormSubmitted()
                    : null,
                child: Text(
                  'Criar',
                  style: TextStyle(color: Colors.blue.shade300),
                ),
              );
      },
    );
  }
}
