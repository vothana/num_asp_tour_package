<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Controls_Header" %>

        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar-fixed-top ">
        <div class="container-fluid p-3" style="background-color: black";>
            <a class="navbar-brand text-white" href="Index.aspx">NUM ASP.NET</a>
            <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                    <li class="nav-item text-white">
                        <a class="nav-link active text-white" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Support</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tour
                        </a>
                        <ul class="dropdown-menu text-white">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" aria-disabled="true">About</a>
                    </li>
                </ul>
                    <input   ID="searchBox"  class="form-control me-2" type="text" placeholder="Search" >
                    <button ID="btnSubmit" class="btn btn-outline-success" type="submit" onclick="clickEd()">Search</button>
            </div>
        </div>
    </nav>

<script>
    var searchBox = document.getElementById('searchBox').value;

    searchBox.addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            event.preventDefault();
            document.getElementById("btnSubmit").click();
        }
    });

    function clickEd() {
        const currentUrl = window.location.origin;
        const path = window.location.pathname;

        var searchBox1 = document.getElementById('searchBox').value;
        
        console.log(currentUrl);
        if (path.includes("Admin")) {
            window.location.assign(currentUrl + "/" + path.split("/")[1] + "\\Admin\\Index.aspx?search=" + searchBox1)
        } else {
            window.location.assign(currentUrl + "/" + path.split("/")[1] + "\\Index.aspx?search=" + searchBox1)
        }
    }
</script>