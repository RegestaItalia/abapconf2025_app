# ABAPConf 2025 – TRM Dependency Example App

This is a demo RAP-based ABAP application built for **ABAPConf 2025**. It showcases how **ABAP TRM (Transport and Repository Management)** handles dependency resolution and installation using real-world modular ABAP packages.

## 💡 Purpose

The main goal of this repository is to demonstrate how TRM automatically detects and installs dependent packages when deploying this application to a target ABAP system.

## 🧩 Application Overview

- **Type:** RAP (RESTful ABAP Programming Model) Service
- **Entity:** `Order`
- **Functionality:** When a user inputs an `Order Price`, the service automatically calculates `Price + VAT` using an external utility library.
- **Dependency:** Uses the shared library from [`abapconf2025_utils`](https://github.com/RegestaItalia/abapconf2025_utils) for VAT calculation logic.

## 🔗 External Dependency

This application depends on:

- [`ABAPConf 2025 – TRM Dependency Example Utils`](https://github.com/RegestaItalia/abapconf2025_utils)

TRM will resolve and install this utility library automatically when deploying this app, demonstrating its dependency management capabilities.

## 🚀 How to Deploy

1. Install TRM on your ABAP system (if not already installed).
2. Use TRM to import this repository.
3. Observe how TRM automatically fetches and installs its dependency (`abapconf2025_utils`).
4. Activate the RAP service and test the `Order` entity.

## 👥 Authors

Maintained by [Regesta](https://www.regestaitalia.eu/) for ABAPConf 2025.

## 📝 License

[MIT License](LICENSE)
