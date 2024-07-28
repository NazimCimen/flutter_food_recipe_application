abstract class OnBoardJsonPathProvider {
  String getJsonPath(String languageCode);
}

class OnBoardJsonPathProviderImpl implements OnBoardJsonPathProvider {
  @override
  String getJsonPath(String languageCode) {
    const basePath = 'assets/app_datas/onboard_jsons/onboard_page_datas_';
    switch (languageCode) {
      case 'tr':
        return '${basePath}tr.json';
      case 'ar':
        return '${basePath}ar.json';
      case 'de':
        return '${basePath}de.json';
      case 'es':
        return '${basePath}es.json';
      case 'fr':
        return '${basePath}fr.json';
      case 'it':
        return '${basePath}it.json';
      case 'ja':
        return '${basePath}ja.json';
      case 'pt':
        return '${basePath}pt.json';
      case 'ru':
        return '${basePath}ru.json';
      case 'zh':
        return '${basePath}zh.json';
      case 'en':
      default:
        return '${basePath}en.json';
    }
  }
}
