import 'package:busca_cep_app/models/address_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String addressTable = "address";
final String idColumn = "id";
final String cepColumn = "cep";
final String logradouroColumn = "logradouro";
final String complementoColumn = "complemento";
final String bairroColumn = "bairro";
final String localidadeColumn = "localidade";
final String ufColumn = "uf";
final String unidadeColumn = "unidade";
final String ibgeColumn = "ibge";
final String giaColumn = "gia";
final String createdAtColumn = "createdAt";

class AddressHelper {
  static final AddressHelper _instance = AddressHelper.internal();

  factory AddressHelper() => _instance;

  AddressHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'address.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE $addressTable("
          "$idColumn INTEGER PRIMARY KEY, "
          "$cepColumn TEXT, "
          "$logradouroColumn TEXT,"
          "$complementoColumn TEXT, "
          "$bairroColumn TEXT, "
          "$localidadeColumn TEXT, "
          "$ufColumn TEXT, "
          "$unidadeColumn TEXT, "
          "$ibgeColumn TEXT, "
          "$giaColumn TEXT, "
          "$createdAtColumn TEXT"
          ")");
    });
  }

  Future<Address> saveAddress(Address address) async {
    Database dbAddress = await db;
    address.id = await dbAddress.insert(addressTable, address.toJson());
    return address;
  }

  Future<Address> getAddress(int id) async {
    Database dbAddress = await db;
    List<Map> maps = await dbAddress.query(
      addressTable,
      columns: [
        idColumn,
        cepColumn,
        logradouroColumn,
        complementoColumn,
        bairroColumn,
        localidadeColumn,
        ufColumn,
        unidadeColumn,
        ibgeColumn,
        giaColumn,
        createdAtColumn
      ],
      where: "$idColumn = ?",
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return Address.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteAddress(int id) async {
    Database dbAddress = await db;
    return await dbAddress
        .delete(addressTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateAddress(Address address) async {
    Database dbAddress = await db;
    return await dbAddress.update(addressTable, address.toJson(),
        where: "$idColumn = ?", whereArgs: [address.id]);
  }

  Future<List> getAllAddress() async {
    Database dbAddress = await db;
    List listMap = await dbAddress.rawQuery("SELECT * FROM $addressTable");
    List<Address> listAddress = List();
    for (Map m in listMap) {
      listAddress.add(Address.fromJson(m));
    }
    return listAddress;
  }

  Future<int> getNumber() async {
    Database dbAddress = await db;
    return Sqflite.firstIntValue(
        await dbAddress.rawQuery("SELECT COUNT(*) FROM $addressTable"));
  }

  Future close() async {
    Database dbAddress = await db;
    dbAddress.close();
  }
}
