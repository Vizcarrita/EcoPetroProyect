import '../entities/driver.dart';

abstract class DriversRepository {
  Future<List<Driver>> getDriversByPage({int limit = 10, int offset = 0});
  Future<Driver> getDriversById(String id);
}
