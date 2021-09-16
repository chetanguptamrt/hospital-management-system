function deleteProfile(){
    var f = confirm("Do you want to delete your profile?\nAre u sure?");
    if(f){
        location.href="./deleteUserAccount.jsp?idF="+f;
    }
}
$(document).ready(function(){
    $("#patientForm").on('submit',function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./AddPatientServlet",
            method: "post",
            data: f,
            success: function(data){
                if(data.trim()==="done"){
                    location.reload();
                }
                else{
                    alert("Something went wrong!");
                }
            },
            error: function(){
                alert("Something went wrong!");
            }
        });
    });
    
    $("#changePass").on('submit',function(event){
        event.preventDefault();
        if($("#npid").val()===$("#cpid").val()){
            var f = $(this).serialize();
            $.ajax({
                url: "./ChangePasswordServlet",
                method: "post",
                data: f,
                success: function(data){
                    if(data.trim()==="done"){
                        $("#changeStatus").show();
                        $("#changeStatus").removeClass("text-danger");
                        $("#changeStatus").addClass("text-success");
                        $("#changeStatus").html("Password change successfully");
                    }
                    else if(data.trim()==="notMatched"){
                        $("#changeStatus").show();
                        $("#changeStatus").removeClass("text-success");
                        $("#changeStatus").addClass("text-danger");
                        $("#changeStatus").html("Password doesn't match");
                    }
                    else{
                        $("#changeStatus").show();
                        $("#changeStatus").removeClass("text-success");
                        $("#changeStatus").addClass("text-danger");
                        $("#changeStatus").html("Something went wrong!");
                    }
                },
                error: function(){
                    $("#changeStatus").show();
                    $("#changeStatus").removeClass("text-success");
                    $("#changeStatus").addClass("text-danger");
                    $("#changeStatus").html("Something went wrong!");
                }
            });
        }
        else{
            $("#changeStatus").show();
            $("#changeStatus").removeClass("text-success");
            $("#changeStatus").addClass("text-danger");
            $("#changeStatus").html("New password and Confirm password doesn't match");
        }
    });
});