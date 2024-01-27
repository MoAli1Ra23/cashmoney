import 'package:cashmoney/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

 
final getIt = GetIt.instance;
// final  GetIt getIt = GetIt.I;

@InjectableInit()
void configureDependencies(String env)  async{
getIt.init(environment: env);
print("reg++++++++++++++++++++++");
print(getIt);
// print(getIt.isReady<ManageExpenses>());
}