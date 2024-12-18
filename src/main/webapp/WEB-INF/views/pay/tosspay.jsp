<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
    <link rel="stylesheet" href="assets/css/vendor.css" />
    <link rel="stylesheet" href="assets/css/style.css" />

    <title>3242uct</title>
    
  </head>
  <body>

  <script src="https://js.tosspayments.com/v2/standard"></script>
    <!-- header -->
    <header class="header header-dark bg-dark header-sticky">
      <div class="container">
        <div class="row">
          <nav class="navbar navbar-expand-lg navbar-dark">
            <a href="index.html" class="navbar-brand order-1 order-lg-2"><img src="assets/images/logo.svg" alt="Logo"></a>
            <button class="navbar-toggler order-2" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse order-3 order-lg-1" id="navbarMenu">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                <li class="nav-item dropdown megamenu">
                  <a class="nav-link dropdown-toggle" href="#!" id="navbarDropdown-4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Pages
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown-4">
                    <div class="row">
                      <ul class="col-6 col-md-3 col-lg-2">
                        <li><span class="megamenu-title">Home</span></li>
                        <li><a class="dropdown-item" href="index.html">Home - classic</a></li>
                        <li><a class="dropdown-item" href="index-carousel.html">Home - carousel</a></li>
                        <li><a class="dropdown-item" href="index-categories.html">Home - categories</a></li>
                        <li><a class="dropdown-item" href="index-modern.html">Home - modern</a></li>
                        <li><a class="dropdown-item" href="index-minimal.html">Home - minimal</a></li>
                        <li><span class="megamenu-title">Shop</span></li>
                        <li><a class="dropdown-item" href="listing-sidebar.html">Listing - sidebar</a></li>
                        <li><a class="dropdown-item" href="listing-full.html">Listing - full width</a></li>
                        <li><a class="dropdown-item" href="listing-masonry.html">Listing - masonry</a></li>
                        <li><a class="dropdown-item" href="listing-modern.html">Listing - modern</a></li>
                      </ul>
                      <ul class="col-6 col-md-3 col-lg-2">
                        <li><span class="megamenu-title">Product</span></li>
                        <li><a class="dropdown-item" href="product-classic.html">Product - classic</a></li>
                        <li><a class="dropdown-item" href="product-scroll.html">Product - scroll</a></li>
                        <li><a class="dropdown-item" href="product-masonry.html">Product - masonry</a></li>
                        <li><a class="dropdown-item" href="product-modern.html">Product - modern</a></li>
                        <li><a class="dropdown-item" href="product-promo.html">Product - promo</a></li>
                        <li><a class="dropdown-item" href="product-oos.html">Product - out of stock</a></li>
                        <li><span class="megamenu-title">Order</span></li>
                        <li><a class="dropdown-item" href="cart.html">Cart</a></li>
                        <li><a class="dropdown-item" href="cart-full.html">Cart - full width</a></li>
                        <li><a class="dropdown-item" href="checkout.html">Checkout</a></li>
                      </ul>
                      <ul class="col-6 col-md-3 col-lg-2">
                        <li><span class="megamenu-title">Account</span></li>
                        <li><a class="dropdown-item" href="portal.html">Log In</a></li>
                        <li><a class="dropdown-item" href="profile.html">Profile</a></li>
                        <li><a class="dropdown-item" href="profile-orders.html">Orders</a></li>
                        <li><a class="dropdown-item" href="profile-addresses.html">Addresses</a></li>
                        <li><a class="dropdown-item" href="profile-payments.html">Payments</a></li>
                        <li><a class="dropdown-item" href="profile-wishlist.html">Wishlist</a></li>
                        <li><span class="megamenu-title">Blog</span></li>
                        <li><a class="dropdown-item" href="blog-cards.html">Blog - cards</a></li>
                        <li><a class="dropdown-item" href="blog-posts.html">Blog - posts</a></li>
                        <li><a class="dropdown-item" href="post.html">Post</a></li>
                      </ul>
                      <ul class="col-6 col-md-3 col-lg-2">
                        <li><span class="megamenu-title">Pages</span></li>
                        <li><a class="dropdown-item" href="about.html">About</a></li>
                        <li><a class="dropdown-item" href="contact.html">Contact</a></li>
                        <li><a class="dropdown-item" href="faq.html">FAQ</a></li>
                        <li><a class="dropdown-item" href="text.html">Text Page</a></li>
                        <li><a class="dropdown-item" href="404.html">404</a></li>
                        <li><a class="dropdown-item" href="coming-soon.html">Coming Soon</a></li>
                        <li><span class="megamenu-title">Docs</span></li>
                        <li><a class="dropdown-item" href="/documentation/index.html">Documentation</a></li>
                        <li><a class="dropdown-item" href="/documentation/changelog.html">Changelog</a></li>
                      </ul>
                      <div class="col-lg-4">
                        <div class="promo">
                          <span class="image image-overlay" style="background-image: url(assets/images/background-3.jpg)"></span>
                          <div class="promo-footer p-4 text-white">
                            <h3 class="mb-0">New Collection</h3>
                            <a href="#!" class="eyebrow underline text-white">Shop Now</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="documentation/index.html">
                    Docs
                  </a>
                </li>
              </ul>
            </div>

            <div class="collapse navbar-collapse order-4 order-lg-3" id="navbarMenu2">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                  <a class="nav-link" href="portal.html">Log In</a>
                </li>
                <li class="nav-item">
                  <a data-toggle="modal" data-target="#search" class="nav-link"><i class="icon-search"></i></a>
                </li>
                <li class="nav-item cart">
                  <a data-toggle="modal" data-target="#cart" class="nav-link"><span>Cart</span><span>2</span></a>
                </li>
              </ul>
            </div>
          </nav>
        </div>
      </div>
    </header>

    <!-- breadcrumbs -->
    <section class="breadcrumbs bg-light">
      <div class="container">
        <div class="row">
          <div class="col">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item"><a href="listing-sidebar.html">Shop</a></li>
                <li class="breadcrumb-item active" aria-current="page">Product</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>
    <!-- main -->
        <section class="breadcrumbs bg-light">
            <div class="wrapper w-100">
      <div class="max-w-540 w-100">
        <div id="payment-method" class="w-100"></div>
        <div id="agreement" class="w-100"></div>
        <div class="btn-wrapper w-100">
          <button id="payment-request-button" class="btn primary w-100">결제하기</button>
        </div>
      </div>
    </div>
    <script type="module" src="./index.js"></script>
        <div class="row">
              <div class="col-md-8">
                <p>main입니다.</p>
              </div>
            </div>
            </section>


    <!-- footer -->
    <footer class="bg-dark text-white py-0">
      <div class="container">
        <div class="row separated">
          <div class="col-lg-6 py-10">
            <div class="row">
              <div class="col-md-8">
                <p>Thanks to <a href="https://www.opumo.com" class="underline">Opumo</a> for the images used in this demo theme. Head over to <a href="https://www.opumo.com" class="underline">their store</a> to get these products.</p>
              </div>
            </div>
            <div class="row">
              <div class="col-md-10">
                <h4 class="eyebrow mb-2">Quick Links</h4>
                <ul class="list-group list-group-columns">
                  <li class="list-group-item"><a href="about.html">About</a></li>
                  <li class="list-group-item"><a href="contact.html">Contact Us</a></li>
                  <li class="list-group-item"><a href="faq.html">FAQ</a></li>
                  <li class="list-group-item"><a href="blog.html">Blog</a></li>
                  <li class="list-group-item"><a href="text.html">Terms of Use</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-lg-6 py-10">
            <div class="row justify-content-end">
              <div class="col-lg-10">
                <h4 class="eyebrow mb-2">Subscribe</h4>
                <div class="input-group">
                  <input type="text" class="form-control form-control-lg" placeholder="Email" aria-label="Subscribe" aria-describedby="button-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-white" type="button" id="button-addon2">Subscribe</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="row justify-content-end">
              <div class="col-lg-10">
                <h4 class="eyebrow mb-2">Follow us</h4>
                <nav class="nav nav-icons">
                  <a class="nav-link" href="#!"><i class="icon-facebook-o"></i></a>
                  <a class="nav-link" href="#!"><i class="icon-twitter-o"></i></a>
                  <a class="nav-link" href="#!"><i class="icon-youtube-o"></i></a>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>


    <!-- cart -->
    <div class="modal fade sidebar" id="cart" tabindex="-1" role="dialog" aria-labelledby="cartLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="cartLabel">Cart</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

            <div class="row gutter-3">
              <div class="col-12">
                <div class="cart-item cart-item-sm">
                  <div class="row align-items-center">
                    <div class="col-lg-9">
                      <div class="media media-product">
                        <a href="#!"><img src="assets/images/demo/product-3.jpg" alt="Image"></a>
                        <div class="media-body">
                          <h5 class="media-title">Black IC Pendant Light</h5>
                          <span class="media-subtitle">Black, Steel</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 text-center text-lg-right">
                      <span class="cart-item-price">$90</span>
                    </div>
                    <a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="cart-item cart-item-sm">
                  <div class="row align-items-center">
                    <div class="col-lg-9">
                      <div class="media media-product">
                        <a href="#!"><img src="assets/images/demo/product-4.jpg" alt="Image"></a>
                        <div class="media-body">
                          <h5 class="media-title">Red Analog Magazine Rack</h5>
                          <span class="media-subtitle">Red</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 text-center text-lg-right">
                      <span class="cart-item-price">$120</span>
                    </div>
                    <a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="cart-item cart-item-sm">
                  <div class="row align-items-center">
                    <div class="col-lg-9">
                      <div class="media media-product">
                        <a href="#!"><img src="assets/images/demo/product-24.jpg" alt="Image"></a>
                        <div class="media-body">
                          <h5 class="media-title">Closca Helmet</h5>
                          <span class="media-subtitle">Black</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 text-center text-lg-right">
                      <span class="cart-item-price">$132</span>
                    </div>
                    <a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="row gutter-0">
                <div class="col d-none d-md-block">
                  <a href="cart.html" class="btn btn-lg btn-block btn-secondary">View Cart</a>
                </div>
                <div class="col">
                  <a href="checkout.html" class="btn btn-lg btn-block btn-primary">Checkout</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <!-- search -->
    <div class="modal fade search" id="search" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <input type="text" class="form-control" placeholder="Type your search here" aria-label="Type your search here" aria-describedby="button-addon2">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
        </div>
      </div>
    </div>


    <!-- reviews -->
    <div class="modal fade sidebar" id="reviews" tabindex="-1" role="dialog" aria-labelledby="reviewsLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="reviewsLabel">Reviews</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row gutter-3">
              <div class="col-12">
                <blockquote class="testimonial">
                  <div class="testimonial-rate">
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                  </div>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                  <footer>Michael Doe on 5 July 2019</footer>
                </blockquote>
              </div>
              <div class="col-12">
                <blockquote class="testimonial">
                  <div class="testimonial-rate">
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                  </div>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                  <footer>Michael Doe on 5 July 2019</footer>
                </blockquote>
              </div>
              <div class="col-12">
                <blockquote class="testimonial">
                  <div class="testimonial-rate">
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                  </div>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                  <footer>Michael Doe on 5 July 2019</footer>
                </blockquote>
              </div>
              <div class="col-12">
                <blockquote class="testimonial">
                  <div class="testimonial-rate">
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                  </div>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                  <footer>Michael Doe on 5 July 2019</footer>
                </blockquote>
              </div>
              <div class="col-12">
                <blockquote class="testimonial">
                  <div class="testimonial-rate">
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                  </div>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                  <footer>Michael Doe on 5 July 2019</footer>
                </blockquote>
              </div>
              <div class="col-12">
                <blockquote class="testimonial">
                  <div class="testimonial-rate">
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                    <span class="icon-ui-star"></span>
                  </div>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                  <footer>Michael Doe on 5 July 2019</footer>
                </blockquote>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="row gutter-0">
                <div class="col">
                  <a href="#!" class="btn btn-lg btn-block btn-primary" data-toggle="modal" data-target="#writeReview" data-dismiss="modal">Write Review</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <!-- new review -->
    <div class="modal fade sidebar" id="writeReview" tabindex="-1" role="dialog" aria-labelledby="writeReviewLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="writeReviewLabel">New Review</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form class="row gutter-2">
              <div class="form-group col-12">
                <label for="exampleFormControlInput1">Email address</label>
                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
              </div>
              <div class="form-group col-12">
                <label for="exampleFormControlSelect1">Rating</label>
                <select class="form-control custom-select" id="exampleFormControlSelect1">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                </select>
              </div>
              <div class="form-group col-12">
                <label for="exampleFormControlTextarea1">Example textarea</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="row gutter-0">
                <div class="col">
                  <a href="#!" class="btn btn-lg btn-block btn-primary" data-dismiss="modal">Publish Review</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>



    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.js"></script>
  </body>
</html>