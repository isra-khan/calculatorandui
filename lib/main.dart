import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: SimpleCalcNoGrid()));
}

class SimpleCalcNoGrid extends StatefulWidget {
  const SimpleCalcNoGrid({super.key});
  @override
  State<SimpleCalcNoGrid> createState() => _SimpleCalcNoGridState();
}

class _SimpleCalcNoGridState extends State<SimpleCalcNoGrid> {
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
      // Step 1: Handle percentages by converting them to decimals
      s = s.replaceAllMapped(RegExp(r'(\d+)%'), (match) {
        double value = double.parse(match.group(1)!);
        return (value / 100).toString();
      });

      // Step 2: Evaluate parentheses by recursively evaluating inner expressions
      while (s.contains('(')) {
        s = s.replaceAllMapped(RegExp(r'\(([^()]+)\)'), (match) {
          String innerExpr = match.group(1)!;
          return _compute(innerExpr); // Recursively compute inner expressions
        });
      }

      // Step 3: Evaluate the expression without parentheses
      double total = 0;
      String current = "";
      String op = "+"; // Current operator (+ or -)

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
    double val = 0;
    String current = "";
    String op = "*"; // Start with multiplication

    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (c == "*" || c == "/") {
        double part = double.parse(current);
        if (op == "*") {
          val *= part;
        } else {
          val /= part;
        }
        op = c;
        current = "";
      } else {
        current += c;
      }
    }
    if (current.isNotEmpty) {
      double part = double.parse(current);
      if (op == "*") {
        val *= part;
      } else {
        val /= part;
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
      appBar: AppBar(title: const Text("Simple Calc (No Grid)")),
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
          buttonRow('C', '+', '-', '%'), // blank in last slot
          buttonRow('7', '8', '9', '×'),
          buttonRow('4', '5', '6', '/'),
          buttonRow('1', '2', '3', '('),
          buttonRow('0', '.', '=', ')'),
        ],
      ),
    );
  }
}
