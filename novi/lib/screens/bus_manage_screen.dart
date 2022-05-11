import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novi/constants/app_styles.dart';
import 'package:novi/widgets/bus_seat.dart';

class BusManageScreen extends StatefulWidget {
  final String busTitle;
  final String busId;
  final bool is2X2Layout;
  const BusManageScreen({Key? key, required this.busTitle, required this.busId, required this.is2X2Layout, }) : super(key: key);

  @override
  State<BusManageScreen> createState() => _BusManageScreenState();
}

class _BusManageScreenState extends State<BusManageScreen> {
  List<dynamic> layout1 = [
    [0, 0, 0, 0, -1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
  ];
  List<dynamic> layout2 = [
    [0, 0, 0, 0, -1],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 1, 1],
    [1, 0, 1, 1, 1],
  ];

  List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    data = widget.is2X2Layout ? layout1 : layout2;
  }

  @override
  Widget build(BuildContext context) {
    List<int> row = data.elementAt(0);
    print(data.toString());
    double availableWidth = (MediaQuery.of(context).size.width - 48- 32 - 3 - (row.length * 4 * 2)) / row.length;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light, 
          statusBarBrightness: Brightness.light,
        ),
        toolbarHeight: AppBar().preferredSize.height * 1.5,
        title: Text(widget.busTitle),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Driver name",
                    style: AppStyles.largeTextWhite,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Licence number : 6545646136456564",
                    style: AppStyles.mediumTextWhite,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(width: 1.5, color: Colors.grey.shade300)),
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int i) {
                  List<int> columns = data.elementAt(i);
                  print(columns.toString());
                  return Container(
                    margin: const EdgeInsets.only(top: 6, bottom: 6),
                    height: availableWidth,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: columns.length,
                        itemBuilder: (BuildContext context, int j) {
                          return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: columns.elementAt(j) == 1
                                  ? RedSeat(width: availableWidth)
                                  : columns.elementAt(j) == 0
                                      ? Container(width: availableWidth)
                                      : BlackSeat(width: availableWidth));
                        }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
