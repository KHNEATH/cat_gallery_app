import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_logic.dart';
import 'cart_screen.dart';
import 'dark_logic.dart';
import 'fakeproduct_model.dart';
import 'product_logic.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Screen One"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartScreen(),
              ));
            },
            icon: Badge(
              label: Text("${context.watch<CartLogic>().numOfItems}"),
              child: Icon(Icons.shopping_cart),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      );
  }

  Widget _buildDrawer(){
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Icon(Icons.face)),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text("Change To System"),
            onTap: (){
              context.read<DarkLogic>().changeToSystem();
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text("Change To Dark"),
            onTap: (){
              context.read<DarkLogic>().changeToDark();
            },
          ),
          ListTile(
            leading: Icon(Icons.light),
            title: Text("Change To Light"),
            onTap: (){
              context.read<DarkLogic>().changeToLight();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    bool loading = context.watch<ProductLogic>().loading;
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }

    String? error = context.watch<ProductLogic>().error;

    if (error != null) {
      return _buildError(error);
    }

    var productList = context.watch<ProductLogic>().productList;
    return _buildListView(productList);
  }

  Widget _buildError(String error) {
    debugPrint(error);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Something went wrong",
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ProductLogic>().getData();
            },
            child: Text("RETRY"),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(List<FakeProductModel> items) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductLogic>().getData();
      },
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildItem(items[index]);
        },
      ),
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
              ? Icons.check
              : Icons.add_shopping_cart_outlined,
        ),
      ),
    );
  }
}
