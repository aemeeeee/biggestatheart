import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'Routes/login.dart';
import 'Routes/home_page.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'amplifyconfiguration.dart';
import 'package:shared_preferences/shared_preferences.dart';

const storage = FlutterSecureStorage();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var jwt = prefs.getString('jwt');
  runApp(MyApp(
    jwt: jwt,
  ));
}

Future<void> _configureAmplify() async {
  try {
    final auth = AmplifyAuthCognito();
    final storage = AmplifyStorageS3();
    await Amplify.addPlugins([auth, storage]);
    await Amplify.configure(amplifyconfig);
  } catch (error) {
    print(error);
  }
}

class MyApp extends StatelessWidget {
  final String? jwt;
  const MyApp({Key? key, required this.jwt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        home: jwt == null ? const LoginPage() : const HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(fontSize: 14),
                floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 71, 88, 149), fontSize: 14)),
            textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Color.fromARGB(255, 71, 88, 149))),
      ),
    );
  }
}
