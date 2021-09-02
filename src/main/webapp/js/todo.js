function ajax(data) {
  var oReq = new XMLHttpRequest();
  oReq.addEventListener("click", function () {
    console.log(this.responseText);
  });
}
