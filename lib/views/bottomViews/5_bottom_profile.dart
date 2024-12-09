import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomProfilePage extends StatelessWidget {
  const BottomProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.94),
      appBar: AppBar(
        title: Text(
          "Ayarlar",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // kullanıcı kartı
            SimpleUserCard(
              userName: "Kullanıcı Adı",
              userProfilePic: AssetImage("assets/images/profil.jpg"),
            ),
            SettingsGroup(
              backgroundColor: Colors.blue,
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.pencil_outline,
                  iconStyle: IconStyle(),
                  title:
                  'Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm',
                  subtitle:
                  "Ziar'App'i kişiselleştir Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm Görünüm",
                  titleMaxLine: 1,
                  subtitleMaxLine: 1,
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.fingerprint,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Gizlilik',
                  subtitle: "Gizliliğinizi artırmak için Ziar'App'i kilitleyin",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Karanlık mod',
                  subtitle: "Otomatik",
                  trailing: Switch.adaptive(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'Hakkında',
                  subtitle: "Ziar'App hakkında daha fazla bilgi edinin",
                ),
              ],
            ),
            // Bir ayar başlığı ekleyebilirsiniz
            SettingsGroup(
              settingsGroupTitle: "Hesap",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  title: "Çıkış Yap",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.repeat,
                  title: "E-posta değiştir",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  title: "Hesabı sil",
                  titleStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
