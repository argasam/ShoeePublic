import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/model/shoe.dart';
import 'package:shoee/view/Details/components/body.dart';
import 'package:shoee/view/Details/components/bottom_buy.dart';
import 'package:shoee/view/Details/size_notifier.dart';

class DetailsView extends ConsumerStatefulWidget {
  final Shoe shoe;
  final Ref ref;
  DetailsView ({Key? key, required this.shoe, required this.ref}) : super(key: key);
  
  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends ConsumerState<DetailsView> {
  
  FirebaseAuth auth = FirebaseAuth.instance;
  String selectedSize = '';
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(shoe: widget.shoe),
      bottomNavigationBar: BottomBuy(shoe: widget.shoe, color: ref.watch(selectedColorProvider).initialcolor.toString(), size: ref.watch(selectedSizeProvider).initialsize.toString(), uid:auth.currentUser?.uid ?? '', image: ref.watch(selectedColorProvider).initialimage.toString(),),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text('DETAILS', style: TextStyle(
        color: Colors.black,
        fontSize: 18
      ),),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: (() => context.pop(context)), ),
      actions: [
        
        IconButton(onPressed: (() {
          
        }), icon: Icon(Icons.favorite_border),
        color: Colors.black,),
        IconButton(onPressed: ((() {
          
        })), 
        icon: Icon(Icons.shopping_bag_outlined),
        color: Colors.black,),
      ],
    );
  }
}

// class DetailsView extends StatelessWidget {
  
  
//   DetailsView({Key? key, required this.shoe}) : super(key: key);
//   final Shoe shoe;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   void onSizeSelected(String size) {
//     setState(() {
//       selectedSize = size;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: Body(shoe: shoe),
//       bottomNavigationBar: BottomBuy(shoe: shoe, color: '', size: '', uid: auth.currentUser?.uid ??),
//     );
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       backgroundColor: Colors.white,
//       elevation: 0,
//       title: Text('DETAILS', style: TextStyle(
//         color: Colors.black,
//         fontSize: 18
//       ),),
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back),
//         color: Colors.black,
//         onPressed: (() => context.pop(context)), ),
//         actions: [
          
//           IconButton(onPressed: (() {
            
//           }), icon: Icon(Icons.favorite_border),
//           color: Colors.black,),
//           IconButton(onPressed: ((() {
            
//           })), 
//           icon: Icon(Icons.shopping_bag_outlined),
//           color: Colors.black,),
//         ],
//     );
//   }
// }