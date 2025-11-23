--
-- PostgreSQL database dump
--

\restrict lqIahr4bhw6j7mumy21DolLz3ZWZ1err4iJzHCtg4bKqwDgROdiZeEXv6ANtRr8

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2025-11-23 11:23:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16389)
-- Name: olist_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA olist_data;


ALTER SCHEMA olist_data OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 16493)
-- Name: closed_deals_clean; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.closed_deals_clean (
    mql_id character varying(50) CONSTRAINT closed_deals_mql_id_not_null NOT NULL,
    seller_id character varying(50),
    sdr_id character varying(50),
    sr_id character varying(50),
    won_date timestamp without time zone,
    business_segment character varying(50),
    lead_type character varying(50),
    lead_behaviour_profile character varying(50),
    has_company boolean,
    has_gtin boolean,
    average_stock character varying(50),
    business_type character varying(50),
    declared_product_catalog_size real,
    declared_monthly_revenue real
);


ALTER TABLE olist_data.closed_deals_clean OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16692)
-- Name: closed_deals_raw; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.closed_deals_raw (
    mql_id character varying(50),
    seller_id character varying(50),
    sdr_id character varying(50),
    sr_id character varying(50),
    won_date character varying(50),
    business_segment character varying(50),
    lead_type character varying(50),
    lead_behaviour_profile character varying(50),
    has_company boolean,
    has_gtin boolean,
    average_stock character varying(50),
    business_type character varying(50),
    declared_product_catalog_size real,
    declared_monthly_revenue real
);


ALTER TABLE olist_data.closed_deals_raw OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: customers; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.customers (
    customer_id character varying(50) NOT NULL,
    customer_unique_id character varying(50),
    customer_zip_code_prefix character varying(50),
    customer_city character varying(50),
    customer_state character varying(50)
);


ALTER TABLE olist_data.customers OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16699)
-- Name: location_clean; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.location_clean (
    zip_code_prefix integer NOT NULL,
    lat double precision,
    lng double precision,
    city character varying,
    state character varying
);


ALTER TABLE olist_data.location_clean OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16396)
-- Name: location_raw; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.location_raw (
    geolocation_zip_code_prefix character varying(50),
    geolocation_lat real,
    geolocation_lng real,
    geolocation_city character varying(50),
    geolocation_state character varying(50)
);


ALTER TABLE olist_data.location_raw OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16400)
-- Name: order_items; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.order_items (
    order_id character varying(50) NOT NULL,
    order_item_id character varying(50) NOT NULL,
    product_id character varying(50),
    seller_id character varying(50),
    shipping_limit_date timestamp without time zone,
    price numeric(12,2),
    freight_value numeric(12,2)
);


ALTER TABLE olist_data.order_items OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16454)
-- Name: orders; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.orders (
    order_id character varying(50) NOT NULL,
    customer_id character varying(50),
    order_status character varying(50),
    order_purchase_timestamp timestamp without time zone,
    order_approved_at timestamp without time zone,
    order_delivered_carrier_date timestamp without time zone,
    order_delivered_customer_date timestamp without time zone,
    order_estimated_delivery_date date
);


ALTER TABLE olist_data.orders OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16408)
-- Name: payments; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.payments (
    order_id character varying(50) NOT NULL,
    payment_sequential integer NOT NULL,
    payment_type character varying(50),
    payment_installments integer,
    payment_value real
);


ALTER TABLE olist_data.payments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16468)
-- Name: product_category_name; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.product_category_name (
    product_category_name character varying(50) NOT NULL,
    product_category_name_english character varying(50)
);


ALTER TABLE olist_data.product_category_name OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16459)
-- Name: products; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.products (
    product_id character varying(50) NOT NULL,
    product_category_name character varying(50),
    product_name_lenght integer,
    product_description_lenght integer,
    product_photos_qty integer,
    product_weight_g integer,
    product_length_cm integer,
    product_height_cm integer,
    product_width_cm integer
);


ALTER TABLE olist_data.products OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16500)
-- Name: qualified_leads; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.qualified_leads (
    mql_id character varying(50) NOT NULL,
    first_contact_date date,
    landing_page_id character varying(50),
    origin character varying(50)
);


ALTER TABLE olist_data.qualified_leads OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16484)
-- Name: reviews; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.reviews (
    review_id character varying(50),
    order_id character varying(50),
    review_score integer,
    review_comment_title character varying(50),
    review_comment_message character varying(256),
    review_creation_date date,
    review_answer_timestamp timestamp without time zone,
    review_row_id bigint NOT NULL
);


ALTER TABLE olist_data.reviews OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24706)
-- Name: reviews_review_row_id_seq; Type: SEQUENCE; Schema: olist_data; Owner: postgres
--

CREATE SEQUENCE olist_data.reviews_review_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE olist_data.reviews_review_row_id_seq OWNER TO postgres;

--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 233
-- Name: reviews_review_row_id_seq; Type: SEQUENCE OWNED BY; Schema: olist_data; Owner: postgres
--

ALTER SEQUENCE olist_data.reviews_review_row_id_seq OWNED BY olist_data.reviews.review_row_id;


--
-- TOC entry 226 (class 1259 OID 16463)
-- Name: sellers; Type: TABLE; Schema: olist_data; Owner: postgres
--

