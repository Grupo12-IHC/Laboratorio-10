// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(correo) => "Email: ${correo}";

  static m1(cui) => "CUI: ${cui}";

  static m2(escuela) => "Professional school: ${escuela}";

  static m3(nombre) => "Name: ${nombre}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "actualizarText" : MessageLookupByLibrary.simpleMessage("Update"),
    "agregarText" : MessageLookupByLibrary.simpleMessage("Add"),
    "alertaText" : MessageLookupByLibrary.simpleMessage("Alert"),
    "cancelarText" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "contactoText" : MessageLookupByLibrary.simpleMessage("Contact"),
    "contraText" : MessageLookupByLibrary.simpleMessage("Password"),
    "correoInstitucionalText" : MessageLookupByLibrary.simpleMessage("Institutional Email Address"),
    "correoPlaceHolder" : m0,
    "correoText" : MessageLookupByLibrary.simpleMessage("Email"),
    "cuiPlaceHolder" : m1,
    "cuiText" : MessageLookupByLibrary.simpleMessage("CUI"),
    "escuelaPlaceHolder" : m2,
    "escuelaText" : MessageLookupByLibrary.simpleMessage("Professional school"),
    "informacionContactoText" : MessageLookupByLibrary.simpleMessage("Contact information"),
    "informacionUsuarioText" : MessageLookupByLibrary.simpleMessage("User information"),
    "ingreseDatosText" : MessageLookupByLibrary.simpleMessage("Enter Data"),
    "iniciarSesionText" : MessageLookupByLibrary.simpleMessage("Login"),
    "listaContactosText" : MessageLookupByLibrary.simpleMessage("Contact list"),
    "nombrePlaceHolder" : m3,
    "nombreText" : MessageLookupByLibrary.simpleMessage("Name"),
    "preguntaEliminarContactoText" : MessageLookupByLibrary.simpleMessage("Are you sure to delete this contact?"),
    "preguntaNoTienesCuentaText" : MessageLookupByLibrary.simpleMessage("You do not have an account?"),
    "preguntaOlvidasteContraText" : MessageLookupByLibrary.simpleMessage("Did you forget your password?"),
    "registrarseText" : MessageLookupByLibrary.simpleMessage("Sign in"),
    "registrateAquiText" : MessageLookupByLibrary.simpleMessage("Sign up here"),
    "usuarioNoExistenteText" : MessageLookupByLibrary.simpleMessage("The user you have entered does not exist")
  };
}
