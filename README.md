# byzanz-record-gif
Shell script to make byzanz more user-friendly

Inspired from http://askubuntu.com/a/201018

###Usage

Clone the repository

    git clone https://github.com/sahildua2305/byzanz-record-gif.git
    cd byzanz-record-gif

Run the bash script using the following syntax

    bash byzanz-record-window.sh <delay_in_seconds> <duration_in_seconds> <filename>

 - After running the script, it will wait for you to select the window that you want to record.
 - Go to the window (alt-tab) you want to capture. Click on it.
 - It will now wait for <delay_in_seconds> seconds before it starts recording the window that you have selected for the duration of <duration_in_seconds> that you had mentioned while running the script.
 - The final GIF will be saved in the same repository from where you had run the script under file name <filename> as given in the command.

###Example

    bash byzanz-record-window.sh 5 20 output.gif

###Demo
![](screengrab/output.gif?raw=true)
