--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11
-- Dumped by pg_dump version 13beta3

-- Started on 2020-11-29 22:10:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

--
-- TOC entry 205 (class 1259 OID 16532)
-- Name: Item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Item" (
    "ItemID" integer NOT NULL,
    "RetailPrice" numeric NOT NULL,
    "StockQuantity" integer NOT NULL,
    "ItemName" text NOT NULL,
    "CostPrice" numeric NOT NULL,
    "Category" text NOT NULL
);


ALTER TABLE public."Item" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17292)
-- Name: ItemList; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ItemList" (
    "ItemListID" integer NOT NULL,
    "Quantity" integer NOT NULL,
    "ItemID" integer NOT NULL,
    "OrderID" integer NOT NULL
);


ALTER TABLE public."ItemList" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17290)
-- Name: ItemList_ItemListID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ItemList_ItemListID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ItemList_ItemListID_seq" OWNER TO postgres;

--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 211
-- Name: ItemList_ItemListID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ItemList_ItemListID_seq" OWNED BY public."ItemList"."ItemListID";


--
-- TOC entry 204 (class 1259 OID 16530)
-- Name: Item_ItemID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Item_ItemID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Item_ItemID_seq" OWNER TO postgres;

--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 204
-- Name: Item_ItemID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Item_ItemID_seq" OWNED BY public."Item"."ItemID";


--
-- TOC entry 203 (class 1259 OID 16521)
-- Name: Login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Login" (
    "ID" integer NOT NULL,
    "Password" text NOT NULL,
    "UserName" text NOT NULL
);


ALTER TABLE public."Login" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16519)
-- Name: Login_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Login_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Login_ID_seq" OWNER TO postgres;

--
-- TOC entry 4301 (class 0 OID 0)
-- Dependencies: 202
-- Name: Login_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Login_ID_seq" OWNED BY public."Login"."ID";


--
-- TOC entry 210 (class 1259 OID 16576)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    "OrderID" integer NOT NULL,
    "ConfirmationNumber" text NOT NULL,
    "OrderDateTime" text NOT NULL,
    "TotalPrice" numeric NOT NULL,
    "UserID" integer NOT NULL
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16574)
-- Name: Order_OrderID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Order_OrderID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Order_OrderID_seq" OWNER TO postgres;

--
-- TOC entry 4304 (class 0 OID 0)
-- Dependencies: 209
-- Name: Order_OrderID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Order_OrderID_seq" OWNED BY public."Order"."OrderID";


--
-- TOC entry 208 (class 1259 OID 16560)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "ID" integer NOT NULL,
    "FirstName" text NOT NULL,
    "LastName" text NOT NULL,
    "Email" text NOT NULL,
    "PhoneNumber" text,
    "DateOfBirth" date,
    "IsAdmin" boolean NOT NULL,
    "Gender" text,
    "Address" text NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16511)
-- Name: Vendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vendor" (
    "VendorName" text NOT NULL,
    "VendorID" integer NOT NULL,
    "VendorAdress" text NOT NULL
);


ALTER TABLE public."Vendor" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16543)
-- Name: Vendor_Items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vendor_Items" (
    "Vendor_ItemsID" integer NOT NULL,
    "VendorID" integer NOT NULL,
    "ItemID" integer NOT NULL
);


ALTER TABLE public."Vendor_Items" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16541)
-- Name: Vendor_Items_Vendor_ItemsID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Vendor_Items" ALTER COLUMN "Vendor_ItemsID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Vendor_Items_Vendor_ItemsID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 200 (class 1259 OID 16509)
-- Name: Vendor_VendorID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Vendor" ALTER COLUMN "VendorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Vendor_VendorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4124 (class 2604 OID 16535)
-- Name: Item ItemID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Item" ALTER COLUMN "ItemID" SET DEFAULT nextval('public."Item_ItemID_seq"'::regclass);


--
-- TOC entry 4126 (class 2604 OID 17295)
-- Name: ItemList ItemListID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ItemList" ALTER COLUMN "ItemListID" SET DEFAULT nextval('public."ItemList_ItemListID_seq"'::regclass);


