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
    final port = int.parse(Platform.environment['PORT'] ?? '8080');
    final server = await serve(staticHandler, ip, port);
    print('Server listening on port ${server.port}');
  }

  // TODO: implement these functions (copy, clean)
  // note:  you can access  tmp folder      by [Directory.systemTemp]
  //                        path separator  by [Platform.pathSeparator]

  ///copies the shared files to a temp dir in order to make
  ///them accessable to handler that will serve them in the web server
  void _copySharedFilesToTempDir() {}

  ///delete the temporary directory in the tmp folder
  void _cleanUpTempDir() {}
}
