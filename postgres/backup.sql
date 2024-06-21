--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Ubuntu 16.3-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-1.pgdg22.04+1)

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


ALTER SEQUENCE public.carousel_id_seq OWNER TO postgres;

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


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

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


ALTER SEQUENCE public.color_id_seq OWNER TO postgres;

--
-- Name: color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.color_id_seq OWNED BY public.color.id;


--
-- Name: description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.description (
    id bigint NOT NULL,
    content text,
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


ALTER SEQUENCE public.description_id_seq OWNER TO postgres;

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


ALTER SEQUENCE public.feature_id_seq OWNER TO postgres;

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


ALTER SEQUENCE public.price_id_seq OWNER TO postgres;

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


ALTER SEQUENCE public.producer_id_seq OWNER TO postgres;

--
-- Name: producer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producer_id_seq OWNED BY public.producer.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id character varying(255) NOT NULL,
    name character varying(255),
    category_name character varying(255),
    producer_name character varying(255),
    available integer,
    ordering integer,
    total_quantity integer
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
-- Name: staff_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_user (
    staffid bigint NOT NULL,
    active_state boolean NOT NULL,
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


ALTER SEQUENCE public.staff_user_staffid_seq OWNER TO postgres;

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
-- Name: staff_user staffid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_user ALTER COLUMN staffid SET DEFAULT nextval('public.staff_user_staffid_seq'::regclass);


--
-- Data for Name: carousel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carousel (id, image_url, target_url, title) FROM stdin;
15	https://i.pinimg.com/736x/85/9d/c7/859dc77032e375f8c24dce78e99e7e9b.jpg	\N	item
16	https://i.pinimg.com/736x/27/d7/95/27d795bb221203dc23f7c5c0d8453f94.jpg	\N	item
17	https://i.pinimg.com/564x/f1/aa/b9/f1aab9b047c06609a531377003c5b740.jpg	\N	item
18	https://i.pinimg.com/564x/43/8c/c5/438cc57c07f6835e52b9dc69319d427b.jpg	\N	item
19	https://i.pinimg.com/736x/41/c6/4a/41c64a61fc1e8c0f43f8c298db8135cf.jpg	\N	item
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
1	Phone
2	Laptop
3	Camera
12	PC
13	Fan
14	Mouse
15	Tablet
\.


--
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.color (id, color, link, product_id) FROM stdin;
1	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	iphone-15
2	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	iphone-15
4	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	samsung-s24
5	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	samsung-s24
6	Cream	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	samsung-s24
7	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	xiaomi-mi14
8	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	xiaomi-mi14
10	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	xiaomi-mi11t
11	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	xiaomi-mi11t
13	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	asus-x415
14	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	asus-x415
15	Cream	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	asus-x415
16	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	iphone-14
17	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	iphone-14
19	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	vivo-v15
20	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	vivo-v15
21	Cream	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	vivo-v15
22	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	realme-c33
23	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	realme-c33
24	Cream	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	realme-c33
25	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	oppo-reno11f-5g
26	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	oppo-reno11f-5g
34	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	iphone-15-promax
35	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	iphone-15-promax
36	Cream	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	iphone-15-promax
37	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	vivo-y100
38	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	vivo-y100
40	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	samsung-m54
41	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	samsung-m54
42	Cream	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	samsung-m54
43	Purple	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	redmi-13c
44	Blue	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	redmi-13c
45	Cream	https://i.pinimg.com/564x/0a/50/6a/0a506a1be9c2c4f8509fae1e78d83cc2.jpg	redmi-13c
46	red	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717844135/b5qeilwrbl2myoamhjqn.jpg	xiaomi-16
47	blue	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717844135/apry267fudm3fyfwlgfz.jpg	xiaomi-16
48	red	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717844135/b5qeilwrbl2myoamhjqn.jpg	xiaomi-17
49	blue	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717844135/apry267fudm3fyfwlgfz.jpg	xiaomi-17
50	Luu Kien	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717846927/mktkiahgaj8vgqc32wqf.jpg	iphone-5
51	Luu Kien	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717847044/jitaijgye4mc40iwlkiy.jpg	samsung-sj
61	gray	https://res.cloudinary.com/dmi3xizxq/image/upload/v1718208022/hz3akmxk6alcvi9kmyiw.jpg	dell-laptitude
62	gray	https://res.cloudinary.com/dmi3xizxq/image/upload/v1718208301/q0evx6b6sehh88rjss26.png	dell-baa
63	black	https://res.cloudinary.com/dmi3xizxq/image/upload/v1718683157/nd73lhaskm8u88cmnekp.png	sony-x12
\.


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.description (id, content, title, product_id) FROM stdin;
1	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	iphone-15
2	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	samsung-s24
4	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	xiaomi-mi11t
5	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	asus-x415
6	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	iphone-14
7	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	vivo-v15
8	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	realme-c33
9	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	oppo-reno11f-5g
10	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	samsung-a55-5g
12	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	iphone-15-promax
13	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	vivo-y100
14	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	samsung-m54
15	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Galaxy S23 Plus, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	redmi-13c
16		Hello i'm kien	xiaomi-16
17		Hello i'm kien	xiaomi-17
18	Hello this is my content \n\nAbc\n\nabc\n\n	student	iphone-5
19	Hello this is my content \n\nAbc\n\nabc\n\n	student	samsung-sj
28	Hello this is my content \n\nAbc\n\nabc\n\n	Laptop Dell laptitude	dell-laptitude
29	Hello this is my content \n\nAbc\n\nabc\n\n	student	dell-baa
3	Tuyệt tác sắc màu thiên nhiên\n Sự kết hợp giữa sắc màu thiên nhiên và công nghệ chế tác vượt trội, viền siêu mỏng, khung kim loại bo cong sang trọng, Samsung Galaxy S23 Plus đạt chuẩn điện thoại cao cấp với nét đẹp tinh tế và cuốn hút trong từng chi tiết. Các màu sắc này còn thể hiện đúng tinh thần xanh của điện thoại Galaxy S 2023 series bao gồm: Kem Cotton, Xanh Botanic, Tím Lilac và Đen Phantom, mang tới sức sống tràn đầy cảm hứng nhưng vẫn đảm bảo tính hiện đại, sang trọng cho tổng thể. Thiết kế vì hành tinh xanh\nXây dựng hành tinh xanh từ những thay đổi nhỏ, Samsung góp phần bảo vệ môi trường khi sử dụng linh kiện từ vật liệu tái chế cho Galaxy S23 Plus. Ngay khi mở hộp, bạn sẽ thấy sự đổi thay bởi bao bì cùng màng bảo vệ từ giấy tái chế, màu nhuộm nguồn gốc tự nhiên và  lớp phim phủ PET tái chế. Đối với lớp kính bảo vệ, Samsung sử dụng Gorilla Glass Victus 2, vừa đảm bảo sự bền bỉ, vừa bảo vệ môi trường với 22% chất liệu thủy tinh tái chế. Tất cả hòa hợp, gói gọn trong siêu phẩm cao cấp, bền vững và đáng tin cậy, khẳng định tuyên ngôn sống xanh và thân thiện với hành tinh.	Khám phá những công nghệ tiên tiến nhất trên thiết bị Xiaomi 14 Ultra, bạn sẽ có trải nghiệm toàn năng từ thiết kế bền vững, camera Mắt thần bóng đêm cao cấp, bộ vi xử lý Snapdragon 8 Gen 2 for Galaxy mạnh mẽ đến viên pin bền bỉ và màn hình lớn sắc nét. Một sự kết hợp hoàn hảo, hội tụ mọi điểm ấn tượng trên thế hệ di động thông minh 2023.	xiaomi-mi14
30	Hello this is my content \n\nAbc\n\nabc\n\n	Sony X12 	sony-x12
\.


--
-- Data for Name: feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature (id, os, battery, chip, made_time, screen, product_id) FROM stdin;
2	Android 14	5160	Exynos 2200	2021-04-12 00:00:00	6.4 inch, FHD+, Dynamic AMOLED 2X, 1080 x 2340 Pixels	samsung-s24
5	Window 11	5160	Intel core I5 11th	2021-04-12 00:00:00	14 inch, FHD+, IPS-LCD, 1080 x 2340 Pixels	asus-x415
7	Android 14	5160	Snapdragon 888	2021-04-12 00:00:00	14 inch, FHD+, IPS-LCD, 1080 x 2340 Pixels	vivo-v15
8	Android 14	5160	Snapdragon 888	2021-04-12 00:00:00	14 inch, FHD+, IPS-LCD, 1080 x 2340 Pixels	realme-c33
11	IOS 17.5	5160	A bionic 13	2021-04-12 00:00:00	14 inch, FHD+, IPS-LCD, 1080 x 2340 Pixels	iphone-15-promax
13	Android 14	5160	Snapdragon 675	2021-04-12 00:00:00	14 inch, FHD+, IPS-LCD, 1080 x 2340 Pixels	samsung-m54
14	Android 14	5160	Snapdragon 675	2021-04-12 00:00:00	14 inch, FHD+, IPS-LCD, 1080 x 2340 Pixels	redmi-13c
15	Android	5160	Snapdragon 860	2021-01-10 00:00:00	6.4 inch	xiaomi-16
16	Android	5160	Snapdragon 860	2021-01-10 00:00:00	6.4 inch	xiaomi-17
17	Android	5160	Abionic 14	2021-01-10 00:00:00	6.4 inch	iphone-5
18	Android	5160	Abionic 14	2021-01-10 00:00:00	6.4 inch	samsung-sj
26	MAC OS	5160	Intel Core i7	2021-01-10 00:00:00	6.4 inch	dell-baa
25	Windows	7000	Intel Core i7	2018-12-31 00:00:00	16 inch	dell-laptitude
10	Android	5160	Snapdragon 888	2017-12-31 00:00:00	14 inch, FHD+, IPS-LCD, 1080 x 2340 Pixels	samsung-a55-5g
12	Android 14	5160	Snapdragon 675	2021-01-03 00:00:00	14 inch, FHD+, IPS-LCD, 1080 x 2340 Pixels	vivo-y100
9	Android 14	5160	Snapdragon 888	2021-01-03 00:00:00	14 inch, FHD+, IPS-LCD, 1080 x 2340 Pixels	oppo-reno11f-5g
3	Android	5160	Snapdragon 860	2021-01-11 00:00:00	6.4 inch, FHD+, Dynamic AMOLED 2X, 1080 x 2340 Pixels	xiaomi-mi14
4	Android 14	5160	Exynos 2200	2021-01-03 00:00:00	6.4 inch, FHD+, Dynamic AMOLED 2X, 1080 x 2340 Pixels	xiaomi-mi11t
1	Android 14	5160	Exynos 2200	2021-01-03 00:00:00	6.4 inch, FHD+, Dynamic AMOLED 2X, 1080 x 2340 Pixels	iphone-15
6	Window 11	5160	Intel I5 11th	2021-01-03 00:00:00	14 inch, FHD+, IPS-LCD, 1080 x 2340 Pixels	iphone-14
27		5160	Snapdragon 860	2019-01-09 00:00:00	4 inch	sony-x12
\.


--
-- Data for Name: feature_front_camera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_front_camera (feature_id, front_camera) FROM stdin;
2	12
5	12
7	12
8	12
11	12
13	12
15	20
16	20
17	20
14	12
18	20
26	20
25	2
10	12
12	12
9	12
3	12
4	12
1	12
6	12
\.


--
-- Data for Name: feature_rear_camera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_rear_camera (feature_id, rear_camera) FROM stdin;
2	50
2	12
2	8
15	64
16	64
17	64
18	64
10	64
10	128
3	50
3	12
3	8
4	50
4	12
4	8
1	50
1	12
1	8
27	64
\.


--
-- Data for Name: order_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_entity (order_id, done, email, phone, "time", product_id) FROM stdin;
y7fiV9ui4k	t	jisooconan@gmail.com	0353795729	2024-06-16 21:09:18.123	samsung-sj
bMT2JYMbo3	t	jisooconan@gmail.com	0353795729	2024-06-16 21:20:36.58	xiaomi-mi14
V8mdY1W1Tb	t	jisooconan@gmail.com	0353795729	2024-06-17 13:18:00.437	vivo-v15
9V7kHjFN1x	f	jisooconan@gmail.com	0353795729	2024-06-18 08:49:52.581	vivo-v15
\.


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price (id, current_price, previous_price, ram, rom, feature_id, product_id) FROM stdin;
1	11990000	23990000	8	256	1	iphone-15
3	15000000	15000000	8	256	2	samsung-s24
4	25000000	27990000	12	512	2	samsung-s24
7	10000000	10000000	8	256	4	xiaomi-mi11t
8	12000000	12000000	12	512	4	xiaomi-mi11t
9	13000000	13000000	8	512	5	asus-x415
10	13000000	13000000	8	512	6	iphone-14
11	13000000	13000000	8	512	7	vivo-v15
12	13000000	13000000	8	512	8	realme-c33
13	13000000	13000000	8	512	9	oppo-reno11f-5g
15	13000000	13000000	8	512	11	iphone-15-promax
16	13000000	13000000	8	512	12	vivo-y100
17	13000000	13000000	8	512	13	samsung-m54
18	13000000	13000000	8	512	14	redmi-13c
19	12000000	15000000	8	256	15	xiaomi-16
20	12000000	15000000	8	256	16	xiaomi-17
21	12000000	15000000	8	64	17	iphone-5
22	12000000	15000000	8	64	18	samsung-sj
24	12000000	15000000	8	512	25	dell-laptitude
25	12000000	15000000	8	256	26	dell-baa
14	12999000	13000000	8	512	10	samsung-a55-5g
6	14990000	25990000	12	512	3	xiaomi-mi14
2	11990000	23990000	12	512	1	iphone-15
26	14990000	15000000	8	128	\N	\N
27	14990000	15000000	8	128	27	sony-x12
\.


--
-- Data for Name: producer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producer (id, name) FROM stdin;
1	Apple
2	Samsung
3	Xiaomi
4	Asus
5	Vivo
6	Realme
7	Oppo
20	Alibaba
21	Thăng Long
23	Avila
24	Canon
25	Sony
29	Nokia
33	Logitech
34	Google
35	Dell
\.


--
-- Data for Name: producer_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producer_category (producer, category) FROM stdin;
Apple	Phone
Samsung	Phone
Xiaomi	Phone
Asus	Laptop
Vivo	Phone
Realme	Phone
Oppo	Phone
Xiaomi	Fan
Xiaomi	PC
Samsung	PC
Alibaba	PC
Thăng Long	Fan
Samsung	Fan
Avila	Fan
Canon	Camera
Sony	Camera
Samsung	Camera
Nokia	Phone
Nokia	Camera
Nokia	PC
Nokia	Fan
Samsung	Mouse
Apple	Mouse
Logitech	Mouse
Apple	Tablet
Google	Tablet
Dell	Laptop
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, category_name, producer_name, available, ordering, total_quantity) FROM stdin;
xiaomi-mi14	Xiaomi Mi14 Ultra	Phone	Xiaomi	762	347	1000
iphone-15-promax	Iphone 15 Promax	Phone	Apple	45	42	\N
iphone-15	iPhone 15	Phone	Apple	100	50	\N
iphone-14	IPhone 14	Phone	Apple	0	0	\N
redmi-13c	Xiaomi Redmi 13C	Phone	Xiaomi	234	121	\N
oppo-reno11f-5g	Oppo Reno11F 5G	Phone	Oppo	1243	344	\N
samsung-s24	Samsung S24	Phone	Samsung	43	37	\N
samsung-m54	Samsung Galaxy M54 5G	Phone	Samsung	1233	234	\N
vivo-y100	Vivo Y100	Phone	Vivo	167	123	\N
asus-x415	Asus X415	Laptop	Asus	123	112	\N
xiaomi-mi11t	Xiaomi Mi11T	Phone	Xiaomi	66	14	\N
realme-c33	Realme C33	Phone	Realme	45	22	\N
xiaomi-16	Xiaomi 16	Phone	Samsung	\N	0	\N
vivo-v15	Vivo V15	Phone	Vivo	76	24	\N
sony-x12	Sony-X12	Camera	Sony	560	0	1000
dell-baa	Dell baa	Laptop	Dell	560	0	1000
dell-laptitude	Dell laptitude	Laptop	Dell	560	0	1000
samsung-a55-5g	Samsung Galaxy A55 5G	Phone	Samsung	56	34	1000
iphone-5	Iphone 5	Phone	Apple	560	0	1000
xiaomi-17	Xiaomi 17	Phone	Samsung	560	0	1000
samsung-sj	samsung sj	Phone	Xiaomi	559	0	1000
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (product_id, image_url) FROM stdin;
sony-x12	https://res.cloudinary.com/dmi3xizxq/image/upload/v1718683158/kffsgcoc0h8kkkppo7cz.png
samsung-s24	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
samsung-s24	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
samsung-s24	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
asus-x415	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
asus-x415	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
asus-x415	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
vivo-v15	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
vivo-v15	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
vivo-v15	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
realme-c33	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
realme-c33	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
realme-c33	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
iphone-15-promax	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
iphone-15-promax	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
iphone-15-promax	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
samsung-m54	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
samsung-m54	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
samsung-m54	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
xiaomi-16	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717844136/angqu30k2zjcsy2xj7km.jpg
xiaomi-16	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717844136/td6aqfqwm1ybsbfgqofl.png
xiaomi-17	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717844136/angqu30k2zjcsy2xj7km.jpg
xiaomi-17	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717844136/td6aqfqwm1ybsbfgqofl.png
iphone-5	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717846928/om3cdhv0bnaybyxpj3tv.jpg
redmi-13c	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
redmi-13c	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
redmi-13c	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
samsung-sj	https://res.cloudinary.com/dmi3xizxq/image/upload/v1717847045/i1wanuykoiogfswwefla.jpg
dell-baa	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-15-plus_1__1.png
dell-laptitude	https://cdn.hoanghamobile.com/i/preview/Uploads/2023/09/13/iphone-15-blue-pure-back-iphone-15-blue-pure-front-2up-screen-usen.png
samsung-a55-5g	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
samsung-a55-5g	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
samsung-a55-5g	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
vivo-y100	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
vivo-y100	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
vivo-y100	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
oppo-reno11f-5g	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
oppo-reno11f-5g	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
oppo-reno11f-5g	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
xiaomi-mi14	https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi-14-ultra_3.png
xiaomi-mi14	https://clickbuy.com.vn/uploads/pro/xiaomi-14-ultra-chinh-hang_197730.jpeg
xiaomi-mi14	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjS-9gJOkUx1i0k7RAhsYwRnDce0-SdNn-7g&s
xiaomi-mi11t	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
xiaomi-mi11t	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
xiaomi-mi11t	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
iphone-15	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
iphone-15	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
iphone-15	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
iphone-14	https://i.pinimg.com/564x/6f/03/08/6f0308c41401fe0633af1e2d898182a3.jpg
iphone-14	https://i.pinimg.com/736x/db/09/2a/db092a3fe925b8938b9118e5e419d857.jpg
iphone-14	https://i.pinimg.com/564x/48/36/d2/4836d2a498754ec71a1e5b2251308770.jpg
\.


--
-- Data for Name: staff_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_user (staffid, active_state, email, full_name, password, phone, role) FROM stdin;
1	t	kien@gmail.com	Luu kien	$2a$10$Hey6xoV32721Nah2umTPiuqxgI3/4p5Gn4XNq/ghuCGBzaItXCmQW	035329	ADMIN
2	t	abc@gmail.com	Kienluu	$2a$10$c0X1zOvP0dW8H6lRnj/2LuPw1/0GPJiXEnILylH4EvS4k5fLiK7EO	0233333	ADMIN
3	t	bca@gmail.com	kien	$2a$10$89RxEbC6M2ONfYjejqpDPeTFYz0vYo64LKLPoyQ7WFZwTNXXqN2nC	09876	ADMIN
4	t	bcad@gmail.com	kien	$2a$10$p2337Aj0FA4wERBI5YEL.O3/ZM9R/EFZijkUZoQK6y31tGOUrPU/e	09876	USER
6	t	cbad@gmail.com	kien	$2a$10$SV5R9Ut0H0bbW7Q.B7BiVO01jjsCSRQR/BJ9oZFzLOhxAKviRuj.m	09876	USER
7	t	cbae@gmail.com	kien	$2a$10$Y6bvYHNqdUkQBEsMOlCdoO8jo3f7IeHiXz0M2Lhwg1lpyt2Nkz3m.	09876	USER
8	t	cbaef@gmail.com	dinh kien	$2a$10$VtRnEFx6NlhY8EkeqcADFe.I5BPy3zeogGWL4UWPISTZwMtBFKOJm	0353795729	USER
\.


--
-- Name: carousel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carousel_id_seq', 19, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 15, true);


--
-- Name: color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.color_id_seq', 63, true);


--
-- Name: description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.description_id_seq', 30, true);


--
-- Name: feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feature_id_seq', 27, true);


--
-- Name: price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_id_seq', 27, true);


--
-- Name: producer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producer_id_seq', 35, true);


--
-- Name: staff_user_staffid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_user_staffid_seq', 8, true);


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
-- Name: category_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category_index ON public.product USING btree (category_name);


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

