import 'package:flutter/material.dart';
import 'package:flutter_application_2/base_page.dart';
import 'package:go_router/go_router.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "ماشین حساب",
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => print('C Pressed'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: EdgeInsets.all(10),
                          ),
                          child: Text('C', style: TextStyle(fontSize: 26)),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: OutlinedButton(
                          onPressed: () => print('7 Pressed'),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.green, width: 2),
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            '7',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => print('4 Tapped'),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '4',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => print('1 Pressed'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: EdgeInsets.all(10),
                          ),
                          child: Text('1', style: TextStyle(fontSize: 26)),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: Text(
                          "+/-",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => print('( ) Pressed'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: EdgeInsets.all(10),
                          ),
                          child: Text('()', style: TextStyle(fontSize: 26)),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: OutlinedButton(
                          onPressed: () => print('8 Pressed'),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.green, width: 2),
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            '8',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => print('5 Tapped'),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '5',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => print('2 Pressed'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: EdgeInsets.all(10),
                          ),
                          child: Text('2', style: TextStyle(fontSize: 26)),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: Text(
                          "0",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => print('% Pressed'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: EdgeInsets.all(10),
                          ),
                          child: Text('%', style: TextStyle(fontSize: 26)),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: OutlinedButton(
                          onPressed: () => print('9 Pressed'),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.green, width: 2),
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            '9',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => print('6 Tapped'),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '6',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => print('3 Pressed'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: EdgeInsets.all(10),
                          ),
                          child: Text('3', style: TextStyle(fontSize: 26)),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: Text(
                          ".",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => print('* Pressed'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: EdgeInsets.all(10),
                          ),
                          child: Text('*', style: TextStyle(fontSize: 26)),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(65, 190, 202, 255),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => print('+ Pressed'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: EdgeInsets.all(10),
                          ),
                          child: Text('+', style: TextStyle(fontSize: 26)),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 65,
                      height: 130,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(65, 190, 202, 255),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => print('= Pressed'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: EdgeInsets.all(10),
                          ),
                          child: Text('=', style: TextStyle(fontSize: 26)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
