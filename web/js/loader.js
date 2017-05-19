var myVar;

function myLoading() {
    myVar = setTimeout(showPage, 300)
}

function showPage() {
  document.getElementById("loader").style.display = "none"
  document.getElementById("myDiv").style.display = "block"
}