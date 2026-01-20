// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/api_manager.dart' as _i149;
import '../../api/dataSource/categories_online_data_source_impl.dart' as _i958;
import '../../data/dataSource/categories_online_data_source.dart' as _i651;
import '../../data/repos/categories_repo_impl.dart' as _i684;
import '../../domain/repos/categories_repo.dart' as _i101;
import '../../features/main_layout/home/presentation/home_view_model.dart'
    as _i587;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i149.ApiManager>(() => _i149.ApiManager());
    gh.factory<_i651.CategoriesOnlineDataSource>(
        () => _i958.CategoriesOnlineDataSourceImpl(gh<_i149.ApiManager>()));
    gh.factory<_i101.CategoriesRepo>(
        () => _i684.CategoriesRepoImpl(gh<_i651.CategoriesOnlineDataSource>()));
    gh.factory<_i587.HomeViewModel>(
        () => _i587.HomeViewModel(gh<_i101.CategoriesRepo>()));
    return this;
  }
}
