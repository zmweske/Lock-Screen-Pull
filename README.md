# Lock-Screen-Pull
This script copies the Windows 10 lock screen files to a location where you can sort out and keep your favorites


## How to use
1. Download `pull.bat` or clone repository. 
2. Optional: either move `pull.bat` into `C:\windows\system32` (not normally recommended and admin privileges required) or add the location of `pull.bat` to PATH environment variable
3. Optional: Change setup location inside of `pull.bat`. It is set as the variable `DIRECTORY`
4. Run `pull.bat` from anywhere. It will use the configured setup location.
5. Open the `dump\` folder and delete any advertisement/spam images that Windows downloaded and sort out favorite images. 
6. Remaining images inside `dump\` can be deleted, moved, or sorted by horizontal and vertical images. 
- It is recommended to `SHIFT + DELETE` unwanted images. It deletes them permanently but will reduce disk usage. 
- An alternative way to empty the `dump\` directory is to move unwanted images to a folder called `temp\` which will be permanently and safely emptied after running the program. 


## Generated Files/Folders:
- `lock screens\`
the main program folder containing all processed images, files, and folders  

- `trash.txt`
a list of already processed images to reduce the likelihood of getting duplicates  

- `temp\`
to be removed after operations, a temp to convert image files  

- `dump\`
where all of the processed images are placed, ready for manual sorting  

- `horizontal\` & `vertical\`
empty folders used to manually separate the 1920x1080 and 1080x1920 images  


## TODO
- [x] Automatically set up directory
- [x] Remove images that have been seen previously
- [x] Create custom setup location variable
- [ ] Automatically remake and remove temp before and after operations
- [ ] Sort images by vertical vs horizontal
