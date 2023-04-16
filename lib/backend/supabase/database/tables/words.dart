import '../database.dart';

class WordsTable extends SupabaseTable<WordsRow> {
  @override
  String get tableName => 'words';

  @override
  WordsRow createRow(Map<String, dynamic> data) => WordsRow(data);
}

class WordsRow extends SupabaseDataRow {
  WordsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WordsTable();

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get language => getField<String>('language');
  set language(String? value) => setField<String>('language', value);

  String get word => getField<String>('word')!;
  set word(String value) => setField<String>('word', value);

  String? get pronunceJp => getField<String>('pronunce_jp');
  set pronunceJp(String? value) => setField<String>('pronunce_jp', value);

  String? get summaryJp => getField<String>('summary_jp');
  set summaryJp(String? value) => setField<String>('summary_jp', value);

  String? get descJp => getField<String>('desc_jp');
  set descJp(String? value) => setField<String>('desc_jp', value);

  String? get wordEn => getField<String>('word_en');
  set wordEn(String? value) => setField<String>('word_en', value);

  String? get pronunceEn => getField<String>('pronunce_en');
  set pronunceEn(String? value) => setField<String>('pronunce_en', value);

  String? get summaryEn => getField<String>('summary_en');
  set summaryEn(String? value) => setField<String>('summary_en', value);

  String? get descEn => getField<String>('desc_en');
  set descEn(String? value) => setField<String>('desc_en', value);

  String? get embedding => getField<String>('embedding');
  set embedding(String? value) => setField<String>('embedding', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get creator => getField<String>('creator');
  set creator(String? value) => setField<String>('creator', value);

  String? get pictUrl => getField<String>('pict_url');
  set pictUrl(String? value) => setField<String>('pict_url', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get mood => getField<String>('mood');
  set mood(String? value) => setField<String>('mood', value);
}
