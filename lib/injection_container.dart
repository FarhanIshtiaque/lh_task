import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'modules/character/data/data_sources/character_remote_data_source.dart';
import 'modules/character/data/data_sources/remote/character_remote_data_source_impl.dart';
import 'modules/character/data/repositories/character_repository_impl.dart';
import 'modules/character/domain/repositories/character_repository.dart';
import 'modules/character/domain/usecases/get_character.dart';
import 'modules/character/presentation/bloc/single_character/single_character_bloc.dart';


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