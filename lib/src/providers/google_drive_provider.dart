import 'package:flutter/widgets.dart';
import 'package:geo_espe_app_movilidad/src/providers/secure_storage_provider.dart';
import 'package:googleapis/drive/v3.dart' as googleApis;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

const _clientId =
    "301506008816-sld86cq4l4ci40mu04i75n2q4qsi1i2d.apps.googleusercontent.com";
const _clientSecret = "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";
const _scopes = [googleApis.DriveApi.driveFileScope];

class GoolgleProvider extends ChangeNotifier {
  final storage = SecureStorage();
  http.Client? authGoogle;

  ///login Google
  Future<http.Client> loginGoogle() async {
    //Get Credentials
    var credentials = await storage.getCredentials();

    if (credentials == null) {
      var authClient = await clientViaUserConsent(
          ClientId(_clientId, _clientSecret), _scopes, (url) {
        //Open Url in Browser
        launch(url);
      });
      authGoogle = authClient;

      //Save Credentials
      await storage.saveCredentials(authClient.credentials.accessToken,
          authClient.credentials.refreshToken ?? "");

      return authClient;
    } else {
      DateTime expiry = DateTime.now();

      if (credentials["expiry"] != null) {
        expiry = DateTime.tryParse(credentials["expiry"])!;
      }

      //Already authenticated
      return authenticatedClient(
          http.Client(),
          AccessCredentials(
              AccessToken(credentials["type"], credentials["data"], expiry),
              credentials["refreshToken"],
              _scopes));
    }
  }

  void getContentFile() async {
    authGoogle ??= await loginGoogle();

    //var drive = googleApis.DriveApi(authGoogle!);

    //drive.files.g
  }
}
