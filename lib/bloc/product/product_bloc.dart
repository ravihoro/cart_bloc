import 'package:cart_bloc/service/http_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../model/item.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({@required this.httpService}) : super(InitialProductState());

  final HttpService httpService;

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProductEvent) {
      yield LoadingProductState();
      try {
        final List<Item> items = await httpService.fetchData();
        yield LoadedProductState(items: items);
      } catch (e) {
        //print(e.toString());
        yield FailedProductState(exception: e);
      }
    }
  }
}
