--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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
-- Name: dim_actor; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.dim_actor (
    id bigint NOT NULL,
    source_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL
);


ALTER TABLE public.dim_actor OWNER TO dw_user;

--
-- Name: dim_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: dw_user
--

CREATE SEQUENCE public.dim_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_actor_id_seq OWNER TO dw_user;

--
-- Name: dim_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dw_user
--

ALTER SEQUENCE public.dim_actor_id_seq OWNED BY public.dim_actor.id;


--
-- Name: dim_customer; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.dim_customer (
    id bigint NOT NULL,
    source_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50) NOT NULL,
    active boolean NOT NULL,
    active_label character varying(10) NOT NULL,
    address_id integer NOT NULL,
    address text NOT NULL,
    district character varying(20) NOT NULL,
    city_id integer NOT NULL,
    city_name character varying(50) NOT NULL,
    country_id integer NOT NULL,
    country_name character varying(50) NOT NULL,
    postal_code character varying(10) NOT NULL,
    phone character varying(20) NOT NULL,
    store_id integer NOT NULL,
    store_address_id integer NOT NULL,
    store_address text NOT NULL,
    store_district character varying(20) NOT NULL,
    store_postal_code character varying(10) NOT NULL,
    store_phone character varying(20) NOT NULL,
    store_city_id integer NOT NULL,
    store_city_name character varying(50) NOT NULL,
    store_country_id integer NOT NULL,
    store_country_name character varying(50) NOT NULL,
    date_active date NOT NULL,
    date_expired date NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.dim_customer OWNER TO dw_user;

--
-- Name: dim_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: dw_user
--

CREATE SEQUENCE public.dim_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_customer_id_seq OWNER TO dw_user;

--
-- Name: dim_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dw_user
--

ALTER SEQUENCE public.dim_customer_id_seq OWNED BY public.dim_customer.id;


