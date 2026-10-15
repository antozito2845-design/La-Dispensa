-- La Dispensa: struttura del database
-- Uso: mysql -u TUO_UTENTE -p < database.sql

CREATE DATABASE IF NOT EXISTS Ricettario_cucina
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE Ricettario_cucina;

-- Ricette
CREATE TABLE IF NOT EXISTS ricette (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  nome        VARCHAR(255) NOT NULL,
  istruzioni  TEXT,
  difficolta  VARCHAR(50) NOT NULL DEFAULT 'facile'
);

-- Ingredienti (con scorte)
CREATE TABLE IF NOT EXISTS ingredienti (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  nome         VARCHAR(255) NOT NULL,
  quantita     DECIMAL(10,2) NOT NULL DEFAULT 0,
  unita        VARCHAR(20) NOT NULL,
  descrizione  TEXT NULL,
  giacenza     DECIMAL(10,2) NOT NULL DEFAULT 0
);

-- Collegamento ricette <-> ingredienti
CREATE TABLE IF NOT EXISTS ricetta_ingrediente (
  id              INT AUTO_INCREMENT PRIMARY KEY,
  ricetta_id      INT NOT NULL,
  ingrediente_id  INT NOT NULL,
  quantita        DECIMAL(10,2) NOT NULL,
  unita           VARCHAR(20) NOT NULL DEFAULT '',
  CONSTRAINT fk_ri_ricetta
    FOREIGN KEY (ricetta_id) REFERENCES ricette(id) ON DELETE CASCADE,
  CONSTRAINT fk_ri_ingrediente
    FOREIGN KEY (ingrediente_id) REFERENCES ingredienti(id) ON DELETE RESTRICT
);
