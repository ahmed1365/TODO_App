import 'package:ahmed/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
            'Mahran Form',
                style: TextStyle(backgroundColor: Colors.teal ),
        ),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(
                      'Login',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                 SizedBox(
                   height: 40.0,
                 ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value){
                      print(value);
                    },
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return   'email address must not be empty';
                      } else
                      {
                        return null;
                    }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: passwordController ,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isPassword,
                    onFieldSubmitted: (String value){
                      print(value);
                    },
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    validator: (value)
                    {
                      if(value!.isEmpty)
                        {
                          return 'password must not be empty';
                        }else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: ' Password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon:IconButton(
                        icon: Icon(
                         isPassword ?  Icons.visibility : Icons.visibility_off,

                        ), onPressed: ()
                      {
                          setState(() {
                          isPassword = !isPassword;
                          });
                      },
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  defaultButtons(
                    text:'login' ,
                    function: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                           print(emailController.text);
                           print(passwordController.text);
                        }
                      },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButtons(
                    text:'RegIStEr' ,
                    function: ()
                    {
                      print(emailController.text);
                      print(passwordController.text);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                            color:Colors.teal),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
