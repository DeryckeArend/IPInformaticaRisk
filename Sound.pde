import processing.sound.*;
SoundFile music;
SoundFile buttonClick;
SoundFile attackSound;
SoundFile nextPlayer;


void setupSound() {
  music = new SoundFile(this, "Music/soundtrack.mp3");
  music.loop();
  changeSound();
}

void changeSound(){
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