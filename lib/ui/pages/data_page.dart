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
        controller.getData();
      },
    );

    controller.timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer t) {
        controller.getData();
      },
    );

    List<PieChartSectionData> _generateChartData(int type) {
      late RxList<int> _list;
      late Color _color;
      if (type == 0) {
        _list = controller.riceData;
        _color = yellowColor;
      } else if (type == 1) {
        _list = controller.meatData;
        _color = purpleColor;
      } else if (type == 2) {
        _list = controller.vegData;
        _color = oliveColor;
      } else if (type == 3) {
        _list = controller.pickleData;
        _color = orangeColor;
      }

      return List.generate(
        _list.length,
        (i) {
          return PieChartSectionData(
            color: _color.withOpacity((i + 1) / 4),
            value: _list[i] / _list.sum,
            title: '${meatMap[i]}: ${_list[i]}',
            radius: context.width * 0.15,
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 6,
          childAspectRatio: 1,
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
                elevation: 8,
                child: GridTile(
                  header: SizedBox(
                    height: 80,
                    child: GridTileBar(
                      backgroundColor: Colors.black,
                      title: Text(
                        _text,
                        style: const TextStyle(
                          fontFamily: 'BmHanna11yrs',
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                      // subtitle: Text('Item ${_items[index].split(' ')[1]}'),
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: context.width * 0.4,
                      height: context.height * 0.4,
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