CREATE TABLE olist_data.sellers (
    seller_id character varying(50) NOT NULL,
    seller_zip_code_prefix character varying(50),
    seller_city character varying(50),
    seller_state character varying(50)
);


ALTER TABLE olist_data.sellers OWNER TO postgres;

--
-- TOC entry 4905 (class 2604 OID 24707)
-- Name: reviews review_row_id; Type: DEFAULT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.reviews ALTER COLUMN review_row_id SET DEFAULT nextval('olist_data.reviews_review_row_id_seq'::regclass);


--
-- TOC entry 4919 (class 2606 OID 16648)
-- Name: product_category_name pk_categories; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.product_category_name
    ADD CONSTRAINT pk_categories PRIMARY KEY (product_category_name);


--
-- TOC entry 4925 (class 2606 OID 16671)
-- Name: closed_deals_clean pk_closed_deals; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.closed_deals_clean
    ADD CONSTRAINT pk_closed_deals PRIMARY KEY (mql_id);


--
-- TOC entry 4907 (class 2606 OID 16606)
-- Name: customers pk_customers; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);


--
-- TOC entry 4929 (class 2606 OID 16714)
-- Name: location_clean pk_location_clean; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.location_clean
    ADD CONSTRAINT pk_location_clean PRIMARY KEY (zip_code_prefix);


--
-- TOC entry 4909 (class 2606 OID 24705)
-- Name: order_items pk_order_items; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.order_items
    ADD CONSTRAINT pk_order_items PRIMARY KEY (order_id, order_item_id);


--
-- TOC entry 4913 (class 2606 OID 16614)
-- Name: orders pk_orders; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);


--
-- TOC entry 4911 (class 2606 OID 24701)
-- Name: payments pk_payments; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.payments
    ADD CONSTRAINT pk_payments PRIMARY KEY (order_id, payment_sequential);


--
-- TOC entry 4915 (class 2606 OID 16617)
-- Name: products pk_products; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.products
    ADD CONSTRAINT pk_products PRIMARY KEY (product_id);


--
-- TOC entry 4927 (class 2606 OID 16674)
-- Name: qualified_leads pk_qualified_leads; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.qualified_leads
    ADD CONSTRAINT pk_qualified_leads PRIMARY KEY (mql_id);


--
-- TOC entry 4917 (class 2606 OID 16640)
-- Name: sellers pk_sellers; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.sellers
    ADD CONSTRAINT pk_sellers PRIMARY KEY (seller_id);


--
-- TOC entry 4921 (class 2606 OID 24710)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_row_id);


--
-- TOC entry 4923 (class 2606 OID 24716)
-- Name: reviews uq_reviews_orderid_reviewid; Type: CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.reviews
    ADD CONSTRAINT uq_reviews_orderid_reviewid UNIQUE (order_id, review_id);


--
-- TOC entry 4937 (class 2606 OID 16675)
-- Name: closed_deals_clean fk_deals_mql; Type: FK CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.closed_deals_clean
    ADD CONSTRAINT fk_deals_mql FOREIGN KEY (mql_id) REFERENCES olist_data.qualified_leads(mql_id);


--
-- TOC entry 4938 (class 2606 OID 16687)
-- Name: closed_deals_clean fk_deals_sellers; Type: FK CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.closed_deals_clean
    ADD CONSTRAINT fk_deals_sellers FOREIGN KEY (seller_id) REFERENCES olist_data.sellers(seller_id);


--
-- TOC entry 4930 (class 2606 OID 16623)
-- Name: order_items fk_items_order; Type: FK CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.order_items
    ADD CONSTRAINT fk_items_order FOREIGN KEY (order_id) REFERENCES olist_data.orders(order_id);


--
-- TOC entry 4931 (class 2606 OID 16618)
-- Name: order_items fk_items_product; Type: FK CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.order_items
    ADD CONSTRAINT fk_items_product FOREIGN KEY (product_id) REFERENCES olist_data.products(product_id);


--
-- TOC entry 4932 (class 2606 OID 16641)
-- Name: order_items fk_items_seller; Type: FK CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.order_items
    ADD CONSTRAINT fk_items_seller FOREIGN KEY (seller_id) REFERENCES olist_data.sellers(seller_id);


--
-- TOC entry 4934 (class 2606 OID 16607)
-- Name: orders fk_orders_customer; Type: FK CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.orders
    ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES olist_data.customers(customer_id);


--
-- TOC entry 4933 (class 2606 OID 16628)
-- Name: payments fk_payment_order; Type: FK CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.payments
    ADD CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES olist_data.orders(order_id);


--
-- TOC entry 4935 (class 2606 OID 16664)
-- Name: products fk_products_category; Type: FK CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.products
    ADD CONSTRAINT fk_products_category FOREIGN KEY (product_category_name) REFERENCES olist_data.product_category_name(product_category_name);


--
-- TOC entry 4936 (class 2606 OID 16633)
-- Name: reviews fk_review_order; Type: FK CONSTRAINT; Schema: olist_data; Owner: postgres
--

ALTER TABLE ONLY olist_data.reviews
    ADD CONSTRAINT fk_review_order FOREIGN KEY (order_id) REFERENCES olist_data.orders(order_id);


-- Completed on 2025-11-23 11:23:14

--
-- PostgreSQL database dump complete
--

\unrestrict lqIahr4bhw6j7mumy21DolLz3ZWZ1err4iJzHCtg4bKqwDgROdiZeEXv6ANtRr8

