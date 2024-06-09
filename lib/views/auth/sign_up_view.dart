part of '../../utils/import_paths/import_paths.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({super.key});

  @override
  Widget build(BuildContext context) {
    SingUpController singUpController = Provider.of<SingUpController>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
          key: singUpController.singUpKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: singUpController.mailSingUpController,
                hintText: 'Email',
                prefixIcon: Icons.mail,
                fillColor: Colors.white,
                validator: (p0) {
                  if (p0!.isEmpty || !AppRegex.isEmailValid(p0)) {
                    
                    return 'Please enter your mail';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: singUpController.passwordSingUpController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: singUpController.isVisibility
                    ? Icons.visibility_off
                    : Icons.visibility,
                onTapSuffixIcon: singUpController.changeVisibility,
                obscureText: singUpController.isVisibility,
                keyboardType: TextInputType.number,
                fillColor: Colors.white,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: singUpController.confirmPasswordController,
                hintText: 'Confirme Password',
                prefixIcon: Icons.lock,
                suffixIcon: singUpController.isVisibilityConfirm
                    ? Icons.visibility_off
                    : Icons.visibility,
                onTapSuffixIcon: singUpController.changeVisibilityConfirm,
                obscureText: singUpController.isVisibilityConfirm,
                keyboardType: TextInputType.number,
                fillColor: Colors.white,
                validator: (p0) {
                  if (p0!.isEmpty || AppRegex.isPasswordConfigration(singUpController.passwordSingUpController.text, singUpController.confirmPasswordController.text)) {
                    return 'not confirmed';
                  }
                  return null;
                },
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () async {
                      if (singUpController.singUpKey.currentState!.validate()) {
                        singUpController.SignUpAuth(context);
                      }
                    },
                    child: const Text('Sing Up')),
              )
            ],
          )),
    );
  }
}
