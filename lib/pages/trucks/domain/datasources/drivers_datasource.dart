import '../entities/driver.dart';

abstract class DriversDatasource {
  Future<List<Driver>> getDriversByPage({int limit = 10, int offset = 0});
  Future<Driver> getDriversById(String id);
}
