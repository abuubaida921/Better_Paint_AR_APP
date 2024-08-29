import 'package:flutter/material.dart';

void main() {
  runApp(ARApp());
}

class ARApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: ARHomePage(),
    );
  }
}

class ARHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _buildBackground(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.indigoAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Welcome to Your AR Experience',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Discover our augmented reality services to enhance your world with digital experiences.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Action for starting the quote process
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Start Your Quote',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
            _buildFeatureCard(
              context,
              title: 'Measure Distance',
              description:
              'Use AR to measure distances between objects in real-time.',
              icon: Icons.straighten,
            ),
            _buildFeatureCard(
              context,
              title: '3D Object Placement',
              description: 'Place virtual 3D objects in your real-world space.',
              icon: Icons.view_in_ar,
            ),
            _buildFeatureCard(
              context,
              title: 'AR Navigation',
              description:
              'Navigate using AR overlays and interactive maps.',
              icon: Icons.navigation,
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required String title, required String description, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blueAccent,
            size: 40,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(description),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
          onTap: () {
            // Action when a feature card is tapped
          },
        ),
      ),
    );
  }
}
