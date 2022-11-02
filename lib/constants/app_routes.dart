import 'package:get/route_manager.dart';
import 'package:komida/ui/pages/data_page.dart';
import 'package:komida/ui/pages/home_page.dart';
import 'package:komida/ui/pages/result_page.dart';
import 'package:komida/ui/views/question_view.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => const HomePage()),
    GetPage(name: '/question', page: () => const QuestionView()),
    GetPage(name: '/result', page: () => const ResultPage()),
    GetPage(name: '/data', page: () => const DataPage()),
  ];
}
