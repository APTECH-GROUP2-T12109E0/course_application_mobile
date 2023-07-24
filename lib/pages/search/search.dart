import 'package:course_application_mobile/common/widgets/base_text_widgets.dart';
import 'package:course_application_mobile/pages/search/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late MySearchController _searchController;
  @override
  void didChangeDependencies() {
    _searchController = MySearchController(context:context);
    _searchController.init();
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Search"),
      body: Container(),
    );
  }
}
