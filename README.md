
# **Mauistore Mobile**

---

# 📋 **Pertanyaan Tugas 1**

## 🛠 **Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.**
Stateless widget adalah widget yang konstan. Widget-widget yang akan di build pada kelas yang meng-inherit ini tidak bisa diubah state nya (rebuild) secara instan. Berbeda dengan Stateful widget yang merupakan widget khusus untuk menghandle permintaan rebuild instan. Karena pada kelas ini ada method `setState` yang berguna untuk me-reload jika ditrigger. Kedua jenis widget ini, pada method buildnya, mempunyai parameter `context` yang akan berguna untuk beberapa widget dan method lainnya

---

## 🛠 **Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya**

1. **MaterialApp**
  Widget ini berfungsi untuk set home aplikasi saat launch, routing, tema.
2. **MyApp dan MyHomePage**
  Widget buatan yang mengimplementasi Stateless Widget, MyApp sebagai pemegang MaterialApp, dan MyHomePage untuk menampilkan page home
3. **Scaffold**
  Widget yang berfungsi sebagai skeleton dari (biasanya) suatu page. Terdiri dari appbar, home, floating button, drawer, dll.
4. **AppBar**
  Widget appbar, memiliki parameter `action` sebagai list dari widget-widget yang ingin ditampilkan
5. **SafeArea**
  Widget untuk pad area agar terhindar dari ketutupan kamera misalnya.
6. **Column**
  Widget untuk menampilkan widget-widget lain yang tersusun menjadi suatu kolom
7. **SnackBarButton**
  Widget buatan yang menginherit stateless widget, untuk menampilkan button custom yang akan menampilkan snackbar jika ditekan
8. **Container**
  Widget yang mempunyai beberapa properti untuk mengatur childnya seperti padding, margin, alignment, ukuran, dll.
9. **ElevatedButton**
  Widget button yang memiliki parameter required onPressed dan child. Untuk membuat button dengan handler function.
10. **ScaffoldMessenger**
  Widget API yang berguna untuk menampilkan snackbar
11. **SnackBar**
  Widget body snackbar berisi teks
12. **Text**
  Widget berisi String untuk menampilkan teks

---

## 🛠 **Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**
`setState()` berfungsi untuk merebuild tampilan widget berdasarkan variable (sebut saja variabel x) yang diubah dalam blok fungsi ini tanpa me rebuild secara manual. Jadi bagi widget-widget yang pada properti ataupun parameternya yang bergantung pada x, begitu variabel ini diubah pada blok fungsi ini, maka widget ini akan di rebuild sesuai nilai variabel yang dibuah tersebut. 

Secara singkat, variabel yang akan dikalibrasi ulang widget dependent nya hanya variable yang terdapat pada blok setState ini saat di trigger.

---

## **Jelaskan perbedaan antara const dengan final.**
`const` adalah modifier variable yang berguna untuk menandakan variable ini konstan atau tidak bisa diubah, *termasuk atribut-atribut didalamnya*. Jadi jika variabel ini adalah suatu Object yang memiliki setter ataupun method yang dapat merubah sesuatu pada propertinya, maka tidak dapat dilakukan dan akan mengakibatkan error. 

Sedangkan `final` adalah modifier variable yang berguna untuk menandakan variable ini tidak bisa di declare ulang dengan objek lain. Maka kode seperti ini akan mengakibatkan error.
```
final Hewan a = Hewan()
a = Hewan()
```
Alasannya adalah a ini akan di declare ulang dengan objek lain. Jadi perbedaan `final` dan `const` adalah untuk variabel `final` atributnya masih mungkin untuk diubah, namun tidak untuk `const`. 

---

## 🛠 **Implementasi Checklist (Step-by-Step)**

1. **Membuat projek baru lewat Android Studio dan menginisiasi github**  
   Untuk membuat projek Flutter, saya membuatnya di Android Studio dengan menu New Flutter Project. Saya menamainya `mauistore_mobile`. Lalu, saya menginisiasi direktori github untuk di push.

2. **Membuat button**  
   Untuk membuat button saya memakai Elevated Button. Untuk tulisannya bisa diatur pada parameter child nya dengan Widget Text('suatu text'). Sedangkan untuk warna bisa diatur lewat parameter style dengan WidgetStatePropertyAll<Color>(color). Lalu karena diminta untuk menunjukkan snackbar sesuai text nya, maka kita set parameter onPressed-nya juga dengan memanggil

   ```
   () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol $text!")));
     }
   ```
   dimana, ini adalah void function karena berbentuk `(){}` dan tidak return sesuatu.

