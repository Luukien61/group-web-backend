--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 15.6

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

SET default_table_access_method = heap;

--
-- Name: carousel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carousel (
    id bigint NOT NULL,
    image_url character varying(255),
    target_url character varying(255),
    title character varying(255)
);


ALTER TABLE public.carousel OWNER TO postgres;

--
-- Name: carousel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carousel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carousel_id_seq OWNER TO postgres;

--
-- Name: carousel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carousel_id_seq OWNED BY public.carousel.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color (
    id bigint NOT NULL,
    color character varying(255),
    link character varying(255),
    product_id character varying(255)
);


ALTER TABLE public.color OWNER TO postgres;

--
-- Name: color_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.color_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.color_id_seq OWNER TO postgres;

--
-- Name: color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.color_id_seq OWNED BY public.color.id;


--
-- Name: content_children; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_children (
    id bigint NOT NULL,
    content text,
    image character varying(255),
    title text,
    description_id bigint
);


ALTER TABLE public.content_children OWNER TO postgres;

--
-- Name: content_children_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.content_children_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_children_id_seq OWNER TO postgres;

--
-- Name: content_children_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.content_children_id_seq OWNED BY public.content_children.id;


--
-- Name: description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.description (
    id bigint NOT NULL,
    title text,
    product_id character varying(255)
);


ALTER TABLE public.description OWNER TO postgres;

--
-- Name: description_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_id_seq OWNER TO postgres;

--
-- Name: description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.description_id_seq OWNED BY public.description.id;


--
-- Name: feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feature (
    id bigint NOT NULL,
    os character varying(255),
    battery integer NOT NULL,
    chip character varying(255),
    made_time timestamp(6) without time zone,
    screen character varying(255),
    product_id character varying(255)
);


ALTER TABLE public.feature OWNER TO postgres;

--
-- Name: feature_front_camera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feature_front_camera (
    feature_id bigint NOT NULL,
    front_camera integer
);


ALTER TABLE public.feature_front_camera OWNER TO postgres;

--
-- Name: feature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feature_id_seq OWNER TO postgres;

--
-- Name: feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feature_id_seq OWNED BY public.feature.id;


--
-- Name: feature_rear_camera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feature_rear_camera (
    feature_id bigint NOT NULL,
    rear_camera integer
);


ALTER TABLE public.feature_rear_camera OWNER TO postgres;

--
-- Name: order_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_entity (
    order_id character varying(255) NOT NULL,
    done boolean,
    email character varying(255),
    phone character varying(255),
    "time" timestamp(6) without time zone,
    product_id character varying(255)
);


ALTER TABLE public.order_entity OWNER TO postgres;

--
-- Name: price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price (
    id bigint NOT NULL,
    current_price bigint NOT NULL,
    previous_price bigint NOT NULL,
    ram integer NOT NULL,
    rom integer NOT NULL,
    feature_id bigint,
    product_id character varying(255)
);


ALTER TABLE public.price OWNER TO postgres;

--
-- Name: price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_id_seq OWNER TO postgres;

--
-- Name: price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_id_seq OWNED BY public.price.id;


--
-- Name: producer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producer (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.producer OWNER TO postgres;

--
-- Name: producer_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producer_category (
    producer character varying(255) NOT NULL,
    category character varying(255) NOT NULL
);


ALTER TABLE public.producer_category OWNER TO postgres;

--
-- Name: producer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producer_id_seq OWNER TO postgres;

--
-- Name: producer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producer_id_seq OWNED BY public.producer.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id character varying(255) NOT NULL,
    available integer,
    name character varying(255),
    ordering integer,
    total_quantity integer,
    category_name character varying(255),
    producer_name character varying(255)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    product_id character varying(255) NOT NULL,
    image_url character varying(255)
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating (
    id bigint NOT NULL,
    average real,
    five_starts integer,
    four_starts integer,
    one_start integer,
    three_starts integer,
    two_starts integer,
    product_id character varying(255)
);


ALTER TABLE public.rating OWNER TO postgres;

--
-- Name: rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_id_seq OWNER TO postgres;

--
-- Name: rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rating_id_seq OWNED BY public.rating.id;


--
-- Name: staff_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_user (
    staffid bigint NOT NULL,
    active_state boolean,
    email character varying(255),
    full_name character varying(255),
    password character varying(255),
    phone character varying(255),
    role character varying(255),
    CONSTRAINT staff_user_role_check CHECK (((role)::text = ANY ((ARRAY['ADMIN'::character varying, 'USER'::character varying])::text[])))
);


ALTER TABLE public.staff_user OWNER TO postgres;

--
-- Name: staff_user_staffid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_user_staffid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_user_staffid_seq OWNER TO postgres;

--
-- Name: staff_user_staffid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_user_staffid_seq OWNED BY public.staff_user.staffid;


--
-- Name: carousel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carousel ALTER COLUMN id SET DEFAULT nextval('public.carousel_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: color id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color ALTER COLUMN id SET DEFAULT nextval('public.color_id_seq'::regclass);


--
-- Name: content_children id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_children ALTER COLUMN id SET DEFAULT nextval('public.content_children_id_seq'::regclass);


--
-- Name: description id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.description ALTER COLUMN id SET DEFAULT nextval('public.description_id_seq'::regclass);


--
-- Name: feature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature ALTER COLUMN id SET DEFAULT nextval('public.feature_id_seq'::regclass);


--
-- Name: price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price ALTER COLUMN id SET DEFAULT nextval('public.price_id_seq'::regclass);


--
-- Name: producer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producer ALTER COLUMN id SET DEFAULT nextval('public.producer_id_seq'::regclass);


--
-- Name: rating id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating ALTER COLUMN id SET DEFAULT nextval('public.rating_id_seq'::regclass);


--
-- Name: staff_user staffid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_user ALTER COLUMN staffid SET DEFAULT nextval('public.staff_user_staffid_seq'::regclass);


--
-- Data for Name: carousel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carousel (id, image_url, target_url, title) FROM stdin;
14	https://cf.shopee.vn/file/vn-50009109-ef70adc7de1303daea0e33495fb0f9e1	\N	item
15	https://cf.shopee.vn/file/vn-50009109-1ed280f6263978ba668fc6c3b9d0b51e	\N	item
16	https://cf.shopee.vn/file/vn-50009109-465fc7a5a9d0ea56780eeb7423e2c1a8	\N	item
17	https://cf.shopee.vn/file/vn-50009109-fbc8ddb6fd096fd82480492d9aa361fb	\N	item
18	https://cf.shopee.vn/file/vn-50009109-7d7509f6cc4dc199b9010e3a1c045dd1	\N	item
19	https://cf.shopee.vn/file/vn-50009109-fbe44d297671fe3bd2d81efb80f334d8	\N	item
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
1	Phone
2	Laptop
3	Camera
4	Tablet
\.


--
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.color (id, color, link, product_id) FROM stdin;
1	White	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-1-180x125.jpg	tiandy-tc-h322n
2	Gray	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-glr-1.jpg	laptop-lenovo-ideapad-slim-3
3	Titan đen	https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-black-1-1.jpg	iphone-15-pro-max
4	Titan xanh	https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-blue-1-1.jpg	iphone-15-pro-max
5	Titan tự nhiên	https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-tu-nhien-1-1.jpg	iphone-15-pro-max
6	Titan trắng	https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-white-1-3.jpg	iphone-15-pro-max
7	Ice Blue	https://product.hstatic.net/200000722513/product/ava_7a60a95da9ad4f79937195617962b252_grande.png	laptop-dell-inspiron-14-5440
8	White	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-2-180x125.jpg	tp-link-tapo-tc70
9	Cool Silver	https://product.hstatic.net/200000722513/product/vobook_14_oled_x1405v_m1405y_cool_silver_black_keyboard_13_fingerprint_6701c548b729416d90498bdac33dec13_grande.png	laptop-asus-vivobook-14-oled
10	Xanh lá nhạt	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-128gb-xanh-la-2.jpg	điện-thoại-iphone-15-128gb
12	Hồng nhạt	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-128gb-hong-2.jpg	điện-thoại-iphone-15-128gb
13	Vàng nhạt	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-128gb-vang-2.jpg	điện-thoại-iphone-15-128gb
14	Đen	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-den-1.jpg	điện-thoại-iphone-15-128gb
15	White	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-media-1-180x125.jpg	imou-ranger-rc-gk2cp-3c0wr
16	Black	https://product.hstatic.net/200000722513/product/avaa_30445ba7fd854cf3bd3466ced4524345_grande.png	laptop-asus-expertbook-b1
17	Cool Silver 	https://product.hstatic.net/200000722513/product/ava_cfdad38df2384d0f86ab45a7bfaca057_grande.png	laptop-asus-vivobook-16
18	White	https://cdn.tgdd.vn/Products/Images/4728/319451/camera-ip-360-do-3mp-botslab-c212-1-1-180x125.jpg	botslab-c212
19	Trắng	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-trang-1-2-org.jpg	điện-thoại-iphone-11-64gb
20	Đen	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-den-1-1-1-org.jpg	điện-thoại-iphone-11-64gb
21	Ponder Blue	https://product.hstatic.net/200000722513/product/kn039-038w_abb468763fe247e5954f006769534311_grande.png	laptop-asus-zenbook-flip-oled
22	Xanh lá	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-xanh-glr-1.jpg	điện-thoại-iphone-13-128gb
23	Hồng	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-1-3.jpg	điện-thoại-iphone-13-128gb
24	Đen	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-1-2.jpg	điện-thoại-iphone-13-128gb
25	Trằng	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-1-4.jpg	điện-thoại-iphone-13-128gb
26	Xanh dương	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-xanh-1.jpg	điện-thoại-iphone-13-128gb
27	Hồng nhạt	https://cdn.tgdd.vn/Products/Images/42/303823/iphone-15-plus-256gb-hong-2.jpg	điện-thoại-iphone-15-plus-256gb
28	Đen	https://cdn.tgdd.vn/Products/Images/42/303823/iphone-15-plus-256gb-den-2.jpg	điện-thoại-iphone-15-plus-256gb
29	Vàng nhạt	https://cdn.tgdd.vn/Products/Images/42/303823/iphone-15-plus-256-vang-2.jpg	điện-thoại-iphone-15-plus-256gb
30	Xanh lá nhạt	https://cdn.tgdd.vn/Products/Images/42/303823/iphone-15-plus-256gb-xanh-la-2.jpg	điện-thoại-iphone-15-plus-256gb
35	Cloud Grey	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-ideapad-1-14alc7-82r30077vn-1_490fbf557bd44f4fa6f1385c20fa2517_grande.png	laptop-lenovo-ideapad-1
36	White	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-0-180x125.jpg	ezviz-h6c-pro
37	Graphite Black	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct1_03_cd46391a560f4d0480a0fa0937bb9f08_grande.png	laptop-lenovo-thinkpad-e16
42	Cloud Grey	https://product.hstatic.net/200000722513/product/1_43869d5811cb4ce08de070b738c4f786_grande.png	lenovo-ideapad-slim-5-16imh9
43	Xanh lá nhạt	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-xanh-5.jpg	samsung-galaxy-a24
44	Đen	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-den-5.jpg	samsung-galaxy-a24
45	Xanh mint	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-zflip5-xanh-256gb-2.jpg	samsung-galaxy-z-flip5-5g
38	Xanh	https://cdn.tgdd.vn/Products/Images/42/322096/samsung-galaxy-a55-5g-xanh-5-1.jpg	samsung-galaxy-a55-5g
39	Tím	https://cdn.tgdd.vn/Products/Images/42/322096/samsung-galaxy-a55-5g-tim-2.jpg	samsung-galaxy-a55-5g
40	Đen	https://cdn.tgdd.vn/Products/Images/42/322096/samsung-galaxy-a55-5g-den-2.jpg	samsung-galaxy-a55-5g
41	Luna Grey	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-1_5934f0f1500c403187c7aa517e45b2c6.png	laptop-lenovo-yoga-slim-7
46	Tím nhạt	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-zflip-5-tim-256gb-2.jpg	samsung-galaxy-z-flip5-5g
47	Kem	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-zflip-5-kem-256gb-2.jpg	samsung-galaxy-z-flip5-5g
48	Xám	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-zflip-5-xam-256gb-2.jpg	samsung-galaxy-z-flip5-5g
49	Xanh da trời nhạt	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-zfold5-xanh-256gb-8.jpg	samsung-galaxy-z-fold5-5g
50	Đen	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-zfold5-den-256gb-8.jpg	samsung-galaxy-z-fold5-5g
51	Kem	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-zfold5-kem-256gb-8.jpg	samsung-galaxy-z-fold5-5g
52	Xanh	https://cdn.tgdd.vn/Products/Images/42/322996/vivo-y03-xanh-6.jpg	vivo-y03
53	Đen	https://cdn.tgdd.vn/Products/Images/42/322996/vivo-y03-den-6.jpg	vivo-y03
54	Cam	https://res.cloudinary.com/dmi3xizxq/image/upload/v1719427709/ficeobsn6l6nnow5ynxd.jpg	vivo-y28
55	Xanh	https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/product/1717153527470/zip/img/webp/vivo-y28-in-agate-green-mobile.jpg.webp	vivo-y28
56	Vàng đồng	https://cdn.tgdd.vn/Products/Images/42/302953/oppo-find-n3-vang-9.jpg	oppo-find-n3-5g
57	Đen	https://cdn.tgdd.vn/Products/Images/42/302953/oppo-find-n3-den-9.jpg	oppo-find-n3-5g
58	Xanh lá nhạt	https://cdn.tgdd.vn/Products/Images/42/314209/oppo-reno-11-xanh-6.jpg	oppo-reno11-5g
59	Xám	https://cdn.tgdd.vn/Products/Images/42/314209/oppo-reno-11-xam-6.jpg	oppo-reno11-5g
60	Gray	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946171340515_Macbook%20Air%20M1%20(13).jpg	macbook-air-13-inch-m1-2020
61	Silver	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946171184285_Macbook%20Air%20M1%20(7).jpg	macbook-air-13-inch-m1-2020
62	Gold	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946171340515_Macbook%20Air%20M1%20(2).jpg	macbook-air-13-inch-m1-2020
63	Gray	https://cdn2.cellphones.com.vn/358x/media/catalog/product/m/a/macbook-air-15-inch-spacegray-2023.jpg	macbook-air-15-inch-m2-2023
64	Silver	https://cdn2.cellphones.com.vn/358x/media/catalog/product/m/a/macbook-air-15-inch-silver-2023.jpg	macbook-air-15-inch-m2-2023
65	Black	https://cdn2.cellphones.com.vn/358x/media/catalog/product/m/a/macbook-air-15-inch-midnight-2023.jpg	macbook-air-15-inch-m2-2023
66	Gold	https://cdn2.cellphones.com.vn/358x/media/catalog/product/m/a/macbook-air-15-inch-silver-2023.jpg	macbook-air-15-inch-m2-2023
67	Black	https://cdn2.cellphones.com.vn/358x/media/catalog/product/m/b/mba13-m3-midnight-gallery1-202402.jpg	macbook-air-m3-13-inch-2024
68	Silver	https://cdn2.cellphones.com.vn/358x/media/catalog/product/m/b/mba13-m3-silver-gallery1-202402_1.jpg	macbook-air-m3-13-inch-2024
69	Gold	https://cdn2.cellphones.com.vn/358x/media/catalog/product/m/b/mba13-m3-starlight-gallery1-202402_1.jpg	macbook-air-m3-13-inch-2024
70	Gray	https://cdn2.cellphones.com.vn/358x/media/catalog/product/m/b/mba13-m3-spacegray-gallery1-202402_1.jpg	macbook-air-m3-13-inch-2024
71	Gray	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344441870104175_macbook-pro-14-2023-m3-8-cpu-10-gpu-xam%20(1).jpg	macbook-pro-14-2023-m3
72	Silver	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344439733701079_macbook-pro-14-2023-m3-8-cpu-10-gpu-bac%20(1).jpg	macbook-pro-14-2023-m3
73	Black	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344453377058427_macbook-pro-16-2023-m3-pro-max-den%20(1).jpg	macbook-pro-16-2023-m3-pro
74	Silver	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344451703828926_macbook-pro-16-2023-m3-pro-max-bac%20(1).jpg	macbook-pro-16-2023-m3-pro
75	Gray	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/4/638240754677083179_asus-tuf-gaming-fx507-xam-1.jpg	asus-tuf-gaming-fx507zc4
76	Gray	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/2/638345294135740509_dell-vostro-v3520-xam-5.jpg	dell-vostro-v3520
77	Silver	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/9/638298600173027154_dell-inspiron-15-n3530-bac-1.jpg	dell-inspiron-15-n3530
78	Carbon Black	https://product.hstatic.net/200000722513/product/latitude-3520-p108f001-70280538-fix_83b4c85f06d145199d87d838dc9eca04_grande.png	dell-latitude-3520
79	Black	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/6/27/638234717709656138_Acer%20Aspire%207%20Gaming%20A715%20(1).jpg	acer-aspire-7-gaming-a715
80	Gray	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/20/638176054476482166_acer-aspire-a315-59-321n-i3-1215u-bac-1.jpg	acer-aspire-3
81	Black	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/3/1/637817435466475076_acer-nitro-gaming-an515-58-den-1.jpg	acer-nitro-gaming-an515
82	Silver	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/30/638316665596903924_acer-swift-go-sfg14-41-r19z-r5-7530u-5.jpg	laptop-acer-swift-go-sfg14
83	Xanh lá	https://cdn.tgdd.vn/Products/Images/42/320734/xiaomi-redmi-a3-xanh-6-1.jpg	xiaomi-redmi-a3
84	Đen	https://cdn.tgdd.vn/Products/Images/42/320734/xiaomi-redmi-a3-den-6.jpg	xiaomi-redmi-a3
85	Xanh dương	https://cdn.tgdd.vn/Products/Images/42/320734/xiaomi-redmi-a3-xanh-duong-6-1.jpg	xiaomi-redmi-a3
86	Đen	https://cdn.tgdd.vn/Products/Images/42/312965/xiaomi-redmi-note-13-pro-plus-den-6.jpg	xiaomi-redmi-note-13-pro+-5g
87	Xanh	https://cdn.tgdd.vn/Products/Images/42/312965/xiaomi-redmi-note-13-pro-plus-tim-6.jpg	xiaomi-redmi-note-13-pro+-5g
88	Đen	https://cdn.tgdd.vn/Products/Images/42/323002/realme-c65-den-6.jpg	realme-c65
89	Tím	https://cdn.tgdd.vn/Products/Images/42/323002/realme-c65-6-1.jpg	realme-c65
90	Xanh ngọc	https://cdn.tgdd.vn/Products/Images/42/319658/realme-c67-xanh-6.jpg	realme-c67
91	Đen	https://cdn.tgdd.vn/Products/Images/42/319658/realme-c67-den-6.jpg	realme-c67
92	Xanh	https://res.cloudinary.com/dmi3xizxq/image/upload/v1719451934/gfaumpbf7svciqjlr7dh.png	tcl-40-nxtpaper
93	Trắng	https://res.cloudinary.com/dmi3xizxq/image/upload/v1719451935/ghsrd7r34ov9n5uckqxn.png	tcl-40-nxtpaper
94	Xám	https://res.cloudinary.com/dmi3xizxq/image/upload/v1719452666/eija1t1m0tx5ua1ffpgt.png	tcl-406s
95	Xanh	https://res.cloudinary.com/dmi3xizxq/image/upload/v1719452667/gkcllq6zaiq8lvsa21jm.png	tcl-406s
96	Xám	https://cdn.tgdd.vn/Products/Images/42/307174/samsung-galaxy-s24-ultra-xam-6.jpg	samsung-galaxy-s24-ultra
97	Tím	https://cdn.tgdd.vn/Products/Images/42/307174/samsung-galaxy-s24-ultra-tim-6.jpg	samsung-galaxy-s24-ultra
98	Đen	https://cdn.tgdd.vn/Products/Images/42/307174/samsung-galaxy-s24-ultra-den-6.jpg	samsung-galaxy-s24-ultra
99	Vàng	https://cdn.tgdd.vn/Products/Images/42/307174/samsung-galaxy-s24-ultra-vang-6.jpg	samsung-galaxy-s24-ultra
100	Xanh	https://cdn.tgdd.vn/Products/Images/42/321772/samsung-galaxy-a35-xanh-nhat-6.jpg	samsung-galaxy-a35
101	Đen	https://cdn.tgdd.vn/Products/Images/42/321772/samsung-galaxy-a35-xanh-6.jpg	samsung-galaxy-a35
102	Vàng	https://cdn.tgdd.vn/Products/Images/42/321772/samsung-galaxy-a35-5g-vang-2.jpg	samsung-galaxy-a35
103	Tím	https://cdn.tgdd.vn/Products/Images/42/289705/iphone-14-pro-max-purple-6.jpg	iphone-14-pro-max
104	Trắng	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-4-2.jpg	imou-cruiser-dual-s7xp-10m0wed
105	White	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-1-180x125.jpg	imou-cruiser-2-gs7ep-5m0we
106	Silver	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/13/638248692638800080_acer-swift-edge-sfa16-41-r3l6-r7-6800u-xanh-1.jpg	acer-swift-edge-sfa16
107	Xanh mint	https://cdn.tgdd.vn/Products/Images/42/306994/samsung-galaxy-s23-fe-xanh-6.jpg	samsung-galaxy-s23-fe
108	Trắng	https://cdn.tgdd.vn/Products/Images/42/306994/samsung-galaxy-s23-fe-kem-6.jpg	samsung-galaxy-s23-fe
109	Black	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/3/1/637817435466475076_acer-nitro-gaming-an515-58-den-1.jpg	acer-nitro-5-tiger-gaming-an515
110	White	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-0-180x125.jpg	ezviz-h6
111	Xanh đậm	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-6.jpg	samsung-galaxy-m15-5g
112	Xám	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-xam-6.jpg	samsung-galaxy-m15-5g
113	Silver	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/8/22/638283012469903137_hp-245-g10-bac-1.jpg	hp-245-g10
114	Gold	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/11/638168307037428356_hp-pavilion-14-dv2073tu-i5-1235u-vang-4.jpg	hp-pavilion-14-dv2073tu
115	Cam	https://cdn.tgdd.vn/Products/Images/42/207956/nokia-220-4g-cam-1.jpg	nokia-220-4g
116	Đen	https://cdn.tgdd.vn/Products/Images/42/207956/nokia-220-4g-black-1.jpg	nokia-220-4g
117	Silver	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/31/638264226474075730_hp-probook-440-g10-bac-1.jpg	hp-probook-440-g10
118	Black	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/8/28/638288269292176880_hp-gaming-victus-16-s0078ax-r5-7640hs-3.jpg	hp-gaming-victus-16-s0078ax
119	Xanh lam nhạt	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-blue-6.jpg	vivo-v30-5g
120	Đen	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-black-6.jpg	vivo-v30-5g
121	Silver	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/11/638168318098594588_hp-14s-em0080au-r3-7320u-bac-1.jpg	hp-14s-em0080au
122	Xanh dương	https://cdn.tgdd.vn/Products/Images/42/245545/iphone-14-plus-xanh-6.jpg	iphone-14-plus-128gb
123	Vàng	https://cdn.tgdd.vn/Products/Images/42/245545/iphone-14-plus-gold-3.jpeg	iphone-14-plus-128gb
124	Đen	https://cdn.tgdd.vn/Products/Images/42/245545/iphone-14-plus-den-6.jpg	iphone-14-plus-128gb
125	Trắng	https://cdn.tgdd.vn/Products/Images/42/245545/iphone-14-plus-trang-6.jpg	iphone-14-plus-128gb
126	Tím nhạt	https://cdn.tgdd.vn/Products/Images/42/245545/iphone-14-plus-ti-6.jpg	iphone-14-plus-128gb
127	Xanh dương	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-128gb-xanh-2.jpg	điện-thoại-iphone-15-128gb
128	Bạc	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-13-inch-m4-wifi-sliver-1.jpg	ipad-pro-m4-13-inch-wifi-256gb
129	Đen	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-13-inch-m4-wifi-black-1.jpg	ipad-pro-m4-13-inch-wifi-256gb
132	Xám	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-xam-2-1.jpg	samsung-galaxy-tab-s9+-wifi
133	Kem	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-wifi-256gb-bac-6-1.jpg	samsung-galaxy-tab-s9+-wifi
134	Xanh	https://res.cloudinary.com/dmi3xizxq/image/upload/v1719481227/wfowy7psbcfab1qicbv9.png	samsung-galaxy-tab-s9-fe-wifi
135	Xám	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-den-5.jpg	samsung-galaxy-tab-s9-fe-wifi
136	Bạc	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-bac-5.jpg	samsung-galaxy-tab-s9-fe-wifi
137	Tím	https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-tim-2.jpg	oppo-pad-air-wifi
138	Xanh	https://cdn.tgdd.vn/Products/Images/522/306923/lenovo-tab-m9-5-1.jpg	lenovo-tab-m9-4g
\.


--
-- Data for Name: content_children; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_children (id, content, image, title, description_id) FROM stdin;
1	Về thiết kế bên ngoài, camera có kiểu dáng nhỏ gọn, đơn giản nhưng không kém phần sang trọng, đẹp mắt. Với hình dạng như quả trứng, cùng các đường bo cong mềm mại, phù hợp lắp đặt cho mọi không gian trong nhà.  Về chất liệu, camera được làm từ nhựa nhám cứng cáp, vừa đảm bảo tính thẩm mỹ vừa chống bám dính bụi bẩn trong quá trình sử dụng. Mình đã sử dụng một thời gian nhưng nhìn camera vẫn luôn sạch sẽ, như mới.  Ngoài ra, camera còn có loa ở mặt sau, giúp mình nói chuyện với người thân trong nhà một cách dễ dàng. Đây là tính năng mà mình thấy vô cùng cần thiết, bởi khi ra ngoài hay đi chơi xa, đi công tác, mình vừa có thể quan sát con cái, gia đình vừa có thể nói chuyện, chia sẻ cảm xúc, thông tin, hay cảnh báo người thân khi có trường hợp khẩn cấp.	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-8-1.jpg	Thiết kế nhỏ gọn, kiểu dáng đơn giản	1
2	Camera giám sát là món phụ kiện cần thiết cho mỗi ngôi nhà, ngoài lựa chọn thiết kế nhỏ gọn thì mình còn ưu tiên về chất lượng hình ảnh. Và chiếc camera này hoàn toàn đáp ứng nhu cầu sử dụng của mình.  Với độ phân giải 2 MP cho chất lượng hình ảnh/video lên đến 1080p, thấy rõ được người, đồ vật xung quanh vô cùng sắc nét và rõ ràng, cùng khả năng xoay ngang 350 độ, xoay dọc 115 độ, giúp quan sát bao quát toàn bộ không gian sống trong ngôi nhà. Bên cạnh đó, mình còn có thể tùy chỉnh góc quay theo ý muốn vô cùng tiện lợi.	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-2-1.jpg	Chất lượng hình ảnh sắc nét, chân thực	1
3	Ngoài khả năng quay video sắc nét, thì các tính năng đi kèm cũng là điều đáng chú ý khi quyết định chọn mua một chiếc camera trong nhà, do mỗi ngày mình đều phải đi làm từ sáng đến tối muộn mới về nhà, gần như là thường xuyên. Do vậy, nhu cầu theo dõi và quan sát gia đình đối với mình là điều cần thiết.  Camera được trang bị khá nhiều tính năng hữu ích, mình thấy khá cần thiết cho một chiếc camera thông minh như báo động âm thanh bất thường, giúp camera giám sát phát hiện và ghi lại các âm thanh lớn hoặc bất thường xảy ra trong khu vực giám sát, như tiếng đập phá, tiếng kêu cứu, tiếng súng,... camera sẽ gửi cảnh báo đến điện thoại của mình đồng thời mình cũng có thể cài đặt thời gian camera gửi thông báo về máy.	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-5-2.jpg	Tích hợp nhiều tính năng thông minh, nhanh nhạy	1
4	Thêm một điểm khá hữu ích mà mình thích trên chiếc camera này chính là tính năng phát hiện chuyển động, là một người thường xuyên vắng nhà thì tính năng này sẽ giúp mình quan sát, phát hiện và ghi lại các đối tượng di chuyển trong khu vực giám sát, như người, xe cộ, vật nuôi,... và gửi cảnh báo đến điện thoại của mình, giúp mình bảo vệ được ngôi nhà, người thân một cách tốt nhất.	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-1-1.jpg		1
5	Ngoài các tính năng hữu ích, việc lựa chọn một chiếc camera TIANDY có khả năng lưu trữ cao cũng là điều đáng quan tâm, bởi mình thường xuyên xem và lưu lại các video hay những khoảnh khắc đáng nhớ diễn ra trong nhà.  Bạn có thể mua thêm thẻ nhớ MicroSD tối đa 512GB, cho khả năng lưu trữ lên tới 30 ngày, khe cắm thẻ nhớ được tích hợp trên camera, dễ dàng cắm vào và sử dụng cực tiện lợi.	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-6-2.jpg	Tích hợp khe cắm thẻ, khả năng lưu trữ lâu dài	1
6	Camera giám sát có khả năng tương thích với nhiều thiết bị điện thoại, máy tính bảng có hệ điều hành Windows 7 trở lên, macOS X 11 trở lên, iOS, Android 5.0 trở lên. Ngoài ra, camera tương thích băng tần 2.4 GHz, đây là điểm cần lưu ý khi mua camera tương thích với wifi trong nhà nhé.	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-5-3.jpg	Khả năng tương thích cao, dễ dàng kết nối với nhiều thiết bị	1
7	Mình có thể dễ dàng điều khiển camera thông qua ứng dụng EasyLive Lite, mình có thể thực hiện các tùy chỉnh, cài đặt, với giao diện đơn giản, hỗ trợ Tiếng Việt, kể cả ba mẹ của mình cũng có thể dùng được.  Ngoài ra, với ứng dụng EasyLive Lite mình còn có thể xem dung lượng lưu trữ của camera, tùy chỉnh âm báo, độ nhạy camera, tùy chỉnh độ sáng tối, độ tương phản sao cho phù hợp với ánh sáng trong nhà và kèm thêm nhiều tiện ích hỗ trợ khác.  Đặc biệt, khi camera bị đánh cắp hay được chuyển nhượng cho người khác, người dùng khác cũng không thể kết nối camera với ứng dụng, bởi mỗi camera có một mã QR khác nhau, nếu muốn chuyển nhượng, người dùng chỉ có thể xóa tài khoản trên thiết bị của mình, đây là một tính năng bảo mật nâng cao mà mình thấy khá hữu ích khi sử dụng camera.	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-3-1.jpg	Kết nối an toàn, dễ dàng điều khiển qua ứng dụng	1
8	Theo như đánh giá cá nhân của mình, khi nhìn vào những chiếc laptop Lenovo IdeaPad thì người dùng có thể sẽ không nhận ra quá nhiều những điểm khác biệt giữa các mẫu, tuy nhiên thiết kế kiểu truyền thống là thế nhưng lại không hề "lối mòn" một chút nào, những mẫu máy này vẫn khá thu hút và được ưa chuộng về kiểu dáng, đối với không chỉ các bạn trẻ Gen Z mà còn là những đối tượng người dùng đã đi làm. 	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-acv-1.jpg	Đẹp mắt và thanh lịch hơn	2
19	Nâng cấp đáng chú ý nhất trên camera iPhone 15 Pro Max là cảm biến chính 48 MP, nó cho phép thu được nhiều ánh sáng hơn và chụp ảnh, quay video trong điều kiện thiếu sáng tốt hơn. Ngoài ra, cảm biến 48 MP cũng giúp cho iPhone 15 Pro Max quay video 4K nhằm cho ra những thước phim chuẩn điện ảnh.	https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-290923-030427.jpg	Lưu giữ trọn vẹn mọi khoảnh khắc với camera 48 MP	3
24	TP-Link Tapo TC70 giúp người sử dụng nắm bắt tốt mọi diễn biến xung quanh khu vực quan sát, góc quan sát rộng mang đến dữ liệu quan sát giá trị, đồng thời giảm đầu tư cho việc lắp đặt nhiều camera trong 1 khu vực cần giám sát.	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang2.jpg	Camera giám sát bao quát tốt không gian với góc quay ngang 360 độ và dọc 114 độ	5
9	Ideapad Slim 3 được hoàn thiện với lớp vỏ nhựa bền bỉ đạt độ bền chuẩn quân đội MIL STD 810H và được phủ một lớp sơn xám trầm, mặt lưng máy thì không được hoàn thiện với quá nhiều chi tiết, chỉ có logo hãng được khắc nhỏ ở góc. Mình khá thích những kiểu dáng tối giản như thế này, không gây quá nổi bật khi sử dụng ở chỗ đông người nhưng vẫn đảm bảo được tính thẩm mỹ cao và độ chuyên nghiệp khi sử dụng.  Cân nặng của máy chỉ nhẹ 1.62 kg nên cảm giác cầm nắm rất gọn gàng, mình có thể dễ dàng cất máy vào balo để mang đi học, đi làm hay ra quán cafe chạy deadline mà không sợ cồng kềnh. Đặc biệt, bản lề có thể mở 180 độ, giúp mình linh hoạt hơn khi sử dụng, dễ dàng chia sẻ thông tin khi họp hay làm việc cùng mọi người.	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-acv-2.jpg		2
10	Touchpad mượt mà dễ dàng di chuyển quên đi cảm giác sử dụng chuột ngoài cho những tác vụ công việc văn phòng. Ngoài ra, Lenovo IdeaPad Slim 3 còn được tích hợp bảo mật vân tay lên nút nguồn, tạo sự an toàn tuyệt đối cho thiết bị, đồng thời giúp tăng khả năng truy cập vào máy nhanh hơn hoặc đăng nhập vào các tài khoản để thanh toán nhanh chóng, vô cùng tiện lợi so với nhập mật khẩu truyền thống.  Đầy đủ các dạng cổng kết nối thông dụng từ: HDMI, Jack tai nghe 3.5 mm, USB 3.2, USB-C 3.2 và khe SD tạo điều kiện khá thuận lợi cho mình có thể xuất file thuyết trình sang màn hình ngoài, kết nối thêm với chuột ngoài hoặc liên kết với các thiết bị khác cũng nhanh chóng hơn.	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-acv-8.jpg		2
11	Điểm khá phổ biến trên những chiếc Lenovo IdeaPad là màn hình 15.6 inch với độ phân giải Full HD (1920 x 1080), cùng với viền màn hình được thu nhỏ tạo cảm giác góc nhìn được rộng hơn, tăng sự thích mắt hơn khi giải trí xem phim. Hình ảnh và màu sắc hiển thị trên màn hình đảm bảo được độ tươi sáng, tông màu đen, đầy đủ độ sâu khá nịnh mắt, chân thực với những trải nghiệm như xem phim, lướt web,…  Chưa dừng lại ở đó, màn hình trên còn có khả năng chống chói Anti Glare giúp bạn dễ dàng sử dụng laptop ở ngoài trời với cường độ sáng cao mà không bị lóa mắt, hình ảnh nhòe mờ. 	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-acv-4.jpg	Màn hình hiển thị tươi sáng, nịnh mắt	2
12	Nhờ con chip Intel Core i5 12450H tăng xung nhịp tối đa lên đến 4.4 GHz cùng card tích hợp Intel UHD Graphics giúp mình hoàn toàn tự tin làm chủ mọi công việc từ xử lý văn bản tại trường học, cơ quan, tạo file thuyết trình hoặc thậm chí là một chút coding liên quan đến ngành học thì máy hoàn toàn đáp ứng khá tốt. Không những thế, mình cũng chơi thử ở một số tựa game hot như LOL hay Genshin Impact thì máy đáp ứng ở mức FPS khá tốt, giao tranh hay di chuyển đều mượt mà, tuy nhiên nếu chơi thử thì bạn cũng nên chỉ để ở mức cấu hình Medium thôi là tốt nhất rồi.	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-acv-7.jpg	Hiệu năng tốt cho mọi yêu cầu 	2
13	Nhìn tổng quan lại, laptop Lenovo Ideapad Slim 3 15IAH8 i5 12450H (83ER000EVN) đã thể hiện cực kì tốt mọi thông số so với mức giá thành của mình, không chỉ mang đến hiệu suất công việc cao hơn đáng kể, ngoại hình với thẩm mỹ tuyệt vời mà còn nhiều tính năng sử dụng khác nữa.			2
14	iPhone 15 Pro Max tiếp tục sẽ là một chiếc điện thoại có màn hình và mặt lưng phẳng đặc trưng đến từ nhà Apple, mang lại vẻ đẹp thanh lịch và sang trọng.  Chất liệu chủ đạo của iPhone 15 Pro Max vẫn là khung kim loại và mặt lưng kính cường lực, tạo nên sự bền bỉ và chắc chắn. Tuy nhiên, với công nghệ tiên tiến, khung này đã được nâng cấp thành chất liệu titanium thay vì thép không gỉ hay nhôm ở những thế hệ trước.	https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-102854.jpg	Diện mạo đẳng cấp và cực kỳ sang trọng	3
15	Dynamic Island là một tính năng độc đáo mà iPhone 15 Pro Max mang đến. Đây là một phần của màn hình dành riêng cho thông báo và tương tác nhanh chóng mà không làm gián đoạn trải nghiệm xem nội dung chính. Dynamic Island giúp bạn dễ dàng kiểm tra thông báo, kiểm soát âm nhạc, và thậm chí là xem bản đồ mà không cần thoát khỏi ứng dụng bạn đang sử dụng.	https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-290923-030418.jpg	Trang bị kiểu hình notch dạng Dynamic Island	3
17	iPhone 15 Pro Max được hỗ trợ sử dụng eSIM, trong đó điện thoại có khả năng lưu trữ hơn 8 eSIM và có thể kích hoạt chúng bất cứ khi nào bạn cần. Tuy nhiên, tùy vào từng thị trường ở mỗi khu vực mà máy chỉ hỗ trợ sử dụng được 1 hoặc 2 trong số 8 eSIM mà bạn lưu trữ.  eSIM có thể được kích hoạt trực tuyến, giúp người dùng dễ dàng chuyển đổi giữa các nhà mạng hoặc sử dụng nhiều số điện thoại trên cùng một chiếc iPhone. Người dùng chỉ cần truy cập trang web hoặc ứng dụng của nhà mạng để kích hoạt eSIM, không cần phải đến cửa hàng của nhà mạng để làm thủ tục.		Trang bị công nghệ eSIM	3
18	Trong sự thay đổi này, Apple đã biến phím gạt chế độ im lặng truyền thống thành một nút bấm nhỏ gọn, tạo thuận tiện trong việc thay đổi chế độ âm thanh và tắt tiếng trong môi trường yên tĩnh.	https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-103428.jpg	Thay đổi cơ chế hoạt động nút tác vụ	3
20	Dell Inspiron 14 5440 i5U085W11IBU mang thiết kế mỏng nhẹ đặc trưng của nhà Dell với trọng lượng chỉ vỏn vẹn 1.54kg, độ dày 18.90mm, giúp người dùng dễ dàng bỏ vào balo và mang đến mọi nơi để học tập, giải trí nhẹ nhàng thỏa thích. Lớp vỏ của Dell Inspiron 14 được hoàn thiện bằng chất liệu nhựa nhưng vẫn đảm bảo độ bền của máy khi xảy ra các va chạm. Ngoài ra, lớp vỏ với màu sơn Ice Blue được phủ lên máy làm cho vẻ ngoài của chiếc laptop Dell Inspiron 14 5440 i5U085W11IBU trở nên sang trọng, thanh lịch và gần gũi với người dùng hơn.	https://product.hstatic.net/200000722513/product/notebook-inspiron-14-5440-ice-blue-plastic-gallery-6_410992265a1b4656969eb098e3b89138_grande.png	Thiết kế mỏng nhẹ, dễ dàng di chuyển	4
21	Dell Inspiron 14 5440 i5U085W11IBU được trang bị CPU Intel Core i5-1334U (10 nhân và 12 luồng), hỗ trợ tốc độ tối đa lên đến 4.6GHz, cho ra sức mạnh ổn định để giải quyết mọi tác vụ văn phòng được trơn tru và mượt mà nhất. Ngoài ra, card đồ họa tích hợp Intel® Graphics kết hợp cùng RAM 8GB LPDDR5 4400MHz (nâng cấp tối đa 32GB) cho ra khả năng khả năng xử lý tốt các tác vụ đa nhiệm và ứng dụng đòi hỏi nhiều tài nguyên. Bên cạnh đó, ổ cứng SSD NVMe dung lượng 512GB, giúp tăng tốc độ truy cập dữ liệu và khởi động hệ điều hành của máy nhanh chóng.	https://product.hstatic.net/200000722513/product/notebook-inspiron-14-5440-ice-blue-plastic-gallery-4_aed0e68aafbf4e8499f8b9ec0bc33838_grande.png	Cấu hình đáp ứng tốt các tác vụ cơ bản	4
22	Dell Inspiron 14 5440 i5U085W11IBU được trang bị màn hình 14 inch Full HD (1920 x 1200) giúp bạn xem phim, học tập, giải trí được mượt mà nhất. Phải nói rằng, đây là những thông số quá ấn tượng khi đây chỉ là một chiếc laptop Ultrabook mỏng nhẹ dưới 25 triệu đồng. Bên cạnh đó, Dell Inspiron 14 còn được hỗ trợ độ sáng lên đến 250 nits giúp bạn có thể sử dụng máy ở nhiều điều kiện môi trường ánh sáng khác nhau. Còn về công nghệ, Dell Inspiron 14 5440 được phủ lớp chống chói Anti-Glare và ComfortView cho trải nghiệm thị giác tuyệt vời hơn rất nhiều, dù khi quan sát ở bất kỳ góc độ và ở bất kỳ không gian nào.	https://product.hstatic.net/200000722513/product/notebook-inspiron-14-5440-ice-blue-plastic-gallery-5__1__99a6a5d4d97942fb9f69298358aaecd3_grande.png	Màn hình sắc nét, chân thực	4
23	Dell Inspiron 14 5440 i5U085W11IBU được trang bị đầy đủ các cổng kết nối tiêu chuẩn nhất của một chiếc laptop, giúp bạn có thể dễ dàng kết nối các thiết bị ngoại vi khác (loa, chuột, tai nghe,...), bao gồm:  2 USB 3.2 Gen 1 (5 Gbps) ports 1 USB 3.2 Gen 2 (10 Gbps) Type-C® with Power Delivery and DisplayPort™ 1 headset (headphone and microphone combo) port 1 HDMI 1.4 port 1 power adapter port	https://product.hstatic.net/200000722513/product/notebook-inspiron-14-5440-ice-blue-plastic-gallery-8_9fbcf315fbe84341968d82b85b1c1e22_grande.png	Cổng kết nối đa dạng	4
34	Khi nhìn lần đầu vào iPhone 15, mình không thể không liên tưởng ngay đến phiên bản trước đó là iPhone 14. Dù có nhiều cải tiến, hai chiếc điện thoại vẫn có ngoại hình khá giống nhau. Mặc dù vậy, cấu trúc vuông vức của chúng, cùng với sự chế tạo tinh tế và vững chắc của mặt lưng và khung, khiến mình cảm thấy hứng thú với sản phẩm này.	https://cdn.tgdd.vn/Products/42/281570/iphone-15-1-1020x570.jpg	Thiết kế thời thượng	7
35	Mình muốn chia sẻ về một đặc điểm thú vị trên iPhone 15 mà mình thực sự thích, đó chính là Dynamic Island. Đây là một phần khuyết trên màn hình, hình dạng của nó giống như một viên thuốc, chứa camera TrueDepth và các cảm biến cần thiết cho các tính năng như Face ID và Animoji.	https://cdn.tgdd.vn/Products/42/281570/iphone-15-6-1020x570.jpg	Trang bị hình notch dạng Dynamic Island	7
36	Dynamic Island không chỉ đơn thuần là một phần khuyết để chứa các cảm biến. Nó còn có chức năng tương tác rất độc đáo. Chẳng hạn, khi có thông báo mới hoặc khi mình đang sử dụng một ứng dụng, Dynamic Island sẽ hiển thị các thông tin liên quan như tên ứng dụng, thời gian, trạng thái của thông báo,...  Thật thú vị khi mình có thể tương tác với Dynamic Island theo nhiều cách khác nhau. Nhấn vào Dynamic Island, mình sẽ quay lại màn hình chính của ứng dụng đang sử dụng. Còn khi chỉ nhấn giữ, mình sẽ xem được các chức năng cơ bản của ứng dụng đó mà không cần phải truy cập thẳng vào ứng dụng, rất tiện lợi trong quá trình sử dụng của mình.	https://cdn.tgdd.vn/Products/42/281570/iphone-15-7-1020x570.jpg		7
37	Hệ thống camera sau của chiếc iPhone này gồm hai ống kính trong đó camera chính có độ phân giải 48 MP và đi cùng camera phụ 12 MP. Được xem là một bước cải tiến lớn so với năm ngoái, khi camera chính cũng đã được nâng cấp gấp 4 lần so với iPhone 14 (camera chính 12 MP).  Bên cạnh việc nâng cấp ống kính, nhà Apple còn mang đến cho chúng ta nhiều tính năng thú vị giúp hỗ trợ quay chụp trở nên chuyên nghiệp như: Cinematic, Smart HDR 5, Action Mode,...	https://cdn.tgdd.vn/Products/42/281570/iphone-15-8-1020x570-1.jpg	Trang bị camera 48 MP	7
38	Chất lượng ảnh chụp từ iPhone 15 thật sự ấn tượng. Khi phóng to ảnh lên khoảng 30%, chất lượng của hình ảnh vẫn được duy trì, không bị bể. Điều này cung cấp cho mình sự linh hoạt trong việc chỉnh sửa và tùy chỉnh kích thước của hình ảnh.	https://cdn.tgdd.vn/Products/42/281570/iphone-15-9-1020x570.jpg		7
39	Đặc biệt hấp dẫn với mình là tính năng góc siêu rộng và xóa phông. Mình thích cách mà tính năng góc siêu rộng cho phép mình chụp được cảnh sắc rộng lớn, hoàn hảo cho những lần đi du lịch và muốn ghi lại hết tất cả mọi thứ trong tầm mắt.	https://cdn.tgdd.vn/Products/42/281570/iphone-15-13-1020x570.jpg		7
40	Đầu tiên phải kể đến là tấm nền OLED, nó thật sự mang lại chất lượng hình ảnh đỉnh cao, màu sắc sắc nét, độ tương phản cực kì ấn tượng. Chưa kể độ phân giải Super Retina XDR (1179 x 2556 Pixels) đảm bảo mình có thể cảm nhận từng chi tiết rõ ràng trên màn hình.	https://cdn.tgdd.vn/Products/42/281570/iphone-15-14-1020x570.jpg	Sử dụng màn hình OLED độ phân giải cao	7
80	iPhone 13 trang bị bộ nhớ trong 128 GB dung lượng lý tưởng cho phép bạn thỏa thích lưu trữ mọi nội dung theo ý muốn mà không lo nhanh đầy bộ nhớ.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-19.jpg		14
25	Dữ liệu với độ phân giải cao đảm bảo cho chất lượng hình ảnh không bị nhòe khi phóng lớn, hỗ trợ tích cực khi cần kiểm tra, theo dõi chi tiết các chuyển động, vật thể trên màn hình, phục vụ nhu cầu giám sát an ninh.	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang3.jpg	Camera IP thu phát hình ảnh, video chất lượng cao Full HD	5
26	Khoảng cách trực quan đến 9 m cho phép thu giữ các dữ liệu quan sát tại văn phòng, phân xưởng, nhà ở,... vào ban đêm với hình ảnh rõ ràng, dễ dàng nhận biết.	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang4.jpg	Quan sát tốt cả trong điều kiện thiếu sáng với đèn hồng ngoại 850 nm	5
27	Ứng dụng Tapo hỗ trợ cho các thiết bị Android 4.4 trở lên hoặc iOS 9.0 trở lên, dễ dàng tải về từ kho ứng dụng trên điện thoại, cài đặt và nhanh chóng nhận diện, sử dụng các tính năng điều khiển camera.  Dù chưa được hỗ trợ tiếng Việt nhưng giao diện ứng dụng khá thân thiện, dễ dàng sử dụng cho mọi người.  Trên Tapo, bạn có thể theo dõi thông tin quan sát trực tiếp qua điện thoại, điều khiển chế độ cảnh báo, thao tác trên bộ nhớ thẻ, phát đi cảnh báo hay đàm thoại 2 chiều,...  Xem chi tiết hướng dẫn sử dụng và tải ứng dụng tại đây: Tapo: Ứng dụng quản lý, điều khiển thiết bị gia đình thông minh	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang6.jpg	Camera điều khiển dễ dàng trên điện thoại thông minh với ứng dụng Tapo, kết nối băng tần 2.4 GHz	5
28	Với thiết kế tinh tế, sang trọng, cùng bộ phụ kiện tiện dụng mà bạn có thể bố trí camera TP-Link đặt bàn, gắn tường hay trần nhà đều dễ dàng, phục vụ tối ưu cho nhu cầu quan sát tùy theo không gian lắp đặt.	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang1.jpg	Lắp đặt phù hợp cho gia đình, văn phòng,... sử dụng tốt cả trong nhà và ngoài trời	5
29	Khe cắm thẻ đặt ẩn ở mặt sau cụm camera. Việc lưu trữ bằng thẻ giúp sử dụng thông tin lưu trữ thuận tiện, dễ dàng và đảm bảo tính an toàn cao hơn so với sử dụng lưu trữ qua đầu thu.	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-22.jpg	Lưu trữ dữ liệu 15 - 20 ngày trên thẻ nhớ MicroSD tối đa 512 GB	5
30	Laptop Asus Vivobook 14X OLED sở hữu một màu bạc đẹp mắt với thiết kế vuông vắn đầy tinh tế. Bản lề được thiết kế tự tạo một góc nghiêng vừa phải khi mở nắp máy tính lên. Mặt nắp laptop Asus đặt khéo léo phần logo đặc trưng của dòng Asus Vivobook tạo một nét đẹp sang trọng trên sản phẩm nhà Asus. 	https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-vivobook-14x-oled-a1405va-km095w-7_92212a6e9640400eb53ce4270f4ff203.png	Thiết kế sang trọng, độc đáo	6
31	Sử dụng bộ vi xử lý Intel core i5-500H mạnh mẽ cho phép Asus OLED Vivobook 14X giải quyết mọi tác vụ văn phòng cơ bản đến nâng cao. Việc làm đồ họa cơ bản trên máy cũng được hỗ trợ với VGA tích hợp Intel® Iris Xe Graphics. 16GB RAM DDR4 xử lý đa nhiệm nhanh chóng cho những thao tác mượt mà. Bộ lưu trữ 512GB thỏa sức lưu trữ các dữ liệu quan trọng mà người dùng cần.	https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-vivobook-14x-oled-a1405va-km095w-3_9fca2dae7b924457827703ca8548a8d2.png	Cấu hình vượt trội trên ASUS Vivobook 14 OLED A1405ZA KM264W	6
32	Asus Vivobook 14X OLED sở hữu màn hình OLED với độ phân giải 2.8K (2880 x 1800). Tỷ lệ màn hình 16:10 cùng thiết kế viền mỏng mở ra tầm nhìn thoải mái hơn trên một sản phẩm laptop mỏng nhẹ. Độ sáng 600 nits hỗ trợ hình ảnh hiển thị luôn tốt trong nhiều điều kiện ánh sáng. Vivobook 14X OLED được trang bị dải màu DCI-P3 100% mang lại độ chính xác về màu sắc cao. Trải nghiệm xem phim hay chiến những tựa game chân thực đến từng chi tiết. 	https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-vivobook-14x-oled-a1405va-km095w-6_b3f55bfc433344a6802b2720dcace9e3.png	Chất lượng hình ảnh chân thực	6
33	Đây có lẽ là sản phẩm laptop cho sinh viên hoàn hảo với thiết kế bàn phím thoải mái. Hành trình phím được tinh chỉnh hợp lý để việc đánh máy trên Asus Vivobook 14X OLED thuận lợi mang đến cảm giác gõ êm tay, chắc chắn tăng tốc độ đánh máy không khác gì sử dụng bàn phím cơ. Ngoài ra bộ đèn nền đơn sắc còn giúp người dùng thao tác chính xác hơn trong điều kiện thiếu sáng. Cảm biến vân tay được tích hợp với bàn di chuột trải nghiệm mở máy nhanh hơn chỉ với 1 chạm.	https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-vivobook-14x-oled-a1405va-km095w-2_077771778233450c8f98df9420439da4.png	Bàn phím và bảo mật	6
41	Về bộ vi xử lý Apple A16 Bionic, mình thấy rằng con chip này thực sự rất mạnh mẽ. Con chip được tối ưu hóa về hiệu suất nên có thể chạy nhiều ứng dụng cùng một lúc mà không gặp khó khăn. Cảm giác mượt mà, không có giật lag, giúp mình thoải mái sử dụng cho cả nhu cầu giải trí và cả công việc.	https://cdn.tgdd.vn/Products/42/281570/iphone-15-18-1020x570.jpg	Sở hữu cấu hình mạnh mẽ	7
42	Nếu nhìn vào con số 3349 mAh, có thể nó chưa sẵn sàng so sánh với nhiều chiếc điện thoại khác trên thị trường. Tuy nhiên, iPhone 15 vẫn cho mình thời gian sử dụng ấn tượng nhờ sự tối ưu hóa từ bộ vi xử lý A16 Bionic và hệ điều hành iOS 17.	https://cdn.tgdd.vn/Products/42/281570/iphone-15-21-1020x570.jpg	Hỗ trợ khả năng sạc 20 W	7
43	Trong quá trình trải nghiệm, mình có thử sử dụng điện thoại đâu đó khoảng 4 - 5 tiếng liên tục cho tác vụ hỗn hợp, từ lướt mạng xã hội, nghe nhạc cho đến xem phim và chơi game. Trong đó, phần lớn là mình lướt mạng là chủ yếu và chỉ chơi 2 - 3 ván game. Nhìn chung, với một viên pin như vậy thì mình thấy cũng khá ổn.  Khả năng hỗ trợ sạc 20 W của iPhone 15 cũng đáng khen ngợi, giúp mình nạp năng lượng cho chiếc máy nhanh chóng và tiện lợi.	https://cdn.tgdd.vn/Products/42/281570/iphone-15-22-1020x570.jpg		7
44	Nên mua iPhone 15 128GB nếu bạn đang tìm kiếm một chiếc điện thoại thông minh mới có thiết kế đẹp, hiệu năng mạnh mẽ, camera tuyệt vời và còn dùng nó với vai trò như một món phụ kiện thời trang nhằm tôn thêm vẻ sang trọng và sành điệu dành cho bản thân.		Có nên mua iPhone 15 128GB	7
45	Camera có thiết kế nhỏ nhắn với khối lượng cực gọn nhẹ chỉ 171 g, sở hữu gam màu trắng sang trọng phù hợp lắp đặt cho mọi không gian trong nhà như phòng khách, phòng ngủ, phòng bếp,...  Trang bị lớp vỏ cứng cáp hạn chế bám bụi bẩn hiệu quả, giữ cho thiết bị luôn sạch sẽ, bền bỉ với thời gian. Camera có nhiệt độ hoạt động từ - 10 độ C đến 45 độ C, độ ẩm dưới 95% RH, cho người dùng thoải mái sử dụng thiết bị trong hầu hết mọi điều kiện thời tiết.	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-1-1.jpg	Thiết kế nhỏ gọn, dễ dàng lắp đặt	8
46	Camera giám sát trang bị ống kính 3.6 mm cùng khả năng xoay ngang 355 độ và xoay dọc tối đa 70 độ, giúp camera quan sát gần như toàn cảnh không gian trong nhà mà không bị hạn chế bởi điểm mù.  Ống kính có độ phân giải cao, cho chất lượng video đạt 3 MP (1296p), hiển thị sắc nét và chi tiết. Tầm nhìn xa hồng ngoại vào ban đêm lên đến 10 m, giúp camera thích ứng với các điều kiện ánh sáng khác nhau và mang lại hình ảnh chân thực nhất.	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-2-1.jpg	Chất lượng hình ảnh sắc nét với độ phân giải cao	8
47	Điểm đặc biệt trên chiếc camera này là tính năng 1 chạm để gọi, cho phép bạn thực hiện cuộc gọi điện thoại bằng cách chạm vào biểu tượng cuộc gọi trên camera. Tính năng này hoàn toàn hữu ích cho người già hoặc trẻ nhỏ khi muốn gọi điện gấp cho người thân. Kèm đó là tính năng phát hiện chuyển động, phát hiện con người giúp thiết bị nhận biết các vật thể hay ai đó đang di chuyển trong phạm vi quan sát của camera. Đồng thời camera sẽ gửi thông báo đến điện thoại khi phát hiện có sự cố xảy ra, cho bạn dễ dàng theo dõi và kiểm soát từ xa. Camera hỗ trợ chế độ riêng tư, khi bạn kích hoạt chế độ này, camera sẽ che ống kính và dừng ghi hình, để bảo vệ sự riêng tư của bạn và gia đình một cách tốt nhất.	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-5-1.jpg	Tích hợp nhiều chế độ quan sát thông minh giúp theo dõi toàn diện	8
48	Camera IMOU hỗ trợ lưu trữ qua khe cắm thẻ nhớ lên đến 256 GB cho thời gian lưu trữ từ 21 - 30 ngày. Người dùng có thể dễ dàng xem lại video khi cần thiết.  Ngoài thẻ nhớ, camera có thể lưu trữ qua đầu ghi hình, qua NAS (theo Onvif/ RTSP) hoặc lưu qua đám mây Imou Protect (dùng thử với 14 ngày, lịch sử lưu lại 3 ngày).	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-8.jpg	Camera có khe cắm thẻ nhớ, cho khả năng lưu trữ lâu dài	8
49	Camera hỗ trợ kết nối wifi có băng tần 2.4 GHz, tương thích với hầu hết các thiết bị điện thoại, máy tính bảng chạy hệ điều hành Android, iOS. Ngoài ra người dùng có thể dễ dàng điều khiển, cài đặt hay xem video trực tiếp từ camera qua ứng dụng Imou Life.  Ngoài ra, bạn có thể chia sẻ camera sử dụng tối đa cho 6 người (không đăng ký Imou Protect), nếu người dùng đăng ký gói đám mây Imou Protect bản Basic sẽ được chia sẻ tối đa là 10 người, còn đăng ký gói đám mây Imou Protect bản Plus sẽ được chia sẻ tối đa là 20 người.	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-8.jpg	Dễ dàng kết nối và điều khiển camera qua ứng dụng	8
50	Là một đại diện trong ngành laptop văn phòng, ASUS Expertbook B1 B1402CBA NK1535W được định hình với vẻ ngoài đơn giản, thanh thoát dành cho môi trường học tập và làm việc. Những góc cạnh trên chiếc laptop ASUS được làm gọn gàng và thân thiện nhất có thể, mặt A làm nhẵn cùng phần logo ASUS bóng bẩy như khẳng định thương hiệu dành cho sản phẩm văn phòng. Khoác bên ngoài ASUS Expertbook B1 B1402CBA NK1535W sẽ là lớp màu mang tên đen tinh tú cho ta cảm nhận vẻ đẹp tựa ngàn vì sao trên trời cao. Đây xứng đáng là một cái tên vô cùng lý tưởng cho công việc và học tập hàng ngày.	https://file.hstatic.net/200000722513/file/gearvn-laptop-asus-expertbook-b1-b1402cba-nk1535w-1_c5b14d582a154ea49397e68751c9ecfd_grande.jpg	Thanh lịch trên từng góc cạnh	9
79	Con chip Apple A15 Bionic siêu mạnh được sản xuất trên quy trình 5 nm giúp iPhone 13 đạt hiệu năng ấn tượng, với CPU nhanh hơn 50%, GPU nhanh hơn 30% so với các đối thủ trong cùng phân khúc. Nhờ hiệu năng được cải tiến, người dùng có được những trải nghiệm tốt hơn trên điện thoại khi dùng các ứng dụng chỉnh sửa ảnh hay chiến các tựa game đồ họa cao mượt mà.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-2.jpg	Hiệu năng vượt trội nhờ chip Apple A15 Bionic	14
51	Được hướng tới công việc văn phòng cơ bản và nhu cầu sử dụng cơ bản, ASUS Expertbook B1 B1402CBA NK1535W trang bị cho mình con chip i3-1215U. Thuộc thế hệ Intel Gen 12 và là “em út” của thế hệ CPU máy tính này, sức mạnh xử lý của “bộ não” đến từ Intel sẽ đáp ứng hoàn hảo cho những công việc như trình chiếu, nhập liệu, tính toán trên những phần mềm office chuyên dụng như Word, Excel, … hay đó còn là những nhu cầu giải trí đơn giản như lướt web, xem phim. Tối ưu thêm trải nghiệm đa tác vụ với dung lượng RAM tối thiểu 8GB và bộ nhớ SSD 256GB, tất cả mang tới khả năng sử dụng tốt nhất cho những nhu cầu sử dụng cơ bản nhất.	https://file.hstatic.net/200000722513/file/gearvn-laptop-asus-expertbook-b1-b1402cba-nk1535w-4_94cbc4dbe17f410394107ef452b4e6f1_grande.jpg	Sức mạnh lý tưởng cho nhu cầu làm việc	9
52	Sắm vai là một “trợ thủ” dành cho những nhân viên văn phòng, học sinh và sinh viên, ASUS Expertbook B1 B1402CBA NK1535W mang tới những cổng kết nối thông dụng nhất hiện nay, bao gồm USB Type-A / Type-C, HDMI 1.4, combo jack audio và cổng LAN RJ-45. Cung cấp mọi điều kiện thuận lợi cho kết nối với những thiết bị ngoại vi như chuột máy tính, bàn phím, tai nghe, loa... hay là khả năng trình chiếu phục vụ cho nhu cầu thuyết trình.	https://file.hstatic.net/200000722513/file/gearvn-laptop-asus-expertbook-b1-b1402cba-nk1535w-6_d2185e6f114349eba780185f6e957e01_grande.jpg	Đầy đủ kết nối hữu dụng	9
53	ASUS Expertbook B1 B1402CBA NK1535W mang đến cho chúng ta chiếc màn hình với kích thước 14 inch khiêm tốn nhưng vẫn sẽ đảm bảo khả năng hiển thị bằng những chỉ số hiển thị uy tín như độ sáng 220nits, NTSC 45%. Tất cả mọi chi tiết, hình ảnh và ký tự sẽ được thể hiện qua màn hình Full HD đạt tỷ lệ 16:9. Đặc biệt, phần màn hình của chiếc laptop có thể cho phép bạn gập và mở góc độ rộng nhằm tối ưu cho công việc và nhu cầu sử dụng hàng ngày.	https://file.hstatic.net/200000722513/file/gearvn-laptop-asus-expertbook-b1-b1402cba-nk1535w-3_07ecae78e00642ec9d191bc8ef0a36e1_grande.jpg	Màn hình 14 inch cơ bản và hữu ích	9
54	Là mẫu laptop cho sinh viên, nhân viên văn phòng, ASUS Vivobook 16 M1605YA MB303W có thiết kế nhỏ gọn mỏng nhẹ rất tiện dụng. Trọng lượng máy chỉ khoảng 1.88 kg để bạn hoàn toàn có thể cầm máy chỉ bằng một tay.	https://file.hstatic.net/200000722513/file/gearvn-laptop-asus-vivobook-16-m1605ya-mb303w-4_170634a668d84ca88328cb061cc66b0a.png	Kiểu dáng thiết kế laptop gọn nhẹ	10
55	Nếu bạn đã quen với những dòng laptop phổ thông với phần viền màn hình dày cộm thì laptop ASUS Vivobook 16 M1605YA MB303W sẽ mang đến trải nghiệm hoàn toàn mới. Màn hình laptop được thiết kế với lớp viền mỏng hơn từ đó tăng diện tích bề mặt hiển thị.	https://file.hstatic.net/200000722513/file/gearvn-laptop-asus-vivobook-16-m1605ya-mb303w-6_363d148f334d4108aee0a2bb3bf02619.png	Màn hình viền mỏng	10
56	ASUS Vivobook 16 M1605YA MB303W được trang bị CPU AMD Ryzen™ 7 7730U cùng card đồ họa tích hợp AMD Radeon Graphics nên không cần phải lo lắng về sức mạnh mà mẫu laptop này sở hữu. Với mức cấu hình trên bạn hoàn toàn có thể chạy tốt các phần mềm văn phòng hay một số phần mềm chỉnh sửa đồ họa đơn giản.	https://file.hstatic.net/200000722513/file/gearvn-laptop-asus-vivobook-16-m1605ya-mb303w-3_462439b9a117466eabb8fce679ed1ff4.png	Hiệu năng ASUS Vivobook 16 M1605YA MB303W bền bỉ	10
57	Nhằm phục vụ tốt cho nhu cầu học tập và làm việc văn phòng, Asus đã tinh tế trang bị bàn phím full size phục vụ tốt cho người dùng cần nhập liệu nhiều. Kích thước phím bấm to, rõ, bố trí liền mạch với nhau giúp bạn dễ dàng thao tác, tăng độ chính xác.	https://file.hstatic.net/200000722513/file/gearvn-laptop-asus-vivobook-16-m1605ya-mb303w-2_eba0fae68044474faf0e9d227a84ca38.png	Bàn phím độ nhạy cao	10
58	Tính năng cảm biến vân tay được tích hợp ngay ở touchpad, với một cái chạm nhẹ vào vị trí này là bạn có thể truy cập vào giao diện làm việc một cách nhanh chóng và tiện lợi, thay vì cần nhập password rườm rà.			10
59	Sở hữu thiết kế nhỏ gọn với kích thước vừa đủ để cầm gọn trong bàn tay và khối lượng chỉ 300 g. Camera sử dụng gam màu trắng sang trọng giúp không gian được lắp đặt trở nên tinh tế hơn, đồng thời cũng có thể ẩn nấp vào màu tường hay đồ vật khác để theo dõi mọi thứ xung quanh khu vực giám sát. Bạn có thể lắp camera ở các khu vực như trên tường, trần nhà, kệ, bàn,...	https://cdn.tgdd.vn/Products/4728/319451/camera-ip-360-do-3mp-botslab-c212-bv-(1)-1020x570.jpg	Thiết kế nhỏ nhắn, kiểu dáng tối giản	11
60	Camera có thể xoay ngang 355 độ với góc nhìn toàn cảnh 360 độ, xoay dọc 70 độ cho khả năng nhìn 149.9 độ giúp quét và quan sát được gần như mọi chuyển động. Hỗ trợ ghi hình ở độ phân giải 3 MP giúp các chi tiết chuyển động được ghi lại sắc nét và rõ ràng, không lo vỡ hình. Người dùng có thể điều khiển và xem trực tiếp hình ảnh từ camera thông qua ứng dụng Botslab, hỗ trợ thiết bị có hệ điều hành Android 6.0 trở lên và iOS 11 trở lên.	https://cdn.tgdd.vn/Products/4728/319451/camera-ip-360-do-3mp-botslab-c212-bv-(5)-1020x570.jpg	Hỗ trợ quan sát toàn cảnh một cách rõ nét	11
61	Camera có thể phát hiện chuyển động trong khu vực giám sát và gửi thông báo đến điện thoại của bạn. Tính năng này giúp bạn phát hiện kịp thời các sự cố bất thường, chẳng hạn như đột nhập, phá hoại,... Khi phát hiện có chuyển động hoặc tiếng ồn bất thường như tiếng vỡ kính, tiếng cạy cửa,... camera sẽ tự động xoay để dõi theo chuyển động đó, đồng thời tự động ghi hình để người dùng có thể xem lại khi cần thiết.	https://cdn.tgdd.vn/Products/4728/319451/camera-ip-360-do-3mp-botslab-c212-bv-(7)-1020x570.jpg	Trang bị công nghệ hiện đại	11
62	Camera BOTSLAB có tích hợp loa và micro, cho phép bạn đàm thoại trực tiếp với người ở bên kia camera. Bên cạnh đó, bạn cũng có thể nghe được âm thanh từ phía camera qua ứng dụng điều khiển trên điện thoại. Tính năng này giúp bạn có thể giao tiếp với người thân, bạn bè khi bạn không có ở nhà.	https://cdn.tgdd.vn/Products/4728/319451/camera-ip-360-do-3mp-botslab-c212-bv-(4)-1020x570.jpg	Trò chuyện đồng thời với người thân mọi lúc	11
63	Camera có trang bị sẵn khe chứa thẻ MicroSD với dung lượng tối đa của thẻ là 256 GB, đủ để lưu trữ video cho các nhu cầu sử dụng thông thường của hầu hết mọi người dùng. Ngoài ra, bạn có thể lưu trữ 30 ngày thông qua cloud của hãng với gói Cơ bản (cho 1 thiết bị) hoặc gói Plus (cho 10 thiết bị). Ngoài 2 cách trên, camera sẽ hỗ trợ người dùng lưu trữ miễn phí các video trong vòng 7 ngày, sau đó video sẽ bị xoá để lưu trữ video mới.  Camera giám sát có thể kết nối qua cổng LAN hoặc kết nối không dây với Wifi, lưu ý camera chỉ nhận băng tần 2.4 GHz. Sau đăng nhập vào ứng dụng kết nối, bạn sẽ xem được các video trong thời gian thực hoặc xem lại video đã lưu trữ. Ngoài ra, bạn còn có thể thực hiện các điều chỉnh về tiện ích và thông báo giúp bạn yên tâm hơn khi đi ra ngoài.	https://cdn.tgdd.vn/Products/4728/319451/camera-ip-360-do-3mp-botslab-c212-bv-(3)-1020x570.jpg	Đa dạng cách lưu trữ video	11
64	Nói về nâng cấp thì camera chính là điểm có nhiều cải tiến nhất trên thế hệ iPhone mới. Nếu như trước đây iPhone Xs chỉ có một camera thì nay với iPhone 11 chúng ta sẽ có tới hai camera ở mặt sau.	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-114-1.jpg	Nâng cấp mạnh mẽ về camera	12
65	Bên cạnh đó với iPhone 11 thì đây sẽ là lần đầu tiên Apple trang bị khả năng chụp đêm lên chiếc iPhone của mình.	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-113.jpg		12
66	Kích hoạt chế độ chụp đêm sẽ do iPhone tự quyết định việc của bạn chỉ cần đưa máy lên và chụp, rất đơn giản.	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-.jpg		12
67	Mỗi lần ra iPhone mới là mỗi lần Apple mang đến cho người dùng một trải nghiệm về hiệu năng "chưa từng có".	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-tgdd45.jpg	Hiệu năng mạnh mẽ hàng đầu thế giới	12
68	Trên iPhone 11 mới Apple nâng cấp con chip của mình lên thế hệ Apple A13 Bionic rất mạnh mẽ. Chiếc iPhone này cũng được nâng cấp dung lượng RAM 4 GB thay vì 3 GB như thế hệ trước đó.	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-dmx18.jpg		12
69	Ở mức cấu hình trên giúp điện thoại chơi game tốt với các tựa game phổ biến hiện nay một cách mượt mà, ổn định. Mọi thao tác trên iPhone mới cũng cho tốc độ phản hồi nhanh mà bạn gần như sẽ không cảm nhận được sự giật lag cho dù có sử dụng trong một thời gian dài.	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-tgdd4.jpg		12
70	Chúng ta sẽ có một mặt lưng hoàn thiện dưới dạng kính và Apple nói rằng họ đã sử dụng loại kính bền nhất từ trước tới nay cho chiếc iPhone này.	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-113-1.jpg	Những thay đổi về thiết kế theo hướng tích cực	12
71	Camera kép trên iPhone mới cũng được thiết kế lại và tin vui là nó sẽ bớt lồi hơn so với trên iPhone Xr trước đây.	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-115-1.jpg		12
72	Điểm nhấn về cụm camera to bản ở mặt sau sẽ giúp người khác dễ dàng nhận biết bạn đang sử dụng một chiếc iPhone 11 trên tay.	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-118.jpg		12
73	Khi nói đến thời lượng pin iPhone 11, hẳn nhiều người đã ước ao rằng máy sẽ có viên pin tốt giống như iPhone Xr (có thời lượng pin tốt nhất so với bất kỳ iPhone hiện đại nào).	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-tgdd40.jpg	Thời lượng pin tốt nhất từ trước tới nay	12
74	Nổi tiếng với sự đẳng cấp, sang trọng mà mình mang lại, Asus ZenBook OLED UP3404VA KN039W vẫn sở hữu thiết kế mỏng nhẹ, cứng cáp thường thấy. Mặt A tô điểm bằng những đường sọc có chủ đích tăng thêm phần ấn tượng về một nét đẹp hiện đại. Bản lề thiết kế thông minh gập 360 độ nhanh chóng cho phép bạn biến một chiếc laptop thành máy tính bản trong tích tắc. 	https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-zenbook-flip-oled-up3404va-kn039w-6_34c7ea7e28d5490da688b20b8733871b.png	Thiết kế mỏng nhẹ, sang trọng	13
75	Tuy là một chiếc laptop ultrabook với card đồ họa Intel Iris Xe Graphics (dòng card onboard mạnh mẽ nhất hiện nay của nhà Intel) cùng CPU Intel Core i7-1360P, laptop Asus ZenBook Flip OLED UP3404VA KN039W sở hữu một hiệu năng vô cùng ấn tượng mà ít dòng ultrabook nào trong tầm giá có được.	https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-zenbook-flip-oled-up3404va-kn039w-4_8b4b0a5927ce4622a3fea7a27647d8e9.png	Cấu hình mạnh mẽ	13
76	Nếu trước đây màn hình Oled chỉ được áp dụng cho những mẫu laptop cao cấp thì hiện nay Asus đang bắt đầu áp dụng cho các dòng laptop tầm trung và laptop cho sinh viên giá rẻ. Với tấm nền Oled hỗ trợ 2.8K với 90Hz refresh rate, 550 nits, 100% DCI-P3 mang đến cho bạn trải nghiệm nhìn thật sự ấn tượng. Hình ảnh hiển thị không chỉ tươi sáng, chân thật mà còn gần như không có góc chết. Từ đó giúp nâng cao trải nghiệm giải trí cho người dùng lên một tầm cao mới. Không chỉ như thế màn hình Asus ZenBook còn hỗ trợ cảm ứng nên việc lướt web, giải trí hay làm việc có phần tiện lợi hơn rất nhiều.	https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-zenbook-flip-oled-up3404va-kn039w-2_f11aaba77d8b477bbd98d9f166481cfa.png	Màn hình cảm ứng Oled chân thật	13
77	Với việc được làm bằng nhôm nên phần bàn phím của máy rất chắc chắn. Gần như không hề có cảm giác bị chùng xuống khi gõ phím. Tuy rằng chỉ có kích thước 14 inch nhưng bàn phím của máy không hề chật chội mà còn khá thoáng giúp việc gõ phím trở nên nhanh chóng và chuẩn xác hơn.	https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-zenbook-flip-oled-up3404va-kn039w-7_ad4846e753794abe9e70d0710bc1fb06.png	Bàn phím cứng cáp, touchpad thông minh	13
78	Là mẫu laptop ultrabook nên hiển nhiên Asus ZenBook Flip OLED UP3404VA KN039W cần rất nhiều cổng kết nối để hỗ trợ cho công việc. Máy được trang bị: 1x USB 3.2 Gen 2 Type-A 2x Thunderbolt™ 4 supports display / power delivery 1x HDMI 2.0b 1x 3.5mm Combo Audio Jack	https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-zenbook-flip-oled-up3404va-kn039w-10_a6b9859b328a458b9221a0f0e402ef3c.png	Đa dạng cổng kết nối	13
81	Mạng 5G được cải thiện chất lượng với nhiều băng tần hơn, với 5G giúp điện thoại xem trực tuyến hay tải xuống các ứng dụng và tài liệu đều đạt tốc độ nhanh chóng. Không chỉ vậy, siêu phẩm mới này còn có chế độ dữ liệu thông minh, tự động phát hiện và giảm tải tốc độ mạng để tiết kiệm năng lượng khi không cần dùng tốc độ cao.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-4.jpg	Tốc độ 5G tốt hơn 	14
82	iPhone 13 sử dụng tấm nền OLED với kích thước màn hình 6.1 inch cho chất lượng màu sắc và chi tiết hình ảnh sắc nét, sống động, độ phân giải đạt 1170 x 2532 Pixels.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-6.jpg	Màn hình Super Retina XDR độ sáng cao, tiết kiệm pin	14
83	Nhờ có công nghệ Super Retina XDR giúp cho máy đạt độ sáng 800 nits, tối đa lên đến 1200 nits cùng dải màu rộng P3, tỷ lệ tương phản lớn giúp ổn định tốt màu sắc và chất lượng hình ảnh hiển thị trong nhiều điều kiện sáng khác nhau, kể cả môi trường nắng gắt hay ánh sáng chói.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-5.jpg		14
84	Phía ngoài màn hình còn được phủ lớp oleophobic hạn chế tình trạng bám bụi bẩn và mồ hôi do tay người dùng, giữ màn hình luôn sạch và tinh tế hơn. Và trang bị kính cường lực Ceramic Shield giúp màn hình của máy được an toàn hơn trước những vết xước, va đập trong quá trình sử dụng.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-7.jpg		14
85	Cụm camera kép phía sau trên iPhone 13 đều sở hữu độ phân giải 12 MP, camera chính giúp thu được nhiều ánh sáng hơn, tăng khả năng thu sáng lên đến 47% nên chất lượng ảnh chụp cũng cải thiện hơn so với bản tiền nhiệm. Điện thoại có camera góc siêu rộng cho góc nhìn 120 độ giúp thu được nhiều chi tiết hơn, dễ dàng ghi lại những khung cảnh núi non hùng vĩ, ảnh chụp nhóm đông người.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-8.jpg	Cụm camera kép nổi bật với nhiều cải tiến	14
86	Cụm camera cũng được trang bị tính năng chống rung quang học Sensor Shift giúp lấy nét nhanh chóng, khả năng chụp đêm cũng trở nên rõ nét mà ít bị nhiễu hạt, hay quay video cũng rất ổn định và mượt mà hơn.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-9.jpg		14
87	iPhone 13 có thiết kế nguyên khối vuông vắn như tiền nhiệm, khung viền được làm từ nhôm cùng mặt lưng kính sang trọng, cao cấp.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-13.jpg	Sang trọng, đẳng cấp hơn về ngoại hình	14
88	Ngoại hình không quá khác biệt so với tiền nhiệm, nhưng tỷ lệ màn hình so với khung máy tốt hơn, phần tai thỏ nhỏ hơn 20% gia tăng diện tích trải nghiệm khi lướt web, xem phim, chơi game.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-14.jpg		14
89	iPhone 13 hỗ trợ chuẩn kháng nước và bụi IP68, bạn sẽ yên tâm sử dụng hơn khi đem theo thiết bị để chụp ảnh khi bơi hay những lần vô tình làm đổ nước, có cơn mưa đột ngột.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-17.jpg		14
90	Theo công bố của hãng, iPhone 13 có thời lượng pin tăng thêm 2.5 tiếng so với thế hệ trước, cho thời gian sử dụng lâu hơn, phục vụ hiệu quả với người dùng có nhu cầu sử dụng tần suất cao.	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-18.jpg	Thời lượng pin cũng được cải thiện	14
91	iPhone 15 Plus 256 GB được làm bằng khung kim loại và mặt lưng kính cường lực chắc chắn, tạo ra một cảm giác cực kỳ sang trọng khi cầm trên tay. Kiểu dáng vuông vắn của iPhone 15 Plus mang đến một vẻ ngoài mạnh mẽ và hiện đại, phù hợp với những người dùng yêu thích sự tinh tế và đẳng cấp.  Không còn notch kiểu "tai thỏ" truyền thống, iPhone 15 Plus 256 GB mang đến sự đổi mới với notch dạng Dynamic Island. Việc này giúp tận dụng tối đa không gian màn hình, tạo ra một trải nghiệm xem video và sử dụng ứng dụng đã mắt hơn. Notch viên thuốc cũng là một điểm nhấn độc đáo, giúp iPhone 15 Plus 256 GB trở nên khác biệt so với các điện thoại thông minh khác trên thị trường.	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-130923-014953.jpg	Diện mạo vuông vắn sang trọng	15
92	iPhone 15 Plus 256 GB được trang bị khả năng kháng nước bụi IP68, cho phép người dùng sử dụng điện thoại ở nhiều điều kiện môi trường khác nhau. Bạn có thể thoải mái sử dụng điện thoại trong mưa, những nơi ẩm ướt hoặc khi làm việc trong môi trường bụi bẩn.	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-130923-015414.jpg		15
93	iPhone 15 Plus 256 GB đã chuyển từ cổng Lightning sang cổng Type-C, đáp ứng nhu cầu sử dụng hiện đại của người dùng. Cổng Type-C phổ biến hơn và tương thích với nhiều thiết bị khác nhau, giúp bạn dễ dàng sạc điện thoại và truyền dữ liệu.	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-130923-020407.jpg	Sử dụng cổng kết nối mới	15
94	iPhone 15 Plus 256 GB được trang bị hệ thống camera sau 2 ống kính, trong đó camera chính có độ phân giải 48 MP, giúp chụp ảnh với độ chi tiết tuyệt vời và màu sắc sống động. Camera góc siêu rộng 12 MP cho phép chụp ảnh phong cảnh với độ bao quát cực lớn, giúp thu lại nhiều chi tiết hơn trong một bức ảnh chụp.  iPhone 15 Plus 256 GB có khả năng quay video 4K ở tốc độ khung hình 60fps, mang đến cho bạn trải nghiệm quay video chất lượng cao. Bạn có thể tạo ra những video mượt mà và sắc nét như một đạo diễn chuyên nghiệp.	https://cdn.tgdd.vn/Products/Images/42/303891/iphone-15-plus-camera.jpg	Hỗ trợ quay chụp chuẩn chuyên gia	15
95	Đi cùng với đó là công nghệ chống rung quang học OIS, tính năng này giúp bạn chụp ảnh và quay video ổn định ngay cả trong điều kiện ánh sáng yếu hoặc khi di chuyển.  Đối với camera trước, Apple trang bị camera có độ phân giải 12 MP, cho phép bạn chụp ảnh tự sướng sắc nét và quay video 4K để chia sẻ những khoảnh khắc đáng nhớ của bạn với bạn bè và gia đình.	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-130923-020249.jpg		15
370	realme C67 đưa ra thị trường với hai phiên bản màu độc đáo. Bản màu đen với hiệu ứng xước như nhiều vì sao, tạo cảm giác lãng mạn và tinh tế. Trong khi đó, bản màu xanh lá sáng tạo với hiệu ứng gradient thú vị, khiến chiếc điện thoại trở nên cuốn hút.			46
96	Màn hình của iPhone 15 Plus 256 GB được trang bị tấm nền OLED, mang đến màu sắc tươi sáng, độ tương phản cao và độ sâu ấn tượng. Điều này tạo nên một trải nghiệm hình ảnh sống động, cho phép bạn thể hiện chi tiết tốt hơn và màu sắc chân thực hơn bao giờ hết.  Xem thêm: Màn hình OLED là gì? Có gì nổi bật? Thiết bị nào có màn hình OLED?  Với độ phân giải 1290 x 2796 pixels, màn hình của iPhone 15 Plus 256 GB mang đến độ sắc nét và chi tiết xuất sắc. Bạn sẽ có cảm giác như mọi hình ảnh và văn bản đều được hiển thị rõ ràng và sắc nét, những hiện tượng như răng cưa hay rỗ màn hình cũng hiếm khi xuất hiện trên màn hình này.  Với kích thước màn hình 6.7 inch, iPhone 15 Plus 256 GB đảm bảo rằng bạn có đủ không gian để thư giãn và làm việc. Màn hình lớn nhưng vẫn thoải mái cầm trên tay, giúp bạn trải nghiệm tốt hơn khi xem video, lướt web hoặc làm việc trên iPhone.	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-130923-020731.jpg	Trải nghiệm chân thực với màn hình OLED	15
97	iPhone 15 Plus 256 GB được trang bị bộ vi xử lý Apple A16 Bionic, đây là một trong những bộ vi xử lý mạnh mẽ nhất của Apple hiện nay. Với 6 lõi CPU, 5 lõi GPU và 2 lõi Neural Engine, Apple A16 Bionic mang đến hiệu năng vượt trội, giúp iPhone 15 Plus xử lý mượt mà mọi tác vụ, từ xem video, lướt web cho đến chơi game đồ họa cao.  Xem thêm: Đánh giá chip Apple A16 Bionic chi tiết về thông số và hiệu năng  Với bộ nhớ RAM lớn, iPhone 15 Plus 256 GB cho phép bạn thực hiện nhiều tác vụ cùng một lúc mà không gặp độ trễ hình. Bạn có thể chuyển đổi giữa các ứng dụng, chơi game và lướt web một cách mượt mà và dễ dàng.	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-130923-021044.jpg	Cấu mình mạnh mẽ nhờ chip Apple A16 Bionic	15
98	iPhone 15 Plus 256 GB là một trong những chiếc điện thoại có dung lượng pin lớn nhất trong các dòng iPhone hiện nay. Với dung lượng pin này, bạn có thể thoải mái sử dụng điện thoại cả ngày dài mà không lo hết pin.  Theo thông tin từ Apple, iPhone 15 Plus 256 GB có thể phát video liên tục trong 26 giờ ngoại tuyến, 20 giờ trực tuyến cùng với đó là khả năng phát âm thanh 100 giờ. Đây là những con số ấn tượng, giúp bạn có thể sử dụng điện thoại cho mọi nhu cầu giải trí và làm việc.  iPhone 15 Plus 256 GB hỗ trợ sạc nhanh 20 W, giúp bạn sạc đầy pin chỉ trong thời gian ngắn. Theo Apple, iPhone 15 Plus 256 GB có thể sạc đầy pin từ 0% lên 50% chỉ trong vòng 30 phút.		Thời lượng pin dài lâu cùng khả năng sạc 20 W cực nhanh	15
371		https://cdn.tgdd.vn/Products/42/319658/realme-c67-1-1020x570.jpg		46
372	realme C67 sử dụng cổng sạc Type-C, mang đến tốc độ sạc nhanh và thuận tiện. Đồng thời, chiếc điện thoại này vẫn tích hợp jack tai nghe 3.5 mm, giúp người dùng trải nghiệm âm thanh chất lượng cao mà không cần sử dụng jack chuyển đổi.			46
373	realme C67 mang đến một trải nghiệm hiển thị ổn trong phân khúc nhờ vào tấm nền IPS LCD tiên tiến. Tấm nền này giúp tái tạo mọi hình ảnh có màu sắc trung thực và góc nhìn rộng, điều này làm cho việc xem video, hình ảnh hay thậm chí là chơi game trở nên thoải mái và linh hoạt hơn.		Màn hình lớn có độ phân giải cao	46
374	realme C67 có độ phân giải màn hình Full HD+ (1080 x 2400 Pixels) và kích thước 6.72 inch, độ phân giải cao này mang đến một trải nghiệm xem ảnh và video với chi tiết tuyệt vời. Mỗi pixel trên màn hình được hiển thị với độ sắc nét tối đa, làm cho mọi chi tiết trong hình ảnh hay video trở nên rõ ràng, sắc sảo và sống động.	https://cdn.tgdd.vn/Products/42/319658/realme-c67-3-1020x570.jpg		46
375	Kích thước màn hình lớn không chỉ là để thể hiện sự sang trọng, mà còn mang lại sự linh hoạt và thoải mái trong việc sử dụng. Màn hình lớn làm tăng trải nghiệm giải trí và còn làm cho các tác vụ hằng ngày trở nên dễ dàng hơn, từ việc nhập liệu đến xem thông tin.			46
376	Với hệ thống camera gồm 2 ống kính, realme C67 đưa nhiếp ảnh của bạn lên một tầm cao mới. Camera chính có độ phân giải 108 MP, đảm bảo cho bạn thu được nhiều chi tiết, mọi màu sắc và mọi khía cạnh của khoảnh khắc. Camera phụ 2 MP hỗ trợ tạo điểm nhấn và độ sâu cho ảnh chân dung.	https://cdn.tgdd.vn/Products/42/319658/realme-c67-4-1020x570.jpg	Chụp ảnh tốt hơn với camera lên đến 108 MP	46
377	Với chip Snapdragon 685 8 nhân tích hợp, realme C67 sở hữu một hiệu năng khá ổn trong tầm giá khi nó giúp máy chạy tốt các tác vụ thông thường hằng ngày, từ việc lướt web, trả lời tin nhắn đến việc xem nội dung chất lượng cao. Hơn hết, máy cũng có thể giúp người dùng chơi tốt một vài tựa game như Liên Quân Mobile ở mức cấu hình trung bình.	https://cdn.tgdd.vn/Products/42/319658/realme-c67-5-1020x570.jpg	Cấu hình ổn trong tầm giá với chip Qualcomm	46
378	realme C67 được trang bị RAM 8 GB, giúp chiếc điện thoại realme này xử lý đa nhiệm một cách mạnh mẽ và mượt mà. Bạn có thể chuyển đổi giữa các ứng dụng, chơi game và thậm chí là xử lý ảnh và video mà không gặp trở ngại.			46
379	Với viên pin dung lượng lên đến 5000 mAh, realme C67 là nguồn năng lượng dồi dào, giúp bạn thoải mái sử dụng điện thoại suốt cả ngày mà không cần phải lo lắng về việc sạc lại. Tận hưởng trải nghiệm sử dụng liền mạch từ sáng đến tối mà không bận tâm về năng lượng.	https://cdn.tgdd.vn/Products/42/319658/realme-c67-6-1020x570.jpg	Trang bị pin 5000 mAh đi cùng sạc nhanh 33 W	46
380	Tổng kết, realme C67 là một chiếc điện thoại Android trong phân khúc giá rẻ đến tầm trung đáng chú ý, nổi bật nhất có lẽ là thiết kế, camera và hiệu năng. Máy phù hợp cho những ai đang tìm mua một chiếc máy có giá tốt, cấu hình đủ mạnh để đáp ứng mượt mà các tác vụ cơ bản hằng ngày.			46
120	Tuy được xem là một laptop văn phòng nhưng Laptop Lenovo Ideapad 1 14ALC7 lại sở hữu cho mình sức mạnh của AMD Ryzen 7 giúp bạn thoải mái trong việc sử dụng những ứng dụng thiết kế đồ hoạ cơ bản. Kết hợp thêm sự hỗ trợ từ 16GB RAM,  Laptop Lenovo Ideapad 1 14ALC7 cho phép người dùng có thể chuyển các tab làm việc khác nhau một cách mượt mà. 	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-ideapad-1-14alc7-82r30077vn-6_acee3e8d9c10488286fc5bdae5df55cd_grande.png	Xử lý đa nhiệm với CPU AMD Ryzen 7	17
121	Lenovo Ideapad 1 14ALC7 sở hữu cho mình màn hình 14inch với độ phân giải Full HD, mang đến sự trải nghiệm về hình ảnh cho người dùng tốt nhất. 		Trải nghiệm hình ảnh đa sắc màu. 	17
122	Sở hữu card đồ hoạ như AMD Radeon Graphics kết hợp với màn hình Full HD, Laptop Lenovo Ideapad 1 14ALC7 và chuột gaming bạn sẽ có thể chiến được nhiều con game yêu cầu cấu hình đồ hoạ cao. Thêm vào đó là SSD 512GB bạn có thể trải nghiệm nhiều con game khác nhau mà không sợ dùng lượng bị cạn kiệt một cách nhanh chóng	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-ideapad-1-14alc7-82r30077vn-2_3da8c6a0c5b24c16bfb423b74ccb7be8_grande.png	Giải trí với bộ đồ hoạ tuyệt đỉnh cùng Card AMD Radeon Graphics	17
123	Bạn có thể thoải mái tham gia các cuộc họp ở mọi nơi nhờ chiếc Webcam 720P của Laptop Lenovo Ideapad 1 14ALC7. Không chỉ vậy mà lần này laptop Lenovo có phát triển thêm tính năng Private camera giúp bảo mật hình ảnh cá nhân của bạn trong những lúc không cần thiết tăng tính năng bảo mật cho người dùng. 	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-ideapad-1-14alc7-82r30077vn-3_6c165ca51128439c998aff146a3a688a_grande.png	Bảo mật hình ảnh tuyệt đối	17
124	Camera mang thiết kế nhỏ gọn, khối lượng chỉ 252 g giúp người dùng dễ dàng lắp đặt và di chuyển. Vỏ ngoài chắc chắn, hạn chế bám bụi bẩn hiệu quả, camera có nhiệt độ hoạt động từ - 10 độ C đến 45 độ C và độ ẩm dưới 95%, cho bạn thoải mái sử dụng camera trong nhà với mọi điều kiện thời tiết ở Việt Nam dù là mùa mưa hay mùa nắng.	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-4-1.jpg	Thiết kế nhỏ gọn, gam màu thanh lịch	18
125	Với độ phân giải 4 MP (1440p), camera cung cấp hình ảnh sắc nét, chi tiết, giúp bạn dễ dàng nhận diện khuôn mặt người bước vào khung hình hoặc các vật thể khác trong tầm quan sát. Với khả năng xoay 340 độ ngang và 55 độ dọc, camera có thể quan sát toàn cảnh 360 độ, đảm bảo không bỏ lỡ bất kỳ góc khuất nào, cho phép bạn theo dõi được không gian rộng lớn mà không cần nhiều camera.  Tầm nhìn xa hồng ngoại 10 m giúp camera nhìn rõ trong bóng tối, phù hợp với việc giám sát vào ban đêm hoặc trong điều kiện ánh sáng yếu.	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-1-1.jpg	Độ phân giải 4 MP cho chất lượng hình ảnh/video sắc nét	18
126	Camera EZVIZ trang bị chế độ tự động tuần tra, cho thiết bị quan sát theo các điểm đã được cài đặt trước, hỗ trợ giám sát tối đa 4 vị trí khác nhau. Điều này giúp camera quét được khu vực rộng lớn theo chu kỳ, hạn chế điểm mù trong tầm quan sát hiệu quả.  Phát hiện hình dáng người thông minh, tính năng này giúp phân biệt giữa người và các đối tượng khác, giảm thiểu cảnh báo sai lệch và tăng cường độ chính xác trong việc nhận diện. Với chế độ ngủ bạn có thể lên lịch cho camera để tạm ngừng ghi hình, giúp bảo vệ sự riêng tư của bạn trong những thời điểm không cần thiết phải giám sát.	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-2-1.jpg	Trang bị nhiều tính năng quan sát thông minh	18
127	Camera trong nhà trang bị khe cắm thẻ nhớ MicroSD nằm dưới ống kính, hỗ trợ dung lượng tối đa lên tới 512 GB (thẻ nhớ mua riêng) cho bạn không gian lưu trữ đáng kể, đủ rộng rãi để lưu những đoạn video hay hình ảnh quan trọng. Để cắm thẻ nhớ bạn chỉ cần dùng tay đẩy nhẹ ống kính lên phía trên thì khe cắm sẽ xuất hiện.	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-7-1.jpg	Bộ nhớ rộng rãi, lưu trữ an toàn	18
128	Camera có thể kết nối Wifi hoặc LAN, hỗ trợ băng tần 2.4 GHz và 5 GHz. Sản phẩm tương thích với các thiết bị chạy trên hệ điều hành Android, iOS và iPadOS giúp người dùng có thể theo dõi và kiểm soát camera mọi lúc, mọi nơi thông qua các thiết bị di động của mình.  Hơn nữa, thông qua ứng dụng EZVIZ với giao diện trực quan, dễ sử dụng, cho phép người dùng có thể cài đặt, quan sát và tùy chỉnh cho camera một cách dễ dàng.	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-3-1.jpg	Dễ dàng kết nối và điều khiển camera thông qua ứng dụng EZVIZ	18
129	Dòng ThinkPad của nhà Lenovo là một trong những chiếc laptop được cộng đồng ưa chuộng nhất dành cho "Chủ tịch" bởi độ bền chuẩn quân đội, thiết kế tối giản cũng như các tính năng bảo mật tuyệt vời. Vỏ máy được làm từ hợp kim nhôm cho độ bền cao, đạt chuẩn độ bền quân sự MIL-STD 810H. Đặc biệt trọng lượng của Lenovo ThinkPad E16 Gen 1 21JN005MVN chỉ có 1.8kg, đảm bảo độ mỏng nhẹ giúp bạn có thể mang máy đến mọi nơi.	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct1_04_2ff667318ca0478a99568ba033761817_grande.png	Thiết kế cao cấp, bền bỉ	19
130	Laptop Lenovo ThinkPad E16 Gen 1 21JN005MVN được trang bị bộ vi xử lý Intel® Core™ i5-1335U với 10 nhân 12 luồng, cho ra sức mạnh đa nhân tối ưu đáp ứng tốt các tác vụ văn phòng: xem phim, lướt web, soạn thảo văn bản,... Card đồ họa tích hợp Intel Iris Xe Graphics đáp ứng các nhu cầu làm việc cơ bản, RAM 16GB và ổ cứng SSD 512GB giúp khởi động máy nhanh chóng và cho phép chạy đa nhiệm mượt mà.	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct1_02_f522c9a00c9b4ebb8fccb56d02df5cbf_grande.png	Hiệu năng tối ưu 	19
131	Laptop Lenovo ThinkPad E16 Gen 1 21JN005MVN được trang bị màn hình 16 inch WUXGA (1920x1200) IPS chống chói cho hình ảnh sắc nét, góc nhìn rộng, thoải mái cho mắt khi làm việc trong thời gian dài. Bảo mật cao với chip bảo mật TPM 2.0, cảm biến vân tay và camera có tính năng shutter để che webcam khi không sử dụng.	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct1_03_cd46391a560f4d0480a0fa0937bb9f08_grande.png	Màn hình chất lượng và bảo mật cao	19
132	Bàn phím của dòng ThinkPad được đánh giá có chất lượng tốt nhất hiện nay nhờ cảm giác gõ êm ái, nổ nảy phản hồi tốt, hành trình phím sâu, ThinkPad E16 Gen 1 21JN005MVN còn tích hợp đèn nền giúp bạn dễ dàng làm việc, đánh máy trong môi trường thiếu sáng. Laptop được trang bị đầy đủ các cổng kết nối tiêu chuẩn: 1x USB 2.0, 1x USB 3.2 Gen 1 (luôn bật), 1x USB-C® 3.2 Gen 2, 1x Thunderbolt™ 4, 1x HDMI® 2.1, 1x giắc cắm tai nghe, 1x Ethernet (RJ-45).	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct2_01_7a010f80b29f4e6e8cb2fbb843606fd0_grande.png	Bàn phím và các cổng kết nối	19
133		https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct2_02_6c9287f4e0614a148ea043a616056056_grande.png		19
134	Lenovo ThinkPad E16 Gen 1 21JN005MVN là một sự lựa chọn tuyệt vời cho các bạn học sinh, sinh viên, dân văn phòng cần một chiếc laptop bền bỉ, bảo mật cao, hiệu năng đủ dùng cho các tác vụ văn phòng cơ bản, học tập online với thiết kế mỏng nhẹ, dễ dàng di chuyển. Máy đang được bán tại GEARVN với mức giá cực kì ưu đãi và đang có rất nhiều voucher lớn đang chờ đón bạn.		Tổng kết	19
147	Laptop Lenovo Yoga Slim 7 14IMH9 83CV001UVN sở hữu cho mình ngoại hình vô cùng nhỏ nhắn với kích thước 312 x 221 x 14.9mm và trọng lượng chỉ vỏn vẹn 1.39kg. 	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-4_e19c0ad17c254cc9936e56fa1890c04c.png	Thiết kế nhỏ gọn và thời thượng	21
135	Được trang bị camera chính 50 MP kèm theo camera phụ 12 MP góc siêu rộng và camera macro 5 MP, Galaxy A55 5G mang lại trải nghiệm chụp ảnh ấn tượng, không chỉ cho ra ảnh chất lượng cao mà máy còn mang đến nhiều tính năng với các chế độ chụp đầy thú vị như góc siêu rộng hay chụp cận.  Có khả năng quay video 4K, Galaxy A55 5G đem đến những khoảnh khắc cuộc sống với độ chuyên nghiệp và sắc nét tối đa. Mỗi video ghi lại đều tái hiện sự rõ ràng, mượt mà và sống động đến từng chi tiết.	https://cdn.tgdd.vn/Products/42/322670/samsung-galaxy-a55-5g-5-1020x570.jpg	Camera 50 MP cho khả năng chụp ảnh sắc nét	20
136	Không chỉ dừng lại ở những tính năng cơ bản, Galaxy A55 5G còn mang đến cho người dùng những cài đặt máy ảnh chuyên nghiệp, giúp bạn dễ dàng tạo nên những tác phẩm ảnh sáng tạo và chất lượng tuyệt vời. Tính năng này bao gồm chế độ chụp ảnh ban đêm, khả năng xóa phông, chụp toàn cảnh và nhiều cài đặt tùy chỉnh khác, nhờ đó mà bạn có thể thể hiện sự sáng tạo của mình mọi lúc mọi nơi.			20
137	Đặc biệt, với tính năng quay video hiển thị kép, Galaxy A55 5G mang đến một trải nghiệm sáng tạo và mới mẻ. Người dùng có thể theo dõi đồng thời nhiều góc nhìn trong cùng một video, tạo ra những đoạn phim ngắn độc đáo. Điều này rất phù hợp cho những bạn làm sáng tạo nội dung vlog hoặc những người muốn lưu giữ những khoảnh khắc đặc biệt của riêng mình.			20
138	Sản phẩm thuộc dòng điện thoại Galaxy A tiếp nối những tiến bộ trong việc nâng cao khả năng kháng nước và kháng bụi chuẩn IP67, giúp người dùng yên tâm hơn mỗi khi tiếp xúc với môi trường ẩm ướt hay bụi bẩn. Điều này không chỉ giúp tăng cường tuổi thọ của thiết bị mà còn giúp bạn sử dụng máy một cách thoải mái hơn trong mọi tình huống.	https://cdn.tgdd.vn/Products/42/322670/samsung-galaxy-a55-5g-3-1020x570.jpg	Hỗ trợ chuẩn IP67 an tâm sử dụng	20
139	Samsung Knox Vault, với chứng chỉ EAL 5+, được thiết kế để bảo đảm an toàn tuyệt đối cho mọi dữ liệu cá nhân, từ mã PIN, mật khẩu đến mẫu hình mở khóa điện thoại. Những dữ liệu được mã hóa sẽ được bảo vệ cách ly hoàn toàn khỏi hệ điều hành chính, nằm trong bộ lưu trữ chuyên biệt của Samsung Knox Vault.	https://cdn.tgdd.vn/Products/Images/42/322096/samsung-galaxy-a55-5g-110624-050329.jpg	Dữ liệu an toàn hơn với Samsung Knox Vault	20
140	Với Galaxy A55 5G, bạn sẽ nhận được 4 thế hệ nâng cấp hệ điều hành, đảm bảo rằng thiết bị của bạn luôn cập nhật với các tính năng mới nhất. Ngoài ra, điện thoại còn được cập nhật bảo mật liên tục trong 5 năm, giúp dữ liệu cá nhân của bạn luôn an toàn trước các mối đe dọa.	https://cdn.tgdd.vn/Products/Images/42/322096/samsung-galaxy-a55-5g-110624-050502.jpg	Cập nhật hệ điều hành và bảo mật	20
141	Điện thoại Galaxy A55 5G tạo điểm nhấn với chất lượng và thiết kế vuông vức tinh tế. Nó thể hiện sự hòa trộn hoàn hảo giữa đường nét mềm mại và các góc cạnh, kết hợp với viền màn hình siêu mỏng và mặt lưng nhám mịn, tạo ra cảm giác sang trọng và đẳng cấp.  Galaxy A55 5G với khung kim loại chắc chắn không chỉ thêm phần cuốn hút mà còn cung cấp độ bền cao. Sự kết hợp giữa vẻ ngoài sang trọng và tính bền bỉ của khung viền, tạo nên một chiếc điện thoại không chỉ đẹp mắt mà còn đáng tin cậy.	https://cdn.tgdd.vn/Products/42/322670/samsung-galaxy-a55-5g-1-1020x570.jpg	Thiết kế sang trọng, tinh tế	20
142	Phần màn hình với kính cường lực Corning Gorilla Glass 7+, Galaxy A55 5G trở thành một trong những chiếc điện thoại có độ bảo vệ màn hình tốt nhất hiện nay. Cùng với cụm camera 3 ống kính bố trí rời tạo nên điểm nhấn về thiết kế, Galaxy A55 5G tiếp tục khẳng định vị thế của mình trong phân khúc điện thoại thông minh tầm trung.			20
143	Với màn hình lớn trang bị tấm nền Super AMOLED, mỗi pixel được kiểm soát riêng, cho phép sắc đen hoàn toàn và màu sắc sống động sắc nét, đồng thời cung cấp góc nhìn rộng và thời gian phản hồi cực nhanh. Vì thế, tấm nền Super AMOLED là lý tưởng cho việc xem video, chơi game và hầu hết các nhiệm vụ đòi hỏi hình ảnh chất lượng cao.  Màn hình của Galaxy A55 5G cho thấy sự chú trọng vào độ sắc nét với độ phân giải Full HD+ (1080 x 2340 Pixels). Tất cả hình ảnh, video và văn bản được hiển thị sắc nét đến từng chi tiết nhỏ ngay cả ở góc rìa, tạo ra một trải nghiệm hình ảnh chân thực và sống động.	https://cdn.tgdd.vn/Products/42/322670/samsung-galaxy-a55-5g-4-1020x570.jpg	Màn hình Super AMOLED hiển thị hình ảnh sống động	20
144	nhân xử lý, chip này giúp điện thoại này có hiệu suất vượt trội, đáp ứng mọi nhu cầu công việc và giải trí của người dùng, từ việc lướt web, xem video hay chơi game nặng đều không còn là nỗi lo.  Đi cùng với chip xử lý mạnh mẽ là chip đồ họa AMD Titan 1WGP, phục vụ tốt cho nhu cầu giải trí. Nhờ vậy, Galaxy A55 5G cung cấp chất lượng hình ảnh sắc nét trong trò chơi, mượt mà cùng tốc độ khung hình ổn định kể cả khi chơi game 3D hay xem phim độ phân giải cao.	https://cdn.tgdd.vn/Products/42/322670/samsung-galaxy-a55-5g-6-1020x570.jpg	Phân khúc giá tầm trung, cấu hình hấp dẫn	20
145	Sở hữu viên pin có dung lượng lên tới 5000 mAh, Galaxy A55 5G hứa hẹn mang lại thời gian sử dụng lâu dài. Với dung lượng khủng, chiếc smartphone này quả là lựa chọn lý tưởng cho những ai muốn tận hưởng những hoạt động giải trí hoặc làm việc mà không cần lo lắng về việc phải sạc điện thoại nhiều lần trong ngày.	https://cdn.tgdd.vn/Products/42/322670/samsung-galaxy-a55-5g-7-1020x570.jpg	Thời lượng pin ấn tượng giúp trải nghiệm không giới hạn	20
146	Khi bạn nâng cấp lên một chiếc Samsung Galaxy mới, việc chuyển toàn bộ dữ liệu từ điện thoại hoặc máy tính bảng cũ trở nên dễ dàng hơn bao giờ hết. Cho dù bạn đang sử dụng điện thoại Galaxy, iOS hay bất kỳ thiết bị Android nào khác, tất cả các dữ liệu quan trọng của bạn sẽ được di chuyển một cách liền mạch nhờ tính năng Smart Switch.	https://cdn.tgdd.vn/Products/Images/42/322096/samsung-galaxy-a55-5g-110624-045737.jpg	Chuyển đổi dữ liệu nhanh chóng với Smart Switch	20
148	Intel Core Ultra 7 155H được Intel phát hành vào cuối năm 2023, là một con chip mới với 16 nhân và 22 luồng cùng với 32G RAM. Laptop Lenovo Yoga Slim 7 14IMH9 83CV001UVN có hiệu suất cực kỳ mạnh mẽ với khả năng xử lý đa nhiệm công việc mượt mà.	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-2_25b9d5232750401eaa1ee18aec3ffeea.png	Trang bị con chip mới nhất của Intel 	21
149	Lenovo Yoga Slim 7 14IMH9 83CV001UVN sở hữu cho mình ổ cứng SSD 512 mang đến kho lưu trữ rộng vừa đủ để người dùng văn phòng có thể lưu trữ các tài liệu công việc của mình. Nếu bạn có nhiều dữ liệu, ứng dụng cần lưu trữ hơn thì bạn hoàn toàn có thể nâng cấp dung lượng ổ cứng khi máy hỗ trợ ổ cứng lưu trữ lên đến 1TB.	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-3_124a855f1e2e404cb45447a797b828da.png	Ổ dung lượng cho dân văn phòng	21
150	Nhắc đến tấm nền OLED chúng ta đều nhớ ngay đến tấm nền “đắt xắt ra miếng” khi mang đến độ sắc nét và tương phản cực kỳ cao. Kết hợp với chiếc màn hình 14’’ cùng độ phân giải WUXGA, hình ảnh laptop Lenovo Yoga Slim 7 14IMH9 83CV001UVN đem lại vô cùng sống động với màu sắc chân thật đến từng điểm ảnh. 	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-5_a0ed268da9a84dc4adde77bdaf660864.png	Màn hình sắc nét với tấm nền OLED	21
151	Lenovo Yoga Slim 7 14IMH9 83CV001UVN sở hữu cho mình đa cổng kết nối bao gồm 1 USB A, 2 USB C, 1 HDMI và cả 1 jack 3.5 giúp bạn có thể kết nối với các gaming gear khác một cách dễ dàng và nhanh chóng, từ đó tăng hiệu quả làm việc của người dùng. 	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-6_814c5b99d30444c29f984e0096a6c22f.png	Kết nối linh hoạt với nhiều thiết bị 	21
152	Có sẵn tính năng che mắt camera và camera IR cho Windows® Hello giúp bảo vệ thông tin cá nhân của người dùng. Điều này đảm bảo rằng chỉ có người dùng được ủy quyền mới có thể truy cập vào hệ thống, tăng tính bảo mật và sự an toàn khi sử dụng máy.	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-ideapad-slim-5-16imh9-7_ecf41500b20843e0a864c157d0830533_grande.png	Bảo mật tốt	22
153	Đầu tiên, với bộ vi xử lý Intel® Core™ Ultra 5 125H thế hệ mới mang lại sức mạnh xử lý cho đa nhiệm tác vụ từ đơn giản đến nặng nề như thiết kế mà vẫn đảm bảo được sự mượt mà và hiệu quả.	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-ideapad-slim-5-16imh9-2_1c368d7b8a47443ba0ff60ae10359283_grande.png	Hiệu suất hoạt động mạnh mẽ 	22
154	Để hoàn thiện được tốc độ tổng thể Laptop Lenovo Ideapad Slim 5 16IMH9 83DC001RVN được trang bị chiếc RAM LPDDR5x với dung lượng lớn (16GB) và tốc độ cao giúp tối ưu hóa công việc đa nhiệm, cho phép bạn chạy nhiều ứng dụng cùng một lúc mà vẫn duy trì hiệu suất ổn định.	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-ideapad-slim-5-16imh9-9_40a805408d904cb89a14bf86134b329b_grande.png		22
155	Laptop Lenovo Ideapad Slim 5 16IMH9 được thiết kế với sự tinh tế và tinh thần hiện đại, mang đến trải nghiệm sử dụng đẳng cấp.	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-ideapad-slim-5-16imh9-1_9bac2a622f0843dca92bc9a9db3759ef_grande.png	Thiết kế tinh tế đẳng cấp	22
156	Thiết kế mỏng nhẹ với chất liệu nhôm cao cấp không chỉ tạo nên vẻ ngoài sang trọng mà còn mang lại độ bền bỉ và độ cứng cáp cho máy. Điều này giúp người dùng cảm thấy tự tin khi sử dụng máy ở mọi tình huống.			22
157	Màn hình OLED 2K 16" với độ phân giải cao mang lại trải nghiệm hình ảnh sắc nét và sống động. Màu sắc được tái tạo một cách chân thực, từng chi tiết trên màn hình hiển thị rõ nét, giúp người dùng thưởng thức nội dung đa phương tiện một cách tốt nhất.	https://file.hstatic.net/200000722513/file/gearvn-laptop-lenovo-ideapad-slim-5-16imh9-4_4c7aaec3e35d41999bd177622af17994_grande.png	Màn hình chất lượng 	22
158	Đây sẽ là một trong những laptop hướng đến người dùng có yêu cầu công việc cần phải di chuyển nhiều, và nó sẽ là một trong những lựa chọn cực tốt cho sinh viên để đáp ứng nhu cầu học tập. Ngay bây giờ hãy sở hữu Laptop Lenovo Ideapad Slim 5 16IMH9 83DC001RVN			22
159	Ấn tượng đầu tiên của mình sau khi cầm trên tay chiếc Galaxy A24 là về phần màn hình của máy, mình thực sự rất ấn tượng khi đây chỉ là một mẫu điện thoại thuộc phân khúc tầm trung - cận giá rẻ, nhưng đã được Samsung trang bị tấm nền Super AMOLED cao cấp.  Ở thời điểm hiện tại, việc bắt gặp một chiếc máy trong tầm giá này được trang bị tấm nền Super AMOLED thực sự là rất hiếm tại thị trường Việt Nam, trong khi nhiều đối thủ cũng chỉ trang bị cho sản phẩm của mình tấm nền IPS LCD, hay thậm chí tốt hơn cũng chỉ là AMOLED.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043233.jpg	Hiển thị nội dung tốt hơn với màn hình Super AMOLED	23
160	Điều này giúp Galaxy A24 có được khá nhiều lợi thế để cạnh tranh với nhiều mẫu máy khác khi mang đến trải nghiệm hình ảnh thật sự ấn tượng.  Nội dung khi được hiển thị trên điện thoại Samsung có màu sắc rực rỡ, sống động, ở những gam màu nổi thì màn hình cũng sẽ tự động làm rực lên đôi chút, giúp trải nghiệm của mình khi xem trở nên mãn nhãn hơn rất nhiều.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043235.jpg		23
161	Đối với những vùng tối hay cụ thể là các điểm đen trên màn hình, Galaxy A24 tái hiện lại nội dung có chiều sâu hơn khi các điểm ảnh lúc này được tắt hoàn toàn để thể hiện màu đen tuyệt đối.  Được hỗ trợ độ phân giải Full HD+ (1080 x 2340 Pixels) vậy nên mọi chi tiết đều được tái hiện lại một cách sắc nét, không xuất hiện hiện tượng răng cưa hay lộ điểm ảnh, cảm giác khi chơi game hay xem phim cũng trở nên chân thực và sống động.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043237.jpg		23
162	Galaxy A24 được hỗ trợ tần số quét 90 Hz, vì thế mọi thao tác cuộn/lướt trên màn hình đều được phản hồi nhanh, tạo cho mình cảm giác mượt mà hơn.  Theo mình thấy thì đây là một mức lý tưởng đối với một người dùng cơ bản, khi mà việc trang bị tần số quét cao như 120 Hz không được tận dụng hết bởi nhu cầu chơi game hay xem phim, và với 90 Hz sẽ giúp tối ưu được trải nghiệm vuốt chạm song cũng mang lại hiệu quả cho việc làm giảm năng lượng tiêu hao trên màn hình	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043239.jpg		23
163	Năm nay nhà Samsung đã mang đến một sự thay đổi đáng chú ý trong thiết kế với dòng sản phẩm mới. Không còn sử dụng kiểu bo cong mềm mại như phiên bản tiền nhiệm mà thay vào đó sẽ là một diện mạo thời thượng hơn. Khung viền vuông đậm chất xu hướng, mặt lưng phẳng kết hợp bề mặt nhẵn bóng đã khiến tổng thể máy trở nên nổi bật hơn.   Mặt lưng cùng bộ khung của chiếc điện thoại Galaxy dòng A này được cấu tạo chủ yếu từ chất liệu nhựa nên máy có khối lượng chỉ 195 g. Mặc dù hoàn thiện từ nhựa nhưng máy vẫn có được một sự cứng cáp nhất định, khi chạm vào mặt lưng không có hiện tượng lõm hay tiếng ọp ẹp, tạo cảm giác bên trong máy được thiết kế một cách chắc chắn và đầy đặn.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043244.jpg	Thiết kế tối giản đầy sang trọng	23
164	Tuy nhiên, có một điểm trừ nhỏ là phần mặt lưng của máy cũng khá dễ bám dấu vân tay, việc kháng xước cũng chưa thực sự hiệu quả cho lắm. Do vậy người dùng nên trang bị thêm cho điện thoại một ốp lưng để bảo vệ máy tốt hơn trước những tình huống va quẹt ngoài ý muốn.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043247.jpg		23
165	Samsung cũng đã có sự thay đổi trong thiết kế camera với thế hệ sản phẩm mới này. Thay vì gộp tất cả ống kính vào chung một cụm như trước đây, hãng đã bố trí riêng lẻ từng ống kính cho Galaxy A24. Cách làm này giống với những mẫu điện thoại cao cấp của hãng như Galaxy S23 hay Galaxy S23 Plus. Nhờ vậy mà máy mang một vẻ đẹp hiện đại và đồng bộ hơn với hai mẫu flagship trên.			23
166	Mình nhận thấy rằng cụm camera được thiết kế hơi nhô cao so với mặt lưng của máy. Tuy nhiên, điều đáng chú ý là mặt kính bảo vệ cảm biến được hoàn thiện lõm vào bên trong, giúp hạn chế bị trầy xước khi đặt máy lên các mặt phẳng thông thường. Điều này hỗ trợ bảo vệ camera tốt hơn, đồng thời tránh được tình trạng giảm chất lượng ảnh chụp do các vết xước gây ra.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043249.jpg		23
167	Galaxy A24 được trang bị một viên pin lớn có dung lượng lên đến 5000 mAh vì thế máy mang lại thời gian sử dụng rất dài. Với các nhu cầu đa tác vụ từ chơi game cho đến lướt web hay xem phim, điện thoại có khả năng duy trì thời lượng pin trong khoảng 8 tiếng 12 phút.  Bài thử nghiệm này được mình thực hiện khi máy đang ở trạng thái 100% dung lượng pin, âm lượng điện thoại ở mức 50%, độ sáng màn hình đạt mức tối đa và máy hoàn toàn sử dụng kết nối wifi, không sử dụng mạng di động.		Kéo dài thời gian sử dụng với pin 5000 mAh	23
168	Có những hôm mình không sử dụng điện thoại để chơi game mà chỉ dùng để lướt web, xem phim cũng như nhắn tin trả lời công việc, nhờ vậy mà máy không phải tốn quá nhiều năng lượng để cung cấp cho chip hoạt động ở mức xung nhịp cao, điều này giúp kéo dài thời gian sử dụng lên đến hơn 10 giờ liên tục.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043252.jpg		23
169	Trung bình thì Galaxy A24 tiêu hao khoảng 8 cho đến 12% pin cho khoảng 1 giờ sử dụng, nếu cài đặt độ sáng màn hình ở mức thấp hơn thì mình tin rằng con số này còn có thể kéo dài hơn nữa.  Ngoài việc trang bị viên pin lớn ra thì đây còn là mẫu điện thoại sạc nhanh với công suất hỗ trợ tối đa là 25 W. Khá tiếc khi Samsung không trang bị thêm củ sạc dành cho Galaxy A24, vì thế nên mình phải sử dụng củ sạc riêng từ hãng Baseus có công suất 65 W để thực hiện bài test về thời gian sạc trên điện thoại.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043254.jpg		23
170	Bên trong Galaxy A24 được trang bị con chip Helio G99 đến từ nhà MediaTek, hoạt động với mức xung nhịp tối đa có thể đạt được là 2.2 GHz, kết hợp cùng GPU Mali-G57 cung cấp hiệu suất đồ họa mạnh mẽ. Điều này giúp cho trải nghiệm chơi game ổn định và mượt mà hơn, đồng thời cũng hỗ trợ xử lý hình ảnh và video chất lượng cao.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043257.jpg	Tích hợp chipset gaming từ nhà MediaTek	23
171	Chiếc điện thoại Android này gây ấn tượng mạnh với hiệu năng vượt trội thông qua các ứng dụng kiểm tra khả năng xử lý chuyên dùng. Trên Geekbench 6, điểm đơn nhân đạt 717 và điểm đa nhân đạt 1852, còn trên PCMark, tổng điểm đạt 9034. Những con số này không chỉ cho thấy khả năng đa nhiệm mạnh mẽ mà còn khẳng định sức mạnh xử lý đa luồng của máy.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043259.jpg		23
172	Về hệ thống ống kính của máy, Galaxy A24 được trang bị 3 camera trong đó camera chính có độ phân giải 50 MP, kèm với đó là 2 camera phụ có độ phân giải lần lượt là 5 MP và 2 MP để hỗ trợ cho việc chụp ảnh góc siêu rộng và macro (siêu cận).	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043307.jpg	Thu lại các bức ảnh sắc nét hơn nhờ camera 50 MP	23
173	Ở môi trường có đầy đủ ánh sáng, ảnh chụp cho ra có độ chi tiết cao, màu sắc được tái tạo hài hòa và sinh động, tổng thể tạo nên một cái nhìn bắt mắt mà không cần qua bước hậu kỳ trước khi đăng tải lên mạng xã hội.	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-010623-043309.jpg		23
174	Tổng kết lại, Galaxy A24 thực sự là một sự lựa chọn đáng cân nhắc trong phân khúc điện thoại tầm trung - cận giá rẻ hiện nay. Máy không chỉ có mức giá hấp dẫn mà còn sở hữu cấu hình mạnh mẽ, đáp ứng tốt các nhu cầu cơ bản và đảm bảo cho người dùng trải nghiệm sử dụng lâu dài.			23
175	Galaxy Z Flip5, một phiên bản nâng cấp chất lượng của gia đình Galaxy, đã ra mắt trước đây và hiện tại đã được tích hợp các công nghệ điện toán trí tuệ tiên tiến. Đây là những tính năng mà Samsung từng giới thiệu với chúng ta qua dòng sản phẩm Galaxy S24 Series thông qua giao diện One UI 6.1 vừa mới cập nhật vào cuối tháng 3 năm 2024.		Tích hợp các tính năng AI hiện đại	24
176	Một số tính năng đáng chú ý của Galaxy Z Flip5 bao gồm: Trợ lý Note thông minh: Công cụ ghi chú nhanh, hiệu quả và tự động hóa. Trợ lý chỉnh ảnh: Giúp chỉnh sửa ảnh một cách dễ dàng, nhanh chóng. Trợ lý chat thông minh: Hỗ trợ nâng cao trong việc tương tác trò chuyện. 	https://cdn.tgdd.vn/Products/42/324028/Samsung-ho-tro-ai-1020x570.jpg		24
177	Bên cạnh đó, điện thoại còn có tính năng Phiên dịch trực tiếp: Hỗ trợ người dùng trong việc giao tiếp với nhiều loại ngôn ngữ trên toàn cầu. Khoanh vùng tìm kiếm thông minh: Cung cấp khả năng tìm kiếm chính xác và nhanh chóng, từ đó giúp người dùng tối ưu hóa thời gian sử dụng.			24
178	Samsung Galaxy Z Flip5 tiếp tục theo đuổi phong cách gập độc đáo đã trở thành thương hiệu của dòng sản phẩm "Z Flip". Với thiết kế nhỏ gọn và hình dáng hộp phấn khi gập lại, chiếc điện thoại này rất dễ dàng cất đi trong túi áo hoặc túi xách.	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034735.jpg	Ấn tượng với cơ chế gấp gọn	24
179	Samsung Galaxy Z Flip5 được chế tạo từ các chất liệu cao cấp như kim loại và kính. Khung bên ngoài được làm bằng Armor Aluminum chắc chắn, mang đến sự cứng cáp và sang trọng cho thiết bị. Mặt sau của điện thoại được bao phủ bởi lớp kính cường lực, giúp bảo vệ máy khỏi vết xước không mong muốn và mang đến vẻ bóng bẩy, tinh tế.	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034737.jpg		24
180	Samsung đã liên tục nâng cấp công nghệ bản lề qua các phiên bản trước đó và Galaxy Z Flip5 không phải là ngoại lệ. Bản lề của chiếc điện thoại Samsung dòng gập này được thiết kế theo cơ chế rãnh kép giúp mang đến sự chắc chắn và chịu lực tốt, đảm bảo cho việc đóng/mở mượt mà và ổn định.   Trải nghiệm đóng/mở trên Z Flip5 mình cảm giác nhẹ nhàng hơn thế hệ trước đó, có thể mở máy bằng một tay và điều này trở nên cực kỳ thuận tiện cho việc sử dụng thường ngày. 	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034739.jpg		24
181	Hơn hết, Z Flip5 còn khắc phục được một nhược điểm lớn so với thế hệ cũ là loại bỏ gần như hoàn toàn khoảng hở giữa hai phần màn hình khi đóng máy. Nhờ vào nâng cấp này mà màn hình được bảo vệ tốt hơn, hạn chế được các dị vật xen lẫn vào bên trong gây tổn hại đến máy.	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034742.jpg		24
182	Samsung Galaxy Z Flip5 được trang bị màn hình Dynamic AMOLED 2X công nghệ cao với khả năng hiển thị màu sắc đẹp. Tấm nền này cho phép hiển thị các màu sắc sống động, tự nhiên và đậm màu, đem lại những hình ảnh, video chân thực và sắc nét.   Màn hình chính của Z Flip5 có độ phân giải cao Full HD+ (1080 x 2640 Pixels) đảm bảo mọi nội dung hiển thị trên màn hình đều rõ nét và chi tiết. Cho dù xem hình ảnh, video, duyệt web hoặc chơi các trò chơi di động phức tạp, màn hình với độ phân giải này đều mang lại độ chân thực cao.	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034744.jpg	Trang bị màn hình cao cấp	24
183	Màn hình chính trên Z Flip5 có tần số quét màn hình 120 Hz cho khả năng cập nhật hình ảnh lên tới 120 lần mỗi giây, nó mang lại cảm giác mượt mà và phản hồi nhanh hơn khi vuốt, cuộn hoặc chơi các trò chơi FPS cao.	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034745.jpg		24
184	Ngoài ra, chiếc điện thoại Samsung này còn có màn hình phụ Flex Window với kích thước 3.4 inch, lớn hơn phiên bản Z Flip4 khi chỉ đạt 1.9 inch. Với kích thước lớn như vậy thì màn hình này hoàn toàn đủ để xem thông báo, trả lời cuộc gọi hay nhắn tin nhanh chóng mà không cần mở toàn bộ điện thoại.	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034747.jpg		24
185	Samsung Galaxy Z Flip5 được trang bị bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy - là con chip được tối ưu riêng cho dòng Galaxy giúp tối ưu hiệu năng mạnh mẽ và hiệu quả về mặt năng lượng. Chip này cũng sẽ hỗ trợ 5G, cho phép người dùng tận hưởng tốc độ internet siêu nhanh và truyền tải dữ liệu mượt mà.		Cấu hình mạnh mẽ hàng đầu	24
186	Nhờ vào bộ vi xử lý mạnh mẽ và các công nghệ tiên tiến tích hợp, Samsung Galaxy Z Flip5 có thể dễ dàng xử lý các tác vụ đa nhiệm phức tạp, chạy mượt các ứng dụng nặng và thậm chí đáp ứng tốt cho các trò chơi 3D đòi hỏi đồ họa cao. 	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034750.jpg		24
187	Galaxy Z Flip5 sẽ được trang bị bộ nhớ RAM 8 GB. Việc sở hữu lượng RAM lớn này sẽ cải thiện hiệu suất của điện thoại, giúp cho việc chuyển đổi giữa các ứng dụng và nhiệm vụ đa nhiệm trở nên trơn tru hơn. Vì thế mình có thể thoải mái mở nhiều ứng dụng cùng lúc, xem video HD, chơi game mượt mà và duyệt web nhanh chóng mà không gặp trở ngại.	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034759.jpg		24
188	Samsung Galaxy Z Flip5 được trang bị một hệ thống camera kép ở mặt sau, bao gồm một camera chính 12 MP và một camera góc siêu rộng 12 MP. Hệ thống này mang đến sự đa dạng trong việc chụp ảnh, giúp người dùng dễ dàng bắt gọn cảnh quan rộng lớn hoặc chụp những bức ảnh chân dung độc đáo.		Tích hợp hệ thống 2 camera 	24
189	Hệ thống camera của Galaxy Z Flip5 được tối ưu hóa để chụp ảnh trong điều kiện ánh sáng yếu và đêm tối. Công nghệ xử lý hình ảnh tiên tiến và cảm biến lớn cho phép nhiều ánh sáng hơn được thu vào trong từng khung hình, từ đó giảm thiểu nhiễu và tăng cường chi tiết trong ảnh. Nhờ đó, bạn có thể chụp ảnh đẹp và sắc nét ngay cả khi điều kiện ánh sáng không thuận lợi.	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034800.jpg		24
190	Còn về ảnh chụp từ chế độ góc siêu rộng thì máy cho ra một góc nhìn lớn hơn, nhiều chi tiết được thu vào bức hình, vì thế các bức ảnh chụp đường phố hay kiến trúc của mình được tái hiện lại một cách đẹp mắt và thú vị. Cùng với đó là độ phân giải cao, nó giúp đảm bảo được tính chân thực và vẻ đẹp của chủ thể hay phong cảnh.	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034803.jpg		24
191	Được trang bị viên pin có dung lượng 3700 mAh, cho phép điện thoại Samsung này hoạt động mạnh mẽ trong thời gian dài mà không cần phải sạc lại thường xuyên. Sau lần trải nghiệm xuyên suốt không ngừng nghỉ qua nhiều tác vụ thì Z Flip5 đáp ứng được khoảng 8 tiếng 9 phút, quả là một con số ấn tượng mặc dù mức pin không quá nổi bật.	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-310823-034819.jpg	Hỗ trợ khả năng sạc 25 W	24
192	Galaxy Z Fold5, một sản phẩm đến từ gia đình Galaxy của Samsung đã chính thức ra mắt trước đó, giờ đây đã được cài đặt thêm các tính năng AI tiên tiến, mà trước đó đã từng xuất hiện trong dòng Galaxy S24 series thông qua giao diện người dùng One UI 6.1 vào cuối tháng 3 năm 2024.	https://cdn.tgdd.vn/Products/42/324028/Samsung-ho-tro-ai-1020x570.jpg	Có hỗ trợ tính năng AI	25
193	Những tính năng mới đó bao gồm: Trợ lý Note thông minh; Trợ lý chỉnh ảnh; Trợ lý chat thông minh, tự động gợi ý phản hồi và phân loại tin nhắn; Phiên dịch trực tiếp, tiện lợi cho việc giao tiếp quốc tế và Khoanh vùng tìm kiếm thông minh, cho phép người dùng dễ dàng tìm kiếm thông tin chỉ bằng vài thao tác đơn giản.			25
194	Samsung Galaxy Z Fold5 vẫn tiếp tục giữ nguyên thiết kế gập độc đáo dạng ngang của dòng Galaxy Z Fold trước đó. Với kích thước nhỏ gọn khi gập lại, điện thoại này trở nên dễ dàng mang theo và cất giữ trong túi áo hay túi xách.	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052641.jpg	Thiết kế gập mở linh hoạt	25
195	Năm nay, Samsung làm khá tốt việc tối ưu độ mỏng trên những chiếc điện thoại gập, cụ thể ở Fold5 ta có thể thấy được máy chỉ mỏng 6.1 mm và nhỏ hơn 2 mm so với Fold4. Đây quả thực là một cải tiến lớn bởi nó giúp cho máy ít bị thô hay cồng kềnh khi gập máy, việc cầm nắm sử dụng điện thoại trong lúc gập vì thế cũng trở nên dễ dàng hơn.  Tuy dáng mỏng nhưng Galaxy Z Fold5 không gặp phải vấn đề về độ bền và ổn định, nhờ vào sự tích hợp cẩn thận của bản lề cùng chất liệu chắc chắn giúp người dùng có thể tự tin và yên tâm khi sử dụng.	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052643.jpg		25
196	Ở Galaxy Z Fold5, Samsung sử dụng công nghệ bản lề Flex mới với cơ chế rãnh kép khác với những thế hệ trước đây, nó mang lại cảm giác đóng mở dễ dàng và nhẹ nhàng hơn, gập khít hơn cũng cũng như tối ưu được nếp gấp trên màn hình.	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052645.jpg		25
197	Màn hình của Samsung Galaxy Z Fold5 là một trong những yếu tố quan trọng làm nên sự thành công và đẳng cấp của chiếc điện thoại này. Với sự phát triển của công nghệ màn hình, Galaxy Z Fold5 mang đến những trải nghiệm hiển thị chất lượng đáng kinh ngạc.  Samsung Galaxy Z Fold5 sử dụng tấm nền Dynamic AMOLED 2X đa điểm với khả năng hiển thị màu sắc vô cùng sắc nét, chân thực và rực rỡ. Tấm nền này cho phép tái tạo độ phân giải cao và độ tương phản đáng kể, giúp hình ảnh, video và nội dung trên màn hình trở nên sống động và chân thực. 		Nâng cao trải nghiệm với màn hình chất lượng	25
198	Với kích thước màn hình 7.6 inch và độ phân giải QXGA+, chiếc điện thoại Samsung này cung cấp một loạt chi tiết sắc nét và rõ ràng trên màn hình lớn khi mở ra, mang đến trải nghiệm xem nội dung đắm chìm và hấp dẫn.	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052652.jpg		25
199	Samsung Galaxy Z Fold5 có tần số quét màn hình cao 120 Hz mang đến trải nghiệm mượt mà, không nhấp nháy và đáp ứng nhanh nhạy khi vuốt và chạm vào màn hình. Tần số quét cao làm cho việc chuyển đổi giữa các ứng dụng và trang web trở nên trơn tru và dễ dàng, cùng với trải nghiệm chơi game mượt mà và chân thực.	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052651.jpg		25
200	Màn hình phụ của Galaxy Z Fold5 cũng được trang bị với công nghệ Dynamic AMOLED 2X đem đến hình ảnh sắc nét và tương phản cao, giúp người dùng có trải nghiệm xem nội dung đáng kinh ngạc trên màn hình phụ này. 	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052656.jpg		25
201	Một trong những điểm nổi bật của chiếc máy này là sự tích hợp vi xử lý Snapdragon 8 Gen 2 for Galaxy giúp cho điện thoại sở hữu hiệu năng mạnh mẽ và đa nhiệm tuyệt vời. Đây là một vi xử lý di động hàng đầu của Qualcomm, được xây dựng trên tiến trình công nghệ tiên tiến và còn được tối ưu riêng cho dòng Galaxy giúp đẩy hiệu năng của máy lên mức cực hạn.		Hiệu năng bức phá mọi giới hạn	25
202	Snapdragon 8 Gen 2 for Galaxy đã tỏ ra vượt trội trong kiểm tra hiệu năng nhờ thu được điểm số ấn tượng. Cụ thể, chip đã đạt được 1986 điểm (đơn nhân) và 5161 điểm (đa nhân) trong kiểm tra Benchmark, cùng với 13538 điểm trên PCMark.	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052659.jpg		25
203	Galaxy Z Fold5 trang bị dung lượng RAM 12 GB giúp hỗ trợ tốt cho việc chạy nhiều ứng dụng cùng một lúc và làm việc đa nhiệm mượt mà. Với RAM dung lượng cao, người dùng có thể mở đồng thời nhiều tab trình duyệt, chơi game nặng và thậm chí là chỉnh sửa video mà vẫn giữ được sự ổn định, hiệu suất cao.  Ngoài 12 GB RAM mặc định ra thì Fold5 còn hỗ trợ mở rộng thêm 8 GB từ bộ nhớ trong, điều này tăng tổng số RAM có được trên máy lên 20 GB giúp cân tất mọi tác vụ đồ họa. Đây thực sự là tính năng hữu ích giúp cho các công việc chỉnh sửa video chất lượng cao trở nên mượt mà	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052710.jpg		25
204	Samsung Galaxy Z Fold5 được trang bị hệ thống camera đa dạng và mạnh mẽ. Điện thoại có tổng cộng ba camera bao gồm một camera chính 50 MP chất lượng cao, một camera siêu rộng 12 MP và một camera tele 10 MP.   Trong khi đó, mặt trước của điện thoại cũng được trang bị camera selfie 10 MP và 4 MP để bạn có thể thỏa sức chụp ảnh tự sướng và tham gia video call một cách thoải mái.	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052712.jpg	Nâng tầm chất lượng ảnh chụp	25
205	Đối với ảnh chụp trong điều kiện thiếu sáng, lúc này điện thoại vẫn có thể thu lại một cách rõ ràng và ít bị nhiễu hạt hay nhòe mờ, kể cả chụp zoom cũng ít bị bể nên nhìn tổng thể vẫn rất bắt mắt.	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052719.jpg		25
206	Galaxy Z Fold5 được trang bị viên pin có dung lượng lớn 4400 mAh. Nhờ vào pin dung lượng lớn và cấu hình tối ưu điện năng tiêu thụ tốt, Galaxy Z Fold5 có thể được sử dụng trong một khoảng thời gian dài trước khi cần sạc lại.   Cụ thể với các tác vụ chơi game giải trí, Z Fold5 mang đến cho mình thời lượng dùng lên tới 8 tiếng 49 phút liên tục mà không cần cắm sạc. Đây quả thực là kết quả ngoài mong đợi khi đây là một chiếc máy cấu hình cao và pin chưa đến 5000 mAh.	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-060923-052728.jpg	Pin lớn đáp ứng đủ cho cả ngày dài	25
207	vivo Y03 có thiết kế vuông vức, mang lại cảm giác mạnh mẽ và sang trọng từ cái nhìn đầu tiên. Dù chủ yếu được làm từ nhựa, vivo đã cẩn thận tinh chỉnh từng chi tiết để tạo nên một sản phẩm chắc chắn, không ọp ẹp.  Mặc dù không thể phủ nhận rằng vật liệu này có thể ít bền hơn so với các vật liệu khác như kim loại hay kính. Tuy nhiên, điểm mạnh của việc sử dụng nhựa làm vật liệu chính làm cho điện thoại trở nên nhẹ nhàng và dễ dàng cầm nắm hơn, giúp người dùng thoải mái sử dụng trong thời gian dài mà không gặp cảm giác mệt mỏi.	https://cdn.tgdd.vn/Products/42/322996/vivo-y03-1-1020x570.jpg	Thiết kế hiện đại, trẻ trung	26
208	Không chỉ là một thiết kế đẹp mắt, vivo Y03 còn có khả năng kháng nước và bụi theo chuẩn IP54, giúp bảo vệ điện thoại khỏi những tác động tiềm ẩn từ môi trường xung quanh. Việc này giúp cho điện thoại trở nên linh hoạt hơn trong việc sử dụng ở các điều kiện khắc nghiệt.	https://cdn.tgdd.vn/Products/42/322996/vivo-y03-2-1020x570.jpg		26
209	Màn hình IPS LCD của vivo Y03 không chỉ mang lại độ sắc nét và màu sắc trung thực, mà còn giúp tối ưu hóa góc nhìn, cho phép bạn xem nội dung từ mọi góc độ mà không gặp vấn đề về màu sắc và độ tương phản. Với độ phân giải HD+, mỗi chi tiết trên màn hình được hiển thị một cách sắc nét và rõ ràng trong tầm giá.  Điện thoại sở hữu một màn hình rộng lớn, kích thước 6.56 inch, tạo ra một không gian rộng lớn cho việc xem phim, chơi game và làm việc, mang lại trải nghiệm giải trí tuyệt vời và thoải mái.	https://cdn.tgdd.vn/Products/42/322996/vivo-y03-3-1020x570.jpg	Màn hình lớn và tần số quét 90 Hz	26
210	Với độ phân giải chính 13 MP kết hợp với ống kính phụ 0.08 MP, vivo Y03 mang lại khả năng chụp ảnh tương đối rõ nét. Tính năng xóa phông hay còn được biết đến là chế độ chụp chân dung thông qua camera phụ cho phép người dùng tạo ra những bức ảnh nghệ thuật với việc làm mờ ở phía nền, tập trung tối ưu vào đối tượng chính, tạo nên hiệu ứng thị giác đẹp mắt.  Ngoài ra, khả năng quay phim Full HD cũng là một điểm nhấn trên chiếc điện thoại vivo này. Việc quay phim với độ phân giải cao cùng khả năng xử lý hình ảnh tốt giúp người dùng ghi lại những khoảnh khắc đáng nhớ trong cuộc sống với chất lượng hình ảnh sắc nét và chân thực.	https://cdn.tgdd.vn/Products/42/322996/vivo-y03-4-1020x570.jpg	Camera đáp ứng tốt nhu cầu cơ bản	26
211	Điểm đáng chú ý khác là tính năng trôi nhanh thời gian (Time Lapse) và chụp toàn cảnh (Panorama), cho phép người dùng thể hiện sự sáng tạo và cá nhân hóa ảnh của mình một cách độc đáo. Tính năng quét tài liệu và chế độ chụp chuyên nghiệp (Pro) cung cấp nhiều tùy chọn linh hoạt cho người dùng muốn tinh chỉnh và điều chỉnh các tham số chụp ảnh để đạt được kết quả mong muốn.			26
212	Chiếc điện thoại vivo dòng Y này được trang bị hệ điều hành Android phiên bản mới nhất, Android 14, mang lại trải nghiệm người dùng mượt mà, linh hoạt và đầy tính năng. Với Android 14, người dùng có thể trải nghiệm những tính năng mới nhất từ Google và các ứng dụng hàng đầu trên thị trường.		Cấu hình ổn trong tầm giá	26
213	Sức mạnh thực sự bắt nguồn từ chip xử lý MediaTek Helio G85 8 nhân, cho phép vivo Y03 vận hành mượt mà và mạnh mẽ cho hầu hết mọi tác vụ cơ bản hằng ngày. Với tốc độ CPU được cải thiện, vivo Y03 đáp ứng nhanh chóng mọi yêu cầu của người dùng mà không gặp trở ngại.	https://cdn.tgdd.vn/Products/42/322996/vivo-y03-5-1020x570.jpg		26
214	Với pin có dung lượng 5000 mAh, vivo Y03 mang lại cho bạn sự tự tin và thoải mái khi sử dụng điện thoại suốt cả ngày mà không cần lo lắng về việc sạc pin giữa chừng. Dung lượng pin lớn này cung cấp khả năng sử dụng kéo dài, cho phép bạn thực hiện các hoạt động hằng ngày một cách thoải mái, từ lướt web, xem video đến chơi game.	https://cdn.tgdd.vn/Products/42/322996/vivo-y03-7-1020x602.jpg	Pin lớn cho phép sử dụng dài lâu	26
215	Với công suất sạc chỉ 15 W, việc sạc đầy viên pin 5000 mAh có thể coi là một điểm hạn chế đối với những ai thích sự nhanh chóng và liền mạch. Thế nhưng, đây là sản phẩm giá rẻ, không riêng gì vivo Y03 mà còn nhiều sản phẩm khác trong phân khúc cũng sẽ tương tự.			26
216	vivo Y03 có thể là một chiếc máy giá rẻ đáng quan tâm, vừa sở hữu thiết kế đẹp, cấu hình ổn cùng viên pin lớn sẽ hứa hẹn mang đến cho người dùng những trải nghiệm tuyệt vời. Máy phù hợp dành cho những bạn học sinh - sinh viên, tìm mua cho mình một sản phẩm đáp ứng tốt nhu cầu cơ bản như lướt web, nhắn tin hay trò chuyện cùng bạn bè.			26
217	vivo Y28 sở hữu diện mạo thời thượng với các đường cắt vuông vức, đi cùng thiết kế nguyên khối tạo nên sự liền mạch cho tổng thể. Độ mỏng chỉ 7.99 mm (phiên bản xanh đen) và 8.09 mm (phiên bản cam) có khối lượng chỉ 199 g mang đến cảm giác cầm nắm thoải mái cho người dùng ngay cả khi sử dụng lâu.		Thiết kế thời thượng với độ mỏng ấn tượng	27
218	Máy được trang bị khả năng mở khoá khuôn mặt và mở khoá vân tay cạnh viền giúp bạn đăng nhập vào máy một cách nhanh chóng mà không cần nhập mật khẩu, ngoài ra còn giúp tăng cường khả năng bảo mật cho các dữ liệu, thông tin cá nhân trong máy. Chuẩn kháng nước và bụi IP64 trên chiếc điện thoại Android này cũng giúp bạn an tâm sử dụng hơn khi ở ngoài trời như đi dã ngoại, ở gần môi trường bụi bặm hay gặp những cơn mưa rào bất chợt,...	https://cdn.tgdd.vn/Products/Images/42/326016/vivo-y28-bv-1.jpg		27
219	Mẫu điện thoại vivo này được trang bị màn hình IPS LCD đi cùng độ phân giải 720 x 1608 Pixels, mang lại khả năng hiển thị màu sắc chính xác, sống động với độ chi tiết tốt trong tầm giá. Kích thước màn hình 6.68 inch với notch dạng nốt ruồi giúp tối ưu không gian, cho phép bạn thoải mái tận hưởng các trải nghiệm xem phim, chơi game hay lướt web với nhiều thông tin được hiển thị hơn.  Màn hình vivo Y28 cũng được hỗ trợ tần số quét 90 Hz, mang đến hiệu ứng hình ảnh mượt mà hơn khi cuộn hoặc lướt web, đặc biệt là khi chơi game hay xem những video có tốc độ cao. Bên cạnh đó, độ sáng tối đa lên tới 1000 nits cũng giúp bạn dễ dàng xem các nội dung trên màn hình ngay cả ở những nơi có cường độ ánh sáng mạnh hay dưới nắng gắt.	https://cdn.tgdd.vn/Products/Images/42/326016/vivo-y28-bv-2.jpg	Màn hình sống động, mượt mà với tần số quét cao	27
220	Bạn cũng có thể thưởng thức âm thanh tuyệt đỉnh với công nghệ mở rộng khoang âm thanh của vivo nhờ hệ thống loa kép âm thanh nổi, kết hợp chuẩn Hi-Res Audio mang đến âm lượng lớn 300%, cung cấp hiệu ứng âm thanh chân thực và sống động trong từng bộ phim hay từng giai điệu nhạc.	https://cdn.tgdd.vn/Products/Images/42/326016/vivo-y28-bv-6.jpg		27
221	Điện thoại vivo dòng Y mang trong mình bộ vi xử lý MediaTek Helio G85 8 nhân và GPU Mali-G52, mang đến hiệu năng ổn định cho các tác vụ thông thường như lướt web, xem phim, chơi game đồ hoạ với mức cài đặt trung bình.  Máy chạy trên hệ điều hành Android 14 mượt mà, hỗ trợ tùy biến màn hình khóa đa dạng theo sở thích, chọn bảng màu sắc cho hệ thống,... cho bạn thỏa sức tạo dấu ấn cá nhân.		Hiệu năng mạnh mẽ, khả năng lưu trữ linh hoạt	27
222	vivo Y28 mang trong mình 8 GB RAM, đi cùng khả năng mở rộng thêm 8 GB mang đến hiệu năng đa nhiệm trơn tru khi người dùng sử dụng nhiều tác vụ cùng lúc.  Bộ nhớ ROM 128 GB cũng cung cấp một không gian vừa đủ cho nhu cầu lưu trữ cơ bản. Dù vậy, bạn cũng không cần quá lo về việc hết dung lượng nhờ việc máy được hỗ trợ thêm khe MicroSD lên đến 1 TB, phục vụ tối ưu hơn cho nhu cầu sử dụng của người dùng	https://cdn.tgdd.vn/Products/Images/42/326016/vivo-y28-bv-4.jpg		27
223	vivo Y28 mang đến cụm camera sau đa chức năng với camera chính 50 MP cùng camera phụ xóa phông 2 MP, được trang bị nhiều tính năng tiên tiến như chụp toàn cảnh, chế độ Pro, HDR, làm đẹp, chụp đêm, bộ lọc màu, quay chậm/tua nhanh thời gian,... giúp bạn thỏa sức sáng tạo và lưu giữ mọi khoảnh khắc.	https://cdn.tgdd.vn/Products/Images/42/326016/vivo-y28-bv-5.jpg	Camera sắc nét bắt trọn mọi khoảnh khắc	27
224	Với viên pin có dung lượng khủng lên đến 6000 mAh, bạn có thể thoải mái tận hưởng mọi trải nghiệm sử dụng như xem video, lướt web, chơi game,... mà không lo gián đoạn vì hết pin giữa chừng. Bên cạnh đó, hãng cũng đã trang bị công nghệ sạc nhanh 44 W giúp bạn nhanh chóng nạp lại đầy pin cho điện thoại mà không phải chờ đợi quá lâu.	https://cdn.tgdd.vn/Products/Images/42/326016/vivo-y28-bv-3.jpg	Tận hưởng thời lượng pin bền bỉ chưa từng có	27
225	Là sự kết hợp hoàn hảo giữa phong cách và công nghệ, vivo Y28 8GB/128GB sẽ là lựa chọn hàng đầu nếu bạn đang tìm kiếm một chiếc smartphone vừa thời thượng, vừa đáp ứng tốt các tác vụ sử dụng, giải trí hằng ngày với một mức giá hợp lý.			27
226	Một trong những điểm đáng chú ý nhất của OPPO Find N3 chính là thiết kế gập ngang. Điều này không chỉ mang lại vẻ đẹp thời thượng và sang trọng, mà còn giúp thay đổi kích thước màn hình linh hoạt. Với khả năng gập màn hình từ một thiết bị di động thành một máy tính bảng mini, OPPO Find N3 cho phép bạn tận hưởng nhiều trải nghiệm sáng tạo khác nhau.		Thiết kế với cơ chế gấp gọn	28
227	Bản lề của OPPO Find N3 đã được cải tiến đáng kể để đảm bảo độ cứng cáp tốt hơn. Không chỉ vậy, việc tối ưu hóa khe hở giữa màn hình cũng là một điểm đáng khen ngợi. Điều này đồng nghĩa rằng người dùng có thể gập và mở máy một cách mượt mà mà không gặp sự cản trở nào. Đồng thời, cảm giác khi cầm nắm và sử dụng OPPO Find N3 cũng được nâng cao.	https://cdn.tgdd.vn/Products/Images/42/302953/oppo-find-n3-221023-112758.jpg		28
228	OPPO Find N3 sẽ có hai phiên bản với chất liệu vỏ ngoài khác nhau. Phiên bản màu đen sẽ được làm bằng da sang trọng, mang đến cảm giác cao cấp và đẳng cấp. Trong khi đó, phiên bản màu vàng sẽ sử dụng kính hiện đại, tạo nên một vẻ ngoài rất ấn tượng và phù hợp với những người yêu thích sự độc đáo.			28
229	Ngoài ra, điểm đặc biệt nổi bật ở phía sau của OPPO Find N3 chính là cụm camera có kích thước lớn theo kiểu hình tròn. Cụm camera này tích hợp 3 ống kính chất lượng, kèm theo đèn LED bên ngoài giúp tạo nên thiết kế tổng thể độc đáo và thú vị. Bạn sẽ không chỉ thỏa mãn với việc chụp ảnh chất lượng mà còn khiến cho chiếc điện thoại của bạn trở nên đẹp và ấn tượng.	https://cdn.tgdd.vn/Products/Images/42/302953/oppo-find-n3-221023-112802.jpg		28
230	OPPO Find N3 đã đánh dấu một bước đột phá đầy ấn tượng trong ngành công nghệ di động với thiết kế độc đáo và một cặp màn hình vượt trội. Chiếc điện thoại này không chỉ thu hút người dùng bởi thiết kế đẹp mắt mà còn bởi màn hình nổi bật.  Thiết kế với hai màn hình trong và ngoài, OPPO Find N3 thực sự đã tạo ra một sự đột phá về trải nghiệm hình ảnh. Màn hình trong của chiếc điện thoại OPPO này có kích thước rộng lớn lên đến 7.82 inch, mang lại trải nghiệm hình ảnh không giới hạn và đã mắt hơn bao giờ hết.		Sử dụng màn hình AMOLED	28
231	Màn hình trong được trang bị công nghệ tấm nền AMOLED và còn có khả năng hiển thị hơn 1 tỷ màu. Điều này không chỉ tạo ra màu sắc sống động, mà còn cung cấp độ tương phản vượt trội, giúp mọi hình ảnh, video và nội dung đều trở nên sống động và hấp dẫn.	https://cdn.tgdd.vn/Products/Images/42/302953/oppo-find-n3-221023-112803.jpg		28
232	Độ phân giải 2K+ (2268 x 2440 Pixels) của màn hình đảm bảo mọi chi tiết được hiển thị rõ ràng, từ những chi tiết nhỏ đến văn bản, hình ảnh và video chất lượng cao. Điều này làm cho việc đọc, xem phim và chơi game trên Find N3 trở nên chân thật.  Độ sáng của màn hình lên đến 2800 nits, đảm bảo bạn có thể sử dụng điện thoại một cách thoải mái dưới ánh sáng mặt trời mạnh mẽ. Điều này giúp bạn không bao giờ phải lo lắng về việc màn hình của bạn trở nên khó đọc do chói lóa mờ mịt.			28
233	OPPO Find N3 không chỉ là một chiếc điện thoại thông minh đẹp mắt, mà còn là một công cụ mạnh mẽ để thỏa mãn đam mê nhiếp ảnh. Với bộ camera đa dạng và tiên tiến, chiếc điện thoại này sẽ đưa bạn vào một thế giới của sáng tạo hình ảnh.   Camera chính của OPPO Find N3 không chỉ đáng chú ý về độ phân giải cao lên đến 48 MP, mà còn với các thành phần quan trọng khác. Với khẩu độ rộng f/1.7 và ống kính 7P, camera chính đảm bảo rằng bạn có khả năng chụp ảnh chất lượng cao với độ tương phản và chi tiết ấn tượng. 	https://cdn.tgdd.vn/Products/Images/42/302953/oppo-find-n3-221023-112800.jpg	Camera nâng cấp mạnh cùng nhiều công nghệ mới	28
234	OPPO Find N3 là một trong số ít điện thoại trên thị trường trang bị camera tele với độ phân giải lên đến 64 MP giúp cho ra chất lượng ảnh zoom cực kỳ sắc nét. Ống kính 4P cùng khẩu độ f/2.6 giúp bạn chụp ảnh từ xa một cách chi tiết và sắc nét, từ cảnh thiên nhiên tới chân dung. 	https://cdn.tgdd.vn/Products/Images/42/302953/oppo-find-n3-221023-112810.jpg		28
235	OPPO Find N3 trang bị một trong những chip mạnh mẽ nhất trong phân khúc điện thoại Android - Snapdragon 8 Gen 2. Với 8 nhân xử lý, chip này mang lại hiệu suất đỉnh cao, cho phép bạn xử lý mọi tác vụ một cách mượt mà và nhanh chóng. Khả năng đa nhiệm, chơi game, và sử dụng ứng dụng đòi hỏi nhiều tài nguyên trở nên trơn tru và ấn tượng hơn bao giờ hết.		Hiệu năng đứng đầu phân khúc	28
236	Để đảm bảo khả năng đa nhiệm tối ưu và xử lý ứng dụng đồ họa cao, OPPO Find N3 hỗ trợ RAM lên đến 16 GB - một con số ấn tượng trong thế giới smartphone. Với lượng RAM này, bạn có thể mở đồng thời nhiều ứng dụng, xử lý hình ảnh, video và dữ liệu lớn một cách dễ dàng. Chơi game, chỉnh sửa ảnh và duyệt web không bao giờ trở nên chậm chạp hay giật lag. OPPO Find N3 giúp bạn trải nghiệm điện thoại Android với khả năng đa nhiệm đỉnh cao.	https://cdn.tgdd.vn/Products/Images/42/302953/oppo-find-n3-221023-112811.jpg		28
237	OPPO Find N3 được trang bị viên pin khá lớn với dung lượng lên đến 4805 mAh. Điều này đảm bảo rằng bạn có thể sử dụng điện thoại một cách thoải mái suốt cả ngày mà không cần lo lắng về việc hết pin. Viên pin này giúp bạn duyệt web, trò chuyện, xem video và sử dụng ứng dụng suốt một thời gian dài trước khi cần sạc lại.	https://cdn.tgdd.vn/Products/Images/42/302953/oppo-find-n3-221023-112805.jpg	Sử dụng pin lớn cùng công suất sạc 67 W	28
238	OPPO Find N3 còn có tính năng hỗ trợ sạc ngược không dây, cho phép bạn sạc các thiết bị khác trực tiếp từ điện thoại của mình. Điều này đặc biệt hữu ích khi bạn cần nạp lại pin cho tai nghe không dây, smartwatch hoặc thiết bị khác mà bạn đang sử dụng.			28
239	Chắc chắn bạn sẽ thấy Reno11 5G ấn tượng ngay từ cái nhìn đầu tiên. Phiên bản này có hai màu sắc độc đáo: xanh lá nhạt và xám. Mặt lưng xanh lá nhạt được phủ lớp vân sáng, lấy cảm hứng từ biển xanh, tạo nên hiệu ứng chuyển sắc lấp lánh giống như sóng biển, làm cho chiếc điện thoại luôn nổi bật và thu hút. Trong khi đó, màu xám mang lại vẻ đẹp tinh tế và tối giản, phản ánh một phong cách sang trọng và lịch lãm.	https://cdn.tgdd.vn/Products/42/314209/oppo-reno11-1-1020x570-1.jpg	Nổi bật nhờ thiết kế lấy cảm hứng từ thiên nhiên	29
240	Một đặc điểm nổi bật khác của chiếc điện thoại OPPO này là cụm camera được thiết kế theo hình dáng bầu dục độc đáo, tạo điểm nhấn đặc biệt cho tổng thể thiết kế. Viền xung quanh camera được chế tác một cách tinh tế, tạo nên sự hài hòa và sang trọng, làm tăng thêm vẻ đẹp thẩm mỹ của chiếc điện thoại và khiến nó trở nên thú vị và cuốn hút hơn.	https://cdn.tgdd.vn/Products/42/314209/oppo-reno11-2-1020x570-1.jpg		29
241	Mình đánh giá cao chất liệu khung nhựa bóng và mặt lưng thủy tinh hữu cơ, vừa đẹp vừa đáng tin cậy. Kích thước và khối lượng của Reno11 5G cũng rất hợp lý, vừa vặn hoàn hảo, mang lại cảm giác thoải mái và chắc chắn khi sử dụng.	https://cdn.tgdd.vn/Products/42/314209/oppo-reno11-3-1020x570-1.jpg		29
242	Loa kép với công nghệ âm thanh tiên tiến cũng là một điểm mạnh của Reno11 5G. Âm thanh sống động, rõ ràng và mạnh mẽ mang lại trải nghiệm giải trí tuyệt vời. Mình thực sự thích chất âm mà máy mang lại, mọi thứ được tái hiện lại to rõ và trong trẻo, kể cả khi nghe ở mức âm lượng lớn cũng không có hiện tượng bị rè.	https://cdn.tgdd.vn/Products/42/314209/oppo-reno11-4-1020x570-1.jpg		29
243	Trang bị tấm nền AMOLED, chiếc điện thoại mang đến trải nghiệm màu sắc sắc nét và độ tương phản cao, đồng thời giảm tiêu thụ năng lượng. Mỗi pixel trên màn hình có khả năng tự điều chỉnh độ sáng, giúp hiển thị màu đen thực sự mà không làm tăng mức tiêu thụ pin. Điều này thực sự hữu ích khi sử dụng liên tục trong thời gian dài và giúp giảm mệt mỏi cho đôi mắt.	https://cdn.tgdd.vn/Products/42/314209/oppo-reno11-6-1020x570-1.jpg	Sử dụng tấm nền AMOLED cùng tần số quét 120 Hz	29
244	Kích thước lớn lên đến 6.7 inch mở ra một không gian rộng lớn, mang lại trải nghiệm tuyệt vời khi duyệt web, xem video hoặc thậm chí là chơi game. Hơn hết, màn hình lớn còn tạo sự thoải mái khi mình xem nội dung hoặc thao tác với các ứng dụng như chỉnh sửa ảnh, video hay làm việc trên trang tính Google Sheet.	https://cdn.tgdd.vn/Products/42/314209/oppo-reno11-8-1020x570-1.jpg		29
245	Điểm đặc biệt và độc đáo nhất ở Reno11 5G theo mình nghĩ có thể là camera chính 50 MP, sử dụng cảm biến LYT600 mới từ Sony. Với khẩu độ f/1.8 và tính năng chống rung quang học OIS, mỗi bức ảnh mình chụp đều đạt được độ nét và sắc nét tối đa, ngay cả trong điều kiện ánh sáng yếu.	https://cdn.tgdd.vn/Products/42/314209/oppo-reno11-10-1020x570.jpg	Thỏa sức nhiếp ảnh với camera 50 MP đến từ Sony	29
246	Ở trong môi trường có đủ ánh sáng, điện thoại mang đến cho mình những bức ảnh chụp đẹp mắt với màu sắc trong trẻo và độ chi tiết cao. Đặc biệt, ảnh không bị các hiện tượng như bệt màu hay nhiễu hạt nên nhìn chung cũng khá ổn, tạo điều kiện thuận lợi để hậu kỳ sau này được dễ dàng.	https://cdn.tgdd.vn/Products/42/314209/oppo-reno11-11-1020x659.jpg		29
247	Về cấu hình, điện thoại được trang bị con chip mới MediaTek Dimensity 7050 với hiệu suất vượt trội và khả năng cân bằng năng lượng hiệu quả. Nhờ vào sức mạnh xử lý nhanh chóng này, Reno11 5G đã đáp ứng mọi thách thức, từ việc chơi game đồ hoạ cao đến sử dụng các ứng dụng đồ họa phức tạp.	https://cdn.tgdd.vn/Products/42/314209/oppo-reno11-15-1020x577.jpg	Hiệu năng mạnh mẽ nhờ tích hợp chipset mới	29
248	Đúng là viên pin lớn 5000 mAh đã giúp mình thoải mái hơn trong việc sử dụng điện thoại suốt cả ngày. Mình thường xuyên sử dụng điện thoại cho công việc, giải trí và việc không phải lo lắng về sạc thường xuyên trong ngày thật sự là một ưu điểm lớn.		Pin trâu dùng lâu cùng sạc nhanh 67 W	29
249	Nhờ vào viên pin lớn, mình có thể thoải mái sử dụng chiếc điện thoại dòng Reno này cho các tác vụ như cuộc gọi quan trọng, thư giãn với trò chơi yêu thích hay thậm chí là quay video mà không cần lo lắng về việc pin sẽ tụt quá nhanh. Thực tế, máy đáp ứng cho mình đâu đó khoảng 7 - 8 tiếng sử dụng liên tục mà không cần cắm sạc.	https://cdn.tgdd.vn/Products/42/314209/oppo-reno11-19-1020x577.jpg		29
250	OPPO Reno11 5G không chỉ là một chiếc điện thoại di động cao cấp, mà còn được coi là biểu tượng của sự tinh tế và đẳng cấp. Với thiết kế sang trọng, màn hình xuất sắc, khả năng chụp ảnh độc đáo và hiệu suất vượt trội, chiếc điện thoại này thật sự là một sự lựa chọn không thể bỏ qua.			29
251		https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/macbook-air-m1-7.jpg		30
252	Lần đầu tiên Apple sử dụng con chip do chính hãng này sản xuất cho dòng máy Macbook. Bộ vi xử lý Apple M1 với 16 tỉ bóng bán dẫn, bao gồm 8 nhân cực mạnh, trong đó có 4 nhân hiệu năng cao và 4 nhân tiết kiệm điện, mang đến cho MacBook Air tốc độ xử lý tuyệt vời, đồng thời kéo dài thời lượng pin. Nhờ vậy MacBook Air 13 2020 M1 có hiệu suất nhanh gấp 3,5 lần thế hệ cũ, cho bạn làm việc với cả những công việc chuyên nghiệp, những tác vụ nặng mà không thể chạy được trên MacBook Air trước đây.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/macbook-air-m1-8.jpg	Lợi thế vượt trội từ bộ vi xử lý Apple M1	30
253	MacBook Air 13 M1 có khả năng đồ họa khó tin trên một chiếc laptop siêu nhỏ gọn. GPU tích hợp trên Apple M1 có tới 8 nhân và là GPU tích hợp mạnh nhất thế giới laptop hiện nay. So với thế hệ trước, MacBook Air 13 2020 M1 có khả năng xử lý đồ họa mạnh gấp 5 lần. Giờ đây ngay trên chiếc MacBook Air cực kỳ di động, bạn đã có thể xem và chỉnh sửa video 4K mượt mà, thậm chí là chơi game cũng như chạy các tác vụ đồ họa chuyên sâu.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/macbook-air-m1-10.jpg	Đồ họa chuyên nghiệp ngay trên chiếc MacBook Air	30
254	Phiên bản MacBook Air 13 M1 trong bài đã được nâng cấp lên dung lượng RAM gấp đôi, lên tới 16GB RAM LPDDR4. Với dung lượng RAM cực lớn, bạn có thể chạy đa nhiệm mượt mà hơn, thoải mái sử dụng, thao tác với cùng lúc nhiều phần mềm, kể cả những ứng dụng hay tệp tin nặng. Công việc sẽ trở nên trơn tru hơn khi bạn có thể làm nhiều việc cùng lúc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/macbook-air-m1-17.jpg	Nâng cao hiệu suất làm việc với 16GB RAM	30
255	MacBook Air trước đây đã được đánh giá cao về thời lượng pin, nhưng với MacBook Air 13 2020 M1, bạn còn làm được nhiều điều hơn thế. Chiếc MacBook Air mới nhất có thể lướt web liên tục trong 15 tiếng và xem video liên tục trong 18 tiếng. Sẽ thật dễ dàng để bạn làm việc hay giải trí cả ngày mà không cần quan tâm đến nguồn điện với MacBook Air M1.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/macbook-air-m1-1.jpg	Thời lượng pin tốt nhất từ trước đến nay	30
256	Đúng như tên gọi, bàn phím Magic Keyboard của MacBook Air 13 2020 M1 quả là mang đến những điều kỳ diệu. Cơ chế bàn phím cắt kéo, các phím tắt hữu ích, biểu tượng cảm xúc tiện lợi và đèn nền có cảm biến ánh sáng, tất cả kết hợp lại tạo nên bàn phím laptop hoàn hảo bậc nhất hiện nay.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/macbook-air-m1-14.jpg	Trải nghiệm khác biệt trên bàn phím Magic Keyboard thế hệ mới	30
257	Không cần phải mất thời gian nhập mật khẩu, trên MacBook Air 13 2020 M1, cảm biến vân tay Touch ID sẽ đăng nhập mọi thứ chỉ với một cú chạm. Mở khóa máy tính hay mở khóa tài liệu bảo mật, truy cập cài đặt hệ thống, bạn đều có thể sử dụng vân tay một cách nhanh chóng và an toàn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/macbook-air-m1-5.jpg	Touch ID an toàn và tiện lợi	30
258	Dù là kết nối không dây hay có dây, MacBook Air 13 2020 M1 cũng đều sở hữu những công nghệ hàng đầu hiện nay. Thế hệ Wi-Fi 6 cho tốc độ nhanh, chất lượng kết nối ổn định, phạm vi phủ sóng rộng để bạn vẫn có Wi-Fi ổn định ở những nơi công cộng. Trong khi đó cổng Thunderbolt 4 là cổng kết nối đa năng và mạnh mẽ nhất, khi có thể truyền dữ liệu, sạc hay xuất hình để sử dụng nhiều màn hình cùng lúc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/macbook-air-m1-11.jpg	Tập hợp hệ thống kết nối tiên tiến	30
259		https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-d.jpg		31
260	Phát huy truyền thống mỏng nhẹ vốn có của dòng MacBook Air, phiên bản MacBook Air M2 2023 dù mở rộng màn hình lên mức 15 inch nhưng vẫn đảm bảo độ tinh xảo và cao cấp. Từng chi tiết, từng góc cạnh trên thiết bị đều được trau chuốt tỉ mỉ và chế tác từ chất liệu nhôm tái chế bền bỉ mà thân thiện với môi trường. Đặc biệt, sản phẩm có cấu trúc hoạt động không quạt gió, duy trì độ êm ái khi vận hành ngay cả khi chạy tác vụ nặng với khối lượng lớn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-c.jpg	Bền bỉ, tinh xảo với độ hoàn thiện ấn tượng	31
261	MacBook Air 2023 M2 15 inch đem đến cho bạn bốn lựa chọn về màu sắc sang trọng, bao gồm: Đen, Vàng, Xám và Bạc. Tất cả các tùy chọn này đều được tinh chỉnh nhằm phát huy tối đa vẻ cao cấp và lịch thiệp mà sản phẩm hướng tới, cực kỳ phù hợp với giới văn phòng, doanh nhân. Với mỗi màu sắc, Apple lại trang bị sẵn một bộ cáp sạc MagSafe cùng tone màu trong hộp đựng sản phẩm.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-i.jpg	Bốn lựa chọn màu sắc cao cấp và sang trọng	31
262	Bên trong thân máy, MacBook Air M2 2023 15 inch được trang bị chip M2 - bộ vi xử lý sản xuất trên tiến trình 5nm và quy tụ hơn 20 tỷ bóng bán dẫn. Với 8 nhân CPU, 10 nhân GPU, 16 nhân Neural Engine và bộ mã hóa video ProRes chuyên dụng, Apple M2 giúp MacBook Air 2023 15 inch đạt tốc độ xử lý nhanh gấp 1,4 lần so với phiên bản M1. Con số này thậm chí còn lên đến 12 lần nếu đặt cạnh với các dòng MacBook Air chạy chip Intel trước kia. Bạn sẽ hài lòng với thời lượng pin 18 tiếng xem video liên tục mà chip M2 đem lại.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-h.jpg	Tốc độ và thời lượng pin khiến bạn kinh ngạc	31
263	MacBook Air 2023 15 inch sử dụng camera FaceTime HD 1080p, kết hợp cùng bộ ba micro với thuật toán tạo chùm tia mở rộng vùng thu giọng nói. Nhờ đó, sản phẩm dễ dàng truyền đạt rõ nét hình ảnh và âm thanh của bạn tới người đối thoại trong mọi trải nghiệm giao tiếp, từ họp hành online, học tập từ xa cho đến việc trò chuyện với bạn bè qua các công cụ video call phổ biến.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-e.jpg	Tối ưu trải nghiệm họp hành và học tập online	31
264	Bổ sung thêm hai loa bass vào hệ thống âm thanh, MacBook Air M2 2023 15 inch sẽ đưa bạn vào không gian giải trí đa chiều và sống động nhờ sự hỗ trợ của công nghệ Dolby Atmos. Việc xem phim, nghe nhạc và trải nghiệm những nội dung đa phương tiện trở nên sống động hơn bao giờ hết, như đưa bạn vào rạp chiếu phim hoặc phòng thu chuyên nghiệp.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-f.jpg	Âm thanh Dolby Atmos sống động từng tiết tấu	31
265	Trải nghiệm soạn thảo văn bản trên MacBook Air 2023 M2 15 inch cực kỳ nhẹ nhàng, mượt mà và êm tay với sự hỗ trợ của bàn phím Magic Keyboard gắn liền với tên tuổi Apple. Cảm biến vân tay Touch ID hiện diện ở góc phải bàn phím sẽ tối giản hóa thao tác mở khóa màn hình, giúp bạn đăng nhập tài khoản trên các website và xác thực thanh toán Apple Pay chỉ với một cú chạm nhẹ.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-8.jpg	Bàn phím Magic Keyboard tích hợp Touch ID	31
266	Bộ cáp sạc MagSafe của MacBook Air M2 15 inch được thiết kế để dễ dàng tháo lắp bằng cơ chế nam châm, tự động hút và cố định vị trí khi bạn đặt lại gần. Ngoài ra, bộ đôi cổng Thunderbolt ở cạnh bên sẽ hỗ trợ người dùng kết nối thiết bị với hệ thống phụ kiện ngoại vi linh hoạt, cho phép xuất hình ảnh độ phân giải lên tới 6K. Jack âm thanh 3.5 mm hỗ trợ các loại headphone có độ trở kháng cao, để bạn thưởng thức nội dung giải trí theo cách đã tai nhất.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/Dung/0118/macbook-air-m2-2023-15-inch-9.jpg	Cáp sạc MagSafe, cổng tương tác Thunderbolt đa năng	31
267	Với diện mạo tinh xảo và thiết kế đầy tính thẩm mỹ, MacBook Air M3 13 inch 2024 dễ dàng chinh phục bất cứ ai ngay từ cái nhìn đầu tiên. Bộ khung vỏ được chế tác tỉ mỉ từ kim loại của sản phẩm được hoàn thiện kỹ lưỡng đến từng đường nét. Kích cỡ siêu mỏng 1.13 cm và trọng lượng chỉ xấp xỉ 1,24 kg cho phép người dùng dễ dàng di chuyển thiết bị, xếp gọn gàng vào balo, hành lý trong những chuyến công tác xa nhà.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/22/macbook-air-m3-15-2024-8cpu-10gpu-8gb-256gb-2.jpg	Tối giản, mỏng nhẹ, dễ dàng mang theo	32
268	Sở hữu chip Apple M3, MacBook Air M3 2024 có được nguồn sức mạnh đáng nể, sẵn sàng hỗ trợ bạn xử lý những công việc và tác vụ nặng, đồng thời đảm bảo vận hành yên tĩnh nhờ không sử dụng quạt tản nhiệt. Bạn sẽ thoải mái render video, chỉnh sửa ảnh chuyên nghiệp và chơi game tốc độ cao trên thiết bị này.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/22/macbook-air-m3-15-2024-8cpu-10gpu-8gb-256gb-3.jpg	Chip M3 – cuộc bứt phá mạnh mẽ về hiệu năng	32
269	Về trải nghiệm hình ảnh, phiên bản bạn đang theo dõi sở hữu màn hình Liquid Retina 13 inch với khả năng tái hiện tới 1 tỷ gam màu sống động, diễn đạt chi tiết mọi hình ảnh và thước phim trên không gian hiển thị chuyên nghiệp, đáp ứng được nhu cầu cao của giới thiết kế đồ họa.  So với các dòng máy tính xách tay tương đương, màn hình MacBook Air M3 2024 đạt độ phân giải cao gấp hai lần, thể hiện độ tương phản phong phú và diễn đạt mọi hình ảnh, biểu đồ, thông số theo cách chi tiết nhất, dễ đọc nhất.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/22/macbook-air-m3-15-2024-8cpu-10gpu-8gb-256gb-5.jpg	Màn hình đỉnh cao với 1 tỷ gam màu ấn tượng	32
270	Đặt trải nghiệm liên lạc của người dùng lên hàng đầu, Apple mang tới cho thế hệ MacBook Air M3 2024 camera FaceTime HD 1080p với khả năng ghi hình cực kỳ sắc nét, đảm bảo truyền tải rõ ràng hình ảnh của bạn tới đối tượng đàm thoại, từ đó hỗ trợ cực tốt trong tiến trình video call để họp hành, liên lạc, chơi game và học tập online.  Hệ thống âm thanh chất lượng cao với sự hỗ trợ của công nghệ Dolby Atmos mang tới hiệu ứng thanh âm đa chiều, mang lại trải nghiệm như đang ngồi trong một studio đích thực. Lợi thế này không chỉ giúp MacBook Air M3 2024 có được trải nghiệm liên lạc tốt mà còn giúp người dùng dễ dàng đắm chìm vào các nội dung mỗi khi nghe nhạc và xem phim.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/22/macbook-air-m3-15-2024-8cpu-10gpu-8gb-256gb-7.jpg	Camera độ nét cao, hệ thống âm thanh sống động	32
271	MacBook Air M3 13 inch 2024 sử dụng cơ chế sạc từ tính MagSafe độc quyền do Apple phát triển, đảm bảo tính tiện dụng trong mỗi lần nạp năng lượng. Sản phẩm được trang bị cáp sạc cùng màu với máy, tạo sự đồng nhất trong trải nghiệm thẩm mỹ.  Ngoài ra, MacBook Air M3 13 2024 còn cung cấp trải nghiệm kết nối và tương tác đa năng qua hai cổng Thunderbolt chuyên nghiệp cùng jack âm thanh 3.5 quen thuộc. Sản phẩm sử dụng công nghệ Wi-Fi 6E với tốc độ nhanh gấp 2 lần so với Wi-Fi 6 phổ biến hiện hành, đảm bảo tính ổn định khi bạn làm việc, họp hành, học tập và chơi game, xem phim.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/22/macbook-air-m3-15-2024-8cpu-10gpu-8gb-256gb-8.jpg	Kết nối đa năng, cổng tương tác đa dạng	32
272	Lướt ngón tay trên bàn phím Magic Keyboard của MacBook Air M3 13 2024, bạn sẽ có được trải nghiệm soạn thảo văn bản tốc độ cao cực kỳ thoải mái, êm ái và giữ yên tĩnh cho môi trường làm việc chuyên nghiệp xung quanh. Hệ thống đèn nền bên dưới bàn phím cho phép người dùng làm việc dễ dàng trong bóng tối, đồng thời tạo nét nhấn nhá về thẩm mỹ cho thiết bị.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/22/macbook-air-m3-15-2024-8cpu-10gpu-8gb-256gb-6.jpg	Bàn phím chuyên dụng, mở khóa vân tay	32
273		https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/24/Macbook-pro-14-2023-m3-8cpu-10pu-1.jpg		33
274	Phiên bản MacBook Pro M3 bạn đang theo dõi được trang bị bộ vi xử lý Apple M3 với 8CPU và 10GPU. Đây là con chip thế hệ mới, chế tác trên tiến trình 3nm hàng đầu thế giới hiện tại, mang lại tốc độ xử lý vượt trội cũng như hiệu suất đồ họa tuyệt vời.  So với chip M1 trước kia, chip Apple M3 đạt tốc độ nhanh hơn tơi 5.1 lần, đảm bảo bạn không phải thất vọng khi thực hiện mọi tác vụ, từ kết xuất đồ họa cho đến chơi game. Công nghệ dò tia tốc độ cao bằng phần cứng giúp gia tăng hiệu năng tới 2.5 lần, từ đó hiển thị vùng tối và các hình ảnh phản chiếu theo cách trung thực hơn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/24/Macbook-pro-14-2023-m3-8cpu-10pu-6.jpg	Bước nhảy về hiệu năng với chip M3 ưu việt	33
275	Ngoài việc thúc đẩy hiệu năng mạnh mẽ, chip Apple M3 còn giúp MacBook Pro M3 14 2023 tối ưu thời lượng pin giữa mỗi lần sạc. Sự kết hợp nhịp nhàng giữa chip xử lý thế hệ mới và hệ điều hành do chính Apple phát triển khiến thiết bị vận hành ổn định dù bạn có đang kết nối máy với nguồn điện hay không.  Ước tính, MacBook Pro M3 2023 có thể phát video liên tục suốt 22 giờ và duyệt web không ngừng nghỉ trong 15 tiếng. Bạn sẽ hoàn toàn an tâm khi sử dụng thiết bị trong những chuyến công tác xa hoặc liên tục di chuyển để phục vụ công việc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/24/Macbook-pro-14-2023-m3-8cpu-10pu-2.jpg	Tận hưởng trải nghiệm pin ấn tượng vượt trội	33
276	Apple đã làm việc với các đối tác phần mềm nhằm tối ưu lại hàng ngàn ứng dụng chuyên nghiệp sao cho tương thích tốt nhất với nền tảng macOS cũng như chip xử lý M3. Từ đó, MacBook Pro M3 2023 có thể phát huy được sức mạnh tối đa.  Từ Xcode, Unity Editor, Create ML dành cho giới lập trình viên; Adobe Photoshop, Affinity Photo 2, Adobe Photoshop Lightroom dành cho tác vụ chỉnh sửa ảnh; Adobe InDesign, Adobe Illustrator, Figma dành cho dân thiết kế; Microsoft 365, Slack, Zoom của giới văn phòng... Tất cả đều tương thích tuyệt đối và vận hành hoàn hảo trên MacBook Pro M3.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/24/Macbook-pro-14-2023-m3-8cpu-10pu-3.jpg	Tối ưu hiệu năng của các ứng dụng	33
277	Sử dụng MacBook Pro M3 2023, bạn sẽ có được trải nghiệm hình ảnh chuyên nghiệp và mãn nhãn với màn hình Liquid Retina XDR rộng 14 inch. Công nghệ mini LED với sự tập hợp của 10.000 bóng đèn siêu nhỏ cung cấp độ sáng rất cao và diễn đạt độ tương phản chính xác trong mọi khuôn hình.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/24/Macbook-pro-14-2023-m3-8cpu-10pu-8.jpg	Trải nghiệm màn hình đặc biệt xuất sắc	33
278	MacBook Pro M3 2023 là cung cấp hệ thống camera, micro và loa ngoài đặc biệt chất lượng. Trong đó, camera 1080p giúp truyền tải hình ảnh sắc nét hình ảnh của bạn khi thực hiện các tác vụ video call, ngay cả khi nơi bạn ngồi có bối cảnh ánh sáng phức tạp.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/24/Macbook-pro-14-2023-m3-8cpu-10pu-9.jpg	Âm thanh cao cấp, video call hoàn hảo	33
279	Ở hai cạnh bên thân máy, MacBook Pro M3 14 inch 2023 cũng được tích hợp đầy đủ các cổng tương tác gồm HDMI, Thunderbolt 4, khe đọc thẻ SDXC, jack âm thanh để kết nối với loa ngoài và tai nghe. Sản phẩm sử dụng cơ chế sạc từ tính MagSafe tiện lợi, độc quyền do Apple phát triển.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/24/Macbook-pro-14-2023-m3-8cpu-10pu-a.jpg	Quy tụ các phương thức kết nối đa năng	33
280	Sử dụng bàn phím Magic Keyboard với hàng phím tiêu chuẩn, MacBook Pro M3 đem lại trải nghiệm soạn thảo văn bản nhanh chóng, mượt mà, thể hiện tốc độ phản hồi nhanh chóng và hỗ trợ đặc biệt hiệu quả cho quá trình làm việc của bạn.  Đặc biệt, Apple còn tích hợp cả cảm biến Touch ID ở góc bàn phím để rút gọn quá trình đăng nhập và xác thực danh tính khi chúng ta thanh toán trên các nền tảng online. Bạn sẽ không cần phải ghi nhớ mật khẩu và thực hiện thao tác gõ rườm rà mỗi khi mở máy nữa.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/24/Macbook-pro-14-2023-m3-8cpu-10pu-b.jpg	Magic Keyboard kết hợp cùng Touch ID	33
281	Là phiên bản cải tiến từ bộ vi xử lý M3, chip M3 Pro mang lại cho MacBook Pro 16 2023 nguồn hiệu năng đặc biệt ấn tượng với sự thăng tiến mạnh mẽ ở CPU cùng GPU. Sản phẩm thể hiện hiệu suất xử lý cao cấp ở những tác vụ đặc thù như làm đồ họa, lập trình hoặc kết xuất video.  Phiên bản MacBook Pro 16 2023 mà bạn theo dõi sử dụng chip xử lý M3 Pro với 12 nhân CPU, 18 nhân GPU cùng 18GB bộ nhớ thống nhất. Bạn có thể dễ dàng kết nối máy tính với cùng lúc hai màn hình ngoài đạt độ phân giải lên tới 6K. Từ đó, việc xây dựng không gian làm việc chuyên nghiệp mà vẫn gọn gàng sẽ trở nên đơn giản hơn bao giờ hết.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/11/Macbook-pro-14-2023-m3-8cpu-10pu-1.jpg	Mở ra nguồn sức mạnh mới với chip M3 Pro	34
282	Loạt nâng cấp về kiến trúc GPU khiến chip M3 Pro đạt được bước thăng tiến về năng lực xử lý đồ họa. Đây là chìa khóa giúp MacBook Pro 16 2023 có thể đáp ứng tốt hơn nhu cầu đặc thù của những người làm truyền thông đa phương tiện hoặc những ai đam mê game. Nhờ ưu thế mà chip xử lý đem lại, sản phẩm có thể diễn đạt hiệu ứng đổ bóng cực kỳ trung thực.  Không chỉ vậy, công nghệ dò tia phần cứng tốc độ cao cũng giúp MacBook Pro 16 2023 đạt tốc độ nhanh hơn 2.5 lần khi thực hiện các tác vụ về đồ họa. Bạn sẽ thực sự ấn tượng trước trải nghiệm đồ họa mà MacBook Pro 16 2023 mang tới	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/11/Macbook-pro-14-2023-m3-8cpu-10pu-5.jpg	Chuyên nghiệp hơn ở năng lực đồ họa	34
283	Nhờ năng lực vận hành mạnh mẽ mà không tiêu tốn nhiều điện năng, bộ vi xử lý M3 Pro sẽ kết hợp cùng macOS Sonoma để biến MacBook Pro 16 2023 thành phiên bản MacBook Pro có thời lượng pin ấn tượng nhất lịch sử.  Đạt thời lượng lên tới 18 tiếng xem phim qua Apple TV và 12 tiếng duyệt web bằng Wi-Fi, MacBook Pro 16 2023 M3 Pro giúp chúng ta hoàn toàn an tâm về trải nghiệm pin bền bỉ trong những chuyến hành trình. Ngoài ra, Apple đảm bảo hiệu năng của MacBook Pro luôn được duy trì ổn định dù bạn có đang kết nối thiết bị với nguồn điện không.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/11/Macbook-pro-14-2023-m3-8cpu-10pu-2.jpg	Mẫu MacBook Pro có thời lượng pin ấn tượng nhất	34
284	Apple đã cộng tác với các đơn vị phát triển phần mềm danh tiếng để tối ưu lại hệ điều hành macOS Sonoma nhằm đạt độ tương thích tốt nhất với những ứng dụng/phần mềm nổi tiếng dành cho công việc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/11/Macbook-pro-14-2023-m3-8cpu-10pu-6.jpg	Trải nghiệm macOS Sonoma chuyên nghiệp	34
285	MacBook Pro 16 2023 M3 Pro tập trung vào việc đem lại chất lượng video call tốt nhất từ hình ảnh tới âm thanh. Sản phẩm được trang bị camera 1.080p kết hợp cùng bộ 3 micro đạt chuẩn phòng thu và 4 loa trầm khử lực cao cấp + 2 loa tần suất cao.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/11/Macbook-pro-14-2023-m3-8cpu-10pu-9.jpg	Video call chất lượng từ hình ảnh đến âm thanh	34
286	Phiên bản MacBook Pro 16 2023 M3 Pro cung cấp cho bạn những lựa chọn về kết nối không dây đạt chất lượng hàng đầu thế giới, bao gồm Bluetooth 5.3 và Wi-Fi 6E. Sản phẩm thể hiện tốc độ truyền tải dữ liệu không dây hết sức nhanh chóng.  Thêm vào đó, MacBook Pro 16 2023 M3 Pro cũng sở hữu đầy đủ các cổng tương tác vật lý như Thunderbolt, HDMI, SDXC, jack âm thanh, cổng sạc MagSafe... Hãy thỏa sức kết nối MacBook Pro 16 2023 với những phụ kiện và màn hình ngoài của bạn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/11/Macbook-pro-14-2023-m3-pro-11-cpu-14gpu-b.jpg	Đa dạng sự lựa chọn về phương thức kết nối	34
287	Có phải bạn muốn những tựa game mình chơi luôn được thể hiện mượt mà ở chế độ thiết lập cấu hình cao? Asus TUF Gaming FX507ZC4-HN095W sẽ không làm bạn thất vọng vì cấu hình của máy gồm có những phần cứng hàng đầu như CPU Intel Core i5-12500H - 16GB RAM - SSD 512GB.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/Asus%20TUF%20Gaming%20FX507ZC4-HN095W%202.png	Sẵn sàng làm chủ đấu trường ảo	35
352	Không chỉ bo công ở mặt trước, mặt lưng cũng đã được hãng bo cong sang hai bên đem lại một vẻ ngoài sang trọng và khả năng cầm nắm tối ưu hơn. Điều này giúp cho tổng thể máy có sự hài hòa và liền mạch về mặt thiết kế, khả năng cầm nắm vuốt chạm diễn ra tốt hơn.			44
288	Một yếu tố không thể thiếu trên chiếc laptop Asus TUF Gaming FX507ZC4-HN095W này chính là card đồ họa rời NVIDIA GeForce RTX 3050 4GB GDDR6. Phần cứng đỉnh cao này sẽ mang đến những khung hình ổn định nhất cho bạn trong quá trình chơi. Đồng thời, công nghệ DLSS 3.0 có được sự hỗ trợ từ AI sẽ tự động điều chỉnh độ phân giải hình ảnh theo ý bạn với chất lượng cực kì xuất sắc. Song hành cùng DLSS 3.0 là Real-time Ray Tracing, công nghệ dò tia sáng theo thời gian thực có khả năng mô phỏng chính xác ánh sáng trong game hệt như ngoài đời để bạn càng thêm đắm chìm vào môi trường ảo ngay trước mắt. Để tối ưu hiệu năng hoạt động cao nhất trong một thiết kế gọn gàng nhất, công nghệ NVIDIA Max-Q sẽ là thứ mà bạn cần trên chiếc card đồ họa rời RTX 3050 này.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/Asus%20TUF%20Gaming%20FX507ZC4-HN095W%201.png	Đồ họa sống động, chân thực đến từng chi tiết	35
289	Laptop Asus TUF Gaming FX507ZC4-HN095W được trang bị 2 quạt Arc Flow có thiết kế 84 cánh ở phần đáy bên dưới và 84 cánh này có độ mỏng không giống nhau nên sẽ tăng hiệu suất hoạt động lên gấp đôi, cải thiện hiệu quả khả năng tản nhiệt tổng thể trong khi không gây ra tiếng ồn lớn. Kết hợp với 4 khe thoát nhiệt cùng 5 ống tản nhiệt bằng đồng, luồng khí nóng tỏa ra khi bạn chơi các tựa game AAA với thiết lập đồ họa cao sẽ nhanh chóng di chuyển ra ngoài để bên trong máy duy trì được nhiệt độ mát mẻ nhất.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/Asus%20TUF%20Gaming%20FX507ZC4-HN095W%204.png	Tản nhiệt hiệu quả, yên tĩnh	35
290	Thế giới ảo trước mắt bạn sẽ trở nên lung linh, sống động, chân thực hơn bao giờ hết. Asus TUF Gaming FX507ZC4-HN095W trang bị màn hình 15.6 inch có tốc độ quét siêu mượt 144Hz và sử dụng tấm nền IPS để mang lại góc nhìn rộng 178 độ. Hiện tượng giật, lag, đứt gãy khung hình khi chơi cũng sẽ không còn vì công nghệ đồng bộ hình ảnh Adaptive-Sync sẽ đứng ra đảm nhiệm việc này. Màn hình của máy còn được phủ thêm một lớp chống chói để những hình ảnh được thể hiện ở độ phân giải Full HD 1920 x 1080 pixels luôn luôn rõ ràng, sắc nét.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/Asus%20TUF%20Gaming%20FX507ZC4-HN095W%203.png	Nắm bắt trọn vẹn từng khoảnh khắc	35
291	Dell Vostro 3520 sẵn sàng để làm tốt những công việc chuyên nghiệp, các tác vụ đòi hỏi hiệu năng cao nhờ bộ vi xử lý Intel Core i5 1235U. Đây là con chip dựa trên kiến trúc Alder Lake thế hệ thứ 12 mới, bao gồm 10 nhân, trong đó có 2 nhân hiệu suất (P) và 8 nhân hiệu quả (E). Các lõi P hỗ trợ công nghệ siêu phân luồng, mang tới tổng cộng 12 luồng khi kết hợp với các lõi E. Tốc độ xung nhịp cao ở mức 1,3 – 4,4 GHz trên lõi P và 0,9 – 3,3 GHz trên lõi E. Với việc nhiều lõi nhiều luồng và chia thành các loại nhân với tốc độ khác nhau, Dell Vostro 3520 không chỉ mạnh mẽ hơn thế hệ trước mà còn sử dụng năng lượng hiệu quả, tiết kiệm điện hơn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Dell-Vostro-V3520-fpt-6.jpg	Hiệu suất mạnh mẽ cho công việc	36
292	Dell Vostro 3520 trang bị sẵn tới 16GB RAM, đảm bảo hoạt động làm việc đa nhiệm của bạn diễn ra trôi chảy. Bạn có thể làm nhiều việc cùng lúc, mở nhiều ứng dụng, duyệt web nhiều tab mà không sợ lag giật do thiếu RAM. Đi cùng với đó là SSD M.2 tốc độ cực nhanh, để bạn không cần phải chờ đợi khi khởi động máy, mở ứng dụng, … Dung lượng lưu trữ 512GB cũng là thoải mái cho hầu hết các nhu cầu.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Dell-Vostro-V3520-fpt-12.jpg	Thoải mái đa nhiệm với 16GB RAM	36
293	Laptop Dell được chế tạo để người dùng có được trải nghiệm thoải mái nhất. Thiết kế gọn gàng với viền màn hình mỏng 3 cạnh, xung quanh máy có các đường vân để cầm bám tay hơn, hạn chế tối đa trầy xước. Bàn di chuột và bàn phím lớn cho bạn thao tác chính xác. Ngoài ra, bản lề nâng sẽ tự động nâng máy lên một góc nhỏ để giúp cổ tay thoải mái hơn, đồng thời tăng cường lưu thông không khí, tản nhiệt hiệu quả. Bàn phím chống tràn sẽ hạn chế tối đa rủi ro khi vô tình bị đổ nước hay chất lỏng. Màn hình máy tính cũng được chứng nhận chuẩn TUV Rheinland về giảm phát xạ ánh sáng xanh, kết hợp với phần mềm Dell ComfortView sẽ giúp đôi mắt bạn luôn thoải mái dù sử dụng trong thời gian dài.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Dell-Vostro-V3520-fpt-8.jpg	Nâng cao trải nghiệm người dùng	36
294	Màn hình là một bước tiến lớn của thế hệ Dell Vostro 3520 khi phiên bản mới nhất của dòng Vostro 3000 series có sự cải tiến toàn diện về hiển thị. Thiết kế viền màn hình mỏng cả 4 cạnh không chỉ nâng tầm trải nghiệm thị giác của bạn lên một tầm cao mới mà còn giúp laptop nhỏ gọn hơn đáng kể. Chất lượng hiển thị hết sức ấn tượng với tấm nền 15,6 inch Full HD WVA góc rộng, độ chi tiết cao, màu sắc sống động. Chưa hết, Dell Vostro 15 3520 còn là chiếc laptop văn phòng hiếm hoi trang bị màn hình 120Hz, mang đến sự mượt mà trong từng thao tác kéo thả, chuyển cảnh, để bạn làm việc dễ dàng và thoải mái hơn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Dell-Vostro-V3520-fpt-2.jpg	Màn hình hiển thị đẹp, thao tác mượt mà	36
295	Trên một thân máy mỏng, Dell Vostro 3520 vẫn tích hợp đầy đủ các cổng kết nối, bao gồm đầu đọc thẻ SD; 3 cổng USB, jack tai nghe 3.5mm, khe khóa và đặc biệt là cả cổng mạng LAN RJ-45. Cổng mạng LAN truyền thống thường bị cắt bỏ trong hầu hết laptop hiện nay, mặc dù đây là cổng kết nối khá quan trọng dành cho những người cần nguồn mạng ổn định. Thật may là Dell Vostro vẫn giữ lại cổng kết nối này để người dùng sử dụng mạng dây khi cần thiết.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Dell-Vostro-V3520-fpt-9.jpg	Thân máy mỏng nhưng vẫn đầy đủ kết nối	36
296	Dell Vostro 15 3520 có thời lượng pin khoảng 5 – 6 giờ đồng hồ. Bên cạnh đó, laptop còn hỗ trợ công nghệ sạc nhanh Express Charge. Chỉ mất 1 giờ đồng hồ để bạn sạc được từ 0 lên 80%. Nhờ vậy, máy tính luôn đủ năng lượng để bạn làm việc cả ngày, tham gia những cuộc họp kéo dài hay làm việc trên máy bay khi đang di chuyển.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Dell-Vostro-V3520-fpt-19.jpg	Tốc độ sạc cực nhanh	36
297	Dell Inspiron 15 N3530 được trang bị bàn phím rộng rãi với bàn phím số riêng biệt và hàng phím tắt tiện lợi, giúp bạn gõ văn bản và thực hiện các phép tính một cách nhanh chóng và chính xác. Điều này đặc biệt hữu ích cho những người thường xuyên làm việc với số liệu và văn bản.  Ngoài ra, máy tính xách tay của Dell còn có thiết kế bản lề dạng nâng độc đáo, giúp tạo ra một góc đánh máy hoàn hảo để giữ cho cổ tay của bạn luôn cảm thấy thoải mái trong suốt quá trình sử dụng. Bản lề dạng nâng được chứng minh là có hiệu quả tuyệt vời trong việc giảm thiểu mệt mỏi và tăng cường hiệu suất làm việc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/12/05-dell-inspiron-15-n3530-i5-1335u-01.jpg	Gõ phím dễ dàng và nhanh chóng	37
298	Được trang bị bộ vi xử lý Intel Core i5-1335U thế hệ mới nhất, Dell Inspiron 15 N3530 hứa hẹn mang lại hiệu suất vượt trội và phản hồi nhanh chóng trong mọi tác vụ. Với 8 nhân 12 luồng và tốc độ tối đa lên đến 4.6 GHz, con chip này có thể xử lý mượt mà các tác vụ đa nhiệm, chỉnh sửa video hoặc các ứng dụng nặng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/12/05-dell-inspiron-15-n3530-i5-1335u-02(1).jpg	Hiệu suất ổn định trong mọi tình huống	37
299	Trong thời đại công nghệ số, các cuộc họp trực tuyến và hội nghị video ngày càng trở nên phổ biến. Với webcam HD, Dell Inspiron 15 3530 sẽ đáp ứng hoàn hảo nhu cầu này. Bạn sẽ không còn lo lắng về chất lượng hình ảnh kém trong các cuộc họp, giúp tăng cường sự chuyên nghiệp và hiệu quả trong giao tiếp.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/12/05-dell-inspiron-15-n3530-i5-1335u-03.jpg	Webcam sắc nét, rõ ràng	37
300	Với độ phân giải Full HD (1920 x 1080 pixels), màn hình của Dell Inspiron 15 N3530 sẽ cung cấp hình ảnh sắc nét và chi tiết trong mọi tình huống sử dụng. Kết hợp với tần số quét 120Hz, màn hình này sẽ mang lại sự mượt mà trong mọi chuyển động, làm cho trải nghiệm xem phim, chỉnh sửa video hay chơi game trở nên ấn tượng hơn bao giờ hết.  Ngoài ra, màn hình 15.6 inch của Dell Inspiron 15 3530 còn sở hữu công nghệ LED Backlit tiên tiến, giúp cung cấp màu sắc chân thực và sống động. Dù bạn đang làm việc với các ứng dụng đồ họa, xem phim hay chơi game, bạn sẽ luôn có được trải nghiệm hiển thị luôn sắc nét và sống động nhất. Vì vậy, màn hình này không chỉ phục vụ tốt nhu cầu làm việc mà còn đáp ứng xuất sắc nhu cầu giải trí của người dùng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/12/05-dell-inspiron-15-n3530-i5-1335u-04.jpg	Trải nghiệm hình ảnh sống động	37
301	Với 16GB RAM DDR4, Dell Inspiron 15 N3530 sẽ cho phép bạn chạy nhiều chương trình cùng lúc mà không gặp bất kỳ sự chậm trễ nào. Điều này sẽ giúp tối ưu hóa hiệu suất làm việc và giải trí của bạn.  Bên cạnh đó, chiếc máy tính xách tay của Dell còn được tích hợp thêm card đồ hoạ rời chuyên dụng NVIDIA GeForce MX550 2GB để mang đến khả năng xử lý đồ hoạ ấn tượng trong một thiết kế nhỏ gọn. Kết hợp CPU Intel Core i5 thế hệ mới, laptop sẽ đảm bảo bạn có thể thoải mái chơi game, xem video nặng hoặc chỉnh sửa hình ảnh/video bất cứ khi nào bạn muốn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/12/05-dell-inspiron-15-n3530-i5-1335u-05.jpg	Giải trí và đa nhiệm mượt mà	37
302	Ổ cứng SSD 512GB của Dell Inspiron 15 3530 cung cấp không gian lưu trữ rộng lớn cho tất cả các tệp tin, tài liệu và dữ liệu truyền thông của bạn. Với thời gian khởi động nhanh và tốc độ chuyển giao tệp tin cực kỳ nhanh chóng, máy tính xách tay này sẽ đảm bảo bạn có thể truy cập dữ liệu của mình một cách nhanh chóng và hiệu quả.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/12/05-dell-inspiron-15-n3530-i5-1335u-06.jpg	Lưu trữ nhanh chóng, hiệu quả	37
303	Với thiết kế màu bạc platinum sang trọng, Dell Inspiron 15 N3530 không chỉ mạnh mẽ về mặt kỹ thuật mà còn thể hiện phong cách sang trọng và đẳng cấp. Dù bạn là một chuyên gia, sinh viên hay người dùng văn phòng, chiếc laptop này đều sẽ là lựa chọn hoàn hảo dành cho bạn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/10/12/05-dell-inspiron-15-n3530-i5-1335u-07.jpg	Thiết kế sang trọng, tinh tế	37
304	Laptop Dell thường có thiết kế khá dày và nặng nề, điều này gây không ít khó khăn cho người sử dụng. Hiểu được điều ấy Dell Latitude 3520 P108F001 đã cải tiến để máy trở nên mỏng nhẹ hơn với kích thước ba chiều lần lượt là 361 x 240.9 x 18.06mm cùng khối lượng 1.79 kg. Giờ đây bạn bạn có thể đặt vừa chiếc laptop trong balo của mình và mang đi dễ dàng.	https://file.hstatic.net/1000026716/file/gearvn-laptop-dell-latitude-3520-p108f001-70280538-3_c009731c52c74ac4bfa669b96b26adef.png	Thiết kế đơn giản, sang trọng	38
305	Không quá mạnh mẽ như những chiếc laptop gaming, nhưng với việc sử dụng con chip Intel Core i7-1165G7 kết hợp card đồ họa Intel Iris Xe Graphics mới nhất giúp laptop Dell Latitude ở hữu hiệu năng cao đủ sức chạy các phần mềm văn phòng dễ dàng cùng một số phần mềm đồ họa cơ bản như Photoshop, AI, …	https://file.hstatic.net/1000026716/file/gearvn-laptop-dell-latitude-3520-p108f001-70280538-6_b257fa112c3940f6bf2d202f0d023f19.png	Hiệu năng Dell Latitude 3520 P108F001 70280538 mạnh mẽ	38
368	realme C67 được thiết kế theo kiểu vuông vắn, tạo nên vẻ ngoại hình mạnh mẽ và hiện đại. Với khung và mặt lưng được làm từ chất liệu nhựa, chiếc điện thoại này giúp tối ưu hóa giá thành và còn mang lại trải nghiệm cầm nắm nhẹ nhàng.	https://cdn.tgdd.vn/Products/42/319658/realme-c67-2-1020x570.jpg	Thiết kế vuông hiện đại	46
306	Dell Latitude 3520 P108F001 được trang bị màn hình rộng 15.6 inch với độ phân giải Full HD (1920 x 1080). Màn hình 60Hz, độ sáng màn hình ở mức thông dụng 250 nits đáp ứng tốt nhu cầu hiển thị phục vụ cho nhu cầu làm việc, học tập tại nhà và nơi công sở.  Không chỉ dừng lại ở đó, máy còn được trang bị công nghệ Wide Viewing Angle (WVA) giúp góc nhìn rộng lên đến 178 độ và chống chói hiệu quả dù không nhìn từ hướng trực diện. Công nghệ này giúp bảo vệ cho đôi mắt của bạn, giữ cho mắt luôn trong điều kiện tốt nhất, thoải mái và dễ chịu trong thời gian dài sử dụng		Màn hình Full HD chân thật, sắc nét	38
307	Dell Latitude 3520 P108F001 70280538 có kích thước phần bàn phím khá lớn giúp quá trình gõ phím nhanh hơn và chính xác hơn, vì vậy mà việc soạn thảo văn bản hay nhập liệu của bạn trở nên dễ dàng hơn rất nhiều. Ngoài ra hành trình phím ngắn cũng là ưu điểm lớn để bạn không bị mỏi tay khi gõ phím trong thời gian dài.	https://file.hstatic.net/1000026716/file/gearvn-laptop-dell-latitude-3520-p108f001-70280538-7_bacd71afa98b4b0e9069dc1a858080a7.png	Bàn phím, touchpad hỗ trợ soạn thảo văn bản hiệu quả	38
308	Là dòng laptop văn phòng phục vụ cho quá trình làm việc, học tập nên máy được trang bị đầy đủ các cổng kết nối bao gồm:  2 x USB 3.2 Gen1 Type-A  1 x USB 3.2 Gen2 x2 Type-C (DisplayPort) hỗ trợ Power Delivery  1 x HDMI 1.4  1 x RJ45  1 x MicroSD Card reader  1 x Audio jack	https://file.hstatic.net/1000026716/file/gearvn-laptop-dell-latitude-3520-p108f001-70280538-4_1b94d34cc12b48319044391da67f4d74.png	Đa dạng cổng kết nối	38
309		https://file.hstatic.net/1000026716/file/gearvn-laptop-dell-latitude-3520-p108f001-70280538-5_1882fdee273044b3acb35e61e2aeccb6.png		38
310	Acer Aspire 7 Gaming A715-76-57CY sử dụng phong cách thiết kế cực kì đơn giản và không cầu kì. Phần nắp lưng máy làm từ chất liệu kim loại cao cấp, bền bỉ và cho cảm giác sang trọng khi chạm vào. Các đường viền vừa được bo tròn vừa được vát cực mỏng, mang lại cảm giác sang trọng và ấn tượng cho người sở hữu. Màn hình của máy được trợ lực bằng bản lề đơn bên dưới, trên mặt bản lề này có khắc chữ Aspire khá đẹp mắt, đồng thời nó đủ cứng cáp để người dùng đóng mở nắp máy bằng cả hai tay hoặc một tay rất dễ dàng. Kích thước tổng thể của Acer Aspire 7 Gaming A715-76-57CY là 362.3 x 237.4 x 19.9 mm và trọng lượng là 2.1kg, rất thuận tiện để mang đi khắp mọi nơi.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/Acer%20Aspire%207%20Gaming%20A715-76-57CY%201.png	Ưa chuộng phong cách thiết kế đơn giản, mỏng nhẹ	39
311	Màn hình 15.6 inch của Acer Aspire 7 Gaming A715-76-57CY sẽ mang đến độ phân giải Full HD 1920 x 1080 pixels, đủ cho người dùng có trải nghiệm hình ảnh tốt trong khi sử dụng mỗi ngày. Lớp phủ đặc biệt của công nghệ Acer ComfyView LED-backlit vừa lọc được ánh sáng xanh để bảo vệ cho đôi mắt của người dùng vừa có khả năng chống chói tốt trong môi trường có ánh sáng mạnh. Tấm nền IPS mang đến góc nhìn rộng 178 độ cùng các chi tiết rõ nét và nhiều màu sắc cực kì sinh động và tần số quét 60Hz luôn luôn ổn định chuyển động của các khung hình để những nội dung được hiển thị luôn chạy mượt mà nhất.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/Acer%20Aspire%207%20Gaming%20A715-76-57CY%202.png	Màn hình chống chói 15.6 inch Full HD	39
312	Cấu hình phần cứng có trên chiếc laptop Acer đủ mạnh để chạy rất nhiều loại phần mềm và ứng dụng từ làm việc văn phòng với nhiều loại văn bản cho đến những công cụ học tập trên nền Windows hoặc nền web, thậm chí là biên tập - chỉnh sửa hình ảnh hoặc đồ họa ở mức độ cơ bản cũng như chơi được nhiều game online và offline. Máy được trang bị CPU Intel Core i5-12450H 3.30GHz - 4.40GHz với 8 nhân, 12 luồng, 12MB bộ nhớ đệm, tích hợp card đồ họa Intel Iris Xe Graphics - 8GB RAM DDR4 3200MHz - SSD M.2 NVMe 512GB... đây là những phần cứng có hiệu suất hoạt động rất cao và ổn định nên tác vụ nào cũng sẽ chạy rất mượt và mang lại hiệu quả tốt như mong đợi.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/Acer%20Aspire%207%20Gaming%20A715-76-57CY%203.png	Phần cứng mạnh, vừa làm vừa chơi thoải mái	39
313	Acer Aspire 7 Gaming A715-76-57CY có bàn phím Fullsize được thiết kế với font chữ rất đẹp mắt. Dãy phím số bên phải sẽ đóng vai trò là trợ thủ cực kì đắc lực dành cho các bạn sinh viên hoặc nhân viên văn phòng chuyên làm các công việc như tính toán, nhập số liệu hàng ngày. Các phím này có hành trình gõ vừa phải, cảm giác gõ êm ái, độ phản hồi xúc giác cao trên các đầu ngón tay. Phần trackpad bên dưới của laptop được làm nhám mịn nên rất bám tay và không dễ bị trượt, đồng thời ở góc trên bên trái còn tích hợp cả cảm biến vân tay 1 chạm nên có thể dùng để mở khóa máy rất nhanh và an toàn mà không cần dùng đến mật khẩu như trước nữa.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/Acer%20Aspire%207%20Gaming%20A715-76-57CY%204.png	Bàn phím Fullsize, trackpad có cảm biến vân tay	39
314	Những cổng kết nối có trên Acer Aspire 7 Gaming A715-76-57CY luôn là những cổng được người dùng trông đợi, thế nên chúng sẽ hoạt động vô cùng hiệu quả. Máy được trang bị 1 cổng nguồn DC - 1 jack Audio 3.5mm - 3 USB 3.2 - 1 HDMI 2.0 - 1 Ethernet, đồng thời còn tương thích hoàn toàn với chuẩn kết nối Wi-Fi 6E và Bluetooth 5.1 nên các loại phụ kiện không dây sử dụng 2 chuẩn kết nối dữ liệu này sẽ hoạt động rất ổn định và không bị ngắt kết nối một cách đột ngột nữa.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/Acer%20Aspire%207%20Gaming%20A715-76-57CY%205.png	Nhiều cổng kết nối	39
315		https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Aspire-3-A315-510P-2.jpg		40
369	Với mặt lưng nhám nhẹ, realme C67 giúp người dùng tránh được vết bám vân tay và mồ hôi. Điều này không chỉ giữ cho điện thoại luôn sáng bóng mà còn làm tăng tính thẩm mỹ. Với cụm camera dạng bầu dục chứa 2 ống kính và còn với viền bao màu vàng quanh camera, tạo điểm nhấn sang trọng và lôi cuốn.			46
316	Với sự xuất hiện của Intel Core i3 N305, Acer Aspire 3 A315-510P-34XZ vừa có hiệu năng ấn tượng, lại vừa rất tiết kiệm năng lượng. Con chip này thuộc dòng Alder Lake-N, dòng chip tiết kiệm điện dành riêng cho laptop mỏng nhẹ. Sở hữu tới 8 nhân 8 luồng, tốc độ tối đa 3.80 GHz nhưng lại chỉ tiêu thụ tối thiểu 9W điện, Intel Core i3 N305 giúp laptop chạy tốt mọi ứng dụng công việc thường ngày như duyệt web, Office, các trình chỉnh sửa ảnh cơ bản, … Hơn nữa, GPU đồ họa đi kèm Intel UHD Graphics cũng được nâng cấp, cho khả năng xuất hình tối đa 4K và có thể chơi được các game eSports hiện nay.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Aspire-3-A315-510P-3.jpg	Vi xử lý Alder Lake-N, giải pháp hiệu năng cho laptop mỏng nhẹ	40
317	Acer Aspire 3 A315-510P-34XZ tích hợp những linh kiện bộ nhớ đời mới, cho không gian sử dụng thoải mái và tốc độ cực nhanh. Ổ SSD M.2 512GB có mặt trên laptop Acer Aspire 3 A315-510P-34XZ sẽ giúp bạn được tận hưởng tốc độ khởi động máy nhanh trong chớp mắt, đồng thời thoải mái lưu trữ dữ liệu. Ngoài ra các thao tác khác như mở ứng dụng, tắt máy, sao chép di chuyển dữ liệu cũng diễn ra cực nhanh. Đặc biệt, Acer Aspire 3 A315-510P-34XZ sử dụng chuẩn RAM LPDDR5 thế hệ mới, tốc độ lên tới 4800MHz, thoải mái cho công việc thường ngày của bạn. Bạn có thể chạy đa nhiệm nhiều ứng dụng cùng lúc, duyệt web nhiều tab mà laptop Acer Aspire vẫn chạy trơn tru, nâng cao năng suất làm việc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Aspire-3-A315-510P-8.jpg	Bộ nhớ tốc độ cao	40
318	Acer Aspire A315 đã có sự thay đổi lớn về ngôn ngữ thiết kế so với các thế hệ trước. Những đường nét trên máy được làm thanh thoát, hiện đại và trẻ trung hơn. Acer Aspire 3 sử dụng những đường vát thông minh, ngôn ngữ thiết kế phẳng khỏe khoắn, tạo nên một sản phẩm đẹp thanh lịch, chuyên nghiệp. Phiên bản màu bạc kim loại sang trọng cùng độ mỏng nhẹ xuất sắc giúp chiếc laptop của bạn vừa đẹp, vừa di động. Aspire 3  rất dễ dàng để cùng bạn đi bất cứ đâu nhờ độ mỏng chỉ 18,9mm và trọng lượng 1,6kg.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Aspire-3-A315-510P-9.jpg	Thời trang và phong cách	40
319	Mọi việc sẽ dễ dàng hơn với bạn khi Acer Aspire 3 A315-510P-34XZ được trang bị màn hình lớn 15,6 inch độ phân giải Full HD sắc nét. Nhờ độ phân giải Full HD, hình ảnh sẽ hiển thị rõ nét hơn, ngay cả khi bạn chỉ làm việc với văn bản. Các nội dung khi xem phim, chơi game, xem ảnh, duyệt web đều trở nên hấp dẫn với nội dung lớn và sống động. Màn hình này cũng tích hợp tính năng Acer Bluelight Shield để bạn làm việc lâu dài không lo mỏi mắt nhờ việc giảm phát xạ ánh sáng xanh thông minh.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Aspire-3-A315-510P-11.jpg	Màn hình hoàn hảo cho công việc, giải trí	40
320	Để laptop Acer hoạt động mát mẻ, ổn định trong một bộ khung siêu nhỏ gọn, Acer Aspire 3 A315  đã nâng cấp đáng kể về hệ thống tản nhiệt. Diện tích bề mặt quạt tăng 78% giúp hiệu quả làm mát tăng thêm 17%. Bạn có thể thỏa sức tập trung vào làm việc, giải trí trong thời gian dài mà không lo máy nóng, quá nhiệt, giảm hiệu năng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Aspire-3-A315-510P-4.jpg	Công nghệ tản nhiệt thế hệ mới	40
321	Acer Aspire 3 A315-510P-34XZ tích hợp đầy đủ toàn bộ những cổng kết nối cần thiết cho công việc của bạn, từ những kết nối hiện đại cho đến truyền thống. Bạn sẽ có cổng xuất hình HDMI 2.1, cổng USB Type-C đa năng,  cổng USB Type-A 3.2 tốc độ cao, jack tai nghe/mic 3.5mm. Không chỉ kết nối có dây, kết nối không dây của laptop cũng rất nhanh khi hỗ trợ chuẩn Wi-Fi 6 và Bluetooth 5.1.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Aspire-3-A315-510P-7.jpg	Đầy đủ kết nối hàng đầu	40
322		https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-fpt-14.jpg		41
323	Với Intel Core i7 12700H, Acer Nitro 5 Tiger AN515-58-769J có sức mạnh vượt qua những giới hạn từng có ở một chiếc laptop. Bạn sẽ được khám phá hiệu năng cực khủng từ 14 nhân 20 luồng, tốc độ 3.50 – 4.70 GHz, 24 MB Intel Smart Cache, mang đến nguồn năng lượng khổng lồ cho game thủ. Thỏa sức chơi những game bom tấn AAA, truyền phát trực tiếp, hay làm các công việc nặng như một máy trạm thực thụ. Cấu hình cực mạnh giúp Nitro 5 Tiger 2022 biến mọi thứ phức tạp trở thành đơn giản.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-fpt-17.jpg	Sức mạnh phá vỡ mọi giới hạn	41
324	Laptop gaming Nitro 5 AN515-58-769J được trang bị GPU RTX 3050, card đồ họa thuộc kiến trúc Ampere mới nhất, lý tưởng cho game thủ và nhà sáng tạo nội dung. Hiệu năng chơi game của RTX 3050 tương đương với GTX 1660 trước đây, cho phép bạn chơi tốt hầu hết các game ở độ phân giải Full HD. Bên cạnh đó, các lõi Tensor, lõi RT mới và công nghệ DLSS sẽ giúp trải nghiệm game mượt mà, tốc độ khung hình ổn định hơn, hiệu ứng hình ảnh chân thực hơn. Đây cũng là card đồ họa đáp ứng tốt các phần mềm chỉnh sửa ảnh, video, render 2D, 3D, lập trình  chuyên dụng hiện nay.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-2.jpg	Đồ họa sống động nhờ kiến trúc Ampere	41
325	Thiết kế mới của Acer Nitro Gaming AN515-58-769J không chỉ gọn và đẹp hơn, nó còn cải thiện khả năng tản nhiệt, niềm tự hào của những chiếc laptop chơi game Acer. Nitro 5 2022 sở hữu 2 quạt tản nhiệt, 2 cổng hút gió (trên và dưới) cùng 4 cổng xả nhiệt. Sự phối hợp nhịp nhàng của hệ thống này trong phần khung máy thiết kế công thái học giúp nhiệt lượng luôn được giải phóng nhanh chóng, đảm bảo sức mạnh tốt ưu của hiệu năng. Tất nhiên bạn có thể điều chỉnh hệ thống, bao gồm tốc độ quạt, chế độ đèn qua phần mềm NitroSense quen thuộc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-fpt-8.jpg	Hệ thống tản nhiệt được nâng cấp	41
326	Các hình ảnh trong game sẽ trở nên vô cùng ấn tượng với màn hình viền mỏng của laptop Acer Nitro 5 2022. Hơn nữa, màn hình 15,6 inch này còn có độ phân giải Full HD sắc nét, tấm nền IPS trong trẻo, tần số quét 144Hz và tốc độ phản hồi 3ms cực nhanh, giúp bạn nắm bắt mọi chuyển động, thao tác mượt mà trong các trận chiến.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-fpt-12.jpg	Thưởng thức trận chiến trên màn hình viền siêu mỏng	41
327	Trong một thân máy nhỏ gọn, Acer Nitro 5 Tiger AN515-58-769J vẫn trang bị bàn phím với kích thước lớn, khoảng cách hợp lý nhờ việc bố trí các phím sát ra cạnh máy. Chưa hết, bàn phím này còn hỗ trợ đèn LED RGB 4 vùng tuyệt đẹp, cho bạn thêm niềm cảm hứng khi chơi game. Các phím WSAD và mũi tên cũng được làm nổi bật để bạn thao tác nhanh và chính xác hơn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-4.jpg	Bàn phím LED RGB đẹp mắt	41
328	Dù là bạn nghe nhạc, xem phim hay chơi game thì Acer Nitro 5 2022 vẫn mang lại những cảm giác khó quên nhờ hệ thống âm thanh DTS:X Ultra cao cấp. Âm thanh được phát ra rõ nét, trong trẻo và hiệu ứng 3D giả lập đầy hấp dẫn, cho bạn thực sự đắm chìm trong thế giới giải trí riêng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-5.jpg	Đắm chìm trong thế giới âm thanh DTS:X Ultra	41
329	So với dòng Acer Nitro 5 trước đây, Nitro 5 Tiger 2022 có một thiết kế hoàn toàn mới. Máy đi theo ngôn ngữ vuông vắn, hiện đại và gọn gàng hơn với viền màn hình siêu mỏng, bàn phím tràn sát ra cạnh bên máy. Các đường cắt cũng được làm khỏe khoắn, mạnh mẽ hơn. Đặc biệt, phần mặt lưng tạo điểm nhấn với những dải màu độc đáo, đậm chất gaming. Bạn sẽ có một chiếc laptop vừa đẹp mạnh mẽ, lại vừa gọn gàng di động.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-fpt-5.jpg	Thiết kế gọn gàng và phá cách, đậm chất game thủ	41
330		https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-Swift-Go-SFG14-3.jpg		42
331	Bạn sẽ phải bất ngờ khi cầm trên tay Acer Swift Go AMD. Chiếc laptop này siêu nhẹ với trọng lượng chỉ 1,25 kg, độ mỏng vỏn vẹn 14,9 mm. Thiết kế máy cũng đầy ấn tượng với chất liệu nhôm sang trọng, màu bạc thời thượng. Bạn có thể dễ dàng mang laptop đi bất cứ đâu một cách nhẹ nhàng. Thiết kế siêu mỏng nhẹ của Swift Go giúp đây xứng đáng là một trong những sản phẩm đẹp và di động nhất trong tầm giá.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-Swift-Go-SFG14-15.jpg	Dành cho cuộc sống năng động	42
332	“Nhỏ nhưng có võ”, Acer Swift Go SFG14-41-R19Z trang bị cấu hình xuất sắc với điểm nhấn là bộ vi xử lý AMD Ryzen 5 7530U. Đây là con chip cực mạnh thuộc thế hệ 7000 series đời mới, có tới 6 nhân 12 luồng, sản xuất trên tiến trình 7nm hiện đại và tốc độ xung nhịp cực cao 2.0 – 4.5 GHz. Bộ vi xử lý này đủ sức để người dùng có thể tự do làm việc, học tập, vui chơi, sáng tạo một cách mượt mà. Từ những ứng dụng làm việc nặng cho đến các tựa game giải trí, laptop đều có thể đáp ứng yêu cầu của bạn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-Swift-Go-SFG14-1.jpg	Sức mạnh hiệu năng vượt trội, khai phá tiềm năng	42
333	Không chỉ bộ vi xử lý mạnh mẽ, Acer Swift Go SFG14-41-R19Z còn mang trên mình tới 16GB RAM và 512GB SSD. Việc có sẵn dung lượng RAM lớn 16GB là một lợi thế cho những chiếc laptop văn phòng như Acer Swift Go AMD. Với dung lượng RAM gấp đôi các đối thủ trong tầm giá, Acer Swift Go có thể giúp bạn nâng cao năng suất khi làm được nhiều việc cùng lúc hơn, khả năng đa nhiệm tốt hơn. Ngoài ra, máy còn trang bị SSD dung lượng cao 512GB, thỏa sức lưu trữ. Đặc biệt đây là chuẩn SSD PCIe NVMe tốc độ cao vượt trội so với SSD Sata hay HDD truyền thống, giúp tăng tốc toàn diện laptop.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-Swift-Go-SFG14-18.jpg		42
334	Màn hình Acer Swift Go AMD có viền siêu mỏng ở 3 cạnh, mang tới trải nghiệm thị giác hấp dẫn. Hình ảnh như nổi lên trên màn hình với màu sắc và độ nét tuyệt hảo. Tấm nền IPS 14 inch độ phân giải Full HD IPS không chỉ hiển thị trong trẻo, độ sáng cao mà màu sắc còn rất chính xác với chuẩn màu 100% sRGB. Màn hình này đạt chuẩn cao hơn những laptop văn phòng thông thường từ thiết kế cho đến độ chính xác màu sắc, giúp bạn có được những hình ảnh đẹp mắt, sống động.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-Swift-Go-SFG14-2.jpg	Hiển thị xuất sắc trên màn hình viền siêu mỏng 100% sRGB	42
335	Khá bất ngờ khi dù rất mỏng nhẹ nhưng Acer Swift Go AMD vẫn mang trên mình hệ thống tản nhiệt cao cấp với đầy đủ các thành phần tản nhiệt hiệu quả. Công nghệ quạt kép TwinAir có 2 quạt, kết hợp cùng bộ ống dẫn nhiệt kép bằng đồng và bàn phím hút gió giúp nhiệt được phân bổ đều, thoát ra ngoài nhanh chóng, giải tỏa áp lực cho laptop. Điều này giúp hiệu năng luôn ổn định, đồng thời đảm bảo hiệu quả linh kiện có tuổi thọ lâu bền.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-Swift-Go-SFG14-14.jpg	Công nghệ tản nhiệt cao cấp	42
336	Xiaomi Redmi A3 ra mắt với ngoại hình vuông vức, dễ dàng chiếm được cảm tình từ những người yêu thích vẻ đẹp tối giản mà không kém phần hiện đại. Bốn góc của máy được làm bo cong ít hơn so với các thế hệ trước đây, từ đó tạo nên một tổng thể vuông hơn giúp tăng tính sang trọng và hiện đại hơn cho máy.	https://cdn.tgdd.vn/Products/42/320734/xiaomi-redmi-a3-1-1020x570.jpg	Thiết kế nổi trội với tạo hình vuông vức	43
337	Ngay từ cái nhìn đầu tiên, bạn sẽ dễ dàng nhận diện ra Redmi A3 qua cụm camera hình tròn lớn nổi bật ở mặt sau của máy. Không chỉ sở hữu vẻ ngoài cuốn hút, cụm camera này còn liên tưởng đến Xiaomi 14 Ultra, mẫu máy cao cấp mới ra mắt gần đây của Xiaomi, từ đó giúp máy sang trọng và hợp thời hơn hẳn.	https://cdn.tgdd.vn/Products/42/320734/xiaomi-redmi-a3-2-1020x570.jpg		43
338	Một điểm cộng không thể không nhắc tới nữa chính là việc Redmi A3 chuyển sang sử dụng cổng sạc Type C, giúp việc cắm và tháo sạc trở nên thuận tiện hơn bao giờ hết. Cùng với đó, máy được làm với độ mỏng 8.32 mm kể cả khi trang bị viên pin 5000 mAh.  Mặt trước của Redmi A3 có màn hình được phủ lớp Corning Gorilla Glass 3, nhờ đó màn hình của máy không chỉ sắc nét mà còn giúp người dùng không cần lo lắng về những vết trầy xước không mong muốn.	https://cdn.tgdd.vn/Products/42/320734/xiaomi-redmi-a3-3-1020x570.jpg		43
339	Xiaomi Redmi A3 tạo cho người dùng ấn tượng bởi màn hình IPS LCD giúp tái tạo màu sắc với độ trung thực cao, mang đến chất lượng hình ảnh ổn trong tầm giá. Màn hình này còn cho góc nhìn rộng, tạo điều kiện thuận lợi cho việc xem phim, chơi game hay lướt web.	https://cdn.tgdd.vn/Products/42/320734/xiaomi-redmi-a3-4-1020x570.jpg	Màn hình lớn hỗ trợ tần số quét 90 Hz	43
340	Với độ phân giải màn hình lên đến 1650 x 720 Pixels, Redmi A3 đem lại chất lượng hiển thị khá tốt. Tuy cũng có thể xuất hiện hiện tượng vỡ hình ở một số nội dung phức tạp, nhưng tổng thể, nó vẫn đảm bảo cung cấp trải nghiệm xem đầy đủ cho người dùng.			43
341	Ngoài ra, màn hình của thiết bị này còn hỗ trợ độ sáng lên tới 500 nits và tần số quét 90 Hz. Điều này mang đến khả năng hiển thị mượt mà, đồng thời giúp nâng cao trải nghiệm người dùng trong quá trình sử dụng, đặc biệt là khi chơi game hoặc xem các nội dung đa phương tiện.	https://cdn.tgdd.vn/Products/42/320734/xiaomi-redmi-a3-5-1020x570.jpg		43
342	Xiaomi Redmi A3 được trang bị con chip MediaTek Helio G36, một chip xử lý thế hệ mới ra mắt trong năm 2023 với hiệu suất ổn định, đáp ứng tốt nhu cầu sử dụng hàng ngày từ duyệt web, xem video, đến chơi các game đồ hoạ nhẹ. Đây là lựa chọn hợp lý trong tầm giá, đảm bảo người dùng có thể thực hiện các tác vụ cơ bản mà không cần chờ đợi.	https://cdn.tgdd.vn/Products/42/320734/xiaomi-redmi-a3-6-1020x570.jpg	Cấu hình ổn trong tầm giá	43
343	Xiaomi đã trang bị cho Redmi A3 RAM 3 GB, cung cấp khả năng đa nhiệm ổn định, phù hợp với yêu cầu của đa số người dùng về một thiết bị di động linh hoạt và đa chức năng. Với dung lượng RAM như vậy, bạn hoàn toàn có thể chạy mượt mà một vài ứng dụng nhẹ hay chơi được các tựa game cấu hình thấp mà không sợ bị tràn RAM.	https://cdn.tgdd.vn/Products/42/320734/xiaomi-redmi-a3-7-1020x570.jpg		43
344	Ở mặt sau, điện thoại này được trang bị một camera 8 MP cùng với một cảm biến phụ trợ có độ phân giải 0.08 MP. Sự kết hợp này giúp tạo nên khả năng chụp ảnh xóa phông, hay còn gọi là chế độ chân dung, rất thú vị. Chế độ này giúp tạo ra những bức ảnh có độ sâu, tập trung vào chủ thể hơn và giúp mờ đi phần nền đằng sau, tạo ra những bức ảnh trông chuyên nghiệp hơn.	https://cdn.tgdd.vn/Products/42/320734/xiaomi-redmi-a3-8-1020x570.jpg	Hỗ trợ camera chụp ảnh đủ tốt cho nhu cầu cơ bản	43
345	Ở mặt trước, chiếc điện thoại Xiaomi này còn trang bị camera selfie 5 MP, đủ để bạn chụp ảnh tự sướng với chất lượng hình ảnh tốt. Camera trước cũng được cải thiện với nhiều tính năng và công nghệ để giúp bạn chụp được những bức ảnh selfie ấn tượng.	https://cdn.tgdd.vn/Products/42/320734/xiaomi-redmi-a3-9-1020x570.jpg		43
346	Mang trên mình viên pin dung lượng lên tới 5000 mAh, Xiaomi Redmi A3 chắc chắn sẽ trở thành người bạn đồng hành lý tưởng cho những ai cần một thiết bị di động có thời gian sử dụng dài lâu.  Với viên pin dung lượng lớn như vậy, Redmi A3 có khả năng hoạt động trong suốt cả ngày chỉ với một lần sạc, dù cho bạn lướt web, xem video hay chơi game một cách liên tục. Công suất mạnh mẽ này sẽ đảm bảo đủ năng lượng cho tất cả những hoạt động hàng ngày của bạn.	https://cdn.tgdd.vn/Products/42/320734/xiaomi-redmi-a3-10-1020x570.jpg	Sử dụng viên pin lớn đáp ứng đủ cho một ngày sử dụng	43
347	Tổng quát lại, Xiaomi Redmi A3 là một smartphone đáng chú ý, trang bị đầy đủ các tính năng cần thiết nhưng vẫn giữ được mức giá phải chăng. Chắc chắn đây sẽ là lựa chọn tốt cho những ai đang tìm kiếm một chiếc điện thoại chất lượng với giá cả phù hợp.			43
348	Xiaomi đã tích hợp công nghệ màn hình AMOLED vào chiếc điện thoại nhằm mang lại trải nghiệm vượt trội. Màn hình này không chỉ tái tạo hình ảnh sống động mà còn tối ưu hóa tiêu thụ điện và giảm ánh sáng xanh, đông thời còn giúp bảo vệ mắt.	https://cdn.tgdd.vn/Products/Images/42/312965/xiaomi-redmi-note-13-pro-plus-5-1020x570-2.jpg	Tầm nhìn thả ga với màn hình cong độc đáo	44
349	Kích thước màn hình của Redmi Note 13 Pro+ 5G rộng lớn, lên đến 6.67 inch. Với kích thước này cùng kiểu thiết kế cong sang hai bên, điện thoại mang lại không gian hiển thị rộng rãi, tạo điều kiện thuận lợi cho việc xem nội dung hay thao tác vuốt chạm khi chơi game trở nên thoải mái hơn bao giờ hết.  Độ phân giải 1.5K và với kích thước màn hình như trên của Redmi Note 13 Pro+ 5G, điều này sẽ giúp tăng cường mật độ điểm ảnh, làm cho mọi nội dung trở nên chân thực và sắc nét.	https://cdn.tgdd.vn/Products/Images/42/312965/xiaomi-redmi-note-13-pro-plus-9-1020x570-1.jpg		44
350	Giúp cho trải nghiệm màn ảnh tốt hơn, Xiaomi tiếp tục hỗ trợ công nghệ màu như HDR10+, 100% chuẩn màu P3, Dolby Vision, điều này sẽ giúp máy tái tạo màu sắc chuẩn xác kể cả khi mở độ sáng màn hình cao. Nhờ vào đó, bạn có thể sử dụng điện thoại để xem trước các bản phác thảo, thiết kế cho mỗi lần in ấn, giảm độ sai lệch màu sau khi xuất ra bản cứng.			44
351	Redmi Note 13 Pro+ 5G đã thực hiện một thay đổi lớn khi lần đầu tiên đưa màn hình cong vào dòng sản phẩm Redmi, đem đến khả năng vuốt chạm cũng như tầm nhìn rộng hơn. Độ cong của màn hình giúp cho máy trở nên hiện đại và sang trọng hơn khi cầm nắm sử dụng.	https://cdn.tgdd.vn/Products/Images/42/312965/xiaomi-redmi-note-13-pro-plus-12-1020x570-1.jpg	Ngoại hình với thiết kế bo cong đẹp mắt	44
353	Điểm độc đáo và làm cho Redmi Note 13 Pro+ 5G nổi bật chính là cụm camera phía sau của máy. Được thiết kế với hai cụm tròn lớn chứa 2 camera và một cảm biến phụ nhỏ được đặt chung vào một ô, tạo nên một bố cục đẹp mắt và hiện đại. Điều này kết hợp với hai ô phụ - một chứa đèn LED dẹp và một chứa logo thương hiệu, tạo nên một tổng thể mới lạ và thu hút.	https://cdn.tgdd.vn/Products/Images/42/312965/xiaomi-redmi-note-13-pro-plus-16-1020x570-1.jpg		44
354	Chiếc điện thoại Xiaomi Redmi này được trang bị camera chính với độ phân giải lên đến 200 MP, tạo ra những bức ảnh đầy tinh tế và chi tiết. Camera góc siêu rộng 8 MP và camera cận cảnh 2 MP được tối ưu hóa để tạo ra những bức ảnh chân dung với hiệu ứng nền mờ đẹp mắt. Ngoài chế độ xóa phông, điện thoại còn tích hợp nhiều chế độ chụp ảnh độc đáo khác nhau, giúp bạn tự do sáng tạo với nhiều góc chụp.	https://cdn.tgdd.vn/Products/Images/42/312965/xiaomi-redmi-note-13-pro-plus-10-1020x570-1.jpg	Chụp ảnh rõ nét với camera chính 200 MP	44
355	Về cấu hình, Redmi Note 13 Pro+ 5G được trang bị bộ vi xử lý Mediatek Dimensity 7200 Ultra 8 nhân, mang lại sức mạnh ấn tượng. Tốc độ CPU cao giúp điện thoại xử lý mượt mà các tác vụ đa nhiệm như mở ứng dụng, duyệt web, chơi game hay xem video mà không gặp khó khăn.	https://cdn.tgdd.vn/Products/Images/42/312965/xiaomi-redmi-note-13-pro-plus-14-1020x570-1.jpg	Cấu hình vượt trội với chip MediaTek	44
356	Với viên pin dung lượng lớn 5000 mAh, chiếc điện thoại Android này cung cấp năng lượng liên tục, giúp bạn hoàn thành mọi công việc mà không cần phải lo lắng về việc sạc lại điện thoại một cách thường xuyên.	https://cdn.tgdd.vn/Products/Images/42/312965/xiaomi-redmi-note-13-pro-plus-15-1020x570.jpg	Hỗ trợ sạc 120 W với viên pin dung lượng lớn	44
357	Chiếc điện thoại thông minh Xiaomi Redmi Note 13 Pro+ 5G là một lựa chọn đáng xem xét trong phân khúc tầm trung, máy nhấn mạnh vào những điểm mạnh như dung lượng pin lớn, khả năng sạc nhanh, hiệu suất ấn tượng, màn hình sáng và sắc nét, camera 200 MP cùng với một thiết kế thời thượng.			44
358	Thiết kế của realme C65 là sự kết hợp hài hòa giữa sự hiện đại và tính thẩm mỹ, tạo ra một cái nhìn đầy ấn tượng và sang trọng. Máy có màn hình lớn với tỷ lệ khung hình cao, tạo ra một không gian hiển thị rộng lớn, đồng thời mang đến sự gọn gàng và hiện đại cho điện thoại.	https://cdn.tgdd.vn/Products/Images/42/323002/realme-c65-3-1.jpg	Vẻ ngoài đẹp mắt thu hút ánh nhìn	45
359	Mặt sau thể hiện sự tinh tế và chắc chắn với vật liệu nhựa cao cấp. Thiết kế của máy mang đậm dấu ấn của thương hiệu, với cụm camera được đặt dọc trong cụm module hình chữ nhật, tạo điểm nhấn độc đáo.  Cạnh viền của máy cũng được làm bằng nhựa chất lượng cao, tạo ra một sự đồng nhất và bền bỉ cho sản phẩm. Việc gia công cạnh viền được thực hiện một cách cẩn thận, không chỉ tạo ra một diện mạo trơn tru mà còn giúp bạn có cảm giác thoải mái khi cầm nắm trong thời gian dài.			45
360	Màn hình của realme C65 là một điểm nhấn đáng chú ý, mang đến trải nghiệm hình ảnh chân thực và rõ nét. Với công nghệ màn hình IPS LCD, realme C65 cung cấp màu sắc trung thực và góc nhìn rộng, giúp bạn có được trải nghiệm hình ảnh tốt từ nhiều góc độ.		Xem video chân thực với tấm nền IPS LCD	45
361	Với độ phân giải HD+ (720 x 1604 Pixels) giúp hình ảnh trở nên chi tiết hơn, cung cấp một trải nghiệm xem video và chơi game ở mức hiển thị khá tốt. Kích thước màn hình rộng lên đến 6.67 inch, cùng với tần số quét 90 Hz, tạo ra một không gian hiển thị lớn và mượt mà, giúp bạn thưởng thức nội dung với sự thoải mái tối đa.	https://cdn.tgdd.vn/Products/Images/42/323002/realme-c65-4-1.jpg		45
362	realme C65 đi kèm với bộ vi xử lý Helio G85 mạnh mẽ, kết hợp với RAM 8 GB và bộ nhớ lưu trữ 256 GB, đảm bảo cho việc thực hiện các ứng dụng, trò chơi và nhiều tác vụ một cách mượt mà và ổn định. Với sức mạnh này, người dùng có thể thoải mái trải nghiệm các hoạt động trực tuyến hay tham gia vào các trò chơi nhẹ mà không cần phải lo lắng về sự gián đoạn hoặc giảm hiệu suất.	https://cdn.tgdd.vn/Products/Images/42/323002/realme-c65-2-1.jpg	Hiệu năng ổn định với các tác vụ hằng ngày	45
363	Chiếc điện thoại realme này là một trong những lựa chọn lý tưởng cho những ai đòi hỏi sự hiệu quả và mượt mà trong mọi tình huống sử dụng. Với khả năng xử lý đa nhiệm và chạy các ứng dụng nặng một cách mượt mà, điện thoại RAM 8 GB này hứa hẹn mang lại trải nghiệm tuyệt vời.			45
364	Ở mặt sau, realme C65 được trang bị một hệ thống camera đa chức năng, bao gồm camera chính 50 MP và cảm biến hỗ trợ Flicker, cho phép bạn chụp ảnh sắc nét và chi tiết, với màu sắc trung thực và độ tương phản tốt.	https://cdn.tgdd.vn/Products/Images/42/323002/realme-c65-1-1.jpg	Chụp ảnh đẹp mắt qua một lần chạm	45
365	realme C65 cũng được trang bị nhiều tính năng chụp ảnh thông minh, như chế độ ban đêm, xóa phông,... giúp tối ưu hóa quá trình chụp ảnh. Tính năng chụp ảnh HDR cũng giúp cân bằng độ sáng và độ tương phản, tạo ra những bức ảnh sống động và đẹp mắt.			45
366	Với viên pin lớn dung lượng 5000 mAh, realme C65 cung cấp nguồn năng lượng mạnh mẽ để sử dụng suốt cả ngày mà không cần lo lắng về việc sạc lại. Điều này rất hữu ích cho những ai có lối sống sôi động hoặc cần sử dụng điện thoại nhiều trong công việc hằng ngày mà không muốn bị gián đoạn bởi việc sạc pin liên tục.	https://cdn.tgdd.vn/Products/Images/42/323002/realme-c65-6.jpg	Dùng lâu hơn với viên pin 5000 mAh	45
367	realme C65 không chỉ là một chiếc điện thoại với thiết kế đẹp mắt và hiệu năng ổn định, mà còn là một người bạn đồng hành đáng tin cậy. Từ khả năng chụp ảnh đến hiệu suất mượt mà và thời lượng pin lâu dài, realme C65 đáp ứng mọi nhu cầu của người dùng hiện đại.			45
381	TCL 40 NXTPAPER có thiết kế tinh tế, thanh lịch, với phong cách vuông vức, mang đến cho bạn cảm giác sang trọng và hiện đại. Các góc máy được bo tròn một cách khéo léo, đảm bảo rằng người dùng có thể cầm nắm dễ dàng, không bị cấn tay.	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-khung-vien.jpg	Thiết kế hiện đại và tiện lợi	47
382	TCL 40 NXTPAPER sử dụng kiểu dáng màn hình nốt ruồi để đặt camera selfie, giúp tối đa hóa diện tích hiển thị mà vẫn giữ được thiết kế thanh lịch, không bị chặn tầm nhìn hay làm gián đoạn trải nghiệm khi sử dụng.			47
383	Mặt sau của chiếc điện thoại TCL này được thiết kế đơn giản, không có quá nhiều chi tiết phức tạp, tạo nên vẻ đẹp tinh tế và dễ dàng vệ sinh, bảo quản. Việc sử dụng các gam màu tươi sáng cũng làm cho điện thoại này phù hợp với người dùng trẻ tuổi, nhưng vẫn giữ được sự sang trọng phù hợp với người trưởng thành.	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-mau-sac.jpg		47
384	Với màn hình lên tới 6.78 inch, TCL 40 NXTPAPER đem đến cho bạn không gian hiển thị rộng lớn, thoải mái khi xem video, chơi game hay thực hiện các tác vụ hằng ngày. Màn hình có độ phân giải Full HD+, giúp tăng cường độ sắc nét và chi tiết của hình ảnh, đem lại trải nghiệm xem phim, chơi game đầy sống động và chân thực.	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-man-hinh.jpg	Nâng cao chất lượng hình ảnh	47
385	Bên cạnh đó, với tần số quét 90 Hz, giúp cho các thao tác vuốt chạm trên màn hình được mượt mà hơn, đặc biệt khi chơi game hoặc xem các video có nội dung chuyển động nhanh.  Điểm nổi bật nhất có lẽ là công nghệ hình ảnh NXTPAPER của TCL. NXTPAPER cung cấp cho người dùng chất lượng hình ảnh tuyệt vời, với độ tương phản cao, giúp hình ảnh trở nên sắc nét và rõ ràng hơn bao giờ hết. Đặc biệt, công nghệ này còn giúp tiết kiệm năng lượng và giảm lượng ánh sáng xanh gây hại cho mắt người dùng, vừa bảo vệ mắt, vừa tăng thời gian sử dụng.			47
386	Sản phẩm còn sở hữu hiệu ứng âm thanh vòm DTS, hứa hẹn mang lại cho bạn trải nghiệm âm thanh tròn đầy và hấp dẫn. Với TCL 40 NXTPAPER, bạn sẽ có cơ hội thưởng thức những bản nhạc yêu thích với chất âm chân thực và to rõ.	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-am-thanh.jpg	Trải nghiệm âm thanh 3D	47
387	Về mặt hiệu năng, TCL 40 NXTPAPER sử dụng chipset MediaTek Helio G88, một lựa chọn phổ biến trong tầm giá, mang lại hiệu suất ổn định và mượt mà cho các tác vụ hằng ngày và chơi game. Máy được trang bị RAM 8 GB, giúp cho việc chạy đa nhiệm mà không lo vấn đề lag hoặc chậm trễ.	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-hieu-nang.jpg	Hiệu năng sử dụng mượt mà	47
388	Ngoài ra, bộ nhớ lên đến 256 GB trên TCL 40 NXTPAPER đảm bảo bạn có đủ không gian lưu trữ cho dữ liệu, hình ảnh và video mà không cần lo lắng về việc cạn kiệt bộ nhớ. Nếu có nhu cầu cao hơn, người dùng có thể mở rộng qua thẻ MicroSD lên tới 2 TB, một lợi ích đáng kể cho những người dùng yêu thích việc lưu trữ lượng lớn nội dung hay dữ liệu làm việc.	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-luu-tru.jpg		47
389	TCL 40 NXTPAPER nổi bật với viên pin có dung lượng lớn, lên tới 5010 mAh, mang lại cho người dùng khả năng sử dụng thiết bị từ sáng đến tối mà không cần lo lắng về việc sạc giữa chừng.  Ngoài dung lượng pin lớn, TCL 40 NXTPAPER còn hỗ trợ công nghệ sạc nhanh 33 W, giúp tiết kiệm thời gian sạc đầy pin một cách đáng kể, đảm bảo người dùng có thể quay trở lại sử dụng điện thoại của mình trong thời gian ngắn nhất.	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-pin.jpg	Sử dụng thoải mái cả ngày dài	47
390	Camera chính của TCL 40 NXTPAPER có độ phân giải lên đến 50 MP, đảm bảo mỗi bức ảnh bạn chụp đều có chi tiết rõ nét và chân thực. Với độ phân giải cao, camera giúp bắt trọn từng chi tiết, từ những bông hoa nhỏ đến kết cấu của một tòa nhà, mà không làm mất đi độ sắc nét khi phóng to ảnh.	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-camera.jpg	Khả năng chụp ảnh sắc nét	47
391	Camera góc siêu rộng 5 MP trên TCL 40 NXTPAPER giúp mở rộng tầm nhìn, cho phép chụp toàn cảnh ấn tượng, lý tưởng cho việc khi đi du lịch mà không để bỏ lỡ bất kỳ chi tiết nào. Với camera macro 2 MP, bạn có thể khám phá vẻ đẹp của những chi tiết nhỏ nhất, từ cánh hoa đến hạt sương, cũng như chụp sản phẩm một cách chi tiết và rõ nét.	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-macro.jpg		47
392	Chế độ ban đêm của điện thoại giúp bạn ghi lại những khoảnh khắc buổi tối tuyệt vời nhất, ngay cả trong điều kiện ánh sáng yếu. Công nghệ này giúp tối ưu hóa ánh sáng, giảm nhiễu và tăng cường chi tiết, cho phép bạn chụp được những bức ảnh được rõ nét hơn.	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-chup-dem.jpg		47
393	Tóm lại, với hàng loạt tính năng nổi bật và thiết kế tối ưu, TCL 40 NXTPAPER hứa hẹn là sản phẩm không thể bỏ qua cho những người yêu thích công nghệ. Với âm thanh sống động, hình ảnh sắc nét, cùng với hiệu năng mạnh mẽ, máy mang đến trải nghiệm hoàn hảo và đáng nhớ cho người dùng.			47
394	Chiếc điện thoại TCL này gây ấn tượng ngay từ cái nhìn đầu tiên với thiết kế bo tròn tại các góc, mang lại cảm giác cầm nắm vô cùng thoải mái cho người dùng.	https://cdn.tgdd.vn/Products/Images/42/324994/tcl-406s-thiet-ke.jpg	Thiết kế cuốn hút	48
395	Mặt trước thiết kế theo dạng giọt nước, viền màn hình làm đều nhau, tạo sự cân đối. Dù phần viền dưới có phần hơi dày, nhưng đây lại là một điều không thể tránh khỏi ở phân khúc giá rẻ và không gây cản trở đến trải nghiệm tổng thể.  Mặt lưng được tạo điểm nhấn với vân xọc giúp chống trượt, đồng thời cụm camera sau được thiết kế đồng nhất với màu sắc mặt lưng, tăng thêm vẻ đẹp và tính nhất quán cho sản phẩm.	https://cdn.tgdd.vn/Products/Images/42/324994/tcl-406s-mat-lung.jpg		48
396	Màn hình 6.6 inch ​​cung cấp một không gian lớn cho mọi hoạt động, từ xem phim, đọc báo, chơi game cho đến việc sử dụng ứng dụng hằng ngày một cách thoải mái. Về mặt độ phân giải, TCL 406s có màn hình HD+ làm cho hình ảnh trở nên sắc nét hơn so với nhiều điện thoại cùng tầm giá.	https://cdn.tgdd.vn/Products/Images/42/324994/tcl-406s-man-hinh.jpg	Màn hình lớn, hiển thị đẹp mắt	48
397	Bên cạnh đó, TCL 406s còn sở hữu loa âm thanh nổi kép, mang đến chất lượng âm thanh mạnh mẽ, rõ ràng. Điều này giúp cải thiện đáng kể trải nghiệm khi lướt web, xem video, nghe nhạc hay thực hiện cuộc gọi video.	https://cdn.tgdd.vn/Products/Images/42/324994/tcl-406s-loa-kep.jpg	Âm thanh nổi kép ấn tượng	48
398	Được trang bị viên pin 5000 mAh, điện thoại cho phép sử dụng lên tới 2 ngày với các tác vụ cơ bản, và thậm chí nhiều hơn nếu sử dụng chế độ tiết kiệm pin kèm theo trong máy. Điện thoại hỗ trợ công suất sạc 10 W qua cổng Type-C, dù không phải là con số ấn tượng nhất, nhưng hoàn toàn phù hợp và xứng đáng với mức giá thành của sản phẩm này.	https://cdn.tgdd.vn/Products/Images/42/324994/tcl-406s-pin.jpg	Pin trâu, hoạt động lâu dài	48
399	Được trang bị chip Helio P22, TCL 406s hướng tới việc cung cấp một trải nghiệm ổn định cho người dùng trong các tác vụ hằng ngày như nghe gọi, xem phim, lướt web và giải trí với vài tựa game nhẹ. TCL 406s đi kèm với 4 GB RAM và nổi bật hơn là khả năng mở rộng RAM ảo thêm 4 GB, giúp cho điện thoại có khả năng đa nhiệm tốt hơn, giảm thiểu tình trạng giật, lag khi mở nhiều ứng dụng cùng lúc.	https://cdn.tgdd.vn/Products/Images/42/324994/tcl-406s-trai-nghiem.jpg	Hiệu năng ổn định	48
400	Về chụp ảnh, chiếc điện thoại Android này có camera chính 13 MP AI và camera phụ 2 MP đo độ sâu. Trong điều kiện ánh sáng đầy đủ, camera chính có thể chụp được những bức hình sắc nét, màu sắc tự nhiên, đáp ứng tốt cho việc chia sẻ lên các mạng xã hội hoặc lưu giữ kỷ niệm. Camera đo độ sâu, mang lại hiệu ứng nền mờ cho ảnh khi chụp chế độ chân dung, giúp người dùng có thể tạo ra những bức hình có độ chuyên nghiệp.	https://cdn.tgdd.vn/Products/Images/42/324994/tcl-406s-camera.jpg	Camera đủ dùng, chụp ảnh cơ bản	48
401	Camera trước 5 MP hỗ trợ AI là một tiện ích tuyệt vời, giúp nhận diện khuôn mặt và tự động lấy nét mà không cần người dùng phải tương tác nhiều. Đây là một đặc điểm nổi bật trong phân khúc giá rẻ, giúp việc chụp ảnh tự sướng trở nên nhanh chóng và dễ dàng.	https://cdn.tgdd.vn/Products/Images/42/324994/tcl-406s-selfie.jpg		48
402	TCL 406s là một lựa chọn đáng cân nhắc trong phân khúc giá rẻ, với thiết kế thời trang, hiệu suất ổn định, pin bền bỉ và một số tính năng nổi bật khác. Một chiếc điện thoại hoàn hảo cho những ai tìm kiếm trải nghiệm công nghệ tốt mà không cần phải chi trả một khoản quá lớn.			48
403	Thiết kế của Galaxy S24 Ultra có thể xem là một điểm nâng cấp nổi bật trong dòng điện thoại flagship của Samsung ở năm 2024. Bên cạnh đó, sự thay đổi này cũng tạo nên một số ý kiến trái chiều cho rằng hãng đang lười làm mới sản phẩm của mình khi đem nguyên kiểu thiết kế cũ sang và thay đổi ở phần chất liệu.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-1-1020x570.jpg	Thiết kế sang trọng và có sử dụng Titanium	49
404	Ấn tượng đầu tiên khi được cầm Galaxy S24 Ultra trên tay là máy rất sang, hãng đã không làm bo cong màn hình hay mặt lưng như các phiên bản trước đó nữa, mà thay vào đó là cách tạo hình phẳng phiu ở mặt lưng và màn hình giúp tạo nên tính đồng bộ. Có thể nói, 2024 là năm mà Samsung làm mẫu điện thoại Ultra được phẳng nhất trong vài năm trở lại đây.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-2-1020x570.jpg		49
405	Ở phần khung viền, năm nay Samsung làm nó lớn hơn so với thế hệ tiền nhiệm, nó có phần bo cong nhẹ ở vị trí giao nhau với mặt lưng và màn hình nên khi cầm cực kỳ đã tay. Kể cả khi cầm chặt, mình dường như không cảm thấy bị cấn một tí nào cả.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-3-1020x570.jpg		49
406	Ngoài ra, viền Titanium còn được đánh giá cao nhờ độ bền tốt hơn các kim loại thông thường. Điều này giúp điện thoại bền bỉ hơn trước những tình huống như vô tình rơi gây va đập hay thậm chí hạn chế để lại vết hằn xước khi tiếp xúc với các vật sắc, nhọn.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-5-1020x570.jpg		49
407	Galaxy S24 Ultra được trang bị tấm nền Dynamic AMOLED 2X, độ phân giải 2K+ (1440 x 3120 Pixels) và độ sáng 2600 nits. Về trải nghiệm thực tế, điện thoại mang đến cho mình chất lượng hình ảnh hết sức đẹp mắt, mọi thứ đều được tái hiện lại một cách rực rỡ và sinh động, kết hợp cùng đó là màu đen sâu cho ra trải nghiệm chân thực.		Màn hình lớn có độ phân giải cao 2K+	49
408	Với độ sáng màn hình cao, điện thoại giúp mình có thể làm việc hay giải trí dù ở bất kỳ đâu mà không gây khó khăn. Kể cả khi ngồi ở công viên hay vừa di chuyển ngoài trời và xem bản đồ cũng không bị ánh nắng chiếu vào gây ảnh hưởng.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-7-1020x570.jpg		49
409	Về kích thước màn hình và tần số quét trên Galaxy S24 Ultra, mọi thứ gần như không có gì thay đổi so với thế hệ cũ, vẫn sẽ là 6.8 inch đi cùng 120 Hz có thể linh hoạt điều chỉnh dựa theo nội dung bạn đang xem. Với mức giá bán cao, việc trang bị các thông số này cũng không phải gọi là quá ấn tượng, giá mà hãng nâng cấp lên 144 Hz để chơi game FPS cao có lẽ sẽ hấp dẫn hơn với những bạn hay chơi game như mình.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-8-1020x570.jpg		49
410	Về phần camera trên chiếc điện thoại chụp ảnh, quay phim này, máy được trang bị bộ 4 camera ở mặt sau với camera chính 200 MP, kết hợp cùng với đó là camera góc siêu rộng 12 MP và hai camera tele hỗ trợ zoom quang học có độ phân giải lần lượt là 10 MP và 50 MP.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-9-1020x570.jpg	Camera 200 MP và hỗ trợ chụp zoom ở mức cao	49
411	Với môi trường có nhiều ánh sáng như ngoài trời, điện thoại thu được các bức ảnh có màu sắc rực rỡ thông qua chế độ 12 MP ở camera chính, những nơi có chi tiết nhỏ như lá cây hay người ở đằng xa đều được tái hiện lại sắc nét. Hơn hết, những vùng có độ sáng cao cũng được xử lý tốt để ảnh không bị quá chói, từ đó đem lại bức ảnh đẹp mắt hơn.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-12-1020x570.jpg		49
412	Về mặt cấu hình, chiếc điện thoại cấu hình cao này tích hợp con chip Snapdragon 8 Gen 3 for Galaxy đến từ nhà Qualcomm. Không chỉ mạnh mẽ để phục vụ chơi game cấu hình cao như trước đây, năm nay Samsung còn khai thác nó để xử lý các tác vụ liên quan đến AI trở nên nhanh chóng hơn.		Cấu hình mạnh mẽ với chip Snapdragon 8 Gen 3 for Galaxy	49
413	Ở các bài test thông qua phần mềm đo điểm hiệu năng, Galaxy S24 Ultra cho ra số điểm rất cao khi đạt được 2130 điểm đơn nhân, 6354 điểm đa nhân trên Geekbench 6 và 18215 điểm tổng trên PCMark. Với số điểm cao, điều này giúp Galaxy S24 Ultra trở thành một trong những chiếc điện thoại Android mạnh mẽ nhất thị trường hiện nay.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-27-1020x570.jpg		49
414	Galaxy S24 Ultra được hỗ trợ nhiều tính năng có tích hợp sẵn AI, các công nghệ này được đề cập khá nhiều tại sự kiện ra mắt sản phẩm mới vừa qua của Samsung. Theo sau đó, cụm từ AI bỗng trở nên sốt hơn bao giờ hết và vô tình tạo làn sóng công nghệ trên các thiết bị di động.		Hỗ trợ nhiều tính năng AI	49
415	Khoanh vùng tìm kiếm  Tính năng đầu tiên mà mình muốn chia sẻ đến đó là “Khoanh vùng tìm kiếm”. Dù bạn đang thao tác ở bất kỳ tác vụ nào và bạn muốn tìm kiếm một cái gì đó ngay lập tức, điện thoại sẽ giúp bạn thực hiện nó trong tức khắc chỉ trong vài thao tác cơ bản.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-30-1020x570.jpg		49
416	Tóm tắt và dịch trang web  Với xu hướng tìm kiếm thông tin ngày càng gia tăng, không chỉ ở trong nước mà các trang web nước ngoài cũng cực kỳ hấp dẫn và chứa đựng nhiều nguồn dữ liệu đáng giá. Tuy nhiên, rào cản ngôn ngữ vẫn luôn ở đó và không phải ai cũng am hiểu nhiều loại ngôn ngữ, điều này tạo nên sự cản trở khiến bạn tiếp xúc với nội dung này khó khăn hơn.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-31-1020x570.jpg		49
417	Dịch trực tiếp cuộc gọi  Ở chế độ dịch trực tiếp cuộc gọi, chiếc điện thoại Samsung này sẽ ngay lập tức chuyển đổi giọng nói của đối phương thành dạng văn bản thuần túy ngay trên màn hình. Tính năng này mình nghĩ sẽ phù hợp với những bạn là du học sinh hay doanh nhân, đang cố gắng kết nối với một người bạn ngoại quốc khi kỹ năng ngoại ngữ chưa được vững cho lắm.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-32-1020x570.jpg		49
418	Chỉnh sửa ảnh thông qua AI  Với sự giúp sức từ AI, giờ đây mình có thể thực hiện việc xóa các chủ thể không cần thiết hay thậm chí là di chuyển đối tượng một cách nhanh chóng và chính xác. Đặc biệt, tốc độ xử lý của điện thoại cho ra khá nhanh, những vùng trống sau khi xử lý cũng được lấp đầy bằng những chi tiết khá giống với vùng lân cận. Bởi vậy mà kết quả làm mình rất ưng và cực kỳ thích.	https://cdn.tgdd.vn/Products/42/307174/samsung-galaxy-s24-ultra-5g-33-1020x570.jpg		49
419	Galaxy S24 Ultra là một chiếc điện thoại cao cấp với thiết kế đẹp mắt, hiệu năng mạnh mẽ, hệ thống camera chất lượng và thời lượng pin ấn tượng. Sản phẩm là sự lựa chọn hàng đầu cho những người dùng yêu thích công nghệ, muốn có một chiếc điện thoại đáp ứng mọi nhu cầu sử dụng. Hứa hẹn sẽ trở thành cái tên gây chú ý trong thời gian dài khi đây thực sự là một sản phẩm tốt trong năm 2024.			49
420	Galaxy A35 5G được thiết kế một cách tinh tế và hiện đại, mang lại cảm giác sang trọng và đẳng cấp ngay từ cái nhìn đầu tiên. Với màn hình nốt ruồi, viền siêu mỏng và tỷ lệ khung hình cao, điện thoại này tạo ra một trải nghiệm xem phim và chơi game mượt mà, hấp dẫn.	https://cdn.tgdd.vn/Products/Images/42/321772/samsung-galaxy-a35-5g-140324-101323.jpg	Màu sắc trẻ trung bật tung cá tính	50
421	Galaxy A35 5G với kích thước vừa phải, dễ cầm nắm và sử dụng thoải mái. Mặt lưng làm từ kính cao cấp, mang lại độ chắc chắn và sang trọng. Ngoài ra, nhiều tùy chọn màu sắc phong phú giúp bạn lựa chọn theo sở thích cá nhân. Điện thoại còn có khối lượng 209 g và cạnh bo tròn mềm mại, tạo cảm giác ổn định khi cầm, giảm mệt mỏi khi sử dụng lâu dài.	https://cdn.tgdd.vn/Products/Images/42/321772/samsung-galaxy-a35-5g-140324-101329.jpg		50
422	Galaxy A35 5G được trang bị màn hình Super AMOLED với độ phân giải Full HD+ (1080 x 2340 Pixels), cho ra hình ảnh sống động và chi tiết. Màn hình rộng 6.6 inch với tần số quét 120 Hz mang lại trải nghiệm xem phim, chơi game và lướt web mượt mà.	https://cdn.tgdd.vn/Products/Images/42/321772/samsung-galaxy-a35-5g-140324-101328.jpg	Màn ảnh sắc nét cho góc nhìn rộng rãi	50
423	Với độ sáng tối đa lên đến 1000 nits, màn hình của Galaxy A35 5G cho phép bạn dễ dàng sử dụng dưới ánh nắng mặt trời mà không gặp khó khăn. Điều này làm cho việc sử dụng điện thoại ở môi trường ngoài trời như kiểm tra tin nhắn, xem bản đồ trở nên thuận lợi hơn.  Bảo vệ cho màn hình là lớp kính cường lực Corning Gorilla Glass 7, giúp chống trầy xước và hạn chế hư hỏng khi máy va chạm hoặc rơi rớt. Điều này cung cấp sự bảo vệ tốt cho màn hình, giúp cho điện thoại luôn được mới mẻ.			50
424	Galaxy A35 5G là một chiếc điện thoại có hiệu năng mạnh mẽ, được trang bị hệ điều hành Android 14, một trong những phiên bản mới nhất của hệ điều hành Android, cung cấp cho bạn trải nghiệm sử dụng mượt mà và tiện lợi nhất.  Đi kèm với đó là chip xử lý Exynos 1380 8 nhân, với 4 nhân tốc độ cao 2.4 GHz và 4 nhân tiết kiệm điện năng 2 GHz. Sự kết hợp giữa các nhân giúp Galaxy A35 5G xử lý các tác vụ đa nhiệm và ứng dụng nặng một cách mượt mà và hiệu quả.	https://cdn.tgdd.vn/Products/Images/42/321772/samsung-galaxy-a35-5g-140324-101326.jpg	Sức mạnh đến từ chip Exynos 1380	50
425	Điện thoại RAM 8 GB này sẽ cung cấp sự linh hoạt và nhanh chóng trong việc chuyển đổi giữa các ứng dụng và tác vụ. Điện thoại cung cấp dung lượng lưu trữ lớn lên đến 256 GB, cho phép bạn lưu một lượng lớn dữ liệu như ảnh và video mà không cần lo lắng về không gian. Ngoài ra, điện thoại cũng hỗ trợ thẻ nhớ MicroSD lên đến 1 TB, giúp mở rộng dung lượng nếu cần thiết.			50
426	Chiếc điện thoại Samsung này được trang bị hệ thống camera đa chức năng, mang lại cho bạn khả năng chụp ảnh và quay video chất lượng cao trong mọi tình huống.  Camera sau của Galaxy A35 5G có độ phân giải lớn, với camera chính lên đến 50 MP, kèm theo camera phụ 8 MP và 5 MP. Điều này cho phép bạn chụp ảnh chi tiết và sắc nét, cũng như khám phá nhiều góc cạnh và khả năng sáng tạo trong việc chụp ảnh.		Chụp ảnh đẹp với camera 50 MP	50
427		https://cdn.tgdd.vn/Products/Images/42/321772/samsung-galaxy-a35-5g-140324-101331.jpg		50
428	Galaxy A35 5G được trang bị viên pin dung lượng lớn, lên đến 5000 mAh, cung cấp nguồn năng lượng cho thiết bị trong thời gian dài. Với dung lượng pin rộng rãi như vậy, bạn có thể thoải mái sử dụng chiếc điện thoại Samsung Galaxy A này trong suốt cả ngày mà không cần lo lắng về việc sạc pin.	https://cdn.tgdd.vn/Products/Images/42/321772/samsung-galaxy-a35-5g-140324-101325.jpg	Sử dụng thả ga không lo về sạc	50
429	Samsung Galaxy A35 5G 256GB mang đến cho bạn trải nghiệm đa dạng và tuyệt vời. Với thiết kế hiện đại, hiệu năng mạnh mẽ, hệ thống camera đa chức năng, màn hình lớn và pin dung lượng cao, chiếc điện thoại sẽ đáp ứng đầy đủ nhu cầu của bạn trong cuộc sống hằng ngày.			50
430	Cho đến nay thì kiểu dáng thiết kế vuông vức như thế hệ iPhone 13 series vẫn được người dùng rất ưa chuộng vậy nên Apple đã giữ nguyên tạo hình này trên iPhone 14 Pro Max, các cạnh và hai mặt được gia công phẳng giúp cho điện thoại toát lên vẻ ngoài sang trọng đầy tính thời thượng.	https://cdn.tgdd.vn/Products/Images/42/289705/iphone-14-pro-max-1tb-090922-051134.jpg	Kiểu dáng thiết kế sang trọng và cao cấp	51
431	Một trong những điểm nổi bật về thiết kế trên phiên bản này chính là vùng cảm biến chứa camera ở phần mặt trước, thay vì cụm tai thỏ thì giờ đây hãng đã tinh chỉnh lại thành hình dạng khá giống viên thuốc giúp mang lại trải nghiệm sử dụng mới lạ cũng như tăng không gian hiển thị trên màn hình.	https://cdn.tgdd.vn/Products/Images/42/289705/iphone-14-pro-max-1tb-090922-051147.jpg		51
432	Được trang bị màn hình có kích thước lên tới 6.7 inch nên iPhone 14 Pro Max sẽ có khả năng tái hiện hình ảnh to rõ, văn bản cũng sẽ được trình chiếu nhiều hơn để phục vụ tốt cho các tác vụ đọc báo, lướt xem tin tức online.	https://cdn.tgdd.vn/Products/Images/42/289705/iphone-14-pro-max-1tb-090922-051141.jpg	Trải nghiệm thích hơn trên màn hình lớn	51
433	Đi kèm với đó sẽ là công nghệ màn hình OLED cao cấp cùng với sự tinh chỉnh và đo đạc kỹ lưỡng đến từ nhà Apple, giúp cho iPhone 14 Pro Max trở thành một sản phẩm có khả năng tái hiện màu sắc có độ chính xác cao bậc nhất thị trường điện thoại.  Với tần số quét 120 Hz mà Apple hỗ trợ cho máy nên tốc độ phản hồi của màn hình được nâng cao, vuốt chạm cơ bản hay chơi nhiều tựa game đều được diễn ra trơn tru và mượt mắt.			51
434	Lần này Appe vẫn sẽ trang bị cho máy 3 camera sau nhưng sẽ được tinh chỉnh với kích thước lớn hơn thế hệ trước, nhằm mang lại khả năng lấy sáng tốt hơn hay thu được nhiều chi tiết hơn trên bức ảnh.	https://cdn.tgdd.vn/Products/Images/42/289705/iphone-14-pro-max-1tb-090922-051143.jpg	Chụp ảnh chất lượng cao như một nhiếp ảnh gia thực thụ	51
435	Với camera chính nâng cấp lên đến 48 MP được xem là sự đột phá rất lớn so với các dòng iPhone trước đây, không chỉ giúp bạn có thể lưu lại nhiều bức ảnh sắc nét hơn mà máy còn có khả năng quay được những thước phim chuẩn điện ảnh 4K.	https://cdn.tgdd.vn/Products/Images/42/289705/iphone-14-pro-max-1tb-090922-051145.jpg		51
436	Điện thoại sẽ được trang bị con chip mới do Apple sản xuất mang tên A16 Bionic 6 nhân, không chỉ đem đến cho thiết bị một hiệu năng hàng đầu thế giới mà đây còn là vi xử lý có thể tối ưu được thời lượng pin nhờ quy trình sản xuất tiên tiến và nhiều thuật toán xử lý thông minh đi kèm.	https://cdn.tgdd.vn/Products/Images/42/289705/iphone-14-pro-max-1tb-090922-051138.jpg	Hiệu năng cực khủng	51
437	Với sự phối hợp của hệ điều hành iOS 16 trên một chiếc điện thoại RAM 6 GB nên mọi thao tác, cử chỉ đa nhiệm đều được máy xử lý trơn tru và mượt mà. Ngoài ra Apple còn bổ sung thêm nhiều tính năng nhằm làm cho dòng sản phẩm iPhone 14 trở nên nổi trội hơn so với nhiều đối thủ khác.	https://cdn.tgdd.vn/Products/Images/42/289705/iphone-14-pro-max-1tb-090922-051136.jpg		51
438	Nếu bạn đang cần cho mình một chiếc điện thoại mang trong mình bộ thông số khủng cùng giá trị thương hiệu và độ nhận diện cực cao, thì chắc chắn iPhone 14 Pro Max sẽ là một lựa chọn rất đáng mua tính đến thời điểm hiện tại.			51
439	Camera IMOU được trang bị ống kính cố định 5 MP và ống kính PTZ 5 MP, mang lại chất lượng hình ảnh sắc nét và rõ ràng. Độ phân giải cao giúp bạn dễ dàng quan sát chi tiết các đối tượng, đảm bảo an ninh tối đa cho khu vực giám sát.	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-6.jpg	Độ phân giải cao, hình ảnh rõ nét	52
440	Với khả năng xoay ngang 355 độ và xoay dọc 90 độ, camera này cung cấp góc nhìn rộng, cho phép bạn giám sát toàn cảnh mà không bỏ sót bất kỳ góc khuất nào. Sự linh hoạt trong việc điều chỉnh góc nhìn giúp bạn dễ dàng theo dõi mọi hoạt động trong khu vực quan sát.	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-5-2.jpg	Góc nhìn siêu rộng	52
601	Máy tính bảng này được trang bị viên pin có dung lượng 5100 mAh cho ra thời lượng sử dụng tương đối dài lâu. Lenovo cho biết Tab M9 sẽ cung cấp lên đến 13 giờ phát video liên tục chỉ với một lần sạc.	https://cdn.tgdd.vn/Products/Images/522/306923/lenovo-tab-m9-pin.jpg	Nắm bắt trọn vẹn mọi thông tin	72
441	Thiết kế nhỏ gọn với màu trắng trang nhã, camera dễ dàng lắp đặt ở nhiều vị trí khác nhau như bàn, tường hoặc trần nhà,... Đặc biệt, camera này đạt tiêu chuẩn chống nước và bụi IP66, đảm bảo hoạt động ổn định trong mọi điều kiện thời tiết.	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-4-2.jpg	Kiểu dáng gọn gàng, chắc chắn	52
442	Camera giám sát này được trang bị 4 chế độ tầm nhìn ban đêm, giúp bạn giám sát hiệu quả trong điều kiện ánh sáng yếu:  • Chế độ hồng ngoại IR: Cung cấp hình ảnh trắng đen rõ nét.  • Chế độ ban đêm có màu: Nhờ vào đèn LED, cho hình ảnh màu sắc sống động ngay cả trong đêm tối.  • Chế độ tắt riêng tư: Tắt hoàn toàn camera khi không cần giám sát để đảm bảo sự riêng tư.  • Chế độ thông minh: Tự động chuyển sang chế độ có màu khi phát hiện người lạ, đèn LED sẽ bật và chiếu vào đối tượng để tăng cường khả năng nhận diện.	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-3-2.jpg	4 chế độ tầm nhìn ban đêm thông minh	52
443	Với đàm thoại 2 chiều, bạn có thể dễ dàng giao tiếp trực tiếp với người trong khu vực giám sát thông qua ứng dụng Imou Life, khi được tích hợp loa và micro trên camera.  Khả năng phát hiện chính xác chuyển động con người và phương tiện, đảm bảo bạn không bỏ lỡ bất kỳ hoạt động bất thường nào. Camera sẽ phát đèn và còi cảnh báo khi phát hiện người lạ, giúp tăng cường an ninh cho khu vực.	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-2-2.jpg	Đa dạng các tiện ích tiên tiến	52
444	Camera này hỗ trợ kết nối wifi 2.4 GHz, giúp bạn dễ dàng điều khiển và giám sát từ xa qua ứng dụng Imou Life. Sản phẩm còn hỗ trợ khe cắm thẻ nhớ lên đến 256 GB, cho phép bạn lưu trữ và quản lý dữ liệu video một cách tiện lợi.	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-1-1.jpg	Lưu trữ tiện lợi với thẻ nhớ MicroSD 256 GB	52
445	Camera IP Ngoài trời 360 Độ 5MP IMOU Cruiser Dual S7XP-10M0WED là một giải pháp an ninh toàn diện, mang lại sự an tâm và bảo vệ tối đa cho gia đình bạn. Với độ phân giải cao, góc nhìn rộng, thiết kế nhỏ gọn, khả năng chống nước bụi, và nhiều tính năng thông minh, sản phẩm này chắc chắn sẽ đáp ứng mọi nhu cầu giám sát của bạn. 			52
446	Với tone màu trắng trang nhã và thiết kế nhỏ gọn, IMOU Cruiser 2 có thể dễ dàng lắp đặt trên bàn, tường hoặc trần nhà, phù hợp với mọi không gian. Thiết kế này không chỉ mang lại tính thẩm mỹ cao mà còn giúp việc lắp đặt trở nên đơn giản hơn.	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-6.jpg	Thiết kế nhỏ gọn, tiện lợi	53
447	Camera IMOU này được trang bị cảm biến hình ảnh có độ phân giải 5 MP, mang lại chất lượng hình ảnh sắc nét và chi tiết. Độ phân giải cao giúp bạn dễ dàng nhận diện khuôn mặt, biển số xe và các chi tiết quan trọng khác, đảm bảo bạn không bỏ lỡ bất kỳ điều gì trong quá trình giám sát.	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-5-2.jpg	Độ phân giải cao lên đến 20 MP 	53
448	Camera giám sát này được thiết kế với khả năng chống nước và bụi chuẩn IP66, đảm bảo hoạt động bền bỉ trong mọi điều kiện thời tiết khắc nghiệt. Bạn có thể yên tâm sử dụng camera ngoài trời mà không lo lắng về độ bền và hiệu suất.	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-4-2.jpg	Chống nước và bụi chuẩn IP66	53
449	Camera này hỗ trợ 4 chế độ tầm nhìn ban đêm, đảm bảo giám sát hiệu quả trong mọi điều kiện ánh sáng:    - Chế độ hồng ngoại IR: Cung cấp hình ảnh trắng đen rõ nét.    - Chế độ ban đêm có màu: Nhờ vào đèn spotlight, cho hình ảnh ban đêm sống động.    - Chế độ tắt riêng tư: Tắt hoàn toàn camera để đảm bảo sự riêng tư khi cần thiết.    - Chế độ thông minh: Tự động chuyển sang chế độ có màu khi phát hiện người lạ, đèn spotlight sẽ bật và chiếu vào đối tượng. Đồng thời, còi báo động cũng sẽ phát lên, điều này giúp bạn tăng cường an ninh hơn.	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-7.jpg	Hỗ trợ 4 chế độ tầm nhìn ban đêm	53
450	Khả năng kết nối được với wifi 2.4 GHz, điều khiển dễ dàng qua ứng dụng Imou Life trên điện thoại. Sản phẩm hỗ trợ khe cắm thẻ nhớ lên đến 256 GB, giúp bạn lưu trữ và quản lý dữ liệu video một cách tiện lợi và an toàn.	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-1-2.jpg	Dùng tiện lợi với wifi 2.4 GHz và ứng dụng Imou Life	53
451	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Swif-Edge-SFA16-1.jpg			54
452	Acer Swift Edge SFA16 thể hiện sự tinh tế trong từng đường nét với kiểu dáng thanh mảnh, hoàn thiện từ hợp kim nhôm cao cấp, nhẹ hơn 20% và bền gấp 2 lần so với nhôm thông thường. Swift Edge chính là chiếc laptop 16 inch 4K nhẹ nhất thế giới hiện nay khi có độ mỏng chỉ 12,95mm và trọng lượng vỏn vẹn 1,17kg. Dù sở hữu màn hình lớn tới 16 inch nhưng việc bạn mang theo Acer Swift Edge cũng nhẹ nhàng như một chiếc laptop 13 inch mà thôi.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Swif-Edge-SFA16-3.jpg	Chuẩn mực của sự hoàn hảo	54
453	Màn hình “khủng” 16 inch độ phân giải 4K, tấm nền OLED chính là điểm nhấn ấn tượng nhất trên Acer Swift Edge SFA16-41-R3L6. Màn hình này đã đạt đến chuẩn mực của chất lượng hiển thị với độ phân giải siêu cao 4K, chuẩn màu điện ảnh 100% DCI-P3 và độ sáng lên tới 500 nits. Đây là một trong những chiếc laptop có màn hình đẹp nhất trên thị trường, cho bạn đắm chìm với những nội dung hấp dẫn, dù là khi làm việc hay giải trí.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Swif-Edge-SFA16-8.jpg		54
454	Trên Acer Swift Edge SFA16-41-R3L6, bạn có thể làm mọi công việc, xử lý nhanh chóng các tác vụ nhờ cấu hình hàng đầu. Bộ vi xử lý Ryzen 7 6800U là con chip cao cấp với 8 lõi 16 luồng, tốc độ 2.7 – 4.7 GHz, sản xuất trên tiến trình 6nm hiện đại, vừa cho hiệu năng ấn tượng, lại vừa tiết kiệm điện. Các ứng dụng đều được khởi chạy và xử lý rất nhanh, để bạn làm các công việc chuyên nghiệp mà không cần phải chờ đợi.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Swif-Edge-SFA16-10.jpg	Hiệu suất đẳng cấp doanh nhân	54
455	Nắm bắt được xu thế hiện nay khi chúng ta thường xuyên phải tham gia các cuộc họp online, Acer Swift Edge tích hợp camera trước độ phân giải Full HD, công nghệ giảm nhiễu thông minh Temporal Noise Reduction (TNR), cho hình ảnh chất lượng cao ngay cả trong điều kiện thiếu sáng. Bên cạnh đó là công nghệ Acer PurifiedVoice với tính năng lọc ồn AI. Kết quả là bạn sẽ có các cuộc gọi video chất lượng cao, cả hình ảnh và âm thanh đều rất tuyệt vời.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Swif-Edge-SFA16-7.jpg	Gọi video chất lượng cao nhờ AI	54
456	Trên một thân máy siêu mỏng, Acer Swift Edge SFA16-41-R3L6 vẫn tích hợp đầy đủ các cổng kết nối phổ biến, bao gồm 2 cổng USB-C 3.2 Gen 2; 2 cổng USB-A 3.2; cổng HDMI 2.1; jack tai nghe 3.5mm; cổng nguồn. Ngoài ra laptop còn hỗ trợ chuẩn Wifi 6E băng tần 6GHz, tốc độ cao, ổn định và phạm vi phủ sóng lớn. Bạn sẽ dễ dàng kết nối với các cổng kết nối ngoại vi cần thiết trong công việc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/Acer-Swif-Edge-SFA16-5.jpg	Đầy đủ kết nối tốc độ cao	54
457	Galaxy S23 FE, sau khi được ra mắt trước đó, giờ đây đã được nâng cấp với sự hỗ trợ của các tính năng AI, giống như ở Galaxy S24 series, thông qua giao diện One UI 6.1 được giới thiệu vào cuối tháng 3 năm 2024.  Các tính năng đáng chú ý bao gồm Trợ lý Note thông minh cho phép người dùng ghi nhớ mọi điều một cách dễ dàng và hiệu quả. Đồng thời, có Trợ lý chỉnh ảnh cung cấp sự cải tiến trong việc chỉnh sửa và tối ưu hóa hình ảnh. 	https://cdn.tgdd.vn/Products/42/324028/Samsung-ho-tro-ai-1020x570.jpg	Tích hợp các tính năng AI mới	55
458	Trong khi đó, Trợ lý chat thông minh đảm nhận công việc giúp đỡ người dùng với việc điều chỉnh ngữ điệu của tin nhắn, cũng như dịch tin nhắn sang các ngôn ngữ khác. Bên cạnh đó, tính năng Phiên dịch trực tiếp và Khoanh vùng tìm kiếm thông minh cũng gia tăng sức mạnh của dòng điện thoại này.			55
459	Galaxy S23 FE 5G sở hữu thiết kế mang đậm dấu ấn của dòng Galaxy S với màn hình và mặt lưng phẳng. Đây là một thiết kế cổ điển, nhưng vẫn mang nét hiện đại và sang trọng.  Nhìn chung, chiếc máy có thiết kế khá tương đồng với Galaxy S23 và Galaxy S23+, lúc đầu mình còn nói vui rằng đây là phiên bản bổ sung màu của hai sản phẩm trên, khi thiết kế không có quá nhiều khác biệt ngoài màu sắc.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-1-1020x570-1.jpg	Thiết kế vuông vắn đặc trưng	55
460	Khung máy của Galaxy S23 FE 5G được làm từ kim loại chắc chắn, mang đến độ bền bỉ và chất lượng cao. Phần này cũng được bo cong nhẹ nhàng ở các cạnh, điều đó mang đến cho mình cảm giác cầm nắm dễ chịu, không gây nên tình trạng cấn như ở một vài mẫu máy có kiểu vuông vức.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-2-1020x570-1.jpg		55
461	Samsung nổi bật trong năm 2023 với sự đa dạng về sản phẩm từ phân khúc giá thấp đến cao cấp. Tuy nhiên, đặc điểm chung của hầu hết các mẫu máy là sử dụng ngôn ngữ thiết kế quen thuộc, bao gồm cụm camera xếp dọc và mặt lưng phẳng. Sự thay đổi chủ yếu nằm ở chất liệu và màu sắc, khiến cho thiết kế của Samsung có vẻ ít mới mẻ hơn, làm giảm đi sự hào hứng từ phía người tiêu dùng.			55
462	Viền màn hình mỏng là một xu hướng thiết kế mới, nó vừa tăng tính thẩm mỹ song cũng mang lại hiệu quả về mặt trải nghiệm. Kết hợp với viền màn hình mỏng là thiết kế hình notch dạng chấm nhỏ ở phía trên giúp tối ưu hóa không gian hiển thị.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-3-1020x570.jpg		55
463	Galaxy S23 FE 5G đạt chuẩn IP68, là một tính năng quan trọng đối với những người thường xuyên sử dụng điện thoại trong môi trường ẩm ướt hoặc bụi bẩn. Chuẩn IP68 giúp đảm bảo rằng điện thoại có thể hoạt động hiệu quả trong những điều kiện khắc nghiệt mà người dùng không cần phải lo lắng về tình trạng của thiết bị.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-4-1020x570.jpg		55
464	Khá đáng tiếc, Galaxy S23 FE 5G chỉ trang bị một loa ở cạnh dưới thay vì loa kép như một vài đối thủ trong phân khúc. Để bù lại thì hãng cũng đã bổ sung thêm công nghệ âm thanh Dolby Atmos và AKG. Chất âm mà điện thoại mang lại khá là trong, khi mở mức âm lượng cao để nghe cũng hiếm khi bị rè, từ đó giúp mình có thể trực tiếp nghe nhạc bằng điện thoại luôn mà không cần sử dụng thêm phụ kiện loa bên ngoài.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-5-1020x570.jpg		55
465	Điểm đặc biệt mà mình ưa thích trên màn hình là tấm nền Dynamic AMOLED 2X với khả năng hiển thị màu sắc và độ sáng. Màn hình này sử dụng điểm ảnh tự phát sáng độc lập, cho phép tắt hoàn toàn khi không cần sáng, làm cho màu đen trở nên sâu hơn. Công nghệ này không chỉ tăng cường độ tương phản mà còn tiết kiệm năng lượng, điều mà mình thấy rất ấn tượng.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-6-1020x570.jpg	Màn hình lớn hỗ trợ tấm nền Dynamic AMOLED 2X	55
466	Màn hình hỗ trợ độ phân giải Full HD+ đảm bảo rõ nét và chi tiết ấn tượng trong mọi tình huống. Từ việc xem video chất lượng cao đến lướt web và chơi game, màn hình này thực sự đã làm thỏa mãn nhu cầu của mình.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-7-1020x570.jpg		55
467	Tần số quét 120 Hz không chỉ là một con số để "nổi bật" trên nội dung quảng cáo. Đây là một yếu tố cực kỳ quan trọng đối với trải nghiệm người dùng hằng ngày. Nó làm cho mọi thao tác của mình trên màn hình trở nên mượt mà và tự nhiên hơn, không gặp phải hiện tượng giật lag khi vuốt màn hình hay tham gia vào các trò chơi đòi hỏi độ phản hồi nhanh.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-8-1020x570.jpg		55
468	Camera chính của chiếc điện thoại Galaxy dòng S này có độ phân giải lên đến 50 MP, cho thấy điện thoại có đủ khả năng tạo ra những bức ảnh sắc nét và chi tiết. Dù bạn đang ở trong điều kiện ánh sáng thấp hay ánh sáng mạnh, camera chính vẫn có thể chụp được những khoảnh khắc đẹp mắt với độ tương phản và màu sắc tốt nhất.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-9-1020x570.jpg	Camera 50 MP hỗ trợ khả năng quay video 8K	55
469	Trong môi trường có đủ ánh sáng, điện thoại cho ra bức ảnh rõ ràng, màu sắc nịnh mắt và không có hiện tượng ám màu. Đặc biệt, tổng thể bức hình lấy nét đều chứ không chỉ tập trung vào mỗi vùng mình chạm lấy nét.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-19-1020x570.jpg		55
470	Viên pin lớn với dung lượng 4500 mAh đã được tối ưu hóa cho Galaxy S23 FE 5G, đảm bảo bạn có thể sử dụng chiếc điện thoại này suốt cả ngày mà không phải lo lắng về việc hết pin. Cho dù bạn đang làm việc, duyệt web, xem video hay chơi game, Galaxy S23 FE 5G sẽ là người bạn đồng hành đáng tin cậy trong mọi hoạt động hằng ngày.	https://cdn.tgdd.vn/Products/42/321058/samsung-galaxy-s23-fe-5g-18-1020x622.jpg	Cung cấp năng lượng vừa đủ cho một ngày sử dụng	55
471	Tóm lại, Galaxy S23 FE 5G không chỉ là một chiếc điện thoại đẹp và thông minh mà còn là nguồn động viên cho người dùng với hiệu suất mạnh mẽ và khả năng chụp ảnh đẹp. Sự kết hợp này đảm bảo rằng bạn sẽ trải nghiệm điện thoại thông minh tốt nhất, đáp ứng mọi nhu cầu trong cả công việc và giải trí.			55
472	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-1.jpg			56
473	Acer Nitro 5 Tiger AN515-58-52SP là một trong những chiếc laptop đầu tiên trên thị trường trang bị bộ vi xử lý Intel thế hệ thứ 12 Alder Lake mới nhất. Con chip Intel Core i5 12500H có sức mạnh khiến cả những chip Core i7 trước đây phải choáng ngợp với 12 lõi 16 luồng, tốc độ xung nhịp 3.3 – 4.5 GHz, 18 MB Intel Smart Cache. Với nhiều nhân hơn, tốc độ xung nhịp cao hơn, i5 12500H mang đến hiệu suất cực khủng để đáp ứng tốt những tựa game hiện đại hay các ứng dụng đòi hỏi cấu hình cao. Sức mạnh của chiếc laptop gaming này sẽ giúp bạn tự tin làm bất cứ công việc gì.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-2.jpg	Trải nghiệm sức mạnh đột phá từ CPU Intel Gen 12	56
474	Được xây dựng với kiến trúc Ampere, card đồ họa RTX 3050 có thể chơi tốt hầu hết mọi tựa game ở thiết lập đồ họa Full HD. Ngoài ra, tính năng DLSS sẽ tăng hiệu suất, ổn định tốc độ khung hình nhờ trí tuệ nhân tạo AI. Trên laptop Acer Nitro, bạn sẽ được tận hưởng game với đồ họa chân thực, hiệu ứng đổ bóng tự nhiên, đồng thời tăng chất lượng khi vừa chơi game vừa livestream. Hơn nữa, RTX 3050 cũng rất lý tưởng khi làm việc với các phần mềm sáng tạo, chỉnh sửa ảnh, video, render 2D, 3D, …	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-10.jpg	Chơi game chân thực với GPU RTX 30 series	56
475	So với dòng Nitro 5 trước đây, Nitro 5 Tiger 2022 có một thiết kế hoàn toàn mới. Máy đi theo ngôn ngữ vuông vắn, hiện đại và gọn gàng hơn với viền màn hình siêu mỏng, bàn phím tràn sát ra cạnh bên máy. Các đường cắt cũng được làm khỏe khoắn, mạnh mẽ hơn. Đặc biệt, phần mặt lưng tạo điểm nhấn với những dải màu độc đáo, đậm chất gaming. Bạn sẽ có một chiếc laptop gaming vừa đẹp mạnh mẽ, lại vừa gọn gàng di động.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-8.jpg	Thiết kế mới, gọn gàng và thanh thoát hơn	56
476	Thiết kế mới của Acer Nitro 5 Tiger không chỉ gọn và đẹp hơn, nó còn cải thiện khả năng tản nhiệt, niềm tự hào của những chiếc laptop chơi game Acer. Nitro 5 2022 sở hữu 2 quạt tản nhiệt, 2 cổng hút gió (trên và dưới) cùng 4 cổng xả nhiệt. Sự phối hợp nhịp nhàng của hệ thống này trong phần khung máy thiết kế công thái học giúp nhiệt lượng luôn được giải phóng nhanh chóng, đảm bảo sức mạnh tốt ưu của hiệu năng. Tất nhiên bạn có thể điều chỉnh hệ thống, bao gồm tốc độ quạt, chế độ đèn qua phần mềm NitroSense quen thuộc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-3.jpg	Cải thiện khả năng tản nhiệt	56
477	Trong một thân máy nhỏ gọn, laptop Acer vẫn trang bị bàn phím với kích thước lớn, khoảng cách hợp lý nhờ việc bố trí các phím sát ra cạnh máy. Chưa hết, bàn phím này còn hỗ trợ đèn LED RGB 4 vùng tuyệt đẹp, cho bạn thêm niềm cảm hứng khi chơi game. Các phím WSAD và mũi tên cũng được làm nổi bật để bạn thao tác nhanh và chính xác hơn.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-9.jpg	Đèn LED RGB, cảm hứng cho chiến thắng	56
478	Những cổng kết nối phổ biến và tiên tiến nhất đều tập hợp trên Nitro 5 Tiger 2022. Bạn sẽ có cổng HDMI 2.1, Intel Thunderbolt 4 USB Type-C và USB 3.2, cho bạn thỏa sức kết nối với các thiết bị ngoại vi để phục vụ công việc, chơi game.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/acer-nitro-5-an515-tiger-2022-7.jpg	Đầy đủ cổng kết nối	56
479	Camera mang thiết kế nhỏ gọn và chắc chắn, khối lượng chỉ 255 g cùng gam màu trắng thanh lịch cho phép người dùng dễ dàng lắp đặt và di chuyển ở mọi vị trí khác nhau trong nhà từ phòng ngủ, phòng khách cho đến phòng bếp,...	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-1.jpg	Kiểu dáng nhỏ gọn, vỏ ngoài cứng cáp	57
480	Camera có độ phân giải lên tới 5 MP (1620p) mang đến hình ảnh có độ phân giải cao, rõ nét và trung thực, cho bạn kiểm soát an ninh tốt hơn, dễ dàng nhận biết khuôn mặt của một người, vật thể hoặc bất kỳ chi tiết nào.   Tính năng quan sát 360 độ của camera mang đến tầm nhìn bao quát, nhờ đó bạn không chỉ có thể xem toàn bộ không gian sống hay làm việc mà còn nhìn rõ những chi tiết nhỏ từ những góc khác nhau.	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-2-1.jpg	Độ phân giải 5 MP cho chất lượng hình ảnh/video sắc nét	57
481	Trang bị công nghệ Starlight giúp hình ảnh và video rõ ràng ngay cả trong điều kiện ánh sáng thấp. Ống kính này sử dụng cảm biến nhạy sáng cao, cho phép người dùng quan sát rõ các vật thể, cử động hoặc sự kiện diễn ra trong bóng tối.	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-6-1.jpg	Trang bị nhiều tính năng quan sát thông minh	57
482	Đặc biệt, camera còn có thể nhận diện và điều khiển camera bằng cử chỉ vẫy tay, bạn có thể ra lệnh cho camera chụp ảnh, quay video hoặc tắt camera bằng cử chỉ của mình một cách tiện lợi. Hơn thế nữa bạn chỉ cần vẫy tay trước camera là có thể khởi tạo cuộc gọi video trực tiếp đến app vô cùng tiện lợi.  Camera EZVIZ còn có chế độ riêng tư giúp bảo vệ không gian cá nhân của người dùng. Khi chế độ này được kích hoạt, camera sẽ dừng quay và không ghi lại bất kỳ hình ảnh hoặc video nào, đảm bảo không gian riêng tối đa cho người dùng.  Ngoài ra, camera hỗ trợ đàm thoại 2 chiều cho phép bạn nói chuyện, trao đổi thông tin với người nhà, vật nuôi hay cảnh cáo kẻ xâm nhập một cách dễ dàng mà không cần trực tiếp có mặt tại đó.	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-10.jpg		57
483	Lưu trữ không còn là vấn đề bởi camera trong nhà trang bị khe cắm thẻ nhớ microSD hỗ trợ dung lượng lên đến 512 GB. Nhờ vào đó, bạn có thể ghi lại những đoạn video quan trọng, lưu giữ bất cứ hình ảnh/video nào mà bạn cần và dễ dàng xem lại chúng khi bạn muốn.	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-3.jpg	Bộ nhớ lưu trữ an toàn, rộng rãi lên đến 512 GB	57
484	Camera có thể kết nối mạng thông qua Wifi và cổng LAN. Nhờ vậy, bạn có thể dễ dàng truy cập vào internet mà không cần sử dụng đến dây cáp phức tạp. Đi kèm với đó, camera hỗ trợ cả băng tần 2.4 GHz và 5 GHz giúp tăng cường khả năng kết nối và độ ổn định trong quá trình sử dụng.  Bạn có thể quan sát và điều khiển camera qua ứng dụng EZVIZ. Ứng dụng này có giao diện trực quan, dễ sử dụng giúp bạn dễ dàng tiếp cận và điều khiển camera, ngay cả với người mới lần đầu sử dụng.	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-220324-051825.jpg	Dễ dàng điều khiển và kết nối camera với nhiều thiết bị	57
485	Galaxy M15 5G mang đến cho người dùng những trải nghiệm thị giác sống động và mãn nhãn với tấm nền Super AMOLED nổi tiếng nhà Samsung. Màn hình có kích thước 6.5 inch với độ phân giải Full HD+ giúp mọi chi tiết hiển thị đều trở nên rõ nét, sống động, giúp bạn tận hưởng trọn vẹn mọi nội dung yêu thích như xem video, hình ảnh, đọc tin tức,...	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-5g-4gb-110624-015054.jpg	Tận hưởng không gian giải trí sống động 	58
486	Chiếc điện thoại Samsung này được trang bị hệ thống camera đa ống kính, đáp ứng mọi nhu cầu nhiếp ảnh của người dùng. Camera chính 50 MP trên chiếc điện thoại Samsung này cho phép bạn ghi lại những bức ảnh sắc nét, sống động với độ chi tiết cao, lưu giữ mọi khoảnh khắc đẹp trong cuộc sống một cách chuyên nghiệp.		Hệ thống ống kính đa chức năng	58
487	Bên cạnh đó, camera góc siêu rộng 5 MP cũng sẽ giúp bạn dễ dàng chụp ảnh phong cảnh rộng, ảnh nhóm hay những bức ảnh toàn cảnh ấn tượng. Trong khi đó, camera macro 2 MP lại là lựa chọn hoàn hảo để khám phá thế giới vi mô đầy thú vị với những bức ảnh cận cảnh chi tiết.	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-5g-4gb-110624-015050.jpg		58
488	Chiếc điện thoại Android mang trong mình viên pin có dung lượng khủng trong phân khúc lên đến 6000 mAh, đáp ứng hoàn hảo cho nhu cầu sử dụng của những người dùng phải di chuyển thường xuyên hay bận rộn trong công việc, không thể thường xuyên cắm sạc cho máy.  Viên pin này cung cấp thời lượng sử dụng Internet lên đến 23 tiếng (theo hãng công bố), đi cùng công nghệ sạc nhanh 25 W mang đến trải nghiệm dùng không gián đoạn, phục vụ bạn trong công việc lẫn giải trí cả ngày dài mà không lo hết pin giữa chừng. 	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-5g-4gb-110624-015042.jpg	Sở hữu viên pin vượt trội trong phân khúc	58
489	Được sản xuất trên tiến trình 4 nm tiên tiến, con chip Dimensity 6100+ đến từ nhà MediaTek sở hữu 8 nhân mạnh mẽ, bao gồm 2 lõi tốc độ cao 2.2 GHz và 6 lõi tiết kiệm điện 2.0 GHz giúp tối ưu hiệu năng của máy, kết hợp 4 GB RAM cho phép bạn xử lý đa nhiệm trơn tru, chiến game mượt và giải trí đỉnh cao mà không lo giật lag hay tụt pin nhanh.	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-5g-4gb-110624-015045.jpg	Hiệu năng mạnh mẽ, hệ điều hành mượt mà	58
490	Galaxy M15 5G khoác lên mình những gam màu hiện đại và trung tính, bao gồm xanh nhạt, xanh đậm và xám, phù hợp với gu thẩm mỹ của đa số người dùng, đặc biệt là giới trẻ.  Cảm biến vân tay được đặt tinh tế ở cạnh bên mang đến sự tiện lợi tối ưu. Chỉ với thao tác chạm nhẹ, bạn đã có thể dễ dàng mở khóa thiết bị một cách nhanh chóng và an toàn. Ngoài ra khi chạm đúp nhanh vào cảm biến, bạn có thể khởi chạy camera ngay lập tức để ghi lại những khoảnh khắc bất chợt hoặc mở ứng dụng được thiết lập sẵn một cách tiện lợi.	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-5g-4gb-110624-015053.jpg	Thiết kế hiện đại, năng động, cầm gọn trong lòng bàn tay	58
602	Tổng quan Lenovo Tab M9 cho thấy đây là một chiếc máy tính bảng phục vụ cho nhu cầu giải trí và công việc cơ bản. Thiết bị được tập trung vào các yếu tố như màn hình, âm thanh và thời lượng pin để đáp ứng tốt nhu cầu của người dùng.			72
491	Tổng kết lại, với nhiều ưu điểm nổi bật như màn hình đẹp, camera đa chức năng, pin dung lượng khủng, hiệu năng mạnh mẽ hỗ trợ cập nhật phần mềm lâu dài,... đáp ứng tốt nhu cầu học tập, giải trí và công việc với mức giá vô cùng hợp lý, Galaxy M15 5G sẽ là một lựa chọn mà bạn không nên bỏ qua.			58
492		https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-245-g10-fpt-4.jpg		59
493	So với phiên bản tiền nhiệm, HP 245 G10 có thiết kế gọn gàng, vuông vắn, mang đến vẻ đẹp nhẹ nhàng, thanh lịch hơn. Máy vẫn có màu trắng bạc sang trọng, ngôn ngữ thiết kế đơn giản với logo HP ở nắp lưng; phần viền màn hình được làm mỏng tối đa, bàn phím tràn ra sát cạnh máy. Đây là kiểu thiết kế giúp tối giản kích thước nhưng vẫn giữ nguyên trải nghiệm thoải mái cho người dùng. Với trọng lượng rất nhẹ chỉ 1.36kg và độ mỏng 1.79cm, bạn có thể mang HP 245 G10 đi bất cứ đâu dễ dàng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-245-g10-fpt-12.jpg	Thiết kế nhẹ nhàng và thanh thoát	59
494	Bạn sẽ không phải bực mình vì tình trạng máy chập chờn, lag giật nữa, đơn giản vì cấu hình của HP 245 G10 cực đỉnh trong tầm giá. Laptop trang bị bộ vi xử lý AMD Ryzen 5 7520U, đây là con chip thuộc thế hệ 7000 series đời mới, không chỉ mạnh mẽ với 4 nhân 8 luồng , tốc độ 2.8 – 4.3GHz mà còn sản xuất trên tiến trình 6nm hiện đại, sử dụng năng lượng hiệu quả và tối ưu hiệu năng. Ryzen 5 7520U rất thích hợp cho những chiếc laptop mỏng nhẹ như HP 245 G10, vừa đảm bảo sức mạnh lại vừa tỏa nhiệt ít, kéo dài thời lượng pin.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-245-g10-fpt-1.jpg	Làm việc đầy hứng khởi	59
495	Nắm bắt xu hướng làm việc, hội họp online đang rất phổ biến hiện nay, HP 245 G10 tích hợp webcam rõ nét và micro kép có khả năng khử ồn AI. Bạn sẽ luôn xuất hiện chuyên nghiệp trong các cuộc họp với hình ảnh rõ nét nhờ camera HP HD dải động rộng. Micro kép vừa ghi lại giọng nói rõ ràng, lại vừa tích hợp hệ thống giảm ồn AI, lọc bỏ những tạp âm xung quanh để đối tác của bạn luôn cảm thấy hài lòng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-245-g10-fpt-10.jpg	Nhìn và nghe rõ ràng trong các cuộc hội thoại	59
496	Màn hình luôn là nơi để bạn hướng tới, dù là khi làm việc hay giải trí. Vì thế HP 245 G10 trang bị một màn hình vô cùng chất lượng với khả năng hiển thị sắc nét, trong trẻo. Tấm nền 14 inch độ phân giải Full HD tiêu chuẩn, công nghệ IPS LCD cho hình ảnh đẹp mắt, giúp bạn làm việc trực quan và giải trí hấp dẫn. Đặc biệt, màn hình này còn có viền siêu mỏng tăng hiệu ứng thị giác, để bạn tập trung hơn vào hình ảnh khi sử dụng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-245-g10-fpt-2.jpg	Màn hình 14 inch Full HD IPS viền mỏng cực đã	59
497	HP 245 G10 tích hợp hệ thống kết nối tiên tiến hàng đầu hiện nay, cả không dây và có dây. Laptop HP trang bị cổng USB Type-C; 2 cổng USB Type-A; cổng HDMI 1.4b; jack tai nghe/micro combo và mạng Wi-Fi 6. Bạn có thể dễ dàng kết nối với các thiết bị ngoại vi để làm việc hiệu quả hơn. Trong khi đó mạng Wi-Fi 6 cho phép kết nối không dây nhanh chóng, ổn định với khả năng thu sóng và tốc độ vượt trội.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-245-g10-fpt-7.jpg	Kết nối dễ dàng và nhanh chóng	59
498	Sự thanh lịch, đơn giản là hai yếu tố có thể thấy rõ trên chiếc laptop nhỏ nhắn này của HP. Mặt lưng của HP Pavilion 14-dv2073TU được phủ một lớp kim loại và phần còn lại được hoàn thiện bằng một lớp nhựa chất lượng cao. Chính vì được phủ lớp kim loại nên mặt lưng sẽ gần như không bị bám dính vân tay, bụi bặm và nó còn chống được trầy xước nhẹ. Logo nhận diện thương hiệu HP nằm ngay chính giữa với vòng tròn nền trắng được cách điệu, rất dễ thấy.  Độ mỏng ấn tượng của máy là 1.7cm kèm theo 1.41kg. Bạn sẽ có một công cụ đồng hành cùng mình trong những chuyến đi công tác xa hoặc đơn giản hơn là làm việc ở quán café – thư viện – văn phòng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20Pavilion%2014-dv2073TU%201.png	Thanh lịch và đơn giản	60
499	Laptop HP Pavilion 14-dv2073TU được trang bị màn hình 14 inch sử dụng tấm nền IPS mang lại góc nhìn rộng 178 độ và màu sắc tươi tắn, rực rỡ. Độ phân giải hình ảnh tối đa trên chiếc màn hình này là 1920 x 1080 pixels, đồng thời hỗ trợ tốc độ quét 60Hz. Bạn sẽ tận hưởng những khung hình sống động với chất lượng hiển thị tuyệt hảo khi xem phim, những bảng biểu tính toán hiển thị đầy đủ và rõ ràng các con số trong khi làm việc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20Pavilion%2014-dv2073TU%202.png	Màn hình IPS mang đến chất lượng hiển thị tốt	60
500	Viên pin mà hãng trang bị cho HP Pavilion 14-dv2073TU có dung lượng 43 Wh, hỗ trợ sạc nhanh. Thời lượng tối đa mà bạn có thể sử dụng trên máy là từ 7 đến 8 tiếng, khoảng thời gian này cũng đủ dài cho 1 ngày làm việc mà không cần phải sạc thêm. Nếu muốn nạp đầy năng lượng cho máy, bạn sẽ chỉ phải chờ khoảng 2 tiếng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20Pavilion%2014-dv2073TU%203.png	Pin trâu, dùng được lâu	60
501	Cấu hình của HP Pavilion 14-dv2073TU bao gồm CPU Intel Core i5-1235U 4.4GHz – 16GB RAM DDR4 3200MHz – 512GB SSD M.2 NVMe. Con chip Intel 1235U này thuộc thế hệ thứ 12, mang lại hiệu năng xử lí nhanh dù là chip dòng U chuyên dùng cho các công việc văn phòng nhẹ. Cộng thêm 16GB RAM để thoải mái chạy nhiều chương trình và ổ cứng SSD siêu tốc, những gì bạn muốn đều được thực hiện trong chớp mắt.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20Pavilion%2014-dv2073TU%204.png	Đa nhiệm tốt, xử lí nhanh	60
502	Nokia 220 4G được thiết kế theo phong cách vuông vức, hiện đại, với chất liệu nhựa nhẹ nhàng, chỉ nặng 98 g. Điểm nhấn đặc biệt của máy là mặt lưng có hoạ tiết kẻ sọc, tạo cảm giác chắc chắn khi cầm nắm, không lo trơn trượt. Bàn phím dạng T9 truyền thống được làm phẳng hơn, mang lại cảm giác quen thuộc cho người sử dụng mặc dù có thể hơi khó khăn cho những ai quen dùng phím nổi.		Vẻ ngoài vừa hiện đại vừa truyền thống	61
503	Màn hình 2.8 inch của Nokia 220 4G to rõ, dễ nhìn, đặc biệt hữu ích cho người lớn tuổi. Kích thước màn hình này giúp nội dung hiển thị rõ ràng, không cần căng mắt, mang lại trải nghiệm sử dụng thuận tiện và thoải mái.		Màn hình to 2.8 inch, dễ nhìn 	61
504	Nokia 220 4G hỗ trợ 2 Nano SIM và công nghệ 4G VoLTE, đảm bảo chất lượng cuộc gọi to rõ, không nhiễu. Điều này giúp người dùng duy trì liên lạc hiệu quả, tiện lợi cho việc sử dụng số riêng cho công việc và gia đình.		Nghe gọi chất lượng cao với 4G VoLTE	61
505	Với viên pin dung lượng 1450 mAh, Nokia 220 4G có thể hoạt động liên tục trong nhiều ngày mà không lo cạn nguồn nhanh chóng. Đây là một ưu điểm lớn với những ai cần một thiết bị dùng lâu mà không cần sạc thường xuyên.		Pin bền bỉ, dùng lâu nhiều ngày	61
506	Chiếc điện thoại Nokia này tích hợp nhiều tiện ích hiện đại như cổng sạc Type-C giúp sạc nhanh chóng và tiện lợi. Máy còn có cổng jack 3.5 mm cho tai nghe, đèn pin tiện ích trong tình huống khẩn cấp và tính năng nghe radio mang đến trải nghiệm giải trí đáng giá. Những tiện ích này đảm bảo người dùng có mọi thứ cần thiết cho cuộc sống hằng ngày.		Một số tiện ích khác	61
507	Nokia 220 4G không chỉ đáp ứng nhu cầu cơ bản về gọi điện và nhắn tin, mà còn là chiếc điện thoại thông minh với nhiều tính năng hữu ích, phù hợp cho mọi lứa tuổi từ người trẻ đến người lớn tuổi. Đây chắc chắn là chiếc điện thoại đáng để bạn xem xét và trải nghiệm.			61
508	Khi quan sát bề ngoài của HP ProBook 440 G10, bạn có thể thấy chiếc laptop này đạt đến đẳng cấp của một sản phẩm dành cho các doanh nhân vốn kĩ lưỡng trong chuyện tìm mua một sản phẩm phù hợp với yêu cầu của mình. Lớp vỏ của máy được làm từ chất liệu kim loại cao cấp với màu bạc lấp lánh cực đẹp mắt cùng khả năng chống bám vân tay và bụi bẩn, các đường viền được uốn cong nhẹ để tạo nét mềm mại. Phần mặt lưng trơn nhẵn và không có họa tiết nào khác ngoại trừ logo HP khắc nổi ở ngay chính giữa, ngay đường viền phía trên là một đường rãnh nhỏ nổi lên để bạn có thể dễ dàng mở máy ra hoặc gập máy vào với độ bám tốt hơn. Màn hình của máy sử dụng bản lề đơn cực kì chắc chắn đảm bảo được độ bền ấn tượng sau nhiều lần đóng mở.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20ProBook%20440%20G10%204.png	Nét tinh tế và sang trọng trong thiết kế	62
509	Vì được thiết kế theo phong cách nhỏ gọn nên bàn phím của laptop HP cũng được làm hết sức tinh giản, gọn nhẹ. Mỗi phím trên khu vực này đều cách nhau một khoảng rất hợp lí, mang lại cảm giác gõ cực êm ái với độ phản hồi xúc giác cao khi các đầu ngón tay chạm vào. Chưa hết, bàn phím này có sẵn đèn LED trắng nên bất kì thời điểm nào bạn cũng có thể quan sát rõ ràng các kí tự để nhanh chóng hoàn thành nội dung cần nhập liệu. Trackpad bên dưới có bề mặt nhám mịn, đồng thời bề ngang của nó đủ rộng để ôm hết 5 đầu ngón tay cùng lúc cũng như nhận diện đầy đủ các thao tác và cử chỉ điều hướng của bạn. Ở góc ngoài cùng bên phải của bàn phím, bạn sẽ thấy một đầu đọc vân tay được tích hợp sẵn và phương thức bảo mật này sẽ an toàn hơn rất nhiều so với mật khẩu truyền thống.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20ProBook%20440%20G10%203.png	Bàn phím gõ êm, trackpad lớn, có bảo mật vân tay	62
510	HP ProBook 440 G10 trang bị màn hình có kích thước 14 inch, tuy nhiên chất lượng hiển thị của nó sẽ khiến bạn thích thú. Đường viền xung quanh màn hình được vát cực mỏng nên trải nghiệm thị giác càng được tăng cường và bạn sẽ tập trung hơn vào nội dung được hiển thị, đồng thời bên dưới màn hình này là tấm nền IPS mang đến góc nhìn rộng 178 độ cùng những màu sắc vô cùng sinh động và các chi tiết hình ảnh cực kì sắc nét. Độ phân giải Full HD 1920 x 1080 pixels và công nghệ Anti-glare LED UWVA còn góp phần không nhỏ trong việc bảo vệ đôi mắt của bạn thêm phần khỏe mạnh. Tần số quét tiêu chuẩn 60Hz sẽ đảm bảo chuyển động của hình ảnh lúc nào cũng mượt mà và không bị xé rách bất chợt.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20ProBook%20440%20G10%201.png	Màn hình cực sinh động và sắc nét	62
511	Cấu hình của HP ProBook 440 G10 thuộc vào hàng top đầu hiện nay với vi xử lí Intel Core i5-1340P 1.90GHz - 4.6GHz, 12 nhân, 16 luồng, 12MB bộ nhớ đệm - 16GB RAM hỗ trợ nâng cấp 32GB tối đa - ổ cứng SSD M.2 NVMe 512GB. Con chip Intel thế hệ thứ 13 này vừa có thể hoạt động vô cùng hiệu quả khi xử lí các tác vụ làm việc văn phòng, duyệt web, xem phim vô cùng hiệu quả vừa tiết kiệm được nhiều năng lượng cho viên pin của máy. Dung lượng RAM dồi dào giúp bạn thoải mái chạy nhiều chương trình và thay đổi qua lại mà không lo bị giật lag giữa chừng. Ổ cứng SSD vừa xử lí dữ liệu với tốc độ cực nhanh vừa có không gian lưu trữ lớn, giúp bạn không phải chờ đợi lâu khi sử dụng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20ProBook%20440%20G10%206.png	Phần cứng mạnh mẽ	62
525	Pin dung lượng lớn 5000 mAh là một trong những điểm mạnh của vivo V30 5G. Với viên pin này, điện thoại có thể duy trì hoạt động trong thời gian dài mà không cần sạc lại thường xuyên. Điều này rất hữu ích cho những người dùng cần sử dụng điện thoại liên tục hoặc không có điều kiện sạc pin thường xuyên trong ngày.	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-pini.jpg	Pin khủng 5000 mAh, có sạc nhanh 80 W	64
512	Bất kì ai đã quen với thương hiệu HP Victus đều sẽ thấy thiết kế của HP Gaming Victus 16-s0078AX sở hữu những đường nét vô cùng quen thuộc nhưng không kém phần sang trọng và tinh tế. Logo Victus hình chữ V hiện diện rõ ràng ở phần viền dưới cùng với mặt sau. Chất liệu nhựa được sử dụng để phủ xuyên suốt lớp vỏ ngoài của máy từ trong ra ngoài, đây là nhựa cao cấp nên có thể kháng được tình trạng bám vân tay và bụi bẩn cũng như tăng cường độ bền bỉ để game thủ yên tâm sử dụng lâu dài. Ở khu vực bên dưới, phần bản lề được thiết kế liền khối và liên kết chặt chẽ với thân máy nên có thể gập vào mở ra liên tục mà không sợ hỏng. Đường viền mặt lưng cũng được bo góc mềm mại để hài hòa với thiết kế tổng thể.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20Gaming%20Victus%2016-s0078AX%202.png	Sắc đen nhẹ nhàng nhưng sang trọng	63
513	Mỗi lần ra mắt laptop mới, HP luôn trang bị những phần cứng mạnh mẽ nhất để trải nghiệm sử dụng của người sở hữu sản phẩm luôn luôn tốt nhất. Đối với nhu cầu chơi game của các game thủ, hãng mang đến những gì tinh túy nhất và mới nhất để các tựa game bom tấn AAA chỉ là chuyện nhỏ.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20Gaming%20Victus%2016-s0078AX%203.png	Phần cứng thời thượng, chơi game cực đỉnh	63
514	HP Gaming Victus 16-s0078AX được trang bị màn hình có kích thước lớn 16 inch với độ phân giải hình ảnh Full HD 1920 x 1080 pixels. Công nghệ màn hình Anti-glare LED UWVA sẽ loại bỏ tình trạng chói lóa cũng như chồng chéo, bóng mờ trong khi game thủ say sưa cùng những nội dung mình yêu thích ở thế giới ảo. Tần số quét cao 60Hz cũng đảm bảo các khung hình trong game luôn được mượt mà và không bị giật, xé rách, đứt đoạn bất kì lúc nào. Tấm nền WVA cũng mang đến góc quan sát rộng và thoải mái, không giới hạn tầm nhìn nên game thủ không phải lo lắng gì nhiều khi chơi.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/VuTT29/HP%20Gaming%20Victus%2016-s0078AX%201.png	Chơi game cùng màn hình 16 inch	63
515	Một trong những điểm đặc biệt của vivo V30 5G là thiết kế với các góc bo cong và khung viền cũng được làm cong thay vì vuông vức. Thiết kế này mang lại cảm giác cầm thoải mái, các góc bo cong giúp người dùng cảm thấy dễ chịu khi cầm nắm, đặc biệt là khi sử dụng điện thoại trong thời gian dài. Khung viền cong giúp hạn chế cảm giác cấn tay, một vấn đề thường gặp ở các thiết kế vuông vức.	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-ve-ngoai.jpg	Thiết kế tinh tế, vẻ ngoài đẹp mắt	64
516	vivo V30 5G cung cấp hai lựa chọn màu sắc đầy phong cách. Màu đen thể hiện sự sang trọng và cao cấp vượt thời gian. Khả năng chống mài mòn và vết bẩn giúp điện thoại luôn mới mẻ và bền đẹp. Màu xanh thì được ví như sóng biển bất tận, tạo nên vẻ đẹp tinh tế và độc đáo. Cả hai tông màu này đều dễ dàng phối hợp với nhiều trang phục khác nhau, mà không kén chọn.	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-thiet-ke.jpg		64
517	Thiết kế cụm camera của vivo V30 5G không chỉ mạnh mẽ về chức năng mà còn ấn tượng về mặt thẩm mỹ. Với vòng sáng Aura nâng cấp mang lại ánh sáng dịu mà vẫn tối ưu hiệu suất chụp ảnh. Điều này giúp tạo ra những bức ảnh chân dung với ánh sáng hài hòa, làm nổi bật chủ thể và tạo cảm giác tự nhiên hơn.	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-cong-nghe.jpg		64
518	Chiếc điện thoại Android này được trang bị chipset Snapdragon 7 Gen 3 - một trong những sản phẩm mới nhất từ Qualcomm, mang lại sự cân bằng hoàn hảo giữa hiệu suất và tiết kiệm điện năng, nhờ vào kiến trúc 8 nhân mạnh mẽ.	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-cpu.jpg	Hiệu năng vượt trội, đáp ứng tốt nhiều tác vụ	64
519	Chipset Snapdragon 7 Gen 3 với hiệu suất CPU tăng 15% và GPU tăng 50% so với thế hệ trước, mang lại trải nghiệm mượt mà cho các tác vụ và chơi game đồ họa cao. Chipset này cũng tiết kiệm năng lượng, giảm tiêu thụ điện năng 9% so với Snapdragon 7 Gen 1, kéo dài thời gian sử dụng thiết bị.			64
520	Bên cạnh chip mạnh mẽ, vivo V30 5G còn hỗ trợ RAM 12 GB, kết hợp với công nghệ RAM mở rộng, tổng dung lượng RAM có thể lên tới 24 GB. Điều này giúp bạn đa nhiệm mượt mà, chuyển đổi giữa các ứng dụng nhanh chóng và không gặp hiện tượng giật lag. Các ứng dụng nặng hoặc game yêu cầu đồ họa cao sẽ chạy một cách trơn tru.	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-game.jpg		64
521	Camera selfie của vivo V30 5G có độ phân giải 50 MP, là một trong những camera selfie có độ phân giải cao nhất trong phân khúc hiện tại. Điều này giúp chụp ảnh selfie rõ nét, chi tiết, ngay cả trong điều kiện ánh sáng yếu. Camera này còn hỗ trợ góc rộng, giúp bắt trọn mọi khoảnh khắc trong các buổi họp mặt nhóm, chụp ảnh đông người mà không cần phải sử dụng gậy tự sướng hay cắt bớt.	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-selfie.jpg	Hệ thống camera nâng cấp, chụp ảnh đẹp hơn	64
522	Hơn nữa, vòng Sáng Aura 3.0 là một cải tiến độc đáo trên vivo V30 5G. Ánh sáng đã được thiết kế để mềm mại, không gây chói mắt, mang lại hiệu ứng ánh sáng dịu nhẹ hơn cho bức ảnh chân dung.	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-vong-sang.jpg		64
523	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-vong-sang.jpg	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-nhiet-do-mau.jpg		64
524	Chiếc điện thoại vivo này được trang bị màn hình AMOLED, mang lại màu sắc rực rỡ và độ tương phản cao so với các công nghệ màn hình khác. Đồng thời, giúp tiết kiệm năng lượng kéo dài thời gian sử dụng được lâu hơn. Màn hình hỗ trợ độ phân giải 1.5K (1260 x 2800 Pixels) đem lại chất lượng hình ảnh chi tiết và rõ nét cho người dùng.	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-man-hinh.jpg	Màn hình sắc nét, giải trí sống động	64
526	Tóm lại, vivo V30 5G là lựa chọn lý tưởng cho những ai đang tìm kiếm một chiếc điện thoại thông minh với hiệu suất mạnh mẽ, thiết kế đẹp và hệ thống camera chuyên nghiệp. Sản phẩm không chỉ đáp ứng tốt mọi nhu cầu từ công việc đến giải trí mà còn tạo điểm nhấn sang trọng và tinh tế cho người dùng. Đây chính là sự đầu tư xứng đáng cho tương lai công nghệ của bạn.			64
527		https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-14s-2023-2.jpg		65
528	HP 14s-em0080AU có một thiết kế đầy thanh lịch và không kém phần sang trọng. Laptop sở hữu kiểu dáng thanh mảnh, tinh tế với những đường bo cong mềm mại. Phần viền màn hình thu hẹp siêu mỏng giúp cho kích thước tổng thể vô cùng nhỏ gọn, mang đến tính di động tối ưu. Máy rất nhẹ nhàng để bạn mang đi bất cứ đâu với trọng lượng chỉ 1,4kg cùng độ mỏng 1,79cm. Phiên bản màu bạc thời trang, không bao giờ lỗi thời cho bạn thêm phần cảm hứng khi làm việc.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-14s-2023-14.jpg	Nhỏ gọn và sang trọng	65
529	Màn hình HP 14s có kích thước tiêu chuẩn 14 inch, độ phân giải Full HD sắc nét, màu sắc sống động, viền mỏng micro-edge, mang đến trải nghiệm màn hình tràn viền hấp dẫn, giúp bạn làm việc tập trung hơn và giải trí thú vị hơn. Đặc biệt, màn hình này trang bị công nghệ chống lóa và chống nhấp nháy fliker-free, giúp bạn không bị mỏi mắt dù sử dụng trong thời gian dài, an toàn và dễ chịu cho mắt.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-14s-2023-1.jpg	Màn hình Full HD rõ nét, sống động	65
530	Là chiếc laptop chỉ bán ở phân khúc giá 10 triệu đồng, nhưng HP 14s-em0080AU lại gây ấn tượng mạnh về cấu hình với bộ vi xử lý AMD Ryzen 3 7320U. Đây là con chip thuộc thế hệ Ryzen 7000 series mới nhất từ nhà AMD, rất mạnh mẽ với 4 nhân 8 luồng, tốc độ tối đa 4.1 GHz, sản xuất trên tiến trình 6nm hiện đại, đồng thời cũng hết sức tiết kiệm năng lượng với TDP chỉ 15W. Bạn có thể thoải mái chạy các ứng dụng văn phòng, học tập, công việc một cách mượt mà. Hiệu suất hệ thống luôn đảm bảo nhanh và ổn định, đáp ứng tốt mọi yêu cầu.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-14s-2023-5.jpg	Bước đột phá về hiệu năng của laptop giá rẻ	65
531	Sở hữu 8GB RAM và 256GB SSD, laptop HP 14s-em0080AU đảm bảo cho bạn có những linh kiện hàng đầu để tốc độ nhanh hơn bao giờ hết. Chưa hết, RAM trên HP 14s-em0080AU còn là chuẩn RAM DDR5 với tốc độ băng thông vượt trội, mang đến không gian đa nhiệm thoải mái. Trong khi đó 256GB PCIe NVMe M.2 SSD là ổ cứng cao cấp không chỉ bền vững mà còn giúp tăng tốc độ khởi động, mở ứng dụng, di chuyển sao chép dữ liệu. Bạn sẽ được tận hưởng sự mượt mà, nhanh chóng khi sử dụng HP 14s.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-14s-2023-8.jpg	Nâng tầm khả năng đa nhiệm với RAM DDR5	65
532	HP 14s được cài sẵn Windows 11 bản quyền, hệ điều hành mới nhất từ Microsoft. Bạn sẽ được tận hưởng giao diện hoàn toàn mới, bắt mắt, hiện đại và trực quan hơn. Bên cạnh đó, Windows 11 cũng cải thiện hiệu suất hệ thống, tăng cường bảo mật, đồng thời tương thích với các ứng dụng làm việc và giải trí hiện đại.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-14s-2023-3.jpg	Hệ điều hành Windows 11	65
533	Với bộ vi xử lý mới tiết kiệm năng lượng hơn cùng viên pin 3 Cell 41Wh giúp thời lượng pin của HP 14s-em0080AU được kéo dài hơn đáng kể. Máy tính có thể sử dụng trong khoảng 9 giờ liên tục mà không cần đến nguồn sạc. Nhờ vậy, những cuộc họp quan trọng hay việc sử dụng laptop trong một chuyến bay dài đều sẽ được đáp ứng một cách hiệu quả. Ngoài ra, laptop còn có tính năng sạc nhanh, giúp sạc đầy 50% pin chỉ sau 45 phút, nhanh chóng đủ năng lượng để bạn tiếp tục sử dụng.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-14s-2023-7.jpg	Thời lượng pin dài, sạc nhanh	65
534	HP 14s-em0080AU tập hợp những kết nối nhanh bậc nhất hiện nay ở cả không dây và có dây. Laptop hỗ trợ mạng Wi-Fi 6 và Bluetooth 5.2, cho tốc độ kết nối Wi-Fi ổn định, cũng như tương thích với hầu hết các thiết bị Bluetooth hiện đại. Bạn cũng sẽ có đủ các cổng kết nối thông dụng như 2 cổng USB Type-A; cổng USB Type-C; cổng HDMI 1.4 và jack tai nghe/mic 3.5mm. Các cổng USB đều có tốc độ truyền tín hiệu lên tới 5Gbps, giúp sao chép, di chuyển dữ liệu cực nhanh.	https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/0511/hp-14s-2023-11.jpg	Sẵn sàng kết nối	65
535	Giống như những thế hệ “Plus” trước đây, iPhone 14 Plus vẫn sẽ là phiên bản phóng to từ iPhone 14 với ngôn ngữ thiết kế không đổi, vẫn sẽ là cạnh viền vuông vức đi kèm với mặt lưng phẳng để tạo nên cái nhìn bắt trend và đặc trưng.	https://lh6.googleusercontent.com/uFkCH7w2YQ23NGogMNZ5iztW88sH3e8pJFentXJ1gAB-f8p1g4y8kA-b0UzSN0V1Uaifr3cTIlj_DW9au2m_tsekvdK_O4FCmzK9ZPVEvF9fwbGMi9JMDqV8j109DODHaYI4-aikdtS_Y4BeNB8jbnq8jtqQQ7ySe8XpEC_x7avEonLpAaznbaeWPZWT	Thân hình thanh mảnh cùng ngoại hình góc cạnh	66
536	Về phần chế tác thì máy sẽ được bao bọc bởi một bộ khung làm từ nhôm, vừa tối ưu được khối lượng vừa mang đến một độ bền khá tốt. Phần này được làm theo kiểu nhám nhẹ nên cảm giác khi cầm nắm là rất tốt.  Còn ở mặt lưng thì hãng đã sử dụng hoàn toàn từ kính cường lực, bộ phận này được làm theo kiểu nhẵn bóng nên máy sẽ trở nên rất bắt mắt và mới mẻ, tạo cho mình cảm giác sang trọng hơn khi sử dụng.	https://lh4.googleusercontent.com/i5GTP0k39aWeOxRyqzevWYE2njiApi8C4N_lxP75b-Yh4dffB90LzZXPftD7Fy_NwNJH87SOgpfSOmr035zzZ5JYB810Ul_2kxeSDaJDEYK9f6U5ZiELWWx3V8JlCZoKfd8tVIgir1NjTw5zrAYGh8dQzm2Mq_KBdy2tIvCkp_zEdtyNtTzGsnM2Hs2Q		66
550	Chip Apple M4 trên iPad Pro M4 13 inch WiFi 256GB được sản xuất dựa trên quy trình 3 nm thế hệ thứ 2, với CPU 9 nhân và GPU 10 nhân. Chip này mang lại hiệu suất nhanh hơn 1.5 lần và hiệu suất đồ họa mạnh mẽ hơn gấp 4 lần so với thế hệ trước.	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-m4-13-inch-wifi-256gb-060624-093214.jpeg	Bộ vi xử lý hàng đầu với hiệu suất vượt trội	67
537	Theo mình thấy thì iPhone 14 Plus mang một cái nhìn rất thanh mảnh bởi độ mỏng của máy nằm ở mức 7.8 mm. Đối với chiều ngang của điện thoại sẽ là 78.1 mm, đây được xem là con số vừa phải chứ không thực sự “quá cỡ” như bao lời đồn đoán.	https://lh3.googleusercontent.com/kkAjeuYG9GiJOxQO3DOePiRlNiI2CPrZeynbsN4xIYssG-6-3O42Cy9EuokpiYM7Mvbw0MfCK0Uu03yVVDz7Kks5Fr-q4DNWw9PAIj120w7AO-NB1lGsB8jaSm7hwt9ZLX3llqKxb0GqkYHsSTstUDxQxZeiNJdw1bMPA7WL1Fk2cWEE-6wGBTa6WsTl		66
538	Kiểu thiết kế camera năm nay Apple vẫn giữ nguyên cách sắp xếp và bố trí so với iPhone 13, vẫn là bộ đôi camera xếp chéo lạ mắt, đi kèm đèn LED đặt bên trên. 	https://lh4.googleusercontent.com/tdZDXxPU6c9w34ATvOMrR12Ceuuf3IfmkPbmE-5YyzRxz7gelsCNUzZ8lLP4wvBetQxNASOCy_VLv3RBRLLr9v7TK4BPnTVbH3w7Yc9fyhYAMhrHyWNAuuyne81xcjjOAqA2sJWho0PKPApo4CVox4bduzwkufcsU-P-nt4iY_VTT1SBLut_TemGzJ6A		66
539	Theo như hãng công bố thì iPhone 14 Plus sử dụng tấm nền OLED, chuẩn độ phân giải Super Retina XDR, cho đến thời điểm ra mắt sản phẩm thì đây được xem là loại công nghệ thuộc top đầu thị trường điện thoại.	https://lh6.googleusercontent.com/3XMJZqljPMGlrd_okmmwBwD2mfZPnc6MzuvGFmlCE1mmIrGsB0eirM8HY5TSEdtGl91AOMDDobIutu7gOld4-aTcqko_hnWOQZD-FdhCcpFjc71Yq-rncIMeS04WxZST8GJV14Ny85IvWoXipjicvbKZcl-D5QUPrkdY_EFhozLeYE7FWClNtS1fNrKJ	Màn hình OLED tái hiện nội dung sinh động	66
540	Về thông số camera thì gần như iPhone 14 Plus không có sự thay đổi so với iPhone 14, vẫn là chiếc điện thoại chụp ảnh, quay phim tốt, hai ống kính có chung độ phân giải 12 MP và một trong số đó sở hữu khả năng chụp ảnh góc siêu rộng.	https://lh6.googleusercontent.com/ib08KD93IbRcGUR3rHdLbQyzfSXVP2mQw5OKqq2PdRZMWCTeO4_rE3hZANbsugxml4SE6OFNvnm_a8U518JHyiAY4W2OpioMH4_zwpT92sgj5pRcCRwF6-xL2lGj_fAxalHusmn1MDBmyDj5yaftUWBVJE8LFfWywCyoaJL-IKjVLS5KRVIe75hCKQij	Dễ dàng bắt trọn mọi khoảnh khắc	66
541	Ở những môi trường có điều kiện ánh sáng tốt thì chất lượng ảnh cho ra có độ chi tiết cao, màu sắc cho ra cũng cực kỳ bắt mắt, mình cảm giác như màu ảnh trông rất trong trẻo chứ không hề bị đục do ám vàng hay ám xanh.	https://lh5.googleusercontent.com/T4AucaEiOHxiHtq2DWa98XkYRSU5DDzO8O1voj06PyCjoj25OuH6ypoCm1QThSov7Af1DDwGh_dEGYbI4tVlK2w1wVYeOWpnAQxQSk8fa_Xjh3ktCkZmIAt1cwnAZbBb04G5LO4yfNmgxWdZAb_x6n23qv-4Pfgwsud5ts5FK3m7hhOGRx8jD4fHAzVV		66
542	Năm nay thì Apple vẫn tiếp tục sử dụng con chip Apple A15 Bionic tương tự như trên dòng iPhone 13 vào năm ngoái, CPU này giúp máy có được một lợi thế rất lớn so với các đối thủ trên thị trường khi sở hữu cho mình tốc độ CPU đến 3.22 GHz.	https://lh3.googleusercontent.com/dEWblnnLwOHTscyo3VkomBLo83nZiM9p9ihRql-djuQCCCCUT0HggPTOyXh2gcAnZSjotqY2io8NZxAotrUSqoCpTl1iUJVVany81jNwa9xukuvM1RyA--7ecyd-7vq2FrD7vcL5RnRF3RgGgrm2vojfLPQqqfPPWF_Zf3dYFFu7kPKRm5xDiHHSJZ61	Hiệu năng cực khủng với Apple A15 Bionic	66
543	Với cấu hình top đầu giới smartphone như hiện nay nên phần lớn mọi tựa game đều được máy xử lý khá dễ dàng, trong đó có Genshin Impact được coi là tựa game nặng nhất mà mình đã chơi qua, kể cả khi mọi thiết lập đều được đặt ở mức cao thì iPhone 14 Plus cũng có thể thực hiện được trò chơi, quá trình diễn ra tương đối suôn sẻ, đôi lúc sẽ xuất hiện tình trạng drop khung hình nhưng không quá thường xuyên.	https://lh6.googleusercontent.com/0VGob9To87LGQZ4w-ud7rp0sCZ4JrjMjg-g6Ngv6VfP6wsffzT4yv5ac9gGbuZU4mz0dxVJj-Jv8iOswnmalaHB-6st01RX62MBFnXPVU-62uiHIFjFFMeu2eaX4j1ge_LiqpXr-q6ZmIyrsM5kRLELdONaGImTwMD2O6-ic9z0f7rMB61duI46FEvMo		66
544	Với những gì mình cảm nhận được trên iPhone 14 Plus thì mình thấy máy sẽ phù hợp với những bạn yêu thích những chiếc máy trẻ trung, có yêu cầu cao về khả năng chụp ảnh hay mong muốn sở hữu một thiết bị có hiệu năng khủng và viên pin lớn để bạn có thể "chày cối" chơi game cả ngày.			66
545	iPad Pro M4 13 inch nổi bật với thiết kế siêu mỏng chỉ 5.1 mm, là một trong những sản phẩm mỏng nhất của Apple từ trước đến nay. Thiết kế này không những mang lại vẻ ngoài tinh tế và hiện đại mà còn giúp người dùng có trải nghiệm thoải mái hơn khi dễ dàng cất gọn vào balo, túi xách, mang theo mọi lúc mọi nơi mà không tốn quá nhiều không gian.	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-m4-13-inch-wifi-256gb-060624-093338.jpeg	Siêu phẩm máy tính bảng mỏng nhất của Apple 	67
546	Khung máy được hoàn thiện từ nhôm nguyên khối cao cấp, mang đến sự chắc chắn và bền bỉ. Thiết kế với 4 cạnh bo cong mềm mại không chỉ tạo nên vẻ đẹp liền mạch và tinh tế, mà còn giúp người dùng cầm nắm thoải mái hơn.	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-m4-13-inch-wifi-256gb-060624-093217.jpeg		67
547	Khi sử dụng iPad cùng với Apple Pencil Pro mới ra mắt của Apple, bạn có thể thỏa sức sáng tạo, vẽ vời, ghi chú và nhiều hơn nữa với mỗi cử chỉ được tái tạo một cách sống động. Bút Apple Pencil có độ chính xác tuyệt đối đến từng điểm ảnh, độ trễ cực thấp, nhạy với độ nghiêng và hỗ trợ chống tỳ tay, mang đến trải nghiệm giải trí và làm việc mượt mà và chân thực hơn bao giờ hết.	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-m4-13-inch-wifi-256gb-060624-093211.jpeg		67
548	Chiếc iPad Pro M4 này sở hữu màn hình Ultra Retina XDR 13 inch với công nghệ OLED hai lớp, mang đến độ sáng toàn màn hình lên đến 1000 nits và 1600 nits khi hiển thị nội dung HDR. Với tỷ lệ tương phản cao 2.000.000:1 và độ phân giải 2064 x 2752 pixels, màn hình mang lại khả năng hiển thị màu đen sâu và chi tiết sống động, tạo nên trải nghiệm hình ảnh tuyệt vời.	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-m4-13-inch-wifi-256gb-060624-093215.jpeg	Màn hình Ultra Retina XDR với hình ảnh sống động	67
549	Các công nghệ hỗ trợ như True Tone và ProMotion giúp điều chỉnh màu sắc và tần số quét một cách linh hoạt, mang đến trải nghiệm hình ảnh tuyệt vời cho người dùng sáng tạo nội dung và thiết kế đồ họa. True Tone tự động điều chỉnh cân bằng trắng để phù hợp với ánh sáng xung quanh, trong khi ProMotion tăng tần số quét lên đến 120 Hz, mang lại sự mượt mà và phản hồi nhanh chóng cho mọi thao tác.			67
600	Giúp bạn lưu lại được mọi khoảnh khắc quý giá trong cuộc sống một cách nhanh chóng thì Lenovo cũng đã trang bị ở mặt lưng Tab M9 một camera chính với độ phân giải 8 MP đi kèm với nhiều tính năng hiện đại.	https://cdn.tgdd.vn/Products/Images/522/306923/lenovo-tab-m9-2.jpg	Ghi lại khoảnh khắc với một cú chạm	72
551	Bên cạnh đó, Neural Engine cải tiến giúp tăng tốc độ xử lý AI và học máy, hỗ trợ các tính năng thông minh của iPadOS như tra cứu hình ảnh, chụp văn bản trực tiếp và ghi chú dựa trên AI. Hiệu suất vượt trội này làm cho iPad Pro M4 13 inch trở thành công cụ lý tưởng cho mọi tác vụ, từ công việc văn phòng đến giải trí đa phương tiện.	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-m4-13-inch-wifi-256gb-060624-093218.jpeg		67
552	Máy tính bảng được trang bị camera trước Ultra Wide và camera sau Wide đều có độ phân giải 12 MP, giúp bạn chụp ảnh và gọi video với chất lượng rõ nét đến từng chi tiết, hỗ trợ tối ưu cho mọi tác vụ từ công việc đến giải trí.	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-m4-13-inch-wifi-256gb-060624-093212.jpeg	Hệ thống camera đẳng cấp chuyên nghiệp	67
553	Ngoài ra, camera sau của iPad Pro M4 13 inch còn hỗ trợ quay video với độ phân giải lên tới 4K và video ProRes để đảm bảo chất lượng nén tốt nhất. Camera cũng hỗ trợ chụp ảnh Smart HDR, mang lại hình ảnh sống động với màu sắc rực rỡ hơn và độ chi tiết cải thiện đáng kể trong điều kiện thiếu sáng.			67
554	iPad có viên pin hiệu suất 38.99 Wh cung cấp thời gian sử dụng lên đến khoảng 10 giờ khi sử dụng kết nối Wi-Fi để lướt web hoặc xem video (theo hãng công bố). Điều này đáp ứng tốt nhu cầu sử dụng liên tục trong một ngày làm việc hoặc học tập mà không cần sạc lại giữa chừng, đặc biệt hữu ích cho những người thường xuyên di chuyển và cần một thiết bị bền bỉ suốt cả ngày.		Pin hoạt động bền bỉ suốt ngày dài	67
555	Mang hiệu năng vượt trội từ con chip Apple M4, thiết kế siêu mỏng nhẹ, hệ thống camera đa chức năng, loa và mic chất lượng cao, màn hình 13 inch rộng rãi với công nghệ OLED hai lớp sống động và sắc nét đến từng chi tiết, iPad Pro M4 13 inch sẽ là bạn đồng hành hoàn hảo cho mọi nhu cầu thiết kế đồ họa, chỉnh sửa ảnh, render video và các tác vụ sáng tạo của người dùng.			67
561	Samsung Galaxy Tab S9+ WiFi vẫn giữ nguyên những đặc điểm thiết kế độc đáo của thế hệ tiền nhiệm, nhưng đã đổi mới ở một vài điểm. Thay vì đặt camera vào một cụm thì giờ đây đã được tách riêng ra, làm cho vẻ ngoài của máy trở nên thanh thoát và sang trọng hơn.	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-9.jpg	Thiết kế đẹp mắt xứng danh flagship	69
562	Máy có một thiết kế nguyên khối và được làm với hình dáng vuông vức, điều này giúp máy phản ánh xu hướng thiết kế hiện đại và sang trọng. Máy sử dụng chất liệu nhôm và đạt khối lượng 581 g, khi cầm trên tay mình cảm giác máy không quá nặng và mình có thể sử dụng hai tay trong thời gian dài mà không gặp hiện tượng mỏi tay.			69
563	Tuy nhiên, đối với các bạn nữ, mình nghĩ nên trang bị bộ bàn phím để có thể dựng máy đứng vững ở trên bàn và đồng thời biến nó thành một chiếc laptop với Samsung DeX để sử dụng được thuận tiện hơn.	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-260723-075405.jpg		69
564	Máy tính bảng Samsung này trang bị một màn hình rộng lớn, với kích thước lên đến 12.4 inch và sử dụng tấm nền Dynamic AMOLED 2X độ phân giải 1752 x 2800 pixels. Màn hình này không chỉ hiển thị rất sắc nét, màu đen sâu và hài hòa, mà còn hỗ trợ HDR10+, mang đến cho mình một trải nghiệm hiển thị xuất sắc.	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-260723-075409.jpg	Mở rộng không gian quan sát với màn hình lớn	69
565	Bút S Pen trên Tab S9+ WiFi đã trải qua nâng cấp để mang lại nhiều tiện ích hơn cho việc sử dụng. Việc vẽ hoặc ghi chú với chiếc bút này mang lại cảm giác rất nhẹ, đồng thời với độ trễ chỉ ở mức thấp, cho phép mình thoải mái thể hiện sự sáng tạo, đặc biệt là trong các công việc như thiết kế và chỉnh sửa ảnh chuyên nghiệp.	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-260723-075408.jpg		69
566	Vị trí gắn bút S Pen ở mặt lưng được thiết kế với tính năng sạc cho bút, tạo thành một vệt thẳng tinh tế bên dưới cụm camera sau, đồng thời tạo nên sự hài hòa cho tổng thể thiết kế của chiếc máy.	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-6.jpg		69
567	Galaxy Tab S9+ WiFi sử dụng con chip dành riêng cho Galaxy đến từ Qualcomm với tên gọi Snapdragon 8 Gen 2 for Galaxy mang đến hiệu năng mạnh mẽ, giúp bạn giải quyết tốt các nhu cầu trong công việc cũng như cuộc sống hằng ngày một cách ổn định.	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-260723-075710.jpg	Xử lý mượt mà mọi tác vụ với chip Snapdragon	69
568	Gần như máy xử lý một cách mượt mà các tác vụ hằng ngày từ đơn giản đến phức tạp mà không gặp bất cứ khó khăn gì. Điều tuyệt vời hơn là máy cho độ phản hồi cực nhanh với những tác vụ đòi hỏi hiệu năng cao như dựng phim trên CapCut hay chỉnh sửa hình ảnh.	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-2.jpg		69
569	Trong phân khúc máy tính bảng, việc đầu tư vào camera thường không được chú ý nhiều. Với Galaxy Tab S9+ WiFi, mặt trước trang bị camera selfie độ phân giải 12 MP, chủ yếu để đáp ứng nhu cầu chụp cơ bản. Màu sắc và chi tiết trên da được tinh chỉnh tốt, không gặp vấn đề lệch màu.	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-260723-075401.jpg	Khả năng quay chụp ổn định	69
570	Camera sau của máy gồm cảm biến chính 13 MP và phụ 8 MP, đủ để đáp ứng nhu cầu chụp ảnh cơ bản. Hình ảnh có chi tiết tốt, màu sắc tươi và hấp dẫn, không bị mất chi tiết.	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-7.jpg		69
571	Với thân mình mỏng manh chỉ 5.7 mm nhưng bên trong Galaxy Tab S9+ WiFi là một viên pin dung lượng lớn 10090 mAh, với mức năng lượng như vậy bạn có thể dễ dàng sử dụng thoải mái trong nhiều giờ liền với nhiều tác vụ mà không cần lo lắng về vấn đề sạc thường xuyên.  Ngoài ra, đây còn là tablet sạc siêu nhanh với công suất được hỗ trợ là 45 W giúp sạc đầy pin nhanh chóng, cho bạn thoả sức trải nghiệm công việc, giải trí một cách liền mạch.	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-1.jpg	Viên pin lớn sử dụng dài lâu	69
572	Điểm ấn tượng trong lần ra mắt lần này là Samsung đã tích hợp khả năng kháng nước, bụi chuẩn IP68 cho cả Galaxy Tab S9+ WiFi và bút S Pen. Đây cũng là lần đầu tiên mà khả năng kháng nước được trang bị cho một mẫu máy tính bảng của hãng. Từ nay bạn có thể an tâm sử dụng mà chẳng cần lo lắng gì nếu chẳng may có nước rơi vào thiết bị.			69
573	Với một không gian hiển thị rộng lớn 12.4 inch, pin khủng 10090 mAh và một cấu hình mạnh mẽ, Samsung Galaxy Tab S9+ WiFi hứa hẹn sẽ là một đối thủ đáng gờm trong phân khúc và mang đến một trải nghiệm tuyệt vời khi sử dụng cho mục đích công việc và giải trí.			69
574	Samsung Galaxy Tab S9 FE WiFi không chỉ là một chiếc tablet thông thường mà còn đại diện cho sự kết hợp tinh tế giữa hiện đại và tính tiện dụng. Thiết kế phẳng của màn hình và mặt lưng giúp tạo nên một vẻ đẹp đầy tính thẩm mỹ mang đậm vẻ đẹp của sự hiện đại và sang trọng.	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-wifi-thietke.jpg	Thiết kế tinh tế, hiện đại	70
575	Một trong những điểm nổi bật của Galaxy Tab S9 FE WiFi là khả năng hỗ trợ bút S Pen. Bút này giúp bạn tạo ra những nét viết, vẽ mượt mà và chính xác. Điều đặc biệt là tablet này đã được trang bị một vùng riêng ở mặt lưng với nam châm từ tích hợp. Điều này giúp bạn dễ dàng gắn bút S Pen vào máy, không lo lạc mất hoặc phải tìm kiếm mỗi khi cần sử dụng.	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-wifi-spen.jpg		70
576	Galaxy Tab S9 FE WiFi có khả năng chống nước và bụi theo tiêu chuẩn IP68, giúp nó hoạt động tốt trong môi trường ẩm ướt và bụi bẩn, đồng nghĩa rằng bạn có thể sử dụng nó một cách thoải mái trong nhiều điều kiện khác nhau.			70
577	Màn hình TFT LCD không chỉ giúp tiết kiệm năng lượng tiêu thụ mà còn mang lại màu sắc trung thực đáng kinh ngạc. Hình ảnh trên màn hình sẽ bắt mắt và sống động, được xem là khá ổn trong phân khúc tầm trung khi mọi thứ đều được trình chiếu một cách tương đối rực rỡ. Không chỉ thế, góc nhìn rộng của màn hình cũng đảm bảo rằng bạn có thể thấy rõ nội dung từ nhiều góc độ khác nhau mà không bị giảm đi chất lượng.	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-wifi-manhinh.jpg	Sử dụng màn hình sắc nét	70
578	Galaxy Tab S9 FE WiFi sở hữu độ phân giải 1440 x 2304 Pixels, đảm bảo rằng mọi nội dung trên màn hình đều trở nên cực kỳ sắc nét và chân thực. Từ xem phim đến chơi trò chơi, bạn sẽ cảm nhận được sự chân thật trong từng thước phim và trải nghiệm tối ưu với hình ảnh rõ ràng.	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-171023-122243.jpg		70
579	Một trong những điểm đặc biệt nổi bật của Galaxy Tab S9 FE WiFi chính là màn hình kích thước lớn. Với màn hình rộng 10.9 inch, chiếc tablet này không chỉ đơn thuần là một thiết bị giải trí, mà còn trở thành một công cụ làm việc hiệu quả đáng kinh ngạc.			70
580	Không chỉ nổi bật nhờ có độ phân giải cao, màn hình của chiếc máy tính bảng Samsung này còn hỗ trợ tần số quét 90 Hz, đồng nghĩa với việc mọi cử chỉ và chuyển động trên màn hình đều trở nên mượt mà và trôi chảy. Từ cuộn lướt web hằng ngày đến trải nghiệm chơi game, mọi thứ đều trở nên tối ưu hóa với tần số quét cao.	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-171023-122247.jpg		70
581	Với camera sau 8 MP, bạn có khả năng chụp lại các tài liệu và ghi lại những khoảnh khắc đặc biệt một cách rõ ràng và sắc nét. Đây là công cụ hữu ích cho công việc, cho phép bạn sao chép các tài liệu, chỉnh sửa hình ảnh và ghi lại thông tin quan trọng. Ngoài ra, nó còn là một trợ thủ đáng tin cậy để bạn lưu giữ những khoảnh khắc quý báu trong cuộc sống.	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-wifi-camera.jpg	Camera nhiều tính năng quay chụp	70
582	Ngoài ra, camera sau này còn hỗ trợ quay video sắc nét với chuẩn tối đa lên đến Full HD, đồng nghĩa là bạn có khả năng ghi lại những video chất lượng cao với độ nét và chi tiết tốt, được xem là một lợi thế khá lớn khi so với nhiều đối thủ trong cùng phân khúc.	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-171023-122245.jpg		70
583	Galaxy Tab S9 FE WiFi là một chiếc tablet thông minh với hiệu năng mạnh mẽ, được trang bị chip Exynos 1380 8 nhân để đảm bảo rằng bạn có khả năng hoàn thành mọi tác vụ một cách mượt mà và hiệu quả.  Với mức xung nhịp tối đa trong khoảng 2.4 GHz, chiếc tablet này đủ mạnh mẽ để xử lý mọi tác vụ một cách suôn sẻ. Từ mở ứng dụng cơ bản đến một vài tựa game phổ biến như Liên Quân Mobile, Exynos 1380 hoàn toàn đáp ứng với mọi thử thách. Bất kể công việc hay giải trí, bạn sẽ luôn trải nghiệm sự mượt mà và nhanh chóng.	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-171023-122248.jpg	Trang bị chip Exynos 1380 mạnh mẽ	70
584	Một trong những điểm đáng chú ý nhất của Samsung Galaxy Tab S9 FE WiFi chính là viên pin có dung lượng lớn 8000 mAh. Điều này biến chiếc tablet này thành một công cụ đáng tin cậy cho cả ngày làm việc hoặc giải trí mà không cần phải lo lắng về việc sạc pin thường xuyên.  Với viên pin dung lượng khủng này, bạn có thể thỏa sức sử dụng Galaxy Tab S9 FE WiFi trong nhiều giờ liên tục. Từ xem phim và đọc sách điện tử đến làm việc trên các ứng dụng nặng, chiếc tablet này sẽ luôn sẵn sàng theo bạn trong cả ngày mà không cần lo lắng về việc sạc pin giữa chừng.	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-171023-122250.jpg	Trang bị pin 8000 mAh cùng công suất sạc 45 W	70
585	Tổng kết, Samsung Galaxy Tab S9 FE WiFi là một chiếc máy tính bảng khá ổn trong phân khúc tầm trung, máy vừa có hiệu năng ổn, thiết kế đẹp cũng như một viên pin lớn cung cấp khả năng sử dụng dành cho bạn trong cả ngày dài.			70
586	OPPO Pad Air được thiết kế mỏng nhẹ với khung nhựa nhám tạo nên vẻ ngoài sang trọng và chắc chắn. Với độ dày chỉ 6.94 mm và khối lượng 440 g, vì thế máy tính bảng này dễ dàng mang theo bên mình để có thể sử dụng ở bất kỳ đâu.	https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104114.jpg	Thiết kế trẻ trung hiện đại	71
587	Thiết kế của OPPO Pad Air cũng rất tiện dụng với các nút bấm được đặt hợp lý trên viền máy, cho phép người dùng dễ dàng điều khiển và sử dụng. Ngoài ra, cách tạo hình vuông vắn cũng sẽ đem đến cái nhìn ấn tượng hơn giúp tăng độ sang trọng và cao cấp.			71
588	Màn hình IPS LCD rộng 10.36 inch với độ phân giải 1200 x 2000 Pixels mang lại trải nghiệm hình ảnh chất lượng cao, bởi độ chi tiết cực lớn cùng không gian hiển thị rộng rãi giúp cho mọi nội dung bạn xem đều có thể trở nên chân thực.	https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104120.jpg	Thoải mái xem phim với màn hình lớn	71
589	Màn hình của OPPO Pad Air có độ tương phản tốt, độ sáng cao và màu sắc bắt mắt cho phép người dùng tận hưởng các nội dung giải trí và làm việc một cách dễ dàng. 			71
590	OPPO Pad Air có camera sau 8 MP và camera trước 5 MP cho phép người dùng chụp ảnh và quay video với chất lượng tốt. Camera sau của máy được tinh chỉnh bởi nhiều tính năng, giúp bạn chụp ảnh tốt hơn trong điều kiện ánh sáng yếu. 	https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104131.jpg	Hỗ trợ khả năng chụp ảnh và quay video Full HD	71
591	OPPO Pad Air được trang bị bộ vi xử lý Qualcomm Snapdragon 680 và RAM 4 GB cho phép máy tính bảng này hoạt động mượt mà và xử lý tốt các tác vụ đa nhiệm.   Chiếc máy tính bảng OPPO này cũng sẽ có bộ nhớ trong 128 GB và hỗ trợ thẻ nhớ ngoài lên đến 512 GB giúp người dùng lưu trữ nhiều hơn các tập tin, ảnh và video yêu thích của mình.	https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-150423-104138.jpg	Hiệu năng đáp ứng tốt nhiều tác vụ cơ bản	71
592	Máy tính bảng sử dụng pin Li-Po 7100 mAh, cho thời lượng sử dụng lâu hơn so với các thiết bị khác cùng phân khúc. Ngoài ra, đây còn là mẫu máy tính bảng sạc pin nhanh thông qua cổng Type-C với công suất 18 W, giúp bạn tiết kiệm thời gian sạc để có thể sử dụng một cách thoải mái. 	https://cdn.tgdd.vn/Products/Images/522/281821/oppo-pad-air-10-1.jpg	Sử dụng dài lâu với viên pin lớn 	71
593	Với thiết kế mỏng nhẹ và tiện dụng, màn hình chất lượng cao, camera tốt, hiệu năng mạnh mẽ và pin lâu dài, OPPO Pad Air là sự lựa chọn hoàn hảo cho những người dùng yêu thích công nghệ và giải trí di động.			71
594	Chiếc máy tính bảng Lenovo này có một thiết kế sang trọng với gam màu xanh hiện đại và cuốn hút giúp đem đến sự tươi trẻ cũng như tăng tính thẩm mỹ lên trên một chiếc máy tính bảng.	https://cdn.tgdd.vn/Products/Images/522/306923/lenovo-tab-m9-190623-043944.jpg	Vẻ đẹp đến từ sự đơn giản	72
595	Về phần thiết kế của máy, lần này hãng đã làm cho máy có vẻ ngoài mỏng nhẹ cùng với các cạnh bên được làm phẳng và bo tròn về 4 góc, cho bạn cảm giác cầm nắm chắc chắn và dễ dàng.			72
596	Về màn hình của tablet, Lenovo Tab M9 được trang bị tấm nền IPS LCD với kích thước 9 inch, kết hợp cùng với loa kép được tăng cường bởi Dolby Atmos giúp cho những phút giây thư giãn trở nên trọn vẹn khi cảm nhận hình ảnh hay âm thanh đều hết sức chân thực.	https://cdn.tgdd.vn/Products/Images/522/306923/lenovo-tab-m9-4.jpg	Tận hưởng niềm vui qua những thước phim	72
597	Tính năng chế độ đọc sẽ giúp cho trải nghiệm đọc sách hoặc lướt web trên máy tính bảng tốt hơn. Đồng thời sản phẩm cũng được chứng nhận chăm sóc mắt bởi TUV, điều này giúp bảo vệ đôi mắt của bạn một cách tốt hơn trước những tác hại của ánh sáng xanh.			72
598	Cung cấp sức mạnh cho máy là con chip MediaTek Helio G80 đến từ nhà MediaTek với xung nhịp tối đa 2 GHz. Máy sẽ đáp ứng tốt các tác vụ như lướt web, xem phim hay chơi những tựa game nhẹ nhàng.	https://cdn.tgdd.vn/Products/Images/522/306923/lenovo-tab-m9-190623-040223.jpg	Ổn định với các tác vụ hằng ngày	72
599	Lenovo trang bị cho máy tính bảng RAM 4 GB, bộ nhớ lưu trữ 64 GB kèm khả năng mở rộng lên đến 128 GB nhờ thẻ Micro SD. Giờ đây các tác vụ đa nhiệm cũng như khả năng lưu trữ sẽ được diễn ra tốt hơn.			72
\.


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.description (id, title, product_id) FROM stdin;
1	Camera IP 360 Độ 2MP TIANDY TC-H322N là một sản phẩm camera thông minh với khả năng quan sát toàn cảnh không gian trong nhà cùng độ phân giải cao và nhiều tính năng tiện ích khác, hứa hẹn đây sẽ là trợ thủ đắc lực giúp bạn bảo vệ cho ngôi nhà của mình.	tiandy-tc-h322n
2	Laptop Lenovo Ideapad Slim 3 15IAH8 i5 12450H (83ER000EVN) một mẫu laptop học tập - văn phòng sở hữu cấu hình mạnh mẽ với con chip Intel dòng H, RAM 16 GB cùng đa dạng các công nghệ hiện đại, hứa hẹn sẽ mang đến cho người dùng những trải nghiệm sử dụng làm việc và giải trí đa phương tiện một cách tối ưu và đầy tiện nghi.	laptop-lenovo-ideapad-slim-3
3	iPhone 15 Pro Max mẫu điện thoại mới nhất của Apple cuối cùng cũng đã chính thức được ra mắt vào tháng 09/2023. Mẫu điện thoại này sở hữu một con chip với hiệu năng mạnh mẽ Apple A17 Pro, màn hình đẹp mắt và cụm camera vô cùng chất lượng.	iphone-15-pro-max
4	Dell Inspiron 14 5440 i5U085W11IBU là chiếc laptop mỏng nhẹ vô cùng phù hợp cho các bạn học sinh, sinh viên, dân văn phòng nhu cầu cần một chiếc laptop đáp ứng tốt tất cả các tác vụ cơ bản, học tập, giải trí nhẹ nhàng. Dell Inspiron 14 5440 i5U085W11IBU hứa hẹn sẽ là một đối thủ tiềm năng trong phân khúc laptop dưới 25 triệu. 	laptop-dell-inspiron-14-5440
5		tp-link-tapo-tc70
6	ASUS Vivobook 14 OLED A1405ZA KM264W mang lại trải nghiệm hình ảnh tốt hơn với trang bị màn hình OLED. Thiết kế mỏng nhẹ cùng cấu hình mạnh mẽ cho phép người dùng nâng cao hiệu suất khi làm việc.	laptop-asus-vivobook-14-oled
7	iPhone 15 128GB là mẫu điện thoại cao cấp được Apple cho ra mắt vào tháng 09/2023, máy nhận được nhiều sự chú ý đến từ người dùng khi mang trong mình bộ cấu hình cực khủng, vẻ ngoài thu hút cùng khả năng quay video - chụp ảnh đỉnh cao.	điện-thoại-iphone-15-128gb
8	Camera IP 360 Độ 3MP IMOU RANGER RC GK2CP-3C0WR có kiểu dáng nhỏ gọn, thiết kế đẹp mắt kết hợp nhiều tiện ích thông minh như cuộc gọi 1 chạm, theo dõi thông minh, đàm thoại 2 chiều,... đây chắc hẳn là món phụ kiện cần thiết dành cho gia đình bạn.	imou-ranger-rc-gk2cp-3c0wr
9	Luôn giữ vững vị thế của mình trong ngành laptop văn phòng, ASUS liên tục cố gắng hoàn thiện và cải tiến sản phẩm của mình để phù hợp với nhu cầu sử dụng của người dùng. Trong đó, dòng sản phẩm Expertbook từ ASUS đang dần trở thành dòng laptop phù hợp cho mọi nhu cầu học tập và công việc. Sau đây sẽ là thời gian chúng ta tìm hiểu chi tiết về model ASUS Expertbook mới với mã B1 B1402CBA NK1535W.	laptop-asus-expertbook-b1
10	Là một trong những dòng laptop mỏng nhẹ có hiệu năng cao, thiết kế đẹp mắt, laptop ASUS Vivobook 16 M1605YA MB303W từ khi ra mắt đã là một trong những mẫu laptop mà dân văn phòng không thể bỏ qua. Sở hữu cấu hình mạnh mẽ với thiết kế văn phòng, ASUS Vivobook 16 M1605YA MB303W không chỉ có thể đáp ứng các tác vụ cơ bản mà còn cả nhu cầu thiết kế đồ họa lẫn lập trình.	laptop-asus-vivobook-16
11	Camera IP 360 Độ 3MP BOTSLAB C212 có thiết kế nhỏ gọn, dễ dàng lắp đặt, cùng nhiều tiện ích thông minh như phát hiện và theo dõi chuyển động với góc nhìn lên tới 360 độ, báo động khi có âm thanh bất thường,... hứa hẹn sẽ đem lại nhiều trải nghiệm thú vị cho người dùng.	botslab-c212
12	Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.	điện-thoại-iphone-11-64gb
13	Asus ZenBook Flip OLED UP3404VA KN039W mang đến một siêu phẩm laptop học tập làm việc. Sở hữu sức mạnh từ con chip Intel Gen13 mới nhất để xử lý mọi công việc từ đơn giản đến phức tạp. Màn hình cảm ứng OLED hứa hẹn sẽ đem lại những trải nghiệm hấp dẫn cho bạn. 	laptop-asus-zenbook-flip-oled
14	Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 series với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.	điện-thoại-iphone-13-128gb
15	iPhone 15 Plus 256GB là mẫu điện thoại cao cấp của Apple được ra mắt vào tháng 09/2023, máy nhận được khá nhiều sự quan tâm đến từ người dùng khi mang đến một sự nâng cấp mạnh mẽ so với iPhone 14 Plus trước đó. Nổi bật nhất có thể kể đến như: Camera 48 MP, chip Apple A16 Bionic, Dynamic Island.	điện-thoại-iphone-15-plus-256gb
17	Bạn cần tìm một chiếc laptop cơ động có thể cùng bạn đến bất cứ đâu. Vậy Laptop Lenovo Ideapad 1 14ALC7 82R30077VN có thể là người bạn đồng hành tuyệt vời của bạn. Với thiết kế mỏng nhẹ chỉ có 1.38kg bạn sẽ không cảm thấy quá nặng nề khi mang theo người bạn này.	laptop-lenovo-ideapad-1
18	Camera IP 360 Độ 4MP EZVIZ H6C Pro sở hữu thiết kế đẹp mắt, màu sắc thanh lịch, cùng nhiều tính năng quan sát thông minh như chế độ tự động tuần tra theo các điểm đặt trước, phát hiện con người, phát hiện và gửi cảnh báo tiếng ồn lớn đến điện thoại, hỗ trợ gọi điện, đàm thoại 2 chiều,... hứa hẹn mang đến trải nghiệm tuyệt vời cho người dùng.	ezviz-h6c-pro
19	Laptop Lenovo ThinkPad E16 Gen 1 21JN005MVN là một trong những sản phẩm của dòng ThinkPad của Lenovo, với sự kết hợp giữa hiệu suất ổn định và tính di động. Dưới đây là một số thông tin chi tiết về sản phẩm này.	laptop-lenovo-thinkpad-e16
20	Samsung Galaxy A55 5G, mẫu điện thoại mới của dòng Galaxy A, ra mắt với nhiều công nghệ tiên phong kèm theo kết nối 5G nhanh chóng. Được giới thiệu như một lựa chọn đa năng, chất lượng cao nhưng có mức giá hợp lý, hứa hẹn sẽ là sản phẩm đáng chú ý trên thị trường.	samsung-galaxy-a55-5g
21	Nếu bạn đang tìm một chiếc laptop linh động với hiệu suất cao mà lại vừa mỏng nhẹ, đạp mắt hỗ trợ bạn trong học tập và làm việc thì chiếc laptop Lenovo Yoga Slim 7 14IMH9 83CV001UVN là một lựa chọn tuyệt vời. Cùng GearVN đánh giá qua về chiếc laptop cơ động này nhé!	laptop-lenovo-yoga-slim-7
22	Chiếc Laptop này sẽ trở thành một trợ thủ đắc lực cho học sinh, sinh viên với thiết kế đặc trưng mỏng nhẹ của dòng Lenovo Ideapad, nhưng sức mạnh xử lý các tác vụ công việc của Laptop Lenovo Ideapad Slim 5 16IMH9 83DC001RVN là không thể xem nhẹ, nó sẽ giúp bạn tối ưu được thời gian và đạt được chất lượng công việc cao. 	lenovo-ideapad-slim-5-16imh9
23	Samsung Galaxy A24 6GB tiếp tục là mẫu điện thoại tầm trung được nhà Samsung giới thiệu đến thị trường Việt Nam vào tháng 04/2023, máy nổi bật với giá thành rẻ, màn hình Super AMOLED cùng camera 50 MP chụp ảnh sắc nét.	samsung-galaxy-a24
24	Samsung Galaxy Z Flip5 đã chính thức ra mắt vào ngày 26 tháng 7. Đây là một chiếc điện thoại thông minh có thiết kế độc đáo với màn hình gập, được trang bị bộ vi xử lý cao cấp Snapdragon 8 Gen 2 for Galaxy, RAM 8 GB, bộ nhớ trong 256 GB, camera kép 12 MP và pin 3700 mAh.	samsung-galaxy-z-flip5-5g
25	Samsung Galaxy Z Fold5 là mẫu điện thoại cao cấp được ra mắt vào tháng 07/2023 với nhiều điểm đáng chú ý như thiết kế gập độc đáo, hiệu năng mạnh mẽ nhờ chip Snapdragon 8 Gen 2 for Galaxy cùng camera quay chụp sắc nét.	samsung-galaxy-z-fold5-5g
26	vivo Y03 tiếp tục là một mẫu điện thoại giá rẻ được vivo ra mắt tại thị trường Việt Nam. Sản phẩm lần này mang đến một diện mạo đẹp mắt hơn các phiên bản trước đó, tiếp đến là cấu hình nâng cấp cùng viên pin lớn 5000 mAh.	vivo-y03
27	Mang một thiết kế hiện đại, thời thượng, hệ thống camera sắc nét, viên pin khủng 6000 mAh, hiệu năng ổn định lâu dài,... vivo Y28 8GB/128GB sẽ là lựa chọn hàng đầu cho các nhu cầu sử dụng, giải trí cơ bản của người dùng. 	vivo-y28
28	OPPO chính thức giới thiệu sản phẩm OPPO Find N3 5G, một chiếc điện thoại thông minh với thiết kế gập ngang hoàn toàn hiện đại và đẳng cấp, nổi bật với camera và hiệu năng đứng đầu. Đây là một bước đột phá của OPPO trong việc kết hợp sự tiện ích và thẩm mỹ tối ưu, đem lại trải nghiệm độc đáo cho người dùng.	oppo-find-n3-5g
29	OPPO Reno11 5G tiếp tục mang đến sự hấp dẫn cho người dùng, lấy cảm hứng từ những thành công trước đó. Điểm độc đáo của chiếc điện thoại nằm ở thiết kế thu hút, cấu hình mạnh mẽ và khả năng chụp ảnh ấn tượng. Được tạo ra để đáp ứng một loạt các nhu cầu từ giải trí, nhiếp ảnh đến công việc đòi hỏi hiệu năng cao.	oppo-reno11-5g
30	Phiên bản MacBook Air M1 với tùy chọn bộ nhớ RAM lên tới 16GB sẽ giúp cho khả năng làm việc đa nhiệm của bạn hiệu quả hơn, công việc trôi chảy hơn khi bạn có thể làm rất nhiều việc cùng lúc.	macbook-air-13-inch-m1-2020
31	MacBook Air M2 2023 giờ đây sẽ mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.	macbook-air-15-inch-m2-2023
32	Mang trong mình chip M3 thế hệ mới, MacBook Air M3 2024 đánh dấu bước thăng tiến mạnh mẽ về sức mạnh. Bộ vi xử lý cao cấp giúp sản phẩm có được nguồn hiệu năng đáng nể mà vẫn ghi điểm mạnh về ngoại hình nhờ phong cách thiết kế tinh gọn, thanh lịch và cực kỳ chuyên nghiệp.	macbook-air-m3-13-inch-2024
33	Với sự góp mặt của chip M3 có kiến trúc GPU hoàn toàn mới, MacBook Pro M3 2023 cho thấy bước nhảy vọt mạnh mẽ về sức mạnh đồ họa. Bộ vi xử lý tối tân giúp xử lý nhanh chóng các tác vụ chuyên nghiệp, đồng thời mang tới trải nghiệm pin dài lâu suốt ngày dài tới đêm thâu.	macbook-pro-14-2023-m3
34	Được trang bị màn hình Liquid Retina XDR 16 inch, MacBook Pro 16 2023 M2 Pro sẽ trình diễn trước mắt bạn những khung hình sống động, chi tiết và sắc nét. Điểm nhấn của sản phẩm nằm ở bộ vi xử lý M3 Pro cực mạnh, hỗ trợ xử lý các tác vụ liên quan đến đồ họa và lập trình cực kỳ hữu hiệu.	macbook-pro-16-2023-m3-pro
35	Asus TUF Gaming FX507ZC4-HN095W sẽ luôn đồng hành dài lâu bên bạn trong mọi trận đấu và mang về chiến thắng đầy vinh quang. Chiếc laptop gaming này sở hữu cấu hình mạnh đáng mơ ước, đồng thời tích hợp nhiều thứ giúp cho những cuộc vui trong thế giới ảo của bạn thêm phần hoàn mỹ. Chỉ cần mở máy và thưởng thức những tựa game yêu thích, bạn sẽ thấy Asus TUF Gaming FX507ZC4-HN095W mạnh như thế nào.	asus-tuf-gaming-fx507zc4
36	Dell Vostro 15 3520 là lựa chọn laptop văn phòng màn hình lớn, cấu hình ấn tượng với bộ vi xử lý Intel Core i5 Gen 12, RAM 16GB và màn hình 15,6 inch Full HD 120 Hz siêu mượt. Kết hợp với thiết kế đẳng cấp từ Dell, bạn sẽ có một lựa chọn laptop đáng tin cậy cho công việc.	dell-vostro-v3520
37	Dell Inspiron 15 N3530 không chỉ là một chiếc laptop thương hiệu Mỹ mạnh mẽ mà còn là một người bạn đồng hành lý tưởng cho sinh viên và dân văn phòng. Với cấu hình ấn tượng và các tính năng nổi bật, sản phẩm này đảm bảo sự hiệu quả và thoải mái trong mọi công việc của bạn.	dell-inspiron-15-n3530
38	Là cái tên luôn nằm trong top đầu những thương hiệu laptop văn phòng uy tín nhất hiện, Dell nổi tiếng với những sản phẩm chất lượng, chỉnh chu tới từng chi tiết nhỏ nhất và Dell Latitude 3520 P108F001 70280538 cũng không phải ngoại lệ. Sở hữu thiết kế nhỏ gọn, sang trọng, mỏng nhẹ cùng hiệu năng cao vượt trội, đây luôn là lựa chọn hoàn hảo với những ai muốn tìm một chiếc laptop phục vụ cho công việc.	dell-latitude-3520
57	Camera IP 360 Độ 5MP EZVIZ H6 có thiết kế đẹp mắt, kiểu dáng nhỏ gọn cùng nhiều tính năng thông minh được tích hợp như theo dõi chuyển động, tự động thu phóng, phát hiện dáng người và vật nuôi, nhận diện và điều khiển bằng cử chỉ vẫy tay,... hứa hẹn đem đến cho người dùng trải nghiệm tuyệt vời.	ezviz-h6
39	Dù có tên là Gaming, song chiếc laptop Acer Aspire 7 Gaming A715-76-57CY được sinh ra là để phục vụ cho nhân viên văn phòng hoặc các bạn sinh viên muốn tìm kiếm một sản phẩm phù hợp để sử dụng mỗi ngày và quan trọng nhất là mức giá phải rẻ. Đây là sản phẩm mới nhất trong dòng Acer Aspire vốn đã nổi tiếng và quen thuộc với rất nhiều người yêu công nghệ từ trước tới nay.	acer-aspire-7-gaming-a715
40	Acer Aspire 3 A315-510P-34XZ mang đến giá trị sử dụng cực lớn trong tầm giá rẻ khi đây là chiếc laptop bạn có thể sử dụng để đi học, đi làm hiệu quả. Bộ vi xử lý mới Alder Lake-N mạnh mẽ, bộ nhớ tốc độ cao và màn hình lớn Full HD được tích hợp trong một sản phẩm mỏng nhẹ, thời trang.	acer-aspire-3
41	Là chiếc laptop gaming thế hệ mới nhất thuộc dòng Nitro 5 luôn chiếm được rất nhiều cảm tình của game thủ trước đây, Acer Nitro Gaming AN515-58-769J nay còn ấn tượng hơn nữa với bộ vi xử lý Intel Core i7 12700H cực khủng và card đồ họa RTX 3050, sẵn sàng cùng bạn chinh phục những đỉnh cao.	acer-nitro-gaming-an515
42	Acer Swift Go SFG14-41-R19Z là chiếc laptop mỏng nhẹ cao cấp thuộc dòng Swift Go AMD mới nhất từ Acer. Với thiết kế siêu mỏng nhẹ, Acer Swift Go vẫn đủ sức mạnh để giải quyết mọi việc dễ dàng. Đặc biệt, sản phẩm này có webcam QHD siêu nét, phù hợp cho những người thường xuyên làm việc online qua video.	laptop-acer-swift-go-sfg14
43	Xiaomi Redmi A3 là một sản phẩm giá rẻ vừa được Xiaomi ra mắt trong dịp đầu năm 2024, máy nổi trội nhờ có mức giá tốt nhưng lại sở hữu một vài điểm nổi bật. Đặc biệt, máy tích hợp viên pin 5000 mAh, có màn hình lớn 6.71 inch và có thêm tần số quét 90 Hz.	xiaomi-redmi-a3
44	Xiaomi tiếp tục cho ra mắt một chiếc điện thoại tầm trung mới mang tên gọi Xiaomi Redmi Note 13 Pro+ 5G. Sản phẩm được chăm chút với thiết kế trang nhã và độc đáo, không chỉ mang lại vẻ đẹp hiện đại mà còn nâng cao đẳng cấp sang trọng. Điểm đặc biệt nổi bật của sản phẩm là khả năng hiển thị và hiệu suất mạnh mẽ, tạo ra trải nghiệm sử dụng tối ưu.	xiaomi-redmi-note-13-pro+-5g
45	realme C65 (8GB/256GB) là một trong những chiếc điện thoại thông minh độc đáo và đáng chú ý trong phân khúc giá phổ thông. Với thiết kế hiện đại và các tính năng thú vị, hứa hẹn mang lại trải nghiệm tuyệt vời cho người dùng.	realme-c65
46	Nhằm mang đến cho người dùng thêm nhiều lựa chọn ở phân khúc giá rẻ thì realme đã cho ra mắt realme C67, một sản phẩm nổi bật với thiết kế sang trọng, camera chụp ảnh đẹp cùng pin lớn có sạc nhanh, hứa hẹn đem đến nhiều trải nghiệm tốt cho người dùng.	realme-c67
47	Với thiết kế thanh lịch, hiệu suất mạnh mẽ và đặc biệt là công nghệ NXTPAPER cùng âm thanh 3D sống động, TCL 40 NXTPAPER hứa hẹn mang đến cho người dùng những trải nghiệm giải trí tuyệt vời ở mọi lúc, mọi nơi.	tcl-40-nxtpaper
48	Trong thế giới điện thoại di động ngày nay, tìm một chiếc smartphone vừa túi tiền nhưng vẫn chất lượng không phải là điều dễ dàng. TCL 406s, một lựa chọn mới nổi hứa hẹn sẽ thay đổi suy nghĩ đó với những tính năng ấn tượng không kém cạnh bất kỳ chiếc điện thoại cao cấp nào.	tcl-406s
49	Samsung Galaxy S24 Ultra mẫu điện thoại cao cấp được ra mắt vào đầu năm 2024, sản phẩm tiếp tục kế thừa và cải tiến từ thế hệ trước. Điểm đặc biệt là sử dụng chip Snapdragon 8 Gen 3 for Galaxy, camera 200 MP và tích hợp nhiều tính năng AI.	samsung-galaxy-s24-ultra
50	Samsung Galaxy A35 5G là một trong những dòng điện thoại thông minh tầm trung đáng chú ý của Samsung. Máy sở hữu cho mình một hiệu suất mạnh mẽ, màn hình sắc nét và viên pin lớn, chiếc điện thoại hứa hẹn mang đến trải nghiệm đa dạng và tuyệt vời cho người dùng.	samsung-galaxy-a35
51	iPhone 14 Pro Max 1TB là phiên bản điện thoại cao cấp nhất mà Apple đã cho ra mắt tại sự kiện giới thiệu sản phẩm mới cho năm 2022. Được thừa hưởng mọi công nghệ hàng đầu thế giới nên máy hứa hẹn sẽ mang lại trải nghiệm sử dụng tốt nhất từ chơi game cho tới chụp ảnh, xứng đáng là chiếc điện thoại đáng mua nhất trên thị trường hiện tại.	iphone-14-pro-max
52	Camera IP Ngoài trời 360 Độ 5MP IMOU Cruiser Dual S7XP-10M0WED là lựa chọn hoàn hảo cho việc giám sát an ninh ngoài trời. Với độ phân giải cao, góc nhìn rộng, thiết kế chống nước và bụi, cùng nhiều tính năng thông minh, sản phẩm này sẽ mang lại sự an tâm và bảo vệ tối đa cho bạn và gia đình.	imou-cruiser-dual-s7xp-10m0wed
53	Camera IP Ngoài trời 360 Độ 5MP IMOU Cruiser 2 GS7EP-5M0WE là một thiết bị an ninh hàng đầu, cung cấp giám sát toàn diện và chi tiết với nhiều tính năng vượt trội. Thiết kế nhỏ gọn và khả năng xoay linh hoạt giúp camera này trở thành lựa chọn lý tưởng cho việc bảo vệ ngôi nhà hoặc doanh nghiệp của bạn.	imou-cruiser-2-gs7ep-5m0we
54	Acer Swift Edge SFA16-41-R3L6 đi đầu xu hướng khi là chiếc laptop doanh nhân màn hình 16 inch nhẹ nhất thế giới. Một chiếc laptop hiện đại giờ đây không chỉ nhỏ gọn, mạnh mẽ mà còn phải sở hữu màn hình lớn, nâng tầm trải nghiệm. Swift Edge còn làm được hơn thế khi trang bị màn hình độ phân giải 4K siêu nét trong thiết kế đẹp như một tuyệt tác.	acer-swift-edge-sfa16
55	Samsung tiếp tục chiếm lĩnh thị trường điện thoại thông minh với sự xuất hiện của Samsung Galaxy S23 FE 5G. Điện thoại này được trang bị camera 50 MP có khả năng quay video 8K, màn hình 120 Hz. Với những tính năng này, hứa hẹn sẽ mang đến trải nghiệm tuyệt vời, đáp ứng mọi nhu cầu của người dùng.	samsung-galaxy-s23-fe
56	Dòng Nitro 5 được yêu thích của Acer nay đã xuất hiện phiên bản mới Tiger 2022. Acer Nitro 5 Tiger AN515-58-52SP được nâng cấp toàn diện về cả thiết kế và hiệu năng, đặc biệt là sức mạnh từ bộ vi xử lý Intel thế hệ thứ 12 hoàn toàn mới, sẽ cùng các game thủ vượt qua mọi giới hạn.	acer-nitro-5-tiger-gaming-an515
58	Samsung Galaxy M15 5G 4GB/128GB là một trong những chiếc smartphone 5G giá rẻ được Samsung ra mắt trong thời gian gần đây. Với thiết kế trẻ trung, màn hình lớn, hiệu năng ổn định, camera chất lượng và viên pin dung lượng khủng, Galaxy M15 5G hứa hẹn sẽ là lựa chọn hấp dẫn cho người dùng phổ thông.	samsung-galaxy-m15-5g
59	HP 245 G10 được nâng cấp mạnh mẽ về cấu hình, sở hữu thiết kế hiện đại hơn so với thế hệ trước nhưng vẫn được bán với giá rất rẻ, xứng đáng là chiếc laptop phù hợp cho tất cả mọi người. Dù bạn là sinh viên, nhân viên văn phòng hay doanh nhân, HP 245 G10 vẫn đáp ứng xuất sắc nhu cầu sử dụng.	hp-245-g10
60	Dù có thiết kế nhỏ gọn với màn hình 14 inch, HP Pavilion 14-dv2073TU vẫn tự tin giải quyết tốt các nhu cầu sử dụng hàng ngày của bạn vì máy có hệ thống phần cứng mạnh mẽ. Đồng thời, bạn còn có thể cho máy vào balo hoặc túi đựng và mang đi bất kì nơi nào.	hp-pavilion-14-dv2073tu
61	Nokia 220 4G là chiếc điện thoại phổ thông có một thiết kế bền bỉ, nhẹ nhàng và hiện đại. Với màn hình 2.8 inch rõ nét, hỗ trợ 4G VoLTE cho chất lượng cuộc gọi cao, cùng nhiều tiện ích thông minh, đây chính là lựa chọn đáng giá cho mọi nhu cầu liên lạc hằng ngày.	nokia-220-4g
62	Dòng sản phẩm ProBook của HP luôn được các doanh nhân trong và ngoài nước tin dùng, ưa chuộng vì rất nhiều yếu tố như thiết kế đẹp và sang trọng - cấu hình mạnh mẽ chạy được nhiều phần mềm - tích hợp tính năng bảo mật dữ liệu an toàn - nhiều cổng kết nối thuận tiện cho quá trình sử dụng. Sản phẩm HP ProBook 440 G10 sẽ tiếp nối truyền thống này của thương hiệu.	hp-probook-440-g10
63	Trong thế giới đầy ảo diệu và rộng lớn của các tựa game hiện nay, việc lựa chọn một chiếc laptop gaming mạnh mẽ và phù hợp là điều vô cùng cần thiết để các game thủ được tận hưởng những giờ phút giải trí sảng khoái nhất. Giữa một rừng sản phẩm, HP Gaming Victus 16-s0078AX nổi bật lên là một lựa chọn cực kì giá trị và đáng tin cậy. Thiết kế đẹp mắt, hiệu năng phần cứng mạnh mẽ, màn hình chất lượng cao với những hình ảnh cực kì thu hút... những yếu tố có trên HP Gaming Victus 16-s0078AX này sẽ cùng các game thủ đi qua mọi trận chiến cùng các cung bậc cảm xúc khi chơi game.	hp-gaming-victus-16-s0078ax
64	vivo V30 kết hợp thiết kế sang trọng, hiệu suất vượt trội và hệ thống camera đỉnh cao, mang đến trải nghiệm người dùng toàn diện. Với nhiều tính năng tiên tiến và thiết kế tinh tế, vivo V30 5G không chỉ đáp ứng nhu cầu công nghệ hằng ngày mà còn nâng tầm phong cách và tiện nghi cho người dùng.	vivo-v30-5g
65	Trong tầm giá rẻ, HP 14s-em0080AU làm được nhiều hơn những gì bạn nghĩ. Bộ vi xử lý AMD Ryzen 7000 series mới nhất mang tới hiệu năng mạnh mẽ, thiết kế nhỏ gọn và bền bỉ, HP 14s-em0080AU là chiếc máy tính xách tay sẽ nâng cao năng suất làm việc của bạn.	hp-14s-em0080au
66	Sau nhiều thế hệ điện thoại của Apple thì cái tên “Plus” cũng đã chính thức trở lại vào năm 2022 và xuất hiện trên chiếc iPhone 14 Plus 128GB, nổi trội với ngoại hình bắt trend cùng màn hình kích thước lớn để đem đến không gian hiển thị tốt hơn cùng cấu hình mạnh mẽ không đổi so với bản tiêu chuẩn.	iphone-14-plus-128gb
67	Với thiết kế thời thượng và độ mỏng tối ưu, công nghệ OLED hai lớp chất lượng cao, cùng hiệu năng mạnh mẽ từ chip Apple thế hệ mới, iPad Pro M4 13 inch là lựa chọn xuất sắc cho người dùng yêu công nghệ. Thiết bị đáp ứng mọi nhu cầu từ công việc đến giải trí, đặc biệt phù hợp cho những ai hoạt động trong lĩnh vực sáng tạo và thiết kế.	ipad-pro-m4-13-inch-wifi-256gb
69	Tại sự kiện Unpacked 2023 diễn ra tại Hàn Quốc, Samsung đã trình làng mẫu máy tính bảng Samsung Galaxy S thế hệ mới Samsung Galaxy Tab S9+ WiFi 256GB. Máy sở hữu hiệu năng mạnh mẽ, màn hình hiển thị sắc nét và điểm đặc biệt đây là máy có khả năng kháng nước IP68 cùng nhiều tính năng hấp dẫn khác.	samsung-galaxy-tab-s9+-wifi
70	Samsung Galaxy Tab S9 FE WiFi 128GB được Samsung cho ra mắt vào tháng 10/2023 và mang đến nhiều sự chú ý từ vẻ ngoài cho đến cấu hình bên trong. Những điểm nổi bật mà ta có thể chú ý như trang bị chip Exynos 1380, RAM 6 GB, pin lớn 8000 mAh cũng như có sạc nhanh 45 W.	samsung-galaxy-tab-s9-fe-wifi
71	OPPO Pad Air 128GB là một máy tính bảng đáng chú ý, được thiết kế để đáp ứng nhu cầu đa dạng của người dùng. Với một số thông tin nổi bật như màn hình lớn và hiệu năng ổn định, OPPO Pad Air có thể là lựa chọn tuyệt vời cho những người dùng cần một máy tính bảng đa năng và tiện lợi.	oppo-pad-air-wifi
72	Nhằm mang đến nhiều sự lựa chọn hơn cho dòng máy tính bảng của hãng thì mới đây Lenovo cũng đã cho ra mắt mẫu máy tính bảng Lenovo Tab M9. Máy sở hữu vẻ ngoài đơn giản tinh tế, màn hình lớn cùng một hiệu năng ổn định với các tác vụ.	lenovo-tab-m9-4g
\.


--
-- Data for Name: feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature (id, os, battery, chip, made_time, screen, product_id) FROM stdin;
1		0	EasyLive Lite	2019-01-08 17:00:00		tiandy-tc-h322n
5		0	Tapo	2023-01-08 17:00:00		tp-link-tapo-tc70
8		0	Imou Life	2022-01-08 17:00:00		imou-ranger-rc-gk2cp-3c0wr
11		0	Botslab	2022-01-04 17:00:00		botslab-c212
36	Windows	75	Intel, Core i5, 1235U	2022-01-05 17:00:00	15.6 inch, FHD (1920 x 1080), 120 Hz	dell-vostro-v3520
37	Windows	65	Intel, Core i5, 1335U	2022-12-31 17:00:00	 15.6 inch, FHD (1920 x 1080), 120 Hz	dell-inspiron-15-n3530
42	Windows	47	AMD, Ryzen 5, 7530U	2022-12-30 17:00:00	14 inch, FHD (1920 x 1080), IPS, 60 Hz	laptop-acer-swift-go-sfg14
12	IOS	3110	Apple A13 Bionic	2017-12-30 17:00:00	IPS LCD, 6.1", Liquid Retina	điện-thoại-iphone-11-64gb
18		0	EZVIZ	2023-01-05 17:00:00		ezviz-h6c-pro
20		5000	Exynos 1480 8 nhân	2000-01-10 17:00:00	Super AMOLED, 6.6", Full HD+	samsung-galaxy-a55-5g
38	Windows	0	Intel Core i7-1165G7	2023-01-05 17:00:00	15.6'' FHD (1920x1080), 60Hz	dell-latitude-3520
6	Windows	50	Intel Core i5 12500H	2023-12-30 17:00:00	14" 2.8K (2880 x 1800) OLED	laptop-asus-vivobook-14-oled
10	Windows	42	AMD Ryze 7 7730U	2020-12-30 17:00:00	16 inch WUXGA (1920 x 1200) 16:10	laptop-asus-vivobook-16
13	Windows	75	Intel  i7-1360P 2.2 GHz	2022-12-30 17:00:00	14.0-inch, 2.8K (2880 x 1800) OLED 16:10, 90Hz 	laptop-asus-zenbook-flip-oled
4		41	Intel Core i5-1334U	2022-12-30 17:00:00	14.0-inch FHD+ (1920 x 1200)	laptop-dell-inspiron-14-5440
17	Windows	42	AMD Ryzen 7 5700U	2020-12-30 17:00:00	14" FHD (1920x1080) IPS	laptop-lenovo-ideapad-1
2	Windows	47	15IAH8 i5 12450H	2022-12-30 17:00:00	15.6"Full HD (1920 x 1080) 60 Hz	laptop-lenovo-ideapad-slim-3
19	Windows	47	Intel Core i5-1335U	2022-12-30 17:00:00	16" WUXGA (1920x1200) IPS 	laptop-lenovo-thinkpad-e16
21	Windows	71	Intel Core Ultra 7 155H	2023-01-10 17:00:00	14" WUXGA (1920x1200) OLED	laptop-lenovo-yoga-slim-7
22	Windows	57	Intel Core Ultra 5 125H	2023-01-10 17:00:00	\t16" 2K (2048x1280) OLED	lenovo-ideapad-slim-5-16imh9
9	Windows	42	Intel Core i3-1215U	2020-12-30 17:00:00	14.0-inch, FHD (1920 x 1080) 16:9	laptop-asus-expertbook-b1
23	Android	5000	MediaTek Helio G99	2000-12-30 17:00:00	Super AMOLED, 6.5", Full HD+	samsung-galaxy-a24
3	IOS	4422	Apple A17 Pro 6 nhân	2022-12-30 17:00:00	OLED 6.7", Super Retina XDR	iphone-15-pro-max
14	IOS	3240	Apple A15 Bionic	2020-01-10 17:00:00	OLED, 6.1", Super Retina XDR	điện-thoại-iphone-13-128gb
7	IOS	3349	Apple A16 Bionic	2021-12-30 17:00:00	OLED, 6.1", Super Retina XDR	điện-thoại-iphone-15-128gb
25	Android	4400	Snapdragon 8 Gen 2 for Galaxy	2023-01-05 17:00:00	Dynamic AMOLED 2X, Chính 7.6" & Phụ 6.2", Quad HD+ (2K+)	samsung-galaxy-z-fold5-5g
26	Android	5000	MediaTek Helio G85	2024-01-01 17:00:00	IPS LCD, 6.56", HD+	vivo-y03
27	Android	6000	MediaTek Helio G85	2000-12-30 17:00:00	IPS LCD 6.68 " HD+	vivo-y28
28	Android	4805	Snapdragon 8 Gen 2 8 nhân	2000-12-30 17:00:00	AMOLED, Chính 7.82" & Phụ 6.31", Quad HD+ (2K+)	oppo-find-n3-5g
29	Android	5000	MediaTek Dimensity 7050 5G 8 nhân	2000-12-30 17:00:00	AMOLED, 6.7", Full HD+	oppo-reno11-5g
30	MAC OS	0	Apple, M1	2020-01-01 17:00:00	13.3 inch IPS LCD LED Backlit, True Tone	macbook-air-13-inch-m1-2020
31	MAC OS	35	Apple, M2, 8 - Core	2022-12-31 17:00:00	15.3 inch, 2960 x 1848, OLED, 60 Hz	macbook-air-15-inch-m2-2023
32	MAC OS	40	Apple M3	2023-12-30 17:00:00	13.6 inches True Tone	macbook-air-m3-13-inch-2024
33	MAC OS	70	Apple, M3, 8 - Core	2023-01-08 17:00:00	14.2 inch, 3024 x 1964 Pixels, IPS, 120 Hz	macbook-pro-14-2023-m3
34	MAC OS	140	Apple, M3 Pro, 12-Core	2023-01-08 17:00:00	16.2 inch, 3456 x 2234 Pixels, IPS, 120 Hz	macbook-pro-16-2023-m3-pro
35	Windows	56	Intel, Core i5, 12500H	2022-01-04 17:00:00	15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz	asus-tuf-gaming-fx507zc4
39	Windows	50	Intel, Core i5, 12450H	2001-01-05 17:00:00	15.6 inch, 1920 x 1080 Pixels, IPS, 60 Hz	acer-aspire-7-gaming-a715
40	Windows	47	Intel, Core i3, N305	2022-12-31 17:00:00	15.6 inch, 1920 x 1080 Pixels, IPS, 60	acer-aspire-3
41	Windows	58	Intel, Core i7, 12700H	2022-01-01 17:00:00	15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz	acer-nitro-gaming-an515
44	Android	5000	MediaTek Dimensity 7200 Ultra	2000-12-30 17:00:00	AMOLED, 6.67", 1.5K	xiaomi-redmi-note-13-pro+-5g
45	Android	5000	 MediaTek Helio G85	2000-12-30 17:00:00	IPS LCD, 6.67", HD+	realme-c65
46	Android	5000	Snapdragon 685 8 nhân	2000-12-30 17:00:00	IPS LCD, 6.72", Full HD+	realme-c67
47	Android	5010	MediaTek Helio G88	2000-12-30 17:00:00	IPS LCD, 6.78", Full HD+	tcl-40-nxtpaper
48	Android	5000	MediaTek MT6762 (Helio P22)	2000-12-30 17:00:00	IPS LCD 6.6 " HD+	tcl-406s
49	Android	5000	 Snapdragon 8 Gen 3 for Galaxy	2000-12-30 17:00:00	Dynamic AMOLED 2X, 6.8", Quad HD+ (2K+)	samsung-galaxy-s24-ultra
50	Android	5000	Exynos 1380 8 nhân	2000-12-30 17:00:00	Super AMOLED, 6.6", Full HD+	samsung-galaxy-a35
51	IOS	4323	Apple A16 Bionic	2000-12-30 17:00:00	OLED 6.7", Super Retina XDR	iphone-14-pro-max
52		0	Imou Life	2000-12-30 17:00:00		imou-cruiser-dual-s7xp-10m0wed
43	Android	5000	MediaTek Helio G36 8 nhân	2000-01-10 17:00:00	IPS LCD, 6.71", HD+	xiaomi-redmi-a3
53		0	Imou Life	2023-12-31 17:00:00		imou-cruiser-2-gs7ep-5m0we
54	Windows	54	AMD, Ryzen 7, 6800H	2022-01-01 17:00:00	16.0 inch, 3840 x 2400 Pixels, OLED, 60 Hz	acer-swift-edge-sfa16
55		4500	Exynos 2200 8 nhân	2000-12-30 17:00:00	Dynamic AMOLED 2X, 6.4", Full HD+	samsung-galaxy-s23-fe
56	Windows	58	Intel, Core i5, 12500H	2022-01-06 17:00:00	15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz	acer-nitro-5-tiger-gaming-an515
57		0	EZVIZ	2024-01-02 17:00:00		ezviz-h6
58	Android	6000	MediaTek Dimensity 6100+	2000-12-30 17:00:00	Super AMOLED, 6.5", Full HD+	samsung-galaxy-m15-5g
59	Windows	45	AMD, Ryzen 5, 7520U	2023-01-03 17:00:00	14 inch, 1920 x 1080 Pixels, IPS, 60  Hz	hp-245-g10
60	Windows	43	 Intel, Core i5, 1235U	2022-01-04 17:00:00	14.0 inch, 1920 x 1080 Pixels, IPS, 60 Hz	hp-pavilion-14-dv2073tu
61		1450	Unisoc T107	2000-12-30 17:00:00	2.8"	nokia-220-4g
24	Android	3700	Snapdragon 8 Gen 2 for Galaxy	2023-01-10 17:00:00	Chính: Dynamic AMOLED 2X, Phụ: Super AMOLED, Chính 6.7" & Phụ 3.4", Full HD+	samsung-galaxy-z-flip5-5g
62	Windows	51	Intel, Core i5, 1340P	2023-01-05 17:00:00	14.0 inch, 1920 x 1080 Pixels, IPS, 60 Hz	hp-probook-440-g10
63	Windows	50	AMD, Ryzen 5, 7640HS	2022-12-31 17:00:00	16.0 inch, 1920 x 1080 Pixels, WVA, 60 Hz	hp-gaming-victus-16-s0078ax
64	Android	5000	Snapdragon 7 Gen 3 8 nhân	2000-12-30 17:00:00	AMOLED, 6.78", 1.5K	vivo-v30-5g
65	Windows	47	AMD, Ryzen 3, 7320U	2022-12-31 17:00:00	14.0 inch, 1920 x 1080 Pixels, SVA, 60 Hz	hp-14s-em0080au
15	IOS	4383	Apple A16 Bionic	1999-12-30 17:00:00	OLED, 6.7", Super Retina XDR	điện-thoại-iphone-15-plus-256gb
66	IOS	4325	Apple A15 Bionic	2000-12-30 17:00:00	OLED 6.7", Super Retina XDR	iphone-14-plus-128gb
67		3899	Apple M4 9 nhân	2024-04-30 17:00:00	13", Ultra Retina XDR	ipad-pro-m4-13-inch-wifi-256gb
69		10090	Snapdragon 8 Gen 2 for Galaxy	2023-06-30 17:00:00	12.4", Dynamic AMOLED 2X	samsung-galaxy-tab-s9+-wifi
70		8000	 Exynos 1380 8 nhân	2023-09-30 17:00:00	TFT LCD, 10.9'', Tần số quét 90 Hz	samsung-galaxy-tab-s9-fe-wifi
71		7100	Snapdragon 680 8 nhân	2023-03-31 17:00:00	10.36", IPS LCD	oppo-pad-air-wifi
72		5100	 MediaTek Helio G80	2023-04-30 17:00:00	9", IPS LCD	lenovo-tab-m9-4g
\.


--
-- Data for Name: feature_front_camera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_front_camera (feature_id, front_camera) FROM stdin;
1	20
5	20
8	20
11	20
18	20
20	32
6	720
10	720
13	720
4	720
17	720
2	1080
19	1080
21	1080
22	1080
9	720
23	13
3	12
14	12
25	10
25	4
26	5
27	8
28	20
28	32
29	32
30	720
32	1080
33	1080
34	1080
35	720
36	720
37	720
38	1080
39	720
40	720
41	720
44	16
45	8
46	8
47	32
48	5
49	12
50	13
51	12
52	5
43	5
53	20
54	1080
55	10
56	720
57	20
58	13
59	720
60	720
61	2
62	720
63	1080
64	50
65	720
15	12
66	12
42	720
12	12
7	12
24	10
67	12
69	12
70	12
71	5
72	2
\.


--
-- Data for Name: feature_rear_camera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_rear_camera (feature_id, rear_camera) FROM stdin;
20	50
20	12
20	5
23	50
23	5
23	2
3	48
3	12
3	8
14	12
14	12
25	50
25	12
25	10
26	13
26	0
27	50
27	2
28	48
28	48
28	64
29	50
29	8
29	2
44	200
44	8
44	2
45	50
46	108
46	2
47	50
47	5
47	2
48	13
48	2
49	200
49	50
49	12
49	10
50	50
50	8
50	5
51	48
51	12
51	12
43	8
43	0
55	50
55	12
55	8
58	50
58	5
58	2
64	50
64	50
15	48
15	12
66	12
66	12
12	12
12	12
7	48
7	12
24	12
24	12
67	12
69	13
69	8
70	8
71	8
72	8
\.


--
-- Data for Name: order_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_entity (order_id, done, email, phone, "time", product_id) FROM stdin;
yn7MZDaonD	t	vnq2k3@gmail.com	0349983663	2024-06-27 04:12:20.093	acer-nitro-5-tiger-gaming-an515
qE0lUcyqfD	f	jisooconan@gmail.com	0353795729	2024-06-27 06:25:17.573	samsung-galaxy-z-fold5-5g
mczZy7qVYY	f	jisooconan@gmail.com	0353795729	2024-06-27 06:29:18.599	iphone-15-pro-max
X43OhMFDC1	f	jisooconan@gmail.com	0353795729	2024-06-27 01:14:13.655	tiandy-tc-h322n
ZtGTqdkf8y	f	jisooconan@gmail.com	0353795729	2024-06-27 09:14:40.747	ipad-pro-m4-13-inch-wifi-256gb
AWcskJ6CXo	f	jisooconan@gmail.com	0353795729	2024-06-27 12:08:30.944	samsung-galaxy-z-flip5-5g
ogvuChNUKj	f	jisooconan@gmail.com	0353795729	2024-06-27 12:09:41.76	ipad-pro-m4-13-inch-wifi-256gb
sxttxe5xx6	f	jisooconan@gmail.com	0353795729	2024-06-27 13:22:44.639	vivo-y28
GFFFZ6XWHs	f	jisooconan@gmail.com	0353795729	2024-06-27 13:40:18.917	samsung-galaxy-s24-ultra
lgV5WbWm0b	f	jisooconan@gmail.com	0353795729	2024-06-27 13:49:43.725	điện-thoại-iphone-13-128gb
\.


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price (id, current_price, previous_price, ram, rom, feature_id, product_id) FROM stdin;
2	390000	590000	2	512	1	tiandy-tc-h322n
4	13890000	15990000	16	512	2	laptop-lenovo-ideapad-slim-3
6	29690000	34600000	8	256	3	iphone-15-pro-max
8	18890000	20490000	0	-1	4	laptop-dell-inspiron-14-5440
10	410000	650000	2	256	5	tp-link-tapo-tc70
12	17990000	18990000	16	512	6	laptop-asus-vivobook-14-oled
14	19290000	22990000	6	128	7	điện-thoại-iphone-15-128gb
16	520000	650000	2	256	8	imou-ranger-rc-gk2cp-3c0wr
18	9490000	14590000	8	256	9	laptop-asus-expertbook-b1
20	13990000	18490000	16	512	10	laptop-asus-vivobook-16
22	490000	650000	2	256	11	botslab-c212
24	8590000	11790000	4	64	12	điện-thoại-iphone-11-64gb
26	28990000	33990000	16	512	13	laptop-asus-zenbook-flip-oled
28	13890000	17790000	4	128	14	điện-thoại-iphone-13-128gb
30	25990000	28990000	6	256	15	điện-thoại-iphone-15-plus-256gb
34	13490000	13990000	16	512	17	laptop-lenovo-ideapad-1
36	680000	890000	2	512	18	ezviz-h6c-pro
38	17990000	21990000	16	512	19	laptop-lenovo-thinkpad-e16
40	11990000	13000000	12	256	20	samsung-galaxy-a55-5g
42	28490000	28990000	32	512	21	laptop-lenovo-yoga-slim-7
44	21990000	22990000	16	512	22	lenovo-ideapad-slim-5-16imh9
46	4340000	5890000	6	128	23	samsung-galaxy-a24
48	16990000	25990000	8	256	24	samsung-galaxy-z-flip5-5g
49	28990000	40990000	12	256	25	samsung-galaxy-z-fold5-5g
50	3290000	4890000	4	128	26	vivo-y03
51	5790000	7190000	8	128	27	vivo-y28
52	41990000	44990000	16	512	28	oppo-find-n3-5g
53	10990000	10990000	8	256	29	oppo-reno11-5g
54	24190000	29900000	16	256	30	macbook-air-13-inch-m1-2020
55	27290000	32990000	8	512	31	macbook-air-15-inch-m2-2023
56	27390000	27990000	8	256	32	macbook-air-m3-13-inch-2024
57	38490000	39990000	8	512	33	macbook-pro-14-2023-m3
58	62990000	64990000	18	512	34	macbook-pro-16-2023-m3-pro
59	20990000	24990000	16	512	35	asus-tuf-gaming-fx507zc4
60	16490000	17290000	16	512	36	dell-vostro-v3520
61	19990000	22090000	0	512	37	dell-inspiron-15-n3530
62	19990000	24990000	0	256	38	dell-latitude-3520
63	11990000	16990000	8	512	39	acer-aspire-7-gaming-a715
64	9290000	10990000	8	512	40	acer-aspire-3
65	21990000	29900000	8	512	41	acer-nitro-gaming-an515
67	2490000	3290000	3	64	43	xiaomi-redmi-a3
68	9290000	10990000	8	256	44	xiaomi-redmi-note-13-pro+-5g
69	4790000	0	8	256	45	realme-c65
70	4990000	5290000	8	128	46	realme-c67
71	3990000	0	8	256	47	tcl-40-nxtpaper
72	1990000	2190000	4	64	48	tcl-406s
73	33990000	35490000	12	256	49	samsung-galaxy-s24-ultra
74	9290000	10390000	8	256	50	samsung-galaxy-a35
75	41990000	43990000	6	1024	51	iphone-14-pro-max
76	1850000	1990000	2	256	52	imou-cruiser-dual-s7xp-10m0wed
77	4190000	4990000	2	-1	53	imou-cruiser-2-gs7ep-5m0we
78	27990000	30990000	16	1024	54	acer-swift-edge-sfa16
79	14890000	16990000	8	128	55	samsung-galaxy-s23-fe
80	20990000	29490000	8	512	56	acer-nitro-5-tiger-gaming-an515
81	4490000	5190000	4	512	57	ezviz-h6
82	0	0	4	128	58	samsung-galaxy-m15-5g
83	10290000	13290000	8	256	59	hp-245-g10
84	17190000	20990000	16	512	60	hp-pavilion-14-dv2073tu
85	990000	1690000	1	64	61	nokia-220-4g
86	20990000	23290000	16	512	62	hp-probook-440-g10
87	22990000	27390000	16	512	63	hp-gaming-victus-16-s0078ax
88	13990000	15000000	12	512	64	vivo-v30-5g
89	7990000	11690000	8	256	65	hp-14s-em0080au
90	19890000	22290000	6	128	66	iphone-14-plus-128gb
66	15990000	18490000	16	512	42	laptop-acer-swift-go-sfg14
91	0	0	8	256	67	ipad-pro-m4-13-inch-wifi-256gb
93	25990000	27390000	12	256	69	samsung-galaxy-tab-s9+-wifi
94	9990000	10990000	6	128	70	samsung-galaxy-tab-s9-fe-wifi
95	5490000	6490000	4	128	71	oppo-pad-air-wifi
96	3490000	43990000	4	64	72	lenovo-tab-m9-4g
\.


--
-- Data for Name: producer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producer (id, name) FROM stdin;
1	TIANDY
2	Lenovo
3	IPhone
4	Samsung
5	Oppo
6	Xiaomi
7	Dell
8	Asus
9	Acer
10	Ezviz
11	TP-Link
12	IMOU
14	BOTSLAB
15	Vivo
16	Apple
17	Realme
18	TCL
19	HP
20	Nokia
21	IPad
\.


--
-- Data for Name: producer_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producer_category (producer, category) FROM stdin;
TIANDY	Camera
Lenovo	Laptop
IPhone	Phone
Samsung	Phone
Oppo	Phone
Xiaomi	Phone
Dell	Laptop
Asus	Laptop
Acer	Laptop
Ezviz	Camera
TP-Link	Camera
IMOU	Camera
BOTSLAB	Camera
Vivo	Phone
Apple	Laptop
Realme	Phone
TCL	Phone
HP	Laptop
Nokia	Phone
IPad	Tablet
Samsung	Tablet
Oppo	Tablet
Lenovo	Tablet
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, available, name, ordering, total_quantity, category_name, producer_name) FROM stdin;
tp-link-tapo-tc70	560	TP-Link Tapo TC70	0	1000	Camera	Ezviz
imou-ranger-rc-gk2cp-3c0wr	560	IMOU RANGER RC GK2CP-3C0WR	0	1000	Camera	IMOU
botslab-c212	560	BOTSLAB C212	0	1000	Camera	BOTSLAB
điện-thoại-iphone-11-64gb	87	iPhone 11 64GB	0	100	Phone	IPhone
điện-thoại-iphone-15-plus-256gb	76	iPhone 15 Plus 256GB	0	99	Phone	IPhone
điện-thoại-iphone-15-128gb	301	iPhone 15 128GB	0	450	Phone	IPhone
ezviz-h6c-pro	234	EZVIZ H6C Pro	0	765	Camera	Ezviz
samsung-galaxy-a55-5g	99	Samsung Galaxy A55 5G	0	103	Phone	Samsung
samsung-galaxy-s23-fe	54	Samsung Galaxy S23 FE	0	67	Phone	Samsung
laptop-asus-vivobook-14-oled	99	ASUS Vivobook 14 OLED	0	100	Laptop	Asus
laptop-asus-vivobook-16	199	ASUS Vivobook 16	0	200	Laptop	Asus
laptop-asus-zenbook-flip-oled	99	Asus ZenBook Flip OLED	0	100	Laptop	Asus
laptop-dell-inspiron-14-5440	99	Dell Inspiron 14 5440	0	100	Laptop	Dell
laptop-lenovo-ideapad-1	99	Lenovo Ideapad 1	0	100	Laptop	Lenovo
laptop-lenovo-ideapad-slim-3	99	Lenovo Ideapad Slim 3 	0	100	Laptop	Lenovo
laptop-lenovo-thinkpad-e16	99	Lenovo ThinkPad E16 	0	100	Laptop	Lenovo
laptop-lenovo-yoga-slim-7	149	Lenovo Yoga Slim 7 	0	150	Laptop	Lenovo
lenovo-ideapad-slim-5-16imh9	99	Lenovo IdeaPad Slim 5 16IMH9	0	100	Laptop	Lenovo
laptop-asus-expertbook-b1	99	ASUS Expertbook B1	0	100	Laptop	Asus
samsung-galaxy-a24	20	Samsung Galaxy A24	0	22	Phone	Samsung
vivo-y03	44	Vivo Y03	0	56	Phone	Vivo
oppo-find-n3-5g	16	OPPO Find N3 5G	0	22	Phone	Oppo
oppo-reno11-5g	6	OPPO Reno11 5G	0	10	Phone	Oppo
macbook-air-13-inch-m1-2020	1	MacBook Air 13 inch M1 2020	0	200	Laptop	Apple
macbook-air-15-inch-m2-2023	199	MacBook Air 15 inch M2 2023	0	200	Laptop	Apple
macbook-air-m3-13-inch-2024	199	Macbook Air M3 13 inch 2024	0	200	Laptop	Apple
macbook-pro-14-2023-m3	99	MacBook Pro 14 2023 M3	0	100	Laptop	Apple
macbook-pro-16-2023-m3-pro	99	MacBook Pro 16 2023 M3 Pro	0	100	Laptop	Apple
asus-tuf-gaming-fx507zc4	199	Asus TUF Gaming FX507ZC4	0	200	Laptop	Asus
dell-vostro-v3520	99	Dell Vostro V3520	0	100	Laptop	Dell
dell-inspiron-15-n3530	99	Dell Inspiron 15 N3530	0	100	Laptop	Dell
dell-latitude-3520	99	Dell Latitude 3520	0	100	Laptop	Dell
acer-aspire-7-gaming-a715	149	Acer Aspire 7 Gaming A715	0	150	Laptop	Acer
acer-aspire-3	99	Acer Aspire 3	0	100	Laptop	Acer
acer-nitro-gaming-an515	99	Acer Nitro Gaming AN515	0	100	Laptop	Acer
laptop-acer-swift-go-sfg14	149	Laptop Acer Swift Go SFG14	0	150	Laptop	Acer
xiaomi-redmi-note-13-pro+-5g	45	Xiaomi Redmi Note 13 Pro+ 5G	0	77	Phone	Xiaomi
realme-c65	11	realme C65	0	23	Phone	Realme
realme-c67	66	 realme C67	0	90	Phone	Realme
tcl-40-nxtpaper	8	TCL 40 NXTPAPER	0	15	Phone	TCL
tcl-406s	5	TCL 406s	0	10	Phone	TCL
samsung-galaxy-a35	23	Samsung Galaxy A35	0	50	Phone	Samsung
iphone-14-pro-max	3	 iPhone 14 Pro Max	0	5	Phone	IPhone
imou-cruiser-dual-s7xp-10m0wed	20	IMOU Cruiser Dual S7XP-10M0WED	0	23	Camera	IMOU
vivo-y28	56	Vivo Y28	1	88	Phone	Vivo
acer-swift-edge-sfa16	99	Acer Swift Edge SFA16	0	100	Laptop	Acer
ezviz-h6	560	EZVIZ H6	0	1000	Camera	Ezviz
samsung-galaxy-m15-5g	4	Samsung Galaxy M15 5G	0	5	Phone	Samsung
hp-245-g10	99	HP 245 G10	0	100	Laptop	HP
hp-pavilion-14-dv2073tu	149	HP Pavilion 14-dv2073TU	0	150	Laptop	HP
nokia-220-4g	4	 Nokia 220 4G	0	10	Phone	Nokia
hp-probook-440-g10	99	HP ProBook 440 G10	0	100	Laptop	HP
hp-gaming-victus-16-s0078ax	99	HP Gaming Victus 16-s0078AX	0	100	Laptop	HP
vivo-v30-5g	15	 vivo V30 5G	0	23	Phone	Vivo
hp-14s-em0080au	99	HP 14s-em0080AU	0	100	Laptop	HP
iphone-14-plus-128gb	10	 iPhone 14 Plus 128GB	0	16	Phone	IPhone
xiaomi-redmi-a3	100	Xiaomi Redmi A3	0	33	Phone	Xiaomi
acer-nitro-5-tiger-gaming-an515	198	Acer Nitro 5 Tiger Gaming AN515	0	200	Laptop	Acer
samsung-galaxy-z-fold5-5g	50	Samsung Galaxy Z Fold5 5G	1	70	Phone	Samsung
iphone-15-pro-max	16	iPhone 15 Pro Max	1	30	Phone	IPhone
tiandy-tc-h322n	100	TIANDY TC-H322N	1	360	Camera	TIANDY
samsung-galaxy-tab-s9+-wifi	23	Samsung Galaxy Tab S9+ WiFi	0	66	Tablet	Samsung
samsung-galaxy-tab-s9-fe-wifi	98	Samsung Galaxy Tab S9 FE WiFi	0	109	Tablet	Samsung
oppo-pad-air-wifi	7	OPPO Pad Air WiFi	0	13	Tablet	Oppo
lenovo-tab-m9-4g	12	Lenovo Tab M9 4G	0	34	Tablet	Lenovo
samsung-galaxy-z-flip5-5g	100	Samsung Galaxy Z Flip5 5G	1	140	Phone	Samsung
ipad-pro-m4-13-inch-wifi-256gb	23	iPad Pro M4 13 inch WiFi 256GB	2	55	Tablet	IPad
samsung-galaxy-s24-ultra	33	Samsung Galaxy S24 Ultra 	1	45	Phone	Samsung
imou-cruiser-2-gs7ep-5m0we	560	IMOU Cruiser 2 GS7EP-5M0WE	0	1000	Camera	IMOU
điện-thoại-iphone-13-128gb	48	iPhone 13 128GB 	1	90	Phone	IPhone
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (product_id, image_url) FROM stdin;
tiandy-tc-h322n	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-1.jpg
tiandy-tc-h322n	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-4-1.jpg
tiandy-tc-h322n	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-5-1.jpg
tiandy-tc-h322n	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-7-1.jpg
tiandy-tc-h322n	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-8.jpg
tiandy-tc-h322n	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-11.jpg
tiandy-tc-h322n	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-12.jpg
tiandy-tc-h322n	https://cdn.tgdd.vn/Products/Images/4728/319642/camera-ip-360-do-2mp-tiandy-tc-h322n-13.jpg
lenovo-ideapad-slim-5-16imh9	https://product.hstatic.net/200000722513/product/1_43869d5811cb4ce08de070b738c4f786_grande.png
lenovo-ideapad-slim-5-16imh9	https://product.hstatic.net/200000722513/product/ideapad_slim_5_16imh9_ct1_01_6408a930857b44a789b96050c7ad4cdc_grande.png
lenovo-ideapad-slim-5-16imh9	https://product.hstatic.net/200000722513/product/ideapad_slim_5_16imh9_ct1_03_7b762e8e94aa48bcb1b695b282a9c52c_grande.png
lenovo-ideapad-slim-5-16imh9	https://product.hstatic.net/200000722513/product/ideapad_slim_5_16imh9_ct2_08_96d3fbc872b443cea7d059c295502a3f_grande.png
lenovo-ideapad-slim-5-16imh9	https://product.hstatic.net/200000722513/product/ideapad_slim_5_16imh9_ct2_09_2639b05f6b0c414bb0215fa61957f0c8_grande.png
lenovo-ideapad-slim-5-16imh9	https://product.hstatic.net/200000722513/product/ideapad_slim_5_16imh9_ct2_06_cc2b540369094a7aa322a47c92ea726a_grande.png
lenovo-ideapad-slim-5-16imh9	https://product.hstatic.net/200000722513/product/ideapad_slim_5_16imh9_ct2_07_f5d02b05367541bca31e3aac024e6cc2_grande.png
lenovo-ideapad-slim-5-16imh9	https://product.hstatic.net/200000722513/product/ideapad_slim_5_16imh9_ct2_12_d9aa6f2a0be945328969043be08d7fc3_grande.png
điện-thoại-iphone-13-128gb	https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-xanh-la-thumb-new-600x600.jpg
điện-thoại-iphone-13-128gb	https://cdn.tgdd.vn/Products/Images/42/223602/Slider/vi-vn-iphone-13-up-2.jpeg
điện-thoại-iphone-13-128gb	https://cdn.tgdd.vn/Products/Images/42/223602/Slider/iphone-13-up-3-new-1933x982.jpg
điện-thoại-iphone-13-128gb	https://cdn.tgdd.vn/Products/Images/42/223602/Slider/vi-vn-iphone-13-up-4.jpg
điện-thoại-iphone-13-128gb	https://cdn.tgdd.vn/Products/Images/42/223602/Slider/vi-vn-iphone-13-up-5.jpg
tp-link-tapo-tc70	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-2-org.jpg
tp-link-tapo-tc70	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-3-org.jpg
tp-link-tapo-tc70	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-4-org.jpg
tp-link-tapo-tc70	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-5-org.jpg
tp-link-tapo-tc70	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-7-org.jpg
tp-link-tapo-tc70	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-8-org.jpg
tp-link-tapo-tc70	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-9-org.jpg
tp-link-tapo-tc70	https://cdn.tgdd.vn/Products/Images/4728/235820/camera-ip-360-do-1080p-tp-link-tapo-tc70-trang-10-org.jpg
điện-thoại-iphone-13-128gb	https://cdn.tgdd.vn/Products/Images/42/223602/Slider/vi-vn-iphone-13-up-6.jpg
điện-thoại-iphone-13-128gb	https://cdn.tgdd.vn/Products/Images/42/223602/Slider/vi-vn-iphone-13-up-7.jpg
vivo-y28	https://cdn.tgdd.vn/Products/Images/42/326016/vivo-y28-vang-thumb-600x600.jpg
vivo-y28	https://cellphones.com.vn/sforum/_next/image?url=https%3A%2F%2Fcdn-media.sforum.vn%2Fstorage%2Fapp%2Fmedia%2Ftrannghia%2Fvivo-y28-4g-ra-mat-2.jpeg&w=1920&q=75
vivo-y28	https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/product/1717153527470/zip/img/webp/vivo-y28-in-agate-green-mobile.jpg.webp
vivo-y28	https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/product/1717153527470/zip/img/webp/vivo-y28-in-gleaming-orange-mobile.jpg.webp
macbook-air-15-inch-m2-2023	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-8.jpg
macbook-air-15-inch-m2-2023	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-9.jpg
macbook-air-15-inch-m2-2023	https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-11.jpg
macbook-air-m3-13-inch-2024	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/b/mba13-m3-spacegray-gallery1-202402_6.jpg
imou-ranger-rc-gk2cp-3c0wr	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-media-4.jpg
imou-ranger-rc-gk2cp-3c0wr	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-media-5.jpg
imou-ranger-rc-gk2cp-3c0wr	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-media-7.jpg
imou-ranger-rc-gk2cp-3c0wr	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-media-8.jpg
imou-ranger-rc-gk2cp-3c0wr	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-media-11.jpg
imou-ranger-rc-gk2cp-3c0wr	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-media-12.jpg
imou-ranger-rc-gk2cp-3c0wr	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-media-13.jpg
macbook-air-m3-13-inch-2024	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-m3-13-inch-2024_3_.png
macbook-air-m3-13-inch-2024	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-m3-13-inch-2024_2_.png
macbook-air-m3-13-inch-2024	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-m3-13-inch-2024_4_.png
imou-ranger-rc-gk2cp-3c0wr	https://cdn.tgdd.vn/Products/Images/4728/321919/camera-ip-360-do-3mp-imou-ranger-rc-gk2cp-3c0wr-media-10.jpg
laptop-asus-expertbook-b1	https://product.hstatic.net/200000722513/product/k-b1-b1402cba-eb1814w-i3-1215u_e1e60d8e9c0946449632a1a654f3b1b4_grande_f8629bd1fb124391895fce28559348ae_grande.png
laptop-asus-expertbook-b1	https://product.hstatic.net/200000722513/product/b1402cba-eb1814w-i3-1215u_4_3297768a366d46c797c94c8406217e9a_1024x1024_cd2d5000bfca45538d0abd592d973920_grande.png
laptop-asus-expertbook-b1	https://product.hstatic.net/200000722513/product/laptop-asus-expertbook-b1-b1402cba-eb1814w-02__1__1d80134e619241ed8ace8f2e384c8343_grande.jpg
laptop-asus-expertbook-b1	https://product.hstatic.net/200000722513/product/rtbook-b1-b1402cba-eb1814w-i3-1215u_5_fea24838b6584e529ddd0c46ffa81662_bbbf6ff275924a50a2e50d2ff3bba9a0_grande.png
laptop-asus-expertbook-b1	https://product.hstatic.net/200000722513/product/rtbook-b1-b1402cba-eb1814w-i3-1215u_2_635fb6f360ec4ed4bfd9aa462b9f3558_2dacfb54aa93494091473b6b057b7353_grande.png
laptop-asus-expertbook-b1	https://product.hstatic.net/200000722513/product/rtbook-b1-b1402cba-eb1814w-i3-1215u_3_c5d1028874094f09b982896011cf2878_dbce89b250cf4621a5538f11d18edf0c_grande.png
botslab-c212	https://cdn.tgdd.vn/Products/Images/4728/319451/camera-ip-360-do-3mp-botslab-c212-1-1.jpg
botslab-c212	https://cdn.tgdd.vn/Products/Images/4728/319451/camera-ip-360-do-3mp-botslab-c212-4-1.jpg
botslab-c212	https://cdn.tgdd.vn/Products/Images/4728/319451/camera-ip-360-do-3mp-botslab-c212-5-1.jpg
botslab-c212	https://cdn.tgdd.vn/Products/Images/4728/319451/camera-ip-360-do-3mp-botslab-c212-6-1.jpg
botslab-c212	https://cdn.tgdd.vn/Products/Images/4728/319451/camera-ip-360-do-3mp-botslab-c212-8.jpg
botslab-c212	https://cdn.tgdd.vn/Products/Images/4728/319451/camera-ip-360-do-3mp-botslab-c212-11.jpg
botslab-c212	https://cdn.tgdd.vn/Products/Images/4728/319451/camera-ip-360-do-3mp-botslab-c212-12.jpg
botslab-c212	https://cdn.tgdd.vn/Products/Images/4728/319451/camera-ip-360-do-3mp-botslab-c212-13.jpg
oppo-find-n3-5g	https://cdn.tgdd.vn/Products/Images/42/302953/oppo-find-n3-vang-dong-thumb-600x600.jpg
oppo-find-n3-5g	https://cdn.tgdd.vn/Products/Images/42/302953/Slider/vi-vn-oppo-find-n3-slider--(1).jpg
oppo-find-n3-5g	https://cdn.tgdd.vn/Products/Images/42/302953/Slider/vi-vn-oppo-find-n3-slider--(7).jpg
oppo-find-n3-5g	https://cdn.tgdd.vn/Products/Images/42/302953/Slider/vi-vn-oppo-find-n3-slider--(6).jpg
oppo-find-n3-5g	https://cdn.tgdd.vn/Products/Images/42/302953/Slider/vi-vn-oppo-find-n3-slider--(2).jpg
oppo-find-n3-5g	https://cdn.tgdd.vn/Products/Images/42/302953/Slider/vi-vn-oppo-find-n3-slider--(3).jpg
oppo-find-n3-5g	https://cdn.tgdd.vn/Products/Images/42/302953/Slider/vi-vn-oppo-find-n3-slider--(4).jpg
macbook-air-m3-13-inch-2024	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-m3-13-inch-2024_5_.png
macbook-air-m3-13-inch-2024	https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-air-m3-13-inch-2024_6_.png
macbook-air-m3-13-inch-2024	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-m3-13-inch-2024-10.png
macbook-pro-16-2023-m3-pro	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344451703828926_macbook-pro-16-2023-m3-pro-max-bac%20(1).jpg
macbook-pro-16-2023-m3-pro	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344451704297691_macbook-pro-16-2023-m3-pro-max-bac%20(2).jpg
macbook-pro-16-2023-m3-pro	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344451702891543_macbook-pro-16-2023-m3-pro-max-bac%20(3).jpg
macbook-pro-16-2023-m3-pro	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344451704297691_macbook-pro-16-2023-m3-pro-max-bac%20(4).jpg
macbook-pro-16-2023-m3-pro	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344451704609998_macbook-pro-16-2023-m3-pro-max-bac%20(5).jpg
macbook-pro-16-2023-m3-pro	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344451704766366_macbook-pro-16-2023-m3-pro-max-bac%20(6).jpg
macbook-pro-16-2023-m3-pro	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344451708059455_macbook-pro-16-2023-m3-pro-max-bac%20(10).jpg
dell-vostro-v3520	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/2/638345294135740509_dell-vostro-v3520-xam-5.jpg
dell-vostro-v3520	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/4/8/638481907191444078_note.jpg
dell-vostro-v3520	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/2/638345294135115563_dell-vostro-v3520-xam-2.jpg
dell-vostro-v3520	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/2/638345294135427833_dell-vostro-v3520-xam-4.jpg
dell-vostro-v3520	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/2/638345294135584114_dell-vostro-v3520-xam-1.jpg
dell-vostro-v3520	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/2/638345294134483298_dell-vostro-v3520-xam-3.jpg
samsung-galaxy-a24	https://cdn.tgdd.vn/Products/Images/42/274018/samsung-galaxy-a24-green-thumb-600x600.jpg
samsung-galaxy-a24	https://cdn.tgdd.vn/Products/Images/42/274018/Slider/vi-vn-samsung-galaxy-a24-6gb--(6).jpg
samsung-galaxy-a24	https://cdn.tgdd.vn/Products/Images/42/274018/Slider/vi-vn-samsung-galaxy-a24-6gb--(4).jpg
samsung-galaxy-a24	https://cdn.tgdd.vn/Products/Images/42/274018/Slider/vi-vn-samsung-galaxy-a24-6gb--33--2048x1144.jpg
samsung-galaxy-a24	https://cdn.tgdd.vn/Products/Images/42/274018/Slider/vi-vn-samsung-galaxy-a24-6gb--(1).jpg
samsung-galaxy-a24	https://cdn.tgdd.vn/Products/Images/42/274018/Slider/22-2048x1144.jpg
samsung-galaxy-a24	https://cdn.tgdd.vn/Products/Images/42/274018/Slider/vi-vn-samsung-galaxy-a24-6gb--(5).jpg
samsung-galaxy-z-fold5-5g	https://cdn.tgdd.vn/Products/Images/42/301608/samsung-galaxy-z-fold5-blue-thumbnew-600x600.jpg
samsung-galaxy-z-fold5-5g	https://cdn.tgdd.vn/Products/Images/42/301608/Slider/vi-vn-samsung-galaxy-z-fold5-256-(1).jpg
samsung-galaxy-z-fold5-5g	https://cdn.tgdd.vn/Products/Images/42/301608/Slider/vi-vn-samsung-galaxy-z-fold5-256-(2).jpg
ezviz-h6c-pro	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-0.jpg
ezviz-h6c-pro	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-2.jpg
ezviz-h6c-pro	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-5.jpg
ezviz-h6c-pro	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-6.jpg
ezviz-h6c-pro	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-7.jpg
ezviz-h6c-pro	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-8.jpg
ezviz-h6c-pro	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-9.jpg
ezviz-h6c-pro	https://cdn.tgdd.vn/Products/Images/4728/323199/camera-ip-360-do-4mp-ezviz-h6c-pro-99.jpg
samsung-galaxy-z-fold5-5g	https://cdn.tgdd.vn/Products/Images/42/301608/Slider/vi-vn-samsung-galaxy-z-fold5-256-(3).jpg
samsung-galaxy-z-fold5-5g	https://cdn.tgdd.vn/Products/Images/42/301608/Slider/vi-vn-samsung-galaxy-z-fold5-256-(4).jpg
samsung-galaxy-z-fold5-5g	https://cdn.tgdd.vn/Products/Images/42/301608/Slider/vi-vn-samsung-galaxy-z-fold5-256-(5).jpg
oppo-reno11-5g	https://cdn.tgdd.vn/Products/Images/42/314209/oppo-reno-11-xanh-thumb-600x600.jpg
oppo-reno11-5g	https://cdn.tgdd.vn/Products/Images/42/314209/Slider/oppo-reno11638415159518249716.jpg
oppo-reno11-5g	https://cdn.tgdd.vn/Products/Images/42/314209/Slider/oppo-reno11638415159519269668.jpg
oppo-reno11-5g	https://cdn.tgdd.vn/Products/Images/42/314209/Slider/oppo-reno11638415159522799751.jpg
oppo-reno11-5g	https://cdn.tgdd.vn/Products/Images/42/314209/Slider/oppo-reno11638415159524119704.jpg
oppo-reno11-5g	https://cdn.tgdd.vn/Products/Images/42/314209/Slider/oppo-reno11638415159520759726.jpg
oppo-reno11-5g	https://cdn.tgdd.vn/Products/Images/42/314209/Slider/oppo-reno11638415159521859739.jpg
realme-c65	https://cdn.tgdd.vn/Products/Images/42/323002/realme-c65-thumb-1-600x600.jpg
realme-c65	https://cdn.tgdd.vn/Products/Images/42/323002/Slider/realme-c65-6g-2-1020x570.jpg
realme-c65	https://cdn.tgdd.vn/Products/Images/42/323002/Slider/vi-vn-realme-c65-6g-3.jpg
realme-c65	https://cdn.tgdd.vn/Products/Images/42/323002/Slider/vi-vn-realme-c65-6g-4.jpg
realme-c65	https://cdn.tgdd.vn/Products/Images/42/323002/Slider/vi-vn-realme-c65-6g-5.jpg
realme-c65	https://cdn.tgdd.vn/Products/Images/42/323002/Slider/vi-vn-realme-c65-6g-6.jpg
realme-c67	https://cdn.tgdd.vn/Products/Images/42/319658/realme-c67-xanh-thumb-600x600.jpg
realme-c67	https://cdn.tgdd.vn/Products/Images/42/319658/Slider/vi-vn-realme-c67-slider--(1).jpg
realme-c67	https://cdn.tgdd.vn/Products/Images/42/319658/Slider/vi-vn-realme-c67-slider--(3).jpg
realme-c67	https://cdn.tgdd.vn/Products/Images/42/319658/Slider/vi-vn-realme-c67-slider--(2).jpg
realme-c67	https://cdn.tgdd.vn/Products/Images/42/319658/Slider/vi-vn-realme-c67-slider--(6).jpg
realme-c67	https://cdn.tgdd.vn/Products/Images/42/319658/Slider/vi-vn-realme-c67-slider--(4).jpg
tcl-40-nxtpaper	https://cdn.tgdd.vn/Products/Images/42/324995/tcl-40-nxtpaper-thumb-1-600x600.jpg
tcl-40-nxtpaper	https://cdn.tgdd.vn/Products/Images/42/324995/Slider/vi-vn-tcl-40-nxtpaper-thiet-ke-2.jpg
tcl-40-nxtpaper	https://cdn.tgdd.vn/Products/Images/42/324995/Slider/vi-vn-tcl-40-nxtpaper-man-hinh-3.jpg
tcl-40-nxtpaper	https://cdn.tgdd.vn/Products/Images/42/324995/Slider/vi-vn-tcl-40-nxtpaper-loa-4.jpg
tcl-40-nxtpaper	https://cdn.tgdd.vn/Products/Images/42/324995/Slider/vi-vn-tcl-40-nxtpaper-hieu-nang-5.jpg
tcl-40-nxtpaper	https://cdn.tgdd.vn/Products/Images/42/324995/Slider/vi-vn-tcl-40-nxtpaper-camera-6.jpg
samsung-galaxy-z-fold5-5g	https://cdn.tgdd.vn/Products/Images/42/301608/Slider/sam-sung-galaxy-zfold-5-slider-9-1020x570-1.jpg
macbook-air-13-inch-m1-2020	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946171340515_Macbook%20Air%20M1%20(13).jpg
macbook-air-13-inch-m1-2020	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946171184285_Macbook%20Air%20M1%20(7).jpg
macbook-air-13-inch-m1-2020	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946171340515_Macbook%20Air%20M1%20(2).jpg
macbook-air-13-inch-m1-2020	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946170559264_Macbook%20Air%20M1%20(5).jpg
macbook-air-13-inch-m1-2020	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946167278025_Macbook%20Air%20M1%20(10).jpg
macbook-air-13-inch-m1-2020	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946170403099_Macbook%20Air%20M1%20(16).jpg
macbook-air-13-inch-m1-2020	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946170090821_Macbook%20Air%20M1%20(3).jpg
macbook-air-13-inch-m1-2020	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/7/21/637939946168528051_Macbook%20Air%20M1%20(14).jpg
macbook-pro-14-2023-m3	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344439733701079_macbook-pro-14-2023-m3-8-cpu-10-gpu-bac%20(1).jpg
macbook-pro-14-2023-m3	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344439735692453_macbook-pro-14-2023-m3-8-cpu-10-gpu-bac%20(2).jpg
macbook-pro-14-2023-m3	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344439736042256_macbook-pro-14-2023-m3-8-cpu-10-gpu-bac%20(3).jpg
macbook-pro-14-2023-m3	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344439732130880_macbook-pro-14-2023-m3-8-cpu-10-gpu-bac%20(4).jpg
macbook-pro-14-2023-m3	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344439732763537_macbook-pro-14-2023-m3-8-cpu-10-gpu-bac%20(5).jpg
macbook-pro-14-2023-m3	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344439732130880_macbook-pro-14-2023-m3-8-cpu-10-gpu-bac%20(6).jpg
macbook-pro-14-2023-m3	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/1/638344439732130880_macbook-pro-14-2023-m3-8-cpu-10-gpu-bac%20(10).jpg
asus-tuf-gaming-fx507zc4	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/4/638240754677083179_asus-tuf-gaming-fx507-xam-1.jpg
asus-tuf-gaming-fx507zc4	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/8/638350567475117526_note.jpg
asus-tuf-gaming-fx507zc4	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/4/638240754677239716_asus-tuf-gaming-fx507-xam-3.jpg
asus-tuf-gaming-fx507zc4	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/4/638240754677083179_asus-tuf-gaming-fx507-xam-4.jpg
asus-tuf-gaming-fx507zc4	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/4/638240754676290025_asus-tuf-gaming-fx507-xam-5.jpg
asus-tuf-gaming-fx507zc4	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/4/638240754676126458_asus-tuf-gaming-fx507-xam-6.jpg
dell-inspiron-15-n3530	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/9/638298600173027154_dell-inspiron-15-n3530-bac-1.jpg
dell-inspiron-15-n3530	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/17/638358356818385395_note.jpg
dell-inspiron-15-n3530	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/9/638298600173027154_dell-inspiron-15-n3530-bac-4.jpg
dell-inspiron-15-n3530	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/9/638298600173183412_dell-inspiron-15-n3530-bac-2.jpg
dell-inspiron-15-n3530	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/9/638298600173027154_dell-inspiron-15-n3530-bac-3.jpg
dell-inspiron-15-n3530	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/9/638298600173027154_dell-inspiron-15-n3530-bac-5.jpg
dell-latitude-3520	https://product.hstatic.net/200000722513/product/latitude-3520-p108f001-70280538-fix_83b4c85f06d145199d87d838dc9eca04_grande.png
samsung-galaxy-a55-5g	https://cdn.tgdd.vn/Products/Images/42/322096/samsung-galaxy-a55-5g-xanh-thumb-1-600x600.jpg
samsung-galaxy-a55-5g	https://cdn.tgdd.vn/Products/Images/42/322096/Slider/samsung-galaxy-a55-5g-thiet-ke-1020x570.jpg
samsung-galaxy-a55-5g	https://cdn.tgdd.vn/Products/Images/42/322096/Slider/vi-vn-samsung-galaxy-a55-5g-3.jpg
samsung-galaxy-a55-5g	https://cdn.tgdd.vn/Products/Images/42/322096/Slider/vi-vn-samsung-galaxy-a55-5g-4.jpg
samsung-galaxy-a55-5g	https://cdn.tgdd.vn/Products/Images/42/322096/Slider/samsung-galaxy-a55-5g-5aoptimized-2048x1144.jpg
samsung-galaxy-a55-5g	https://cdn.tgdd.vn/Products/Images/42/322096/Slider/vi-vn-samsung-galaxy-a55-5g-6.jpg
laptop-asus-vivobook-14-oled	https://product.hstatic.net/200000722513/product/vobook_14_oled_x1405v_m1405y_cool_silver_black_keyboard_07_fingerprint_22ac6f3f14e94f99bee84eca3aac2474_grande.png
laptop-asus-vivobook-14-oled	https://product.hstatic.net/200000722513/product/vobook_14_oled_x1405v_m1405y_cool_silver_black_keyboard_08_fingerprint_9443487a7b16401f8aee83be5087301f_grande.png
laptop-asus-vivobook-14-oled	https://product.hstatic.net/200000722513/product/vobook_14_oled_x1405v_m1405y_cool_silver_black_keyboard_05_fingerprint_49d517d22adc445ebb63276de03fb2d1_grande.png
laptop-asus-vivobook-14-oled	https://product.hstatic.net/200000722513/product/vobook_14_oled_x1405v_m1405y_cool_silver_black_keyboard_12_fingerprint_1e559609d0fb48a894e7c65509d507dd_grande.png
laptop-asus-vivobook-14-oled	https://product.hstatic.net/200000722513/product/vivobook_14_oled_x1405v_product_photo_1s_cool_silver_01_1_33f85e55305c41ec95e66ed3ba5838eb_grande.png
laptop-asus-vivobook-14-oled	https://product.hstatic.net/200000722513/product/vivobook_14_oled_x1405v_product_photo_1s_cool_silver_02_1_7df1add4561e433396ff3b1c7718ba12_grande.png
laptop-asus-vivobook-16	https://product.hstatic.net/200000722513/product/s-vivobook-16-m1605ya-mb303w-r7-7730u_3b1c058d00d546959558d9249d7926ab_a2f895a8e51347a38900e2c9d5bf8c5e_grande.png
laptop-asus-vivobook-16	https://product.hstatic.net/200000722513/product/vivobook-16-m1605ya-mb303w-r7-7730u_4_e3491e0d8ed64defadc5486167e0731f_2f0d33807a714b1f942096ab1338d498_grande.png
laptop-asus-vivobook-16	https://product.hstatic.net/200000722513/product/vivobook-16-m1605ya-mb303w-r7-7730u_1_637062ae5fd1442496a7095b7993cdaa_d82ef03c070148949cc6cd830ca143a9_grande.png
laptop-asus-vivobook-16	https://product.hstatic.net/200000722513/product/vivobook-16-m1605ya-mb303w-r7-7730u_2_ff060608bbd04dcfa31b7c4e6570d9ba_18506f722e7e4948b45ca1e17d6c48dd_grande.png
laptop-asus-vivobook-16	https://product.hstatic.net/200000722513/product/vivobook-16-m1605ya-mb303w-r7-7730u_5_9f7e96d74b6f4b1380017f8680e43519_8e6e5a80195044219fce17bc6c8d3c39_grande.png
laptop-asus-vivobook-16	https://product.hstatic.net/200000722513/product/vivobook-16-m1605ya-mb303w-r7-7730u_3_62995b266fb440a3857559c9f2bf7ecd_dfb973008ab5457bb314e0fc6adb7187_1024x1024.png
laptop-asus-vivobook-16	https://product.hstatic.net/200000722513/product/vivobook-16-m1605ya-mb303w-r7-7730u_6_7b5fe6482a6b4e82943784f4a73cd15f_eebb47d60e694569a53bbb006a73835e_grande.png
laptop-asus-zenbook-flip-oled	https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-zenbook-flip-oled-up3404va-kn039w-1_d39180f2839e46acad0020a1827c02a9.png
laptop-asus-zenbook-flip-oled	https://product.hstatic.net/200000722513/product/kn039-038w_abb468763fe247e5954f006769534311_grande.png
laptop-asus-zenbook-flip-oled	https://product.hstatic.net/200000722513/product/s-zenbook-flip-oled-up3404va-kn039w-2_e4bca9d17a7f437a89d75463fd37d694_e000848076ab4f0da1e06ce1aaf49c37_grande.png
laptop-asus-zenbook-flip-oled	https://product.hstatic.net/200000722513/product/s-zenbook-flip-oled-up3404va-kn039w-3_9a5addd2b4a040a180716af1e2e59571_8ee265a240d543359ccbcc13f124c14c_grande.png
laptop-asus-zenbook-flip-oled	https://product.hstatic.net/200000722513/product/s-zenbook-flip-oled-up3404va-kn039w-8_12572fbea3f949ebaa83938ff9fd34d3_ca691731dee7435b80f5a046d0da99c4_grande.png
laptop-asus-zenbook-flip-oled	https://product.hstatic.net/200000722513/product/s-zenbook-flip-oled-up3404va-kn039w-9_e333de1ac5ef41e9b1a69a1d16662668_41639b8e470e4671887b0b43bdccc6e2_grande.png
laptop-asus-zenbook-flip-oled	https://product.hstatic.net/200000722513/product/-zenbook-flip-oled-up3404va-kn039w-10_fc55a411f7794ab081a260be0ef6a3f8_288c445064fe4c9ba5dbd96b51dc959b_grande.png
laptop-dell-inspiron-14-5440	https://product.hstatic.net/200000722513/product/dell-inspiron-14-5440-core-7-n4i7204w1-3_063513a1ddad4a4ca9f563a17aa02dfc_grande.jpg
laptop-dell-inspiron-14-5440	https://product.hstatic.net/200000722513/product/dell-inspiron-14-5440-core-7-n4i7204w1-5_428e680b95d84373b93c7565771c5083_grande.jpg
laptop-dell-inspiron-14-5440	https://product.hstatic.net/200000722513/product/dell-inspiron-14-5440-core-7-n4i7204w1-4_baac40d07b634d1ba54ca6c30f850758_grande.jpg
laptop-dell-inspiron-14-5440	https://product.hstatic.net/200000722513/product/dell-inspiron-14-5440-core-7-n4i7204w1-2_0e8e35662f76471ba3c36cd65befe186_grande.jpg
laptop-dell-inspiron-14-5440	https://product.hstatic.net/200000722513/product/dell-inspiron-14-5440-core-7-n4i7204w1-6_6df8c06d7aa04aaab5dcec1f9e8cbeca_grande.jpg
laptop-dell-inspiron-14-5440	https://product.hstatic.net/200000722513/product/dell-inspiron-14-5440-core-7-n4i7204w1-7_32a9dd2071fe431e919214f9cdec7f3d_grande.jpg
laptop-lenovo-ideapad-1	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-ideapad-1-14alc7-82r30077vn-1_490fbf557bd44f4fa6f1385c20fa2517_grande.png
laptop-lenovo-ideapad-1	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-ideapad-1-14alc7-82r30077vn-2_4cf2ecd4c83046a4bea2552e6471d470_grande.png
laptop-lenovo-ideapad-1	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-ideapad-1-14alc7-82r30077vn-3_089872f4ff064ed6bcbde89eb064c7c9_grande.png
laptop-lenovo-ideapad-1	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-ideapad-1-14alc7-82r30077vn-4_0352cce9acc345aea73662b9af1079aa_grande.png
laptop-lenovo-ideapad-1	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-ideapad-1-14alc7-82r30077vn-5_cac50cd7224f4070b3d90e6ed81d473b_grande.png
laptop-lenovo-ideapad-1	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-ideapad-1-14alc7-82r30077vn-6_ed0f39ef42084bc6a6ae52250c2029c9_grande.png
laptop-lenovo-ideapad-slim-3	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-glr-2.jpg
laptop-lenovo-ideapad-slim-3	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-glr-3.jpg
laptop-lenovo-ideapad-slim-3	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-glr-4.jpg
laptop-lenovo-ideapad-slim-3	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-glr-5.jpg
laptop-lenovo-ideapad-slim-3	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-glr-7.jpg
laptop-lenovo-ideapad-slim-3	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-glr-9.jpg
laptop-lenovo-ideapad-slim-3	https://cdn.tgdd.vn/Products/Images/44/313333/lenovo-ideapad-slim-3-15iah8-i5-83er00evn-glr-12.jpg
laptop-lenovo-thinkpad-e16	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct1_03_cd46391a560f4d0480a0fa0937bb9f08_grande.png
laptop-lenovo-thinkpad-e16	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct1_01_29996dbc87444ca2a3c1616001691589_grande.png
laptop-lenovo-thinkpad-e16	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct1_02_f522c9a00c9b4ebb8fccb56d02df5cbf_grande.png
laptop-lenovo-thinkpad-e16	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct2_03_128a4e8ff89f4605ade90f61e5fbefcf_grande.png
laptop-lenovo-thinkpad-e16	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct1_04_2ff667318ca0478a99568ba033761817_grande.png
laptop-lenovo-thinkpad-e16	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct1_05_21856edc4322423492597c66ccb75263_grande.png
laptop-lenovo-thinkpad-e16	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct2_01_7a010f80b29f4e6e8cb2fbb843606fd0_grande.png
laptop-lenovo-thinkpad-e16	https://product.hstatic.net/200000722513/product/thinkpad_e16_gen_1_intel_ct2_02_6c9287f4e0614a148ea043a616056056_grande.png
laptop-lenovo-yoga-slim-7	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-1_93bd594b65bb455da4c178eb940b4d7e_grande.png
laptop-lenovo-yoga-slim-7	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-2_81ca559ced4942d9b42e473eff109d99_grande.png
laptop-lenovo-yoga-slim-7	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-3_c5e537b56bbc4cd093c70aaf72f966be_grande.png
laptop-lenovo-yoga-slim-7	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-4_182039c48ecf4485b4d88f03b6ecf5fc_grande.png
laptop-lenovo-yoga-slim-7	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-5_f9a30f8268e142d0b44c7357f84cd6f6_grande.png
laptop-lenovo-yoga-slim-7	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-8_44364540115e438498e44fd1a98fb810_grande.png
laptop-lenovo-yoga-slim-7	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-9_6bed3fa75a0c44898db99d402721c469_grande.png
laptop-lenovo-yoga-slim-7	https://product.hstatic.net/200000722513/product/gearvn-laptop-lenovo-yoga-sim-7-14imh9-83cv001uvn-10_330d9ca212fa43c08413415b2c788fee_grande.png
iphone-15-pro-max	https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-blue-thumbnew-600x600.jpg
iphone-15-pro-max	https://cdn.tgdd.vn/Products/Images/42/305658/Slider/iphone-15-pro-max-256gb---10--1020x570.jpg
iphone-15-pro-max	https://cdn.tgdd.vn/Products/Images/42/305658/Slider/vi-vn-iphone-15-pro-max-256gb--(4).jpg
iphone-15-pro-max	https://cdn.tgdd.vn/Products/Images/42/305658/Slider/vi-vn-iphone-15-pro-max-256gb--(5).jpg
iphone-15-pro-max	https://cdn.tgdd.vn/Products/Images/42/305658/Slider/vi-vn-iphone-15-pro-max-256gb--(3).jpg
iphone-15-pro-max	https://cdn.tgdd.vn/Products/Images/42/305658/Slider/vi-vn-iphone-15-pro-max-256gb--(6).jpg
iphone-15-pro-max	https://cdn.tgdd.vn/Products/Images/42/305658/Slider/vi-vn-iphone-15-pro-max-256gb--(7).jpg
vivo-y03	https://cdn.tgdd.vn/Products/Images/42/322996/vivo-y03-xanh-thumb-1-600x600.jpg
vivo-y03	https://cdn.tgdd.vn/Products/Images/42/322996/Slider/vi-vn-vivo-y03-2.png
vivo-y03	https://cdn.tgdd.vn/Products/Images/42/322996/Slider/vi-vn-vivo-y03-3-1020x570.jpg
vivo-y03	https://cdn.tgdd.vn/Products/Images/42/322996/Slider/vi-vn-vivo-y03-4.png
vivo-y03	https://cdn.tgdd.vn/Products/Images/42/322996/Slider/vi-vn-vivo-y03-5.png
vivo-y03	https://cdn.tgdd.vn/Products/Images/42/322996/Slider/vi-vn-vivo-y03-6-1020x570.jpg
vivo-y03	https://cdn.tgdd.vn/Products/Images/42/322996/Slider/vi-vn-vivo-y03-7.png
macbook-air-15-inch-m2-2023	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-1.jpg
macbook-air-15-inch-m2-2023	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-2.jpg
macbook-air-15-inch-m2-2023	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-3.jpg
macbook-air-15-inch-m2-2023	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-6.jpg
macbook-air-15-inch-m2-2023	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-7.jpg
dell-latitude-3520	https://product.hstatic.net/200000722513/product/pherals_latop_latitude_3520_gallery_5_ce328dd2d885438db9a3b46fff39cc48_211cb71c3c384326b0b8ac43943f0b89_grande.png
dell-latitude-3520	https://product.hstatic.net/200000722513/product/pherals_latop_latitude_3520_gallery_4_6dd20f9ad6dc458e88a5716967e2cf98_c897e822f9784612b8d05d0c09055c7c_grande.png
dell-latitude-3520	https://product.hstatic.net/200000722513/product/pherals_latop_latitude_3520_gallery_6_b7031c43f13749deaba8e5c24ea9df6e_49fa4efa91ca49c9b9585f1437a7c109_grande.png
dell-latitude-3520	https://product.hstatic.net/200000722513/product/pherals_latop_latitude_3520_gallery_7_40ed5e9d4d4d4893a983c8453efc02c8_9582e5412b6e417dbdecf0bc3fdef6b4_grande.png
dell-latitude-3520	https://product.hstatic.net/200000722513/product/pherals_latop_latitude_3520_gallery_1_d106f7b8a4704936ad0a273fea72c191_5d8e853dc9934cf8abddad9953ace90a_grande.png
acer-aspire-7-gaming-a715	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/6/27/638234717709656138_Acer%20Aspire%207%20Gaming%20A715%20(1).jpg
acer-aspire-7-gaming-a715	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/6/27/638234717709256137_Acer%20Aspire%207%20Gaming%20A715%20(6).jpg
acer-aspire-7-gaming-a715	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/6/27/638234717713737525_Acer%20Aspire%207%20Gaming%20A715%20(4).jpg
acer-aspire-7-gaming-a715	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/6/27/638234717807920259_Acer%20Aspire%207%20Gaming%20A715%20(7).jpg
acer-aspire-7-gaming-a715	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/6/27/638234717821072658_Acer%20Aspire%207%20Gaming%20A715%20(8).jpg
acer-aspire-7-gaming-a715	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/6/27/638234717833001463_Acer%20Aspire%207%20Gaming%20A715%20(10).jpg
acer-aspire-7-gaming-a715	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/6/27/638234717932214802_Acer%20Aspire%207%20Gaming%20A715%20(15).jpg
acer-aspire-7-gaming-a715	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/6/27/638234718038819886_Acer%20Aspire%207%20Gaming%20A715%20(19).jpg
acer-aspire-3	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/20/638176054476482166_acer-aspire-a315-59-321n-i3-1215u-bac-1.jpg
acer-aspire-3	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/3/5/638452546958229247_note.jpg
acer-aspire-3	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/20/638176054475714902_acer-aspire-a315-59-321n-i3-1215u-bac-4.jpg
acer-aspire-3	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/3/5/638452545175572424_Acer%20Aspire%203%20A315-59-51X8-5.jpg
acer-aspire-3	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/3/5/638452545179173214_Acer%20Aspire%203%20A315-59-51X8-9.jpg
acer-aspire-3	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/3/5/638452545180895864_Acer%20Aspire%203%20A315-59-51X8-12.jpg
acer-aspire-3	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/3/5/638452545183257393_Acer%20Aspire%203%20A315-59-51X8-16.jpg
acer-aspire-3	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/3/5/638452545183892919_Acer%20Aspire%203%20A315-59-51X8-19.jpg
acer-nitro-gaming-an515	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/3/1/637817435466475076_acer-nitro-gaming-an515-58-den-1.jpg
acer-nitro-gaming-an515	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/3/1/637817435459912672_acer-nitro-gaming-an515-58-den-2.jpg
acer-nitro-gaming-an515	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/3/1/637817435462881696_acer-nitro-gaming-an515-58-den-4.jpg
acer-nitro-gaming-an515	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/3/1/637817435460381731_acer-nitro-gaming-an515-58-den-5.jpg
acer-nitro-gaming-an515	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/1/637817522522065116_Acer-Nitro%205-AN515-58-52SP-10.jpg
acer-nitro-gaming-an515	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/1/637817522529252592_Acer-Nitro%205-AN515-58-52SP-11.jpg
acer-nitro-gaming-an515	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/1/637817522398626657_Acer-Nitro%205-AN515-58-52SP-2.jpg
acer-nitro-gaming-an515	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/1/637817522653004001_Acer-Nitro%205-AN515-58-52SP-18.jpg
xiaomi-redmi-note-13-pro+-5g	https://cdn.tgdd.vn/Products/Images/42/312965/xiaomi-redmi-note-13-pro-plus-black-thumb-600x600.jpg
xiaomi-redmi-note-13-pro+-5g	https://cdn.tgdd.vn/Products/Images/42/312965/Slider/vi-vn-xiaomi-redmi-note-13-pro-plus--(7).jpg
xiaomi-redmi-note-13-pro+-5g	https://cdn.tgdd.vn/Products/Images/42/312965/Slider/vi-vn-xiaomi-redmi-note-13-pro-plus--(8).jpg
xiaomi-redmi-note-13-pro+-5g	https://cdn.tgdd.vn/Products/Images/42/312965/Slider/vi-vn-xiaomi-redmi-note-13-pro-plus--(5).jpg
xiaomi-redmi-note-13-pro+-5g	https://cdn.tgdd.vn/Products/Images/42/312965/Slider/vi-vn-xiaomi-redmi-note-13-pro-plus--(4).jpg
xiaomi-redmi-note-13-pro+-5g	https://cdn.tgdd.vn/Products/Images/42/312965/Slider/vi-vn-xiaomi-redmi-note-13-pro-plus--(3).jpg
xiaomi-redmi-note-13-pro+-5g	https://cdn.tgdd.vn/Products/Images/42/312965/Slider/vi-vn-xiaomi-redmi-note-13-pro-plus--(2).jpg
tcl-40-nxtpaper	https://cdn.tgdd.vn/Products/Images/42/324995/Slider/vi-vn-tcl-40-nxtpaper-pin-7.jpg
tcl-406s	https://cdn.tgdd.vn/Products/Images/42/324994/tcl-406s-blue-thumb-600x600.jpg
tcl-406s	https://cdn.tgdd.vn/Products/Images/42/324994/Slider/vi-vn-tcl-406s-thiet-ke-2.jpg
tcl-406s	https://cdn.tgdd.vn/Products/Images/42/324994/Slider/vi-vn-tcl-406s-man-hinh-3.jpg
tcl-406s	https://cdn.tgdd.vn/Products/Images/42/324994/Slider/vi-vn-tcl-406s-loa-4.jpg
tcl-406s	https://cdn.tgdd.vn/Products/Images/42/324994/Slider/vi-vn-tcl-406s-hieu-nang-5.jpg
tcl-406s	https://cdn.tgdd.vn/Products/Images/42/324994/Slider/vi-vn-tcl-406s-camera-6.jpg
tcl-406s	https://cdn.tgdd.vn/Products/Images/42/324994/Slider/vi-vn-tcl-406s-pin-7.jpg
samsung-galaxy-s24-ultra	https://cdn.tgdd.vn/Products/Images/42/307174/samsung-galaxy-s24-ultra-grey-thumb-600x600.jpg
samsung-galaxy-s24-ultra	https://cdn.tgdd.vn/Products/Images/42/307174/Slider/samsung-galaxy-s24-ultra-5g-77-1020x570.jpg
samsung-galaxy-s24-ultra	https://cdn.tgdd.vn/Products/Images/42/307174/Slider/samsung-galaxy-s24-ultra-5g638417948922989679.jpg
samsung-galaxy-s24-ultra	https://cdn.tgdd.vn/Products/Images/42/307174/Slider/samsung-galaxy-s24-ultra-sliderr---2--1020x570.jpg
samsung-galaxy-s24-ultra	https://cdn.tgdd.vn/Products/Images/42/307174/Slider/samsung-galaxy-s24-ultra-sliderr---1--1020x570.jpg
samsung-galaxy-s24-ultra	https://cdn.tgdd.vn/Products/Images/42/307174/Slider/samsung-galaxy-s24-ultra-5g-66-1020x570.jpg
samsung-galaxy-s24-ultra	https://cdn.tgdd.vn/Products/Images/42/307174/Slider/samsung-galaxy-s24-ultra-5g638417948928059705.jpg
samsung-galaxy-s24-ultra	https://cdn.tgdd.vn/Products/Images/42/307174/Slider/samsung-galaxy-s24-ultra-5g638417948934759756.jpg
samsung-galaxy-a35	https://cdn.tgdd.vn/Products/Images/42/321772/samsung-galaxy-a35-5g-xanh-thumb-1-600x600.jpg
samsung-galaxy-a35	https://cdn.tgdd.vn/Products/Images/42/321772/Slider/vi-vn-samsung-galaxy-a35-5g-2.jpg
samsung-galaxy-a35	https://cdn.tgdd.vn/Products/Images/42/321772/Slider/vi-vn-samsung-galaxy-a35-5g-3.jpg
samsung-galaxy-a35	https://cdn.tgdd.vn/Products/Images/42/321772/Slider/samsung-galaxy-a35-camera-1920x1080.jpg
samsung-galaxy-a35	https://cdn.tgdd.vn/Products/Images/42/321772/Slider/vi-vn-samsung-galaxy-a35-5g-5.jpg
samsung-galaxy-a35	https://cdn.tgdd.vn/Products/Images/42/321772/Slider/vi-vn-samsung-galaxy-a35-5g-6.jpg
samsung-galaxy-a35	https://cdn.tgdd.vn/Products/Images/42/321772/Slider/vi-vn-samsung-galaxy-a35-5g-7.jpg
samsung-galaxy-a35	https://cdn.tgdd.vn/Products/Images/42/321772/Slider/vi-vn-samsung-galaxy-a35-5g-8.jpg
iphone-14-pro-max	https://cdn.tgdd.vn/Products/Images/42/289705/iphone-14-pro-max-tim-thumb-600x600.jpg
iphone-14-pro-max	https://cdn.tgdd.vn/Products/Images/42/289705/Slider/iphone-14-pro-max-tong-quan-1020x570.jpg
iphone-14-pro-max	https://cdn.tgdd.vn/Products/Images/42/289705/Slider/iphone-14-pro-max-up-3-new-1020x570.jpg
iphone-14-pro-max	https://cdn.tgdd.vn/Products/Images/42/289705/Slider/iphone-14-pro-max-1tb638173240851428157.jpg
iphone-14-pro-max	https://cdn.tgdd.vn/Products/Images/42/289705/Slider/iphone-14-pro-max-1tb638173240848348184.jpg
iphone-14-pro-max	https://cdn.tgdd.vn/Products/Images/42/289705/Slider/iphone-14-pro-max-1tb638173240853208169.jpg
iphone-14-pro-max	https://cdn.tgdd.vn/Products/Images/42/289705/Slider/iphone-14-pro-max-1tb638173240854448132.jpg
iphone-14-pro-max	https://cdn.tgdd.vn/Products/Images/42/289705/Slider/iphone-14-pro-max-1tb638173240855638153.jpg
imou-cruiser-dual-s7xp-10m0wed	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-thumb-600x600.jpg
imou-cruiser-dual-s7xp-10m0wed	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-2.jpg
imou-cruiser-dual-s7xp-10m0wed	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-3.jpg
imou-cruiser-dual-s7xp-10m0wed	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-4.jpg
imou-cruiser-dual-s7xp-10m0wed	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-5.jpg
imou-cruiser-dual-s7xp-10m0wed	https://cdn.tgdd.vn/Products/Images/4728/326586/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-dual-s7xp-10m0wed-11.jpg
xiaomi-redmi-a3	https://cdn.tgdd.vn/Products/Images/42/320734/xiaomi-redmi-a3-xanh-l%C3%A1-thumb-600x600.jpg
xiaomi-redmi-a3	https://cdn.tgdd.vn/Products/Images/42/320734/Slider/vi-vn-sld-xiaomi-redmi-a3-2.jpg
xiaomi-redmi-a3	https://cdn.tgdd.vn/Products/Images/42/320734/Slider/vi-vn-sld-xiaomi-redmi-a3-3.jpg
xiaomi-redmi-a3	https://cdn.tgdd.vn/Products/Images/42/320734/Slider/vi-vn-sld-xiaomi-redmi-a3-4.jpg
xiaomi-redmi-a3	https://cdn.tgdd.vn/Products/Images/42/320734/Slider/vi-vn-sld-xiaomi-redmi-a3-5.jpg
xiaomi-redmi-a3	https://cdn.tgdd.vn/Products/Images/42/320734/Slider/vi-vn-sld-xiaomi-redmi-a3-6.jpg
imou-cruiser-2-gs7ep-5m0we	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-1.jpg
imou-cruiser-2-gs7ep-5m0we	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-2.jpg
imou-cruiser-2-gs7ep-5m0we	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-3.jpg
imou-cruiser-2-gs7ep-5m0we	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-4.jpg
imou-cruiser-2-gs7ep-5m0we	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-5.jpg
imou-cruiser-2-gs7ep-5m0we	https://cdn.tgdd.vn/Products/Images/4728/326579/camera-ip-ngoai-troi-360-do-5mp-imou-cruiser-2-gs7ep-5m0we-11.jpg
acer-swift-edge-sfa16	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/13/638248692638800080_acer-swift-edge-sfa16-41-r3l6-r7-6800u-xanh-1.jpg
acer-swift-edge-sfa16	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/13/638248692636289248_acer-swift-edge-sfa16-41-r3l6-r7-6800u-xanh-4.jpg
nokia-220-4g	https://cdn.tgdd.vn/Products/Images/42/207956/nokia-220-4g-cam-4.jpg
nokia-220-4g	https://cdn.tgdd.vn/Products/Images/42/207956/nokia-220-4g-cam-7.jpg
acer-swift-edge-sfa16	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/13/638248692635825357_acer-swift-edge-sfa16-41-r3l6-r7-6800u-xanh-2.jpg
acer-swift-edge-sfa16	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/13/638248692635624370_acer-swift-edge-sfa16-41-r3l6-r7-6800u-xanh-5.jpg
acer-swift-edge-sfa16	https://images.fpt.shop/unsafe/fit-in/665x374/filters:quality(100):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/7/638349747780009705_acer-swift-edge-sfa16-41-r3l6-r7-6800u-1.jpg
acer-swift-edge-sfa16	https://images.fpt.shop/unsafe/fit-in/665x374/filters:quality(100):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/7/638349747972925107_acer-swift-edge-sfa16-41-r3l6-r7-6800u-3.jpg
acer-swift-edge-sfa16	https://images.fpt.shop/unsafe/fit-in/665x374/filters:quality(100):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/7/638349748411348529_acer-swift-edge-sfa16-41-r3l6-r7-6800u-2.jpg
acer-swift-edge-sfa16	https://images.fpt.shop/unsafe/fit-in/665x374/filters:quality(100):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/7/638349748414950958_acer-swift-edge-sfa16-41-r3l6-r7-6800u-4.jpg
samsung-galaxy-s23-fe	https://cdn.tgdd.vn/Products/Images/42/306994/samsung-galaxy-s23-fe-mint-thumbnew-600x600.jpg
samsung-galaxy-s23-fe	https://cdn.tgdd.vn/Products/Images/42/306994/samsung-galaxy-s23-fe-kem-4.jpg
samsung-galaxy-s23-fe	https://cdn.tgdd.vn/Products/Images/42/306994/samsung-galaxy-s23-fe-kem-7.jpg
samsung-galaxy-s23-fe	https://cdn.tgdd.vn/Products/Images/42/306994/Slider/vi-vn-samsung-galaxy-s23-fe-slider--(2).jpg
samsung-galaxy-s23-fe	https://cdn.tgdd.vn/Products/Images/42/306994/Slider/vi-vn-samsung-galaxy-s23-fe-slider--(7).jpg
samsung-galaxy-s23-fe	https://cdn.tgdd.vn/Products/Images/42/306994/Slider/vi-vn-samsung-galaxy-s23-fe-slider--(3).jpg
samsung-galaxy-s23-fe	https://cdn.tgdd.vn/Products/Images/42/306994/Slider/vi-vn-samsung-galaxy-s23-fe-slider--(5).jpg
acer-nitro-5-tiger-gaming-an515	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/3/1/637817435466475076_acer-nitro-gaming-an515-58-den-1.jpg
acer-nitro-5-tiger-gaming-an515	https://fptshop.com.vn/Uploads/images/2015/TSKT-ASUS-AN515-58-52SP.jpg
acer-nitro-5-tiger-gaming-an515	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/1/637817522653004001_Acer-Nitro%205-AN515-58-52SP-18.jpg
acer-nitro-5-tiger-gaming-an515	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/1/637817522606128440_Acer-Nitro%205-AN515-58-52SP-14.jpg
acer-nitro-5-tiger-gaming-an515	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/1/637817522398626657_Acer-Nitro%205-AN515-58-52SP-2.jpg
acer-nitro-5-tiger-gaming-an515	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/1/637817522398313998_Acer-Nitro%205-AN515-58-52SP-3.jpg
acer-nitro-5-tiger-gaming-an515	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/1/637817522558315344_Acer-Nitro%205-AN515-58-52SP-12.jpg
acer-nitro-5-tiger-gaming-an515	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/3/1/637817522634878698_Acer-Nitro%205-AN515-58-52SP-16.jpg
ezviz-h6	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-0.jpg
ezviz-h6	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-2.jpg
ezviz-h6	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-5.jpg
ezviz-h6	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6-6.jpg
ezviz-h6	https://cdn.tgdd.vn/Products/Images/4728/323202/camera-ip-360-do-5mp-ezviz-h6--9.jpg
samsung-galaxy-m15-5g	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-5g-blue-thumb-1-600x600.jpg
samsung-galaxy-m15-5g	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-xanh-4.jpg
samsung-galaxy-m15-5g	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-xanh-11.jpg
samsung-galaxy-m15-5g	https://cdn.tgdd.vn/Products/Images/42/325073/samsung-galaxy-m15-xanh-9.jpg
samsung-galaxy-m15-5g	https://cdn.tgdd.vn/Products/Images/42/325073/Slider/samsung-galaxy-m15-5g-4gb638537105708405995.jpg
samsung-galaxy-m15-5g	https://cdn.tgdd.vn/Products/Images/42/325073/Slider/samsung-galaxy-m15-5g-4gb638537105703096009.jpg
samsung-galaxy-m15-5g	https://cdn.tgdd.vn/Products/Images/42/325073/Slider/samsung-galaxy-m15-5g-4gb638537105706055955.jpg
hp-245-g10	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/8/22/638283012469903137_hp-245-g10-bac-1.jpg
hp-245-g10	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/8/638350603984058773_note.jpg
hp-245-g10	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/8/22/638283012469903137_hp-245-g10-bac-3.jpg
hp-245-g10	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/8/22/638283012468774377_hp-245-g10-bac-4.jpg
hp-245-g10	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/11/6/638348843073568784_Laptop%20HP%20245%20G10-03.jpg
hp-245-g10	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/11/6/638348843086106957_Laptop%20HP%20245%20G10-12.jpg
hp-245-g10	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/11/6/638348843084842488_Laptop%20HP%20245%20G10-14.jpg
hp-245-g10	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/11/6/638348843078324581_Laptop%20HP%20245%20G10-16.jpg
hp-pavilion-14-dv2073tu	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/11/638168307037428356_hp-pavilion-14-dv2073tu-i5-1235u-vang-4.jpg
nokia-220-4g	https://cdn.tgdd.vn/Products/Images/42/207956/nokia-220-4g-cam-thumb-600x600.jpg
hp-pavilion-14-dv2073tu	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/11/638168307038066944_hp-pavilion-14-dv2073tu-i5-1235u-vang-5.jpg
hp-pavilion-14-dv2073tu	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/11/638168307036109658_hp-pavilion-14-dv2073tu-i5-1235u-vang-1.jpg
hp-pavilion-14-dv2073tu	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/5/15/638197620166625693_Laptop%20HP%20Pavilion%2014-dv2073TU%20(2).JPG
hp-pavilion-14-dv2073tu	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/5/15/638197620168825743_Laptop%20HP%20Pavilion%2014-dv2073TU%20(3).JPG
hp-pavilion-14-dv2073tu	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/5/15/638197620303544502_Laptop%20HP%20Pavilion%2014-dv2073TU%20(12).JPG
hp-pavilion-14-dv2073tu	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/5/15/638197620435893001_Laptop%20HP%20Pavilion%2014-dv2073TU%20(18).JPG
hp-pavilion-14-dv2073tu	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/5/15/638197620514611074_Laptop%20HP%20Pavilion%2014-dv2073TU%20(20).JPG
nokia-220-4g	https://cdn.tgdd.vn/Products/Images/42/207956/Slider/nokia-220-4g638545759432734084.jpg
hp-probook-440-g10	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/31/638264226474075730_hp-probook-440-g10-bac-1.jpg
hp-probook-440-g10	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/1/16/638410309104612437_note.jpg
hp-probook-440-g10	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/31/638264226472842775_hp-probook-440-g10-bac-4.jpg
hp-probook-440-g10	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/7/31/638264226472323433_hp-probook-440-g10-bac-6.jpg
hp-probook-440-g10	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/1/16/638410305242805744_Laptop%20HP%20ProBook%20440%20G10%20i5%201340P-3.jpg
hp-probook-440-g10	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/1/16/638410305242962063_Laptop%20HP%20ProBook%20440%20G10%20i5%201340P-6.jpg
hp-probook-440-g10	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/1/16/638410305241087004_Laptop%20HP%20ProBook%20440%20G10%20i5%201340P-13.jpg
hp-probook-440-g10	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/1/16/638410305241555758_Laptop%20HP%20ProBook%20440%20G10%20i5%201340P-19.jpg
hp-gaming-victus-16-s0078ax	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/8/28/638288269292176880_hp-gaming-victus-16-s0078ax-r5-7640hs-3.jpg
hp-gaming-victus-16-s0078ax	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2024/6/12/638537885269823053_note.jpg
hp-gaming-victus-16-s0078ax	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/8/28/638288269291864254_hp-gaming-victus-16-s0078ax-r5-7640hs-2.jpg
hp-gaming-victus-16-s0078ax	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/8/28/638288269292496272_hp-gaming-victus-16-s0078ax-r5-7640hs-1.jpg
hp-gaming-victus-16-s0078ax	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/6/12/638537883317569784_Laptop%20HP%20Victus%2016-3.jpg
hp-gaming-victus-16-s0078ax	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/6/12/638537883333963592_Laptop%20HP%20Victus%2016-13.jpg
hp-gaming-victus-16-s0078ax	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/6/12/638537883330536912_Laptop%20HP%20Victus%2016-15.jpg
hp-gaming-victus-16-s0078ax	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2024/6/12/638537883330536912_Laptop%20HP%20Victus%2016-18.jpg
vivo-v30-5g	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-5g-xanh-thumb-600x600.jpg
vivo-v30-5g	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-blue-5.jpg
vivo-v30-5g	https://cdn.tgdd.vn/Products/Images/42/319214/vivo-v30-blue-11.jpg
vivo-v30-5g	https://cdn.tgdd.vn/Products/Images/42/319214/Slider/vivo-v30638534612533541648.jpg
vivo-v30-5g	https://cdn.tgdd.vn/Products/Images/42/319214/Slider/vivo-v30638534612528371619.jpg
vivo-v30-5g	https://cdn.tgdd.vn/Products/Images/42/319214/Slider/vivo-v30638534612538901705.jpg
vivo-v30-5g	https://cdn.tgdd.vn/Products/Images/42/319214/Slider/vivo-30-manhinh-1020x570.jpg
vivo-v30-5g	https://cdn.tgdd.vn/Products/Images/42/319214/Slider/vivo-v30638534612530461629.jpg
hp-14s-em0080au	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/11/638168318098594588_hp-14s-em0080au-r3-7320u-bac-1.jpg
hp-14s-em0080au	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/11/638168318098594588_hp-14s-em0080au-r3-7320u-bac-3.jpg
hp-14s-em0080au	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/11/638168318096894048_hp-14s-em0080au-r3-7320u-bac-4.jpg
hp-14s-em0080au	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/4/19/638175136614523942_DSC09081.JPG
hp-14s-em0080au	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/4/19/638175136617062659_DSC09082.JPG
hp-14s-em0080au	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/4/19/638175136831335634_DSC09091.JPG
hp-14s-em0080au	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/4/19/638175136710478057_DSC09086.JPG
hp-14s-em0080au	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/4/19/638175136832275174_DSC09095.JPG
điện-thoại-iphone-15-plus-256gb	https://cdn.tgdd.vn/Products/Images/42/303823/iphone-15-plus-hong-256gb-thumb-600x600.jpg
điện-thoại-iphone-15-plus-256gb	https://cdn.tgdd.vn/Products/Images/42/303823/iphone-15-plus-256gb-hong-2.jpg
điện-thoại-iphone-15-plus-256gb	https://cdn.tgdd.vn/Products/Images/42/303823/Slider/iphone-15-plus-256gb638315389049622358.jpg
điện-thoại-iphone-15-plus-256gb	https://cdn.tgdd.vn/Products/Images/42/303823/Slider/iphone-15-plus-256gb638315389048582287.jpg
điện-thoại-iphone-15-plus-256gb	https://cdn.tgdd.vn/Products/Images/42/303823/Slider/iphone-15-plus-256gb638315389046552237.jpg
điện-thoại-iphone-15-plus-256gb	https://cdn.tgdd.vn/Products/Images/42/303823/Slider/iphone-15-plus-256gb638315389040882255.jpg
điện-thoại-iphone-15-plus-256gb	https://cdn.tgdd.vn/Products/Images/42/303823/Slider/iphone-15-plus-256gb638315389041842287.jpg
điện-thoại-iphone-15-plus-256gb	https://cdn.tgdd.vn/Products/Images/42/303823/Slider/iphone-15-plus-12-1020x570.png
iphone-14-plus-128gb	https://cdn.tgdd.vn/Products/Images/42/245545/iPhone-14-plus-thumb-xanh-1-600x600.jpg
iphone-14-plus-128gb	https://cdn.tgdd.vn/Products/Images/42/245545/iphone-14-plus-xanh-7.jpg
iphone-14-plus-128gb	https://cdn.tgdd.vn/Products/Images/42/245545/iphone-14-plus-xanh-11.jpg
iphone-14-plus-128gb	https://cdn.tgdd.vn/Products/Images/42/245545/Slider/iphone-14-plus-up-3-new-1933x982.jpg
iphone-14-plus-128gb	https://cdn.tgdd.vn/Products/Images/42/245545/Slider/iphone-14-plus-up-4-1933x982.jpg
iphone-14-plus-128gb	https://cdn.tgdd.vn/Products/Images/42/245545/Slider/iphone-14-plus-up-5-1933x982.jpg
iphone-14-plus-128gb	https://cdn.tgdd.vn/Products/Images/42/245545/Slider/vi-vn-iphone-14-plus-up-6.jpg
laptop-acer-swift-go-sfg14	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/30/638316665596903924_acer-swift-go-sfg14-41-r19z-r5-7530u-5.jpg
laptop-acer-swift-go-sfg14	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/12/14/638381739954387939_note.jpg
laptop-acer-swift-go-sfg14	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/30/638316665596450980_acer-swift-go-sfg14-41-r19z-r5-7530u-2.jpg
laptop-acer-swift-go-sfg14	https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/30/638316665596450980_acer-swift-go-sfg14-41-r19z-r5-7530u-3.jpg
laptop-acer-swift-go-sfg14	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/12/14/638381737194405257_Laptop%20Acer%20Swift%20Go%20SFG14-41-R19Z-4.jpg
laptop-acer-swift-go-sfg14	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/12/14/638381737186708961_Laptop%20Acer%20Swift%20Go%20SFG14-41-R19Z-7.jpg
laptop-acer-swift-go-sfg14	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/12/14/638381737186552576_Laptop%20Acer%20Swift%20Go%20SFG14-41-R19Z-8.jpg
laptop-acer-swift-go-sfg14	https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2023/12/14/638381737193427815_Laptop%20Acer%20Swift%20Go%20SFG14-41-R19Z-19.jpg
điện-thoại-iphone-11-64gb	https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-trang-600x600.jpg
điện-thoại-iphone-11-64gb	https://cdn.tgdd.vn/Products/Images/42/153856/Slider/iphone-11-up-4-new-1933x982.jpg
điện-thoại-iphone-11-64gb	https://cdn.tgdd.vn/Products/Images/42/153856/Slider/vi-vn-iphone-11-up-5.jpg
điện-thoại-iphone-11-64gb	https://cdn.tgdd.vn/Products/Images/42/153856/Slider/vi-vn-iphone-11-up-6.jpg
điện-thoại-iphone-11-64gb	https://cdn.tgdd.vn/Products/Images/42/153856/Slider/vi-vn-iphone-11-up-7.jpg
điện-thoại-iphone-11-64gb	https://cdn.tgdd.vn/Products/Images/42/153856/Slider/vi-vn-iphone-11-up-8.jpg
điện-thoại-iphone-11-64gb	https://cdn.tgdd.vn/Products/Images/42/153856/Slider/vi-vn-iphone-11-up-9.jpg
điện-thoại-iphone-15-128gb	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-xanh-la-thumb-600x600.jpg
điện-thoại-iphone-15-128gb	https://cdn.tgdd.vn/Products/Images/42/281570/iphone-15-128gb-xanh-la-2.jpg
điện-thoại-iphone-15-128gb	https://cdn.tgdd.vn/Products/Images/42/281570/Slider/vi-vn-iphone-15-slider--(5).jpg
điện-thoại-iphone-15-128gb	https://cdn.tgdd.vn/Products/Images/42/281570/Slider/vi-vn-iphone-15-slider--(3).jpg
điện-thoại-iphone-15-128gb	https://cdn.tgdd.vn/Products/Images/42/281570/Slider/vi-vn-iphone-15-slider--(2).jpg
điện-thoại-iphone-15-128gb	https://cdn.tgdd.vn/Products/Images/42/281570/Slider/vi-vn-iphone-15-slider--(6).jpg
điện-thoại-iphone-15-128gb	https://cdn.tgdd.vn/Products/Images/42/281570/Slider/vi-vn-iphone-15-slider--(1).jpg
samsung-galaxy-z-flip5-5g	https://cdn.tgdd.vn/Products/Images/42/299250/samsung-galaxy-z-flip5-mint-thumbnew-600x600.jpg
samsung-galaxy-z-flip5-5g	https://cdn.tgdd.vn/Products/Images/42/299250/Slider/samsung-galaxy-z-flip5-5g-sld-1021x570.jpg
samsung-galaxy-z-flip5-5g	https://cdn.tgdd.vn/Products/Images/42/299250/Slider/vi-vn-samsung-galaxy-z-flip5-256gb-(2).jpg
samsung-galaxy-z-flip5-5g	https://cdn.tgdd.vn/Products/Images/42/299250/Slider/vi-vn-samsung-galaxy-z-flip5-256gb-(4).jpg
samsung-galaxy-z-flip5-5g	https://cdn.tgdd.vn/Products/Images/42/299250/Slider/vi-vn-samsung-galaxy-z-flip5-256gb-(5).jpg
samsung-galaxy-z-flip5-5g	https://cdn.tgdd.vn/Products/Images/42/299250/Slider/vi-vn-samsung-galaxy-z-flip5-256gb-(3).jpg
samsung-galaxy-z-flip5-5g	https://cdn.tgdd.vn/Products/Images/42/299250/Slider/vi-vn-samsung-galaxy-z-flip5-256gb-(6).jpg
samsung-galaxy-z-flip5-5g	https://cdn.tgdd.vn/Products/Images/42/299250/Slider/vi-vn-samsung-galaxy-z-flip5-256gb-(7).jpg
ipad-pro-m4-13-inch-wifi-256gb	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-13-inch-m4-wifi-sliver-thumb-200x200.jpg
ipad-pro-m4-13-inch-wifi-256gb	https://cdn.tgdd.vn/Products/Images/522/325517/ipad-pro-13-inch-m4-wifi-sliver-3.jpg
ipad-pro-m4-13-inch-wifi-256gb	https://cdn.tgdd.vn/Products/Images/522/325517/Slider/ipad-pro-m4-13-inch-wifi-256gb638527735344404947.jpg
ipad-pro-m4-13-inch-wifi-256gb	https://cdn.tgdd.vn/Products/Images/522/325517/Slider/ipad-pro-m4-13-inch-wifi-256gb638527735341364975.jpg
ipad-pro-m4-13-inch-wifi-256gb	https://cdn.tgdd.vn/Products/Images/522/325517/Slider/ipad-pro-m4-13-inch-wifi-256gb638527735339004978.jpg
ipad-pro-m4-13-inch-wifi-256gb	https://cdn.tgdd.vn/Products/Images/522/325517/Slider/ipad-pro-m4-13-inch-wifi-256gb638527735342344968.jpg
ipad-pro-m4-13-inch-wifi-256gb	https://cdn.tgdd.vn/Products/Images/522/325517/Slider/ipad-pro-m4-13-inch-wifi-256gb638527735337554972.jpg
ipad-pro-m4-13-inch-wifi-256gb	https://cdn.tgdd.vn/Products/Images/522/325517/Slider/ipad-pro-m4-13-inch-wifi-256gb638527735340054978.jpg
samsung-galaxy-tab-s9+-wifi	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-kem-thumbnew-600x600.jpg
samsung-galaxy-tab-s9+-wifi	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-wifi-256gb-bac-6-1.jpg
samsung-galaxy-tab-s9+-wifi	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-wifi-256gb-bac-8-1.jpg
samsung-galaxy-tab-s9+-wifi	https://cdn.tgdd.vn/Products/Images/522/307178/samsung-galaxy-tab-s9-plus-wifi-256gb-bac-11-1.jpg
samsung-galaxy-tab-s9+-wifi	https://cdn.tgdd.vn/Products/Images/522/307178/Slider/samsung-galaxy-tab-s9-plus-1-1020x570.jpg
samsung-galaxy-tab-s9+-wifi	https://cdn.tgdd.vn/Products/Images/522/307178/Slider/vi-vn-samsung-galaxy-tab-s9-plus-slider--(7).jpg
samsung-galaxy-tab-s9+-wifi	https://cdn.tgdd.vn/Products/Images/522/307178/Slider/vi-vn-samsung-galaxy-tab-s9-plus-slider--(3).jpg
samsung-galaxy-tab-s9+-wifi	https://cdn.tgdd.vn/Products/Images/522/307178/Slider/vi-vn-samsung-galaxy-tab-s9-plus-slider--5--1020x570.jpg
samsung-galaxy-tab-s9-fe-wifi	https://cdn.tgdd.vn/Products/Images/522/309818/galaxy-tab-s9-fe-xanh-mint-thumb-600x600.jpg
samsung-galaxy-tab-s9-fe-wifi	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-den-5.jpg
samsung-galaxy-tab-s9-fe-wifi	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-den-7.jpg
samsung-galaxy-tab-s9-fe-wifi	https://cdn.tgdd.vn/Products/Images/522/309818/samsung-galaxy-tab-s9-fe-den-13.jpg
samsung-galaxy-tab-s9-fe-wifi	https://cdn.tgdd.vn/Products/Images/522/309818/Slider/vi-vn-samsung-galaxy-tab-s9-fe--(6).jpg
samsung-galaxy-tab-s9-fe-wifi	https://cdn.tgdd.vn/Products/Images/522/309818/Slider/vi-vn-samsung-galaxy-tab-s9-fe--(2).jpg
samsung-galaxy-tab-s9-fe-wifi	https://cdn.tgdd.vn/Products/Images/522/309818/Slider/vi-vn-samsung-galaxy-tab-s9-fe--(3).jpg
samsung-galaxy-tab-s9-fe-wifi	https://cdn.tgdd.vn/Products/Images/522/309818/Slider/vi-vn-samsung-galaxy-tab-s9-fe--(5).jpg
oppo-pad-air-wifi	https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-thumbnew-600x600.jpeg
oppo-pad-air-wifi	https://cdn.tgdd.vn/Products/Images/522/305838/oppo-pad-air-128gb-tim-1.jpg
oppo-pad-air-wifi	https://cdn.tgdd.vn/Products/Images/522/305838/Slider/vi-vn-oppo-pad-air-128gb--(1).jpg
oppo-pad-air-wifi	https://cdn.tgdd.vn/Products/Images/522/305838/Slider/oppo-pad-air-128gb-thiet-ke-1020x570.jpg
oppo-pad-air-wifi	https://cdn.tgdd.vn/Products/Images/522/305838/Slider/vi-vn-oppo-pad-air-128gb--(4).jpg
oppo-pad-air-wifi	https://cdn.tgdd.vn/Products/Images/522/305838/Slider/vi-vn-oppo-pad-air-128gb-33-1020x570.jpg
oppo-pad-air-wifi	https://cdn.tgdd.vn/Products/Images/522/305838/Slider/vi-vn-oppo-pad-air-128gb--(5).jpg
oppo-pad-air-wifi	https://cdn.tgdd.vn/Products/Images/522/305838/Slider/vi-vn-oppo-pad-air-128gb--(6).jpg
lenovo-tab-m9-4g	https://cdn.tgdd.vn/Products/Images/522/306923/lenovo-tab-m8-xanh-thumb-1-600x600.jpg
lenovo-tab-m9-4g	https://cdn.tgdd.vn/Products/Images/522/306923/Slider/lenovo-tab-m9-slider---6--1020x570.png
lenovo-tab-m9-4g	https://cdn.tgdd.vn/Products/Images/522/306923/Slider/lenove-tab-m9-slider---5--1020x570-1.png
lenovo-tab-m9-4g	https://cdn.tgdd.vn/Products/Images/522/306923/Slider/vi-vn-lenovo-tab-m9-slider--(4).jpg
lenovo-tab-m9-4g	https://cdn.tgdd.vn/Products/Images/522/306923/Slider/lenovo-tab-m9-slider---3--1020x570.png
lenovo-tab-m9-4g	https://cdn.tgdd.vn/Products/Images/522/306923/Slider/lenove-tab-m9-slider---2--1020x570.png
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rating (id, average, five_starts, four_starts, one_start, three_starts, two_starts, product_id) FROM stdin;
2	0	0	0	0	0	0	laptop-lenovo-ideapad-slim-3
3	5	1	0	0	0	0	iphone-15-pro-max
4	0	0	0	0	0	0	laptop-dell-inspiron-14-5440
5	0	0	0	0	0	0	tp-link-tapo-tc70
1	5	1	0	0	0	0	tiandy-tc-h322n
6	0	0	0	0	0	0	laptop-asus-vivobook-14-oled
8	0	0	0	0	0	0	imou-ranger-rc-gk2cp-3c0wr
9	0	0	0	0	0	0	laptop-asus-expertbook-b1
10	0	0	0	0	0	0	laptop-asus-vivobook-16
11	0	0	0	0	0	0	botslab-c212
12	0	0	0	0	0	0	điện-thoại-iphone-11-64gb
13	0	0	0	0	0	0	laptop-asus-zenbook-flip-oled
14	0	0	0	0	0	0	điện-thoại-iphone-13-128gb
15	0	0	0	0	0	0	điện-thoại-iphone-15-plus-256gb
17	0	0	0	0	0	0	laptop-lenovo-ideapad-1
18	0	0	0	0	0	0	ezviz-h6c-pro
19	0	0	0	0	0	0	laptop-lenovo-thinkpad-e16
20	0	0	0	0	0	0	samsung-galaxy-a55-5g
21	0	0	0	0	0	0	laptop-lenovo-yoga-slim-7
22	0	0	0	0	0	0	lenovo-ideapad-slim-5-16imh9
23	0	0	0	0	0	0	samsung-galaxy-a24
24	5	1	0	0	0	0	samsung-galaxy-z-flip5-5g
26	0	0	0	0	0	0	vivo-y03
27	0	0	0	0	0	0	vivo-y28
28	0	0	0	0	0	0	oppo-find-n3-5g
29	0	0	0	0	0	0	oppo-reno11-5g
30	0	0	0	0	0	0	macbook-air-13-inch-m1-2020
31	0	0	0	0	0	0	macbook-air-15-inch-m2-2023
32	0	0	0	0	0	0	macbook-air-m3-13-inch-2024
33	0	0	0	0	0	0	macbook-pro-14-2023-m3
34	0	0	0	0	0	0	macbook-pro-16-2023-m3-pro
35	0	0	0	0	0	0	asus-tuf-gaming-fx507zc4
36	0	0	0	0	0	0	dell-vostro-v3520
37	0	0	0	0	0	0	dell-inspiron-15-n3530
38	0	0	0	0	0	0	dell-latitude-3520
39	0	0	0	0	0	0	acer-aspire-7-gaming-a715
41	0	0	0	0	0	0	acer-nitro-gaming-an515
42	0	0	0	0	0	0	laptop-acer-swift-go-sfg14
43	0	0	0	0	0	0	xiaomi-redmi-a3
44	0	0	0	0	0	0	xiaomi-redmi-note-13-pro+-5g
45	0	0	0	0	0	0	realme-c65
46	0	0	0	0	0	0	realme-c67
47	0	0	0	0	0	0	tcl-40-nxtpaper
48	0	0	0	0	0	0	tcl-406s
49	0	0	0	0	0	0	samsung-galaxy-s24-ultra
50	0	0	0	0	0	0	samsung-galaxy-a35
7	5	1	0	0	0	0	điện-thoại-iphone-15-128gb
51	0	0	0	0	0	0	iphone-14-pro-max
52	0	0	0	0	0	0	imou-cruiser-dual-s7xp-10m0wed
53	0	0	0	0	0	0	imou-cruiser-2-gs7ep-5m0we
54	0	0	0	0	0	0	acer-swift-edge-sfa16
55	0	0	0	0	0	0	samsung-galaxy-s23-fe
56	0	0	0	0	0	0	acer-nitro-5-tiger-gaming-an515
57	0	0	0	0	0	0	ezviz-h6
58	3	0	0	0	1	0	samsung-galaxy-m15-5g
59	0	0	0	0	0	0	hp-245-g10
60	0	0	0	0	0	0	hp-pavilion-14-dv2073tu
61	0	0	0	0	0	0	nokia-220-4g
62	0	0	0	0	0	0	hp-probook-440-g10
63	0	0	0	0	0	0	hp-gaming-victus-16-s0078ax
64	0	0	0	0	0	0	vivo-v30-5g
65	0	0	0	0	0	0	hp-14s-em0080au
66	0	0	0	0	0	0	iphone-14-plus-128gb
25	5	1	0	0	0	0	samsung-galaxy-z-fold5-5g
40	5	1	0	0	0	0	acer-aspire-3
67	0	0	0	0	0	0	ipad-pro-m4-13-inch-wifi-256gb
69	0	0	0	0	0	0	samsung-galaxy-tab-s9+-wifi
70	0	0	0	0	0	0	samsung-galaxy-tab-s9-fe-wifi
71	0	0	0	0	0	0	oppo-pad-air-wifi
72	0	0	0	0	0	0	lenovo-tab-m9-4g
\.


--
-- Data for Name: staff_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_user (staffid, active_state, email, full_name, password, phone, role) FROM stdin;
1	t	admin@gmail.com	Admin	$2a$10$uyRwMB1mSsuaSfOS05e2quy.mz/nyrOTU07iCincYw/aX3YUGrxHG	012345678	ADMIN
2	t	kienluu@gmail.com	Kien Luu	$2a$10$1RLtaUi5RNffeXTgQRifQuZMHzp1/DNCZb1SC.tv84Ctjg1EK5qK6	012345678	USER
3	t	thuynga@gmail.com	Thuy Nga	$2a$10$rYJoypKmSVdbaeCpI9Et.ebcvvFM9FXfrq8rZip5gfk5AOPBzwV.W	012345678	USER
4	t	ngovuong@gmail.com	Ngo Vuong	$2a$10$nBKwui.tVJfNHXfzj6mMW.tZwljcoQRY3M06EpYh0TJvbwI0K5kU.	012345678	USER
5	t	jisooconan@gmail.com	Dinh kien	$2a$10$4TkxMQ.5PCRktxJQ2h0X2uXUKcuqhIAvJPmHJhrMrWSPsiwtxTabe	0353795729	USER
\.


--
-- Name: carousel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carousel_id_seq', 19, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 4, true);


--
-- Name: color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.color_id_seq', 138, true);


--
-- Name: content_children_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.content_children_id_seq', 602, true);


--
-- Name: description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.description_id_seq', 72, true);


--
-- Name: feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feature_id_seq', 72, true);


--
-- Name: price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_id_seq', 96, true);


--
-- Name: producer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producer_id_seq', 21, true);


--
-- Name: rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rating_id_seq', 72, true);


--
-- Name: staff_user_staffid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_user_staffid_seq', 5, true);


--
-- Name: carousel carousel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carousel
    ADD CONSTRAINT carousel_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (id);


--
-- Name: content_children content_children_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_children
    ADD CONSTRAINT content_children_pkey PRIMARY KEY (id);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (id);


--
-- Name: feature feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT feature_pkey PRIMARY KEY (id);


--
-- Name: order_entity order_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_entity
    ADD CONSTRAINT order_entity_pkey PRIMARY KEY (order_id);


--
-- Name: price price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);


--
-- Name: producer_category producer_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producer_category
    ADD CONSTRAINT producer_category_pkey PRIMARY KEY (producer, category);


--
-- Name: producer producer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producer
    ADD CONSTRAINT producer_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- Name: staff_user staff_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_user
    ADD CONSTRAINT staff_user_pkey PRIMARY KEY (staffid);


--
-- Name: feature uk_4s0x1n5og7plblawve63fo7nr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT uk_4s0x1n5og7plblawve63fo7nr UNIQUE (product_id);


--
-- Name: description uk_9pwx009hdvoqv908mviio74rr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT uk_9pwx009hdvoqv908mviio74rr UNIQUE (product_id);


--
-- Name: rating uk_9xmokhsr5b19ci77c84gdo88w; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT uk_9xmokhsr5b19ci77c84gdo88w UNIQUE (product_id);


--
-- Name: price fk2e4h0n5aglqaygp95he347739; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT fk2e4h0n5aglqaygp95he347739 FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: order_entity fk39ytj2bduaomcm7p4iue85jnx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_entity
    ADD CONSTRAINT fk39ytj2bduaomcm7p4iue85jnx FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: content_children fk7o86jxvpd8jj66eslrqiss8n3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_children
    ADD CONSTRAINT fk7o86jxvpd8jj66eslrqiss8n3 FOREIGN KEY (description_id) REFERENCES public.description(id);


--
-- Name: feature fk810l56o2f4ev18qmd4434tqnw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT fk810l56o2f4ev18qmd4434tqnw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: feature_rear_camera fkb2fukq8wlg1q7nwe1074hh4mc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_rear_camera
    ADD CONSTRAINT fkb2fukq8wlg1q7nwe1074hh4mc FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: product_images fki8jnqq05sk5nkma3pfp3ylqrt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT fki8jnqq05sk5nkma3pfp3ylqrt FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: price fkk4mbgqf5yru5ib5b6w5l6ukkj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT fkk4mbgqf5yru5ib5b6w5l6ukkj FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: feature_front_camera fkli5mywv1ibquq9ao8mk0imbr6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_front_camera
    ADD CONSTRAINT fkli5mywv1ibquq9ao8mk0imbr6 FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: rating fklkuwie0au2dru36asng9nywmh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT fklkuwie0au2dru36asng9nywmh FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: description fkpu1hnodrf9m8awy8u83u4rv7a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT fkpu1hnodrf9m8awy8u83u4rv7a FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: color fksgsuxxoc1h5pskbjpch4id2ec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT fksgsuxxoc1h5pskbjpch4id2ec FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- PostgreSQL database dump complete
--

