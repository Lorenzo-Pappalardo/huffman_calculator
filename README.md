
# Huffman Calculator

## An app that calculates Huffman Code from user-inserted text and vice versa

The app is build using [Flutter](https://flutter.dev/) framework and it consists of two different main pages: EncodePage and DecodePage. Each of them launches a ResultPage which does exactly what you think it does: showing the result of the selected computation. Both pages feature a BottomAppBar widget and FAB(FloatingActionButton) widget. The former is used to switch between the pages and the latter serves the only purpose of making the magic happen!

### Encode Page

This is the first page you encounter when opening the app. It's basically a collection of two Widgets. The first is just a simple text that briefly explains the second widget's purpose. The second widget is a TextField, tweaked to take all available space inside a Column widget, but stopping right before the BottomAppBar and the FAB.
When the user has finished writing the text for which he or she wants to calculate Huffman Code it's just a matter of pressing the FAB to start the calculations. Quickly the user will be presented with a ResultPage which shows the result of the previous calculations. The result is represented by a sequence of bits which by themselves are completely useless, unless the user pairs them with the CharactersCodes. Each Character code is a Pair, in which the first element is a Character and the second is the code that "translates" that character. Both the encoded text and the characters codes are necessary to restore the original text. FlatButtons are present in order to save the user the annoyance of manually copying everything.

### Decode Page

This is the second and last page that is present in the app. It is the opposite of the EncodePage, in fact it restores the original text, based on the encoded text and the characters codes. The page is divided in two sections contained in a Column widget. The first section consists of a TextField, which should contain the encoded text, while the second consists of another TextField which should contain the characters codes. Once the user has filled both, he or she can press the FAB that opens up the Result page, showing the original text. Here, too, there is a FlatButton which makes it easy to copy the text.

## Purpose

Aside from being a personal experiment, I conceived the app as a tool for sending encrypted messages that could only be decrypted by who I chose to send the codes to.

## Final notes

This has been both my first attempt to create an app and the first time using Flutter framework, so I encourage you to improve the app and to make me know if there's something that you would have done in another way. I apologize if some of the more experienced programmers out there are unhappy (to say the least) with of the app is conceived and built, I'm open to suggestions.
