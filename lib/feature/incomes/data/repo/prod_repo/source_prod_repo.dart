 
import 'package:injectable/injectable.dart';

import '../../../../../injection.dart';
import '../../../../../shared/data/app_db.dart';
import '../../../domain/entity/source.dart';
import '../../../domain/repo/source_repo.dart';

@Injectable(as: SourceRepo)
@Environment("prod")
class SourcePRepo extends SourceRepo {
  @override
  Future<List<Source>> allsources() async {
    var x = getIt.get<AppDb>();
    var l = await x.readdate('''
SELECT * FROM  'sources'
 ''');
    return l.map((e) => Source.fromMap(e)).toList();
  }

  @override
  Future<int> del(Source source) {
    // TODO: implement del
    throw UnimplementedError();
  }

  @override
  Future<int> insert(Source source) async {
    return await getIt.get<AppDb>().insert('''
INSERT INTO sources(text)VALUES("${source.text}")
 ''');
  }

  @override
  Future<int> update(Source source) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
