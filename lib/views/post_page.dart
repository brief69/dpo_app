
// post_page.dart
import 'package:flutter/material.dart';
import 'package:dpo/viewmodels/post_viewmodel.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostViewModel(),
      child: Consumer<PostViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: const Color.fromARGB(255, 108, 7, 0),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(color: Colors.white), 
                  decoration: const InputDecoration(
                    labelText: 'CAPTION(内容)',
                    labelStyle: TextStyle(color: Colors.white), 
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), 
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), 
                    ),
                  ),
                  maxLines: 6,
                  onChanged: (value) => model.setcaption(value),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'HARM INDEX(害度)',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onChanged: (value) => model.setharmIndex(value),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white), 
                  onPressed: () async {
                    DateTimeRange? dateRange = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime.now().subtract(const Duration(days: 365 * 10)), 
                      lastDate: DateTime.now(),
                    );
                    if (dateRange != null) {
                      model.setPeriod(dateRange);
                    }
                  },
                  child: const Text(
                    "Select Period",
                    style: TextStyle(color: Color.fromARGB(255, 108, 7, 0)),
                  ),
                ),
                const Spacer(),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'BOUNTY(懸賞金)',
                    labelStyle: TextStyle(color: Colors.white),
                    suffix: Text("B", style: TextStyle(color: Colors.white)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onChanged: (value) => model.setBounty(value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
