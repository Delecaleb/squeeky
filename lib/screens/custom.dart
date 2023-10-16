import 'package:flutter/material.dart';

class CustomScreen extends StatefulWidget {
  CustomScreen({Key? key}) : super(key: key);

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  ScrollController _scrollController = ScrollController();
  bool _showSearchIcon = false;

  @override
  void initState() {
    super.initState();

    // Add a listener to the scroll controller to detect scrolling
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 0) {
        // User is scrolling up, show the search icon
        setState(() {
          _showSearchIcon = true;
        });
      } else {
        // User is at the top, hide the search icon
        setState(() {
          _showSearchIcon = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 100.0,
            floating: false,
            pinned: true,
            // Define your AppBar content here
            flexibleSpace: FlexibleSpaceBar(
              title: _showSearchIcon
                  ? ElevatedButton(
                      onPressed: () {
                        // Handle search button press
                      },
                      child: Icon(Icons.search),
                    )
                  : null,
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Your list items here
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50, // Replace with your actual list size
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
