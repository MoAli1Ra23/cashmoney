import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../wallate/UI/wallate_view_model.dart';

class WallateBalance extends StatelessWidget {
  const WallateBalance ({super.key});

  @override
  Widget build(BuildContext context) {
    return    
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                margin: const EdgeInsets.symmetric(horizontal: 50),
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey.shade700,
                        offset: const Offset(0, 6),
                        blurRadius: 10,
                        spreadRadius: -5,
                        blurStyle: BlurStyle.outer),
                  ],
                ),
                child: Row(
                  children: [
                    Consumer<WallateViewModel>(
                      builder: (context, pt, child) {
                        return Text(
                          "الرصيد=${pt.text}",
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        );
                      },
                    ),
                  ],
                ),
              );

  }
}