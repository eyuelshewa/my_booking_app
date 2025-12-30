import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      final Map<String, dynamic> args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      print('Arguments received: $args');

      return Scaffold(
        appBar: AppBar(title: Text(args['name'])),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(args['imagePath']),
                SizedBox(height: 16),
                Text(
                  args['name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(args['address'], style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Rating: ${args['rating']}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      print('Error on DetailsPage: $e');
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('An error occurred: $e')),
      );
    }
  }
}
