import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_logic.dart';
import 'fakeproduct_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Cart Screen"),
        
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    var cartList = context.watch<CartLogic>().cartList;
    return _buildListView(cartList);
  }

  Widget _buildListView(List<FakeProductModel> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItem(items[index]);
      },
    );
  }

  Widget _buildItem(FakeProductModel item) {
    return ListTile(
      title: Text(item.title),
      subtitle: SizedBox(
        height: 200,
        child: Image.network("${item.image}"),
      ),
      trailing: IconButton(
        onPressed: () {
          context.read<CartLogic>().toggleProductInCart(item);
        },
        icon: Icon(
          context.watch<CartLogic>().isProductInCart(item)
              ? Icons.cancel
              : Icons.add_shopping_cart_outlined,
        ),
      ),
    );
  }
}