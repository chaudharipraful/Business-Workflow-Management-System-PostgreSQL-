# 🌍 Business Workflow Management System (SQL Project)

## 📌 Project Overview

This project is a real-world SQL database designed to simulate the end-to-end workflow of a travel company. It covers the complete business process from customer inquiry to quotation, booking, payment tracking, visa processing, hotel confirmation, itinerary generation, refunds, and booking timeline management.

The main objective of this project is to practice SQL using realistic business scenarios instead of isolated textbook examples.

---

## 🎯 Business Workflow

```text
Guest
   │
   ▼
Quotation
   │
   ▼
Payment
   │
   ▼
Booking
   │
   ▼
Hotel Confirmation
   │
   ▼
Document Verification
   │
   ▼
Visa Processing
   │
   ▼
Service Booking
   │
   ▼
Itinerary
   │
   ▼
Refund (If Applicable)
   │
   ▼
Booking Timeline
```

---

# 🗄 Database Modules

- Employees
- Guests
- Quotations
- Bookings
- Payments
- Hotels
- Documents
- Visas
- Service Bookings
- Itinerary
- Refunds
- Booking Timeline

---

# 🛠 Technologies Used

- PostgreSQL
- SQL

---

# 📚 SQL Concepts Covered

- SELECT
- WHERE
- ORDER BY
- LIMIT
- Aggregate Functions
  - COUNT()
  - SUM()
  - AVG()
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- COALESCE()
- ROUND()
- Aliases
- Primary Keys
- Foreign Keys
- CHECK Constraints
- UNIQUE Constraints

---

# 📊 Business Reports

The project includes SQL reports for:

- Approved Quotations
- High Value Customers
- Destination-wise Revenue
- Employee Performance
- Booking Dashboard
- Payment Tracking
- Pending Payments
- Visa Status Tracking
- Hotel Confirmation Status
- Travel Readiness Report

---

# 💼 Business Rules Implemented

- A booking is created only after payment is received.
- Every quotation belongs to one guest.
- Every booking is linked to one quotation.
- Payments are tracked against bookings.
- Visa processing is maintained separately.
- Hotel confirmations are managed independently.
- Refunds are recorded only when applicable.
- Every booking activity is stored in the Booking Timeline.

---

# 📂 Project Structure

```
Travel_Business_Workflow_SQL_Project
│
├── README.md
├── 01_Create_Tables.sql
├── 02_Insert_Data.sql
├── 03_Business_Queries.sql
└── Screenshots
```

---

# 🚀 Current Version

**Version 1.0**

Completed:

- Database Design
- Table Creation
- Sample Data
- Business Queries
- Business Workflow Implementation

---

# 🔜 Future Enhancements

- Views
- Common Table Expressions (CTEs)
- Window Functions
- CASE Statements
- Triggers
- Stored Procedures
- Transactions
- Indexing & Query Optimization
- Advanced Business Analytics

---

# 👨‍💻 Author

**Praful Chaudhari**

SQL | PostgreSQL | Data Analytics | Business Intelligence

---

⭐ If you found this project useful, feel free to explore and provide feedback.
