import 'package:flutter/material.dart';
import 'package:testcase/features/model/albums.dart';
import 'package:testcase/features/resources/index.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.albums});

  final Albums albums;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.detailViewAppBarTitle),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Image.network(albums.thumbnailUrl!),
              title: Text(albums.title!),
              subtitle: Text(albums.id!.toString()),
            ),
          )
        ],
      )),
    );
  }
}
