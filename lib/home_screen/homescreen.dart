import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocstatemanagementtimespan/bloc/homescreenbloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bloc State Management"),
          centerTitle: true,
          elevation: 4.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context
                .read<HomescreenblocBloc>()
                .add(FloatingActionButtonPressedEvent());
          },
          child: const Icon(Icons.visibility),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: BlocBuilder<HomescreenblocBloc, HomescreenblocState>(
                builder: (context, state) {
                  if (state
                      is ContainerVisibleOnFloatingActionButtonPressedState) {
                    return ContainerVisible(
                      textEditingController: _textEditingController,
                    );
                  } else {
                    return ContainerHidden();
                  }
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<HomescreenblocBloc, HomescreenblocState>(
                builder: (context, state) {
                  if (state is DataAddedToListState) {
                    return DataList(items: state.items);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerVisible extends StatelessWidget {
  final TextEditingController textEditingController;

  ContainerVisible({required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.purple.shade100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter Data',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    final enteredText = textEditingController.text;
                    if (enteredText.isNotEmpty) {
                      context
                          .read<HomescreenblocBloc>()
                          .add(AddDataToListEvent(enteredText));
                      textEditingController.clear();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerHidden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Container is hidden'),
        ));
      },
      child: Text('Show Container'),
    );
  }
}

class DataList extends StatelessWidget {
  final List<String> items;

  DataList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}
