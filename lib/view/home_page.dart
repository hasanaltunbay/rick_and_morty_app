import 'package:flutter/material.dart';
import 'package:flutter_application_11/model/character.dart';
import 'package:flutter_application_11/view_model/home_page_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rick and Morty",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return Consumer<HomePageViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.characters.length,
        itemBuilder: (context, index) {
          Character character = viewModel.characters[index];
          return Card(
            color: Colors.grey,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(character.image),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "${character.status} - ${character.species}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Last Known Location:"),
                        Text(
                          character.locationName,
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("First seen in:"),
                        Text(
                          character.originName,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
