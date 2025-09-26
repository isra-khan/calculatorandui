import 'package:caluclator/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  //for runnig calculator
  //runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SimpleCalc()));
}

class SimpleCalc extends StatefulWidget {
  const SimpleCalc({super.key});

  @override
  State<SimpleCalc> createState() => _SimpleCalcState();
}

class _SimpleCalcState extends State<SimpleCalc> {
  String expr = "";
  String result = "";

  void onTap(String ch) {
    setState(() {
      if (ch == "C") {
        expr = "";
        result = "";
      } else if (ch == "=") {
        result = _compute(expr);
      } else {
        expr += ch;
      }
    });
  }

  String _compute(String s) {
    try {
      // Replace UI symbols with valid ones
      s = s.replaceAll('×', '*');
      s = s.replaceAll('÷', '/');

      // Convert percentages
      s = s.replaceAllMapped(RegExp(r'(\d+)%'), (match) {
        double value = double.parse(match.group(1)!);
        return (value / 100).toString();
      });

      // Handle parentheses recursively
      while (s.contains('(')) {
        s = s.replaceAllMapped(RegExp(r'\(([^()]+)\)'), (match) {
          String innerExpr = match.group(1)!;
          return _compute(innerExpr);
        });
      }

      // Now handle + and -
      double total = 0;
      String current = "";
      String op = "+"; // current operator

      for (int i = 0; i < s.length; i++) {
        String c = s[i];
        if (c == "+" || c == "-") {
          double part = _evalMulDiv(current);
          if (op == "+") {
            total += part;
          } else {
            total -= part;
          }
          op = c;
          current = "";
        } else {
          current += c;
        }
      }

      if (current.isNotEmpty) {
        double part = _evalMulDiv(current);
        if (op == "+") {
          total += part;
        } else {
          total -= part;
        }
      }

      String sres = total.toString();
      if (sres.endsWith(".0")) {
        sres = sres.substring(0, sres.length - 2);
      }
      return sres;
    } catch (e) {
      return "Error";
    }
  }

  double _evalMulDiv(String s) {
    // Handle multiplication and division
    List<String> tokens = [];
    String current = "";

    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (c == "*" || c == "/") {
        tokens.add(current);
        tokens.add(c);
        current = "";
      } else {
        current += c;
      }
    }
    tokens.add(current);

    double val = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double nextVal = double.parse(tokens[i + 1]);

      if (op == "*") {
        val *= nextVal;
      } else if (op == "/") {
        val /= nextVal;
      }
    }

    return val;
  }

  Widget buttonRow(String a, String b, String c, String d) {
    return Row(
      children: [a, b, c, d].map((t) {
        if (t.isEmpty) {
          return Expanded(child: Container());
        }
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () => onTap(t),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              child: Text(t, style: const TextStyle(fontSize: 24)),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(expr, style: const TextStyle(fontSize: 28)),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              result,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          buttonRow('C', '+', '-', '%'),
          buttonRow('7', '8', '9', '×'),
          buttonRow('4', '5', '6', '/'),
          buttonRow('1', '2', '3', '('),
          buttonRow('0', '.', '=', ')'),
        ],
      ),
    );
  }
}
