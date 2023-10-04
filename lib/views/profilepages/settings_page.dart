


import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:dpo/views/settingpages/affili_evidence_page.dart';
import 'package:dpo/views/settingpages/delete_account_page.dart';
import 'package:dpo/views/settingpages/edit_address_page.dart';
import 'package:dpo/views/settingpages/edit_affiliation_page.dart';
import 'package:dpo/views/settingpages/edit_email_page.dart';
import 'package:dpo/views/settingpages/logout_page.dart';
import 'package:dpo/views/settingpages/id_card_page.dart';
import 'package:dpo/views/settingpages/rules_page.dart';
import 'package:dpo/views/settingpages/sms_verification_page.dart';
import '../settingpages/bank_account_page.dart';
import '../settingpages/contact_support_page.dart';
import '../settingpages/edit_name_page.dart';
import 'package:dpo/viewmodels/settingviewmodels/account_viewmodel.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void _showAgePicker(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now(),
      onChanged: (date) {},
      onConfirm: (date) {},
      currentTime: DateTime.now(),
      locale: LocaleType.jp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AccountViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 90, 0, 0),
          title: const Text('SETTINGS', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.white,
        body: Consumer<AccountViewModel>(
          builder: (context, viewModel, child) {
            return ListView(
              children: [
                ListTile(
                  title: const Text('Public Opinion Rules', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RulesPage()));
                  }
                ),
                const ListTile(
                  title: Text('AUTH001', style: TextStyle(color: Color.fromARGB(180, 60, 0, 0))),
                ),
                ListTile(
                  title: const Text('Email', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditEmailPage()));
                  }
                ),
                ListTile(
                  title: const Text('SMS', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SmsVerificationPage()));
                  }
                ),
                const ListTile(
                  title: Text('AUTH002', style: TextStyle(color: Color.fromARGB(180, 60, 0, 0))),
                ),
                ListTile(
                  title: const Text('Bank Account', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BankAccountSetupPage()));
                  },
                ),
                ListTile(
                  title: const Text('ID Card', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const IdCardPage()));
                  },
                ),
                const ListTile(
                  title: Text('AUTH003', style: TextStyle(color: Color.fromARGB(180, 60, 0, 0))),
                ),
                ListTile(
                  title: const Text('Full Name'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditNamePage()));
                  }
                ),
                ListTile(
                  title: const Text('Age'),
                  onTap: () {
                    _showAgePicker(context);
                  },
                ),
                ListTile(
                  title: const Text('Address', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddressSetPage()));
                  },
                ),
                const ListTile(
                  title: Text('AUTH004', style: TextStyle(color: Color.fromARGB(180, 60, 0, 0))),
                ),
                ListTile(
                  title: const Text('Affiliation', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAffiliationPage()));
                  },
                ),
                ListTile(
                  title: const Text('Evidence', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AffiliEvidencePage(evidenceFilePaths: [], evidenceFileNames: [],)));
                  },
                ),
                SwitchListTile(
                  title: const Text('Account Closed'),
                  value: viewModel.isAccountOpen,
                  onChanged: (value) {
                    viewModel.toggleAccount();
                  },
                  inactiveTrackColor: const Color.fromARGB(108, 84, 74, 70),
                  activeColor: const Color.fromARGB(255, 0, 255, 8),
                ),
                ListTile(
                  title: const Text('Contacts'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPage()));
                  },
                ),
                ListTile(
                  title: const Text('Development'),
                  onTap: () async {
                    const url = 'https://github.com/brief69/pub_op';
                    if (await canLaunchUrl(Uri.parse(url))) {
                       await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text('Log Out', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LogoutPage()));
                  }
                ),
                ElevatedButton(
                  child: const Text('Delete Account', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DeleteAccountPage()));
                  }
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
