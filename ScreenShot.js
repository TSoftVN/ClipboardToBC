document.write('<body><p>Focus this tab and press <kbd>CTRL</kbd> + <kbd>V</kbd>');
document.write('<canvas style="border:1px solid grey;" id="mycanvas">');
window.addEventListener("paste", function(e){
    retrieveImageFromClipboardAsBlob(e, function SendToNAV(imageBlob){
        if(imageBlob){
            var reader = new FileReader();
            reader.onload = function () {
              var Base64Text = reader.result.replace(/^data:.+;base64,/, '');
              Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('PasteScreenShot', [Base64Text]);
            };            
            reader.readAsDataURL(imageBlob);            
        }
    });
}, false);


function retrieveImageFromClipboardAsBlob(pasteEvent, callback){
	if(pasteEvent.clipboardData == false){
        if(typeof(callback) == "function"){
            callback(undefined);
        }
    };

    var items = pasteEvent.clipboardData.items;

    if(items == undefined){
        if(typeof(callback) == "function"){
            callback(undefined);
        }
    };

    for (var i = 0; i < items.length; i++) {
        if (items[i].type.indexOf("image") == -1) continue;
        var blob = items[i].getAsFile();

        if(typeof(callback) == "function"){
            callback(blob);
        }
    }
}