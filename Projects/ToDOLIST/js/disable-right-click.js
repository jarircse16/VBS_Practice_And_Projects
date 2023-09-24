// disable-right-click.js

// Function to disable right-click
function disableRightClick(event) {
    event = event || window.event; // Ensure event object exists
    if (event.preventDefault) {
        event.preventDefault();
    } else {
        event.returnValue = false; // For older versions of IE
    }

}

// Attach the contextmenu event listener to the document
if (document.addEventListener) {
    document.addEventListener("contextmenu", disableRightClick);
} else {
    document.attachEvent("oncontextmenu", disableRightClick); // For older versions of IE
}
