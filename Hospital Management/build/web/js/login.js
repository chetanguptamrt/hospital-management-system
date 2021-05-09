function changepanel(){
    $("#loginpanel").toggle();
    $("#forgotpanel").toggle();
}
$(document).ready(function(){
    $("#loginForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./UserLoginServlet",
            method: "post",
            data: f,
            success: function(data){
                if(data.trim()==="done"){
                    location.href = "./index.jsp";
                }
                else{
                    $("#statustext").html("Invalid email or password!");
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
    
    $("#sendOTP").click(function(){
        if(document.getElementById("femail").value===""){
            $("#rstatustext").html("Invalid OTP!");
            $("#rstatus").removeClass("text-success");
            $("#rstatus").addClass("text-danger");
        }
        else{
            $.ajax({
                url: "./UserForgotOTPServlet?email="+document.getElementById("femail").value,
                method: "get",
                success: function(data){
                    if(data.trim()==="done"){
                        $("#rstatustext").html("Check your email for OTP");
                        $("#rstatus").removeClass("text-danger");
                        $("#rstatus").addClass("text-success");
                    }
                    else if(data.trim()==="noEmail"){
                        $("#rstatustext").html("Email doesn't exist!");
                        $("#rstatus").removeClass("text-success");
                        $("#rstatus").addClass("text-danger");
                    }
                    else{
                        $("#rstatustext").html("Something went wrong!");
                        $("#rstatus").removeClass("text-success");
                        $("#rstatus").addClass("text-danger");
                    }
                },
                error: function(){
                    $("#rstatustext").html("Something went wrong!");
                    $("#rstatus").removeClass("text-success");
                    $("#rstatus").addClass("text-danger");
                }
            });
        }
    });
    
    $("#forgotForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./UserForgotServlet",
            method: "post",
            data: f,
            success: function(data){
                if(data.trim()==="done"){
                    location.href = "./login.jsp";
                }
                else{
                    $("#rstatustext").html("Invalid OTP!");
                    $("#rstatus").removeClass("text-success");
                    $("#rstatus").addClass("text-danger");
                }
            },
            error: function(){
                $("#rstatustext").html("Something went wrong!");
                $("#rstatus").removeClass("text-success");
                $("#rstatus").addClass("text-danger");
            }
        });
    });
});