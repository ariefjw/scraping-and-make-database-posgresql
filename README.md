# Scraping Data Produk IKEA

## Deskripsi
Notebook ini berfungsi untuk melakukan scraping data produk dari situs web IKEA Indonesia menggunakan Selenium dan BeautifulSoup. Data yang diambil mencakup nama produk, harga, kategori, keterangan, gambar produk, dan link produk. Data yang diperoleh kemudian diproses dan disimpan dalam format CSV untuk keperluan analisis lebih lanjut atau penyimpanan dalam database.

## Struktur Notebook
1. **Import Library**: Memuat semua library yang diperlukan untuk scraping dan pengolahan data.
2. **Fungsi Pembersihan Data**: Mendefinisikan fungsi untuk membersihkan teks dan mengubah format data.
3. **Pengambilan Data**: Mengambil data dari beberapa halaman produk di situs IKEA dengan menggunakan Selenium untuk mengontrol browser.
4. **Pengecekan Data**: Memeriksa jumlah data yang berhasil diambil.
5. **Transformasi Data**: Mengubah format data untuk memudahkan analisis, termasuk mengubah tipe data dan mendestructure kolom keterangan.
6. **Penyimpanan Data**: Menyimpan data yang telah diproses ke dalam file CSV.

## Cara Menggunakan
1. Pastikan Anda memiliki Python dan semua library yang diperlukan terinstal. Anda dapat menginstalnya menggunakan pip:
   ```bash
   pip install selenium beautifulsoup4 pandas
   ```
2. Unduh dan pasang driver untuk browser yang Anda gunakan (misalnya, ChromeDriver untuk Google Chrome).
3. Jalankan notebook ini di lingkungan Jupyter Notebook atau JupyterLab.
4. Setelah menjalankan semua sel, file `product_ikea.csv` akan dihasilkan di direktori kerja Anda.

## Catatan
- Pastikan untuk mematuhi kebijakan scraping situs web IKEA dan tidak melakukan scraping secara berlebihan.
- Data yang diambil dapat berubah seiring waktu, tergantung pada pembaruan yang dilakukan oleh situs web IKEA.

