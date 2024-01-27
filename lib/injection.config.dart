// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cashmoney/feature/expenses/data/repo/expense_d_repo.dart'
    as _i5;
import 'package:cashmoney/feature/expenses/data/repo/expenses_title_d_repo.dart'
    as _i8;
import 'package:cashmoney/feature/expenses/data/repo/prod_repo/expense_prod_repo.dart'
    as _i6;
import 'package:cashmoney/feature/expenses/data/repo/prod_repo/expenses_title_prod_repo.dart'
    as _i9;
import 'package:cashmoney/feature/expenses/domain/repo/expenese_abst_repo.dart'
    as _i4;
import 'package:cashmoney/feature/expenses/domain/repo/expenses_title_abst_repo.dart'
    as _i7;
import 'package:cashmoney/feature/incomes/data/repo/income_d_repo.dart' as _i11;
import 'package:cashmoney/feature/incomes/data/repo/prod_repo/income_prod_repo.dart'
    as _i12;
import 'package:cashmoney/feature/incomes/data/repo/prod_repo/source_prod_repo.dart'
    as _i14;
import 'package:cashmoney/feature/incomes/data/repo/source_d_repo.dart' as _i15;
import 'package:cashmoney/feature/incomes/domain/repo/icome_repo.dart' as _i10;
import 'package:cashmoney/feature/incomes/domain/repo/source_repo.dart' as _i13;
import 'package:cashmoney/feature/wallate/data/repo/wallate_d_repo.dart'
    as _i17;
import 'package:cashmoney/feature/wallate/data/repo/wallate_p_repo.dart'
    as _i18;
import 'package:cashmoney/feature/wallate/domain/repo/wallate_repo.dart'
    as _i16;
import 'package:cashmoney/shared/data/app_db.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _debug = 'debug';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppDb>(
      () => _i3.AppDb(),
      registerFor: {
        _debug,
        _prod,
      },
    );
    gh.factory<_i4.ExpenseAbstrctRepo>(
      () => _i5.ExpenseDebugeRepo(),
      registerFor: {_debug},
    );
    gh.factory<_i4.ExpenseAbstrctRepo>(
      () => _i6.ExpenseDebugeRepo(),
      registerFor: {_prod},
    );
    gh.factory<_i7.ExpensesTitleAbstRepo>(
      () => _i8.ExpensesTitleDebugRepo(),
      registerFor: {_debug},
    );
    gh.factory<_i7.ExpensesTitleAbstRepo>(
      () => _i9.ExpensesTitleProdRepo(),
      registerFor: {_prod},
    );
    gh.factory<_i10.IncomeabReo>(
      () => _i11.IncomeDReop(),
      registerFor: {_debug},
    );
    gh.factory<_i10.IncomeabReo>(
      () => _i12.IncomeReo(),
      registerFor: {_prod},
    );
    gh.factory<_i13.SourceRepo>(
      () => _i14.SourcePRepo(),
      registerFor: {_prod},
    );
    gh.factory<_i13.SourceRepo>(
      () => _i15.SourceDRepo(),
      registerFor: {_debug},
    );
    gh.factory<_i16.WallateRepo>(
      () => _i17.WallateDRepo(),
      registerFor: {_debug},
    );
    gh.factory<_i16.WallateRepo>(
      () => _i18.WallatePRepo(),
      registerFor: {_prod},
    );
    return this;
  }
}
