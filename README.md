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

<details>
<summary><b> Tugas 8 <b></summary>

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
</details>

## Tugas 9

### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
* Ya, pengambilan data JSON tanpa membuat model terlebih dahulu dapat dilakukan. Yaitu dengan menggunakan variabel yang menyimpan sebuah struktur data dictionary yang berisikan data.
* Tergantung pada kompleksitas data dan kebutuhan proyek. Jika datanya sederhana, dapat langsung mengambilnya tanpa model. Namun, untuk data kompleks, membuat model dapat membantu dalam pengelolaan dan pemrosesan data dengan lebih terstruktur.

### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
* `CookieRequest` dalam konteks aplikasi Flutter merupakan kelas atau objek yang bertanggung jawab untuk mengelola permintaan HTTP yang melibatkan penggunaan cookie. Instance dari `CookieRequest` perlu dibagikan ke semua komponen dalam aplikasi Flutter untuk memastikan konsistensi dan pengelolaan yang efisien terhadap cookie dalam seluruh aplikasi. Dengan berbagi instance, setiap komponen dapat mengakses dan memodifikasi data cookie yang sama tanpa perlu membuat instance baru. 

### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
* Buat model kustom yang menyesuaikan dengan data JSON dengan memanfaatkan website Quicktype.
* Menambahkan dependensi HTTP yaitu dengan menambahkan *package* `http` dan menambahkan kode `<uses-permission android:name="android.permission.INTERNET" />` pada file `android/app/src/main/AndroidManifest.xml` untuk memberi akses Internet pada aplikasi.
* Melakukan fetch data dari Django dengan menambahkan kode dibawah ini.
    ```dart
    Future<List<Product>> fetchProduct() async {
        var url = Uri.parse(
            'http://127.0.0.1:8000/json/');
        var response = await http.get(
            url,
            headers: {"Content-Type": "application/json"},
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Product
        List<Product> list_product = [];
        for (var d in data) {
            if (d != null) {
                list_product.add(Product.fromJson(d));
            }
        }
        return list_product;
    }
    ```
    * Kode tersebut mendefinisikan URL server Django yang akan di akses untuk mendapatkan data produk dalam format JSON.
    * Mengirim permintaan HTTP GET ke server dengan URL yang telah ditentukan.
    * Setelah menerima respons dari server, kode melakukan decode terhadap data JSON yang diterima.
    * Melakukan iterasi melalui data JSON yang telah didekode dan mengonversinya menjadi objek Dart dari tipe `Product`. 
* Menampilkan data pada daftar produk. Penggunaan `FutureBuilder` memberikan tampilan responsif dengan menangani proses *asynchronous* saat mengambil data. Jika data belum tersedia, ditampilkan `CircularProgressIndicator`, dan jika tidak ada data produk, muncul pesan informasi. Jika data sudah tersedia, daftar produk ditampilkan dalam `ListView.builder`, menampilkan informasi seperti nama, jumlah, dan deskripsi. 

### Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
* Pengguna memasukkan *username* dan *password* pada `loginPage` Flutter
* Aplikasi Flutter mengirim permintaan HTTP (POST) dengan kredensial ke server Django.
* Django memvalidasi kredensial pengguna dengan data yang disimpan menggunakan `user = authenticate(username=username, password=password)`.
* Dari hasil autentikasi, dilihat apakah data sesuai atau tidak. Jika berhasil, maka akan diarahkan ke laman `MyHomePage`.

### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
*  `Scaffold`: Mengatur tata letak dasar halaman, termasuk AppBar, Drawer, dan body.
* `FutureBuilder`: Mengambil data produk secara asynchronous dan membuat UI berdasarkan status hasil future, seperti menampilkan loading indicator atau data *item*.
* `ListView.builder`: Menampilkan daftar produk dalam bentuk daftar gulir, membangun daftar *item* secara dinamis sesuai dengan data yang diterima.
* `SizedBox`: Memberikan jarak vertikal antara elemen-elemen teks dalam tata letak *item*.
* `Container`: Mengelompokkan dan menyusun informasi *item* dalam tata letak yang sesuai.
* `Column`: Menyusun teks-teks *item* secara vertikal dalam tata letak.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! 

#### Setup Autentikasi pada Django untuk Flutter
* Buat `django-app` bernama `authentication` pada project Django. Jalankan `python manage.py startapp authentication`.
* Tambahkan `authentication` ke `INSTALLED_APPS` pada main project settings.py aplikasi Django.
* Jalankan perintah `pip install django-cors-headers` untuk menginstal *library* yang dibutuhkan.
* Tambahkan `corsheaders` ke `INSTALLED_APPS` pada main project `settings.py`.
* Tambahkan `corsheaders.middleware.CorsMiddleware` pada main project `settings.py`.
* Tambahkan variabel berikut pada `setting.py`.
    ```python
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
* Buat metode *view* untuk *login* pada `authentication/views.py`.
* Tambahkan URL *routing* untuk fungsi login tersebut.

#### Integrasi Sistem Autentikasi pada Flutter
* Instal package yang telah disediakan dengan menjalankan `flutter pub add provider` dan `flutter pub add pbp_django_auth` pada terminal.
* Memodifikasi `main.dart` untuk membuat objek `Provider` baru untuk membagikan *instance* `CookieRequest` dengan semua komponen aplikasi.
* Buat `login.dart` sebagai laman untuk *login* dan mengubah arahan widget pada `main.dart` dari `MyHomePage()` ke `LoginPage()`.

#### Membuat model kustom dan fetch data dari Django
* Buatlah seperti arahan pada poin pertanyaan ke-3.

#### Integrasi Form Flutter Dengan Layanan Django
* Buat sebuah fungsi view pada main/views.py aplikasi Django untuk membuat produk melalui Flutter.
    ```python
    @csrf_exempt
    def create_product_flutter(request):
        if request.method == 'POST':
            
            data = json.loads(request.body)

            new_product = Product.objects.create(
                user = request.user,
                name = data["name"],
                price = int(data["price"]),
                description = data["description"]
            )

            new_product.save()

            return JsonResponse({"status": "success"}, status=200)
        else:
            return JsonResponse({"status": "error"}, status=401)
    ```
* Tambahkan *path* untuk *routing* fungsi tersebut.
* Hubungkan halaman `shoplist_form.dart` dengan `CookieRequest` serta melengkap impor *package*.