// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20250108144351_up = [
  DropColumn('description', onTable: 'Peak'),
  InsertTable('_brick_Peak_descriptions'),
  InsertTable('PeakDescription'),
  InsertForeignKey('_brick_Peak_descriptions', 'Peak', foreignKeyColumn: 'l_Peak_brick_id', onDeleteCascade: true, onDeleteSetDefault: false),
  InsertForeignKey('_brick_Peak_descriptions', 'PeakDescription', foreignKeyColumn: 'f_PeakDescription_brick_id', onDeleteCascade: true, onDeleteSetDefault: false),
  InsertColumn('id', Column.varchar, onTable: 'PeakDescription', unique: true),
  InsertColumn('locale', Column.varchar, onTable: 'PeakDescription'),
  InsertColumn('text', Column.varchar, onTable: 'PeakDescription'),
  InsertColumn('peak_id', Column.varchar, onTable: 'PeakDescription'),
  CreateIndex(columns: ['l_Peak_brick_id', 'f_PeakDescription_brick_id'], onTable: '_brick_Peak_descriptions', unique: true),
  CreateIndex(columns: ['id'], onTable: 'PeakDescription', unique: true)
];

const List<MigrationCommand> _migration_20250108144351_down = [
  DropTable('_brick_Peak_descriptions'),
  DropTable('PeakDescription'),
  DropColumn('l_Peak_brick_id', onTable: '_brick_Peak_descriptions'),
  DropColumn('f_PeakDescription_brick_id', onTable: '_brick_Peak_descriptions'),
  DropColumn('id', onTable: 'PeakDescription'),
  DropColumn('locale', onTable: 'PeakDescription'),
  DropColumn('text', onTable: 'PeakDescription'),
  DropColumn('peak_id', onTable: 'PeakDescription'),
  DropIndex('index__brick_Peak_descriptions_on_l_Peak_brick_id_f_PeakDescription_brick_id'),
  DropIndex('index_PeakDescription_on_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20250108144351',
  up: _migration_20250108144351_up,
  down: _migration_20250108144351_down,
)
class Migration20250108144351 extends Migration {
  const Migration20250108144351()
    : super(
        version: 20250108144351,
        up: _migration_20250108144351_up,
        down: _migration_20250108144351_down,
      );
}
