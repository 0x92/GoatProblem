{ ##############################################################
  ## Modul:     GoatProblem
  ## Author:    0x92; coolmen1994
  ## Release:   05.03.2014
  ## Contact:   0x92dev@gmail.com | https://github.com/0x92
  ## -----------------------------------------------------------
  ##############################################################}

program GoatProblem;

{$APPTYPE CONSOLE}

uses
  SysUtils;

{Es soll drei Türen geben. Als erstes wird aus Zufall definiert hinter welcher Tür
   der Preis liegt. (Auto) Dann soll der Kandidat die erste Wahl treffen(Z.B. Tür 1).
   Dann Soll eine der anderen Türen aufgedeckt werden, und nun soll der Kandidat sich erneut
   entscheiden ob er bei seiner Wahl bleibt oder wechselt....}

var
  Doors: array of Integer;
  i, Doorcount, WinPosition, SelectedDoor, SelectedDoor2, RandomDoor: Integer;
  Decision: String;

// Arraywerte
// 0 = Ziege | 1 = Gewinn
begin
  try
    Randomize;
    Doorcount  := 0;
    RandomDoor := 0;
    WriteLn('How many doors should be used for your experiment?');

    while Doorcount <= 2 do
    begin
      WriteLn;
      Write('# NOTE: Please use a higher value than 2!    ');
      ReadLn(Doorcount);
    end;

    SetLength(Doors, Doorcount);

    for i := 0 to High(Doors) -1 do   // Über alle "Türen" gehen und mit "Ziegen" füllen
    begin
      Doors[i] := 0;
    end;

    WinPosition := Random(Doorcount);
    Doors[WinPosition] := 1;           //Gewinn wird auf eine Tür verteilt

    //Nächster Schritt abfragen welche tür genommen werden soll
    WriteLn;
    Write('Please submit a door number between 1 and ' + IntToStr(Doorcount) + '. ');
    ReadLn(SelectedDoor); // SelectedDoor = Die Tür welche ausgewählt wurde
    WriteLn;
    WriteLn('You selected door number ' + IntToStr(SelectedDoor) + '.');

    while RandomDoor = SelectedDoor {and (RandomDoor = WinPosition)} do   //Solange die Zufallstür die ausgewählte/Gewinn Tür ist nochmal neu generieren
    begin
      RandomDoor := Random(Doorcount);
    end;

    WriteLn('I will show you one goatdoor!');

    if Doors[RandomDoor] = 0 then
      WriteLn('Door number: ' + IntToStr(RandomDoor +1) + ' Ohhh, it is a goat! ;O');
      WriteLn('Do you want to change your door?');
      WriteLn;

      if Doors[RandomDoor] = 1 then
        WriteLn('Door number: ' + IntToStr(RandomDoor +1) + ' *Dafuq, there is the price!*');

//    WriteLn('Do you want to pick another door? ### NOTE: Y/N');
//    ReadLn(Decision);

    Decision := 'None';

    while not (Decision = 'Y') and not (Decision = 'y') and not (Decision = 'N') and not (Decision = 'n') do
    begin
      WriteLn('# NOTE: Only Y/y or N/n accepted');
      ReadLn(Decision);
    end;

    if (Decision = 'N') or (Decision = 'n')  then    //Tür zeigen
    begin
      if Doors[SelectedDoor] = 0 then
      begin
        WriteLn('Ohhh, it is a goat! ;O You lost the game.');
      end
      else
      begin
        WriteLn('WHAT THE FUCK IS GOING ON?? WE GOT A MOTHERFUCKIGN WINNER!!! TAKE YOUR PRICE.');
        WriteLn('With that big amount of toilet paper (over 9000) you will never be forced to buy toilet paper again.');
      end;
    end;

    if (Decision = 'Y') or (Decision = 'y')  then    //Tür zeigen
    begin
      WriteLn('Please submit a door number between 1 and ' + IntToStr(Doorcount) + '.');
      ReadLn(SelectedDoor2); // SelectedDoor = Die Tür welche ausgewählt wurde
      WriteLn('You have selected door number ' + IntToStr(SelectedDoor2) + '.');
      if Doors[SelectedDoor2] = 0 then
      begin
        WriteLn('Ohhh, it is a goat! ;O You lost the game. Fool! HAHA');
      end
      else
      begin
        WriteLn('WHAT THE FUCK IS GOING ON?? WE GOT A MOTHERFUCKIGN WINNER!!! TAKE YOUR PRICE.');
        WriteLn('With that big amount of toilet paper (over 9000) you will never be forced to buy toilet paper again.');
      end;
    end;
  finally
    ReadLn;
  end;
end.