--
-- TOC entry 4123 (class 2604 OID 16524)
-- Name: Login ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Login" ALTER COLUMN "ID" SET DEFAULT nextval('public."Login_ID_seq"'::regclass);


--
-- TOC entry 4125 (class 2604 OID 16579)
-- Name: Order OrderID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order" ALTER COLUMN "OrderID" SET DEFAULT nextval('public."Order_OrderID_seq"'::regclass);


--
-- TOC entry 4281 (class 0 OID 16532)
-- Dependencies: 205
-- Data for Name: Item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (451235, 14.99, 12, 'Aliante Brakes', 7.99, 'Brakes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (546123, 10.99, 12, 'Bottle Cage', 8.99, 'Accessories');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (546435, 25.99, 12, 'GP4000s Clincher Tire', 20.99, 'Tires');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (245632, 36.99, 12, 'Aluminum Handlebars', 30.99, 'Handlebars');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (985463, 1.99, 12, '700c Tube', 0.99, 'Tubes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (565387, 1.99, 12, '650c Tube', 1.59, 'Tubes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (112226, 5.99, 12, 'Hammer Bar', 2.99, 'Accessories');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (987987, 50.99, 12, '700c Front Wheel', 40.99, 'Wheels');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (983874, 81.99, 12, 'Carbon Stem', 70.99, 'Handlebars');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (321546, 54.99, 12, 'CK Headset', 40.99, 'Handlebars');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (546321, 16.99, 12, 'Socks', 6.99, 'Accessories');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (546655, 45.99, 12, 'Cork Brake Pads', 40.99, 'Brakes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (456635, 65.99, 12, 'Carbon Seatpost', 55.99, 'Frame');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (516132, 81.99, 12, 'Carbon Wheelset', 70.99, 'Wheels');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (987456, 54.99, 12, 'Vitorria Rubinbo Pro', 40.99, 'Tires');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (978465, 45.99, 12, 'Sram Red Calipers', 40.99, 'Brakes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (452545, 65.99, 12, 'Specialized Allez', 55.99, 'Frame');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (435562, 14.99, 12, 'Sora Brakes', 7.99, 'Brakes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (456453, 10.99, 12, 'Carbon Pedals', 8.99, 'Accessories');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (879545, 25.99, 12, 'Tanus 700c', 20.99, 'Tires');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (123546, 36.99, 12, 'Aero Handlebars', 30.99, 'Handlebars');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (458312, 1.99, 12, '700c light Tube', 0.99, 'Tubes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (865463, 1.99, 12, '650c light Tube', 1.59, 'Tubes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (456264, 5.99, 12, 'Energy Bar', 2.99, 'Accessories');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (546831, 50.99, 12, '700c Rear Wheel', 40.99, 'Wheels');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (754653, 16.99, 12, 'Bibs', 6.99, 'Accessories');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (658525, 45.99, 12, 'Carbon Brake Pads', 40.99, 'Brakes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (678832, 81.99, 12, 'Carbon/Aluminum Wheelset', 70.99, 'Wheels');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (944546, 54.99, 12, 'Vitorria AC4 ', 40.99, 'Tires');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (754543, 16.99, 12, 'Tublito Touring', 6.99, 'Tubes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (555643, 45.99, 12, 'Sram Force Calipers', 40.99, 'Brakes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (1, 1699.99, 4, '404 Firecrest', 1499.99, 'Wheels');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (2, 1599.00, 5, '303 FireCrest', 1299.00, 'Wheels');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (3, 1899.00, 3, '202 Fire crest', 1499.00, 'Wheels');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (4, 2599.00, 3, '808 NSW Carbon', 2099.00, 'Wheels');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (5, 2599.00, 4, '606 NSW', 2099.00, 'Wheels');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (6, 59.99, 23, 'Carbon Cage', 20.99, 'Accessories');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (7, 1.99, 100, 'Energy Waffle', 0.99, 'Accessories');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (981235, 19.99, 12, 'Tublito Race', 12.99, 'Tubes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (564532, 3500.99, 5, 'Specialized Tarmac', 3009.99, 'Frame');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (9, 129.99, 6, 'sram red', 89.99, 'Brakes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (215643, 54.99, 1, 'Threaded Headset', 40.99, 'Handlebars');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (875465, 81.99, 1, 'Aluminum Stem', 65.99, 'Handlebars');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (10, 129.99, 1, 'Sram Force Brakes', 100.99, 'Brakes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (11, 149.69, 12, 'Pista Crankset', 100.99, 'Brakes');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (8, 89.99, 3, 'Clip-on Aero Bars', 59.99, 'Handlebars');
INSERT INTO public."Item" ("ItemID", "RetailPrice", "StockQuantity", "ItemName", "CostPrice", "Category") VALUES (12, 89.99, -1, 'Sram Red headset', 50.99, 'Frame');


--
-- TOC entry 4288 (class 0 OID 17292)
-- Dependencies: 212
-- Data for Name: ItemList; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (1, 1, 456453, 10);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (2, 1, 112226, 11);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (3, 1, 754653, 11);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (4, 1, 985463, 12);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (5, 1, 944546, 12);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (6, 1, 987987, 12);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (7, 1, 987987, 13);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (8, 1, 564532, 14);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (9, 1, 678832, 15);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (10, 1, 981235, 16);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (11, 1, 754543, 17);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (12, 4, 981235, 17);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (13, 4, 865463, 17);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (14, 1, 985463, 17);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (15, 1, 987456, 18);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (16, 1, 754543, 18);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (17, 1, 215643, 19);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (18, 1, 875465, 19);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (19, 1, 215643, 20);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (20, 1, 983874, 20);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (21, 1, 983874, 20);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (22, 1, 983874, 20);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (23, 1, 983874, 20);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (24, 1, 546435, 21);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (25, 1, 546831, 22);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (26, 1, 754543, 23);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (27, 1, 944546, 24);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (28, 1, 456264, 25);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (29, 1, 6, 25);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (30, 1, 456453, 26);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (31, 1, 6, 26);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (32, 1, 678832, 27);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (33, 1, 5, 27);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (34, 1, 456264, 28);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (35, 1, 879545, 28);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (36, 1, 458312, 28);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (37, 1, 458312, 28);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (38, 2, 458312, 29);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (39, 1, 4, 29);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (40, 1, 555643, 29);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (41, 1, 2, 30);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (42, 2, 435562, 30);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (43, 1, 452545, 30);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (44, 1, 985463, 31);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (45, 1, 546321, 31);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (46, 1, 555643, 32);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (47, 3, 678832, 33);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (48, 1, 4, 33);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (49, 1, 987987, 33);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (50, 2, 546435, 34);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (51, 1, 546123, 34);
INSERT INTO public."ItemList" ("ItemListID", "Quantity", "ItemID", "OrderID") VALUES (52, 1, 456264, 34);


--
-- TOC entry 4279 (class 0 OID 16521)
-- Dependencies: 203
-- Data for Name: Login; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (16, '123', 'hiker');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (12, '123', 'bike123');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (1, '123', 'IloveBikes');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (19, '123', 'bomber');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (18, '123', 'Bwin');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (17, '123', 'azbiker');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (14, '123', 'newt');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (22, '123', 'bikezzz');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (23, '123', 'trek4life');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (24, 'admin', 'admin');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (15, '1234', 'turtle2');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (25, '123', 'biketest');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (26, '124', 'bike124');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (27, '123', 'bikesss');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (13, '123', 'specbikes');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (28, '1234', 'bike1234');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (29, '123', 'bikes12345');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (30, '123', 'bikes1');
INSERT INTO public."Login" ("ID", "Password", "UserName") VALUES (31, '1234', 'bike12');


--
-- TOC entry 4286 (class 0 OID 16576)
-- Dependencies: 210
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (10, 'e88318c0-1d17-46f2-8b62-7e05499e0ada', '11/23/2020', 10.99, 1);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (11, 'fc3decd1-1c70-4ef8-8761-e4c5ef29db77', '11/23/2020', 22.98, 1);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (12, '47b78849-edea-4f86-8199-b9ec455940fe', '11/23/2020', 107.97, 1);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (13, 'f26e3030-af59-4c0a-ba83-497b04f0affa', '11/23/2020', 50.99, 1);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (14, '33cb652c-4558-498e-aaac-834d0ebc57db', '11/23/2020', 65.99, 1);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (15, '5b52e387-d5fb-4445-aa60-0414067b6740', '11/23/2020', 81.99, 1);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (16, '0d9c6501-276f-4adb-9ea3-01b700f3712a', '11/23/2020', 16.99, 1);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (17, '3ecad2d4-d85c-462b-ba79-ea2e155eaf66', '11/23/2020', 94.90, 14);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (18, '12759e6f-fdcb-4057-8f73-06378b59c499', '11/23/2020', 71.98, 16);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (19, '197a9875-93ad-4b1c-b2e3-56bc51c028d0', '11/23/2020', 136.98, 16);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (20, 'a26d08ed-a303-4a7d-a909-703110b19d02', '11/23/2020', 382.95, 16);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (21, '50267960-0297-4991-a2f7-9f4a25635686', '11/24/2020', 25.99, 12);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (22, '49d044b3-a4fc-460b-a536-75972832827c', '11/24/2020', 50.99, 16);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (23, 'ea993e2e-db2a-4edd-a052-6e284c0d40fc', '11/24/2020', 16.99, 16);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (24, '8cbf1351-0944-45fb-8d5d-2a5f2dd57c19', '11/25/2020', 54.99, 12);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (25, '5611a21d-06c4-44bb-948a-aa79071b84f0', '11/25/2020', 65.98, 16);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (26, '6552118a-d3a9-47b7-b1da-7c4a0b665719', '11/25/2020', 70.98, 12);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (27, 'c5a6b5ec-6f2a-448d-bb22-e87b1799c3d6', '11/25/2020', 2680.99, 16);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (28, 'c3f87797-b3e8-4c34-8120-749cc0a9f402', '11/25/2020', 35.96, 16);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (29, '5373455f-2ccd-441a-a03f-4752af830b7c', '11/27/2020', 2648.97, 12);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (30, 'e6f1383a-8706-42a9-a8e8-79e6798fc50c', '11/28/2020', 1694.97, 25);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (31, '2c261782-ec47-475a-8f77-2264a9ecc796', '11/28/2020', 18.98, 25);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (32, '80e1fe5d-20dd-444d-87e7-8d2f7f87ee98', '11/28/2020', 45.99, 26);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (33, 'cbf73e5f-b06f-44a5-8927-4504a4aada59', '11/28/2020', 2895.96, 12);
INSERT INTO public."Order" ("OrderID", "ConfirmationNumber", "OrderDateTime", "TotalPrice", "UserID") VALUES (34, 'bde8c28d-c8f3-4566-aab9-a2a685cd17d7', '11/28/2020', 68.96, 30);


--
-- TOC entry 4284 (class 0 OID 16560)
-- Dependencies: 208
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (13, 'Ron', 'Paul', 'rpaul@gmail.com', '877-789-1235', '2020-11-22', false, 'male', '4888 E Walnut St. Chandler, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (14, 'John', 'Jordan', 'jjordanl@gmail.com', '877-845-1235', '2020-11-22', true, 'male', '7855 Jefferson St. Tempe, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (15, 'Janelle', 'Jackson', 'jjackson@gmail.com', '877-845-4521', '2020-11-22', false, 'female', '7891 Peach St. Tempe, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (19, 'Renee', 'Jones', 'AMiller@gmail.com', '115-877-4521', '2020-11-22', false, 'female', '4521 Priest rd. Tempe, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (18, 'Andrew', 'Miller', 'AMiller@gmail.com', '877-877-4521', '2020-11-22', true, 'male', '4441 Hayden  rd. Buckeye, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (17, 'Mike', 'Porter', 'MPorter@gmail.com', '877-845-4521', '2020-11-22', false, 'male', '4441 Hayden  rd. Scottsdale, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (1, 'John', 'McCory', 'tjvan@gmail.com', '488-879-2154', '2020-01-01', false, 'test', '1231 E Oak Ave,  Tempe, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (22, 'Larry', 'Feldman', 'lfeldman@gmail.com', '779-945-2655', '1987-12-23', false, 'male', '122 Rosey Ln. Pittsburgh, PA');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (16, 'Ted', 'Kaczynski', 'tkaczynski@gmail.com', '877-845-4556', '2020-11-22', false, 'male', '7899 Bell rd. Phoenix, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (23, 'Mark', 'Turner', 'mturner@gmail.com', '887-987-5784', '1989-07-18', true, 'male', '2233 E Rio Verde, Payson, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (25, 'Peter', 'Marino', 'jmarion@gmail.com', '487-987-7895', '1986-05-12', false, 'male', '3484 Vincent Dr. Dublin, OH');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (26, 'John', 'Miller', 'jm@gmail.com', '545-569-1231', '1996-12-23', true, 'male', '3243 E Oak St. Scottsdale, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (27, 'Carson', 'Biden', 'cb123@gmail.com', '456-879-2122', '1994-12-23', true, 'male', '1676 E Cherry Ln. Tempe, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (24, 'Daniel', 'Store', 'ds222@gmail.com', '558-697-1235', '1993-02-13', true, 'male', '213 W Johnson St. Tacoma, WA');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (28, 'Bill', 'Burr', 'bb1234@gmail.com', '445-987-3256', '1978-06-12', false, 'male', '45231 E Miller Ln.  Tacoma, WA');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (12, 'Bob', 'Smith', 'bsmith@gmail.com', '548-789-1545', '2020-11-22', true, 'male', '8321 E Oak St. Scottsdale, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (29, 'Larry', 'Feldman', 'lfeldman@gmail.com', '654-1954', '1987-12-23', false, 'male', '3243 E Cherry St. Portland, OR');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (30, 'Nick', 'Jones', 'njones@gmail.com', '547-789-1478', '1987-12-23', false, 'male', '1234 E Cherry Ln. Tempe, AZ');
INSERT INTO public."User" ("ID", "FirstName", "LastName", "Email", "PhoneNumber", "DateOfBirth", "IsAdmin", "Gender", "Address") VALUES (31, 'Bill', 'Smith', 'bsmith@gmail.com', '574-586-9874', '1996-05-13', false, 'male', '4561 E Oak st. Scottsdale, AZ');


--
-- TOC entry 4277 (class 0 OID 16511)
-- Dependencies: 201
-- Data for Name: Vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Vendor" ("VendorName", "VendorID", "VendorAdress") OVERRIDING SYSTEM VALUE VALUES ('Vittoria', 1, 'Milan, Italy');
INSERT INTO public."Vendor" ("VendorName", "VendorID", "VendorAdress") OVERRIDING SYSTEM VALUE VALUES ('Zipp', 2, 'Paris, France');
INSERT INTO public."Vendor" ("VendorName", "VendorID", "VendorAdress") OVERRIDING SYSTEM VALUE VALUES ('Enve', 3, 'Stockholm, Sweden');
INSERT INTO public."Vendor" ("VendorName", "VendorID", "VendorAdress") OVERRIDING SYSTEM VALUE VALUES ('Rema Tip Top', 4, 'Berlin, Germany');
INSERT INTO public."Vendor" ("VendorName", "VendorID", "VendorAdress") OVERRIDING SYSTEM VALUE VALUES ('Stinger', 5, 'Durando, CO, USA');
INSERT INTO public."Vendor" ("VendorName", "VendorID", "VendorAdress") OVERRIDING SYSTEM VALUE VALUES ('Sram', 6, 'Denver, CO');
INSERT INTO public."Vendor" ("VendorName", "VendorID", "VendorAdress") OVERRIDING SYSTEM VALUE VALUES ('Specialized', 7, 'Chicago, IL');
INSERT INTO public."Vendor" ("VendorName", "VendorID", "VendorAdress") OVERRIDING SYSTEM VALUE VALUES ('Campagnolo', 8, 'Milan, Italy');
INSERT INTO public."Vendor" ("VendorName", "VendorID", "VendorAdress") OVERRIDING SYSTEM VALUE VALUES ('Canyon', 9, 'Berlin, Germany');


--
-- TOC entry 4283 (class 0 OID 16543)
-- Dependencies: 207
-- Data for Name: Vendor_Items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (14, 1, 451235);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (15, 1, 546123);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (16, 1, 546435);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (17, 1, 245632);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (18, 1, 985463);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (19, 1, 565387);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (20, 1, 112226);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (21, 1, 987987);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (22, 1, 983874);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (23, 1, 321546);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (24, 1, 546321);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (25, 1, 546655);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (26, 1, 456635);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (27, 1, 516132);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (28, 1, 987456);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (29, 1, 981235);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (30, 1, 978465);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (31, 1, 452545);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (32, 1, 435562);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (33, 1, 456453);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (34, 1, 879545);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (35, 1, 123546);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (36, 1, 458312);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (37, 1, 865463);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (38, 1, 456264);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (39, 1, 546831);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (40, 1, 875465);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (41, 1, 215643);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (43, 1, 658525);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (45, 1, 678832);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (47, 1, 754543);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (48, 1, 555643);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (49, 1, 564532);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (51, 2, 5);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (52, 3, 6);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (53, 5, 7);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (54, 3, 8);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (55, 2, 9);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (56, 6, 10);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (57, 3, 11);
INSERT INTO public."Vendor_Items" ("Vendor_ItemsID", "VendorID", "ItemID") OVERRIDING SYSTEM VALUE VALUES (58, 6, 12);


--
-- TOC entry 4309 (class 0 OID 0)
-- Dependencies: 211
-- Name: ItemList_ItemListID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ItemList_ItemListID_seq"', 52, true);


--
-- TOC entry 4310 (class 0 OID 0)
-- Dependencies: 204
-- Name: Item_ItemID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Item_ItemID_seq"', 12, true);


--
-- TOC entry 4311 (class 0 OID 0)
-- Dependencies: 202
-- Name: Login_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Login_ID_seq"', 31, true);


--
-- TOC entry 4312 (class 0 OID 0)
-- Dependencies: 209
-- Name: Order_OrderID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Order_OrderID_seq"', 34, true);


--
-- TOC entry 4313 (class 0 OID 0)
-- Dependencies: 206
-- Name: Vendor_Items_Vendor_ItemsID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Vendor_Items_Vendor_ItemsID_seq"', 58, true);


--
-- TOC entry 4314 (class 0 OID 0)
-- Dependencies: 200
-- Name: Vendor_VendorID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Vendor_VendorID_seq"', 9, true);


--
-- TOC entry 4138 (class 2606 OID 16567)
-- Name: User PK_administrator; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "PK_administrator" PRIMARY KEY ("ID");


--
-- TOC entry 4132 (class 2606 OID 16540)
-- Name: Item PK_item; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT "PK_item" PRIMARY KEY ("ItemID");


--
-- TOC entry 4144 (class 2606 OID 17297)
-- Name: ItemList PK_itemlist; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ItemList"
    ADD CONSTRAINT "PK_itemlist" PRIMARY KEY ("ItemListID");


--
-- TOC entry 4130 (class 2606 OID 16529)
-- Name: Login PK_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Login"
    ADD CONSTRAINT "PK_login" PRIMARY KEY ("ID");


--
-- TOC entry 4141 (class 2606 OID 16584)
-- Name: Order PK_order; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "PK_order" PRIMARY KEY ("OrderID");


--
-- TOC entry 4128 (class 2606 OID 16518)
-- Name: Vendor PK_vendor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vendor"
    ADD CONSTRAINT "PK_vendor" PRIMARY KEY ("VendorID");


--
-- TOC entry 4134 (class 2606 OID 16547)
-- Name: Vendor_Items PK_vendor_items; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vendor_Items"
    ADD CONSTRAINT "PK_vendor_items" PRIMARY KEY ("Vendor_ItemsID");


--
-- TOC entry 4135 (class 1259 OID 16558)
-- Name: fkIdx_111; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fkIdx_111" ON public."Vendor_Items" USING btree ("VendorID");


--
-- TOC entry 4136 (class 1259 OID 16559)
-- Name: fkIdx_114; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fkIdx_114" ON public."Vendor_Items" USING btree ("ItemID");


--
-- TOC entry 4145 (class 1259 OID 17308)
-- Name: fkIdx_119; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fkIdx_119" ON public."ItemList" USING btree ("OrderID");


--
-- TOC entry 4139 (class 1259 OID 16573)
-- Name: fkIdx_38; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fkIdx_38" ON public."User" USING btree ("ID");


--
-- TOC entry 4142 (class 1259 OID 16590)
-- Name: fkIdx_86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fkIdx_86" ON public."Order" USING btree ("UserID");


--
-- TOC entry 4146 (class 1259 OID 17309)
-- Name: fkIdx_95; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fkIdx_95" ON public."ItemList" USING btree ("ItemID");


--
-- TOC entry 4147 (class 2606 OID 16548)
-- Name: Vendor_Items FK_111; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vendor_Items"
    ADD CONSTRAINT "FK_111" FOREIGN KEY ("VendorID") REFERENCES public."Vendor"("VendorID");


--
-- TOC entry 4148 (class 2606 OID 16553)
-- Name: Vendor_Items FK_114; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vendor_Items"
    ADD CONSTRAINT "FK_114" FOREIGN KEY ("ItemID") REFERENCES public."Item"("ItemID");


--
-- TOC entry 4151 (class 2606 OID 17298)
-- Name: ItemList FK_119; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ItemList"
    ADD CONSTRAINT "FK_119" FOREIGN KEY ("OrderID") REFERENCES public."Order"("OrderID");


--
-- TOC entry 4149 (class 2606 OID 16568)
-- Name: User FK_38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "FK_38" FOREIGN KEY ("ID") REFERENCES public."Login"("ID");


--
-- TOC entry 4150 (class 2606 OID 16585)
-- Name: Order FK_86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "FK_86" FOREIGN KEY ("UserID") REFERENCES public."User"("ID");


--
-- TOC entry 4152 (class 2606 OID 17303)
-- Name: ItemList FK_95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ItemList"
    ADD CONSTRAINT "FK_95" FOREIGN KEY ("ItemID") REFERENCES public."Item"("ItemID");


--
-- TOC entry 4294 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE "Item"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Item" TO norm_user;


--
-- TOC entry 4295 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE "ItemList"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."ItemList" TO norm_user;


--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 211
-- Name: SEQUENCE "ItemList_ItemListID_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,UPDATE ON SEQUENCE public."ItemList_ItemListID_seq" TO norm_user;


--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 204
-- Name: SEQUENCE "Item_ItemID_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,UPDATE ON SEQUENCE public."Item_ItemID_seq" TO norm_user;


--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE "Login"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Login" TO norm_user;


--
-- TOC entry 4302 (class 0 OID 0)
-- Dependencies: 202
-- Name: SEQUENCE "Login_ID_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,UPDATE ON SEQUENCE public."Login_ID_seq" TO norm_user;


--
-- TOC entry 4303 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE "Order"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Order" TO norm_user;


--
-- TOC entry 4305 (class 0 OID 0)
-- Dependencies: 209
-- Name: SEQUENCE "Order_OrderID_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,UPDATE ON SEQUENCE public."Order_OrderID_seq" TO norm_user;


--
-- TOC entry 4306 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE "User"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."User" TO norm_user;


--
-- TOC entry 4307 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE "Vendor"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Vendor" TO norm_user;


--
-- TOC entry 4308 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE "Vendor_Items"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Vendor_Items" TO norm_user;


-- Completed on 2020-11-29 22:11:09

--
-- PostgreSQL database dump complete
--

