String stubRegisterForm() => '''
import 'package:nylo_framework/nylo_framework.dart';

/* Register Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/5.20.0/forms#how-it-works
| Casts: https://nylo.dev/docs/5.20.0/forms#form-casts
| Validation Rules: https://nylo.dev/docs/5.20.0/validation#validation-rules
|-------------------------------------------------------------------------- */

class RegisterForm extends NyFormData {

  RegisterForm({String? name}) : super(name ?? "register");

  @override
  fields() => [
     Field("Name",
        autofocus: true,
        cast: FormCast.text(),
         validate: FormValidator.rule("not_empty"),
        style: "compact"
    ),
    Field("Email",
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
