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
-- Name: COLUMN dim_actor.source_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_actor.source_id IS 'scd type 1';


--
-- Name: COLUMN dim_actor.first_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_actor.first_name IS 'scd type 1';


--
-- Name: COLUMN dim_actor.last_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_actor.last_name IS 'scd type 1';


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
-- Name: dim_category; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.dim_category (
    id bigint NOT NULL,
    source_id integer NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.dim_category OWNER TO dw_user;

--
-- Name: COLUMN dim_category.source_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_category.source_id IS 'scd type 1';


--
-- Name: COLUMN dim_category.name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_category.name IS 'scd type 1';


--
-- Name: dim_category_id_seq; Type: SEQUENCE; Schema: public; Owner: dw_user
--

CREATE SEQUENCE public.dim_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_category_id_seq OWNER TO dw_user;

--
-- Name: dim_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dw_user
--

ALTER SEQUENCE public.dim_category_id_seq OWNED BY public.dim_category.id;


--
-- Name: dim_customer; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.dim_customer (
    id bigint NOT NULL,
    source_id integer,
    first_name character varying(45),
    last_name character varying(45),
    email character varying(50),
    active boolean,
    active_label character varying(10),
    address_id integer,
    address text,
    district character varying(20),
    city_id integer,
    city_name character varying(50),
    country_id integer,
    country_name character varying(50),
    postal_code character varying(10),
    phone character varying(20),
    store_id integer,
    store_address_id integer,
    store_address text,
    store_district character varying(20),
    store_postal_code character varying(10),
    store_phone character varying(20),
    store_city_id integer,
    store_city_name character varying(50),
    store_country_id integer,
    store_country_name character varying(50),
    date_active date,
    date_expired date,
    version integer
);


ALTER TABLE public.dim_customer OWNER TO dw_user;

--
-- Name: COLUMN dim_customer.first_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.first_name IS 'scd type 2';


--
-- Name: COLUMN dim_customer.last_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.last_name IS 'scd type 2';


--
-- Name: COLUMN dim_customer.email; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.email IS 'scd type 1';


--
-- Name: COLUMN dim_customer.active; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.active IS 'scd type 2';


--
-- Name: COLUMN dim_customer.active_label; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.active_label IS 'scd type 2';


--
-- Name: COLUMN dim_customer.address_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.address_id IS 'scd type 2';


--
-- Name: COLUMN dim_customer.address; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.address IS 'scd type 2';


--
-- Name: COLUMN dim_customer.district; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.district IS 'scd type 2';


--
-- Name: COLUMN dim_customer.city_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.city_id IS 'scd type 2';


--
-- Name: COLUMN dim_customer.city_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.city_name IS 'scd type 2';


--
-- Name: COLUMN dim_customer.country_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.country_id IS 'scd type 2';


--
-- Name: COLUMN dim_customer.country_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.country_name IS 'scd type 2';


--
-- Name: COLUMN dim_customer.postal_code; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.postal_code IS 'scd type 2';


--
-- Name: COLUMN dim_customer.phone; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.phone IS 'scd type 1';


--
-- Name: COLUMN dim_customer.store_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.store_id IS 'scd type 2';


--
-- Name: COLUMN dim_customer.store_address_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.store_address_id IS 'scd type 2';


--
-- Name: COLUMN dim_customer.store_address; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.store_address IS 'scd type 2';


--
-- Name: COLUMN dim_customer.store_district; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.store_district IS 'scd type 2';


--
-- Name: COLUMN dim_customer.store_postal_code; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.store_postal_code IS 'scd type 2';


--
-- Name: COLUMN dim_customer.store_phone; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.store_phone IS 'scd type 2';


--
-- Name: COLUMN dim_customer.store_city_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.store_city_id IS 'scd type 2';


--
-- Name: COLUMN dim_customer.store_city_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.store_city_name IS 'scd type 2';


--
-- Name: COLUMN dim_customer.store_country_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.store_country_id IS 'scd type 2';


--
-- Name: COLUMN dim_customer.store_country_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_customer.store_country_name IS 'scd type 2';


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
    source_id integer,
    title character varying(255),
    description text,
    release_year integer,
    language_id integer,
    language_name character varying(20),
    date_active date,
    date_expired date,
    version integer
);


ALTER TABLE public.dim_film OWNER TO dw_user;

