import '../database.dart';

class WordsMoodTable extends SupabaseTable<WordsMoodRow> {
  @override
  String get tableName => 'words_mood';

  @override
  WordsMoodRow createRow(Map<String, dynamic> data) => WordsMoodRow(data);
}

class WordsMoodRow extends SupabaseDataRow {
  WordsMoodRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WordsMoodTable();

  String? get mood => getField<String>('mood');
  set mood(String? value) => setField<String>('mood', value);
}
