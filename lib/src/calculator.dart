import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late TextEditingController _nameController;
  double height = 1;
  int age = 30;
  int masse = 50;

  late TextEditingController _surnameController;
  late TextEditingController _emailController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _surnameController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Form(
    //       autovalidateMode: AutovalidateMode.always,
    //       key: _formKey,
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Stack(
    //               children: [
    //                 Container(
    //                   height: 100,
    //                   width: 100,
    //                   decoration: BoxDecoration(
    //                     shape: BoxShape.circle,
    //                     color: Colors.red,
    //                     border: Border.all(
    //                       width: 3,
    //                       color: Colors.black,
    //                     ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   right: 0,
    //                   top: 0,
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                       shape: BoxShape.circle,
    //                       color: Colors.green,
    //                       border: Border.all(
    //                         width: 3,
    //                         color: Colors.black,
    //                       ),
    //                     ),
    //                     child: Icon(Icons.camera_alt),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: TextFormField(
    //               controller: _nameController,
    //               decoration: InputDecoration(
    //                 label: Text("Name"),
    //               ),
    //               validator: (value) {
    //                 if (value == null || (value.isEmpty == true)) {
    //                   return "Name is required";
    //                 }
    //                 return null;
    //               },
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: TextFormField(
    //               controller: _surnameController,
    //               decoration: InputDecoration(
    //                 label: Text("Surname"),
    //               ),
    //               validator: (value) {
    //                 if (value == null || (value.isEmpty == true)) {
    //                   return "Surname is required";
    //                 }
    //                 return null;
    //               },
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: TextFormField(
    //               controller: _emailController,
    //               keyboardType: TextInputType.emailAddress,
    //               decoration: InputDecoration(
    //                 label: Text("Email"),
    //               ),
    //               validator: (value) {
    //                 if (value == null || (value.isEmpty == true)) {
    //                   return "Email is required";
    //                 }
    //                 if (!value.contains("@")) {
    //                   return "Invalid email";
    //                 }
    //                 return null;
    //               },
    //             ),
    //           ),
    //           OutlinedButton(
    //             onPressed: () {
    //               if (_formKey.currentState!.validate()) {
    //                 String name = _nameController.text;
    //                 String surname = _surnameController.text;
    //                 print(name);
    //                 print(surname);
    //               } else {
    //                 print("Form invalid");
    //               }
    //             },
    //             child: Text("Submit"),
    //           )
    //         ],
    //       )),
    // );
    Color prim = Colors.black;
    return Scaffold(
      backgroundColor: prim,
      floatingActionButton: Container(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Container(
                            color: prim.withOpacity(.8),
                            height: MediaQuery.of(context).size.width * .45,
                            child: Center(
                              child: Icon(
                                Icons.male,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Container(
                            color: prim.withOpacity(.8),
                            height: MediaQuery.of(context).size.width * .45,
                            child: Center(
                              child: Icon(
                                Icons.female,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    child: Container(
                      color: prim.withOpacity(.8),
                      height: MediaQuery.of(context).size.width * .40,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Height",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "$height",
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SliderTheme(
                              data: SliderThemeData(trackHeight: 10),
                              child: Slider(
                                min: 1,
                                max: 250,
                                value: height,
                                onChanged: (value) {
                                  setState(() {
                                    height = value.ceilToDouble();
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Container(
                            color: prim.withOpacity(.8),
                            height: MediaQuery.of(context).size.width * .45,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Masse",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "$masse",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () => setState(() {
                                          masse > 0 ? masse-- : null;
                                        }),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: prim,
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => setState(() {
                                          masse++;
                                        }),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: prim,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Container(
                            color: prim.withOpacity(.8),
                            height: MediaQuery.of(context).size.width * .45,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Age",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "$age",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () => setState(() {
                                          age > 0 ? age-- : null;
                                        }),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: prim,
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => setState(() {
                                          age++;
                                        }),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: prim,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                var result = await showDialog(
                  context: context,
                  barrierDismissible: false,
                  useSafeArea: true,
                  builder: (context) => AlertDialog(
                    title: Text("Votre BMI"),
                    content: Container(
                        child: Text("Vous etes obese, votre BMi est de 250")),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Close")),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: Text("Ok")),
                    ],
                  ),
                );
                print(result);
              },
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: prim.withOpacity(.8),
                  child: Center(
                    child: Text(
                      "Calculer".toUpperCase(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
