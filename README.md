# 🔍 India Job Market Intelligence Platform

> Analysing 29,418 real Naukri.com job listings to uncover hiring trends, skill demand, and market insights across Indian cities and industries.
## 📊 Dashboard Preview

![Dashboard](https://raw.githubusercontent.com/Divyanshusingh152/job-market-intelligence-platform/main/final_dashboard_layout.svg)

## 📌 Project Overview

Most job seekers guess what skills to learn and which cities to target. This project removes the guesswork by analysing real job market data.

**Key questions answered:**
- Which cities have the most job opportunities?
- What skills are companies hiring for RIGHT NOW?
- Which industries are most fresher-friendly?
- What experience level does the market actually want?
- Which city + industry combinations have the highest demand?

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python (Pandas) | Data cleaning & analysis |
| PostgreSQL | Database storage & SQL queries |
| Power BI | Interactive dashboard |
| Jupyter Notebook | Analysis environment |
| SQLAlchemy | Python-PostgreSQL connection |

---

## 📊 Key Insights

**1. Bengaluru dominates hiring**
With 5,220 job listings — 51% more than Mumbai (3,457). If you are in tech, Bengaluru is non-negotiable.

**2. IT sector = 34% of entire job market**
10,012 out of 29,418 listings are in IT-Software. One third of India's job market is tech.

**3. Market is fresher-friendly — 64% of jobs want 0-3 years experience**
Fresher (0-1 yr): 30% | Junior (1-3 yrs): 34% | Mid (3-6 yrs): 22%

**4. SQL and Python are the core DA stack**
SQL ranks #3 (1,562 mentions) and Python #7 (1,177 mentions) across all job listings.

**5. Kolkata is the most fresher-friendly city**
60.2% of Kolkata jobs are fresher level — higher than Bengaluru, Mumbai, or Pune.

**6. Oil & Gas is hardest to enter**
Average minimum experience required: 5.3 years — highest of all industries.

---

## 📁 Project Structure

```
job-market-intelligence-platform/
├── data/
│   └── raw/                    # Raw dataset (not uploaded — see below)
├── notebooks/
│   └── 01_analysis.ipynb       # Full analysis notebook
├── dashboard/
│   └── screenshots/            # Power BI dashboard screenshots
├── sql/
│   └── queries.sql             # All 8 SQL business queries
├── requirements.txt            # Python dependencies
└── README.md
```

---

## 🗄️ SQL Analysis (8 Business Queries)

| Query | Business Question | Concepts Used |
|-------|------------------|---------------|
| Q1 | Which city has most jobs? | SELECT, COUNT, GROUP BY |
| Q2 | Which industry hires most freshers? | WHERE, filter |
| Q3 | Average experience per industry? | AVG, ROUND, HAVING |
| Q4 | Best city + industry combination? | GROUP BY 2 columns |
| Q5 | Industries with 500+ listings? | HAVING vs WHERE |
| Q6 | Roles with national demand? | COUNT DISTINCT |
| Q7 | Industry ranking? | RANK() window function |
| Q8 | Fresher % per city? | CTE, JOIN, percentage |

---

## 📈 Dashboard Features

- **5 interactive visuals** — bar chart, treemap, donut, skills chart, heatmap matrix
- **3 slicers** — filter by city, industry, experience level
- **Cross-filtering** — click any visual to filter entire dashboard
- Built in Power BI Desktop

---

## 🚀 How to Run

**1. Clone the repository**
```bash
git clone https://github.com/yourusername/job-market-intelligence-platform.git
```

**2. Install dependencies**
```bash
pip install -r requirements.txt
```

**3. Download the dataset**
Dataset: [Naukri.com Job Listings on Kaggle](https://www.kaggle.com/datasets/promptcloud/jobs-on-naukricom)
Place in `data/raw/` folder

**4. Set up PostgreSQL**
```
Create database: job_market_db
Update credentials in notebook
```

**5. Run the notebook**
```
jupyter notebook notebooks/01_analysis.ipynb
Run all cells in order
```

---

## 📋 Data Cleaning Steps

- Removed 582 rows with missing job title, location, or industry
- Fixed duplicate city names ("Pune,Pune" → "Pune")
- Extracted numeric experience from text ("5-10 yrs" → min=5, max=10)
- Merged duplicate industry names (IT-Software variants)
- Converted date column from text to datetime
- Exploded pipe-separated skills into individual rows

---

## ⚠️ Data Limitations

- Salary data: 95%+ listed as "Not Disclosed" — salary analysis not possible
- Date range: July-August 2019 only — may not reflect current market
- Job listings ≠ actual hires — one listing may hire multiple people
- Dataset covers Naukri.com only — not full market picture

---

## 👤 Author

**Your Name**
Data Analyst | Python | SQL | Power BI

[LinkedIn](https://linkedin.com/in/yourprofile) · [GitHub](https://github.com/yourusername)

---

## 📄 License

MIT License — feel free to use and modify
