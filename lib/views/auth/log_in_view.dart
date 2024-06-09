part of '../../utils/import_paths/import_paths.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Provider.of<LoginController>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
          key: loginController.singInKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: loginController.mailLoginController,
                hintText: 'Email',
                prefixIcon: Icons.mail,
                fillColor: Colors.white,
                validator: (p0) {
                  if (p0!.isEmpty || !AppRegex.isEmailValid(p0)) {
                    return 'Enter Email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: loginController.passwordLoginController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: loginController.isVisibility
                    ? Icons.visibility_off
                    : Icons.visibility,
                obscureText: loginController.isVisibility,
                onTapSuffixIcon: loginController.changeVisibility,
                keyboardType: TextInputType.number,
                fillColor: Colors.white,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () async {
                      if (loginController.singInKey.currentState!.validate()) {
                        loginController.signInAuth();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    },
                    child: const Text('Login')),
              )
            ],
          )),
    );
  }
}
