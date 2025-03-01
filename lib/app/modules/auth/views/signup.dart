// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:better_nak/app/themes/theme.dart';
// import 'package:better_nak/app/widgets/custom_scaffold.dart';
// import 'package:better_nak/app/modules/auth/views/login_view.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final _formSignupKey =
//       GlobalKey<FormState>(); // Menggunakan GlobalKey<FormState>
//   bool agreePersonalData = false;

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40.0),
//                     topRight: Radius.circular(40.0),
//                   ),
//                 ),
//                 child: Form(
//                   key: _formSignupKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Get Started',
//                         style: TextStyle(
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.w900,
//                           color: lightColorScheme.onSurface,
//                         ),
//                       ),
//                       const SizedBox(height: 40.0),
//                       _buildTextField(
//                           label: 'Full Name', hint: 'Enter Full Name'),
//                       const SizedBox(height: 25.0),
//                       _buildTextField(label: 'Email', hint: 'Enter Email'),
//                       const SizedBox(height: 25.0),
//                       _buildTextField(
//                           label: 'Password',
//                           hint: 'Enter Password',
//                           obscureText: true),
//                       const SizedBox(height: 25.0),
//                       _buildAgreementCheckbox(),
//                       const SizedBox(height: 25.0),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: _submitForm,
//                           child: const Text('Sign up'),
//                         ),
//                       ),
//                       const SizedBox(height: 30.0),
//                       _buildDividerWithText('Sign up with'),
//                       const SizedBox(height: 30.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text('Already have an account? '),
//                           GestureDetector(
//                             onTap: () => Get.to(() => LoginView()),
//                             child: Text(
//                               'Sign in',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: lightColorScheme.primary,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20.0),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String label,
//     required String hint,
//     bool obscureText = false,
//   }) {
//     return TextFormField(
//       obscureText: obscureText,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter $label';
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.black26),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.black12),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.black12),
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }

//   Widget _buildDividerWithText(String text) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//             child:
//                 Divider(thickness: 0.7, color: Colors.grey.withOpacity(0.5))),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Text(text, style: const TextStyle(color: Colors.black45)),
//         ),
//         Expanded(
//             child:
//                 Divider(thickness: 0.7, color: Colors.grey.withOpacity(0.5))),
//       ],
//     );
//   }

//   Widget _buildAgreementCheckbox() {
//     return Row(
//       children: [
//         Checkbox(
//           value: agreePersonalData,
//           onChanged: (value) {
//             setState(() {
//               agreePersonalData = value ?? false;
//             });
//           },
//           activeColor: lightColorScheme.primary,
//         ),
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               agreePersonalData = !agreePersonalData;
//             });
//           },
//           child: RichText(
//             text: TextSpan(
//               style: DefaultTextStyle.of(context).style,
//               children: [
//                 const TextSpan(text: 'I agree to the processing of '),
//                 TextSpan(
//                   text: 'Personal data',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: lightColorScheme.primary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _submitForm() {
//     if (_formSignupKey.currentState?.validate() == true && agreePersonalData) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Processing Data')),
//       );
//     } else if (!agreePersonalData) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Please agree to the processing of personal data')),
//       );
//     }
//   }
// }
