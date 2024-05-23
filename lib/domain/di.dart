import 'package:get_it/get_it.dart';
import 'package:imageViewer/domain/use_case/manage_image_info_use_case.dart';

import '../data/data_source_impl/remote_data_source_impl.dart';
import '../data/repository/image_info_repository.dart';

final getIt = GetIt.instance;

void dependencyInjection() {
  RemoteDataSourceImpl remoteDataSourceImpl = RemoteDataSourceImpl();
  remoteDataSourceImpl.init();

  getIt.registerSingleton<ManageImageInfoUseCase>(ManageImageInfoUseCase(
    ImageInfoRepository(
      remoteDataSource: remoteDataSourceImpl,
    ),
  ));
}
