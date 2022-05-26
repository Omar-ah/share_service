import 'dart:io';

import 'package:shelf/shelf_io.dart';
import 'package:shelf_static/shelf_static.dart';

class Awesome {
  bool get isAwesome => true;
}

class ShareService {
  late List<String> _files;
  InternetAddress _host_address = InternetAddress.anyIPv4;
  late int _port;
  // Creates an object that will be used as a handle to use this library.
  //
  ShareService(this._files, {dynamic address = "0.0.0.0", int port = 8080}) {
    _port = port;
    if (address is String) {
      _host_address = InternetAddress(address);
    } else if (address is InternetAddress) {
      _host_address = address;
    } else {
      throw Exception(
          'address of type ${address.runtimeType} is not supported\nmust be of type ${String} or ${InternetAddress}');
    } // if the string doesn't represent a valid ip address then InternetAddress class throws that exception
  }

  void run() async {
    // Use any available host or container IP (usually `0.0.0.0`).
    final ip = InternetAddress.anyIPv4;
    var staticHandler = createStaticHandler('web');
    final port = _port;
    final server = await serve(staticHandler, _host_address, port);
    print('Server listening on port ${server.port}');
  }
}
