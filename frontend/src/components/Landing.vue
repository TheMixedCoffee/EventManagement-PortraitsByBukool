<template>
    <div>
        <!-- Hover CSS by Ian Lunn with some of my tweaks-->
        <link href="../pages/css/hover.css" rel="stylesheet" media="all">

        <!-- Our CSS -->
        <link rel="stylesheet" href="../pages/css/landing.css">
        <div class="main">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light pad">
            <a class="navbar-brand brand" href="#">
                <img src="../../public/pages/img/sunlogo(original).png" width="110" height="100" alt="">
                Portraits By Bukool
                <!-- <img src="./img/newLogo(test).png" width="300" height="200" alt=""> -->
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse nav-links navbar-collapse flex-column" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto navFont first-row">
                    <li class="nav-item active navSpace">
                        <a class="nav-link black-link" href="/">HOME</a>
                    </li>
                    <li class="nav-item navSpace">
                        <a class="nav-link black-link letter-spacing" href="/about">ABOUT</a>
                    </li>
                    <li class="nav-item navSpace">
                        <a class="nav-link black-link" href="/packages">PACKAGES</a>
                    </li>
                    <li class="nav-item navSpace">
                        <a class="nav-link black-link" href="/contact">CONTACT</a>
                    </li>
                    <li class="nav-item navSpace">
                        <a class="nav-link black-link" href="/login">LOGIN</a>
                    </li>
                </ul>
                <div class="container second-row flex-row mb-2">
                    <div class="search ml-auto mr-sm-2">
                        <div class="alignRight">
                            <i class="fas fa-search icon"></i>
                        </div>
                        <input class="search-input" type="text">
                    </div>
                    <div class="nav-item ext-social">
                        <a href="https://www.facebook.com/PortraitsByBukool/">
                            <img src="../../public/pages/img/facebook.png" width="24" height="24" alt="facebook">
                        </a>
                    </div>
                    <div class="nav-item socials">
                        <a href="https://twitter.com/bukool8">
                            <img src="../../public/pages/img/twitter.png" width="24" height="24" alt="twitter">
                        </a>
                    </div>
                    <div class="nav-item socials">
                        <a href="https://bukool.tumblr.com/">
                            <img src="../../public/pages/img/tumblr.svg" width="22" height="23" alt="tumblr">
                        </a>
                    </div>
                    <div class="nav-item socials">
                        <a href="https://www.linkedin.com/in/unavailable/">
                            <img src="../../public/pages/img/linkedin.svg" width="22" height="23" alt="flinkedin">
                        </a>
                    </div>
                </div>
            </div>
        </nav>

    
        <div class="first-section">
            <div class="container-fluid first-section-main">
                <div class="row">
                    <div class="column left-side">
                        <img class="main-pic" src="../../public/pages/img/gareth&tricia.jpg" alt="">
                    </div>
                    <div class="column right-side">
                        <img class="first-right" src="../../public/pages/img/rings1.jpg" alt="">
                        <img class="second-right" src="../../public/pages/img/bouqet1.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="second-first-section first-section-main">
                <div class="row2">
                    <div class="col col-right">
                        <div class="thumbnail-color">
                            <img class="" src="../../public/pages/img/gareth&tricia2.jpg" alt="">
                            <div class="centerText"><a class="thumbnail-link hvr-outline-out" href="#">Wedding</a></div>
                        </div>
                    </div>
                    <div class="col col-right">
                        <div class="thumbnail-color">
                            <img class="" src="../../public/pages/img/debut.jpg" alt="">
                            <div class="centerText"><a class="thumbnail-link hvr-outline-out" href="#">Debut</a></div>
                        </div>
                    </div>
                    <div class="col col-right">
                        <div class="thumbnail-color">
                            <img class="" src="../../public/pages/img/portrait.jpg" alt="">
                            <div class="centerText"><a class="thumbnail-link hvr-outline-out" href="#">Portrait</a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="thumbnail-color">
                            <img class="" src="../../public/pages/img/event.jpg" alt="">
                            <div class="centerText centerText-adjust"><a class="thumbnail-link hvr-outline-out" href="#">Events</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <hr class="divider">
        <div class="second-section">
            <div class="head-article">
                <div class="title">
                    <h1>Roman & Kristina Wedding</h1>
                </div>
                <div class="date">
                    <h2>2020/10/22</h2>
                </div>
            </div>
            <div class="content">
                <p>
                    At this time last year and the previous years, people would be getting ready to attend weddings.
                    Getting busy selecting the best suits and gowns, ordering gifts for the couple, writing messages,
                    travel out of town, etc. But 2020 is different. Quarantine protocols have been put in place to
                    prevent the spread of COVID-19 have made large gatherings impossible.
                </p>
                <p>
                    Roman and Kristina originally planned a garden wedding earlier this year. But due to the global
                    pandemic, it didn’t go as planned. However, it did not stop them from pushing with their plans to
                    get married despite it all. Against all odds, they changed the way we cover weddings. No preparation
                    shots, no makeup artists, no host, no reception. Just the church wedding ceremony itself. Attended
                    by no more than 30 people inside the Sacred Heart Parish with the rest of the guests (families and
                    friends) attending via Zoom live streaming, a service we introduce for events such as these during
                    the pandemic.
                </p>
            </div>
            <div class="article-img">
                <img src="../../public/pages/img/roman&kristina.png" alt="">
            </div>
        </div>
        <hr class="divider">
        <div class="recent-post">
            <h2>Recent Post</h2>
        </div>
        <hr class="divider">
        <div class="recents">
            <div id="carouselExampleControls" class="carousel slide carousel-slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100 img-fluid" src="../../public/pages/img/nick&anna.jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Nick and Anna</h5>
                            <p>2020/01/21</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 img-fluid" src="../../public/pages/img/gareth&tricia3.jpg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Gareth and Tricia</h5>
                            <p>2020/02/07</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 img-fluid" src="../../public/pages/img/josephandmaze.jpg" alt="Third slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Joseph and Maze</h5>
                            <p>2019/07/26</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 img-fluid" src="../../public/pages/img/marlouandcynthia.jpg" alt="Fourth slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Marlour and Xccysthiae</h5>
                            <p>2019/06/29</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 img-fluid" src="../../public/pages/img/zamandanni.jpg" alt="Fifth slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Zam and Annie</h5>
                            <p>2019/04/29</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
    <footer>
        <div class="footer-top">
            <div class="first-part">
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-xs-12 segment-one">
                        <h1>Don't Miss out</h1>
                        <p>
                            Sign Up to Subscribe to Portraits by Bukool and receive
                            notifications of our new posts by email
                        </p>
                        <form action="/register">
                            <div class="form-row">
                              <div class="form-group col-md-6">
                                <label for="inputEmail4">Email Address</label>
                                <input type="email" class="form-control" id="inputEmail4" placeholder="Enter your email address">
                              </div>
                              <div class="form-group col-md-6">
                                <label for="inputPassword4">Birthday</label>
                                <input type="text" class="form-control" id="inputPassword4" placeholder="MM/DD/YY">
                              </div>
                            </div>
                            <button type="submit" class="hvr-grow btn btn-primary">Sign up</button>
                        </form>
                    </div>          
                    <div class="col-md-2 col-sm-6 col-xs-12 segment-two">
                        <h2>Company</h2>
                        <ul>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Managers</a></li>
                            <li><a href="#">Employees</a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-sm-6 col-xs-12 segment-three">
                        <h2>Services</h2>
                        <ul>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Rates and Packages</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 segment-four">
                        <h2>More to Explore</h2>
                        <ul>
                            <li><a href="#">Recent Posts</a></li>
                            <li><a href="#">Terms and Condition of Contract</a></li>
                            <li><a href="#">Terms of Use</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <hr class="hr-footer">
            <div class="copyright">
                <img src="../../public/pages/img/copyright.png" width="15" height="15" alt="">
                <p>2020 Portraits by Bukool</p>
            </div>
        </div>
    </footer>
    </div>
</template>

<script type="text/javascript">
    import $ from 'jquery';
    $(document).ready(function () {
        $('.carousel').carousel({
            interval: 2000,
            keyboard: true,
            pause: "hover",
        })
    });  
</script>

<script>
export default {
    name: "Landing",
}
</script>