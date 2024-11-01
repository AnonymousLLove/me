// import 'package:flutter/material.dart';

// class AccountDeleteSuccessfulScreen extends StatefulWidget {
//   const AccountDeleteSuccessfulScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _AccountDeleteSuccessfulScreenState createState() => _AccountDeleteSuccessfulScreenState();
// }

// class _AccountDeleteSuccessfulScreenState extends State<AccountDeleteSuccessfulScreen> {
//   bool marketingPermission = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // leading: IconButton(
//         //   icon: const Icon(Icons.arrow_back),
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//         // ),
//         // title: Row(
//         //   children: [
//         //     Image.asset(
//         //       "images/ai.png",
//         //     ),
//         //     const SizedBox(width: 25),
//         //     const Text(
//         //       'Terms and Conditions',
//         //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         //     ),
//         //   ],
//         // ),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//                       ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AccountDeleteSuccessfulScreen extends StatefulWidget {
  const AccountDeleteSuccessfulScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccountDeleteSuccessfulScreenState createState() => _AccountDeleteSuccessfulScreenState();
}

class _AccountDeleteSuccessfulScreenState extends State<AccountDeleteSuccessfulScreen> {
  bool marketingPermission = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your UI elements here
            Text('We hate to see you leave', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
            Text('Account deleted successfully!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF3628DD)),),
             Text('You can come back anytime!', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }
}

