# 🏥 Medical Supply Management System (MSD - Sri Lanka)

A full-featured desktop application developed for the **Medical Supplies Division (Ministry of Health, Nutrition & Indigenous Medicine, Sri Lanka)** using **Java Swing**, **MySQL**, and **JasperReports**. The system streamlines medical inventory management, hospital order processing, batch tracking, and delivery logistics.

## ✨ Key Features

* **Authentication & Interactive Dashboard:**
  * Animated Splash Screen and secure Login with a "View Password" toggle.
  * Custom gradient summary cards displaying real-time counts for Drugs, Hospitals, Head Pharmacies, Pharmacies, Vehicles, and Vehicle Types.
  * Animated, collapsible sidebar navigation.
* **Registration & Directory Management:**
  * Dedicated registration forms with input validation for **Users, Head Pharmacies, Pharmacies, Hospitals, Sub-Offices, and Delivery Vehicles**.
  * Dedicated **View & Live Search** modules for all registered entities.
* **Inventory, Suppliers & GRN (Goods Received Note):**
  * Manage Suppliers, Companies, Drugs, Brands, and **Batch Numbers** (tracking manufacture date, expiry date, country, and unit rate).
  * Create GRNs with automatic payment/balance calculation and real-time **Stock updates**.
* **Order & Delivery Processing:**
  * Record medication request orders from ministry-controlled hospitals.
  * Confirm deliveries by assigning vehicles and linking specific **Batch Numbers** (automatically deducting dispatched quantities from stock).
* **Printable Reports (JasperReports):**
  * Generate and print **Order Reports**, **Delivery Reports**, **Stock Reports**, **GRN Receipts**, and **Batch Number Reports**.

## 🛠️ Tech Stack
* **Language:** Java (Core)
* **GUI Framework:** Java Swing (`javax.swing`) & Custom 2D Graphics Cards
* **Database:** MySQL (`msd_db`)
* **Reporting:** JasperReports (`.jrxml`)
* **IDE:** NetBeans

## 🚀 How to Run Locally
1. Clone the repository:
   ```bash
   git clone https://github.com/TashilaDilshanK/medical-supply-management-system-java.git
