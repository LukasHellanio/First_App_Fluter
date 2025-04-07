import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

/// A simple helper class to check what kind of platform or device the app is running on.
class DeviceInfo {
  /// Returns `true` if the app is running on a web browser.
  static bool get isWeb => kIsWeb;

  /// Returns `true` if the app is running on a mobile device (Android or iOS).
  /// Returns `false` on Web or Desktop.
  static bool get isMobile {
    if (kIsWeb) return false; // Platform cannot be used on web
    return Platform.isAndroid || Platform.isIOS;
  }

  /// Returns `true` if the app is running on a desktop OS (Windows, macOS, or Linux).
  /// Returns `false` on Web or Mobile.
  static bool get isDesktop {
    if (kIsWeb) return false; // Web is not considered desktop here
    return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  }

  /// Returns `true` if the app is running on a larger screen (Web or Desktop).
  /// Useful for deciding when to show extended layouts like NavigationRail.
  static bool get isTabletOrWeb {
    return isWeb || isDesktop;
  }
}
