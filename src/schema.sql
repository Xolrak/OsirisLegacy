-- src/schema.sql

CREATE TABLE IF NOT EXISTS platforms (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS emulators (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- Tabla intermedia que prevé que puedan existir emuladores que sean multiplataforma
CREATE TABLE IF NOT EXISTS platforms_emulators (
    id INTEGER PRIMARY KEY,
    platform_id INTEGER NOT NULL,
    emulator_id INTEGER NOT NULL,
    FOREIGN KEY (platform_id) REFERENCES platforms(id) ON DELETE CASCADE,
    FOREIGN KEY (emulator_id) REFERENCES emulators(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS games (
    id INTEGER PRIMARY KEY,
    platform_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    FOREIGN KEY (platform_id) REFERENCES platforms(id) ON DELETE RESTRICT
);

-- Indice para busquedas por nombre de juego
CREATE INDEX IF NOT EXISTS idx_games_title ON games(title);