import 'package:find_me/Auth/verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  late TextEditingController _emailcntrl ;
  String _email="";

  @override
  void initState() {
    _emailcntrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFDF1E1),
      appBar: AppBar(
        backgroundColor: const Color((0xFFFDF1E1)),
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
        icon: const Icon(CupertinoIcons.back, color: Color((0xFF965D1A)),)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset("assets/images/findMeFleche.PNG"),
                const SizedBox(height: 10),
                const Text('Forgot Password',style: TextStyle(fontSize: 26,fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Color(0xFFDF9A4F)),),
                const SizedBox(height: 10,),
                const Text("Please Enter Your Email and we will send a verification code to return your account",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Poppins',fontSize: 13,fontWeight: FontWeight.w600),),
                const SizedBox(height: 10),
                Opacity(opacity: 0.9,child: Image.asset("assets/images/forgot_pwd.png",width: 200,)),
                const SizedBox(height: 30),
                
            
                TextField(
                  controller: _emailcntrl,
                  cursorColor: const Color(0xFFDF9A4F),
                  style: const TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(                  
                    labelText: "Email",
                    hintText: "Enter your email",
                    labelStyle: const TextStyle(color: Color(0xFFDF9A4F),fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Poppins'),
                    prefixIcon: const Icon(CupertinoIcons.mail,size: 25,color: Color.fromARGB(255, 97, 84, 72)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFDF9A4F),width: 2),
                      gapPadding: 10
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFDF9A4F),width: 2),
                      gapPadding: 10
                    ),
                  ),
                ),
                
                const SizedBox(height: 40,),
                 SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        _email = _emailcntrl.text;
                        if (_email.isNotEmpty){
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => const RegisterVerification(),));}
                      });
                    },
                    style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: const Color(0xFFDF9A4F), // background color
                    ),
                   child:const Text(
                          'Continue',
                          style: TextStyle(color: Color(0xFF965D1A),fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Poppins'),
                                        ),),
                ),
                const SizedBox(height:20)
              ]
            ),
          ),
        )
      ),
    );
  }
}