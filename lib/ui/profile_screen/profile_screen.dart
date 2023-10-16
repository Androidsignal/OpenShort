import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: Container(
            height: 130,
            width: 130,
            margin: const EdgeInsets.only(bottom: 40),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Icon(
                Icons.person_outline_rounded,
                size: 80,
              ),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.book_outlined),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'nils',
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                ),
                const Icon(Icons.copy)
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child:TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'senta',
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                ),
                const Icon(Icons.copy)
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.contact_page_outlined),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: '1234567890',
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                ),
                const Icon(Icons.copy)
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person_pin_circle_outlined),
                const SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: const Text(
                    'ac35bb3d8925c48c0d32eaf65a4eb112a58',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                const Icon(Icons.copy)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
