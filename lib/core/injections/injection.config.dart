// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:grammafy/core/core_modules/core_module.dart' as _i12;
import 'package:grammafy/core/env/env.dart' as _i3;
import 'package:grammafy/core/routes/grammafy_routes.dart' as _i4;
import 'package:grammafy/data/grammafy_repository.dart' as _i10;
import 'package:grammafy/data/network_data_sources/api/api_helper.dart' as _i8;
import 'package:grammafy/data/network_data_sources/network_data_sources.dart'
    as _i7;
import 'package:grammafy/domain/i_grammafy_repository.dart' as _i9;
import 'package:grammafy/presentation/home/state/home_page_cubit.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;

const String _dev = 'dev';

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
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Env>(() => _i3.Env());
    gh.singleton<_i4.GrammafyRoutes>(() => registerModule.appRouter);
    gh.lazySingleton<_i5.Logger>(() => registerModule.logger);
    gh.factory<String>(
      () => registerModule.apiKey,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i6.Dio>(
      () => registerModule.dio(gh<_i3.Env>()),
      instanceName: 'defaultDio',
    );
    gh.factory<_i7.NetworkDataSource>(
        () => _i7.NetworkDataSource(gh<_i6.Dio>(instanceName: 'defaultDio')));
    gh.lazySingleton<_i8.ApiHelper>(
        () => _i8.ApiHelper(gh<_i6.Dio>(instanceName: 'defaultDio')));
    gh.lazySingleton<_i9.IGrammafyRepository>(
        () => _i10.GrammafyRepository(gh<_i7.NetworkDataSource>()));
    gh.factory<_i11.HomePageCubit>(
        () => _i11.HomePageCubit(gh<_i9.IGrammafyRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
