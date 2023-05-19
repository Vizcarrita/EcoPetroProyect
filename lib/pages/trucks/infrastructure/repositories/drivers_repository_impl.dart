import 'package:example_ecopetro/pages/trucks/domain/domain.dart';

class DriversRepositoryImpl extends DriversRepository {
  final DriversDatasource datasource;

  DriversRepositoryImpl(this.datasource);

  @override
  Future<Driver> getDriversById(String id) {
    return datasource.getDriversById(id);
  }

  @override
  Future<List<Driver>> getDriversByPage({int limit = 10, int offset = 0}) {
    return datasource.getDriversByPage(limit: limit, offset: offset);
  }
}
