Words
https://words.flutterflow.app/

I created a simple app based on Japanese "four-character idioms".
Yojijukugo is a word that combines four kanji characters in Japanese, and is used to express concepts and philosophies that cannot be expressed in short words. Four-letter idioms have been used in many literary works, sentences, and proverbs from ancient times to the present, and are considered to be one of the characteristics of Japanese language.

The English meaning of each four-letter idiom was obtained using the OpenAI API and stored in the Suabase DB.
About 100 words are registered, and the explanation of the words is registered in advance with OpenAI and called.
Press the center of the screen to see the detailed meaning of the word. Also, know how to read.
In addition, AI displays what kind of emotion this word is similar to. If you press the emotion at the bottom of the page, other four-character idioms will be displayed. You will find that there are many different words for the same emotion.

Technically, it also combines:
・FlutterFlow is used for the front end, and the background image, gradation, petals, text, and buttons are displayed in Stack on the page. A Flippable Card is placed in the center so that it flips over when pressed.
・Japanese and English text-to-speech functions are implemented with Flutter's TTS (text-to-speech) function.
・Images are called using the API of Unsplash (https://unsplash.com/).
・LottieAnimation is placed on the petals. (https://lottiefiles.com/)

The combination of Supabase and FlutterFlow works best.
You can build with low code and develop features by coding the details.
I encourage all Supabase users to give FlutterFlow a try.

