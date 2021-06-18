import 'package:shared_preferences/shared_preferences.dart';

class states {
  static void set_auth() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("is_auth", true);
  }

  static Future<bool> isFirstTime() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    var isFirstTime = pf.getBool('first_time');
    if (isFirstTime != null && !isFirstTime) {
      pf.setBool('first_time', false);
      return false;
    } else {
      pf.setBool('first_time', false);
      return true;
    }
  }

  static void first_time_setup_selection() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    isFirstTime().then((isFirstTime) {
      if (isFirstTime) {
        pref.setInt("selected_account", 1);
      } else {
        print("it is not first");
      }
    });
  }

  //--
  static Future<int> state_selected_account() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int t = pref.getInt("selected_account");
    return t;
  }

  static Future<int> state_all_selected_account() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int t = pref.getInt("all_selected_account_idx");
    return t;
  }

  static Future<bool> state_is_auth_fetch() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool ctxt_state = pref.getBool('is_auth');
    return ctxt_state;
  }

  static void update_account_state(int id) async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setInt("selected_account", id);
  }

  //-------------------------------------------------------------------------------
  static void set_theme_mode(int mode) async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setInt("selected_theme", mode);
  }

  static Future<int> get_theme_mode() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    int t = pf.getInt("selected_theme");
    return t;
  }

  static void first_time_theme_selection() async {
    SharedPreferences pf = await SharedPreferences.getInstance();

    isFirstTime().then((isFirstTime) {
      if (isFirstTime) {
        pf.setInt("selected_theme", 1);
      } else {
        print("it is not first");
      }
    });
  }

  //----------------------------------------------------------------------
  static void set_notification_settings(bool val) async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setBool("notification_settings", val);
  }

  static Future<bool> fetch_notification_settings() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    return pf.get("notification_settings");
  }

  static Future<void> set_notification_at_first_launch() async {
    SharedPreferences pf = await SharedPreferences.getInstance();

    isFirstTime().then((isFirstTime) {
      if (isFirstTime) {
        pf.setBool("notification_settings", true);
      } else {
        print("it is not first");
      }
    });
  }

  //-------------------------------------------------sftp area
  static Future<void> set_sftp_host(String host) async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setString("sftp_host", host);
  }

  static Future<void> set_sftp_port(String port) async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setString("sftp_port", port);
  }

  static Future<void> set_sftp_username(String user) async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setString("sftp_username", user);
  }

  static Future<void> set_sftp_pass(String password) async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setString("sftp_pass", password);
  }

  static Future<void> set_sftp_route(String route) async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setString("sftp_dir_route", route);
  }

  //-------------
  static Future<String> get_sftp_route() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    return pf.getString("sftp_dir_route");
  }
  static Future<String> get_sftp_host() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    return pf.getString("sftp_host");
  }
   static Future<String> get_sftp_port() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    return pf.getString("sftp_port");
  }
  static Future<String> get_sftp_username() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    return pf.getString("sftp_username");
  }
    static Future<String> get_sftp_password() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    return pf.getString("sftp_pass");
  }


}
