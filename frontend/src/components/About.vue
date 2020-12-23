<template>
    <div>
        <link rel="stylesheet" href="../pages/css/landing.css">
        <link rel="stylesheet" href="../pages/css/about.css">
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
                    <li class="nav-item navSpace">
                        <a class="nav-link black-link" href="/">HOME</a>
                    </li>
                    <li class="nav-item active navSpace">
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
        
        <div class="about-header">
            <img src="../../public/pages/img/about-us-bg.jpg" width="1200px" height="400px" alt="">
            <div class="text-center header-text">
                <h1 class="about-us forum">ABOUT US</h1>
                <h1 class="display-2 poiret about-title">PORTRAITS BY BUKOOL</h1>
                <span class="tagline opensans">We don't wait for a moment. We create one.</span>
            </div>
        </div>
        
        <div class="row">
            <div class="col-sm-4">
                <img src="../../public/pages/img/about-jeriel&nikka.jpg" width="100%" height="100%" alt="">
            </div>
            <div class="col-sm-8 about-content opensans">
                <div class="nextline">
                    Photographs are the only visual representation of your wedding and they play a 
                    vital role in capturing the vivid memories of your wedding for years to come. 
                    All the preparation, all the work, all the planning, everything leads up to this moment.  
                    Our job as a wedding photographer is to make sure we capture those priceless moments of 
                    your life.
                </div>
                <div class="nextline">
                    Our style is a combination of photojournalism and modern wedding photography. 
                    And it allows us to capture outstanding and timeless images that are spontaneous and real. 
                    It’s a collaborative effort – we still let things happen naturally and we also give you a 
                    bit of direction. As we never wait for a moment. We create one.
                </div> 
                <div class="nextline">
                    Our commitment is to provide a high level of quality, personal service and professionalism 
                    that would definitely exceed your expectations. We devote the amount of time and attention 
                    that each of our couples deserve.
                </div>
            </div>
        </div>
        <hr class="divider">
        <div class="missionvision text-center">
            <h1 class="forum">Our Mission</h1>
            <p class="opensans">
                To provide the highest level of professionalism, dedication, commitment and 
                the best quality service at very affordable costs.
                <br>
                We make this possible by constantly improving our standards as we welcome 
                new ideas and explore new technology. 
                <br> We believe that quality should be first 
                in every area, thus the need to continuously improve and never stop improving.
            </p>
        </div>
        <hr class="divider">
        <div class="missionvision text-center">
            <h1 class="forum">Our Mission</h1>
            <p class="opensans">
                To be recognized as one of the leaders in the industry.
            </p>
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
                        <form>
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

<script>
export default {
    name: "About",
}
</script>