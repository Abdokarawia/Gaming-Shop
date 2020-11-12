import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaming_app/Providers/Product_Provider.dart';
import 'package:provider/provider.dart';
import '../Providers/Products_Provider.dart';

class editProductScreen extends StatefulWidget {
  static const routename = 'gotoEditProductScreen';

  @override
  _editProductScreenState createState() => _editProductScreenState();
}

class _editProductScreenState extends State<editProductScreen> {
  final UrlController = TextEditingController();
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _urlFocusNode = FocusNode();
  final _cIDFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    title: '',
    decoration: '',
    price: 25,
    subtitle: '',
    Category_id: '',
    img: '',
  );

  @override
  void initState() {
    _urlFocusNode.addListener(_updateUrl);
    super.initState();
  }

  @override
  void dispose() {
    _urlFocusNode.removeListener(_updateUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _urlFocusNode.dispose();
    _cIDFocusNode.dispose();
    super.dispose();
  }

  void _updateUrl() {
    if (!_urlFocusNode.hasFocus) {
      setState(() {});
    }
  }



  @override
  Widget build(BuildContext context) {
    print(_editedProduct.title);
    print(_editedProduct.img);
    final productsProvider=Provider.of <ProductsProvider> (context);
    void _saveForm() {
      _form.currentState.save();
      productsProvider.pr=_editedProduct;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF7FAFE),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          'Edit Products',
          style: Theme.of(context).textTheme.body1,
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.save,
                size: 24,
                color: Colors.blue,
              ),
              onPressed: _saveForm,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    return FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (title) {
                    _editedProduct = Product(
                        title: title,
                        subtitle: title,
                        decoration: _editedProduct.decoration,
                        img: _editedProduct.img,
                        Category_id: _editedProduct.Category_id,
                        id: null,
                        price: _editedProduct.price);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    return FocusScope.of(context).requestFocus(_cIDFocusNode);
                  },
                  onSaved: (Price) {
                    _editedProduct = Product(
                        title: _editedProduct.title,
                        subtitle: _editedProduct.title,
                        decoration: _editedProduct.decoration,
                        img: _editedProduct.img,
                        Category_id: _editedProduct.Category_id,
                        id: null,
                        price: double.parse(Price));
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Category ID'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  focusNode: _cIDFocusNode,
                  onFieldSubmitted: (_) {
                    return FocusScope.of(context)
                        .requestFocus(_descriptionFocusNode);
                  },
                  onSaved: (CID) {
                    _editedProduct = Product(
                        title: _editedProduct.title,
                        subtitle: _editedProduct.title,
                        decoration: _editedProduct.decoration,
                        img: _editedProduct.img,
                        Category_id: CID,
                        id: null,
                        price: _editedProduct.price);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLength: 99,
                  maxLines: 3,
                  focusNode: _descriptionFocusNode,
                  keyboardType: TextInputType.multiline,
                  onSaved: (Description) {
                    _editedProduct = Product(
                        title: _editedProduct.title,
                        subtitle: _editedProduct.title,
                        decoration: Description,
                        img: _editedProduct.img,
                        Category_id: _editedProduct.Category_id,
                        id: null,
                        price: _editedProduct.price);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: UrlController.text.isEmpty
                          ? Text('No Image to Preview')
                          : FittedBox(
                              child: Image.network(UrlController.text),
                              fit: BoxFit.cover,
                            ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image'),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                        controller: UrlController,
                        focusNode: _urlFocusNode,
                        onFieldSubmitted: (_) {
                          return _saveForm();
                        },
                        onSaved: (Image) {
                          _editedProduct = Product(
                              title: _editedProduct.title,
                              subtitle: _editedProduct.title,
                              decoration: _editedProduct.decoration,
                              img: Image,
                              Category_id: _editedProduct.Category_id,
                              id: null,
                              price: _editedProduct.price);
                        },
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:  Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 30,
                        child: FittedBox(
                          child: Text("ADD TO CART",style: Theme.of(context).textTheme.display1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap:productsProvider.addProduct,
                )
              ],
            )),
      ),
    );
  }
}
