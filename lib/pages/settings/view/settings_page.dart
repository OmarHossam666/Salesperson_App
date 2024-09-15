import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationsEnabled = true;
  bool isDarkModeEnabled = false;
  bool isTwoFactorAuthEnabled = false;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                'Update Profile',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text(
                'Change Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text(
              'Enable Notifications',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: isNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                isNotificationsEnabled = value;
              });
            },
          ),
          const SizedBox(height: 20),
          DropdownButton<String>(
            value: selectedLanguage,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            items: <String>['English', 'Spanish', 'French', 'Germany', 'Arabic']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedLanguage = newValue!;
              });
            },
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text(
              'Dark Mode',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: isDarkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                isDarkModeEnabled = value;
              });
            },
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text(
              'Two-Factor Authentication',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: isTwoFactorAuthEnabled,
            onChanged: (bool value) {
              setState(() {
                isTwoFactorAuthEnabled = value;
              });
            },
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.devices),
              title: const Text(
                'Active Sessions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.update),
              title: const Text(
                'Check for Updates',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.backup),
              title: const Text(
                'Backup Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.help),
              title: const Text(
                'Help Center',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.contact_support),
              title: const Text(
                'Contact Support',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}