// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20250109090222_up = [
  DropColumn('coordinates_lat', onTable: 'Peak'),
  DropColumn('coordinates_lng', onTable: 'Peak'),
  InsertTable('PeakCoordinates'),
  InsertForeignKey('Peak', 'PeakCoordinates', foreignKeyColumn: 'coordinates_PeakCoordinates_brick_id', onDeleteCascade: false, onDeleteSetDefault: false),
  InsertColumn('coordinates_lat', Column.Double, onTable: 'PeakCoordinates'),
  InsertColumn('coordinates_lng', Column.Double, onTable: 'PeakCoordinates'),
  InsertColumn('peak_id', Column.varchar, onTable: 'PeakCoordinates')
];

const List<MigrationCommand> _migration_20250109090222_down = [
  DropTable('PeakCoordinates'),
  DropColumn('coordinates_PeakCoordinates_brick_id', onTable: 'Peak'),
  DropColumn('coordinates_lat', onTable: 'PeakCoordinates'),
  DropColumn('coordinates_lng', onTable: 'PeakCoordinates'),
  DropColumn('peak_id', onTable: 'PeakCoordinates')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20250109090222',
  up: _migration_20250109090222_up,
  down: _migration_20250109090222_down,
)
class Migration20250109090222 extends Migration {
  const Migration20250109090222()
    : super(
        version: 20250109090222,
        up: _migration_20250109090222_up,
        down: _migration_20250109090222_down,
      );
}
