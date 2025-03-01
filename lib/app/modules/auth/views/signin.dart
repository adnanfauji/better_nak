// import 'package:flutter/material.dart';
// import 'package:better_nak/app/modules/auth/views/signup.dart';
// import 'package:better_nak/app/widgets/custom_scaffold.dart';
// import 'package:better_nak/app/themes/theme.dart';

// class Signin extends StatefulWidget {
//   const Signin({super.key});

//   @override
//   State<Signin> createState() => _SigninState();
// }

// class _SigninState extends State<Signin> {
//   final _formSignInKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool rememberPassword = true;
//   bool _obscurePassword = true;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(25.0),
//         child: Form(
//           key: _formSignInKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'Login untuk Better-Nak',
//                 style: TextStyle(
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.w900,
//                   color: lightColorScheme.onSurface,
//                 ),
//               ),
//               const SizedBox(height: 40.0),

//               // Input Email
//               TextFormField(
//                 controller: _emailController,
//                 validator: (value) => (value == null || value.isEmpty)
//                     ? 'Please enter Email'
//                     : null,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   hintText: 'Enter Email',
//                   hintStyle: const TextStyle(color: Colors.black26),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25.0),

//               // Input Password
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: _obscurePassword,
//                 validator: (value) => (value == null || value.isEmpty)
//                     ? 'Please enter Password'
//                     : null,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   hintText: 'Enter Password',
//                   hintStyle: const TextStyle(color: Colors.black26),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                       color: Colors.black38,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25.0),

//               // Remember Me & Forgot Password
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: rememberPassword,
//                         onChanged: (value) {
//                           setState(() => rememberPassword = value ?? false);
//                         },
//                       ),
//                       const Text('Remember me'),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // Tambahkan navigasi ke halaman lupa password
//                     },
//                     child: Text(
//                       'Forgot password?',
//                       style: TextStyle(color: lightColorScheme.primary),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 42.0),

//               // Tombol Sign In
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formSignInKey.currentState!.validate()) {
//                       FocusScope.of(context).unfocus(); // Tutup keyboard

//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Processing Data')),
//                       );

//                       // Tambahkan proses login di sini
//                       print('Email: ${_emailController.text}');
//                       print('Password: ${_passwordController.text}');
//                     }
//                   },
//                   child: const Text('Masuk'),
//                 ),
//               ),
//               const SizedBox(height: 42.0),

// // Tombol Masuk dengan Google
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: OutlinedButton.icon(
//                   onPressed: () {
//                     // Aksi login dengan Google
//                   },
//                   icon: Image.asset('images/google_icon.png', width: 24),
//                   label: const Text(
//                     "Masuk dengan Google",
//                     style: TextStyle(color: Colors.black87, fontSize: 16),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: OutlinedButton.icon(
//                   onPressed: () {
//                     // Aksi login dengan Google
//                   },
//                   icon: Image.asset('images/facebook_icon.png', width: 24),
//                   label: const Text(
//                     "Masuk dengan Google",
//                     style: TextStyle(color: Colors.black87, fontSize: 16),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Link ke Sign Up
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account? "),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const Signup()),
//                       );
//                     },
//                     child: Text(
//                       'Sign up',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: lightColorScheme.primary,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
