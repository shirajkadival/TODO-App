<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	  <div class="container mt-5 text-center">
	    <h1>TODO APP</h1>
	    	<div class="row">
	    		<div class="col-md-2">
	    			<div class="list-group">
					  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
					    Add ToDo
					  </a>
					  <button type="button" class="list-group-item list-group-item-action" onclick="getAllToDo">View All TODO</button>
					</div>
	    		</div>
	    		<div class="col-md-10">
						<form action="" id="formId">
							<div class="form-group">
								<div class="form-check">
									<input class="form-control" type="text" id="title" name="title" placeholder="Enter Title.."> 
								</div>	
							</div>
							<div class="form-group mt-4">
								<div class="form-check">
							  		<textarea class="form-control" name="details" placeholder="Details" id="details" style="height: 100px"></textarea>
								</div>
							</div>
							<div class="container mt-3">
								<button type="button" class="btn btn-outline-success" onclick="saveData()">ADD</button>
							</div> 
					   	</form>	    			
	    		</div>
	    	</div>
	  </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  	<script type="text/javascript">
// 	  	$(document).ready(function(){
// // 	  		alert("hey")
// 	  	})
	  	
    function saveData() {
        var formData = $('#formId').serialize(); // Serialize form data

        $.ajax({
            url:"http://localhost:8086/TODO/saveData/",  
            type: 'POST',
            data: formData,
            success: function(response) {
                alert(response);
            },
            error: function(xhr, status, error) {
                console.log('Error:', error);
            }
        });
    }
</script>

  </body>
</html>