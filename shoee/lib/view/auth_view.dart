// lib/view/auth_view.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:shoee/controller/login/login_controller.dart';
import 'package:shoee/controller/login/login_state.dart';

class AuthView extends StatefulHookConsumerWidget{
  @override
  ConsumerState createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView>{
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  
   Widget build(BuildContext context){
    ref.listen<LoginState>(loginControllerProvider, ((previous, state) {
      if(state is MsgPush ){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.msg),));
      }
    }));
    return  Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      const Image(image: AssetImage('assets/images/Logo_H.png'), width:124, height: 33,),
                      SizedBox(height: 24,),
                      const Text(
                        'Buat Akun',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Start your journey to find your sole mate!',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 32,)
                    ],
                  ),
                ),
                
                
                Container(
                  child: Form(
                    key: _formKey,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Nama',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(color: Color.fromARGB(255, 255, 10, 10)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  prefixIcon: Icon(Icons.perm_identity_rounded),
                                  fillColor: Colors.white,
                                  filled: true, 
                                  hintText: 'Masukkan Nama Anda',
                                ),
                                validator: (value) {
                                  if (value ==null || value.isEmpty) {
                                     return 'Please enter your name';
                                  }
                                  return null;
                                }, 
                              ),
                              SizedBox(height: 10,),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Email',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(color: Color.fromARGB(255, 255, 10, 10)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  
                                  contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true, 
                                  hintText: 'Masukkan alamat Email Anda',
                                ),
                                validator: (value) {
                                  if (value ==null || value.isEmpty) {
                                     return 'Please enter your email';
                                  }
                                  return null;
                                }, 
                              ),
                              SizedBox(height: 10,),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Password',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(color: Color.fromARGB(255, 255, 10, 10)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                obscureText: _obscureText,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value ==null || value.isEmpty) {
                                     return 'Please enter your password';
                                  }
                                  return null;
                                }, 
                              ),
                              SizedBox(height: 20,),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  alignment: Alignment.center,
                                  backgroundColor: Color.fromRGBO(101, 99, 255, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                  ),
                                  fixedSize: Size(400,37)
                                ),
                                onPressed: (){
                                  ref.read(loginControllerProvider.notifier).signup(
                                    _emailController.text, 
                                    _passwordController.text, 
                                    _nameController.text);
                                },
                                child: Text(
                                  "Mulai Bergabung",
                                  style: TextStyle(fontSize: 16),
                                  )
                              ),
                              SizedBox(height: 10,),
                              ElevatedButton.icon(
                                icon: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  alignment: Alignment.center,
                                  backgroundColor: Colors.white,
                                  foregroundColor: Color.fromRGBO(101, 99, 255, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: BorderSide(color: Color.fromRGBO(101, 99, 255, 1.0))
                                  ),
                                  fixedSize: Size(400,37),
                                ),
                                onPressed: (){
                                },
                                label: Text(
                                  "Gabung Dengan Google",
                                  style: TextStyle(
                                    color: Color.fromRGBO(101, 99, 255, 1.0),
                                    fontSize: 16),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah mempunyai akun? ',
                        style: TextStyle(
                          color: Color.fromRGBO(108, 117, 125, 1.0),
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft
                        ),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Color.fromRGBO(101, 99, 255, 1.0),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    
   }
}