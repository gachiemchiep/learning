/*
 * File:   main.cpp
 * Author: gachiemchiep
 *
 * Created on February 27, 2016, 8:15 PM
 */

#include <stdio.h>

/*
 *
 */
int main(int argc, char** argv) {

    char *states[] = {
        "California", "Oregon",
        "Washington", "Texas"
    };

    for (int i = 0; i < 4; i++) {
        printf("state %d: %s \n", i, states[i]);
    }

    return 0;
}

