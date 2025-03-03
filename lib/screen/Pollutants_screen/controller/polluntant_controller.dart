import '../model/pollutants.dart';

class PolluntantController {
  final List<Pollutants> listPollutants = [
    Pollutants('NO', 1200, 0xffC8F0DA, 0xff01C754),
    Pollutants('NO2', 1200, 0xffF9D5D3, 0xffF54A3D),
    Pollutants('SO2', 1200, 0xffF9F0E3, 0xffFE9202),
    Pollutants('O3', 1200, 0xffD4DAFA, 0xff3A54DF),
    Pollutants('PM 2.5', 1200, 0xffD4FFBA, 0xff6AAF11),
    Pollutants('PM 10', 1200, 0xffE5D4FA, 0xff7E3CB2)
  ];
}
