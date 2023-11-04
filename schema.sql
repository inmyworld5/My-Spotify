CREATE TABLE "songs"(
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    "release_date" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "song_artist"(
    "id" INTEGER,
    "song_id" INTEGER,
    "artist_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id")
);

CREATE TABLE "song_album"(
    "id" INTEGER,
    "song_id" INTEGER,
    "album_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id"),
    FOREIGN KEY("album_id") REFERENCES "albums"("id")
);

CREATE TABLE "song_playlist"(
    "id" INTEGER,
    "song_id" INTEGER,
    "playlist_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id"),
    FOREIGN KEY("playlist_id") REFERENCES "playlists"("id") ON DELETE CASCADE,
);

CREATE TABLE "artists"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "debut" NUMERIC NOT NULL,
    "main_genre" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "playlists"(
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "created" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "number_of_songs" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "albums"(
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "artist_id" INTEGER,
    "release_date" NUMERIC NOT NULL,
    "main_genre" TEXT NOT NULL,
    "number_of_songs" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id")
);

CREATE INDEX "songs_search" ON "songs"("id", "title", "genre", "release_date");
CREATE INDEX "song_artist_search" ON "song_artist"("song_id", "artist_id");
CREATE INDEX "song_playlist_search" ON "song_playlist"("song_id", "playlist_id");
CREATE INDEX "song_album_search" ON "song_album"("song_id", "album_id")