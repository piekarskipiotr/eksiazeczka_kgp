// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20250108142842_up = [
  InsertTable('Peak'),
  InsertTable('PeakUserMetadata'),
  InsertColumn('id', Column.varchar, onTable: 'Peak', unique: true),
  InsertColumn('name', Column.varchar, onTable: 'Peak'),
  InsertColumn('coordinates_lat', Column.Double, onTable: 'Peak'),
  InsertColumn('coordinates_lng', Column.Double, onTable: 'Peak'),
  InsertColumn('mountain_range', Column.varchar, onTable: 'Peak'),
  InsertColumn('height', Column.integer, onTable: 'Peak'),
  InsertColumn('difficulty_level', Column.integer, onTable: 'Peak'),
  InsertColumn('average_ascent_time', Column.integer, onTable: 'Peak'),
  InsertColumn('popularity', Column.integer, onTable: 'Peak'),
  InsertColumn('description', Column.varchar, onTable: 'Peak'),
  InsertForeignKey('Peak', 'PeakUserMetadata', foreignKeyColumn: 'user_metadata_PeakUserMetadata_brick_id', onDeleteCascade: false, onDeleteSetDefault: false),
  InsertColumn('id', Column.varchar, onTable: 'PeakUserMetadata', unique: true),
  InsertColumn('conquered_date', Column.datetime, onTable: 'PeakUserMetadata'),
  InsertColumn('peak_id', Column.varchar, onTable: 'PeakUserMetadata'),
  InsertColumn('user_id', Column.varchar, onTable: 'PeakUserMetadata'),
  CreateIndex(columns: ['id'], onTable: 'Peak', unique: true),
  CreateIndex(columns: ['id'], onTable: 'PeakUserMetadata', unique: true)
];

const List<MigrationCommand> _migration_20250108142842_down = [
  DropTable('Peak'),
  DropTable('PeakUserMetadata'),
  DropColumn('id', onTable: 'Peak'),
  DropColumn('name', onTable: 'Peak'),
  DropColumn('coordinates_lat', onTable: 'Peak'),
  DropColumn('coordinates_lng', onTable: 'Peak'),
  DropColumn('mountain_range', onTable: 'Peak'),
  DropColumn('height', onTable: 'Peak'),
  DropColumn('difficulty_level', onTable: 'Peak'),
  DropColumn('average_ascent_time', onTable: 'Peak'),
  DropColumn('popularity', onTable: 'Peak'),
  DropColumn('description', onTable: 'Peak'),
  DropColumn('user_metadata_PeakUserMetadata_brick_id', onTable: 'Peak'),
  DropColumn('id', onTable: 'PeakUserMetadata'),
  DropColumn('conquered_date', onTable: 'PeakUserMetadata'),
  DropColumn('peak_id', onTable: 'PeakUserMetadata'),
  DropColumn('user_id', onTable: 'PeakUserMetadata'),
  DropIndex('index_Peak_on_id'),
  DropIndex('index_PeakUserMetadata_on_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20250108142842',
  up: _migration_20250108142842_up,
  down: _migration_20250108142842_down,
)
class Migration20250108142842 extends Migration {
  const Migration20250108142842()
    : super(
        version: 20250108142842,
        up: _migration_20250108142842_up,
        down: _migration_20250108142842_down,
      );
}
