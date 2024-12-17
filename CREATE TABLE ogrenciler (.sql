CREATE TABLE ogrenciler (
    ogrenci_id INT PRIMARY KEY IDENTITY(1,1),
    ad NVARCHAR(50),
    soyad NVARCHAR(50),
    dogum_tarihi DATE
);

CREATE TABLE dersler (
    ders_id INT PRIMARY KEY IDENTITY(1,1),
    ders_adi NVARCHAR(100),
    kredi INT
);CREATE TABLE kategoriler (
    kategori_id INT PRIMARY KEY,
    kategori_adi VARCHAR(100)
);
CREATE TABLE ogrenci_kategoriler (
    ogrenci_id INT,
    kategori_id INT,
    PRIMARY KEY (ogrenci_id, kategori_id),
    FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(ogrenci_id),
    FOREIGN KEY (kategori_id) REFERENCES kategoriler(kategori_id)
);
CREATE TABLE ogretmenler (
    ogretmen_id INT PRIMARY KEY,
    ogretmen_adi VARCHAR(100),
    ogretmen_email VARCHAR(100)
);
CREATE TABLE ders_ogretmenler (
    ders_id INT,
    ogretmen_id INT,
    ogretim_yili INT,
    PRIMARY KEY (ders_id, ogretmen_id),
    FOREIGN KEY (ders_id) REFERENCES dersler(ders_id),
    FOREIGN KEY (ogretmen_id) REFERENCES ogretmenler(ogretmen_id)
);
CREATE TABLE notlar (
    not_id INT PRIMARY KEY,
    ogrenci_id INT,
    ders_id INT,
    puan CHAR(2),
    not_tarihi DATE,
    FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(ogrenci_id),
    FOREIGN KEY (ders_id) REFERENCES dersler(ders_id)
);
CREATE TABLE ders_kategoriler (
    ders_id INT,
    kategori_id INT,
    PRIMARY KEY (ders_id, kategori_id),
    FOREIGN KEY (ders_id) REFERENCES dersler(ders_id),
    FOREIGN KEY (kategori_id) REFERENCES kategoriler(kategori_id)
);