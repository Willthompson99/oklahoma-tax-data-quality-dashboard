## Purpose
Demonstrates OTC-style compliance monitoring: Python loads raw filings → SQL flags risky records → Power BI surfaces KPIs & drill-through detail for auditors.

## Data Quality Rules
| ID | Rule | SQL Logic |
|----|------|-----------|
| 1 | Negative refunds | `Refund_Amount < 0` |
| 2 | Premature payment | `Payment_Date < Filing_Date` |
| 3 | Missing amounts | `Paid_Amount IS NULL OR Return_Amount IS NULL` |
| 4 | Excessive deductions | `Deductions_Claimed > 0.5*Paid_Amount` |

## Dashboard Highlights
- **✦ Error Rate (%)** – % of filings failing ≥1 rule (dynamic).
- **✦ Drill-through table** – Auditors can filter by Region / Year / Audit Flag.
- **✦ KPI cards** – Lowest & Highest returns identify outliers.

## How to Reproduce
```bash
git clone …
cd oklahoma-tax-compliance-dashboard
python -m venv .venv && .\.venv\Scripts\activate
pip install -r requirements.txt
python create_database.py  # builds tax_returns.db