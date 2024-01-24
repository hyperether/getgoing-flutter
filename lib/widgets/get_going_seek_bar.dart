import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetGoingSeekBar extends StatefulWidget {
  const GetGoingSeekBar({super.key});

  @override
  State<GetGoingSeekBar> createState() => _GetGoingSeekBarState();
}

class _GetGoingSeekBarState extends State<GetGoingSeekBar> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text('$_value',
              style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0))),
          const SizedBox(width: 4.0),
          const Text('meters'),
          const SizedBox(width: 32.0)
        ]),
        const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text('About 0 kcal', style: TextStyle(fontSize: 12.0)),
          SizedBox(width: 32.0)
        ]),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
          child: Slider(
              value: _value,
              onChanged: (double newValue) {
                setState(() {
                  _value = newValue;
                });
              },
              activeColor: const Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
              inactiveColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
              min: 0.0,
              max: 10000.0),
        ),
        const SizedBox(height: 10.0),
        const Padding(
          padding: EdgeInsets.fromLTRB(64.0, 0.0, 64.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('LOW', style: TextStyle(fontSize: 16.0)),
              Text('|'),
              Text('MEDIUM', style: TextStyle(fontSize: 16.0)),
              Text('|'),
              Text('HIGH', style: TextStyle(fontSize: 16.0))
            ],
          ),
        ),
        const SizedBox(height: 32.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_walk,
                color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0), size: 32.0),
            const Text('0', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 4.0),
            const Text('min', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 10.0),
            const Text('or', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 10.0),
            const Icon(Icons.directions_run,
                color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0), size: 32.0),
            const Text('0', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 4.0),
            const Text('min', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 10.0),
            const Text('or', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 10.0),
            SvgPicture.asset(
              'assets/ic_cycling_light.svg',
              width: 28.0,
              height: 28.0,
            ),
            const SizedBox(width: 4.0),
            const Text('0', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 4.0),
            const Text('min', style: TextStyle(fontSize: 16.0))
          ],
        ),
        const SizedBox(height: 36.0),
        ElevatedButton(
            onPressed: () {},
            style:
            ElevatedButton.styleFrom(
              fixedSize: const Size(160.0, 40.0),
                foregroundColor: const Color.fromRGBO(0x6b, 0xd1, 0xff, 1.0),
                backgroundColor: const Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Set the border radius
                ),
                elevation: 4.0),
            child: const Text(
              'Save changes',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )),
        const SizedBox(height: 16.0)
      ],
    );
  }
}
