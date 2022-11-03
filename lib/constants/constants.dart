import 'package:flutter/material.dart';

const String endpointUrl = 'https://14eb-222-112-33-79.ngrok.io';

const Color lightGrayColor = Color(0xffEEEEEE);
const Color deepGrayColor = Color(0xffCCCCCC);
const Color purpleColor = Color(0xff550527);
const Color oliveColor = Color(0xff688E26);
const Color yellowColor = Color(0xffFAA613);
const Color orangeColor = Color(0xffF44708);

const String komidaLogo = 'assets/images/komidaLogo.png';

const List<String> riceResults = [
  '속이 시꺼멓군요!',
  '겉으로는 까칠해도 속은 여려요',
  '외유내유',
  '도통 속을 알 수가 없어요😅',
];

const List<String> meatResults = [
  '계산적인 사랑을 해요',
  '부드러운 사랑이 어울려요',
  '사랑이 쉽지 않으시죠?🥲',
  '참지 않는 사랑을 하시는군요🔥',
];

const List<String> vegResults = [
  '맞장구를 많이 쳐주는 편인가봐요',
  "'오이' 없다는 말, 자주 들으시죠?",
  '철이 든 편이에요',
  '울음이 많으신가봐요.. 우엉😭',
];

const List<String> pickleResults = [
  '귀엽다는 말을 많이 들으시죠?',
  '깜찍하시네요!',
  '유교걸/보이인데 섹시해요🔥',
  '이국적인 섹시함의 소유자에요',
];

Map<int, String> riceMap = {
  0: '흑미',
  1: '현미',
  2: '백미',
  3: '키토',
};

Map<int, String> meatMap = {
  0: '햄',
  1: '계란지단',
  2: '새우튀김',
  3: '참치',
};

Map<int, String> vegMap = {
  0: '당근',
  1: '오이',
  2: '시금치',
  3: '우엉',
};

Map<int, String> pickleMap = {
  0: '단무지',
  1: '피클',
  2: '김치',
  3: '할라피뇨',
};
