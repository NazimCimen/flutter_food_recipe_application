class AppValidators {
  static final AppValidators _instance = AppValidators._internal();
  factory AppValidators() {
    return _instance;
  }
  AppValidators._internal();

  final String emailRegExp =
      r'^[^<>()\[\]\\.,;:\s@\"]+(\.[^<>()\[\]\\.,;:\s@\"]+)*|(\".+\")@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final String passwordRegExp = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
  final String usernameRegExp = r'^[a-zA-Z0-9_]{3,10}$';
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen geçerli bir e-posta giriniz';
    }
    final validateEmail = RegExp(emailRegExp);
    if (!validateEmail.hasMatch(value)) {
      return 'Geçersiz e-posta formatı';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen şifrenizi giriniz';
    } else if (value.length < 6) {
      return 'Şifreniz en az 6 karakter olmalıdır';
    } else {
      final validatePassword = RegExp(passwordRegExp);
      if (!validatePassword.hasMatch(value)) {
        return 'Şifreniz en az bir harf ve bir rakam içermelidir';
      }
    }
    return null;
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen kullanıcı adınızı giriniz';
    } else if (value.length < 3 || value.length > 10) {
      return 'Kullanıcı adınız 3 ile 10 karakter arasında olmalıdır';
    } else {
      final validateUsername = RegExp(usernameRegExp);
      if (!validateUsername.hasMatch(value)) {
        return 'Kullanıcı adınız sadece harf, rakam ve alt çizgi içerebilir';
      }
    }
    return null;
  }
}
