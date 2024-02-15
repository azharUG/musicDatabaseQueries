-- Query 3: Insert another video for the track "Voodoo", assuming that you don't know the TrackId, so your insert query should specify the TrackId directly.

INSERT INTO MusicVideo (track_id,  video_director)
SELECT TrackId , 'John'
FROM tracks 
WHERE name == 'Voodoo';