# Bank Pipeline API

A real-time transaction processing API built using Elixir, Phoenix Framework, and GenStage. This API simulates a bank transaction pipeline, where transactions are validated and stored in a database.

## Features

- **Asynchronous processing**: Built with GenStage for concurrent and efficient data handling.
- **RESTful API**: Exposes endpoints for creating, listing, and updating transactions.
- **Database Integration**: Uses PostgreSQL for persistent transaction storage.
- **Real-time Insights**: Ideal for high-performance financial applications or educational purposes.

---

## Endpoints

### **Transaction Endpoints**
| Method | Endpoint                  | Description                         |
|--------|---------------------------|-------------------------------------|
| GET    | `/api/transactions`       | Lists all transactions.            |
| POST   | `/api/transactions`       | Creates a new transaction.         |
| PUT    | `/api/transactions/:id`   | Updates the status of a transaction.|

#### Example Transaction JSON
```json
{
  "transaction": {
    "amount": 100.0,
    "description": "Deposit",
    "status": "completed"
  }
}
```

---

## Why Implement This API?

1. **Scalable Architecture**: Implements GenStage for handling large-scale asynchronous pipelines.
2. **Educational Value**: Demonstrates core concepts of Elixir and Phoenix, like concurrency and real-time processing.
3. **Real-World Use Case**: Provides a foundation for building scalable financial systems or any system requiring similar processing pipelines.
4. **Easy to Extend**: Modifiable for additional stages, like fraud detection or advanced analytics.

---

## Getting Started

### Prerequisites

Before setting up the project, ensure the following are installed on your system:

1. **Elixir**: Install the latest version of Elixir [here](https://elixir-lang.org/install.html).
2. **Phoenix Framework**: Install Phoenix globally:
   ```bash
   mix archive.install hex phx_new
   ```
3. **Docker**: Ensure Docker is installed and running for the PostgreSQL database.

---

### Step-by-Step Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/wiriane-cintia/bank-pipeline-api.git
   cd bank-pipeline-api
   ```

2. **Set Up Environment Variables**
   Create a `.env` file in the project root with the following contents:
   ```
   DATABASE_USER=postgres
   DATABASE_PASSWORD=postgres
   DATABASE_NAME=bank_pipeline_dev
   DATABASE_HOST=localhost
   ```

3. **Start the PostgreSQL Database**
   Use Docker to run PostgreSQL:
   ```bash
   docker run --name bank_pipeline_db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=bank_pipeline_dev -p 5432:5432 -d postgres
   ```

4. **Install Dependencies**
   Install Elixir and Phoenix dependencies:
   ```bash
   mix deps.get
   ```

5. **Set Up the Database**
   Run the migrations to set up the database schema:
   ```bash
   mix ecto.create
   mix ecto.migrate
   ```

6. **Run the Server**
   Start the Phoenix server:
   ```bash
   mix phx.server
   ```
   The API will be available at `http://localhost:4000`.

---

### Testing the API

1. **Install HTTP Client**  
   Use tools like `curl`, Postman, or any HTTP client.

2. **Test Endpoints**
   - **List Transactions**:
     ```bash
     curl -X GET http://localhost:4000/api/transactions
     ```
   - **Create Transaction**:
     ```bash
     curl -X POST http://localhost:4000/api/transactions \
     -H "Content-Type: application/json" \
     -d '{"transaction": {"amount": 100.0, "description": "Deposit"}}'
     ```
   - **Update Transaction**:
     ```bash
     curl -X PUT http://localhost:4000/api/transactions/1 \
     -H "Content-Type: application/json" \
     -d '{"transaction": {"status": "completed"}}'
     ```

---

## Project Structure

```
.
├── lib/
│   ├── bank_pipeline/        # Core application logic
│   │   ├── transaction.ex    # Ecto schema for transactions
│   │   ├── pipeline/         # GenStage pipeline
│   ├── bank_pipeline_web/
│       ├── controllers/      # API controllers
│       ├── router.ex         # Routes configuration
│       ├── views/            # JSON rendering
├── config/
│   ├── config.exs            # General configuration
│   ├── dev.exs               # Development-specific config
│   ├── prod.exs              # Production-specific config
│   ├── test.exs              # Test-specific config
```

---

## Deployment

For production deployment, consider using **Docker Compose** and tools like **Fly.io** or **Gigalixir** for hosting.

---

## Contributing

Pull requests are welcome! For significant changes, please open an issue first to discuss what you would like to change.
