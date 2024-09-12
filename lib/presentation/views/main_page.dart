import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_proj/domain/use_cases/send_user_data_use_case.dart';
import '../../core/di/di.dart';
import '../bloc/main_page_bloc.dart';
import '../widgets/snackbars/failure_sent_data.dart';
import '../widgets/snackbars/success_sent_data.dart';
import '../widgets/fields/user_email.dart';
import '../widgets/fields/user_name.dart';
import '../widgets/fields/user_phone.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageBloc _mainPageBloc = MainPageBloc(getIt<SendUserDataUseCase>());
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<MainPageBloc, MainPageState>(
          bloc: _mainPageBloc,
          listener: (context, state) {
            if (state is SuccessSent) {
              _formKey.currentState!.reset();
              ScaffoldMessenger.of(context).showSnackBar(
                successSentData(),
              );
            }

            if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                failureSentData(state.message),
              );
            }
          },
          child: Stack(
            children: [
              buildForm(),
              _mainPageBloc.state is SendingState ?
              loadingIndicator() :
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            userNameField(_userNameController),
            userEmailField(_emailController),
            userPhoneField(_phoneNumberController),
            mainFormButton(),
          ],
        ),
      ),
    );
  }

  Widget loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget mainFormButton() {
    return FilledButton(
      child: const Text('Continue'),
      onPressed: () {
        bool isValid = _formKey.currentState!.validate();

        if (!isValid) return;

        _mainPageBloc.add(SendDataEvent(
            _userNameController.text, _emailController.text,
            _phoneNumberController.text));
      },
    );
  }
}