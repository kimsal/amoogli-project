--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY emailgroup ALTER COLUMN id SET DEFAULT nextval('emailgroup_id_seq'::regclass);


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
-- Name: emailgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: blog; Tablespace: 
--

ALTER TABLE ONLY emailgroup
    ADD CONSTRAINT emailgroup_pkey PRIMARY KEY (id);


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
-- PostgreSQL database dump complete
--

