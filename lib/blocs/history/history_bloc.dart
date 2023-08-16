import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loan_calculator/models/history_record.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  static const String _spKey = "history";

  HistoryBloc() : super(const HistoryInitialState()) {
    on<AddRecord>((event, emit) async {
      try {
        emit(const HistoryLoading());
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        final List<HistoryRecord> records =
            prefs.getStringList(_spKey)?.map((e) => HistoryRecord.fromJson(jsonDecode(e))).toList() ?? [];

        records.insert(0, event.record);

        await prefs.setStringList(_spKey, records.map((e) => jsonEncode(e.toJson())).toList());

        emit(HistoryLoadedState(records));
      } catch (e) {
        emit(const HistoryErrorState("Ошибка добавления записи"));
      }
    });
    on<FetchRecords>((event, emit) async {
      try {
        emit(const HistoryLoading());
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        emit(HistoryLoadedState(
            prefs.getStringList(_spKey)?.map((e) => HistoryRecord.fromJson(jsonDecode(e))).toList() ?? []));
      } catch (e) {
        emit(const HistoryErrorState("Ошибка извлечения записей"));
      }
    });
  }
}
