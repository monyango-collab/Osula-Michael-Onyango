
import random;

walker RPSGame {
    has choice="rock";   # the choice of a player: "rock", "paper", or "scissors"

    can start with root entry;
    can play with match entry;
}

node match {
    has computer_choice: str = random.choice(["rock", "paper", "scissors"]);
}

with entry root {
    start {
        std.out("Rock-Paper-Scissors Game Started!");
        std.out("Your choice is: " + self.choice);
        take -> match;
    }
}

with entry match {
    play {
        std.out("Computer chose: " + here.computer_choice);

        if self.choice == here.computer_choice {
            std.out("It's a draw!");
        } elif (self.choice == "rock" and here.computer_choice == "scissors") or
              (self.choice == "scissors" and here.computer_choice == "paper") or
              (self.choice == "paper" and here.computer_choice == "rock") {
            std.out("You win!!!");
        } else {
            std.out("You lose!!");
        }
        disengage;
    }
}

with entry __main__ {
    root spawn RPSGame("rock");
    root spawn RPSGame("paper");
    root spawn RPSGame("scissors");
}