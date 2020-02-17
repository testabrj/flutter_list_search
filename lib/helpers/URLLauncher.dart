import 'package:url_launcher/url_launcher.dart';
class URLLauncher {

  launchURL(String URL) async{

    if(await canLaunch(URL)){

      await launch(URL);
    } else {

      throw 'Could not launch $URL';
    }


  }

}