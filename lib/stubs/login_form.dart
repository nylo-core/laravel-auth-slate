String stubLoginForm() => '''
import 'package:nylo_framework/nylo_framework.dart';

/* Login Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/5.20.0/forms#how-it-works
| Casts: https://nylo.dev/docs/5.20.0/forms#form-casts
| Validation Rules: https://nylo.dev/docs/5.20.0/validation#validation-rules
|-------------------------------------------------------------------------- */

class LoginForm extends NyFormData {

  LoginForm({String? name}) : super(name ?? "login");

  @override
  fields() => [
    Field("Email",
        autofocus: true,
        cast: FormCast.email(),
        validate: FormValidator.rule("email"),
        style: "compact"
    ),
    Field("Password",
        cast: FormCast.password(),
        validate: FormValidator.password(strength: 1),
        style: "compact"
    ),
  ];
}
''';
