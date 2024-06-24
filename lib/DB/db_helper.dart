import 'dart:async';

import 'package:angoragh_e_commerce/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static const String tableName = 'login';
  static const String columnId = 'id';
  static const String columnAccessToken = 'access_token';
  static const tableCartDetails = 'cart_details';
  // static const tableBillingShippingDetails = 'billing_shipping_details';
  static const columnProductId = 'product_id';
  static const columnQuantity = 'quantity';
  static const columnCampaignId = 'campaign_id';
  // static const columnBFirstName = 'b_first_name';
  // static const columnBLastName = 'b_last_name';
  // static const columnBPhone = 'b_phone';
  // static const columnBEmail = 'b_email';
  // static const columnBDistrict = 'b_district';
  // static const columnBArea = 'b_area';
  // static const columnBAddress = 'b_address';
  // static const columnSFirstName = 's_first_name';
  // static const columnSLastName = 's_last_name';
  // static const columnSPhone = 's_phone';
  // static const columnSEmail = 's_email';
  // static const columnSDistrict = 's_district';
  // static const columnSArea = 's_area';
  // static const columnSAddress = 's_address';

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // If _database is null, initialize it
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'your_database.db');

    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnAccessToken TEXT
          )
        ''');
        await db.execute('''
        CREATE TABLE $tableCartDetails(
        $columnProductId TEXT,
        $columnQuantity TEXT,
        $columnCampaignId TEXT
        )
        ''');
        // await db.execute('''
        // CREATE TABLE $tableBillingShippingDetails(
        // $columnBFirstName TEXT,
        // $columnBLastName TEXT,
        // $columnBPhone TEXT,
        // $columnBEmail TEXT,
        // $columnBDistrict TEXT,
        // $columnBArea TEXT,
        // $columnBAddress TEXT,
        // $columnSFirstName TEXT,
        // $columnSLastName TEXT,
        // $columnSPhone TEXT,
        // $columnSEmail TEXT,
        // $columnSDistrict TEXT,
        // $columnSArea TEXT,
        // $columnSAddress TEXT,
        //
        //
        // )
        // ''');
      },
    );
  }

  static Future<void> insertLoginData(String accessToken) async {
    final db = await database;
    await db.insert(
      tableName,
      {columnAccessToken: accessToken},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> insertCartDetail(CartModel cartModel) async {
    final db = await database;
    await db.insert(tableCartDetails, cartModel.toMap());
  }

 static Future<List<CartModel>> getCartData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableCartDetails);
    debugPrint(maps.toString());
    return maps.map((e) => CartModel.fromMap(e)).toList();
  }

  static Future<String?> getAccessToken() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    if (maps.isNotEmpty) {
      return maps.first[columnAccessToken] as String?;
    }
    return null;
  }
}
