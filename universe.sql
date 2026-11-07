--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_spherical boolean,
    is_supermassive boolean,
    solar_mass numeric(10,2),
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_types character varying(150)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    planet_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years integer,
    planet_types character varying(100),
    star_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    galaxy_id integer NOT NULL
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 'Situé au centre de la Voie Lactée', true, true, 4154000.00, 1);
INSERT INTO public.black_hole VALUES (2, 'M87*', 'Premier trou noir photographié', true, true, 6500000.00, 1);
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 'Un trou noir stellaire', true, false, 21.20, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Voie Lactée', 'Notre galaxie de résidence', false, 13600, 'Spirale');
INSERT INTO public.galaxy VALUES (2, 'Andromède', 'La galaxie majeure la plus proche de la notre', false, 10000, 'Spirale');
INSERT INTO public.galaxy VALUES (3, 'Triangle', NULL, false, 12000, 'Spirale');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Une galaxie elliptique géante très massive', true, 13000, 'Elliptique');
INSERT INTO public.galaxy VALUES (5, 'Grand nuage de Magellan', NULL, false, 13000, 'Irrégulière');
INSERT INTO public.galaxy VALUES (6, 'Petit nuage de Magellan', 'Une galaxie naine satellite de la voie Lactée', false, 11000, 'Irrégulière');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lune', 'Le satellite naturel de la Terre', true, false, 4510, 0.38, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'La plus grande des deux lunes martiennes', false, false, 4500, 225000.00, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Petite lune externe de Mars au relief doux', false, false, 4500, 225000.00, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Monde soumis à un volcanisme extrême et permanent', true, false, 4600, 62800.00, 5);
INSERT INTO public.moon VALUES (5, 'Europe', 'Possède un océan d''eau liquide sous sa glace', true, false, 4600, 62800.00, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'La plus grande lune du système solaire', true, false, 4600, 62800.00, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Corps céleste criblé de cratères très anciens', true, false, 4600, 62800.00, 5);
INSERT INTO public.moon VALUES (8, 'Amalthee', 'Lune irrégulière de couleur rouge intense', false, false, 4600, 62800.00, 5);
INSERT INTO public.moon VALUES (9, 'Mimas', 'Célèbre pour son cratère géant ressemblant à l''Étoile de la Mort', true, false, 4500, 120000.00, 6);
INSERT INTO public.moon VALUES (10, 'Encelade', 'Projette des geysers d''eau glacée dans l''espace', true, false, 4500, 120000.00, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Composée presque entièrement de glace d''eau', true, false, 4500, 120000.00, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Lune dense présentant des falaises de glace', true, false, 4500, 120000.00, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Deuxième plus grande lune de Saturne', true, false, 4500, 120000.00, 6);
INSERT INTO public.moon VALUES (14, 'Titan', 'Possède une atmosphère épaisse et des lacs de méthane', true, false, 4500, 120000.00, 6);
INSERT INTO public.moon VALUES (15, 'Iapet', 'Lune bicolore dotée d''une crête équatoriale unique', true, false, 4500, 120000.00, 6);
INSERT INTO public.moon VALUES (16, 'Sirius-Moon A', 'Lune rocheuse massive irradiée par Sirius', false, false, 240, 8.60, 7);
INSERT INTO public.moon VALUES (17, 'Vega-Prime L1', 'Satellite piégé dans la magnétosphère de Vega b', false, false, 450, 25.04, 8);
INSERT INTO public.moon VALUES (18, 'Andro-Sat 1', 'Exolune glacée aux confins d''Andromède', true, false, 3000, 2500000.00, 9);
INSERT INTO public.moon VALUES (19, 'M33-Luna 1', 'Fragment rocheux capturé en orbite', false, false, 5, 2700000.00, 10);
INSERT INTO public.moon VALUES (20, 'Magellan-L1', 'Lune géante orbitant autour de WOH-Plan-A', true, false, 20, 163000.00, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercure', 'La planète la plus proche du Soleil', true, false, 4500, 'Tellurique', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Planète rocheuse avec une atmosphère toxique et brûlante', true, false, 4500, 'Tellurique', 1);
INSERT INTO public.planet VALUES (3, 'Terre', 'Notre planète bleue, abritant la vie', true, true, 4540, 'Tellurique', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'La planète rouge, cible des explorations spatiales', true, false, 4500, 'Tellurique', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'La plus grande géante gazeuse du système solaire', true, false, 4600, 'Géante gazeuse', 1);
INSERT INTO public.planet VALUES (6, 'Saturne', 'Célèbre pour son système d''anneaux spectaculaires', true, false, 4500, 'Géante gazeuse', 1);
INSERT INTO public.planet VALUES (7, 'Sirius b-Prime', 'Planète hypothétique soumise à un fort rayonnement', true, false, 240, 'Super-Terre', 2);
INSERT INTO public.planet VALUES (8, 'Vega b', 'Planète candidate géante et extrêmement chaude', true, false, 455, 'Jupiter chaud', 3);
INSERT INTO public.planet VALUES (9, 'Andro-Worlds 1', 'Planète extragalactique dans une zone dense', true, false, 3000, 'Géante de glace', 4);
INSERT INTO public.planet VALUES (10, 'M33-Exo 1', 'Monde rocheux massif orbitant près d''un système binaire', true, false, 5, 'Super-Terre', 5);
INSERT INTO public.planet VALUES (11, 'WOH-Plan-A', 'Géante gazeuse massive en orbite très éloignée', true, false, 20, 'Géante gazeuse', 6);
INSERT INTO public.planet VALUES (12, 'HD 5980 b', 'Planète infernale orbitant un système de Wolf-Rayet', true, false, 4, 'Neptune chaud', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Soleil', 'Notre étoile centrale', true, 4600, 0.00, 1);
INSERT INTO public.star VALUES (2, 'PA-99-N2', 'Une étoile géante ayant subi une nova dans Andromède', true, 3000, 2500000.00, 2);
INSERT INTO public.star VALUES (3, 'M33-BH3-Star', 'Etoile massive compagnon d''un trou noir dans M33', true, 5, 2700000.00, 3);
INSERT INTO public.star VALUES (4, 'M87-Supergiant', 'Une supergéante bleue observée dans l''amas de la Vierge', true, 10, 53500000.00, 4);
INSERT INTO public.star VALUES (5, 'WOH G64', 'Une des plus grandes supergéantes rouges connues', true, 20, 163000.00, 5);
INSERT INTO public.star VALUES (6, 'HD 5980', 'Un système stellaire multiple extrêmement massif et lumineux', true, 4, 200000.00, 6);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
