import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const int primaryColor = 0xFFB22331; // Base color #b22331
const Color btnColor = Color.fromARGB(255, 15, 46, 74); // Base color #b22331
const Color baseColor = Color(primaryColor); // Base color #b22331

Map<int, Color> colorSwatch = {
  50: Color(0xFFFDE8E9),
  100: Color(0xFFF9C5C8),
  200: Color(0xFFF59FA3),
  300: Color(0xFFEF787E),
  400: Color(0xFFEA5A62),
  500: Color(primaryColor), // Primary shade (#b22331)
  600: Color(0xFFA71F2C),
  700: Color(0xFF931B25),
  800: Color(0xFF7F1720),
  900: Color(0xFF611116),
};

// Create a MaterialColor from the swatch
MaterialColor customSwatch = MaterialColor(primaryColor, colorSwatch);
void main() {
  runApp(ARApp());
}

class ARApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BetterPainting AR Quote App',
      theme: ThemeData(
        primarySwatch: customSwatch,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ARHomePage(),
        '/serviceSelection': (context) => ServiceSelectionScreen(),
        '/detailedSpecification': (context) => DetailedSpecificationScreen(),
        '/arMeasurement': (context) => ARMeasurementScreen(),
        '/quoteSummary': (context) => QuoteSummaryScreen(),
      },
    );
  }
}

class ARHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customSwatch,
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [baseColor, baseColor],
          // colors: [Color.fromARGB(255, 174, 35, 49), Color.fromARGB(255, 15, 46, 74)],
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
            SizedBox(height: 100),
            Image.asset('assets/images/roller_brush.png',height: 100,width: double.infinity,),
            SizedBox(height: 50,),
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
                  Navigator.pushNamed(context, '/serviceSelection');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: btnColor,
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
          ],
        ),
      ),
    );
  }
}

class ServiceSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
        title: Text('Choose a Service',style: TextStyle(color: Colors.white),),
        backgroundColor: baseColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildServiceButton(context, 'Interior Painting', Icons.home),
                _buildServiceButton(context, 'Exterior Painting', Icons.landscape),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [baseColor, baseColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildServiceButton(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, '/detailedSpecification');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: Icon(icon, size: 30,color: Colors.white,),
        label: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }
}

class DetailedSpecificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
        title: Text('Specify Details',style: TextStyle(color: Colors.white),),
        backgroundColor: baseColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Specify Areas to be Painted',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  _buildDetailOption('Walls'),
                  _buildDetailOption('Doors'),
                  _buildDetailOption('Trim'),
                  _buildDetailOption('Ceilings'),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/arMeasurement');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'AR Measurement',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [baseColor,baseColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildDetailOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(Icons.check_circle, color: Colors.blueAccent),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
      ),
    );
  }
}

class ARMeasurementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
        title: Text('AR Measurement',style: TextStyle(color: Colors.white),),
        backgroundColor: baseColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AR Measurement Process',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/quoteSummary');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Quote Summary',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [baseColor,baseColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class QuoteSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
        title: Text('Quote Summary',style: TextStyle(color: Colors.white),),
        backgroundColor: baseColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Quote Summary',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Generate quote or restart process
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Finish',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [baseColor,baseColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
