import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  //initial value
  @override
  Set<Product> build() {
    return const {};
  }

  // methods to update state

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

final cartTotalNotifier = Provider<int>((ref) {
  final productsInCart = ref.watch(cartNotifierProvider);
  int total = 0;
  for (Product product in productsInCart) {
    total += product.price;
  }
  return total;
});

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
