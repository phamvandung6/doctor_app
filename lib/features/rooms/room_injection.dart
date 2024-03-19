import 'package:doctor_app/features/rooms/data/datasource/room_remote_data_source.dart';
import 'package:doctor_app/features/rooms/data/datasource/room_remote_data_source_firebase.dart';
import 'package:doctor_app/features/rooms/data/repositores/room_repository_impl.dart';
import 'package:doctor_app/features/rooms/domain/repositories/room_repository.dart';
import 'package:doctor_app/features/rooms/domain/usecases/create_room_use_case.dart';
import 'package:doctor_app/features/rooms/domain/usecases/delete_room_use_case.dart';
import 'package:doctor_app/features/rooms/domain/usecases/get_rooms_use_case.dart';
import 'package:doctor_app/features/rooms/presentation/blocs/pick_room_cubit/pick_room_cubit.dart';
import 'package:doctor_app/features/rooms/presentation/blocs/room_cubit/room_cubit.dart';
import 'package:doctor_app/main_injection_container.dart';

Future<void> roomInjectionContainer() async {
  sl.registerFactory<RoomCubit>(
    () => RoomCubit(
      getRoomsUseCase: sl(),
      deleteRoomUseCase: sl(),
      createRoomUseCase: sl(),
    ),
  );

  sl.registerFactory<PickRoomCubit>(
    () => PickRoomCubit(),
  );

  sl.registerLazySingleton<GetRoomsUseCase>(
    () => GetRoomsUseCase(roomRepository: sl()),
  );

  sl.registerLazySingleton<RoomRepository>(
    () => RoomRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<RoomRemoteDataSource>(
    () => RoomRemoteDataSourceFirebase(firebaseFirestore: sl()),
  );

  sl.registerLazySingleton<DeleteRoomUseCase>(
    () => DeleteRoomUseCase(roomRepository: sl()),
  );

  sl.registerLazySingleton<CreateRoomUseCase>(
    () => CreateRoomUseCase(roomRepository: sl()),
  );
}
