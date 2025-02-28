Having to make json manually is shitty and spotty and [the one program to do this](https://github.com/awsker/Tes3MpPluginHelper) I found is windows only, works badly in wine, and didn't always generate the correct crc.

# Read the bash file to see which lines you need to edit. It's just two filepaths.
Caveats:

 - There's several methods that give diferent results, so this script sometimes gives two separate checksums to a single file. This is intended. I don't know which algorithm tes3mp uses but it's not exactly the same as the other program, which sometimes gives wrong CRCs as a result, so this just adds both crc's when that happens.
 - I don't care enough to check which file the engine actually loads[^1]  when there's multiple instances of the file in the data folders. Because of this, I just checksum all the files. Which is to say you can have an arbitrary amount of checksums per file. Fun! It doesn't mater. One of them should be the correct one.
 - The python needs some libraries, which I'm too lazy to alt tab to check. Feel free to PR this file with an edit that actually lists them!



[1]: It's semitrivial but the command line would get long, and thus breaky, in the bruteforcey way and I'm lazy. Feel free to send a pull request if you add that if you want to tackle it. Something something search in every directory for the thing sequentially, and overwrite it when it finds another instance? It'd slow things down considerably. Massively multiplied operations per file.
