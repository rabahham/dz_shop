import 'searsh_state.dart';
import '../../models/shopappmodels/searsh_model%20copy.dart';
import '../../shered/components/constants.dart';
import '../../shered/network/end_points.dart';
import '../../shered/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearshCuibit extends Cubit<SearshState> {
  SearshCuibit() : super(SearshInitialState());

  static SearshCuibit get(context) => BlocProvider.of(context);

  SearshModel? searchmodelProdect;

  void searsh({String? text}) {
    emit(SearshLoadingState());
    DioHelper.postData(url: SEARSH, token: token, data: {
      'text': text,
    }).then((value) {
      searchmodelProdect = SearshModel.fromJson(value!.data);

      emit(SearshSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(SearshErrorState());
    });
  }
}
