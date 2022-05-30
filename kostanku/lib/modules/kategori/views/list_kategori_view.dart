import 'package:flutter/material.dart';
import 'package:kostanku/components/custom_appbar.dart';
import 'package:kostanku/constants/pallete.dart';

class ListKategoriView extends StatefulWidget {
  const ListKategoriView({Key? key}) : super(key: key);

  @override
  State<ListKategoriView> createState() => _ListKategoriViewState();
}

class _ListKategoriViewState extends State<ListKategoriView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.background,
      appBar: _buildAppbar(),
    );
  }

  AppBar _buildAppbar() {
    return CustomAppbar(
      context: context,
      backButton: true,
    );
  }
}
