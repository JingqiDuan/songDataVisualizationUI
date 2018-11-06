class MakeCharts{

void printChart(){
  theData = loadJSONArray("NOW-US-1-61.json");
  
  
  for (int i = 0; i< 60; i++) {

    album = theData.getJSONObject(i);
    volume = album.getInt("volume");
    volumeArray[i] = volume;
    releaseDate = album.getString("releaseDate");
    releaseDateArray[i] = releaseDate;
    artists = album.getJSONArray("artists");
    artistsName = artists.getStringArray();
    tracks = album.getJSONArray("tracks");
    trackName = tracks.getStringArray();
    lengthOfTracks = tracks.size();
    tempo = album.getJSONArray("tempo");
    tempoValue = tempo.getDoubleArray();
    lengthOfTracks = tracks.size();
    valence = album.getJSONArray("valence");
    valenceValue = valence.getDoubleArray();
    danceability = album.getJSONArray("danceability");
    danceabilityValue = danceability.getDoubleArray();
    spotifyIDs = album.getJSONArray("spotifyIDs");
    spotifyIDsValue = spotifyIDs.getStringArray();
    yearPiece = split(releaseDateArray[i], ' ');
    sortParameter(danceabilityValue);
    }
    
    //for(int l=0; l<=10;l++){    
     // textFont(dataFont);
     // text("Dvalue: "+danceabilityValue[l],width/2, buttonCY);
     // buttonCY +=30;
  //}
}

}