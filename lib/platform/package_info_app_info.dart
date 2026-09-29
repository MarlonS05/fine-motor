import 'package:package_info_plus/package_info_plus.dart';
import 'package:finemotor/domain/services/app_info_port.dart';

class PackageInfoAppInfo implements AppInfoPort {
  @override
  Future<String> getVersionLabel() async {
    final info = await PackageInfo.fromPlatform();
    return '${info.version}+${info.buildNumber}';
  }
}
