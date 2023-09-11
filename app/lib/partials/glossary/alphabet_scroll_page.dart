import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

import '../../models/word.dart';
import '../../styles/constants.dart';

//code from : https://www.youtube.com/watch?v=mGgizUoyeYY
class _AZItem extends ISuspensionBean {
  final Word word;
  final String tag;
  late String title = word.word;
  late String image = word.previewImage;

  _AZItem({required this.word, required this.tag});

  @override
  String getSuspensionTag() => tag;
}

class AlphabetScrollPage extends StatefulWidget {
  final List<Word> items;
  final ValueChanged<Word> onClickedItem;

  const AlphabetScrollPage(
      {required this.items, required this.onClickedItem, Key? key})
      : super(key: key);

  @override
  State<AlphabetScrollPage> createState() => _AlphabetScrollPageState();
}

class _AlphabetScrollPageState extends State<AlphabetScrollPage> {
  List<_AZItem> items = [];

  @override
  void initState() {
    super.initState();
    initList(widget.items);
  }

  void initList(List<Word> items) {
    this.items = items
        .map((item) => _AZItem(word: item, tag: item.word[0].toUpperCase()))
        .toList();

    SuspensionUtil.sortListBySuspensionTag(this.items);
    SuspensionUtil.setShowSuspensionStatus(this.items);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AzListView(
      data: items,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildListItems(item);
      },
      indexBarHeight: MediaQuery.of(context).size.height,
      indexBarAlignment: Alignment.topRight,
      indexHintBuilder: (context, hint) {
        return Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          decoration:
              const BoxDecoration(color: kCTAColor, shape: BoxShape.circle),
          child: Text(hint,
              style: const TextStyle(color: kWhite, fontSize: kMediumFontSize)),
        );
      },
      indexBarOptions: const IndexBarOptions(
        selectTextStyle: TextStyle(fontWeight: FontWeight.bold, color: kWhite),
        selectItemDecoration:
            BoxDecoration(color: kCTAColor, shape: BoxShape.circle),
        needRebuild: true,
        textStyle: kGlossaryNavigationStyle,
        indexHintAlignment: Alignment.centerRight,
      ),
    );
  }

  Widget _buildListItems(_AZItem item) {
    final tag = item.getSuspensionTag();
    final offstage = !item.isShowSuspension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Offstage(offstage: offstage, child: buildHeader(tag)),
        ListTile(
            title: Row(
              children: [
                Image.network(item.image, width: 34, height: 34),
                const SizedBox(width: kDefaultSize * 3),
                Text(item.title, style: kGlossaryWordStyle),
              ],
            ),
            onTap: () => widget.onClickedItem(item.word)),
      ],
    );
  }

  Widget buildHeader(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultSize * 3, vertical: kDefaultSize),
      alignment: Alignment.centerLeft,
      color: kGlossaryHeaderColor,
      width: MediaQuery.of(context).size.width - 70,
      child: Text(
        tag,
        softWrap: false,
        style: kGlossaryHeaderStyle,
      ),
    );
  }
}