3. **Membuat custom class untuk button**   
   Karena button-button yang ingin diimplementasi pada tugas kali ini memiliki pola, yaitu teks dan warna, maka lebih baik kita menggunakan class yang memiliki parameter yang dapat diubah-ubah. Kita memiliki 2 opsi, memakai method yang return suatu widget, atau langsung menggunakan Stateless Widget. Disini akan lebih bagus jika kita menggunakan Stateless Widget karena kita akan menampilkan Snackbar dimana message yang akan ditampilkan ini memerlukan `context`. Pada method build Stateless widget kita sudah di provide `context` tiadk seperti method. 

   Saya membuat custom class bernama `SnackBarButton` yang constructornya menerima String text dan Color color, agar bisa disesuaikan. Lalu saya cukup memanggil constructor ini pada home. Untuk penataan di home nya sendiri saya memasukkan button-button ini pada suatu Column, agar tertata secara vertikal

---

# 📋 **Pertanyaan Tugas 2**

## 🛠 **Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?**
   Kegunaan const adalah untuk keperluan kecepatan. Keuntungannya jika kita memakai modifier ini, maka variabel akan di dekalarasikan compile-time, jadi lebih cepat. Program tidak perlu mengecek nilai dan state nya saat running. Sebaiknya kita menggunakan modifier ini saat kita tahu objek ini tidak akan berubah selama program berjalan. Kita juga harus memastikan variabel-variabel lainnya yang menjadi atribut objek ini konstan. Sebaliknya jika ada objek yang atributnya masih mutable, maka akan terjadi compile error. Biasanya VSCode akan memberi warning

## 🛠 **Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!**
   Column adalah widget container untuk display item itemnya secara memanjang vertikal, sementara Row adalah widget container untuk display item itemnya secara memanjang horizontal. Contoh implementasi:


  Penataan teks secara vertikal kebawah
   ```
   Row(
    children: [
      Text('Teks 1'),
      Text('Teks 2'),
      Text('Teks 3'),
    ]
   );
   ```


  Penataan teks secara horizontal menyamping ke kanan
   ```
   Column(
    children: [
      Text('Teks 1'),
      Text('Teks 2'),
      Text('Teks 3'),
    ]
   );
   ```


## 🛠 **Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!**
   - Checkbox:    
     Karena pada form produk saya tidak ada konsepnya pilihan, isian semua
   - Radio:
     Karena pada form produk saya tidak ada konsepnya pilihan, isian semua
   - Switch :
     Karena pada form produk saya tidak ada konsepnya toggle, isian semua


## 🛠 **Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?**
   Saya mengatur tema lewat parameter theme pada MaterialApp di main.dart. Disitu saya me-set ThemeData dengan ColorScheme, appBarTheme, dan beberapa theme dari beberapa widget lainnya. Saya menggunakan warna teal sebagai warna primer. Karena tema ini saya tidak perlu set manual warna-warna pada widget-widget yang akan saya implementasikan.


## 🛠 **Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?**
1. **Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru**  
   Sebelum membuat filenya, saya terlebih dahulu mengorganisir folder. Saya membuat folder screen dan widgets. Lalu untuk membuat form, saya menggunakan widget Form dan di provide form key nya dan dilengkapi beberapa TextField yang juga ada keynya. Lalu fieldnya didekorasi oleh hint teks dan label masing-masing dengan name, deskrisi, harga dan jumlah. Untuk handling masing masing ada function yang menerima parameter string dan akan mengubah variabel yang corresponding dengan labelnya (di dalam setstate agar responsif). Agar aman, saya menambahkan validasi sesuai keperluan data type nya. Terakhir implementasi tombol save, yang akan membaca variabel-variabel yang diubah pada form dan di display lewat showDialog.
2. **Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.**  
   Saya mengimplementasi logic ini pada custom class button sebelumnya, dimana ada kondisional berdasarakan argumen text yang di pass, lalu di handle menggunakan 


   ```
   Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ScreenTujuan(),
    ));
   ```


3. **Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.**  
   Lalu dari variabel-variabel yang sudah divalidasi dari form, tombol submit akan memunculkan dialog. Saya mengimplementasi ini dengan me set parameter berikut ini pada tombol:

   ```
   onPressed: () {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Mood berhasil tersimpan'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: $_name'),
                  Text('Deskripsi: $_desc'),
                  Text('Harga: $_price'),
                  Text('Amount: $_amount'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  _formKey.currentState!.reset();
                },
              ),
            ],
          );
        },
      );
    }
  },
   ```

   
4. **Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:**  
   Drawer saya buat dengan builder StatelessWidget yang akan return sebuah drawer beirisi ListTile yang berfungsi untuk tombol navigasi. ListTile ini diberi handler function pada parameter nya untuk routing:

   ```
   ListTile(
      leading: const Icon(Icons.home_outlined),
      title: const Text('Halaman Utama'),
      // Bagian redirection ke MyHomePage
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ));
      },
    ),
   ```
