function makeSubmit() {
    if (arguments.length === 0) {
        document.getElementById("submitButton").click();
    } else {
        document.getElementById("submitButton" + arguments[0]).click();
    }

}