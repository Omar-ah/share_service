import 'dart:io';
import 'dart:typed_data';

class Awesome {
  bool get isAwesome => true;
}

class ShareService {
  late List<String> _files;
  InternetAddress _host_address = InternetAddress.anyIPv4;
  late int _port;
  ShareService(this._files, {dynamic address = "0.0.0.0", int port = 8080}) {
    _port = port;
    if (address is String) {
      _host_address = InternetAddress(address);
    } else if (address is InternetAddress) {
      _host_address = address;
    }
  }

  void run() async {}
}
