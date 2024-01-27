import '../entity/source.dart';

abstract class SourceRepo {
  Future<int> insert(Source source);
  Future<int> del(Source source);
  Future<int> update(Source source);
  Future<List<Source>> allsources();
}
