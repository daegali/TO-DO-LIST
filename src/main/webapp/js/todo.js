function btn_click(id,type){
      var xhr = new XMLHttpRequest();
      xhr.onload = function() {
           if (xhr.status === 200 || xhr.status === 201) {
            window.location.reload();
           } else {
             console.error(xhr.responseText);
           }
      };
      xhr.open("POST", "TodoTypeServlet", true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xhr.send("id="+id+"&type="+type);
   }






