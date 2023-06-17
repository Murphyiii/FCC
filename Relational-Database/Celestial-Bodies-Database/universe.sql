--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type_id integer,
    distance_from_earth numeric(20,2),
    description text NOT NULL,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    note text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions integer,
    distance_from_earth numeric(4,2),
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    mass integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_type_id integer,
    age_in_millions integer,
    distance_from_earth numeric(4,2),
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    mass integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions integer,
    distance_from_earth numeric(4,2),
    description text NOT NULL,
    is_spherical boolean,
    mass integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'NGC4552', 1, 41000000.00, 'NGC4552或M89是位于室女座的一个椭圆星系，在1781年3月18日被梅西尔发现，是室女座星系团的成员之一，9.5等，在M84和M86东方几度的地方。', false);
INSERT INTO public.galaxy VALUES (2, 'NGC205', 1, 2300000.00, 'NGC205（也称M110）是椭圆星系，由查尔斯·梅西耶发现。NGC205是仙女座的一个近邻伴星系，也是本星系群众多矮星系成员之一', false);
INSERT INTO public.galaxy VALUES (3, 'NGC3623', 2, 22000000.00, 'NGC3623(M65)是一个位于狮子座的螺旋星系，距离地球约2200万光年。', false);
INSERT INTO public.galaxy VALUES (4, 'NGC3627', 2, 35000000.00, '漩涡星系NGC3627(M66)，类型Sb，位于狮子座，狮子座三重星系之一，有Charles Messier在1780年发现', false);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 3, 160000.00, '大麦哲伦星系（Large Magellanic Cloud，简写LMC；又称大麦哲伦云，简称大麦云），是本星系群中著名的河外星系之一，属于矮星系。它是银河系众多卫星星系中质量最大的一个，位于剑鱼座与山案座交界处，距离约160000光年，直径大约是银河系的1/20，恒星数量约是银河系的1/10（约100亿颗）。', false);
INSERT INTO public.galaxy VALUES (6, 'NGC3992', 2, 41000000.00, 'NGC3992(M109)是一个位于大熊座的棒旋星系，距离约4100万光年。NGC3992是大熊座北星系团中最大的星系，梅西尔108与之伴随。', false);
INSERT INTO public.galaxy VALUES (7, 'Milky Way Galaxy', 2, 0.00, '银河系是太阳系所在的棒旋星系，呈椭圆盘型，具有巨大的盘面结构。银河系自内向外分别由银心、银核、银盘、银晕和银冕组成。', false);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, '椭圆星系', NULL);
INSERT INTO public.galaxy_type VALUES (2, '漩涡星系', NULL);
INSERT INTO public.galaxy_type VALUES (3, '矮星系', NULL);
INSERT INTO public.galaxy_type VALUES (4, '活跃星系', NULL);
INSERT INTO public.galaxy_type VALUES (5, '不规则星系', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'moon2', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'moon3', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (4, 'moon4', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (5, 'moon5', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (6, 'moon6', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (7, 'moon7', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (8, 'moon8', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (9, 'moon9', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (10, 'moon10', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (11, 'moon11', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (12, 'moon12', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (13, 'moon13', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (14, 'moon14', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (15, 'moon15', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (16, 'moon16', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (17, 'moon17', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (18, 'moon18', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (19, 'moon19', NULL, NULL, 'description', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (20, 'moon20', NULL, NULL, 'description', NULL, NULL, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', NULL, NULL, NULL, 'descriptin2', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'planet2', NULL, NULL, NULL, 'description2', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'planet3', NULL, NULL, NULL, 'description3', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'planet4', NULL, NULL, NULL, 'descriptin4', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'planet5', NULL, NULL, NULL, 'description5', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'planet6', NULL, NULL, NULL, 'description6', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'planet7', NULL, NULL, NULL, 'description7', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'planet8', NULL, NULL, NULL, 'description8', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'planet9', NULL, NULL, NULL, 'description9', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'planet10', NULL, NULL, NULL, 'description10', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, 'planet11', NULL, NULL, NULL, 'description11', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'planet12', NULL, NULL, NULL, 'description12', NULL, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (34, 'star1', NULL, NULL, 'description', NULL, NULL, 1);
INSERT INTO public.star VALUES (35, 'star2', NULL, NULL, 'description', NULL, NULL, 2);
INSERT INTO public.star VALUES (36, 'star3', NULL, NULL, 'description', NULL, NULL, 3);
INSERT INTO public.star VALUES (37, 'star4', NULL, NULL, 'description', NULL, NULL, 1);
INSERT INTO public.star VALUES (38, 'star5', NULL, NULL, 'description', NULL, NULL, 2);
INSERT INTO public.star VALUES (1, 'Sun', 4570, 0.00, 'description', true, 1, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 38, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_plant_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
