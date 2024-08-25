import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';
import '../../data/filter_data.dart';

// ignore: must_be_immutable
class Filters extends StatelessWidget {
  Filters({super.key, required this.deepArController});
  DeepArController deepArController;

  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: filters.length,
          itemBuilder: (context, index) {
            final filter = filters[index];
            return InkWell(
              onTap: () {
                deepArController
                    .switchEffect('assets/filters/${filter.filterPath}');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/previews/${filter.imagePath}'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  // child: Image.asset('assets/previews/8bitHearts.png'),
                ),
              ),
            );
          }),
    );
  }
}
