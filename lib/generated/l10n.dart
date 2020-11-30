// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get iniciarSesionText {
    return Intl.message(
      'Login',
      name: 'iniciarSesionText',
      desc: '',
      args: [],
    );
  }

  /// `The user you have entered does not exist`
  String get usuarioNoExistenteText {
    return Intl.message(
      'The user you have entered does not exist',
      name: 'usuarioNoExistenteText',
      desc: '',
      args: [],
    );
  }

  /// `Institutional Email Address`
  String get correoInstitucionalText {
    return Intl.message(
      'Institutional Email Address',
      name: 'correoInstitucionalText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get contraText {
    return Intl.message(
      'Password',
      name: 'contraText',
      desc: '',
      args: [],
    );
  }

  /// `Did you forget your password?`
  String get preguntaOlvidasteContraText {
    return Intl.message(
      'Did you forget your password?',
      name: 'preguntaOlvidasteContraText',
      desc: '',
      args: [],
    );
  }

  /// `You do not have an account?`
  String get preguntaNoTienesCuentaText {
    return Intl.message(
      'You do not have an account?',
      name: 'preguntaNoTienesCuentaText',
      desc: '',
      args: [],
    );
  }

  /// `Sign up here`
  String get registrateAquiText {
    return Intl.message(
      'Sign up here',
      name: 'registrateAquiText',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get registrarseText {
    return Intl.message(
      'Sign in',
      name: 'registrarseText',
      desc: '',
      args: [],
    );
  }

  /// `Contact list`
  String get listaContactosText {
    return Intl.message(
      'Contact list',
      name: 'listaContactosText',
      desc: '',
      args: [],
    );
  }

  /// `Enter Data`
  String get ingreseDatosText {
    return Intl.message(
      'Enter Data',
      name: 'ingreseDatosText',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contactoText {
    return Intl.message(
      'Contact',
      name: 'contactoText',
      desc: '',
      args: [],
    );
  }

  /// `Contact information`
  String get informacionContactoText {
    return Intl.message(
      'Contact information',
      name: 'informacionContactoText',
      desc: '',
      args: [],
    );
  }

  /// `User information`
  String get informacionUsuarioText {
    return Intl.message(
      'User information',
      name: 'informacionUsuarioText',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nombreText {
    return Intl.message(
      'Name',
      name: 'nombreText',
      desc: '',
      args: [],
    );
  }

  /// `CUI`
  String get cuiText {
    return Intl.message(
      'CUI',
      name: 'cuiText',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get correoText {
    return Intl.message(
      'Email',
      name: 'correoText',
      desc: '',
      args: [],
    );
  }

  /// `Professional school`
  String get escuelaText {
    return Intl.message(
      'Professional school',
      name: 'escuelaText',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get agregarText {
    return Intl.message(
      'Add',
      name: 'agregarText',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get actualizarText {
    return Intl.message(
      'Update',
      name: 'actualizarText',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alertaText {
    return Intl.message(
      'Alert',
      name: 'alertaText',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete this contact?`
  String get preguntaEliminarContactoText {
    return Intl.message(
      'Are you sure to delete this contact?',
      name: 'preguntaEliminarContactoText',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelarText {
    return Intl.message(
      'Cancel',
      name: 'cancelarText',
      desc: '',
      args: [],
    );
  }

  /// `Name: {nombre}`
  String nombrePlaceHolder(Object nombre) {
    return Intl.message(
      'Name: $nombre',
      name: 'nombrePlaceHolder',
      desc: '',
      args: [nombre],
    );
  }

  /// `CUI: {cui}`
  String cuiPlaceHolder(Object cui) {
    return Intl.message(
      'CUI: $cui',
      name: 'cuiPlaceHolder',
      desc: '',
      args: [cui],
    );
  }

  /// `Email: {correo}`
  String correoPlaceHolder(Object correo) {
    return Intl.message(
      'Email: $correo',
      name: 'correoPlaceHolder',
      desc: '',
      args: [correo],
    );
  }

  /// `Professional school: {escuela}`
  String escuelaPlaceHolder(Object escuela) {
    return Intl.message(
      'Professional school: $escuela',
      name: 'escuelaPlaceHolder',
      desc: '',
      args: [escuela],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}