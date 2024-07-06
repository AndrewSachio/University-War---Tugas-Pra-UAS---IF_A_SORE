import 'package:flutter/material.dart';
import 'package:kopicow_application/components/Category_Provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textCategory = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Category',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: textCategory.Category.length,
        itemBuilder: (context, index) {
          var category = textCategory.Category[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 160, 131, 106),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                      title: Text(
                        category.nameCate,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        category.description,
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: const Text(
                        '100 unit',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text('Show List Assets'),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
