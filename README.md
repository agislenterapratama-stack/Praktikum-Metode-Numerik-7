# Praktikum-Metode-Numerik-7
# Sistem Persamaan Non-Linear (Metode Numerik)

Repositori ini berisi implementasi algoritma komputasi numerik menggunakan **GNU Octave / MATLAB** untuk mencari akar dari Sistem Persamaan Non-Linear. Proyek ini disusun untuk memenuhi tugas mata kuliah **Metode Numerik**.

**Oleh:**  
**Agis Lentera Pratama**  
NIM: L0325016  
Program Studi Informatika  
Universitas Sebelas Maret, Surakarta  

---

## 📝 Deskripsi Proyek

Pencarian akar persamaan non-linear dalam repositori ini dilakukan melalui tiga pendekatan metode numerik:
1. **Metode Grafik (Tunggal & Ganda):** Digunakan sebagai pendekatan heuristik awal (pra-kalkulasi) untuk mengobservasi dan melokalisasi rentang keberadaan akar secara visual sebelum komputasi iteratif dilakukan.
2. **Metode Biseksi (Bisection Method):** Algoritma pengurungan akar tertutup yang bekerja dengan membelah rentang interval secara simetris. Memiliki konvergensi linear yang lambat namun sangat stabil dan pasti menemukan akar.
3. **Metode Regula-Falsi (False Position Method):** Algoritma interpolasi linier yang menggunakan pendekatan kemiringan garis (secant line) untuk memprediksi letak akar. Secara umum memiliki konvergensi yang jauh lebih cepat dibandingkan biseksi pada kurva yang minim titik belok.

## 🧮 Persamaan yang Diselesaikan

Kode dalam repositori ini secara otomatis akan menyelesaikan tiga bentuk persamaan non-linear berikut dengan batas toleransi galat sebesar `0.0001` dan batas maksimal `20` iterasi:

1. **Persamaan Polinomial:**  
   $f(x) = 3x^3 - 5x^2 + 4x - 8 = 0$
2. **Persamaan Transendental Eksponensial:**  
   $f(x) = e^x - x^2 = 0$
3. **Persamaan Komposit (Logaritma & Linier):**  
   $f(x) = \log_{10}(x+2) + 2x - 3 = 0$

## 🚀 Persyaratan Sistem

Untuk menjalankan *source code* ini, Anda membutuhkan:
* **GNU Octave** (Versi 5.0 atau lebih baru disarankan) 
* Atau **MATLAB** (R2018a atau lebih baru)

## 🛠️ Cara Penggunaan

1. *Clone* repositori ini ke komputer lokal Anda:
   ```bash
   git clone [https://github.com/agislenterapratama-stack/nama-repo-anda.git](https://github.com/agislenterapratama-stack/nama-repo-anda.git)