--
-- Name: COLUMN dim_film.title; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_film.title IS 'scd type 2';


--
-- Name: COLUMN dim_film.description; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_film.description IS 'scd type 2';


--
-- Name: COLUMN dim_film.release_year; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_film.release_year IS 'scd type 2';


--
-- Name: COLUMN dim_film.language_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_film.language_id IS 'scd type 2';


--
-- Name: COLUMN dim_film.language_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_film.language_name IS 'scd type 2';


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
    source_id integer,
    first_name character varying(45),
    last_name character varying(45),
    address_id integer,
    address_detail text,
    district character varying(20),
    postal_code character varying(10),
    phone character varying(20),
    city_id integer,
    city_name character varying(50),
    country_id integer,
    country_name character varying(50),
    email character varying(50),
    active_id boolean,
    active_label character varying(10),
    store_id integer,
    store_manager_id integer,
    store_manager_first_name character varying(45),
    store_manager_last_name character varying(45),
    store_address_id integer,
    store_address_detail text,
    store_district character varying(20),
    store_postal_code character varying(10),
    store_phone character varying(20),
    store_city_id integer,
    store_city_name character varying(50),
    store_country_id integer,
    store_country_name character varying(50),
    date_active date,
    date_expired date,
    version integer
);


ALTER TABLE public.dim_staff OWNER TO dw_user;

--
-- Name: COLUMN dim_staff.first_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.first_name IS 'scd type 2';


--
-- Name: COLUMN dim_staff.last_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.last_name IS 'scd type 2';


--
-- Name: COLUMN dim_staff.address_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.address_id IS 'scd type 2';


--
-- Name: COLUMN dim_staff.address_detail; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.address_detail IS 'scd type 2';


--
-- Name: COLUMN dim_staff.district; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.district IS 'scd type 2';


--
-- Name: COLUMN dim_staff.postal_code; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.postal_code IS 'scd type 2';


--
-- Name: COLUMN dim_staff.phone; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.phone IS 'scd type 1';


--
-- Name: COLUMN dim_staff.city_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.city_id IS 'scd type 2';


--
-- Name: COLUMN dim_staff.city_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.city_name IS 'scd type 2';


--
-- Name: COLUMN dim_staff.country_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.country_id IS 'scd type 2';


--
-- Name: COLUMN dim_staff.country_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.country_name IS 'scd type 2';


--
-- Name: COLUMN dim_staff.email; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.email IS 'scd type 1';


--
-- Name: COLUMN dim_staff.active_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.active_id IS 'scd type 2';


--
-- Name: COLUMN dim_staff.active_label; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.active_label IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_id IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_manager_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_manager_id IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_manager_first_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_manager_first_name IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_manager_last_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_manager_last_name IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_address_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_address_id IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_address_detail; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_address_detail IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_district; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_district IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_postal_code; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_postal_code IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_phone; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_phone IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_city_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_city_id IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_city_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_city_name IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_country_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_country_id IS 'scd type 2';


--
-- Name: COLUMN dim_staff.store_country_name; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_staff.store_country_name IS 'scd type 2';


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
    id character(8) NOT NULL,
    day integer NOT NULL,
    month integer NOT NULL,
    year integer NOT NULL,
    week integer NOT NULL,
    weekend_status character varying(10) NOT NULL,
    quarter integer NOT NULL
);


ALTER TABLE public.dim_waktu OWNER TO dw_user;

--
-- Name: COLUMN dim_waktu.week; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.dim_waktu.week IS 'week of month';


