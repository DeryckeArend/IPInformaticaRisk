import processing.sound.*;
SoundFile music;
SoundFile buttonClick;
SoundFile attackSound;
SoundFile nextPlayer;

//float soundLevel = value2;

void setupSound() {
  // Load a soundfile from the /data folder of the sketch and play it back
  music = new SoundFile(this, "Music/soundtrack.mp3");
  music.loop();
  music.amp(value2);
}

void stopSound() {
  music.stop();
}

//buttonclicks in menu
void buttonClicked() {
  buttonClick = new SoundFile(this, "Music/buttonclick.mp3");
  buttonClick.play();
}

//muziekje wanneer je klikt op aanvallen
void attackSound() {
  attackSound = new SoundFile(this, "");
  attackSound.play();
}
//next player turn sound
void nextPlayer() {
  nextPlayer = new SoundFile(this, "");
  nextPlayer.play();
}