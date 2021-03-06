import 'package:equatable/equatable.dart';

import '../database/chapter_item.dart';
import '../database/search_item.dart';

abstract class API {
  static const MANGA = 0;
  static const NOVEL = 1;
  static const VIDEO = 2;
  static const AUDIO = 3;
  static const RSS = 4;

  static String getRuleContentTypeName(int ruleContentType) {
    switch (ruleContentType) {
      case MANGA:
        return "漫画";
      case NOVEL:
        return "小说";
      case VIDEO:
        return "视频";
      case AUDIO:
        return "音频";
      case RSS:
        return "RSS";
      default:
        return "漫画";
    }
  }

  String get origin;

  String get originTag;

  int get ruleContentType;

  Future<List<SearchItem>> discover(
      Map<String, DiscoverPair> params, int page, int pageSize);

  Future<List<SearchItem>> search(String query, int page, int pageSize);

  Future<List<ChapterItem>> chapter(String url);

  Future<List<String>> content(String url);

  List<DiscoverMap> discoverMap();
}

class DiscoverMap {
  final String name;
  final List<DiscoverPair> pairs;
  const DiscoverMap(this.name, this.pairs);
}

class DiscoverPair extends Equatable {
  final String name;
  final String value;
  const DiscoverPair(this.name, this.value);

  @override
  List<Object> get props => [
        name,
        value,
      ];
}
