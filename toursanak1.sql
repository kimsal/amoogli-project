--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO blog;

--
-- Name: booking; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE booking (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    phone character varying(255),
    amount integer,
    post_id integer,
    detail text,
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.booking OWNER TO blog;

--
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_id_seq OWNER TO blog;

--
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE booking_id_seq OWNED BY booking.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE category (
    id integer NOT NULL,
    name character varying(100),
    slug character varying(100),
    is_menu integer
);


ALTER TABLE public.category OWNER TO blog;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO blog;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE contact (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    email character varying(255),
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.contact OWNER TO blog;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO blog;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- Name: email; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE email (
    id integer NOT NULL,
    email character varying(255),
    name character varying(255),
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.email OWNER TO blog;

--
-- Name: email_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_id_seq OWNER TO blog;

--
-- Name: email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE email_id_seq OWNED BY email.id;


--
-- Name: email_list; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE email_list (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255)
);


ALTER TABLE public.email_list OWNER TO blog;

--
-- Name: email_list_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE email_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_list_id_seq OWNER TO blog;

--
-- Name: email_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE email_list_id_seq OWNED BY email_list.id;


--
-- Name: emailgroup; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE emailgroup (
    id integer NOT NULL,
    email_id integer,
    group_id integer,
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.emailgroup OWNER TO blog;

--
-- Name: emailgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE emailgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emailgroup_id_seq OWNER TO blog;

--
-- Name: emailgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE emailgroup_id_seq OWNED BY emailgroup.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE event (
    id integer NOT NULL,
    title character varying(500),
    slug character varying(500),
    description text,
    date timestamp without time zone,
    feature_image text,
    views integer,
    user_id integer,
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.event OWNER TO blog;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO blog;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE event_id_seq OWNED BY event.id;


--
-- Name: group; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE "group" (
    id integer NOT NULL,
    name character varying(255),
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public."group" OWNER TO blog;

--
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_id_seq OWNER TO blog;

--
-- Name: group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE group_id_seq OWNED BY "group".id;


--
-- Name: location; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE location (
    id integer NOT NULL,
    title character varying(255),
    address character varying(300),
    hour character varying(300),
    contact character varying(300),
    feature_image1 text,
    feature_image2 text,
    slug character varying(255),
    user_id integer,
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.location OWNER TO blog;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO blog;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE location_id_seq OWNED BY location.id;


--
-- Name: member; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE member (
    id integer NOT NULL,
    name character varying(50),
    slug character varying(50),
    feature_image text,
    possition character varying(300),
    detail character varying(1000),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.member OWNER TO blog;

--
-- Name: member_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_id_seq OWNER TO blog;

--
-- Name: member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE member_id_seq OWNED BY member.id;


--
-- Name: page; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE page (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255),
    description text,
    published_at timestamp without time zone DEFAULT now(),
    is_menu integer
);


ALTER TABLE public.page OWNER TO blog;

--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_id_seq OWNER TO blog;

--
-- Name: page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE page_id_seq OWNED BY page.id;


--
-- Name: partner; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE partner (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    url character varying(255),
    feature_image text,
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.partner OWNER TO blog;

--
-- Name: partner_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE partner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partner_id_seq OWNER TO blog;

--
-- Name: partner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE partner_id_seq OWNED BY partner.id;


--
-- Name: post; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE post (
    id integer NOT NULL,
    title character varying(255),
    description text,
    short_description text,
    feature_image text,
    slug character varying(255),
    category_id integer,
    price integer,
    map text,
    images text,
    user_id integer,
    published_at timestamp without time zone DEFAULT now(),
    views integer
);


ALTER TABLE public.post OWNER TO blog;

--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO blog;

--
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE post_id_seq OWNED BY post.id;


--
-- Name: user_member; Type: TABLE; Schema: public; Owner: blog; Tablespace: 
--

CREATE TABLE user_member (
    id integer NOT NULL,
    name character varying(50),
    email character varying(100),
    password character varying(600),
    password2 character varying(200),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.user_member OWNER TO blog;

--
-- Name: user_member_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE user_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_member_id_seq OWNER TO blog;

--
-- Name: user_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE user_member_id_seq OWNED BY user_member.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY booking ALTER COLUMN id SET DEFAULT nextval('booking_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY email ALTER COLUMN id SET DEFAULT nextval('email_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY email_list ALTER COLUMN id SET DEFAULT nextval('email_list_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY emailgroup ALTER COLUMN id SET DEFAULT nextval('emailgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY event ALTER COLUMN id SET DEFAULT nextval('event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY "group" ALTER COLUMN id SET DEFAULT nextval('group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY location ALTER COLUMN id SET DEFAULT nextval('location_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY member ALTER COLUMN id SET DEFAULT nextval('member_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY page ALTER COLUMN id SET DEFAULT nextval('page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY partner ALTER COLUMN id SET DEFAULT nextval('partner_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post ALTER COLUMN id SET DEFAULT nextval('post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY user_member ALTER COLUMN id SET DEFAULT nextval('user_member_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY alembic_version (version_num) FROM stdin;
043abdd8d95e
\.


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY booking (id, name, email, phone, amount, post_id, detail, published_at) FROM stdin;
\.


--
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('booking_id_seq', 1, false);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY category (id, name, slug, is_menu) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('category_id_seq', 1, false);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY contact (id, firstname, lastname, email, published_at) FROM stdin;
\.


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('contact_id_seq', 1, false);


--
-- Data for Name: email; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY email (id, email, name, published_at) FROM stdin;
\.


--
-- Name: email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('email_id_seq', 1, false);


--
-- Data for Name: email_list; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY email_list (id, name, email) FROM stdin;
\.


--
-- Name: email_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('email_list_id_seq', 1, false);


--
-- Data for Name: emailgroup; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY emailgroup (id, email_id, group_id, published_at) FROM stdin;
\.


--
-- Name: emailgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('emailgroup_id_seq', 1, false);


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY event (id, title, slug, description, date, feature_image, views, user_id, published_at) FROM stdin;
\.


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('event_id_seq', 1, false);


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY "group" (id, name, published_at) FROM stdin;
\.


--
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('group_id_seq', 1, false);


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY location (id, title, address, hour, contact, feature_image1, feature_image2, slug, user_id, published_at) FROM stdin;
\.


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('location_id_seq', 1, false);


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY member (id, name, slug, feature_image, possition, detail, created_at) FROM stdin;
\.


--
-- Name: member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('member_id_seq', 1, false);


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY page (id, title, slug, description, published_at, is_menu) FROM stdin;
\.


--
-- Name: page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('page_id_seq', 1, false);


--
-- Data for Name: partner; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY partner (id, name, slug, url, feature_image, published_at) FROM stdin;
\.


--
-- Name: partner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('partner_id_seq', 1, false);


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY post (id, title, description, short_description, feature_image, slug, category_id, price, map, images, user_id, published_at, views) FROM stdin;
\.


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('post_id_seq', 1, false);


--
-- Data for Name: user_member; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY user_member (id, name, email, password, password2, created_at) FROM stdin;
\.


--
-- Name: user_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('user_member_id_seq', 1, false);


--
-- Name: booking_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- Name: category_name_key; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: contact_email_key; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_email_key UNIQUE (email);


--
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: email_email_key; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_email_key UNIQUE (email);


--
-- Name: email_list_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY email_list
    ADD CONSTRAINT email_list_pkey PRIMARY KEY (id);


--
-- Name: email_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_pkey PRIMARY KEY (id);


--
-- Name: emailgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY emailgroup
    ADD CONSTRAINT emailgroup_pkey PRIMARY KEY (id);


--
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: event_slug_key; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_slug_key UNIQUE (slug);


--
-- Name: group_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- Name: location_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: location_slug_key; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_slug_key UNIQUE (slug);


--
-- Name: location_title_key; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_title_key UNIQUE (title);


--
-- Name: member_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- Name: page_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);


--
-- Name: page_title_key; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_title_key UNIQUE (title);


--
-- Name: partner_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY partner
    ADD CONSTRAINT partner_pkey PRIMARY KEY (id);


--
-- Name: post_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: post_slug_key; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_slug_key UNIQUE (slug);


--
-- Name: post_title_key; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_title_key UNIQUE (title);


--
-- Name: user_member_email_key; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY user_member
    ADD CONSTRAINT user_member_email_key UNIQUE (email);


--
-- Name: user_member_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY user_member
    ADD CONSTRAINT user_member_pkey PRIMARY KEY (id);


--
-- Name: booking_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY booking
    ADD CONSTRAINT booking_post_id_fkey FOREIGN KEY (post_id) REFERENCES post(id);


--
-- Name: emailgroup_email_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY emailgroup
    ADD CONSTRAINT emailgroup_email_id_fkey FOREIGN KEY (email_id) REFERENCES email(id);


--
-- Name: emailgroup_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY emailgroup
    ADD CONSTRAINT emailgroup_group_id_fkey FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: event_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_member(id);


--
-- Name: location_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_member(id);


--
-- Name: post_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_category_id_fkey FOREIGN KEY (category_id) REFERENCES category(id);


--
-- Name: post_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_member(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

