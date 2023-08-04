import 'package:hydrated_bloc/hydrated_bloc.dart';

class HomeCubit extends HydratedCubit<int> {
  HomeCubit() : super(0);

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['count'];
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'count': state};
  }

  increment() {
    emit(state + 1);
  }

  reset() {
    emit(0);
  }
}
