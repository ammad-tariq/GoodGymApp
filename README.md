# GoodGymApp

Welcome to the GoodGymApp! This application is designed to manage GoodGym sessions, registrations, and goodgymers. The app is built using Ruby on Rails for the backend and React for the frontend components.

## Technologies Used

- Ruby 3.1.0
- Rails 6.1.7.8
- PostgreSQL
- React
- Webpacker
- RSpec for testing

## Setup Instructions

First, clone the repository to your local machine, install dependencies, setup the database, start the servers, run tests, and seed the database:

```sh
git clone https://github.com/your-username/GoodGymApp.git
cd GoodGymApp
bundle install
yarn install
rails db:create db:migrate db:seed
rails server & bin/webpack-dev-server
bundle exec rspec



Application Features
Sessions Management: Create and manage different types of GoodGym sessions.
Registrations: Register goodgymers to sessions with specific business rules.
Goodgymers Management: Manage GoodGym participants with roles and verification statuses.



Testing
The application uses RSpec for testing. The test suite includes:

Model Specs: These tests handle the validations, associations, and behaviors defined in the model classes.
Request Specs: These tests handle the controller actions, ensuring that the correct responses are returned for various HTTP requests.



Usage
After setting up the application, you can access it by navigating to http://localhost:3000 in your web browser. From there, you can interact with the GoodGym sessions, register goodgymers, and explore the application's features.

This README provides a comprehensive overview of setting up and running the GoodGymApp. If you encounter any issues or have further questions, please refer to the project's GitHub repository or contact the project maintainer.

