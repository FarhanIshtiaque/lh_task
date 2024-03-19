import 'package:get_it/get_it.dart';
import 'package:lh_task/data/data_sources/character_remote_data_source.dart';
import 'package:lh_task/data/data_sources/remote/character_remote_data_source_impl.dart';
import 'package:lh_task/data/repositories/character_repository_impl.dart';
import 'package:lh_task/domain/repositories/character_repository.dart';
import 'package:lh_task/domain/usecases/get_character.dart';
import 'package:lh_task/presentation/bloc/single_character/single_character_bloc.dart';
import 'package:http/http.dart' as http;


final getIt = GetIt.instance;

void init( ){
  // Bloc
  getIt.registerFactory(() => SingleCharacterBloc(getCharacterUseCase: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetCharacterUseCase(getIt()));

  // Repositories
  getIt.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(characterRemoteDataSource: getIt()));

  // Datta source
  getIt.registerLazySingleton<CharacterRemoteDataSource>(() => CharacterRemoteDataSourceImpl(client: getIt()));
  // Http service
  getIt.registerLazySingleton(() => http.Client());

}