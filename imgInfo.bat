@if (@X)==(@Y) @end /* JScript comment
	@echo off
	
	rem :: Borrowed and modified from
	rem :: https://github.com/npocmaka/batch.scripts/blob/master/hybrids/jscript/imgInfo.bat
	rem :: Thank you to Vasil Arnaudov (github/npocmaka) for posting this

	rem :: the first argument is the script name as it will be used for proper help message
	cscript //E:JScript //nologo "%~f0" %*

	exit /b %errorlevel%
	
@if (@X)==(@Y) @end JScript comment */

FSOObj = new ActiveXObject("Scripting.FileSystemObject");
var ARGS = WScript.Arguments;
if (ARGS.Length < 1 ) {
 WScript.Echo("No file passed");
 WScript.Echo("Usage:");
 WScript.Echo(" Image");
 WScript.Quit(1);
}
var filename=ARGS.Item(0);

if (!FSOObj.FileExists(filename)){
	WScript.Echo("File "+filename+" does not exists");
	WScript.Quit(2);
}

function ID2Format(id){
    var ids={};
    ids["{B96B3CAB-0728-11D3-9D7B-0000F81EF32E}"]="BPM";
    ids["{B96B3CAF-0728-11D3-9D7B-0000F81EF32E}"]="PNG";
    ids["{B96B3CB0-0728-11D3-9D7B-0000F81EF32E}"]="GIF";
    ids["{B96B3CAE-0728-11D3-9D7B-0000F81EF32E}"]="JPG";
    ids["{B96B3CB1-0728-11D3-9D7B-0000F81EF32E}"]="TIFF";
    
    return ids[id];
}

var img=new ActiveXObject("WIA.ImageFile");
try {
	img.LoadFile(filename);
}catch(err){
	WScript.Echo("Probably "+ filename + " is not an image");
	WScript.Echo(err.message);
	WScript.Quit(3);
	
}


WScript.Echo(img.Width+" x "+img.Height);

