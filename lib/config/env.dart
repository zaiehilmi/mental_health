enum Environment { dev, test, prod }

class Env {
  static late Environment env;

  static late String baseUrl;
  // add more vars

  static void init() {
    const envString = String.fromEnvironment('APP_ENV', defaultValue: 'dev');
    env = _parseEnvironment(envString);
    _configure();
  }

  static void _dev() {
    baseUrl = 'https://catfact.ninja';
    // add more dev vars
  }

  static void _test() {
    baseUrl = 'https://catfact.ninja';
    // add more test vars
  }

  static void _prod() {
    baseUrl = 'https://catfact.ninja';
    // add more prod vars
  }

  static void _configure() {
    switch (env) {
      case Environment.dev:
        _dev();
        break;
      case Environment.test:
        _test();
        break;
      case Environment.prod:
        _prod();
        break;
    }
  }

  static Environment _parseEnvironment(String value) {
    switch (value.toLowerCase()) {
      case 'prod':
        return Environment.prod;
      case 'test':
        return Environment.test;
      case 'dev':
      default:
        return Environment.dev;
    }
  }
}
