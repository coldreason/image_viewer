import 'package:logger/logger.dart';

class AppLogger {
  static final Logger logger = initLogger();

  static Logger initLogger() {
    return Logger(
      level: Level.all,
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 8,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
    );
  }
}
