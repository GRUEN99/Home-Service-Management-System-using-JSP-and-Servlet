HOME SERVICES MANAGEMENT SYSTEM 


This project is a web-based application for managing home services, bookings, and client details.Both Client and The service provider can login. The platform allows client to sign up, book services,manage their bookings and invoices, update their details. And the service provider can login in and access the details of the clients, bookings and delete or update the client details based on the requirements. The project is built using Java, JSP, and Servlets, with a MySQL database for data storage.


FEATURES

Client Sign Up: Allows new clients to register by providing their details such as name, Aadhaar number, mobile number, state, country, and location.

Service Management: Enables the addition of various home services along with their prices.

Booking Management: Clients can book services by specifying the date, day, and time. The system stores and manages these bookings.

Client Deletion: Administrators can delete client entries from the database by providing the client’s name.

Dashboard: A dashboard that redirects to different functionalities like services, bookings, and invoices.


TECHNOLOGIES USED

Java: Backend logic implementation using Servlets.

JSP (JavaServer Pages): For dynamic web pages.

HTML & CSS: Frontend design and styling.

JavaScript: Client-side scripting for form handling.

MySQL: Database management for storing client details, services, and bookings.

Apache Tomcat: Server for deploying the web application.


SET UP FOR MYSQL DATABASE

CREATE DATABASE mini_project;

USE mini_project;

CREATE TABLE clientdetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    aadhaar VARCHAR(20) NOT NULL,
    mobile VARCHAR(15) NOT NULL,
    state VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    date DATE NOT NULL,
    day VARCHAR(255) NOT NULL,
    time TIME NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clientdetails(id)
);



PROJECT STRUCTURE

clientDetails.jsp: JSP page for client sign-up.

clientDelete.jsp: JSP page for deleting client details.

services.jsp: JSP page for adding services.

bookings.jsp: JSP page for making bookings.

dashboard.jsp: Dashboard page with links to various functionalities.

servlets: Java servlets for handling requests and business logic.

clientDetailsServlet.java

clientDeleteServlet.java

servicesServlet.java

bookingsServlet.java


FUTURE ENHANCEMENTS

User Authentication and Authorization
Service Provider Module
Payment Integration etc.
These enhancements can significantly improve the functionality and user experience of the Home Service Provider platform, making it more robust, secure, and user-friendly.
