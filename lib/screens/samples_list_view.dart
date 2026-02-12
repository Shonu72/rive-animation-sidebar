import 'package:flutter/material.dart';
import 'package:flutter_samples/models/samples.dart';

class SamplesListView extends StatefulWidget {
  const SamplesListView(
      {super.key,
      this.title = "",
      this.backEnabled = true,
      required this.listData});

  final String title;
  final bool backEnabled;
  final List<SampleData> listData;

  @override
  State<SamplesListView> createState() => _SamplesListViewState();
}

class _SamplesListViewState extends State<SamplesListView> {
  bool isGrid = false;

  void onSamplePress(int index) {
    var routeName = widget.listData[index].routeName;
    if (routeName != null) {
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 0.3, color: Colors.grey.shade400)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.backEnabled
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          splashRadius: 24,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () => Navigator.pop(context))
                      : Container(width: 32),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      icon: const Icon(Icons.view_agenda),
                      splashRadius: 24,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        setState(() {
                          isGrid = !isGrid;
                        });
                      }),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
