import 'package:ecommerce_audio/core/utils/style.dart';
import 'package:flutter/material.dart';

class FeaturesBody extends StatelessWidget {
  const FeaturesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Highly Detailed Audio",
              style: Styles.textStyle16,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ",
              style: Styles.textStyle16,
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                children: [
                  Container(
                    //color: Colors.amber,
                    child: Image.asset(
                      "assets/images/headphone1.png",
                      width: 99,
                      height: 100,
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "APTX HD WIRELESS AUDIO",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            "The Aptx® HD codec transmits 24-bit \nhi-res audio, equal to or better than\n CD quality.he Aptx® HD codec transmits",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                children: [
                  Container(
                    //color: Colors.amber,
                    child: Image.asset(
                      "assets/images/headphone1.png",
                      width: 99,
                      height: 100,
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "APTX HD WIRELESS AUDIO",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            "The Aptx® HD codec transmits 24-bit \nhi-res audio, equal to or better than\n CD quality.he Aptx® HD codec transmits",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
