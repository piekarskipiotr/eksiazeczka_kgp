// GENERATED CODE DO NOT EDIT
// This file should be version controlled
import 'package:brick_sqlite/db.dart';
part '20250109093601.migration.dart';
part '20250108142842.migration.dart';
part '20250108144351.migration.dart';
part '20250109090222.migration.dart';

/// All intelligently-generated migrations from all `@Migratable` classes on disk
final migrations = <Migration>{
  const Migration20250109093601(),
  const Migration20250108142842(),
  const Migration20250108144351(),
  const Migration20250109090222()
};

/// A consumable database structure including the latest generated migration.
final schema = Schema(20250109093601, generatorVersion: 1, tables: <SchemaTable>{
  SchemaTable('_brick_Peak_descriptions', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('l_Peak_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'Peak',
        onDeleteCascade: true,
        onDeleteSetDefault: false),
    SchemaColumn('f_PeakDescription_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'PeakDescription',
        onDeleteCascade: true,
        onDeleteSetDefault: false)
  }, indices: <SchemaIndex>{
    SchemaIndex(
        columns: ['l_Peak_brick_id', 'f_PeakDescription_brick_id'],
        unique: true)
  }),
  SchemaTable('Peak', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('name', Column.varchar),
    SchemaColumn('coordinates_PeakCoordinates_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'PeakCoordinates',
        onDeleteCascade: false,
        onDeleteSetDefault: false),
    SchemaColumn('location', Column.varchar),
    SchemaColumn('mountain_range', Column.varchar),
    SchemaColumn('height', Column.integer),
    SchemaColumn('difficulty_level', Column.integer),
    SchemaColumn('average_ascent_time', Column.integer),
    SchemaColumn('popularity', Column.integer),
    SchemaColumn('user_metadata_PeakUserMetadata_brick_id', Column.integer,
        isForeignKey: true,
        foreignTableName: 'PeakUserMetadata',
        onDeleteCascade: false,
        onDeleteSetDefault: false)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('PeakDescription', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('locale', Column.varchar),
    SchemaColumn('text', Column.varchar),
    SchemaColumn('peak_id', Column.varchar)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('PeakCoordinates', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('lat', Column.Double),
    SchemaColumn('lng', Column.Double),
    SchemaColumn('peak_id', Column.varchar)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  }),
  SchemaTable('PeakUserMetadata', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('id', Column.varchar, unique: true),
    SchemaColumn('conquered_date', Column.datetime),
    SchemaColumn('peak_id', Column.varchar),
    SchemaColumn('user_id', Column.varchar)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['id'], unique: true)
  })
});
