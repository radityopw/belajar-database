-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-06-21 15:14:36.433

-- tables
-- Table: Matakuliah
CREATE TABLE Matakuliah (
    id int  NOT NULL GENERATED ALWAYS AS IDENTITY,
    kode varchar(8)  NOT NULL,
    nama varchar(20)  NOT NULL,
    sks int  NOT NULL CHECK (sks > 0),
    programStudi_id int  NOT NULL,
    CONSTRAINT Matakuliah_ak_1 UNIQUE (kode) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT Matakuliah_ak_2 UNIQUE (id, sks) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT check_matakuliah_sks CHECK (sks between 1 AND 6) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT Matakuliah_pk PRIMARY KEY (id)
);

-- Table: departemen
CREATE TABLE departemen (
    id int  NOT NULL GENERATED ALWAYS AS IDENTITY,
    kode varchar(4)  NOT NULL,
    nama varchar(20)  NOT NULL,
    fakultas_id int  NOT NULL,
    CONSTRAINT departemen_ak_1 UNIQUE (kode) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT departemen_pk PRIMARY KEY (id)
);

-- Table: dosen_pengajar
CREATE TABLE dosen_pengajar (
    dosen_id int  NOT NULL,
    kelas_id int  NOT NULL,
    tanggal timestamp  NOT NULL,
    pengajar_ke int  NOT NULL DEFAULT 0 CHECK (pengajar_ke >= 0),
    tahun int  NOT NULL,
    bulan int  NOT NULL,
    tgl int  NOT NULL,
    CONSTRAINT dosen_pengajar_pk PRIMARY KEY (dosen_id,kelas_id)
);

ALTER TABLE dosen_pengajar
DROP COLUMN tahun;

ALTER TABLE dosen_pengajar
DROP COLUMN bulan;

ALTER TABLE dosen_pengajar
DROP COLUMN tgl;

ALTER TABLE dosen_pengajar
ADD tahun INT GENERATED ALWAYS AS (EXTRACT(YEAR FROM tanggal)::INT) STORED;
    
ALTER TABLE dosen_pengajar
ADD bulan INT GENERATED ALWAYS AS (EXTRACT(MONTH FROM tanggal)::INT) STORED;
    
ALTER TABLE dosen_pengajar
ADD tgl INT GENERATED ALWAYS AS (EXTRACT(DAY FROM tanggal)::INT) STORED;


-- STORED PROCEDURE untuk mengatur pengajar_ke
CREATE OR REPLACE PROCEDURE reorder_pengajar_ke(p_id_kelas INT)
LANGUAGE plpgsql
AS $$

BEGIN
    UPDATE dosen_pengajar 
 SET dosen_pengajar.pengajar_ke = a.rn
 FROM dosen_pengajar 
 JOIN (
  SELECT dosen_id,row_number() over(order by tanggal ASC) as rn
  FROM dosen_pengajar 
  WHERE kelas_id = p_id_kelas
 ) a ON dosen_pengajar.dosen_id = a.dosen_id AND dosen_pengajar.kelas_id = p_id_kelas;
END;
$$;

-- Fungsi Trigger yang akan memanggil stored procedure
CREATE OR REPLACE FUNCTION trigger_reorder_pengajar()
RETURNS TRIGGER AS $$
BEGIN
    -- Panggil prosedur reordering untuk id_kelas yang baru saja di-insert
    -- Karena ini AFTER ROW trigger, NEW.id_kelas sudah tersedia.
    CALL reorder_pengajar_ke(NEW.kelas_id);
    RETURN NEW; -- AFTER ROW trigger harus mengembalikan NEW
END;
$$ LANGUAGE plpgsql;

-- Buat Trigger
CREATE TRIGGER after_insert_reorder_pengajar
AFTER INSERT ON dosen_pengajar
FOR EACH ROW
EXECUTE FUNCTION trigger_reorder_pengajar();;

-- Table: fakultas
CREATE TABLE fakultas (
    id int  NOT NULL GENERATED ALWAYS AS IDENTITY,
    kode varchar(2)  NOT NULL,
    nama varchar(20)  NOT NULL,
    CONSTRAINT fakultas_ak_1 UNIQUE (kode) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT fakultas_pk PRIMARY KEY (id)
);

-- Table: kelas
CREATE TABLE kelas (
    id int  NOT NULL GENERATED ALWAYS AS IDENTITY,
    kode varchar(10)  NOT NULL,
    nama varchar(20)  NOT NULL,
    periode int  NOT NULL,
    kapasitas int  NOT NULL DEFAULT 0 CHECK (kapasitas >= 0),
    terisi int  NOT NULL DEFAULT 0 CHECK (terisi >= 0),
    Matakuliah_id int  NOT NULL,
    sks int  NOT NULL,
    CONSTRAINT kelas_ak_1 UNIQUE (id, Matakuliah_id) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT kelas_ak_2 UNIQUE (id, Matakuliah_id, periode, sks) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT kelas_pk PRIMARY KEY (id)
);

