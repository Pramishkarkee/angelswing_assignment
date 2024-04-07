### Setup Guide for Ruby on Rails Project

This README provides a step-by-step guide to set up a Ruby on Rails project, including database migrations, installation of dependencies, running the application, and executing tests.

#### 1. Install Ruby and Rails

- Ruby: Download and install Ruby from [here](https://www.ruby-lang.org/en/downloads/).
- Rails: Install Rails by running the following command in your terminal:

```bash
gem install rails
```

#### 2. Clone Project Repository

- Clone the project repository from GitHub:

```bash
git clone <repository-url>
```

#### 3. Navigate to Project Directory

- Open your terminal and navigate to the project directory:

```bash
cd project-directory
```

#### 4. Database Migration

- Run the following command to create the database schema:

```bash
rails db:migrate
```

This will execute any pending migrations and update the database schema accordingly.

#### 5. Install Project Dependencies

- Install project dependencies using Bundler:

```bash
bundle install
```

#### 6. Seed Database (Optional)

- If the project includes seed data, you can populate the database by running:

```bash
rails db:seed
```

This command will execute the seed file(s) defined in `db/seeds.rb`.

#### 7. Run the Application

- Start the Rails server by running:

```bash
rails s
```

This will start the server on port 3000 by default. You can access the application by visiting `http://localhost:3000` in your web browser.

#### 8. Running Tests

- For running all tests, use the following command:

```bash
rspec
```

- For running tests in a specific file or directory, use:

```bash
rspec spec/**/**
```

This command will execute all RSpec tests recursively within the `spec` directory.

#### 9. Postman Json File Location
-ruby api assignment.postman_collection.json

#### Additional Notes

- Make sure to update the `config/database.yml` file with your database credentials if necessary.
- Ensure that your system meets the prerequisites mentioned in the project documentation.
- For any further assistance or issues, feel free to contact the project maintainers.

With these steps, you should be able to set up, run, and test the Ruby on Rails project successfully. 
