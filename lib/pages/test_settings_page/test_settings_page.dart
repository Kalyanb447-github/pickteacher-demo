import 'package:flutter/material.dart';
class TestSettingsPage extends StatefulWidget {
  @override
  _TestSettingsPageState createState() => _TestSettingsPageState();
}

class _TestSettingsPageState extends State<TestSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            leading: Hero(
              tag: 'profile-pic',
              child: CircleAvatar(
                radius: 32.0,
              //  backgroundImage: CachedNetworkImageProvider('https://api.adorable.io/avatars/285/circle@adorable.png'),
              ),
            ),
            title: Text(
              'NAME',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'STATUS',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            onTap: (){
              // Application.router.navigateTo(
              //   context,
              //   Routes.yourProfile,
              //   transition: TransitionType.fadeIn,
              // );
            },
          ),
          Divider(height: 0.0,),
          SettingItem(
              icon: Icons.vpn_key,
              title: 'Account',
              subtitle: 'Privacy, security, change number',
              onTap: (){
            // Application.router.navigateTo(
            //   context,
            //   Routes.accountSettings,
            //   transition: TransitionType.inFromRight,
            // );
          }),
          SettingItem(
              icon: Icons.chat,
              title: 'Chats',
              subtitle: 'Backup, history, wallpaper',
              onTap: (){
                // Application.router.navigateTo(
                //   context,
                //   Routes.chatsSettings,
                //   transition: TransitionType.inFromRight,
                // );
              }),
          SettingItem(
              icon: Icons.notifications,
              title: 'Notifications',
              subtitle: 'Message, group & call tones',
              onTap: (){
                // Application.router.navigateTo(
                //   context,
                //   Routes.notificationsSettings,
                //   transition: TransitionType.inFromRight,
                // );
              }),
          SettingItem(
              icon: Icons.data_usage,
              title: 'Data and storage usage',
              subtitle: 'Network usage, auto-download',
              onTap: (){
                // Application.router.navigateTo(
                //   context,
                //   //Routes.dataSettings,
                //   Routes.futureTodo,
                //   transition: TransitionType.inFromRight,
                // );
              }),
          SettingItem(
              icon: Icons.help_outline,
              title: 'Help',
              subtitle: 'FAQ, contact us, privacy policy',
              onTap: (){
                // Application.router.navigateTo(
                //   context,
                //   Routes.helpSettings,
                //   transition: TransitionType.inFromRight,
                // );
              }),
          Divider(indent: 72.0, height: 0.0,),
          Builder(
            builder:(context) {
              return SettingItem(
                  icon: Icons.group,
                  title: 'Invite a friend',
                  onTap: (){
                   // AndroidIntentHelpers.inviteFriend(context);
                  });
            }
          ),
        ],
      )
    );
  }
}


///
class SettingItem extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;
  final padding;

  SettingItem({this.icon, this.title, this.subtitle, this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    if(subtitle == null) {
      return ListTile(
        contentPadding: padding ?? EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: icon == null ? null : Container(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Color.fromRGBO(7, 94, 84, 0.7),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: onTap,
      );
    }
    return ListTile(
      contentPadding: padding ?? null,
      leading: icon == null ? null : Container(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Color.fromRGBO(7, 94, 84, 0.7),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
          subtitle
      ),
      onTap: onTap,
    );
  }

}
//
class SettingItemHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final padding;

  SettingItemHeader({this.title, this.subtitle, this.padding});

  @override
  Widget build(BuildContext context) {
    if(subtitle != null) {
      return ListTile(
        title: Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
               color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: subtitle == null ? null : Text(
            subtitle
        ),
        contentPadding: padding,
      );
    }
    return Padding(
        padding: padding,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  }

}