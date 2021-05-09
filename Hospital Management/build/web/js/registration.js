$(document).ready(function(){
    $("#registrationForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./UserRegistrationServlet",
            method: "post",
            data: f,
            success: function(data){
                if(data.trim()==="done"){
                    $("#statustext").html("Check your email for OTP");
                    $("#status").removeClass("text-danger");
                    $("#status").addClass("text-success");
                }
                else if(data.trim()==="alreadyEmail"){
                    $("#statustext").html("Email Already Exist!");
                    $("#status").removeClass("text-success");
                    $("#status").addClass("text-danger");
                }
                else{
                    $("#statustext").html("Something went wrong!");
                    $("#status").removeClass("text-success");
                    $("#status").addClass("text-danger");
                }
            },
            error: function(){
                $("#statustext").html("Something went wrong!");
                $("#status").removeClass("text-success");
                $("#status").addClass("text-danger");
            }
        });
    });
    $("#otpForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./UserRegistrationOTPServlet",
            method: "post",
            data: f,
            success: function(data){
                if(data.trim()==="done"){
                    location.href = "./login.jsp";
                }
                else{
                    $("#statustext").html("OTP doesn't matched!");
                    $("#status").removeClass("text-success");
                    $("#status").addClass("text-danger");
                }
            },
            error: function(){
                $("#statustext").html("Something went wrong!");
                $("#status").removeClass("text-success");
                $("#status").addClass("text-danger");
            }
        });
    });
});