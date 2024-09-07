<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  </head>
  <body>
	  <div class="container mt-5 ">
	    <h1 class="text-center">TODO APP</h1>
	    	<div class="row">
	    		<div class="col-md-2">
	    			<div class="list-group">
	    			  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">Menu</a>	
					  <button type="button" class="list-group-item list-group-item-action" onclick="addToDo()">Add TODO</button>
					  <button type="button" class="list-group-item list-group-item-action" onclick="getAllToDo()">View All TODO</button>
<!-- 					<a href="getData" class="list-group-item list-group-item-action">  view ToDo </a> -->
					</div>
	    		</div>
	    		
	    		<div class="col-md-10 d-none" id="class1">
						<form class="d-block" id="formId">
							<div class="form-group">
								<div class="form-check">
									<input class="form-control" type="text" id="title" name="title" placeholder="Enter Title.." required> 
								</div>	
							</div>
							<div class="form-group mt-4">
								<div class="form-check">
							  		<textarea class="form-control" name="details" placeholder="Details" id="details" style="height: 100px" required></textarea>
								</div>
							</div>
							<div class="container mt-3 text-center">
								<button type="button" class="btn btn-outline-success" onclick="saveData()">ADD TODO</button>
							</div> 
					   	</form>	    			
	    		</div>
	    		
	    		<div class="col-md-10 d-none mt-3" id="class2">
	    		</div>
	    	</div>
	  </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  	<script type="text/javascript">
	  	$(document).ready(function(){
// 	  		console.log(${list}[0])
	  	})
	  	
	  function addToDo(){
	  		$("#class2").addClass("d-none");
	  		$("#class1").removeClass("d-none");
	  	}
    function saveData() {
        var formData = $('#formId').serialize(); // Serialize form data
        $.ajax({
            url:"http://localhost:8086/TODO/saveData/",  
            type: 'POST',
            data: formData,
            success: function(response) {
                console.log(response)
                $('#title').val(''); 
                $('#details').val(''); 
            },
            error: function(xhr, status, error) {
                console.log('Error:', error);
            }
        });
    }
    
    function getAllToDo() {
        $("#class1").addClass("d-none");
        $("#class2").removeClass("d-none");
        $.ajax({
            type: "GET",
            url: "http://localhost:8086/TODO/getData",
            success: function (list) {
                $("#class2").empty();
                if(list!=null && list!=""){
	                $.each(list, function (index) {
	                    var card = $('<div/>').addClass("card mb-3 ");
	                    var cardBody = $('<div/>').addClass("card-body d-flex flex-column");
	                    var title = $('<h4/>').text(list[index].title);
	                    var details = $('<h5/>').text(list[index].details);
	                    var button = $('<button/>').attr("onClick","deleteItem("+list[index].id+",this.parentElement.parentElement)").addClass("btn btn-danger mt-auto align-self-end").text("Delete");
	//                        var button = $('<a/>').addClass("btn btn-danger ms-auto align-self-end").attr('href','/TODO/delete/'+list[index].id).text("Delete");
	                       console.log(button)
	                    cardBody.append(title, details,button);
	                    card.append(cardBody);
	                    $("#class2").append(card);
	                });
                }
                else{
                	$("#class2").empty();
                	var card = $('<div/>').addClass("card mb-3 ");
                    var cardBody = $('<div/>').addClass("card-body d-flex flex-column");
                    $("#class2").append(card.append(cardBody.append($('<h3/>').addClass("text-center").text("No Data Found"))));
                }
            },
            error: function () {
                console.error('Failed to fetch data.');
            }
        });
    }
    
    function deleteItem(id,card){
    	$.ajax({
    		type:"GET",
    		url:"${pageContext.request.contextPath}/delete/"+id,
    		success:function(data){
    			card.remove();
    		},error:function(){
    			
    		}
    	})
    }
</script>

  </body>
</html>