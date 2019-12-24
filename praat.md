---
layout: page
title: Praat
subtitle: Annotated Praat learning resources
---

Praat is a computer program that is widely used in the field of phonetics and speech-related studies. You can use it for analysing, synthesizing, and manipulating speech data, and  you can use it to plot waveforms, spectragrams, ptich contour and many other acoustic figures. 

There are loads of resouces online that introduce Praat to beginning users and all kinds of scripts you can borrow and tweak (if you have some programming skills) to automate speech analysis.

The problem is that there are too many of them and when you need something, it takes a lot of time to find what you really want. Thus, I would like to provide some useful annotated resouces organized in a logical way and this is the go-to page when I need to find Praat resources.

The first step to learn Praat is to familarize yourself with some concept about acoustics like, spectrogram, waveform, formant, ptich and so on. Introductory textbooks or online tutorials on acoustic phonetic will do. 

* [Speech acoustics topics](https://www.mq.edu.au/about/about-the-university/faculties-and-departments/faculty-of-human-sciences/departments-and-centres/department-of-linguistics/our-research/phonetics-and-phonology/speech/acoustics)

* [Tutorial for self study: basics of phonetics and how to use Praat](https://resources.lab.hum.uu.nl/resources/phonetics/index.html)

In addition, you can play with [ESystem](https://www.speechandhearing.net/laboratory/esystem/), a learning environment for the theory of signals and systems.

Then you can use [this tutorial](http://www.fon.hum.uva.nl/praat/manual/Intro.html) from Praat's official website or [this one by David Weenink](http://www.fon.hum.uva.nl/david/LOT/sspbook.pdf)  to learn about different tabs/functionalities and how they are related to speech signal processing. 

If you find that introduction too technical, I would recommend [this one](http://wstyler.ucsd.edu/praat//) in English by Will Styler and [this one](http://9zhou.phonetics.org.cn/data/tools/praat_manual.pdf) in Chinese by Ziyu Xiong (for other languages see [this link](http://www.fon.hum.uva.nl/praat/manualsByOthers.html)). Both are very nice materials for teaching and learning Praat.

After you have some knowledge of the basics, there are two things researchers usually do when studying phonetics or speech in general: annotation and batch processing data with scripts. This is the second step in learning Praat and the learning curve can be steep at times. For annotating your data, you need to apply the acoustic knowledge you have learnt from the textbook in dealing with real life speech production which can be messy in itself. This is laborious process that requires patience and experience.

Here are a couple of things praat script can help to automate some boring stuff (but Praat cannot DO the annotation for you, especially when you need a high accuracy rate):

* Before annotation, you can use [this script](/pdf/04_auto_segmentation_JC2.1.praat)to segment words/syllable and generate an annotation file, called TextGrid file. 
* If you want to cut long files into short sound files, provided that you have a textgrid file that marks the boundary, you can use [this script](/pdf/exp4_word choper.praat). 
* If you want to open each sound file with its textgrid and do some annotation you can use [this one](/pdf/02_text grid reviewer.praat).

Once you are happy with your annotation, you can use [this script](/pdf/analyse_tier.praat) by Daniel Hirst to extract basic acoustic information. There are many other scripts that can do similar things, but this one is a to-go script (including duration, pitch, formant) for me. If you are particularly interested in pitch in speech, I would recommend Yi Xu's [Prosody Pro](http://www.homepages.ucl.ac.uk/~uclyyix/ProsodyPro/), which provides a rich range of options and is well recognized in academia.

If the above scripts have not met with your requirement, you can search for more scripts [here](http://phonetics.linguistics.ucla.edu/facilities/acoustic/praat.html#howto) sorted by type, or [here](https://sites.google.com/site/praatscripts/) with a built-in searching engine.

But as you start using the script, you will stumb over issues like specifying the directory (location of files on your computer) and bugs of all kinds. It is desirable to develop some programming skills, not to be able to write a script from stratch but to debug and tweak the scripts others have written or tweaked. 

Here are some tutorials for teaching/learning scripting in Praat.

[Praat scripting manual \(workshop\) for beginners](http://www.mauriciofigueroa.cl/04_scripts/04_scripts.html): This manual/workshop, unlike other existing manuals, is exclusively devoted to script writing (not to Praat's general usage) and it covers: the Praat Objects window, how to read and write scripts in Praat, good scripting practices, uses and types of variables, conditional jumps (if), loops (for, while, repeat), common numerical and string functions, debugging, interacting with the user, procedures and arrays. It also includes many tips, script examples and learning exercises, for which the solutions can be found in the accompanying folders and files.

[Phonetics on speed](http://praatscripting.lingphon.net/)
It attempts to pave the way and provide a basic entrance to the world of Praat scripting. Each session of the tutorial is dedicated to a concept or feature of the Praat scripting language. Sessions are divided into reading assignments followed by a hands-on workshop, where you'll implement what you have learned.

In recent years, other programming languages, such as R and Python, have APIs for Praat and it is possbile now to take advantage of each program. For a comparision among various packages and libraries, see [this paper](https://www.sciencedirect.com/science/article/pii/S0095447017301389?via%3Dihub). Two of them worth mentioning here, EMU-R and Parselmouth.

The EMU Speech Database Management System (EMU-SDMS) is a collection of software tools which aims to be as close to an all-in-one solution for generating, manipulating, querying, analyzing and managing speech databases as possible. [This manual](https://ips-lmu.github.io/The-EMU-SDMS-Manual/index.html) introduces and describes the various components of this system.

Parselmouth is an open-source Python library that facilitates access to core functionality of Praat in Python (data visualisation, file manipulation, audio manipulation, statistical analysis), in an efficient and programmer-friendly way. It also features in the integration of Parselmouth into a Python-based experimental design for automated, in-the-loop manipulation of acoustic data. Here is a [tutorial](https://parselmouth.readthedocs.io/en/stable/).



