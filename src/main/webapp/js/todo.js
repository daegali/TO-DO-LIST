function btn_click(id,type){
      var xhr = new XMLHttpRequest();
      xhr.onload = function() {
           if (xhr.status === 200 || xhr.status === 201) {
             console.log("success");
           } else {
             console.error(xhr.responseText);
           }
      };
      xhr.open("POST", "TodoTypeServlet", true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xhr.send("id="+id+"&type="+type);
<<<<<<< HEAD
   }


function buttonDelete(id, type){
	  var xhr = new XMLHttpRequest();
	 xhr.addEventListener("load", function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			if (xhr.status === 200){
				window.location.reload();
			}
		}
	});
	
	xhr.open("POST", "TodoDeleteServlet");
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send("type=" + type + "&id=" + id);

}

=======
   }
>>>>>>> parent of 27624fc (Ajax 비동기 처리 아직 미구현 차 후 공부 후 구현 할 예정)
