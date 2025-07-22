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
-- Name: _sys_run_log; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public._sys_run_log (
    src_table character varying(255) NOT NULL,
    src_last_sysdate timestamp without time zone
);


ALTER TABLE public._sys_run_log OWNER TO dw_user;

--
-- Name: actor; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.actor (
    actor_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.actor OWNER TO dw_user;

--
-- Name: category; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    name character varying(25) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.category OWNER TO dw_user;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    store_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50),
    address_id smallint NOT NULL,
    activebool boolean DEFAULT true NOT NULL,
    create_date date NOT NULL,
    last_update timestamp without time zone DEFAULT now(),
    active integer
);


ALTER TABLE public.customer OWNER TO dw_user;

--
-- Name: film; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.film (
    film_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_year integer,
    language_id smallint NOT NULL,
    rental_duration smallint DEFAULT '3'::smallint NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length smallint,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    rating character varying(255),
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    special_features text[],
    fulltext tsvector NOT NULL
);


ALTER TABLE public.film OWNER TO dw_user;

--
-- Name: film_actor; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.film_actor (
    actor_id smallint NOT NULL,
    film_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.film_actor OWNER TO dw_user;

--
-- Name: film_category; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.film_category (
    film_id smallint NOT NULL,
    category_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.film_category OWNER TO dw_user;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    customer_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    rental_id integer NOT NULL,
    amount numeric(5,2) NOT NULL,
    payment_date timestamp without time zone NOT NULL
);


ALTER TABLE public.payment OWNER TO dw_user;

--
-- Name: rental; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.rental (
    rental_id integer NOT NULL,
    rental_date timestamp without time zone NOT NULL,
    inventory_id integer NOT NULL,
    customer_id smallint NOT NULL,
    return_date timestamp without time zone,
    staff_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.rental OWNER TO dw_user;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id smallint NOT NULL,
    email character varying(50),
    store_id smallint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    username character varying(16) NOT NULL,
    password character varying(40),
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    picture bytea
);


ALTER TABLE public.staff OWNER TO dw_user;

--
-- Data for Name: _sys_run_log; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public._sys_run_log (src_table, src_last_sysdate) FROM stdin;
actor	\N
category	\N
customer	\N
film	\N
staff	\N
rental	\N
payment	\N
film_actor	\N
film_category	\N
\.


--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.actor (actor_id, first_name, last_name, last_update) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.category (category_id, name, last_update) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active) FROM stdin;
\.


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.film (film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext) FROM stdin;
\.


--
-- Data for Name: film_actor; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.film_actor (actor_id, film_id, last_update) FROM stdin;
\.


--
-- Data for Name: film_category; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.film_category (film_id, category_id, last_update) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.payment (payment_id, customer_id, staff_id, rental_id, amount, payment_date) FROM stdin;
\.


--
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) FROM stdin;
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: dw_user
--

COPY public.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture) FROM stdin;
\.


--
-- Name: _sys_run_log _sys_run_log_src_table; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public._sys_run_log
    ADD CONSTRAINT _sys_run_log_src_table PRIMARY KEY (src_table);


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: film_actor film_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_pkey PRIMARY KEY (actor_id, film_id);


--
-- Name: film_category film_category_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_pkey PRIMARY KEY (film_id, category_id);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: rental rental_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_pkey PRIMARY KEY (rental_id);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


--
-- PostgreSQL database dump complete
--