--
-- Name: fact_film_actor; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.fact_film_actor (
    dim_actor_id bigint NOT NULL,
    dim_film_id bigint NOT NULL,
    dim_category_id bigint NOT NULL,
    count integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.fact_film_actor OWNER TO dw_user;

--
-- Name: COLUMN fact_film_actor.count; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.fact_film_actor.count IS 'semi additif';


--
-- Name: fact_rental; Type: TABLE; Schema: public; Owner: dw_user
--

CREATE TABLE public.fact_rental (
    dim_customer_id bigint NOT NULL,
    dim_film_id bigint NOT NULL,
    dim_waktu_id character(8) NOT NULL,
    dim_staff_id bigint NOT NULL,
    amount numeric(5,2),
    rental_days integer,
    CONSTRAINT cek_amount CHECK (((amount IS NULL) OR (amount >= (0)::numeric))),
    CONSTRAINT cek_rental_days CHECK (((rental_days IS NULL) OR (rental_days > 0)))
);


ALTER TABLE public.fact_rental OWNER TO dw_user;

--
-- Name: COLUMN fact_rental.dim_waktu_id; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.fact_rental.dim_waktu_id IS 'waktu payment';


--
-- Name: COLUMN fact_rental.amount; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.fact_rental.amount IS 'additif';


--
-- Name: COLUMN fact_rental.rental_days; Type: COMMENT; Schema: public; Owner: dw_user
--

COMMENT ON COLUMN public.fact_rental.rental_days IS 'additif';


--
-- Name: dim_actor id; Type: DEFAULT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_actor ALTER COLUMN id SET DEFAULT nextval('public.dim_actor_id_seq'::regclass);


--
-- Name: dim_category id; Type: DEFAULT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_category ALTER COLUMN id SET DEFAULT nextval('public.dim_category_id_seq'::regclass);


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
-- Name: dim_actor dim_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_actor
    ADD CONSTRAINT dim_actor_pkey PRIMARY KEY (id);


--
-- Name: dim_category dim_category_pkey; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_category
    ADD CONSTRAINT dim_category_pkey PRIMARY KEY (id);


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
-- Name: dim_waktu dim_waktu_id; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.dim_waktu
    ADD CONSTRAINT dim_waktu_id PRIMARY KEY (id);


--
-- Name: fact_film_actor fact_film_actor_dim_actor_id_dim_film_id_dim_category_id; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.fact_film_actor
    ADD CONSTRAINT fact_film_actor_dim_actor_id_dim_film_id_dim_category_id PRIMARY KEY (dim_actor_id, dim_film_id, dim_category_id);


--
-- Name: fact_rental fact_rental_dim_customer_id_dim_film_id_dim_waktu_id_dim_staff_; Type: CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.fact_rental
    ADD CONSTRAINT fact_rental_dim_customer_id_dim_film_id_dim_waktu_id_dim_staff_ PRIMARY KEY (dim_customer_id, dim_film_id, dim_waktu_id, dim_staff_id);


--
-- Name: dim_actor_source_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_actor_source_id ON public.dim_actor USING btree (source_id);


--
-- Name: dim_category_source_id; Type: INDEX; Schema: public; Owner: dw_user
--

CREATE INDEX dim_category_source_id ON public.dim_category USING btree (source_id);


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
-- Name: fact_film_actor fact_film_actor_dim_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.fact_film_actor
    ADD CONSTRAINT fact_film_actor_dim_actor_id_fkey FOREIGN KEY (dim_actor_id) REFERENCES public.dim_actor(id);


--
-- Name: fact_film_actor fact_film_actor_dim_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.fact_film_actor
    ADD CONSTRAINT fact_film_actor_dim_category_id_fkey FOREIGN KEY (dim_category_id) REFERENCES public.dim_category(id);


--
-- Name: fact_film_actor fact_film_actor_dim_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.fact_film_actor
    ADD CONSTRAINT fact_film_actor_dim_film_id_fkey FOREIGN KEY (dim_film_id) REFERENCES public.dim_film(id);


--
-- Name: fact_rental fact_rental_dim_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.fact_rental
    ADD CONSTRAINT fact_rental_dim_customer_id_fkey FOREIGN KEY (dim_customer_id) REFERENCES public.dim_customer(id);


--
-- Name: fact_rental fact_rental_dim_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.fact_rental
    ADD CONSTRAINT fact_rental_dim_film_id_fkey FOREIGN KEY (dim_film_id) REFERENCES public.dim_film(id);


--
-- Name: fact_rental fact_rental_dim_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.fact_rental
    ADD CONSTRAINT fact_rental_dim_staff_id_fkey FOREIGN KEY (dim_staff_id) REFERENCES public.dim_staff(id);


--
-- Name: fact_rental fact_rental_dim_waktu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dw_user
--

ALTER TABLE ONLY public.fact_rental
    ADD CONSTRAINT fact_rental_dim_waktu_id_fkey FOREIGN KEY (dim_waktu_id) REFERENCES public.dim_waktu(id);


--
-- PostgreSQL database dump complete
--

