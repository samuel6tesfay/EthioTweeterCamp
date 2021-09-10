import '../data_providers/trend-data-provider.dart';
import '../models/trend.dart';

class TrendRepository {
  final TrendDataProvider dataProvider;
  TrendRepository(this.dataProvider);

  Future<Trend> create(Trend trend) async {
    return this.dataProvider.create(trend);
  }

  Future<Trend> update(int id, Trend trend) async {
    return this.dataProvider.update(id, trend);
  }

  Future<List<Trend>> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    this.dataProvider.delete(id);
  }
}
