


// profile_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dpo/views/profilepages/edit_profile_page.dart';
import 'package:dpo/views/profilepages/qr_code_page.dart';
import 'package:dpo/views/profilepages/wallet_tab_page.dart';
import 'package:dpo/views/profilepages/history_tab_page.dart';
import 'package:dpo/viewModels/profile_viewmodel.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel()..fetchProfileDetails(),
      child: Consumer<ProfileViewModel>(
        builder: (_, viewModel, __) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 90, 0, 0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EditProfilePage()),
                      );
                    },
                    child: Text(
                      (viewModel.profile?.name ?? 'default').length > 10
                          ? '${viewModel.profile?.name?.substring(0, 10)}...'
                          : viewModel.profile?.name ?? 'default',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QrCodePage(publicKey: viewModel.profile?.publicKey ?? 'default')),
                      );
                    },
                    child: Text(
                      (viewModel.profile?.publicKey ?? 'default').length > 15
                          ? '${viewModel.profile?.publicKey?.substring(0, 15)}...'
                          : viewModel.profile?.publicKey ?? 'default',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Icon(Icons.settings, color: Colors.white),
                ],
              ),
            ),
            body: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 90, 0, 0),
                    ),
                    tabs: const [
                      Tab(text: 'HISTORY'),
                      Tab(text: 'WALLET'),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        HistoryTabPage(),
                        WalletTabPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
