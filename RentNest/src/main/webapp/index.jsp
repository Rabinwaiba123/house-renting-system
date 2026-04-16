<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RentNest</title>
    <link rel="stylesheet" href="css/main.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <header>
      <div class="container">
        <nav class="navbar">
          <a href="#" class="logo">
            <img
              src="images/RentNest Logo with Roof-Nest Icon.png"
              alt="RentNest logo"
            />
          </a>

          <ul class="nav-links">
            <li><a class="active" href="#home">Home</a></li>
            <li><a href="#properties">Properties</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>

          <div class="nav-actions">
            <a href="#" class="btn btn-light">Sign in</a>
            <a href="#" class="btn btn-primary">Login</a>
          </div>
        </nav>
      </div>
    </header>

    <main>
      <section class="hero-section">
        <div class="container">
          <div class="hero-text">
            <h1>A Smarter Way to Rent Homes and Rooms</h1>
            <p>
              Our platform connects tenants and property owners through a secure
              system with verified listings, easy booking, and seamless
              management.
            </p>
            <a href="#properties" class="btn btn-primary hero-btn">Book Now</a>
          </div>
          <div class="hero-image">
            <img src="images/Untitled design.png" alt="Modern rental house" />
          </div>
          <form class="search-box">
            <div class="field">
              <label for="location">Location</label>
              <div class="select-wrap">
                <select id="location">
                  <option>Kathmandu, Nepal</option>
                  <option>Lalitpur, Nepal</option>
                  <option>Bhaktapur, Nepal</option>
                </select>
                <img
                  src="images/down_icon-icons.com_61209.png"
                  alt="dropdown icon"
                />
              </div>
            </div>

            <div class="field small">
              <label for="type">Type</label>
              <div class="select-wrap">
                <select id="type">
                  <option>Room</option>
                  <option>Flat</option>
                  <option>House</option>
                </select>
                <img
                  src="images/down_icon-icons.com_61209.png"
                  alt="dropdown icon"
                />
              </div>
            </div>

            <div class="field">
              <label for="price">Price Range</label>
              <div class="select-wrap">
                <select id="price">
                  <option>Rs3000 - Rs4000</option>
                  <option>Rs4000 - Rs8000</option>
                  <option>Rs8000 - Rs15000</option>
                </select>
                <img
                  src="images/down_icon-icons.com_61209.png"
                  alt="dropdown icon"
                />
              </div>
            </div>

            <button type="submit" class="search-btn">Search</button>
          </form>
        </div>
      </section>

      <section class="recommendations section" id="properties">
        <div class="container">
          <div class="section-head">
            <div>
              <h2>Best Recommendation</h2>
              <span class="accent-line"></span>
            </div>

            <div class="filter-tabs">
              <a href="#" class="tab"
                ><img
                  src="images/bed_hotel_double_sleep_bedroom_room_icon_229653.png"
                  alt="rooms"
                />Rooms</a
              >
              <a href="#" class="tab"
                ><img
                  src="images/buildings_icon-icons.com_56742.png"
                  alt="flats"
                />Flats</a
              >
              <a href="#" class="tab"
                ><img src="images/house_38533.png" alt="houses" />House</a
              >
            </div>
          </div>

          <div class="card-grid">
            <article class="property-card">
              <img
                class="property-img"
                src="images/AZ19GXhGC_Urw0-5srCesQ-AZ19GXhGPnoinQqUgil0Kg.jpg"
                alt="Single room exterior"
              />
              <div class="card-body">
                <div class="card-title-row">
                  <h3>Single Room</h3>
                  <div class="rating">
                    <img
                      src="images/starshapefavorite_85730.png"
                      alt="star"
                    />3.9
                  </div>
                </div>
                <p class="location">Kathmandu, Nepal</p>
                <p class="price">Rs 3500</p>
                <a href="#" class="card-btn">See More</a>
              </div>
            </article>

            <article class="property-card">
              <img
                class="property-img"
                src="images/AZ19GiZaeyx7kadXlVHTPw-AZ19GiZaOxGI_Rh77GCP-Q.jpg"
                alt="Single room bedroom"
              />
              <div class="card-body">
                <div class="card-title-row">
                  <h3>Single Room</h3>
                  <div class="rating">
                    <img
                      src="images/starshapefavorite_85730.png"
                      alt="star"
                    />3.9
                  </div>
                </div>
                <p class="location">Kathmandu, Nepal</p>
                <p class="price">Rs 3500</p>
                <a href="#" class="card-btn">See More</a>
              </div>
            </article>

            <article class="property-card">
              <img
                class="property-img"
                src="images/AZ19GIdKZCNVNcXkz9pxgg-AZ19GIdKbNjD8Dyj8BbJUw.jpg"
                alt="Single room living area"
              />
              <div class="card-body">
                <div class="card-title-row">
                  <h3>Single Room</h3>
                  <div class="rating">
                    <img
                      src="images/starshapefavorite_85730.png"
                      alt="star"
                    />3.9
                  </div>
                </div>
                <p class="location">Kathmandu, Nepal</p>
                <p class="price">Rs 3500</p>
                <a href="#" class="card-btn">See More</a>
              </div>
            </article>
          </div>
        </div>
      </section>

      <section class="why section">
        <div class="container small-container">
          <h2 class="center-title">Why To Choose Us</h2>

          <div class="feature-grid">
            <article class="feature-card">
              <div class="feature-icon">
                <img src="images/search_icon_125165.svg" alt="Easy to find" />
              </div>
              <h3>Easy to find</h3>
              <p>
                Easily search and explore a wide range of houses and rooms based
                on your location, budget, and preferences. Our simple and
                user-friendly system helps you find the perfect place without
                any hassle.
              </p>
            </article>

            <article class="feature-card">
              <div class="feature-icon">
                <img src="images/label_114874.svg" alt="Affordable prices" />
              </div>
              <h3>Affordable Prices</h3>
              <p>
                We provide listings with competitive and transparent pricing,
                ensuring you can find options that suit your budget without
                hidden costs.
              </p>
            </article>

            <article class="feature-card">
              <div class="feature-icon">
                <img
                  src="images/3507760-clock-history-iconoteka-time-watch_107692.svg"
                  alt="Quickly process"
                />
              </div>
              <h3>Quickly Process</h3>
              <p>
                From searching to booking, our platform offers a fast and smooth
                process. Save time with instant access to property details and
                quick booking features.
              </p>
            </article>
          </div>
        </div>
      </section>

      <section class="help section" id="about">
        <div class="container help-grid">
          <div class="help-images">
            <img
              src="images/AZ19GXhGC_Urw0-5srCesQ-AZ19GXhGPnoinQqUgil0Kg.jpg"
              alt="Living room interior"
            />
            <img
              src="images/AZ19GiZaeyx7kadXlVHTPw-AZ19GiZaOxGI_Rh77GCP-Q.jpg"
              alt="Bedroom interior"
            />
          </div>

          <div class="help-text">
            <h2>We Help People To Find Homes</h2>
            <p>
              We make it simple for people to find the right home or room that
              matches their needs. Our platform connects tenants with trusted
              property owners, offering a smooth and reliable renting experience
              from search to booking.
            </p>
            <a href="#contact" class="btn btn-primary">Get In Touch</a>
          </div>
        </div>
      </section>
    </main>

    <footer class="footer" id="contact">
      <div class="container footer-grid">
        <div class="footer-brand">
          <img
            src="images/RentNest Logo with Roof-Nest Icon.png"
            alt="RentNest logo"
          />
          <p>
            Find your perfect home or room easily, quickly, and securely with
            our trusted renting platform.
          </p>
          <div class="socials">
            <a href="#"
              ><img
                src="images/facebookblacksocialbuttoncircle_79771.png"
                alt="Facebook"
            /></a>
            <a href="#"
              ><img
                src="images/instagram_black_logo_icon_147122.png"
                alt="Instagram"
            /></a>
            <a href="#"
              ><img
                src="images/twitter_black_logo_icon_147062.png"
                alt="Twitter"
            /></a>
            <a href="#"
              ><img
                src="images/youtube_black_logo_icon_147044.png"
                alt="YouTube"
            /></a>
          </div>
        </div>

        <div class="footer-links">
          <h4>Project</h4>
          <a href="#">Houses</a>
          <a href="#">Rooms</a>
          <a href="#">Flats</a>
        </div>

        <div class="footer-links">
          <h4>Company</h4>
          <a href="#">How we work ?</a>
          <a href="#">Capital</a>
          <a href="#">Security</a>
        </div>

        <div class="footer-links">
          <h4>Movement</h4>
          <a href="#">Movement</a>
          <a href="#">Support us</a>
          <a href="#">Pricing</a>
        </div>

        <div class="footer-links">
          <h4>Help</h4>
          <a href="#">Privacy</a>
          <a href="#">Condition</a>
          <a href="#">Blog</a>
          <a href="#">FAQs</a>
        </div>
      </div>

      <div class="copyright">© 2026 RentNest. All rights reserved.</div>
    </footer>
  </body>
</html>