-- Table: mahasiswa_peserta_kelas
CREATE TABLE mahasiswa_peserta_kelas (
    mahasiswa_id int  NOT NULL,
    kelas_id int  NOT NULL,
    tanggal timestamp  NOT NULL,
    matakuliah_id int  NOT NULL,
    periode int  NOT NULL,
    sks int  NOT NULL,
    tahun int  NOT NULL,
    bulan int  NOT NULL,
    tgl int  NOT NULL,
    CONSTRAINT mahasiswa_peserta_kelas_ak_1 UNIQUE (mahasiswa_id, matakuliah_id, periode) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT mahasiswa_peserta_kelas_pk PRIMARY KEY (mahasiswa_id,kelas_id)
);

ALTER TABLE mahasiswa_peserta_kelas
DROP COLUMN tahun;

ALTER TABLE mahasiswa_peserta_kelas
DROP COLUMN bulan;

ALTER TABLE mahasiswa_peserta_kelas
DROP COLUMN tgl;

ALTER TABLE mahasiswa_peserta_kelas
ADD tahun INT GENERATED ALWAYS AS (EXTRACT(YEAR FROM tanggal)::INT) STORED;
    
ALTER TABLE mahasiswa_peserta_kelas
ADD bulan INT GENERATED ALWAYS AS (EXTRACT(MONTH FROM tanggal)::INT) STORED;
    
ALTER TABLE mahasiswa_peserta_kelas
ADD tgl INT GENERATED ALWAYS AS (EXTRACT(DAY FROM tanggal)::INT) STORED;

CREATE OR REPLACE FUNCTION update_total_sks()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        -- Coba perbarui baris yang ada
        UPDATE peserta
        SET sksSemesterSekarang = sksSemesterSekarang + NEW.sks -- Tambahkan SKS baru
        WHERE id = NEW.peserta_id;

    ELSIF TG_OP = 'DELETE' THEN
        -- Kurangi SKS dari total_sks
        UPDATE peserta
        SET sksSemesterSekarang = sksSemesterSekarang - OLD.sks
        WHERE id = OLD.peserta_id;

    END IF;

    RETURN NULL; -- AFTER trigger harus mengembalikan NULL
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_total_sks
AFTER INSERT OR UPDATE OR DELETE ON mahasiswa_peserta_kelas
FOR EACH ROW
EXECUTE FUNCTION update_total_sks();;

