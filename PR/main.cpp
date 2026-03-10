#include <iostream>
#include <unistd.h>
#include <termios.h>
#include <fcntl.h>
#include <vector>
#include <cstdlib>
#include <ctime>

using namespace std;

int kbhit() {
    struct termios oldt, newt;
    int ch;
    int oldf;
    
    tcgetattr(STDIN_FILENO, &oldt);
    newt = oldt;
    newt.c_lflag &= ~(ICANON | ECHO);
    tcsetattr(STDIN_FILENO, TCSANOW, &newt);
    oldf = fcntl(STDIN_FILENO, F_GETFL, 0);
    fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);
    
    ch = getchar();
    
    tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
    fcntl(STDIN_FILENO, F_SETFL, oldf);
    
    if(ch != EOF) {
        ungetc(ch, stdin);
        return 1;
    }
    return 0;
}

int main() {
    system("clear");
    cout << "Flappy Bird Terminal\n";
    cout << "Press SPACE to jump\n";
    cout << "Press any key to start...\n";
    
    getchar(); // Wait for any key press

    int bird = 10, vel = 0, pipe = 35, score = 0;
    
    while (true) {
        if (kbhit() && getchar() == ' ') {
            vel = -3; // Jump
        }

        vel++; // Gravity effect
        bird += vel;

        pipe--; // Move pipe left
        if (pipe < 0) {
            pipe = 35; // Reset pipe position
            score++; // Increase score
        }

        // Collision detection
        if (bird < 0 || bird > 18) break;
        if (pipe == 15 && (bird < 5 || bird > 11)) break;

        // Render game
        system("clear");
        for (int y = 0; y < 20; y++) {
            for (int x = 0; x < 40; x++) {
                if (x == 15 && y == bird) cout << '@';
                else if (x == pipe && (y < 5 || y > 11)) cout << '#';
                else cout << ' ';
            }
            cout << '\n';
        }
        cout << "Score: " << score << endl;

        usleep(50000); // Control game speed
    }
    cout << "\nGAME OVER! Score: " << score << "\n";
    return 0;
}
