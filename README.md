# 🌾👨‍🌾 HarvestHaven 🚜🌽

Nama    : Fariska Fedira Ardhanariswari

NPM     : 2206815705

Kelas   : PBP A


<details>
<summary><b> Tugas 7 <b></summary>

### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
* *Stateless*
    * *Stateless widget* adalah *widget* statis yang berarti *widget* yang tidak dapat berubah.
    * *Stateless widget* tidak memiliki *internal state* yang dapat berubah setelah widget dibuat. *Internal state* adalah tempat *widget* menyimpan informasi yang diperlukan untuk berinteraksi dengan pengguna atau merespons perubahan data.        
    * Contoh penggunaan: teks, ikon, dan gambar statis.
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
</details>

## Tugas 8

### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
* Navigator.push()
    * Menambahkan rute baru ke *stack* rute/navigasi yang dikelola oleh `Navigator`. Method ini menambahkan rute tersebut ke bagian paling atas *stack*, sehingga rute tersebut yang ditampikan kepda pengguna. Pengguna dapat menggunakan tombol *back* untuk kembali ke rute sebelumnya.
    * Contoh:
        ```dart
        if (item.name == "Tambah Produk") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
        }
        ```
* Navigator.pushReplacement()
    * Method ini mengubah halaman dengan menggantikan rute halaman saat ini dengan halaman baru dan menghapus halaman sebelumnya dari *stack* rute.
    * Contoh:
        ```dart
        onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MyHomePage(),
            ));
        },

### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
* Drawer
    * Menyediakan menu navigasi aplikasi
    * Penggunaan: `LeftDrawer` pada `menu.dart` dan `ShopFormPage` untuk menampilkan pilihan navigasi pada bagian kiri layar.
* Form
    * Mengelola dan memfasilitasi validasi formulir.
    * Penggunaan: sebagai wadah dari *input field widget* pada berkas `shoplist_form.dart`
* GlobalKey<Formstate>
    * Mengidentifikasi dan mengakses status formulir.
    * Penggunaan: digunakan dengan widget `Form` untuk mengelola status formulir, seperti `validate()` dan `reset()`.
* TextFormField
    * Menyediakan tempat input teks
    * Penggunaan: pada `shoplist_form.dart` untuk menerima input `nama`, `jumlah`, dan `deskripsi`.
* ElevatedButton
    * Tombol yang memberikan efek naik ketika ditekan.
    * Penggunaan: sebagai tombol `save` untuk menyimpan data formulir.
* AlertDialog
    * Menampilkan dialog dengan judul dan konten tertentu.
    * Penggunaan: menampilkan informasi produk berhasil disimpan beserta ringkasan data.
* Stack
    * Menempatkan elemen-elemen diatas satu sama lain.
    * Penggunaan: Menempatkan widget secara bertumpuk diatas satu sama lain.
* Column
    * Mengatur elemen secara vertikal.
    * Penggunaan: pada `ShopFormPage` untuk menyusun *widget child* secara vertikal.

### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
* Elemen input yang digunakan pada tugas ini yaitu `TextFormField`. `TextFormField` digunakan untuk memasukkan data dalam formulir serta menyediakan opsi untuk validasi input, seperti memastikan kolom input tidak boleh kosong serta memastikan tipe data input. Selain itu terdapat juga validator yang dapat memberikan *feedback* langsung saat pengguna memasukkan data. 

### Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean architecture adalah pengembangan aplikasi agar lebih terstruktur dengan pemisahan konsep bisnis atau logika aplikasi dengan konsep yang berhubungan dengan platform seperti *UI*, *state management*, dan sumber data eksternal.
* Domain
    * Di dalam lapisan ini, terdapat kode yang menangani logika bisnis aplikasi, seperti *entities* dan *usecases*.
* Data & Platform
    * Tempat menyimpan dan mengelola data, seperti Rest API, local database, dan Firebase.
* Presentation
    * Bagian yang menangani presentasi dan interaksi dengan pengguna.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!
#### Menambahkan Form dan Elemen Input
* Buat berkas baru dengan nama `shoplist_form.dart` dan tambahkan kode berikut.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:shopping_list/widgets/left_drawer.dart';

    class ShopFormPage extends StatefulWidget {
        const ShopFormPage({super.key});

        @override
        State<ShopFormPage> createState() => _ShopFormPageState();
    }

    class _ShopFormPageState extends State<ShopFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _name = "";
        int _price = 0;
        String _description = "";

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    title: const Center(
                        child: Text(
                            'Form Tambah Produk',
                        ),
                    ),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                ),
                body: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        child: Column()
                    ),
                ),
            );
        }
    }
    ```
    * Widget `Form` sebagai wadah *input field widget*
    * Widget `SingleChildScrollView` untuk membuat *child widget* di dalamnya *scrollable*
    * Variabel `-formKey`, atribut `key` berfungsi sebagai handler dari form state, validasi, dan penyimpanan form
