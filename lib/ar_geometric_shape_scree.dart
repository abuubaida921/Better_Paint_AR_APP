import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArGeometricShapeScree extends StatefulWidget {
  const ArGeometricShapeScree({super.key});

  @override
  State<ArGeometricShapeScree> createState() => _ArGeometricShapeScreeState();
}

class _ArGeometricShapeScreeState extends State<ArGeometricShapeScree> {

  ArCoreController? coreController;
   
  augmentatedRealityViewCreated(ArCoreController arCoreController){
    coreController = arCoreController;

    displayCube(coreController!);
  }

  displayCube(ArCoreController controller){
   final material = ArCoreMaterial(
   color:  Colors.deepPurple,
   metallic: 2.0
   );

   final cube = ArCoreCube(size: vector64.Vector3(0.5, 0.5, 0.5), materials: [material]);

   final node = ArCoreNode(
    shape: cube,
    position: vector64.Vector3(-.5, 0.5, -3.5)
   );

   coreController!.addArCoreNode(node);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
     title: const Text('Ar Core Implementation')
     ),
     body: ArCoreFaceView(
      onArCoreViewCreated: augmentatedRealityViewCreated(coreController!),
     ),
    );
  }
}