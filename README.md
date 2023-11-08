# 🌾👨‍🌾 HarvestHaven 🚜🌽

Nama    : Fariska Fedira Ardhanariswari

NPM     : 2206815705

Kelas   : PBP A


## Tugas 7

### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
* *Stateless*
    * *Stateless widget* adalah *widget* statis yang berarti *widget* yang tidak dapat berubah.
    * *Stateless widget* tidak memiliki *internal state* yang dapat berubah setelah widget dibuat. *Internal state* adalah tempat *widget* menyimpan informasi yang diperlukan untuk berinteraksi dengan pengguna atau merespons perubahan data.        * Contoh penggunaan: teks, ikon, dan gambar statis.
* *Stateful*
    * *Stateful widget* adalah *widget* dinamis yang dapat berubah.
    * *Stateful widget* dapat mengubah tampilannya sesuai respons dari events yang dipicu interaksi user/perubahan data.
    * Contoh penggunaan: formulir input, daftar yang dapat di-*scroll*, dan layar dengan banyak elemen interaktif.

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
* MyHomePage: Widget utama yang mewarisi dari StatelessWidget, digunakan untuk membuat tampilan halaman utama aplikasi.
* Scaffold: `Scaffold` adalah widget yang digunakan untuk membuat kerangka dasar halaman.
* AppBar: `AppBar` adalah widget yang digunakan untuk menampilkan bagian atas halaman dalam aplikasi.
* SingleChildScrollView: Widget yang memungkinkan konten menjadi scrollable. 
* Padding: Digunakan untuk memberikan jarak dari tepi layar. 
* Column: `Column` adalah widget yang digunakan untuk menampilkan widget dalam tata letak vertikal.
* GridView.count: Widget yang digunakan untuk membuat tampilan grid dengan jumlah kolom yang telah ditentukan. 
* ShopCard: Widget yang digunakan untuk membuat tombol dengan ikon dan teks.
* Material: Widget yang digunakan untuk mengatur tampilan material design dalam aplikasi Flutter. 
* InkWell: Membuat area responsif terhadap sentuhan pengguna. Ketika tombol ditekan, respons ditentukan di dalam `onTap`.
* Icon: `Icon` digunakan untuk menampilkan ikon di dalam tombol.
* Text: `Text` adalah widget yang digunakan untuk menampilkan teks di dalam tombol.
* SnackBar: `SnackBar` adalah widget yang digunakan untuk menampilkan pesan sementara kepada pengguna.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step.

#### Generate proyek
* Masuk ke dalam direktori tempat menyimpan proyek flutter.
* Membuat proyek Flutter baru dengan nama **harvest_haven**, dan masuk ke dalam direktori proyek tersebut.
    ```dart
    flutter create harvest_haven
    cd harvest_haven
    ```

#### Merapikan struktur proyek
* Pada direktori `harvest_haven/lib`, buat file baru bernama `menu.dart`.
* Tambahkan kode dibawah ini.
    ```dart
    import 'package:flutter/material.dart';
    ```
* Pindahkan `class MyHomePage ...` dari `main.dart' ke *file* 'menu.dart' dan hapus `class _MyHomePageState ...`
* Impor class `menu.dart` agar dapat diakses dari `main.dart.
    ```dart
    import 'package:harvest_haven/menu.dart';
    ```

#### Membuat widget pada flutter
* Ubah sifat *widget* halaman menu menjadi *stateless*.
    * Pada *file* `main.dart`, ubah `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`.
    * Ubah bagian `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);`, hapus bagian `final String title;`, dan tambahkan Widget build.
    ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            );
        }
    }
    ```
* Menambahkan teks dan *card*.
    * Definisikan tipe list item
        ```dart
        class ShopItem {
            final String name;
            final IconData icon;

            ShopItem(this.name, this.icon);
        }
        ```
    * Pada `class MyHomePage`, di bawah kode `MyHomePage({Key? key}) : super(key: key);`, tambahkan barang-barang yang mau dijual (nama, harga, dan icon barang).
        ```dart
        final List<ShopItem> items = [
            ShopItem("Lihat Produk", Icons.checklist),
            ShopItem("Tambah Produk", Icons.add_shopping_cart),
            ShopItem("Logout", Icons.logout),
        ];
        ```
    * Tambahkan kode dibawah ini ke dalam `Widget build` untuk mengatur tampilannya.
        ```dart
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                    'HarvestHaven',
                    style: TextStyle(
                        color: Colors.white, // Set the text color to white
                    ),
                ),
                backgroundColor: Colors.indigo,
            ),
            body: SingleChildScrollView(
                // Widget wrapper yang dapat discroll
                child: Padding(
                    padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                    child: Column(
                        // Widget untuk menampilkan children secara vertikal
                        children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                                child: Text(
                                    'PBP Shop', // Text yang menandakan toko
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ),
                            // Grid layout
                            GridView.count(
                                // Container pada card kita.
                                primary: true,
                                padding: const EdgeInsets.all(20),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                children: items.map((ShopItem item) {
                                    // Iterasi untuk setiap item
                                    return ShopCard(item);
                                }).toList(),
                            ),
                        ],
                    ),
                ),
            ),
        );
        ```
    * Buat *widget stateless* baru untuk menampilkan *card*. Tambahkan juga bagian buttonColor untuk menentukan warna untuk setiap button serta kode untuk membuat snackbar.
        ```dart
        class ShopCard extends StatelessWidget {
            final ShopItem item;

            const ShopCard(this.item, {super.key}); // Constructor

            @override
            Widget build(BuildContext context) {
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
                            onTap: () {
                            // Memunculkan SnackBar ketika diklik
                            ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                    content: Text("Kamu telah menekan tombol ${item.name}!")));
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
        ```
* Jalankan proyek melalui Terminal.
    ```dart
    flutter run
    ```