* Buat widget `TextFormField` yang dibungkus dengan `Padding` sebagai *child* dari `Column `dan tambahkan atribut `crossAxixAlignment` untuk mengatur *alignment children* dari `Column`. Buat untuk field `name`, `amount`, dan `description`.
    ```dart
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Nama Item",
                        labelText: "Nama Item",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                            _name = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong!";
                        }
                        return null;
                    },
                ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Jumlah",
                        labelText: "Jumlah",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                            _amount = int.parse(value!);
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return "Jumlah tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                            return "Jumlah harus berupa angka!";
                        }
                        return null;
                    },
                ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                            _description = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return "Deskripsi tidak boleh kosong!";
                        }
                        return null;
                    },
                ),
            ),
    ```
* Buat tombol `Save` yang akan memunculkan *pop-up* data yang telat di-*input*.
    ```dart
    Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigo),
                ),
                onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                },
                child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                ),
            ),
        ),
    ),
    ```

#### Memunculkan data
* Menambahkan ``showDialog()` pada bagian `onPressed()` untuk memunculkan *widget* `AlertDialog`.
    ```dart
    child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.indigo),
        ),
        onPressed: () {
            if (_formKey.currentState!.validate()) {
                showDialog(
                    context: context,
                    builder: (context) {
                        return AlertDialog(
                            title: const Text('Item berhasil tersimpan'),
                            content: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                        Text('Nama: $_name'),
                                        Text('Jumlah: $_amount'),
                                        Text('Deskripsi: $_description'),
                                    ],
                                ),
                            ),
                            actions: [
                                TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                        Navigator.pop(context);
                                    },
                                ),
                            ],
                        );
                    },
                );
                _formKey.currentState!.reset();
            }   
        },
        child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
        ),
    ),
    ```

#### Menambahkan fitur navigasi pada tombol
* Pada *widget* `ShopItem` pada berkas `menu.dart` tambahkan navigasi ke halaman `Tambah Item`.
    ```dart
    if (item.name == "Tambah Item") {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ShopFormPage()));
    }
    ```

#### Membuat sebuah drawer pada aplikasi
* Membuat berkas baru pada direktori baru `widgets` pada direktori `lib` dengan nama `left_drawer.dart`.
* Impor `menu.dart` dan `shoplist_form.dart` agar bisa menjalankan navigasi ke halaman `MyHomePage` dan `ShopFormPage.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:harvest_haven/menu.dart';
    import 'package:harvest_haven/shoplist_form.dart';
    ```
* Menambahkan kode di bawah untuk melakukan routing halaman-halaman yang diimpor serta menghias drawer pada bagian drawer header.
    ```dart
    class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                children: [
                    const DrawerHeader(
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                        ),
                        child: Column(
                            children: [
                                Text(
                                    'Shopping List',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                    ),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                    Text("Catat seluruh keperluan belanjamu di sini!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                    ),
                                ),
                            ],
                        ),
                    ),
                    ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Halaman Utama'),
                        // Bagian redirection ke MyHomePage
                        onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                )
                            );
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.add_shopping_cart),
                        title: const Text('Tambah Item'),
                        // Bagian redirection ke ShopFormPage
                        onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShopFormPage(),
                                )
                            );
                        },
                    ),
                ],
            ),
        );
    }
    ```
* Masukkan drawer menu ke halaman `menu.dart`.
    ```dart
    import 'package:shopping_list/widgets/left_drawer.dart';
    ...
    return Scaffold(
        appBar: AppBar(
            title: const Text(
                'Shopping List',
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
        ),
        // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
        drawer: const LeftDrawer(),
    ```

#### Lakukan *Refactoring File*