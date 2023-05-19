import 'package:example_ecopetro/pages/trucks/domain/domain.dart';

class DriversDatasourceImpl extends DriversDatasource {
  @override
  Future<Driver> getDriversById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Driver>> getDriversByPage({int limit = 10, int offset = 0}) {
    throw UnimplementedError();
  }
}
