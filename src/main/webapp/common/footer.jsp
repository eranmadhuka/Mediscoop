<!-- Footer -->
<footer class="container-fluid footer py-5">
   <div class="container">
      <div class="row">
         <div class="col-lg-6 col-md-12 col-sm-12 pe-5 footer-left">
            <img src="<%=request.getContextPath()%>/assets/images/logo.png" alt="logo" />
            <p class="text-light">
               Lorem Ipsum is simply dummy text of the printing and typesetting
               industry. Lorem Ipsum has been the industry's standard dummy text
               ever since the 1500s, when an unknown printer took a galley of
               type and scrambled it to
            </p>
            <h3 class="mt-4 text-light">Subscribe Newsletter</h3>
            <form action="#">
               <div class="form-floating mb-3">
                  <input
                     type="email"
                     class="form-control form-control-sm"
                     id="floatingInput"
                     placeholder="name@example.com"
                     />
                  <label for="floatingInput">Enter Email address</label>
               </div>
               <button type="submit" class="btn btn-main">Submit</button>
            </form>
            <h3 class="mt-4 text-light">Acceptable Payments</h3>
            <img src="<%=request.getContextPath()%>/assets/images/footer-fift-payment.png" alt="" />
         </div>
         <div class="col-lg-6 col-md-12 col-sm-12 ps-3 footer-right mt-3">
            <h3 class="text-dark">Quick Links</h3>
            <ul class="d-flex">
               <li class="nav-item"><a href="index.html">Home</a></li>
               <li class="nav-item ms-3"><a href="#">Services</a></li>
               <li class="nav-item ms-3"><a href="#">About Us</a></li>
               <li class="nav-item ms-3"><a href="#">Blog</a></li>
               <li class="nav-item ms-3"><a href="#">Contact Us</a></li>
            </ul>
            <h3 class="text-dark pt-5">Contact</h3>
            <div class="row">
               <div class="col-md-4">
                  <div class="contact-fifteen">
                     <div class="contact-form-fift">
                        <i class="ri-phone-fill"></i>
                     </div>
                     <div class="contact-content-fift">
                        <h4>Phone</h4>
                        <span>180042657678</span>
                     </div>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="contact-fifteen">
                     <div class="contact-form-fift">
                        <i class="ri-mail-line"></i>
                     </div>
                     <div class="contact-content-fift">
                        <h4>Email</h4>
                        <span>Dre@exple.com</span>
                     </div>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="contact-fifteen">
                     <div class="contact-form-fift">
                        <i class="ri-map-pin-2-fill"></i>
                     </div>
                     <div class="contact-content-fift">
                        <h4>Location</h4>
                        <span>Colombo</span>
                     </div>
                  </div>
               </div>
            </div>
            <h3 class="text-dark pt-2">Language and Social</h3>
            <div class="row">
               <div
                  class="social-icon d-flex align-items-center justify-content-start pt-2"
                  >
                  <a href="#"><i class="fs-4 ri-facebook-fill"></i></a>
                  <a href="#"><i class="fs-4 ri-instagram-fill"></i></a>
                  <a href="#"><i class="fs-4 ri-youtube-fill"></i></a>
                  <a href="#"><i class="fs-4 ri-linkedin-fill"></i></a>
                  <a href="#"><i class="fs-4 ri-twitter-fill"></i></a>
               </div>
            </div>
            <hr />
            <div class="row d-flex justify-content-between">
               <div class="col-md-6 col-sm-6">
                  <p>� 2023 Mediscoop. All rights reserve.</p>
               </div>
               <div class="col-md-6 col-sm-6 text-end">
                  <a href="#" class="me-2">Terms</a>
                  <a href="#">Privacy Policy</a>
               </div>
            </div>
         </div>
      </div>
   </div>
</footer>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
   crossorigin="anonymous"
   ></script>
<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>