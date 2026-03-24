# PRD Draft: Subscription Fluid-Tracker (Initial Version)

## Overview

Many users lose track of their various digital subscriptions (streaming, cloud storage, professional tools), leading to unexpected charges. This tool aims to provide a centralized dashboard to track costs and notify users before payments are processed.

## Core Functional Requirements

### Subscription Logging

- Manual Entry: Users can add a subscription by providing the service name (e.g., Netflix, ChatGPT Plus), the billing amount, and the currency.
- Billing Cycles: Support for different billing frequencies, specifically Monthly and Annual cycles.
- Billing Date: Users must specify the next billing date to trigger reminders.

### Payment Reminders

- Proactive Notification: The system must send a reminder 3 days prior to the scheduled billing date.
- Purpose: To give the user enough time to evaluate the service and cancel if no longer needed.

### Financial Analytics

- Monthly Aggregate: Calculate and display the total average monthly expenditure across all active subscriptions.
- Multi-Currency Support: Ability to handle different currencies (e.g., USD, RMB) as many services are billed internationally.

## Key Data Points (Initial Set)

- Service Name (String)
- Cost (Decimal)
- Currency (ISO Code)
- Cycle (Enum: Monthly, Yearly)
- Next Billing Date (Date)

## UI/UX Principles

- Minimalism: No advertisements or cluttered features.
- Efficiency: The focus is on rapid data entry and clear visibility of upcoming costs.
