import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar_test_filters/ui/widgets/buttons_row.dart';
import 'package:flutter_ar_test_filters/ui/widgets/filters.dart';

import '../constants.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final deepArController = DeepArController();
  late List<String> effectFiles;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    deepArController.destroy(); // Properly dispose of the controller
    super.dispose();
  }

  Future<void> initializeController() async {
    print(deepArController.isInitialized);

    if (!deepArController.isInitialized) {
      await deepArController.initialize(
        androidLicenseKey: Constants.androidKey,
        iosLicenseKey: '',
        resolution: Resolution.high,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("""========================""");
    return Scaffold(
      body: FutureBuilder(
        future: initializeController(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.82,
                  child: Transform.scale(
                    scale: 1.5,
                    child: DeepArPreview(deepArController),
                  ),
                ),
                ButtonsRow(deepArController: deepArController),
                Filters(deepArController: deepArController),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
