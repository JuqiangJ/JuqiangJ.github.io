---
layout: page
title: Speech Analysis and Synthesis
subtitle: Understanding what appears to be obvious! 
---
Terms are difficult to understand and may serve as important nodes in the web of knowledge. I made some  notes about some key terms in phonetics and phonology as I was reading relevant textbooks. 

# Phonetics
## Acoustic phonetics ( Excerpts from Johnson 2003)
<br>
**The source-filter theory of speech production \(Fant, 1960; Flanagan, 1965\)**
Vocal fold vibration is the usual source of sound in vowels and the vocal tract is an acoustic filter that modifies the sound made by the vocal folds. Harmonics in the voice source that have nearly the same frequency as the vocal tract resonances are enhanced and the components of the source that do not have frequencies near a resonance are damped.
<br>
**Fundamental frequency (F0)**
<br>
When the vocal folds vibrate, they produce a complex periodic wave with a nonsinusoidal repeating pattern. The number of times that this complex periodic waveform repeats per second determines its fundamental frequency (F0) and is related to the listener’s perception of the pitch of the voice. 
<br>
**male: 100Hz; female: 200 Hz**
<br>
**Harmonics v.s. fundamental frequency**
<br>
A Fourier analysis of the voicing waveform gives us a power spectrum, showing the *component frequencies* (harmonics) and their amplitudes. The fundamental frequency is the first (lowest-frequency) peak in the *power spectrum* and each of the other harmonics is at a multiple of the fundamental frequency.
**Harmonics** are resonances that naturally occur at natural multiples of f0.
The relative amplitudes of the first and second harmonics are related to phonation type.
<br>
**Quantal theory of speech \(Stevens, 1972\)**
<br>
Languages do not use the full range of possible speech articulations to distinguish words because the mapping between articulation and acoustics is nonlinear. There are regions of stability in the articulation-to-acoustics mapping. For example, speakers can choose any one of several possible glottal widths and still producing voicing. Thus the natural nonlinearity in the mapping from articulation to acoustic output leads to natural classes of speech sounds. A full inventory of nonlinearities in the articulation-to-acoustics mapping would express the inventory of distinctive phonetic features that can be used to distinguish meaning in the language.
<br>
**Standing wave v.s Nodes v.s. Antinodes**
At the midpoint of the tube, pressure remains zero, equal to atmospheric pressure, while at the  ends of the tube pressure oscillates between positive and negative peaks. This pattern is known as a *standing wave*.
The point in the middle of the tube where pressure remains zero is called a *node* while the points at the ends of the tube where pressure reaches both positive and negative maxima are called *antinodes*. Nodes are indicated by the intersection of the since waves and antinodes by their peaks.
**Calculating the resonance frequency**
<br>
Wave length (λ) = c(the speed of sound) × T(period)
<br>
*Wavelength* is the distance between consecutive areas of high pressure.
<br>
Frequency (f) = 1/T = c/ λ
<br>
The wavelength of the first resonance is twice the length of the tube. (two closed end)
<br>
The resonance frequency: f = c/2L × n
<br>
One end open: f =  c/4L×(2n-1)
<br>
**Formants**
The resonant frequencies of the vocal tract are also called *formants*. People with short vocal tracts have higher formants than people with long vocal tracts. Male vocal tract (17.5 cm) has the first formant as 500 Hz and the second formants as 1500 Hz. This is a *schwa*.
<br>
All formants have a lower frequency because lip protrusion and larynx lowering lengthen the vocal tract.
<br>
**Measuring formant frequency in vowels: zero-padded FFT & linear prediction coding (LPC)**
<br>
LPC uses an auto-correlation technique to find prominent frequency components in the speech spectrum by taking a small duration of an acoustic waveform (less than one glottal period). In this way, it captures periodicities in the speech waveform produced by formant resonance by formant resonances.
<br>
## Speech signal recording and processing (R&A, p.130)
<br>
**Continuous v.s. discrete signal & analog v.s. digital**
The air pressure variations of speech sound may be any value (within a large range) at any time. This kind of signal is called *continuous*. In recording a signal, the membrane of a microphone moves along with the sound pressure of a sound signal, thus generating an electrical signal that is *analog* to the air pressure. In this case, both the movement of the membrane and the ensuing electrical signal are continuous in nature.
<br>
A digital computer can only represent a finite number of discrete states. When it reads in the  signal from the microphone, it translates the continuous signal into a finite number of digital values. The distance between these values may be extremely small but in principal a digital computer cannot represent all possible values. Two dimensions of speech signal are digitized by a computer, time and amplitude.
<br>
**Sampling rate & the Nyquist criterion**
<br>
Sampling rate is the number of sampling in a second. In theory, a signal can be correctly digitized if the sampling rate is at least twice the highest frequency in the signal \(the Nyquist criterion\). The *Nyquist frequency* is half the sampling rate. If the signal contains frequencies above the Nyquist frequency, “fake” signals may occur (aliasing).
<br>
To prevent undersampling, an anti-aliasing filter is used before signals are digitized by suppressing any frequencies above half the sampling rate. This filter is often built into the audio hardware of a computer and is automatically controlled by the software. The sampling rate for CD is 44.1 kHz.

**Quantizing resolution**
The resolution in the amplitude domain (quantizing resolution) is conveniently measured by means of the DB scale. In modern phonetic practice, signals are digitized with the amplitude range divided into 216 steps. (16 bit resolution) This gives a total range of 96 DB but often only 35 to 50 DB is used.

**Pure tone/sine wave v.s. complex signal v.s. quasi-periodic signals v.s. noise v.s. impulse**
The acoustic signal produced by a simple periodic oscillation is called a *pure tone or sine wave*. A *complex signal* is periodic and it can be formed by adding up a number of sine signals.
<br>
*Quasi-periodic signals* continuously undergo small changes and no two signals are exactly the same in terms of the frequencies, amplitudes and phase relations of their sine components. In this case, a certain periodicity can be detected in terms of the similarity between two signal parts. But in a strictly physical sense, this is not correct.
<br>
*Noise* is very irregular and not periodic or even quasi-periodic. It has a certain amplitude and timbre.
*An impulse* is even more aperiodic and consists of a sudden irregularity with relatively high amplitude, preceded and followed by silence. 
<br>
**Timbre**
<br>
Timbre is the quality of a sound and it can distinguish two sounds with identical pitch and loudness. The difference in timbre between two complex signals is due to the sine signals/sine components that make up the sound and to their frequency, amplitude and phase relations.
<br>
**Fourier synthesis v.s. Fourier analysis**
<br>
The construction of complex periodic signals as a combination of sine signals is called *Fourier synthesis*. At a given point in time, both displacements are on the same side of the zero-line, their sum is greater than each of the separate displacement. If they are on the opposite side of the zero-line, their sum is smaller than each of the separate displacements. By adding up sine signals with the right combination of frequencies, amplitudes, and phases, any periodic signal may be constructed.
Fourier synthesis can be reversed by means of the *Fourier analysis*. Any periodic signal can be decomposed into separate sine signal which are uniquely defined by their frequencies, amplitudes and phases.  Only a unique combination of sine signals produces exactly the same signal and Fourier analysis is able to find this combination.

**Oscillogram v.s. frequency power spectrum**
