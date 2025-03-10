# **2-Player Math Game - Design Document**

From the given description, the important nouns that could be turned into classes are:
- **Player**  
- **Game**  
- **Question**  

---

### **1. Player Class**  
- **Role:** Represents each player in the game. Keeps track of the player’s name and remaining lives.  
- **State (Instance Variables):**  
  - `name` → The player's name  
  - `lives` → Number of lives remaining (starts at 3)  
- **Behavior (Methods):**  
  - `lose_life` → Reduces the player's lives when they answer incorrectly  
  - `is_alive?` → Returns `true` if the player still has lives left, otherwise `false`  

### **2. Question Class**  
- **Role:** Generates random math addition problems. It is responsible for producing a question and checking if an answer is correct.  
- **State (Instance Variables):**  
  - `num1` → A random number between 1 and 20  
  - `num2` → A random number between 1 and 20  
- **Behavior (Methods):**  
  - `ask_question` → Returns the question as a string (e.g., "What is 5 + 3?")  
  - `correct_answer` → Returns the correct answer  

### **3. Game Class**  
- **Role:** Controls the game flow, including switching turns, checking scores, and ending the game.  
- **State (Instance Variables):**  
  - `player1` → First player  
  - `player2` → Second player  
  - `current_player` → Keeps track of whose turn it is  
- **Behavior (Methods):**  
  - `switch_turns` → Switches the current player after each round  
  - `game_over?` → Checks if any player has lost all their lives  
  - `announce_winner` → Displays the final result when the game ends  
  - `play_turn` → Generates a question, gets user input, and checks the answer  
  - `start_game` → Runs the game loop until a player loses  

---

## **Additional Considerations**  
1. **Game Loop Management:**  
   - The `Game` class contains the game loop (`start_game`).  
   - The loop runs while both players have lives left.  

2. **Managing the Current Player:**  
   - The `Game` class manages turn-taking using `switch_turns`.  

3. **User Input/Output Handling:**  
   - The `Game` class handles player input (`play_turn`).  
   - The `Question` class only generates and validates questions.  
