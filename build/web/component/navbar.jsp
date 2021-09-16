<div class="bg-dark nav-after-resize-1" style="display: none;">
    <div class="text-right">
        <button class="navbar-toggler text-light" style="font-size: 25px" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa fa-bars" aria-hidden="true"></i>
        </button>
    </div>
    <div class="collapse" id="navbarNav" aria-labelledby="navbarDropdown">
        <a class="nav-link text-light" href="./index.jsp" >Home</a>
         
        <%
            if(session.getAttribute("userD")!=null){
        %>  
                <a class="nav-link text-light" href="./getAppointment.jsp" >Get Appointment</a>
        <%
            }
        %>
        <a class="nav-link text-light" href="./findDoctors.jsp" >Doctors</a>
        <a class="nav-link text-light" href="./service.jsp" >Service</a>
        <a class="nav-link text-light" href="./gallery.jsp" >Gallery</a>
        <a class="nav-link text-light" href="./contactUs.jsp" >Contact</a>
        
        <%
            if(session.getAttribute("userD")!=null){
        %>
                <a class="nav-link text-light" href="./profile.jsp" >Profile</a>
        <%
            }
        %>
    </div>
</div>

<%
    if(session.getAttribute("userD")==null){
%>
        <div class="container-fluid pt-1 pb-1 pr-5 top-navbar">
            <div class="text-right">
                <a href="./login.jsp" class="top-link" ><i class="fa fa-sign-in" aria-hidden="true"></i> Patient Login</a> &nbsp;&nbsp;&nbsp;
                <a href="./registration.jsp" class="top-link" ><i class="fa fa-user" aria-hidden="true"></i> Patient Registration</a>
            </div>
        </div>
<% 
    }
%>
<div class="container mt-3 mb-3">
    <div class="row">
        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
            <h2 class="brand-name brand-tag pb-3 pt-3"><i class="fa fa-heartbeat" aria-hidden="true"></i> City Hospital</h2>
        </div>
        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
            <div class="row ">
                <div class="col-md-6 col-sm-12 col-12 pb-3 pt-3 brand-tag">
                    <h5 class="brand-name"><i class="fa fa-phone-square" aria-hidden="true"></i> <span style="color: black;">CALL US NOW</span></h5>
                    <small style="color: #333333"><a class="top-link" href="tel:9876-543-321">9876-543-321</a></small>
                </div>
                <div class="col-md-6 col-sm-12 col-12 pb-3 pt-3 brand-tag">
                    <h5 class="brand-name"><i class="fa fa-phone-square" aria-hidden="true"></i> <span style="color: black;">MAIL US TODAY</span></h5>
                    <small style="color: #333333"><a class="top-link" href="mailto:support@hospital.com">support@hospital.com</a></small>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid navbar-custom-tag nav-after-resize-2">
    <div class="container pb-0">
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-custom-tag pb-0">
            <a class="nav-link black-tag home-page" href="./index.jsp" style="margin-right: 15px">Home</a>
            <%
                if(session.getAttribute("userD")!=null){
            %>
                    <a class="nav-link black-tag appointment-page" href="./getAppointment.jsp" style="margin-right: 15px">Get Appointment</a>
            <%
                }
            %>
            <a class="nav-link black-tag doctor-page" href="./findDoctors.jsp" style="margin-right: 15px">Doctors</a>
            <a class="nav-link black-tag service-page" href="./service.jsp" style="margin-right: 15px">Service</a>
            <a class="nav-link black-tag gallery-page" href="./gallery.jsp" style="margin-right: 15px">Gallery</a>
            <a class="nav-link black-tag contact-page" href="./contactUs.jsp" style="margin-right: 15px">Contact</a>
            
            <%
                if(session.getAttribute("userD")!=null){
            %>
                <a class="nav-link black-tag profile-page" href="./profile.jsp">Profile</a>
            <%
                }
            %>
        </nav>
    </div>
</div>