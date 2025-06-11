# 🚀 Restaurant Menu GraphQL API

This project is a Ruby on Rails backend with a GraphQL API for managing menus, sections, items, modifier groups, and modifiers.

---

## **Setup Instructions**

### 1. **Clone the Repository**

```sh
git clone https://github.com/bardon123/menu_query.git
cd menu_query
```

### 2. **Install Dependencies**

```sh
bundle install
```

### 3. **Set Up the Database**

- **Create and migrate the database:**
  ```sh
  bundle exec rails db:create db:migrate
  ```
- **(Optional) Seed the database with dummy data:**
  ```sh
  bundle exec rails db:seed
  ```

### 4. **Start the Rails Server**

```sh
bundle exec rails server
```

- Visit [http://localhost:3000/graphiql](http://localhost:3000/graphiql) to access the GraphiQL interface.

### 5. **Environment Variables**

- Copy `.env.example` to `.env` and fill in any required secrets (if applicable).
- For production, set `DATABASE_URL`, `RAILS_ENV`, and `RAILS_MASTER_KEY` in your hosting environment (e.g., Render).

### 6. **Deploying to Render**

- Push your code to GitHub.
- Connect your repo to Render and set the required environment variables.
- After deployment, run:
  ```sh
  bundle exec rails db:migrate
  bundle exec rails db:seed
  ```
  from the Render shell to set up and seed the production database.

---

## **GraphQL Usage**

- Access the GraphiQL interface at `/graphiql` to run queries and mutations.
- Example query:
  ```graphql
  {
  	menus {
  		id
  		label
  		sections {
  			id
  			label
  			items {
  				id
  				label
  				modifiers {
  					id
  					label
  				}
  			}
  		}
  	}
  }
  ```

---

## **Notes**

- The project uses Rails 8 and the `graphql` and `graphiql-rails` gems.
- Dummy data is provided in `db/seeds.rb` for easy testing.
