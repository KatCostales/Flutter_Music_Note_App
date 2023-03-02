CS-378H Assignment 3

EX03_01 – Set up your GitHub repository, and add Pete as a collaborator. (Pete’s user name is ptucker).

EX03_02 – Break down your application from a high level to some specific parts. The more detail you can give here, the better. Hang on to this document (GitHub?), since it will change throughout the semester.
<br />•	Audio listener
<br />&emsp;    o	Main feature of application
<br />&emsp;    o	Listens for pitch (and possibly timing) of notes played on a given instrument
<br />•	Auto transcriber
<br />&emsp;    o	Records what the listener receives into sheet music 
<br />&emsp;    o	3 forms of uploading, upload from recording, upload from a video, and/or upload different audio forms
<br />•	Sheet music editor
<br />&emsp;    o	Allow user to manually modify and polish auto-transcribed music
<br />•	Data storage
<br />&emsp;    o	Store user’s scores on the server
<br />•	User data
<br />&emsp;    o	Store user’s account information in 
<br />•	Correct note detection
<br />&emsp;    o	Given a score, listen to a user playing and determine if they played the right notes or not
<br />•	Instrument calibration
<br />&emsp;    o	If an instrument is out of tune, allow user to calibrate the app by listening to the pitch of each played note and comparing it to the correct pitch of the actual note

EX03_03 – Start brainstorming ideas on how to solve the problem you’re working on. No idea is off limits. Once you have enough ideas, come up with a plan to test them (e.g. How will you test? In what order?).
<br />•	Flashcards
<br />&emsp;    o	Show user a note/chord on the music staff for the user to play
<br />&emsp;    o	Listen for the correct notes played
<br />•	Daily challenges
<br />&emsp;    o	Way for users to stay engaged with app
<br />&emsp;    o	Include flashcards (for beginners)
<br />&emsp;    o	Music writing challenges (for more advanced users)
<br />•	Push notifications (not necessarily a priority)
<br />&emsp;    o	Notify users of new challenges, updates, etc.
<br />•	Offline mode (access phone decice permissions to store files on phone rather than the server)
<br />&emsp;    o	Allow users to create and modify scores offline and save them on their device until a network becomes available

Additionally, for testing purposes, we hope to undergo each phase of the product design process: product definition, conceptual design, embodiment design, and detailed design. This process essentially allows constant refinement and user experience consideration throughout the development and design process.

<br />For each individual feature, we will implement unit test suites that will include valid (expected to succeed) and invalid (expected to fail) tests. We will implement tests at each stage of the development process, testing each feature as necessary.

EX03_04 – Do some market research. Find products that contribute to your idea
•	Are there products that are very similar? What do they do well? What can you imagine that is 10x better? Warning – it’s dangerous to say “there’s nothing out there like this.”
•	Are there products that are have overlap? What can you learn from those? How can they contribute to your ideas?

Market Research:

Products that contribute to your idea:
-	Melody Scanner:
Melody Scanner is an app that automatically transcribes music into scores. Though they essentially accomplished what our team strives to accomplish; however, we aim to implement our transcribe tool as a learning instrument software rather than primarily transcribing sheet music. We are aiming to implement instruments such as the piano and guitar to begin with and then further instruments after that. Our final app idea strives to build on what Melody Scanner currently has by implementing a similar user interface to Duolingo.

    

-	Score Cloud
Score Cloud provides similar services by allowing users to store their scores and songs online. Additionally, users are able to share their songs, sync score changes across all devices, and generate scores through a subscription model. 

   

-	MuseScore
Muse Score is a different software that allows users to write, download, and edit sheet music on a user-friendly interface. 

   




Similar Products (What do they do well, what can you imagine is 10x better?):
Score Cloud, Muse Score, and Melody Scanner are a few of many software available that automatically transcribes music into scores through a subscription model. They ultimately achieve the technical aspect of our product with being able to transcribe, record, store, and convert audio input (from various forms such as video uploads, recording feature, and more) into scores. However, I believe that they lack the community and personal relationship from user to company. By adopting a similar user interface, relationship building, and connection reinforcement as Duolingo, “Transcribe” would cultivate a tool that appeals to users of all music expertise levels promoting the use of our score learning tool.

Products that overlap (What can you learn from those, how can they contribute to your ideas?):
Melody Scanner possesses a clear, concise, and well-articulate user interface that provides a warm, comforting feeling to the user. Melody Scanner’s interface and overall look promotes a casual learning environment that strays away from how “intimidating” music sheets can appear. 

Score Cloud seems to possess a great interface for the user editor tool. It is clear and has enough negative space to allow the user to explore the tools and features without being bombarded with information. 

Muse Score probably has one of the simplest music sheet design layouts that could appear easy to learn and navigate through. They possess great visuals that complement the intention of the software tool.

In essence, I believe balancing out the visual aspect, simple design outlook, and functionality of the app would be most convenient and sensible to adopt from these similar apps. Additionally, we hope to adapt Duolingo’s “journey” interface integrated with the simplistic look of this software app. We hope to cultivate an atmosphere/environment that does not intimidate users with difficult visuals or information form the get-go. On a business perspective, we hope to have an affordable pricng model that offers free services to beginner uses, thus charging for bigger scale corporations or companies such as schools.

NOTE: This last one is due 10 March, but start now
EX04_01 – Pick one small piece of functionality, and implement it. 


![image](https://user-images.githubusercontent.com/100454212/222329812-fb6730df-a278-4ab0-a27c-72267e414254.png)

