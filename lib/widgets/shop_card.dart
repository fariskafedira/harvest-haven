import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:harvest_haven/screens/shoplist_form.dart';
import 'package:harvest_haven/screens/list_product.dart';
import 'package:harvest_haven/screens/login.dart';

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();

      Color buttonColor;

      if (item.name == "Lihat Item") {
      buttonColor = Colors.blueAccent;
      } else if (item.name == "Tambah Item") {
      buttonColor = Colors.blue;
      } else if (item.name == "Logout") {
      buttonColor = Colors.lightBlueAccent;
      } else {
      buttonColor = Colors.indigo;
      }

      return Material(
          color: buttonColor,
          child: InkWell(
              // Area responsive terhadap sentuhan
              onTap: () async {
                  // Memunculkan SnackBar ketika diklik
                  ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                          content: Text("Kamu telah menekan tombol ${item.name}!")));

                  // Navigate ke route yang sesuai (tergantung jenis tombol)
                  if (item.name == "Tambah Item") {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ShopFormPage()));
                  } else if (item.name == "Lihat Item") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ProductPage()));
                  } else if (item.name == "Logout") {
                    final response = await request.logout(
                        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                        "http://127.0.0.1:8000/auth/logout/");
                    String message = response["message"];
                    if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message Sampai jumpa, $uname."),
                      ));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message"),
                      ));
                    }
                  }
              },
              child: Container(
                  // Container untuk menyimpan Icon dan Text
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Icon(
                                  item.icon,
                                  color: Colors.white,
                                  size: 30.0,
                              ),
                              const Padding(padding: EdgeInsets.all(3)),
                              Text(
                                  item.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white),
                              ),
                          ],
                      ),
                  ),
              ),
          ),
      );
  }
}