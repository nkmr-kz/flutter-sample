import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  int _columsCount = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '${_scrollController.hasClients ? _scrollController.position.pixels.toInt().toString() : 0} pixels'),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton(
              heroTag: "grid_on",
              onPressed: () {
                if (_columsCount < 3) {
                  setState(() {
                    _columsCount++;
                  });
                }
              },
              child: const Icon(
                Icons.grid_on,
                color: Colors.white,
              )),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
              heroTag: "grid_off",
              onPressed: () {
                if (_columsCount > 1) {
                  setState(() {
                    _columsCount--;
                  });
                }
              },
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              )),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(onPressed: () {
            _scrollController.animateTo(0,
                duration: const Duration(microseconds: 600),
                curve: Curves.easeInQuint);
          })
        ]),
        body: GridView.builder(
          controller: _scrollController,
          itemCount: _columsCount == 1 ? 5 : 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _columsCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => Container(
            color: Colors.black,
            child: Center(
              child: Text((index + 1).toString(),
                  style: const TextStyle(
                    fontSize: 42,
                    color: Colors.white,
                  )),
            ),
          ),
        ));
  }
}
