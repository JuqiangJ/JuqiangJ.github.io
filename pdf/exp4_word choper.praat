##target word choper with timestamp, preserve textgrid.praat
##Mark Antoniou
##modified by Juqiang
##2019 The MARCS Institute for Brain, Behaviour and Development

##What does the script do?
##Reads in a sound and textgrid, identifies which parts of the original sound have been labelled, extracts the labelled sound, appends timestamp, preserves textgrid

##form Enter directory and search string
# Be sure not to forget the slash (Windows: backslash, OSX: forward
# slash)  at the end of the directory name.
	#sentence file C:\processing\101_1.wav
	#sentence OutDirectory C:\processing\cut\
	#sentence Extension .wav
#endform

#get a list of files
	directory$ = "C:\processing\"
        outDirectory$ = "C:\processing\cut\"
	Create Strings as file list: "list", "*.wav"
	number_files = Get number of strings
	# appendInfoLine: 'number_files'
for ifile to number_files
	select Strings list
	sound$ = Get string... ifile
    	dotInd = rindex(sound$, ".")
    	soundName$ = left$(sound$, dotInd - 1)
	soundDir$ = directory$ + sound$
	textDir$ = directory$ + soundName$ + ".TextGrid"
	Read from file... 'soundDir$'
     	object_name$ = selected$ ("Sound")
     	Read from file... 'textDir$'
     #Determine the beginning and end of the token
    select TextGrid 'object_name$'
    numofutterances = Get number of intervals... 1
    emptystring$ = Get label of interval... 1 1

    for int from 1 to numofutterances
    	select TextGrid 'object_name$'
	currentlabel$ = Get label of interval... 1 int
	if currentlabel$ <> emptystring$
		startSeg = Get start point... 1 int
		labelinterval = Get interval at time... 1 startSeg
		currentlabel$ = Get label of interval... 1 labelinterval

		timestamp$ = fixed$('startSeg',0)
		if startSeg<100
			timestamp$ = "00'timestamp$'"
		elsif startSeg<1000
			timestamp$ = "0'timestamp$'"
		endif

		endSeg = Get end point... 1 int

		#Include 100 ms before and after to preserve boundary in TextGrid
		startCut = startSeg - 0.1
		endCut = endSeg + 0.1

		#Extract word, rename object
       		select Sound 'object_name$'
    		Edit
    		editor Sound 'object_name$'
    		   Select... 'startCut' 'endCut'
    		   Extract selected sound (preserve times)
		   Close
		endeditor


		#Scale intensity... 73.67
		#remove silence from id
		int_new = int/2
		#int_str$ = string$ (int_new)
		#newName$ = 'soundName$'+'int_str$' 
		#Rename... 'newName$'
    		#Save the newly chopped soundfile
    		#Write to WAV file... 'outDirectory$''fileid$'_'timestamp$'_'currentlabel$'.wav
		Write to WAV file... 'outDirectory$''soundName$'_'int_new'_'currentlabel$'.wav

		#currentPraatLabel$ = selected$ ("Sound")

		#Extract the TextGrid information
    		select TextGrid 'object_name$'
    		Extract part... 'startCut' 'endCut' no
    		select TextGrid 'object_name$'_part
    		#Write to text file... 'outDirectory$''fileid$'_'timestamp$'_'currentlabel$'.TextGrid
    		Write to text file... 'outDirectory$''soundName$'_'int_new'_'currentlabel$'.TextGrid

	endif



	endfor
	
endfor

#Let the user know that it's all over

	#Empty Praat Objects window
	select all
	Remove
	clearinfo
print All files have been chopped.
printline This is where you'll find them:
printline 'outDirectory$'
