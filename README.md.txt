/olist_sql_project/
├── 01_schema/
│   └── olist_schema.sql                # Full schema-only dump (tables, PKs, FKs, indexes)
│
├── 02_setup_analysis_scripts/
│   ├── top_selling_products.sql        # Top products by revenue and order count
│   ├── seller_aov.sql                  # Average order value by seller
│   ├── late_by_category.sql            # % of late deliveries by product category
│   ├── orders_by_year.sql              # Yearly sales trend analysis
│   ├── funnel_analysis.sql             # Lead → deal → order → delivery → review funnel
│   └── avg_delivery_times_seller.sql   # Seller performance by delivery time
│
├── 03_outputs/
│   ├── top_selling_products.png
│   ├── funnel_analysis.png
│   ├── late_by_category.png
│   ├── orders_by_year.csv
│   └── ...
│
└── README.md