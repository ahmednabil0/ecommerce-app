import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/helper/helpers/text.dart';
import 'package:ecommerce/views/home_view/details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchVeiw extends StatefulWidget {
  const SearchVeiw({Key? key}) : super(key: key);

  @override
  _SearchVeiwState createState() => _SearchVeiwState();
}

class _SearchVeiwState extends State<SearchVeiw> {
  var inputText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Search here ...',
                      suffixIcon: const Icon(Icons.search_rounded),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: primaryColor, width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: primaryColor, width: 1.2))),
                  onChanged: (val) {
                    setState(() {
                      inputText = val;
                    });
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("products")
                            .where("name", isGreaterThanOrEqualTo: inputText)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("Something went wrong"),
                            );
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: Text("Loading"),
                            );
                          }

                          return ListView(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;
                              return Card(
                                margin: const EdgeInsets.all(2),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => DetailsScrean(
                                        image: data['image'],
                                        image2: data['image2'],
                                        image3: data['image3'],
                                        image4: data['image4'],
                                        image5: data['image5'],
                                        price: double.parse(data['price']),
                                        name: data['name'],
                                        brand: data['brand'],
                                        details: data['details'],
                                        color: data['color'],
                                        sell: data['mostsell']));
                                  },
                                  child: ListTile(
                                      title: Text(
                                        data['name'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      leading: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Image.network(data['image'],
                                            fit: BoxFit.contain),
                                      ),
                                      subtitle:
                                          Text(cutText5(data['details']))),
                                ),
                              );
                            }).toList(),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