-- Table: pengguna
CREATE TABLE pengguna (
    id int  NOT NULL GENERATED ALWAYS AS IDENTITY,
    username varchar(20)  NOT NULL,
    password varchar(255)  NOT NULL,
    nama varchar(20)  NOT NULL,
    foto varchar(20)  NOT NULL,
    role_id int  NOT NULL,
    nim varchar(10)  NULL,
    ipkSemesterLalu decimal(3,2)  NULL,
    ipsSemesterLalu decimal(3,2)  NULL,
    semester int  NULL,
    programStudi_id int  NOT NULL,
    departemen_id int  NOT NULL,
    nip varchar(16)  NULL,
    periode int  NULL,
    sksSemesterSekarang int  NULL,
    CONSTRAINT pengguna_ak_1 UNIQUE (username) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT check_dosen CHECK (role_id = 1 AND nip IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT check_tendik CHECK (role_id = 2 AND nip IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT check_mahasiswa CHECK (role_id = 3 AND nim IS NOT NULL AND ipkSemesterLalu IS NOT NULL AND ipsSemesterLalu IS NOT NULL AND semester IS NOT NULL AND sksSemesterSekarang IS NOT NULL AND periode IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT pengguna_pk PRIMARY KEY (id)
);

-- Table: programStudi
CREATE TABLE programStudi (
    id int  NOT NULL GENERATED ALWAYS AS IDENTITY,
    kode varchar(6)  NOT NULL,
    nama varchar(20)  NOT NULL,
    departemen_id int  NOT NULL,
    CONSTRAINT programStudi_ak_1 UNIQUE (kode) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT programStudi_ak_2 UNIQUE (id, departemen_id) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT programStudi_pk PRIMARY KEY (id)
);

-- Table: role
CREATE TABLE role (
    id int  NOT NULL,
    nama varchar(10)  NOT NULL,
    CONSTRAINT role_ak_1 UNIQUE (nama) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT role_pk PRIMARY KEY (id)
);

INSERT INTO role(id,nama) VALUES(1,'Dosen');
INSERT INTO role(id,nama) VALUES(2,'Tendik');
INSERT INTO role(id,nama) VALUES(3,'Mahasiswa');;

-- views
-- View: prodi
CREATE MATERIALIZED VIEW prodi AS
SELECT programStudi.id as programStudiId,
    programStudi.kode as programStudiKode,
       programStudi.nama as programStudiNama,
       departemen.id as departemenId,
       departemen.kode as departemenKode,
       departemen.nama as departemenNama,
       fakultas.id as fakultasId,
       fakultas.kode as fakultasKode,
       fakultas.nama as fakultasNama
  
FROM programStudi
JOIN departemen ON programStudi.departemen_id = departemen.id
JOIN fakultas ON departemen.fakultas_id = fakultas.id;

-- View: dosen
CREATE VIEW dosen AS
SELECT pengguna.id,pengguna.nama,pengguna.foto,pengguna.nip,pengguna.programStudi_id, pengguna.departemen_id
FROM pengguna
WHERE pengguna.role_id = 1;

-- View: tendik
CREATE VIEW tendik AS
SELECT pengguna.id,pengguna.nama,pengguna.foto,pengguna.nip,pengguna.departemen_id
FROM pengguna
WHERE pengguna.role_id = 2;

-- View: mahasiswa
CREATE VIEW mahasiswa AS
SELECT pengguna.id,pengguna.nama,pengguna.foto,pengguna.nim, pengguna.programStudi_id, pengguna.semester, pengguna.ipkSemesterLalu, pengguna.ipsSemesterLalu, pengguna.sksSemesterSekarang
FROM pengguna
WHERE pengguna.role_id = 3;

-- foreign keys
-- Reference: Matakuliah_programStudi (table: Matakuliah)
ALTER TABLE Matakuliah ADD CONSTRAINT Matakuliah_programStudi
    FOREIGN KEY (programStudi_id)
    REFERENCES programStudi (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: departemen_fakultas (table: departemen)
ALTER TABLE departemen ADD CONSTRAINT departemen_fakultas
    FOREIGN KEY (fakultas_id)
    REFERENCES fakultas (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: dosen_dosen_pengajar (table: dosen_pengajar)
ALTER TABLE dosen_pengajar ADD CONSTRAINT dosen_dosen_pengajar
    FOREIGN KEY (dosen_id)
    REFERENCES pengguna (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: kelas_Matakuliah (table: kelas)
ALTER TABLE kelas ADD CONSTRAINT kelas_Matakuliah
    FOREIGN KEY (Matakuliah_id, sks)
    REFERENCES Matakuliah (id, sks)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: kelas_dosen_pengajar (table: dosen_pengajar)
ALTER TABLE dosen_pengajar ADD CONSTRAINT kelas_dosen_pengajar
    FOREIGN KEY (kelas_id)
    REFERENCES kelas (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: kelas_mahasiswa_peserta_kelas (table: mahasiswa_peserta_kelas)
ALTER TABLE mahasiswa_peserta_kelas ADD CONSTRAINT kelas_mahasiswa_peserta_kelas
    FOREIGN KEY (kelas_id, matakuliah_id, periode, sks)
    REFERENCES kelas (id, Matakuliah_id, periode, sks)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: mahasiswa_mahasiswa_kelas (table: mahasiswa_peserta_kelas)
ALTER TABLE mahasiswa_peserta_kelas ADD CONSTRAINT mahasiswa_mahasiswa_kelas
    FOREIGN KEY (mahasiswa_id)
    REFERENCES pengguna (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: pengguna_programStudi (table: pengguna)
ALTER TABLE pengguna ADD CONSTRAINT pengguna_programStudi
    FOREIGN KEY (programStudi_id, departemen_id)
    REFERENCES programStudi (id, departemen_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: pengguna_role (table: pengguna)
ALTER TABLE pengguna ADD CONSTRAINT pengguna_role
    FOREIGN KEY (role_id)
    REFERENCES role (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: programStudi_departemen (table: programStudi)
ALTER TABLE programStudi ADD CONSTRAINT programStudi_departemen
    FOREIGN KEY (departemen_id)
    REFERENCES departemen (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- sequences
-- Sequence: Matakuliah_seq
CREATE SEQUENCE Matakuliah_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: departemen_seq
CREATE SEQUENCE departemen_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: fakultas_seq
CREATE SEQUENCE fakultas_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: kelas_seq
CREATE SEQUENCE kelas_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: pengguna_seq
CREATE SEQUENCE pengguna_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: programStudi_seq
CREATE SEQUENCE programStudi_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: role_seq
CREATE SEQUENCE role_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- End of file.

