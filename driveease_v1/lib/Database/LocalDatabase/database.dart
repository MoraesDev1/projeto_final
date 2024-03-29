import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static final Map<int, List<String>> _migrationScripts = {
    1: [
      '''
      CREATE TABLE corrida (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        datahora_start TEXT(50),
        start_km REAL,
        datahora_stop TEXT(50),
        stop_km REAL,
        ganhos REAL
      );
    ''',
      '''
      CREATE TABLE servico (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tipo TEXT,
        data TEXT,
        km REAL,
        descricao TEXT,
        valor REAL
      );
    ''',
      '''CREATE TABLE start (
        datahora_start TEXT(50),
        start_km REAL
      );
    ''',
      '''CREATE TABLE meta (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        inicio TEXT(50),
        fim TEXT(50),
        valor REAL,
        descricao TEXT
);
''',
      '''INSERT INTO corrida (datahora_start, start_km, datahora_stop, stop_km, ganhos) VALUES
    ('2024-01-01 08:15:00', 100.5, '2024-01-01 09:30:00', 150.2, 225.0),
    ('2024-01-02 08:15:00', 250.7, '2024-01-02 09:30:00', 300.4, 255.0),
    ('2024-01-03 08:15:00', 400.9, '2024-01-03 09:30:00', 450.6, 270.0),
    ('2024-01-04 08:15:00', 551.1, '2024-01-04 09:30:00', 600.8, 240.0),
    ('2024-01-05 08:15:00', 701.3, '2024-01-05 09:30:00', 751.0, 285.0),
    ('2024-01-06 08:15:00', 851.5, '2024-01-06 09:30:00', 901.2, 264.0),
    ('2024-01-07 08:15:00', 1001.7, '2024-01-07 09:30:00', 1051.4, 246.0),
    ('2024-01-08 08:15:00', 1151.9, '2024-01-08 09:30:00', 1201.6, 225.0),
    ('2024-01-09 08:15:00', 1302.1, '2024-01-09 09:30:00', 1351.8, 261.0),
    ('2024-01-10 08:15:00', 1452.3, '2024-01-10 09:30:00', 1502.0, 234.0),
    ('2024-01-11 08:15:00', 1602.5, '2024-01-11 09:30:00', 1652.2, 276.0),
    ('2024-01-12 08:15:00', 1752.7, '2024-01-12 09:30:00', 1802.4, 243.0),
    ('2024-01-13 08:15:00', 1902.9, '2024-01-13 09:30:00', 1952.6, 288.0),
    ('2024-01-14 08:15:00', 2053.1, '2024-01-14 09:30:00', 2102.8, 252.0),
    ('2024-01-15 08:15:00', 2203.3, '2024-01-15 09:30:00', 2253.0, 225.0),
    ('2024-01-16 08:15:00', 2353.5, '2024-01-16 09:30:00', 2403.2, 264.0),
    ('2024-01-17 08:15:00', 2503.7, '2024-01-17 09:30:00', 2553.4, 246.0),
    ('2024-01-18 08:15:00', 2653.9, '2024-01-18 09:30:00', 2703.6, 270.0),
    ('2024-01-19 08:15:00', 2804.1, '2024-01-19 09:30:00', 2853.8, 225.0),
    ('2024-01-20 08:15:00', 2954.3, '2024-01-20 09:30:00', 3004.0, 273.0),
    ('2024-01-21 08:15:00', 3104.5, '2024-01-21 09:30:00', 3154.2, 258.0),
    ('2024-01-22 08:15:00', 3254.7, '2024-01-22 09:30:00', 3304.4, 225.0),
    ('2024-01-23 08:15:00', 3404.9, '2024-01-23 09:30:00', 3454.6, 267.0),
    ('2024-01-24 08:15:00', 3555.1, '2024-01-24 09:30:00', 3604.8, 240.0),
    ('2024-01-25 08:15:00', 3705.3, '2024-01-25 09:30:00', 3755.0, 279.0),
    ('2024-01-26 08:15:00', 3855.5, '2024-01-26 09:30:00', 3905.2, 270.0),
    ('2024-01-27 08:15:00', 4005.7, '2024-01-27 09:30:00', 4055.4, 225.0),
    ('2024-01-28 08:15:00', 4155.9, '2024-01-28 09:30:00', 4205.6, 282.0),
    ('2024-01-29 08:15:00', 4306.1, '2024-01-29 09:30:00', 4355.8, 237.0),
    ('2024-01-30 08:15:00', 4456.3, '2024-01-30 09:30:00', 4506.0, 291.0),
    ('2024-01-31 08:15:00', 4606.5, '2024-01-31 09:30:00', 4656.2, 225.0),
    ('2024-02-01 08:15:00', 4756.7, '2024-02-01 09:30:00', 4806.4, 300.0),
    ('2024-02-02 08:15:00', 4906.9, '2024-02-02 09:30:00', 4956.6, 225.0),
    ('2024-02-03 08:15:00', 5057.1, '2024-02-03 09:30:00', 5106.8, 294.0),
    ('2024-02-04 08:15:00', 5207.3, '2024-02-04 09:30:00', 5257.0, 240.0),
    ('2024-02-05 08:15:00', 5357.5, '2024-02-05 09:30:00', 5407.2, 297.0),
    ('2024-02-06 08:15:00', 5507.7, '2024-02-06 09:30:00', 5557.4, 225.0),
    ('2024-02-07 08:15:00', 5657.9, '2024-02-07 09:30:00', 5707.6, 291.0),
    ('2024-02-08 08:15:00', 5808.1, '2024-02-08 09:30:00', 5857.8, 225.0),
    ('2024-02-09 08:15:00', 5958.3, '2024-02-09 09:30:00', 6008.0, 288.0),
    ('2024-02-10 08:15:00', 6108.5, '2024-02-10 09:30:00', 6158.2, 225.0),
    ('2024-02-11 08:15:00', 6258.7, '2024-02-11 09:30:00', 6308.4, 285.0),
    ('2024-02-12 08:15:00', 6408.9, '2024-02-12 09:30:00', 6458.6, 225.0),
    ('2024-02-13 08:15:00', 6559.1, '2024-02-13 09:30:00', 6608.8, 282.0),
    ('2024-02-14 08:15:00', 6709.3, '2024-02-14 09:30:00', 6759.0, 225.0),
    ('2024-02-15 08:15:00', 6859.5, '2024-02-15 09:30:00', 6909.2, 279.0),
    ('2024-02-16 08:15:00', 7009.7, '2024-02-16 09:30:00', 7059.4, 225.0),
    ('2024-02-17 08:15:00', 7159.9, '2024-02-17 09:30:00', 7209.6, 276.0),
    ('2024-02-18 08:15:00', 7310.1, '2024-02-18 09:30:00', 7360.8, 225.0),
    ('2024-02-19 08:15:00', 7460.3, '2024-02-19 09:30:00', 7510.0, 273.0),
    ('2024-02-20 08:15:00', 7610.5, '2024-02-20 09:30:00', 7660.2, 225.0),
    ('2024-02-21 08:15:00', 7760.7, '2024-02-21 09:30:00', 7810.4, 270.0),
    ('2024-02-22 08:15:00', 7910.9, '2024-02-22 09:30:00', 7960.6, 225.0),
    ('2024-02-23 08:15:00', 8061.1, '2024-02-23 09:30:00', 8110.8, 267.0),
    ('2024-02-24 08:15:00', 8211.3, '2024-02-24 09:30:00', 8261.0, 225.0),
    ('2024-02-25 08:15:00', 8361.5, '2024-02-25 09:30:00', 8411.2, 264.0),
    ('2024-02-26 08:15:00', 8511.7, '2024-02-26 09:30:00', 8561.4, 225.0),
    ('2024-02-27 08:15:00', 8661.9, '2024-02-27 09:30:00', 8711.6, 261.0),
    ('2024-02-28 08:15:00', 8812.1, '2024-02-28 09:30:00', 8861.8, 225.0),
    ('2024-02-29 08:15:00', 8962.3, '2024-02-29 09:30:00', 9012.0, 258.0),
    ('2024-03-01 08:15:00', 9112.5, '2024-03-01 09:30:00', 9162.2, 225.0),
    ('2024-03-02 08:15:00', 9262.7, '2024-03-02 09:30:00', 9312.4, 255.0),
    ('2024-03-03 08:15:00', 9412.9, '2024-03-03 09:30:00', 9462.6, 225.0),
    ('2024-03-04 08:15:00', 9563.1, '2024-03-04 09:30:00', 9612.8, 252.0),
    ('2024-03-05 08:15:00', 9713.3, '2024-03-05 09:30:00', 9763.0, 225.0),
    ('2024-03-06 08:15:00', 9863.5, '2024-03-06 09:30:00', 9913.2, 249.0),
    ('2024-03-07 08:15:00', 10013.7, '2024-03-07 09:30:00', 10063.4, 225.0),
    ('2024-03-08 08:15:00', 10163.9, '2024-03-08 09:30:00', 10213.6, 246.0),
    ('2024-03-09 08:15:00', 10314.1, '2024-03-09 09:30:00', 10363.8, 225.0),
    ('2024-03-10 08:15:00', 10464.3, '2024-03-10 09:30:00', 10514.0, 243.0),
    ('2024-03-11 08:15:00', 10614.5, '2024-03-11 09:30:00', 10664.2, 225.0),
    ('2024-03-12 08:15:00', 10764.7, '2024-03-12 09:30:00', 10814.4, 240.0),
    ('2024-03-13 08:15:00', 10914.9, '2024-03-13 09:30:00', 10964.6, 225.0),
    ('2024-03-14 08:15:00', 11065.1, '2024-03-14 09:30:00', 11114.8, 237.0),
    ('2024-03-15 08:15:00', 11215.3, '2024-03-15 09:30:00', 11265.0, 225.0);

''',
      '''
INSERT INTO servico (tipo, data, km, descricao, valor) VALUES
    ('Troca de Óleo', '2024-01-01', 100.5, 'Troca de óleo básica', 15.00),
    ('Revisão', '2024-01-02', 200.8, 'Revisão básica do veículo', 30.00),
    ('Troca de Pneus', '2024-01-03', 300.0, 'Troca de um pneu', 24.00),
    ('Lavagem/Limpeza', '2024-01-04', 450.8, 'Lavagem completa', 9.00),
    ('Troca de Óleo', '2024-01-05', 550.3, 'Troca de óleo e filtro', 15.00),
    ('Revisão', '2024-01-06', 650.5, 'Revisão completa do veículo', 36.00),
    ('Troca de Pneus', '2024-01-07', 750.0, 'Troca de todos os pneus', 36.00),
    ('Lavagem/Limpeza', '2024-01-08', 850.1, 'Lavagem completa', 9.00),
    ('Troca de Óleo', '2024-01-09', 900.8, 'Troca de óleo básica', 16.50),
    ('Revisão', '2024-01-10', 1000.0, 'Revisão básica do veículo', 27.00),
    ('Troca de Pneus', '2024-01-11', 1050.3, 'Troca de um pneu', 22.50),
    ('Lavagem/Limpeza', '2024-01-12', 1100.5, 'Lavagem completa', 10.50),
    ('Troca de Óleo', '2024-01-13', 1150.2, 'Troca de óleo e filtro', 18.00),
    ('Revisão', '2024-01-14', 1200.0, 'Revisão completa do veículo', 33.00),
    ('Troca de Pneus', '2024-01-15', 1250.5, 'Troca de todos os pneus', 54.00),
    ('Lavagem/Limpeza', '2024-01-16', 1300.1, 'Lavagem completa', 13.50),
    ('Troca de Óleo', '2024-01-17', 1350.8, 'Troca de óleo básica', 19.50),
    ('Revisão', '2024-01-18', 1400.2, 'Revisão básica do veículo', 28.50),
    ('Troca de Pneus', '2024-01-19', 1450.0, 'Troca de um pneu', 25.50),
    ('Lavagem/Limpeza', '2024-01-20', 1500.5, 'Lavagem completa', 15.00),
    ('Troca de Óleo', '2024-01-21', 1550.1, 'Troca de óleo e filtro', 21.00),
    ('Revisão', '2024-01-22', 1600.2, 'Revisão completa do veículo', 39.00),
    ('Troca de Pneus', '2024-01-23', 1650.0, 'Troca de todos os pneus', 42.00),
    ('Lavagem/Limpeza', '2024-01-24', 1700.5, 'Lavagem completa', 18.00),
    ('Troca de Óleo', '2024-01-25', 1750.8, 'Troca de óleo básica', 22.50),
    ('Revisão', '2024-01-26', 1800.0, 'Revisão básica do veículo', 27.00),
    ('Troca de Pneus', '2024-01-27', 1850.3, 'Troca de um pneu', 27.00),
    ('Lavagem/Limpeza', '2024-01-28', 1900.5, 'Lavagem completa', 21.00),
    ('Troca de Óleo', '2024-01-29', 1950.1, 'Troca de óleo e filtro', 24.00),
    ('Revisão', '2024-01-30', 2000.2, 'Revisão completa do veículo', 51.00),
    ('Troca de Pneus', '2024-01-31', 2050.0, 'Troca de todos os pneus', 75.00),
    ('Lavagem/Limpeza', '2024-02-01', 2100.5, 'Lavagem completa', 24.00),
    ('Troca de Óleo', '2024-02-02', 2150.2, 'Troca de óleo básica', 27.00),
    ('Revisão', '2024-02-03', 2200.0, 'Revisão completa do veículo', 54.00),
    ('Troca de Pneus', '2024-02-04', 2250.3, 'Troca de um pneu', 30.00),
    ('Lavagem/Limpeza', '2024-02-05', 2300.1, 'Lavagem completa', 27.00),
    ('Troca de Óleo', '2024-02-06', 2350.8, 'Troca de óleo e filtro', 30.00),
    ('Revisão', '2024-02-07', 2400.0, 'Revisão completa do veículo', 60.00),
    ('Troca de Pneus', '2024-02-08', 2450.5, 'Troca de todos os pneus', 84.00),
    ('Lavagem/Limpeza', '2024-02-09', 2500.1, 'Lavagem completa', 30.00),
    ('Troca de Óleo', '2024-02-10', 2550.8, 'Troca de óleo básica', 33.00),
    ('Revisão', '2024-02-11', 2600.2, 'Revisão completa do veículo', 66.00),
    ('Troca de Pneus', '2024-02-12', 2650.0, 'Troca de um pneu', 36.00),
    ('Lavagem/Limpeza', '2024-02-13', 2700.5, 'Lavagem completa', 33.00),
    ('Troca de Óleo', '2024-02-14', 2750.8, 'Troca de óleo e filtro', 36.00),
    ('Revisão', '2024-02-15', 2800.0, 'Revisão completa do veículo', 72.00),
    ('Troca de Pneus', '2024-02-16', 2850.3, 'Troca de todos os pneus', 96.00),
    ('Lavagem/Limpeza', '2024-02-17', 2900.5, 'Lavagem completa', 36.00),
    ('Troca de Óleo', '2024-02-18', 2950.1, 'Troca de óleo básica', 39.00),
    ('Revisão', '2024-02-19', 3000.2, 'Revisão completa do veículo', 78.00),
    ('Troca de Pneus', '2024-02-20', 3050.0, 'Troca de um pneu', 42.00),
    ('Lavagem/Limpeza', '2024-02-21', 3100.5, 'Lavagem completa', 39.00),
    ('Troca de Óleo', '2024-02-22', 3150.8, 'Troca de óleo e filtro', 42.00),
    ('Revisão', '2024-02-23', 3200.0, 'Revisão completa do veículo', 60.00),
    ('Troca de Pneus', '2024-02-24', 3250.5, 'Troca de todos os pneus', 108.00),
    ('Lavagem/Limpeza', '2024-02-25', 3300.1, 'Lavagem completa', 42.00),
    ('Troca de Óleo', '2024-02-26', 3350.8, 'Troca de óleo básica', 45.00),
    ('Troca de Óleo', '2024-02-25', 3600.2, 'Troca de óleo e filtro', 30.00),
    ('Revisão', '2024-02-26', 3650.1, 'Revisão completa do veículo', 60.00),
    ('Troca de Pneus', '2024-02-27', 3700.1, 'Troca de todos os pneus', 90.00),
    ('Lavagem/Limpeza', '2024-02-28', 3750.5, 'Lavagem completa', 15.00),
    ('Troca de Óleo', '2024-02-29', 3800.0, 'Troca de óleo e filtro', 30.00),
    ('Revisão', '2024-03-01', 3850.3, 'Revisão completa do veículo', 60.00),
    ('Troca de Pneus', '2024-03-02', 3900.5, 'Troca de todos os pneus', 90.00),
    ('Lavagem/Limpeza', '2024-03-03', 3950.8, 'Lavagem completa', 15.00),
    ('Troca de Óleo', '2024-03-04', 4000.0, 'Troca de óleo e filtro', 30.00),
    ('Revisão', '2024-03-05', 4050.2, 'Revisão completa do veículo', 60.00),
    ('Troca de Pneus', '2024-03-06', 4100.3, 'Troca de todos os pneus', 90.00),
    ('Lavagem/Limpeza', '2024-03-07', 4150.6, 'Lavagem completa', 15.00),
    ('Troca de Óleo', '2024-03-08', 4200.0, 'Troca de óleo e filtro', 30.00),
    ('Revisão', '2024-03-09', 4250.2, 'Revisão completa do veículo', 60.00),
    ('Troca de Pneus', '2024-03-10', 4300.4, 'Troca de todos os pneus', 90.00),
    ('Lavagem/Limpeza', '2024-03-11', 4350.7, 'Lavagem completa', 15.00),
    ('Troca de Óleo', '2024-03-12', 4400.0, 'Troca de óleo e filtro', 30.00),
    ('Revisão', '2024-03-13', 4450.3, 'Revisão completa do veículo', 60.00),
    ('Troca de Pneus', '2024-03-14', 4500.5, 'Troca de todos os pneus', 90.00),
    ('Lavagem/Limpeza', '2024-03-15', 4550.8, 'Lavagem completa', 15.00);

''',
    ],
  };

  static Future<Database> initDatabase(String fname) async {
    return await openDatabase(join(await getDatabasesPath(), fname),
        version: _migrationScripts.length, onCreate: (db, version) async {
      for (final script in _migrationScripts.values) {
        for (String sql in script) {
          await db.execute(sql);
        }
      }
    }, onUpgrade: (db, oldVersion, newVersion) async {
      for (int i = oldVersion + 1; i <= newVersion; i++) {
        for (String sql in (_migrationScripts[i] as List<String>)) {
          await db.execute(sql);
        }
      }
    });
  }
}
