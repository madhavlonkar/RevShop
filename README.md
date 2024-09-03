Overview
Welcome to the E-Commerce Platform Backend repository! This project serves as the core backend system for an e-commerce application, providing essential functionalities for managing users, products, orders, shopping carts, transactions, and reviews. It is built with Java and follows a modular, DAO (Data Access Object) design pattern to ensure clean separation of concerns, ease of maintenance, and scalability.

Features
This project includes a robust set of features essential for running an e-commerce platform:

User Management: Handles user registration, login, and profile management.
Product Management: Supports adding, updating, deleting, and retrieving product information.
Shopping Cart: Allows users to add products to their cart, update quantities, and view cart contents.
Order Processing: Manages the creation and tracking of customer orders.
Favorites: Enables users to save products to their favorites list.
Reviews and Ratings: Allows customers to review and rate products.
Transactions: Handles payment transactions and links them to orders.
Admin Tools: Includes features for sellers to manage their product inventory and track orders.

Installation
To set up the project locally, follow these steps:

Prerequisites
Java Development Kit (JDK) 8 or later
Maven 3.6 or later
Database (e.g., MySQL, PostgreSQL)
Steps
Clone the repository:

bash
Copy code
git clone https://github.com/yourusername/ecommerce-backend.git
cd ecommerce-backend
Configure the database: Update the DBConnection.java file in the com/revshop/utility/ package with your database credentials.

Build the project:

bash
Copy code
mvn clean install
Run the application: This is typically integrated into a larger project with a web framework like Spring, but for standalone testing, you can write simple test cases or use a main method in any class to interact with the DAOs.

Logging
The project uses SLF4J with Logback (or Log4j, based on the DAO) for logging. Logging is configured to provide detailed information about the application's execution flow, including database operations and error handling.

Info Logs: Used to log successful operations and important application events.
Error Logs: Capture exceptions and critical issues to assist with debugging.
Debug Logs: Provide detailed insights, mainly used during development or troubleshooting.
Contributing
Contributions to this project are welcome! If you have any improvements or new features you'd like to add, feel free to fork the repository and submit a pull request. Please ensure your code follows the existing style and is well-documented.

Steps to Contribute
Fork the repository.
Create a new feature branch (git checkout -b feature/YourFeature).
Commit your changes (git commit -m 'Add some feature').
Push to the branch (git push origin feature/YourFeature).
Open a pull request.
