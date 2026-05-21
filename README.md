# RentNest - House Renting System

RentNest is a dynamic web-based house renting system developed using Java, JSP, Servlet, MySQL, HTML, CSS, and MVC architecture. The system allows users to search and view rental properties, add properties to their wishlist, make booking requests, and manage their profile. It also provides an admin panel where administrators can manage users, properties, bookings, contacts, and reports.

This project was developed as coursework for the CS5054NI Advanced Programming and Technologies module.

---

## Project Overview

RentNest is designed to make the rental property process easier for both tenants and administrators. Public users can browse available properties, while registered users can manage bookings and wishlists. Admin users can control the overall system by approving users, managing property records, checking bookings, and viewing reports.

The system follows the MVC architecture to separate the application logic, database operations, and user interface.

---

## Main Features

### Public User Features

- View homepage
- View available rental properties
- Search properties by keyword, type, and maximum price
- View property details
- Access about and contact pages
- Register a new account
- Login to the system

### Tenant/User Features

- Login and logout
- Manage personal profile
- View property details
- Add properties to wishlist
- Remove properties from wishlist
- Book available properties
- View booking history
- Send contact messages

### Admin Features

- Admin dashboard
- Manage registered users
- Approve or reject users
- Manage property records
- Add, update, delete, approve, and reject properties
- Manage booking records
- View contact messages
- View system reports
- Role-based access control

---

## Technologies Used

- Java
- Jakarta Servlet
- JSP
- JSTL
- MySQL
- JDBC
- HTML5
- CSS3
- JavaScript
- Apache Tomcat
- Eclipse IDE
- MVC Architecture

---

## Project Architecture

The project follows the MVC pattern:

```text
Model      -> Represents system data such as User, Property, Booking, Wishlist, Contact
View       -> JSP pages used to display the user interface
Controller -> Servlets that handle user requests and responses
DAO        -> Handles database operations
Service    -> Contains business logic
Util       -> Contains reusable helper classes such as database connection and password encryption