--
-- Name: dim_film; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.dim_film (
    id bigint NOT NULL,
    source_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    release_year integer NOT NULL,
    language_id integer NOT NULL,
    language_name character varying(20) NOT NULL,
    date_active date NOT NULL,
    date_expired date NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.dim_film OWNER TO dw_user;

--
-- Name: dim_film_id_seq; Type: SEQUENCE; Schema: public; Owner: dw_user
--

CREATE SEQUENCE public.dim_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_film_id_seq OWNER TO dw_user;

--
-- Name: dim_film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dw_user
--

ALTER SEQUENCE public.dim_film_id_seq OWNED BY public.dim_film.id;


--
-- Name: dim_staff; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.dim_staff (
    id bigint NOT NULL,
    source_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id integer NOT NULL,
    address_detail text NOT NULL,
    district character varying(20) NOT NULL,
    postal_code character varying(10) NOT NULL,
    phone character varying(20) NOT NULL,
    city_id integer NOT NULL,
    city_name character varying(50) NOT NULL,
    country_id integer NOT NULL,
    country_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    active_id boolean NOT NULL,
    active_label character varying(10) NOT NULL,
    store_id integer NOT NULL,
    store_manager_id integer NOT NULL,
    store_manager_first_name character varying(45) NOT NULL,
    store_manager_last_name character varying(45) NOT NULL,
    store_address_id integer NOT NULL,
    store_address_detail text NOT NULL,
    store_district character varying(20) NOT NULL,
    store_postal_code character varying(10) NOT NULL,
    store_phone character varying(20) NOT NULL,
    store_city_id integer NOT NULL,
    store_city_name character varying(50) NOT NULL,
    store_country_id integer NOT NULL,
    store_country_name character varying(50) NOT NULL,
    date_active date NOT NULL,
    date_expired date NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.dim_staff OWNER TO dw_user;

--
-- Name: dim_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: dw_user
--

CREATE SEQUENCE public.dim_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_staff_id_seq OWNER TO dw_user;

--
-- Name: dim_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dw_user
--

ALTER SEQUENCE public.dim_staff_id_seq OWNED BY public.dim_staff.id;


--
-- Name: dim_waktu; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.dim_waktu (
    id character varying(8) NOT NULL,
    day integer NOT NULL,
    month integer NOT NULL,
    year integer NOT NULL,
    week integer NOT NULL,
    holiday_status character varying(10) NOT NULL,
    weekend_status character varying(10) NOT NULL,
    quarter integer NOT NULL
);


ALTER TABLE public.dim_waktu OWNER TO dw_user;

--
-- Name: dim_actor id; Type: DEFAULT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_actor ALTER COLUMN id SET DEFAULT nextval('public.dim_actor_id_seq'::regclass);


--
-- Name: dim_customer id; Type: DEFAULT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_customer ALTER COLUMN id SET DEFAULT nextval('public.dim_customer_id_seq'::regclass);


--
-- Name: dim_film id; Type: DEFAULT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_film ALTER COLUMN id SET DEFAULT nextval('public.dim_film_id_seq'::regclass);


--
-- Name: dim_staff id; Type: DEFAULT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_staff ALTER COLUMN id SET DEFAULT nextval('public.dim_staff_id_seq'::regclass);


--
-- Data for Name: dim_actor; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.dim_actor (id, source_id, first_name, last_name) FROM stdin;
\.


--
-- Data for Name: dim_customer; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.dim_customer (id, source_id, first_name, last_name, email, active, active_label, address_id, address, district, city_id, city_name, country_id, country_name, postal_code, phone, store_id, store_address_id, store_address, store_district, store_postal_code, store_phone, store_city_id, store_city_name, store_country_id, store_country_name, date_active, date_expired, version) FROM stdin;
\.


--
-- Data for Name: dim_film; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.dim_film (id, source_id, title, description, release_year, language_id, language_name, date_active, date_expired, version) FROM stdin;
\.


--
-- Data for Name: dim_staff; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.dim_staff (id, source_id, first_name, last_name, address_id, address_detail, district, postal_code, phone, city_id, city_name, country_id, country_name, email, active_id, active_label, store_id, store_manager_id, store_manager_first_name, store_manager_last_name, store_address_id, store_address_detail, store_district, store_postal_code, store_phone, store_city_id, store_city_name, store_country_id, store_country_name, date_active, date_expired, version) FROM stdin;
\.


--
-- Data for Name: dim_waktu; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.dim_waktu (id, day, month, year, week, holiday_status, weekend_status, quarter) FROM stdin;
\.


--
-- Name: dim_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dw_user
--

SELECT pg_catalog.setval('public.dim_actor_id_seq', 1, false);


--
-- Name: dim_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dw_user
--

SELECT pg_catalog.setval('public.dim_customer_id_seq', 1, false);


--
-- Name: dim_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dw_user
--

SELECT pg_catalog.setval('public.dim_film_id_seq', 1, false);


--
-- Name: dim_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dw_user
--

SELECT pg_catalog.setval('public.dim_staff_id_seq', 1, false);


--
-- Name: dim_actor dim_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_actor
    ADD CONSTRAINT dim_actor_pkey PRIMARY KEY (id);


--
-- Name: dim_customer dim_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_customer
    ADD CONSTRAINT dim_customer_pkey PRIMARY KEY (id);


--
-- Name: dim_film dim_film_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_film
    ADD CONSTRAINT dim_film_pkey PRIMARY KEY (id);


--
-- Name: dim_staff dim_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_staff
    ADD CONSTRAINT dim_staff_pkey PRIMARY KEY (id);


--
-- Name: dim_actor_source_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_actor_source_id ON public.dim_actor USING btree (source_id);


--
-- Name: dim_customer_address_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_customer_address_id ON public.dim_customer USING btree (address_id);


--
-- Name: dim_customer_city_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_customer_city_id ON public.dim_customer USING btree (city_id);


--
-- Name: dim_customer_country_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_customer_country_id ON public.dim_customer USING btree (country_id);


--
-- Name: dim_customer_source_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_customer_source_id ON public.dim_customer USING btree (source_id);


--
-- Name: dim_customer_store_address_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_customer_store_address_id ON public.dim_customer USING btree (store_address_id);


--
-- Name: dim_customer_store_city_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_customer_store_city_id ON public.dim_customer USING btree (store_city_id);


--
-- Name: dim_customer_store_country_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_customer_store_country_id ON public.dim_customer USING btree (store_country_id);


--
-- Name: dim_customer_store_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_customer_store_id ON public.dim_customer USING btree (store_id);


--
-- Name: dim_film_source_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_film_source_id ON public.dim_film USING btree (source_id);


--
-- Name: dim_staff_address_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_staff_address_id ON public.dim_staff USING btree (address_id);


--
-- Name: dim_staff_city_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_staff_city_id ON public.dim_staff USING btree (city_id);


--
-- Name: dim_staff_country_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_staff_country_id ON public.dim_staff USING btree (country_id);


--
-- Name: dim_staff_source_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_staff_source_id ON public.dim_staff USING btree (source_id);


--
-- Name: dim_staff_store_address_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_staff_store_address_id ON public.dim_staff USING btree (store_address_id);


--
-- Name: dim_staff_store_city_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_staff_store_city_id ON public.dim_staff USING btree (store_city_id);


--
-- Name: dim_staff_store_country_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_staff_store_country_id ON public.dim_staff USING btree (store_country_id);


--
-- Name: dim_staff_store_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_staff_store_id ON public.dim_staff USING btree (store_id);


--
-- Name: dim_staff_store_manager_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_staff_store_manager_id ON public.dim_staff USING btree (store_manager_id);


--
-- PostgreSQL database dump complete
--

