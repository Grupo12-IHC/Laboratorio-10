// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static m0(correo) => "Correio eletrônico: ${correo}";

  static m1(cui) => "CUI: ${cui}";

  static m2(escuela) => "Escola Profissional: ${escuela}";

  static m3(nombre) => "Nome: ${nombre}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "actualizarText" : MessageLookupByLibrary.simpleMessage("Atualizar"),
    "agregarText" : MessageLookupByLibrary.simpleMessage("Adicionar"),
    "alertaText" : MessageLookupByLibrary.simpleMessage("Alerta"),
    "cancelarText" : MessageLookupByLibrary.simpleMessage("Cancelar"),
    "contactoText" : MessageLookupByLibrary.simpleMessage("Contato"),
    "contraText" : MessageLookupByLibrary.simpleMessage("Senha"),
    "correoInstitucionalText" : MessageLookupByLibrary.simpleMessage("Correio Institucional"),
    "correoPlaceHolder" : m0,
    "correoText" : MessageLookupByLibrary.simpleMessage("Correio eletrônico"),
    "cuiPlaceHolder" : m1,
    "cuiText" : MessageLookupByLibrary.simpleMessage("CUI"),
    "escuelaPlaceHolder" : m2,
    "escuelaText" : MessageLookupByLibrary.simpleMessage("Escola Profissional"),
    "informacionContactoText" : MessageLookupByLibrary.simpleMessage("Informações de Contato"),
    "informacionUsuarioText" : MessageLookupByLibrary.simpleMessage("Informação do usuário"),
    "ingreseDatosText" : MessageLookupByLibrary.simpleMessage("Inserir dados"),
    "iniciarSesionText" : MessageLookupByLibrary.simpleMessage("Iniciar Sessão"),
    "listaContactosText" : MessageLookupByLibrary.simpleMessage("Lista de contatos"),
    "nombrePlaceHolder" : m3,
    "nombreText" : MessageLookupByLibrary.simpleMessage("Nome"),
    "preguntaEliminarContactoText" : MessageLookupByLibrary.simpleMessage("Tem certeza de que deseja excluir este contato?"),
    "preguntaNoTienesCuentaText" : MessageLookupByLibrary.simpleMessage("Você não tem uma conta?"),
    "preguntaOlvidasteContraText" : MessageLookupByLibrary.simpleMessage("Você esqueceu sua senha?"),
    "registrarseText" : MessageLookupByLibrary.simpleMessage("Check-in"),
    "registrateAquiText" : MessageLookupByLibrary.simpleMessage("Assine aqui"),
    "usuarioNoExistenteText" : MessageLookupByLibrary.simpleMessage("O usuário que você digitou não existe")
  };
}
