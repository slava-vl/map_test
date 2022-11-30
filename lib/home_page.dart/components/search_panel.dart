import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5)],
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.only(bottom: 4, left: 16, right: 16, top: 4),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.black.withOpacity(0.3),
              ),
              const SizedBox(width: 8),
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
