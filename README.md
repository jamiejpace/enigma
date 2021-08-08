### Enigma
## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Learning Goals](#learning-goals)
* [Technologies](#technologies)
* [Setup](#setup)
* [Contact](#contact)
## General info
This project uses Ruby to build a tool for encrypting and decrypting messages.
## Screenshots
![enigma terminal screenshot](https://user-images.githubusercontent.com/81520519/128646994-8d59e138-1d23-45f5-a808-6ed38a6a294b.png)
## Learning Goals
* Practice breaking a program into logical components
* Build classes that demonstrate single responsibilities
* Test drive a well-designed Object Oriented solution
* Work with file i/o
## Technologies
Project is created with:
* Ruby version: 2.7.2
## Setup
To run this program, save a copy of this repository locally. In the MacOS
application 'Terminal,' navigate into the _enigma_ directory.
Then, run it using ruby (note: '$' is not typed).
1. Clone the repo using the web url:
   ```
   $ git clone https://github.com/jamiejpace/enigma
   ```
   or with a password-protected SSH key:
   ```
   $ git clone git@github.com:jamiejpace/enigma.git
   ```
2. Change into the directory:
   ```
   $ cd ../enigma
   ```
3. Enter the message you would like to encrypt into the message.txt file, then run the    encryption by entering the following into the terminal:
   ```
   $ ruby ./lib/encrypt.rb message.txt encrypted.txt

   ```
4. You can then decrypt the message by entering the following into the terminal using the same key and date used in the initial encryption:
```
$  ruby ./lib/decrypt.rb encrypted.txt decrypted.txt <key> <date>

```

## Contact
Created by
* [@jamiejpace](https://github.com/jamiejpace)

~ feel free to contact us! ~
~ enjoy! ~
