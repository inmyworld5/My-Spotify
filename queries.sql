-- Show all playlists created
SELECT * FROM "playlists";

-- Find songs of a given artist
SELECT "title" FROM "songs"
WHERE "id" IN(
    SELECT "song_id" FROM "song_artist"
    WHERE "artist_id" = (
        SELECT "id" FROM "artists"
        WHERE "name" = 'Imagine Dragons'
    )
);

-- Find songs of a given playlist
SELECT "title" FROM "songs"
WHERE "id" IN(
    SELECT "song_id" FROM "song_playlist"
    WHERE "playlist_id" = (
        SELECT "id" FROM "playlists"
        WHERE "name" = 'My favorites'
    )
);


-- Find songs of a given album
SELECT "title" FROM "songs"
WHERE "id" IN(
    SELECT "song_id" FROM "song_album"
    WHERE "album_id" = (
        SELECT "id" FROM "albums"
        WHERE "name" = 'Summer vibes'
    )
);


-- Find albums released by a given artist
SELECT * FROM "albums"
WHERE "artist_id" = (
    SELECT "id" FROM "artists"
    WHERE "name" = 'Three Days Grace'
);

-- Add song
INSERT INTO "songs"("title", "genre", "release_date")
VALUES ("Life", "pop", "2015-08-30");

-- Add artist
INSERT INTO "artists"("name", "debut", "main_genre")
VALUES ("The last warrior", "2011-02-21", "metal");

-- Delete song from playlist
DELETE "song_id" FROM "song_playlist"
WHERE "playlist_id" = (
    SELECT "id" FROM "playlists"
    WHERE "name" = 'Vibes'
)
AND "song_id" = (
    SELECT "id" FROM "songs"
    WHERE "title" = 'Bad'
);