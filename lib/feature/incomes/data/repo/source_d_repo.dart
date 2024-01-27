import 'package:injectable/injectable.dart';

import '../../domain/entity/source.dart';
import '../../domain/repo/source_repo.dart';

@Injectable(as:SourceRepo)
@Environment("debug")

class SourceDRepo extends SourceRepo{
  @override
  Future<List<Source>> allsources() {
 return Future(() => [
  const Source(id: 0, text: "Salary"),
  const Source(id: 0, text: "Steel"),
  const Source(id: 0, text: "Bank"),
 ]);
   }

  @override
  Future<int> del(Source source) {
    // TODO: implement del
    throw UnimplementedError();
  }

  @override
  Future<int> insert(Source source) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<int> update(Source source) {
    // TODO: implement update
    throw UnimplementedError();
  }

}