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
import '../../api/dataSource/auth_data_source_impl.dart' as _i92;
import '../../api/dataSource/brands_online_data_source_impl.dart' as _i454;
import '../../api/dataSource/categories_online_data_source_impl.dart' as _i958;
import '../../api/dataSource/products_data_source_impl.dart' as _i233;
import '../../data/dataSource/auth_data_source.dart' as _i681;
import '../../data/dataSource/brands_online_data_source.dart' as _i337;
import '../../data/dataSource/categories_online_data_source.dart' as _i651;
import '../../data/dataSource/products_data_source.dart' as _i152;
import '../../data/repos/auth_repo_impl.dart' as _i666;
import '../../data/repos/brands_repo_impl.dart' as _i780;
import '../../data/repos/categories_repo_impl.dart' as _i684;
import '../../data/repos/products_repo_impl.dart' as _i1037;
import '../../domain/repos/auth_repo.dart' as _i595;
import '../../domain/repos/brands_repo.dart' as _i148;
import '../../domain/repos/categories_repo.dart' as _i101;
import '../../domain/repos/products_repo.dart' as _i6;
import '../../domain/useCase/get_brands_use_case.dart' as _i248;
import '../../domain/useCase/get_categories_use_case.dart' as _i171;
import '../../domain/useCase/get_products_use_case.dart' as _i350;
import '../../domain/useCase/login_use_case.dart' as _i84;
import '../../features/auth/presentation/auth_cubit/signup_cubit.dart' as _i761;
import '../../features/auth/presentation/view_model/login_view_model.dart'
    as _i269;
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
    gh.factory<_i152.ProductsDataSource>(
        () => _i233.ProductsDataSourceImpl(gh<_i149.ApiManager>()));
    gh.factory<_i337.BrandsOnlineDataSource>(
        () => _i454.BrandsOnlineDataSourceImpl(gh<_i149.ApiManager>()));
    gh.factory<_i681.AuthDataSource>(
        () => _i92.AuthDataSourceImpl(gh<_i149.ApiManager>()));
    gh.factory<_i651.CategoriesOnlineDataSource>(
        () => _i958.CategoriesOnlineDataSourceImpl(gh<_i149.ApiManager>()));
    gh.factory<_i101.CategoriesRepo>(
        () => _i684.CategoriesRepoImpl(gh<_i651.CategoriesOnlineDataSource>()));
    gh.factory<_i6.ProductsRepo>(
        () => _i1037.ProductsRepoImpl(gh<_i152.ProductsDataSource>()));
    gh.factory<_i595.AuthRepo>(
        () => _i666.AuthRepoImpl(gh<_i681.AuthDataSource>()));
    gh.factory<_i148.BrandsRepo>(
        () => _i780.BrandsRepoImpl(gh<_i337.BrandsOnlineDataSource>()));
    gh.factory<_i761.SignUpCubit>(
        () => _i761.SignUpCubit(gh<_i595.AuthRepo>()));
    gh.factory<_i248.GetBrandsUseCase>(
        () => _i248.GetBrandsUseCase(gh<_i148.BrandsRepo>()));
    gh.factory<_i350.GetProductsUseCase>(
        () => _i350.GetProductsUseCase(gh<_i6.ProductsRepo>()));
    gh.factory<_i171.GetCategoriesUseCase>(
        () => _i171.GetCategoriesUseCase(gh<_i101.CategoriesRepo>()));
    gh.factory<_i84.LoginUseCase>(
        () => _i84.LoginUseCase(gh<_i595.AuthRepo>()));
    gh.factory<_i587.HomeViewModel>(() => _i587.HomeViewModel(
          gh<_i171.GetCategoriesUseCase>(),
          gh<_i248.GetBrandsUseCase>(),
          gh<_i350.GetProductsUseCase>(),
        ));
    gh.factory<_i269.LoginViewModel>(
        () => _i269.LoginViewModel(gh<_i84.LoginUseCase>()));
    return this;
  }
}
