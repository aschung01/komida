import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komida/constants/constants.dart';
import 'package:komida/controllers/data_controller.dart';
import 'package:collection/collection.dart';

class DataPage extends GetView<DataController> {
  const DataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () {
        if (controller.timer == null) {
          controller.getData();
          controller.timer = Timer.periodic(
            const Duration(seconds: 5),
            (Timer t) {
              controller.getData();
            },
          );
        }
      },
    );

    List<PieChartSectionData> _generateChartData(int type) {
      late RxList<int> _list;
      late Color _color;
      late Map<int, String> _map;
      if (type == 0) {
        _list = controller.riceData;
        _color = yellowColor;
        _map = riceMap;
      } else if (type == 1) {
        _list = controller.meatData;
        _color = purpleColor;
        _map = meatMap;
      } else if (type == 2) {
        _list = controller.vegData;
        _color = oliveColor;
        _map = vegMap;
      } else if (type == 3) {
        _list = controller.pickleData;
        _color = orangeColor;
        _map = pickleMap;
      }

      return List.generate(
        _list.length,
        (i) {
          return PieChartSectionData(
            color: _color.withOpacity((i + 1) / 4),
            value: _list[i] / _list.sum,
            title: '${_map[i]}: ${_list[i]}',
            radius: context.height * 0.18,
            titleStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'BmHanna11yrs',
              color: Colors.white,
            ),
          );
        },
      );
    }

    List<Widget> _generateLabelData(int type) {
      late RxList<int> _list;
      late Color _color;
      late Map<int, String> _map;
      if (type == 0) {
        _list = controller.riceData;
        _color = yellowColor;
        _map = riceMap;
      } else if (type == 1) {
        _list = controller.meatData;
        _color = purpleColor;
        _map = meatMap;
      } else if (type == 2) {
        _list = controller.vegData;
        _color = oliveColor;
        _map = vegMap;
      } else if (type == 3) {
        _list = controller.pickleData;
        _color = orangeColor;
        _map = pickleMap;
      }

      return List.generate(
        4,
        (index) {
          if (_list.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: _color.withOpacity((index + 1) / 4),
                    radius: 10,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${_map[index]}: ${_list[index]}',
                    style: const TextStyle(
                      fontFamily: 'BmHanna11yrs',
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 6,
          childAspectRatio: 1.8,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          late String _text;

          if (index == 0) {
            _text = '쌀 종류';
          } else if (index == 1) {
            _text = '육류';
          } else if (index == 2) {
            _text = '채소류';
          } else if (index == 3) {
            _text = '절임류';
          }

          return GetX<DataController>(
            builder: (_) {
              return Card(
                margin: const EdgeInsets.all(8),
                semanticContainer: false,
                clipBehavior: Clip.antiAlias,
                elevation: 8,
                child: GridTile(
                  header: SizedBox(
                    height: 60,
                    child: GridTileBar(
                      backgroundColor: Colors.black,
                      title: Text(
                        _text,
                        style: const TextStyle(
                          fontFamily: 'BmHanna11yrs',
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      // subtitle: Text('Item ${_items[index].split(' ')[1]}'),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: context.height * 0.36,
                          height: context.height * 0.36,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 0,
                                sections: _generateChartData(index),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: context.width * 0.05),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _generateLabelData(index),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
