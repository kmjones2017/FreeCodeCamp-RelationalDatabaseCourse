--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(45) NOT NULL,
    diameter_in_km numeric(5,2) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(45) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    billions_of_stars integer,
    diameter_in_light_years integer
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
    name character varying(45) NOT NULL,
    average_diameter_in_km numeric(6,1),
    average_distance_from_planet_in_km integer,
    description text NOT NULL,
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
    name character varying(45) NOT NULL,
    diameter_in_km integer,
    distance_from_the_sun_in_au numeric(4,2),
    description text NOT NULL,
    planet boolean,
    dwarf_planet boolean,
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
    name character varying(45) NOT NULL,
    diameter_in_km integer NOT NULL,
    surface_temp_in_celsius numeric(7,2),
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Psyche', 280.00, 1);
INSERT INTO public.asteroid VALUES (2, 'Bennu', 0.50, 1);
INSERT INTO public.asteroid VALUES (3, 'Apophis', 0.34, 1);
INSERT INTO public.asteroid VALUES (4, 'Itokawa', 0.33, 1);
INSERT INTO public.asteroid VALUES (5, 'Eros', 16.84, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 200, 105700);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 1000, 152000);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf', 'irregular', 1, 5000);
INSERT INTO public.galaxy VALUES (4, 'Black Eye', 'spiral', 100, 53800);
INSERT INTO public.galaxy VALUES (5, 'Condor', 'barred spiral', 500, 717000);
INSERT INTO public.galaxy VALUES (6, 'Godzilla', 'barred spiral', 1000, 463000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth''s moon', 1738.0, 384400, 'The fifth largest moon in the solar system.', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.2, 6000, 'Mars'' largest, innermost moon that will crash into the planet or break apart in 50 million years.', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.0, 23458, 'A small, lumpy, heavily cratered object.', 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5262.0, 1070000, 'Jupiter''s largest moon, and the largest moon in our solar system.', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4800.0, 1883000, 'Jupiter''s second largest moon and the third largest moon in our solar system.', 5);
INSERT INTO public.moon VALUES (6, 'Io', 3640.0, 422000, 'Jupiter''s third largest moon, and the most volcanically active world in our solar system.', 5);
INSERT INTO public.moon VALUES (7, 'Europa', 3100.0, 671000, 'Jupiter''s fourth largest moon. It''s about 90% the size of Earth''s Moon.', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5150.0, 1200000, 'Saturn''s largest moon is an icy world whose surface is completely obscured by a golden hazy atmosphere.', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 500.0, 238000, 'A small, icy world that has geyser-like jets spewing water vapor and ice particles into space.', 6);
INSERT INTO public.moon VALUES (10, 'Hyperion', 270.0, 1500000, 'The largest of Saturn''s irregular, nonspherical moons.', 6);
INSERT INTO public.moon VALUES (11, 'Prometheus', 85.6, 139000, 'A potato-shaped sheperding moon that constrains the inner edge of Saturn''s F ring.', 6);
INSERT INTO public.moon VALUES (12, 'Pandora', 81.4, 142000, 'A potato-shaped moon that is coated in a fine (dust-sized) icy material.', 6);
INSERT INTO public.moon VALUES (13, 'Oberon', 1522.0, 582600, 'The outermost of the five major moons of Uranus and the second largest of the group.', 7);
INSERT INTO public.moon VALUES (14, 'Titania', 1576.8, 435840, 'Uranus'' largest moon.', 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 1170.0, 265970, 'The darkest of Uranus'' largest moons.', 7);
INSERT INTO public.moon VALUES (16, 'Triton', 2700.0, 354800, 'The only large moon in the solar system that circles its planet in a direction opposite to the planet''s rotation.', 8);
INSERT INTO public.moon VALUES (17, 'Galatea', 158.0, 62000, 'One of Neptune''s tiny, irregularly shaped moons.', 8);
INSERT INTO public.moon VALUES (18, 'Neried', 340.0, 5513400, 'The third largest known moon of Neptune and the second to be discovered.', 8);
INSERT INTO public.moon VALUES (19, 'Charon', 1212.0, 19640, 'It''s the biggest of Pluto''s moons and is about half the size of Pluto itself, making it the largest satellite relative to the planet it orbits in our solar system.', 10);
INSERT INTO public.moon VALUES (20, 'Kerberos', 34.0, 59000, 'A moon with a double-lobed shape and a reflective surface.', 10);
INSERT INTO public.moon VALUES (21, 'Namaka', 170.0, 39300, 'The smaller, inner moon of the trans-Neptunian dwarf planet Haumea.', 11);
INSERT INTO public.moon VALUES (22, 'Hi''iaka', 310.0, 49880, 'The larger, outer moon of the trans-Neptunian dwarf planet Haumea.', 11);
INSERT INTO public.moon VALUES (23, 'S/2015 (136472) 1', 160.0, 20921, 'The only known moon of Makemake and is also known as MK2.', 12);
INSERT INTO public.moon VALUES (24, 'Dysnomia', 600.0, 37300, 'It''s mostly made of ice and has a dark surface that reflects only 5% of visible light.', 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4880, 0.00, 'The smallest planet in our solar system, and the nearest to the Sun.', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 0.72, 'The second planet from the Sun, and Earth''s closest planetary neighbor.', true, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12760, 1.00, 'The third planet from the Sun, and the fifth largest planet.', true, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6780, 1.50, 'A dusty, cold, desert world with a very thin atmosphere.', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139822, 5.20, 'The largest planet in our solar system.', true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 120500, 9.50, 'The sixth planet from the Sun, and the second-largest planet in our solar system.', true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 51118, 19.00, 'The seventh planet from the Sun, and has the third largest diameter of planets in our solar system.', true, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49528, 30.00, 'The eighth and most distant planet in our solar system.', true, false, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 952, 2.80, 'The largest object in the asteroid belt between Mars and Jupiter, and it''s the only dwarf planet located in the inner solar sys
tem.', false, true, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 2377, 39.00, 'Reclassified as a dwarf planet in 2006 by the International Astronomical Union.', false, true, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 1740, 43.00, 'Nicknamed Santa by one discovery team. It is oval-shaped, and is one of the fastest rotating large objects in our solar system.', false, true, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 1430, 45.80, 'Slightly smaller than Pluto, and is the second-brightest object in the Kuiper Belt.', false, true, 1);
INSERT INTO public.planet VALUES (13, 'Eris', 2400, 68.00, 'The discovery of Eris helped trigger a debate in the scientific community that led to the decision to clarify the definition of a planet.', false, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1391600, 5500.00, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 3757320, 11626.85, 2);
INSERT INTO public.star VALUES (3, 'Mirzam', 13496603, 24137.00, 3);
INSERT INTO public.star VALUES (4, 'Polaris', 45000000, 5741.85, 1);
INSERT INTO public.star VALUES (5, 'Mirach', 139140000, 3528.85, 2);
INSERT INTO public.star VALUES (6, 'Canopus', 98789000, 7076.85, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

