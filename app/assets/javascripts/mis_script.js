function traerUsuarios(){

    $.ajax({
     type:"POST",
     dataType:"json",
     url:"/users/traer",
     data:{'id':$('#identidadId').val()},
     success: function(resp){
         var combo=$('#user_identidad');
         combo.empty();
         for(i=0;i<resp.length;i++){
             combo.append('<option value="'+resp[i]['id']+'" >'+resp[i]['nombre']+' </option>' );
          }
     },
     error: function(){
        alert("falla consultando clientes/empleados");
     }
   });
 }