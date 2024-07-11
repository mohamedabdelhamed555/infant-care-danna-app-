import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/screens/home/controllers/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  static String name = 'raneem';
  // ProductCardModel? productModel;

  Future<void> getArticles() async {
    emit(GetArticlesLoadingState());
    // await ApiService.getData(url: 'Articles').then((value) {
    //   productModel = ProductCardModel.fromJson(value.data);

    //   print(productModel);

    //   emit(GetArticlesSuccessState());
    // }).catchError((e) {
    //   print(e);
    //   emit(GetArticlesErrorState());
    // });
  }
}
