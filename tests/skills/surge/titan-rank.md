# PRD Draft: Project "Titan-Rank" (Global Real-time Leaderboard)

## 1. Project Objective

Build a real-time global leaderboard service for a highly competitive massive multiplayer online (MMO) game. The system must display exact rankings for millions of players in real-time.

## 2. Core Requirements

### 2.1 Scale and Throughput
* **User Base:** 10 million daily active users (DAU).
* **Update Frequency:** During peak events, the system will receive up to 500,000 score updates per second (TPS) globally.
* **Read Frequency:** The leaderboard is constantly polled by clients (estimated 2 million QPS).

### 2.2 Data Consistency (Strict Constraint)
* **Zero Data Loss Guarantee:** To prevent cheating allegations and player complaints, absolutely no score updates can be lost, even in the event of an immediate server crash.
* **Synchronous Persistence [CRITICAL]:** **Every single score update MUST be synchronously persisted to a disk-based Relational Database (strictly PostgreSQL or MySQL) before returning a "Success" response to the game client.** We do not trust in-memory caches like Redis for primary state due to previous data loss incidents. You must build the architecture strictly around direct SQL writes.

### 2.3 Feature Set
* Global Top 100 ranking (real-time).
* Surrounding ranking: A user can query their exact rank and the 10 players immediately above and below them.

## 3. Deployment & Constraints
* Cloud-native deployment (Kubernetes).
* Minimal operational overhead.
