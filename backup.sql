--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

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

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: course_course; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_course (
    crn character varying(5) NOT NULL,
    department character varying(10) NOT NULL,
    course_number character varying(10) NOT NULL,
    course_title character varying(60) NOT NULL,
    level integer NOT NULL,
    semester_id integer NOT NULL
);


--
-- Name: course_coursemember; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_coursemember (
    id integer NOT NULL,
    course_id character varying(5) NOT NULL,
    student_id integer NOT NULL
);


--
-- Name: course_coursemember_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_coursemember_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_coursemember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_coursemember_id_seq OWNED BY public.course_coursemember.id;


--
-- Name: course_coursestaff; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_coursestaff (
    id integer NOT NULL,
    course_id character varying(5) NOT NULL,
    instructor_id integer NOT NULL
);


--
-- Name: course_coursestaff_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_coursestaff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_coursestaff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_coursestaff_id_seq OWNED BY public.course_coursestaff.id;


--
-- Name: course_semester; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_semester (
    id integer NOT NULL,
    year character varying(6) NOT NULL,
    semester character varying(6) NOT NULL
);


--
-- Name: course_semester_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_semester_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_semester_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_semester_id_seq OWNED BY public.course_semester.id;


--
-- Name: course_skillstaught; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_skillstaught (
    id integer NOT NULL,
    course_id character varying(5) NOT NULL,
    skill_id integer NOT NULL
);


--
-- Name: course_skillstaught_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_skillstaught_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_skillstaught_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_skillstaught_id_seq OWNED BY public.course_skillstaught.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: project_project; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_project (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    durations integer NOT NULL,
    stage_num integer NOT NULL,
    team_size integer NOT NULL,
    due timestamp with time zone NOT NULL,
    course_id character varying(5) NOT NULL
);


--
-- Name: project_project_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.project_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.project_project_id_seq OWNED BY public.project_project.id;


--
-- Name: project_skillrequired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_skillrequired (
    id integer NOT NULL,
    project_id integer NOT NULL,
    skill_id integer NOT NULL
);


--
-- Name: project_skillrequired_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.project_skillrequired_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_skillrequired_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.project_skillrequired_id_seq OWNED BY public.project_skillrequired.id;


--
-- Name: stage_feedback; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stage_feedback (
    id integer NOT NULL,
    stage integer NOT NULL,
    feedback text NOT NULL,
    rate character varying(2) NOT NULL,
    date_rated date NOT NULL,
    grader_id integer NOT NULL,
    receiver_id integer NOT NULL,
    team_id integer NOT NULL
);


--
-- Name: stage_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stage_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stage_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stage_feedback_id_seq OWNED BY public.stage_feedback.id;


--
-- Name: stage_task; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stage_task (
    id integer NOT NULL,
    stage integer NOT NULL,
    title character varying(20) NOT NULL,
    goal text NOT NULL,
    status character varying(10) NOT NULL,
    schedule date NOT NULL,
    student_id integer NOT NULL,
    team_id integer NOT NULL
);


--
-- Name: stage_task_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stage_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stage_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stage_task_id_seq OWNED BY public.stage_task.id;


--
-- Name: team_membership; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team_membership (
    id integer NOT NULL,
    captain_id integer NOT NULL,
    course_id character varying(5) NOT NULL,
    project_id integer NOT NULL,
    student_id integer NOT NULL,
    team_id integer NOT NULL
);


--
-- Name: team_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.team_membership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.team_membership_id_seq OWNED BY public.team_membership.id;


--
-- Name: team_team; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team_team (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    size integer NOT NULL,
    availability boolean NOT NULL,
    grade integer NOT NULL,
    captain_id integer NOT NULL,
    course_id character varying(5) NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: team_team_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.team_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.team_team_id_seq OWNED BY public.team_team.id;


--
-- Name: user_instructor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_instructor (
    user_id integer NOT NULL,
    netid character varying(20) NOT NULL,
    email character varying(200) NOT NULL,
    "firstName" character varying(200) NOT NULL,
    "lastName" character varying(200) NOT NULL
);


--
-- Name: user_skill; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_skill (
    id integer NOT NULL,
    skill_name character varying(30) NOT NULL
);


--
-- Name: user_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_skill_id_seq OWNED BY public.user_skill.id;


--
-- Name: user_skillset; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_skillset (
    id integer NOT NULL,
    score integer NOT NULL,
    skill_id integer NOT NULL,
    student_id integer NOT NULL
);


--
-- Name: user_skillset_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_skillset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_skillset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_skillset_id_seq OWNED BY public.user_skillset.id;


--
-- Name: user_student; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_student (
    user_id integer NOT NULL,
    netid character varying(20) NOT NULL,
    email character varying(200) NOT NULL,
    "firstName" character varying(200) NOT NULL,
    "lastName" character varying(200) NOT NULL,
    standing character varying(10)
);


--
-- Name: user_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_student boolean NOT NULL,
    is_instructor boolean NOT NULL
);


--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_user_groups_id_seq OWNED BY public.user_user_groups.id;


--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public.user_user.id;


--
-- Name: user_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_user_user_permissions_id_seq OWNED BY public.user_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: course_coursemember id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_coursemember ALTER COLUMN id SET DEFAULT nextval('public.course_coursemember_id_seq'::regclass);


--
-- Name: course_coursestaff id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_coursestaff ALTER COLUMN id SET DEFAULT nextval('public.course_coursestaff_id_seq'::regclass);


--
-- Name: course_semester id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_semester ALTER COLUMN id SET DEFAULT nextval('public.course_semester_id_seq'::regclass);


--
-- Name: course_skillstaught id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_skillstaught ALTER COLUMN id SET DEFAULT nextval('public.course_skillstaught_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: project_project id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_project ALTER COLUMN id SET DEFAULT nextval('public.project_project_id_seq'::regclass);


--
-- Name: project_skillrequired id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_skillrequired ALTER COLUMN id SET DEFAULT nextval('public.project_skillrequired_id_seq'::regclass);


--
-- Name: stage_feedback id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stage_feedback ALTER COLUMN id SET DEFAULT nextval('public.stage_feedback_id_seq'::regclass);


--
-- Name: stage_task id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stage_task ALTER COLUMN id SET DEFAULT nextval('public.stage_task_id_seq'::regclass);


--
-- Name: team_membership id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_membership ALTER COLUMN id SET DEFAULT nextval('public.team_membership_id_seq'::regclass);


--
-- Name: team_team id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_team ALTER COLUMN id SET DEFAULT nextval('public.team_team_id_seq'::regclass);


--
-- Name: user_skill id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_skill ALTER COLUMN id SET DEFAULT nextval('public.user_skill_id_seq'::regclass);


--
-- Name: user_skillset id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_skillset ALTER COLUMN id SET DEFAULT nextval('public.user_skillset_id_seq'::regclass);


--
-- Name: user_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user ALTER COLUMN id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Name: user_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_user_groups_id_seq'::regclass);


--
-- Name: user_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add skill	7	add_skill
26	Can change skill	7	change_skill
27	Can delete skill	7	delete_skill
28	Can view skill	7	view_skill
29	Can add instructor	8	add_instructor
30	Can change instructor	8	change_instructor
31	Can delete instructor	8	delete_instructor
32	Can view instructor	8	view_instructor
33	Can add student	9	add_student
34	Can change student	9	change_student
35	Can delete student	9	delete_student
36	Can view student	9	view_student
37	Can add skillset	10	add_skillset
38	Can change skillset	10	change_skillset
39	Can delete skillset	10	delete_skillset
40	Can view skillset	10	view_skillset
41	Can add course	11	add_course
42	Can change course	11	change_course
43	Can delete course	11	delete_course
44	Can view course	11	view_course
45	Can add course member	12	add_coursemember
46	Can change course member	12	change_coursemember
47	Can delete course member	12	delete_coursemember
48	Can view course member	12	view_coursemember
49	Can add course staff	13	add_coursestaff
50	Can change course staff	13	change_coursestaff
51	Can delete course staff	13	delete_coursestaff
52	Can view course staff	13	view_coursestaff
53	Can add semester	14	add_semester
54	Can change semester	14	change_semester
55	Can delete semester	14	delete_semester
56	Can view semester	14	view_semester
57	Can add skills taught	15	add_skillstaught
58	Can change skills taught	15	change_skillstaught
59	Can delete skills taught	15	delete_skillstaught
60	Can view skills taught	15	view_skillstaught
61	Can add project	16	add_project
62	Can change project	16	change_project
63	Can delete project	16	delete_project
64	Can view project	16	view_project
65	Can add skill required	17	add_skillrequired
66	Can change skill required	17	change_skillrequired
67	Can delete skill required	17	delete_skillrequired
68	Can view skill required	17	view_skillrequired
69	Can add membership	18	add_membership
70	Can change membership	18	change_membership
71	Can delete membership	18	delete_membership
72	Can view membership	18	view_membership
73	Can add team	19	add_team
74	Can change team	19	change_team
75	Can delete team	19	delete_team
76	Can view team	19	view_team
77	Can add feedback	20	add_feedback
78	Can change feedback	20	change_feedback
79	Can delete feedback	20	delete_feedback
80	Can view feedback	20	view_feedback
81	Can add task	21	add_task
82	Can change task	21	change_task
83	Can delete task	21	delete_task
84	Can view task	21	view_task
\.


--
-- Data for Name: course_course; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_course (crn, department, course_number, course_title, level, semester_id) FROM stdin;
35827	CS	CS 225	Data Structures	2	38
23728	CS	CS 233	Computer Architecture	2	38
83994	CS	CS 241	System Programming	4	38
39093	CS	CS 242	Programming Studio	4	38
43809	CS	CS 296	Honors Course	4	38
24915	CS	CS 357	Numerical Methods I	3	38
79805	CS	CS 361	Probability & Statistics for Computer Science	3	38
24913	CS	CS 374	Introduction to Algorithms & Models of Computation	4	38
30617	CS	CS 397	Individual Study	4	38
80777	CS	CS 410	Text Information Systems	4	38
41198	CS	CS 411	Database Systems	4	38
27076	CS	CS 412	Introduction to Data Mining	4	38
68863	CS	CS 413	Intro to Combinatorics	4	38
84086	CS	CS 418	Interactive Computer Graphics	4	38
22889	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	38
32991	CS	CS 421	Programming Languages & Compilers	4	38
82453	CS	CS 424	Real-Time Systems	4	38
84637	CS	CS 425	Distributed Systems	4	38
38762	CS	CS 426	Compiler Construction	4	38
83887	CS	CS 427	Software Engineering I	4	38
49373	CS	CS 433	Computer System Organization	4	38
38681	CS	CS 438	Communication Networks	4	38
61627	CS	CS 440	Artificial Intelligence	3	38
96486	CS	CS 445	Computational Photography	4	38
30364	CS	CS 446	Machine Learning	4	38
53855	CS	CS 447	Natural Language Processing	4	38
25508	CS	CS 450	Numerical Analysis	4	38
56263	CS	CS 461	Computer Security I	4	38
68511	CS	CS 465	User Interface Design	3	38
58410	CS	CS 466	Introduction to Bioinformatics	3	38
37583	CS	CS 473	Algorithms	5	38
81340	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	38
65856	CS	CS 483	Applied Parallel Programming	4	38
84487	CS	CS 484	Parallel Programming	4	38
37711	CS	CS 491	Seminar	4	38
63005	CS	CS 493	Senior Project II, ACP	4	38
97543	CS	CS 494	Senior Project II	4	38
44403	CS	CS 497	CS Team Project	4	38
96988	CS	CS 498	Special Topics	4	38
68608	CS	CS 499	Senior Thesis	5	38
71233	CS	CS 510	Advanced Information Retrieval	5	38
95564	CS	CS 513	Theory & Practice of Data Cleaning	5	38
70041	CS	CS 523	Advanced Operating Systems	5	38
37053	CS	CS 536	Fault-Tolerant Dig Syst Design	5	38
39440	CS	CS 547	Deep Learning	5	38
62667	CS	CS 554	Parallel Numerical Algorithms	5	38
16203	CS	CS 563	Advanced Computer Security	5	38
98389	CS	CS 571	Combinatorial Mathematics	5	38
25456	CS	CS 576	Topics in Automated Deduction	5	38
88969	CS	CS 581	Algorithmic Genomic Biology	5	38
13679	CS	CS 584	Embedded System Verification	5	38
79931	CS	CS 591	Advanced Seminar	5	38
61635	CS	CS 598	Special Topics	5	38
98714	CS	CS 599	Thesis Research	5	38
63315	CS	CS 225	Data Structures	2	37
88487	CS	CS 233	Computer Architecture	2	37
22760	CS	CS 241	System Programming	4	37
97062	CS	CS 242	Programming Studio	4	37
18735	CS	CS 296	Honors Course	4	37
11454	CS	CS 357	Numerical Methods I	3	37
54436	CS	CS 361	Probability & Statistics for Computer Science	3	37
30816	CS	CS 374	Introduction to Algorithms & Models of Computation	4	37
67907	CS	CS 397	Individual Study	4	37
43286	CS	CS 410	Text Information Systems	4	37
57466	CS	CS 411	Database Systems	4	37
40199	CS	CS 412	Introduction to Data Mining	4	37
64681	CS	CS 413	Intro to Combinatorics	4	37
58164	CS	CS 418	Interactive Computer Graphics	4	37
67027	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	37
93922	CS	CS 421	Programming Languages & Compilers	4	37
41051	CS	CS 424	Real-Time Systems	4	37
31815	CS	CS 425	Distributed Systems	4	37
23456	CS	CS 426	Compiler Construction	4	37
82136	CS	CS 427	Software Engineering I	4	37
21902	CS	CS 433	Computer System Organization	4	37
34592	CS	CS 438	Communication Networks	4	37
81824	CS	CS 440	Artificial Intelligence	3	37
69978	CS	CS 445	Computational Photography	4	37
80995	CS	CS 446	Machine Learning	4	37
94945	CS	CS 447	Natural Language Processing	4	37
42757	CS	CS 450	Numerical Analysis	4	37
19012	CS	CS 461	Computer Security I	4	37
93208	CS	CS 465	User Interface Design	3	37
23065	CS	CS 466	Introduction to Bioinformatics	3	37
22142	CS	CS 473	Algorithms	5	37
67884	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	37
61781	CS	CS 483	Applied Parallel Programming	4	37
49632	CS	CS 484	Parallel Programming	4	37
10570	CS	CS 491	Seminar	4	37
80593	CS	CS 493	Senior Project II, ACP	4	37
31399	CS	CS 494	Senior Project II	4	37
45401	CS	CS 497	CS Team Project	4	37
43746	CS	CS 498	Special Topics	4	37
90614	CS	CS 499	Senior Thesis	5	37
74538	CS	CS 510	Advanced Information Retrieval	5	37
28318	CS	CS 513	Theory & Practice of Data Cleaning	5	37
22961	CS	CS 523	Advanced Operating Systems	5	37
14720	CS	CS 536	Fault-Tolerant Dig Syst Design	5	37
82142	CS	CS 547	Deep Learning	5	37
57189	CS	CS 554	Parallel Numerical Algorithms	5	37
71276	CS	CS 563	Advanced Computer Security	5	37
60110	CS	CS 571	Combinatorial Mathematics	5	37
36551	CS	CS 498	Special Topics	4	29
52702	CS	CS 576	Topics in Automated Deduction	5	37
51594	CS	CS 581	Algorithmic Genomic Biology	5	37
42873	CS	CS 584	Embedded System Verification	5	37
97661	CS	CS 591	Advanced Seminar	5	37
20679	CS	CS 598	Special Topics	5	37
48574	CS	CS 599	Thesis Research	5	37
55930	CS	CS 225	Data Structures	2	34
99674	CS	CS 233	Computer Architecture	2	34
94688	CS	CS 241	System Programming	4	34
79602	CS	CS 242	Programming Studio	4	34
23688	CS	CS 296	Honors Course	4	34
54737	CS	CS 357	Numerical Methods I	3	34
56180	CS	CS 361	Probability & Statistics for Computer Science	3	34
70917	CS	CS 374	Introduction to Algorithms & Models of Computation	4	34
38665	CS	CS 397	Individual Study	4	34
42327	CS	CS 410	Text Information Systems	4	34
35150	CS	CS 411	Database Systems	4	34
48043	CS	CS 412	Introduction to Data Mining	4	34
55828	CS	CS 413	Intro to Combinatorics	4	34
85703	CS	CS 418	Interactive Computer Graphics	4	34
45711	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	34
12804	CS	CS 421	Programming Languages & Compilers	4	34
24355	CS	CS 424	Real-Time Systems	4	34
32781	CS	CS 425	Distributed Systems	4	34
18594	CS	CS 426	Compiler Construction	4	34
38313	CS	CS 427	Software Engineering I	4	34
91442	CS	CS 433	Computer System Organization	4	34
33628	CS	CS 438	Communication Networks	4	34
21717	CS	CS 440	Artificial Intelligence	3	34
10015	CS	CS 445	Computational Photography	4	34
21125	CS	CS 446	Machine Learning	4	34
47634	CS	CS 447	Natural Language Processing	4	34
47268	CS	CS 450	Numerical Analysis	4	34
48381	CS	CS 461	Computer Security I	4	34
13440	CS	CS 465	User Interface Design	3	34
65490	CS	CS 466	Introduction to Bioinformatics	3	34
71212	CS	CS 473	Algorithms	5	34
44558	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	34
70831	CS	CS 483	Applied Parallel Programming	4	34
63823	CS	CS 484	Parallel Programming	4	34
42384	CS	CS 491	Seminar	4	34
20649	CS	CS 493	Senior Project II, ACP	4	34
11904	CS	CS 494	Senior Project II	4	34
97267	CS	CS 497	CS Team Project	4	34
71145	CS	CS 498	Special Topics	4	34
77633	CS	CS 499	Senior Thesis	5	34
18142	CS	CS 510	Advanced Information Retrieval	5	34
27547	CS	CS 513	Theory & Practice of Data Cleaning	5	34
65114	CS	CS 523	Advanced Operating Systems	5	34
75084	CS	CS 536	Fault-Tolerant Dig Syst Design	5	34
74113	CS	CS 547	Deep Learning	5	34
74750	CS	CS 554	Parallel Numerical Algorithms	5	34
86240	CS	CS 563	Advanced Computer Security	5	34
32292	CS	CS 571	Combinatorial Mathematics	5	34
36486	CS	CS 576	Topics in Automated Deduction	5	34
24862	CS	CS 581	Algorithmic Genomic Biology	5	34
41242	CS	CS 584	Embedded System Verification	5	34
10357	CS	CS 591	Advanced Seminar	5	34
34359	CS	CS 598	Special Topics	5	34
36055	CS	CS 599	Thesis Research	5	34
19111	CS	CS 225	Data Structures	2	34
97337	CS	CS 233	Computer Architecture	2	34
40875	CS	CS 241	System Programming	4	34
26963	CS	CS 242	Programming Studio	4	34
41575	CS	CS 296	Honors Course	4	34
13878	CS	CS 357	Numerical Methods I	3	34
37833	CS	CS 361	Probability & Statistics for Computer Science	3	34
66919	CS	CS 374	Introduction to Algorithms & Models of Computation	4	34
33734	CS	CS 397	Individual Study	4	34
65530	CS	CS 410	Text Information Systems	4	34
29067	CS	CS 411	Database Systems	4	34
94618	CS	CS 412	Introduction to Data Mining	4	34
71016	CS	CS 413	Intro to Combinatorics	4	34
46874	CS	CS 418	Interactive Computer Graphics	4	34
15326	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	34
29061	CS	CS 421	Programming Languages & Compilers	4	34
20177	CS	CS 424	Real-Time Systems	4	34
32380	CS	CS 425	Distributed Systems	4	34
55268	CS	CS 426	Compiler Construction	4	34
96986	CS	CS 427	Software Engineering I	4	34
41295	CS	CS 433	Computer System Organization	4	34
99009	CS	CS 438	Communication Networks	4	34
63341	CS	CS 440	Artificial Intelligence	3	34
89428	CS	CS 445	Computational Photography	4	34
65839	CS	CS 446	Machine Learning	4	34
84555	CS	CS 447	Natural Language Processing	4	34
42534	CS	CS 450	Numerical Analysis	4	34
45021	CS	CS 461	Computer Security I	4	34
10493	CS	CS 465	User Interface Design	3	34
72488	CS	CS 466	Introduction to Bioinformatics	3	34
57192	CS	CS 473	Algorithms	5	34
17588	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	34
32504	CS	CS 483	Applied Parallel Programming	4	34
68657	CS	CS 484	Parallel Programming	4	34
85512	CS	CS 491	Seminar	4	34
34805	CS	CS 493	Senior Project II, ACP	4	34
67759	CS	CS 494	Senior Project II	4	34
92820	CS	CS 497	CS Team Project	4	34
90623	CS	CS 498	Special Topics	4	34
90368	CS	CS 499	Senior Thesis	5	34
86078	CS	CS 510	Advanced Information Retrieval	5	34
87060	CS	CS 513	Theory & Practice of Data Cleaning	5	34
32783	CS	CS 523	Advanced Operating Systems	5	34
38881	CS	CS 536	Fault-Tolerant Dig Syst Design	5	34
26195	CS	CS 547	Deep Learning	5	34
94077	CS	CS 554	Parallel Numerical Algorithms	5	34
38018	CS	CS 563	Advanced Computer Security	5	34
85748	CS	CS 571	Combinatorial Mathematics	5	34
85764	CS	CS 576	Topics in Automated Deduction	5	34
88258	CS	CS 581	Algorithmic Genomic Biology	5	34
40753	CS	CS 584	Embedded System Verification	5	34
12463	CS	CS 591	Advanced Seminar	5	34
32188	CS	CS 598	Special Topics	5	34
72499	CS	CS 599	Thesis Research	5	34
65026	CS	CS 225	Data Structures	2	33
16286	CS	CS 233	Computer Architecture	2	33
54146	CS	CS 241	System Programming	4	33
78350	CS	CS 242	Programming Studio	4	33
20318	CS	CS 296	Honors Course	4	33
28910	CS	CS 357	Numerical Methods I	3	33
65995	CS	CS 361	Probability & Statistics for Computer Science	3	33
29980	CS	CS 374	Introduction to Algorithms & Models of Computation	4	33
35876	CS	CS 397	Individual Study	4	33
53548	CS	CS 410	Text Information Systems	4	33
39156	CS	CS 411	Database Systems	4	33
33729	CS	CS 412	Introduction to Data Mining	4	33
28795	CS	CS 413	Intro to Combinatorics	4	33
16729	CS	CS 418	Interactive Computer Graphics	4	33
61250	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	33
42165	CS	CS 421	Programming Languages & Compilers	4	33
33523	CS	CS 424	Real-Time Systems	4	33
36489	CS	CS 425	Distributed Systems	4	33
58841	CS	CS 426	Compiler Construction	4	33
23352	CS	CS 427	Software Engineering I	4	33
27034	CS	CS 433	Computer System Organization	4	33
65107	CS	CS 438	Communication Networks	4	33
61153	CS	CS 440	Artificial Intelligence	3	33
32198	CS	CS 445	Computational Photography	4	33
74237	CS	CS 446	Machine Learning	4	33
29973	CS	CS 447	Natural Language Processing	4	33
35082	CS	CS 450	Numerical Analysis	4	33
47490	CS	CS 461	Computer Security I	4	33
56738	CS	CS 465	User Interface Design	3	33
92129	CS	CS 466	Introduction to Bioinformatics	3	33
13775	CS	CS 473	Algorithms	5	33
85426	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	33
37117	CS	CS 483	Applied Parallel Programming	4	33
32731	CS	CS 484	Parallel Programming	4	33
34361	CS	CS 491	Seminar	4	33
10403	CS	CS 493	Senior Project II, ACP	4	33
23822	CS	CS 494	Senior Project II	4	33
52181	CS	CS 497	CS Team Project	4	33
36394	CS	CS 498	Special Topics	4	33
90761	CS	CS 499	Senior Thesis	5	33
60004	CS	CS 510	Advanced Information Retrieval	5	33
19764	CS	CS 513	Theory & Practice of Data Cleaning	5	33
16362	CS	CS 523	Advanced Operating Systems	5	33
86304	CS	CS 536	Fault-Tolerant Dig Syst Design	5	33
30194	CS	CS 547	Deep Learning	5	33
49184	CS	CS 554	Parallel Numerical Algorithms	5	33
21899	CS	CS 563	Advanced Computer Security	5	33
21162	CS	CS 571	Combinatorial Mathematics	5	33
80363	CS	CS 576	Topics in Automated Deduction	5	33
21459	CS	CS 581	Algorithmic Genomic Biology	5	33
25927	CS	CS 584	Embedded System Verification	5	33
60815	CS	CS 591	Advanced Seminar	5	33
96820	CS	CS 598	Special Topics	5	33
82113	CS	CS 599	Thesis Research	5	33
80817	CS	CS 225	Data Structures	2	29
90682	CS	CS 233	Computer Architecture	2	29
10610	CS	CS 241	System Programming	4	29
53860	CS	CS 242	Programming Studio	4	29
54937	CS	CS 296	Honors Course	4	29
27922	CS	CS 357	Numerical Methods I	3	29
93301	CS	CS 361	Probability & Statistics for Computer Science	3	29
51791	CS	CS 374	Introduction to Algorithms & Models of Computation	4	29
91424	CS	CS 397	Individual Study	4	29
35810	CS	CS 410	Text Information Systems	4	29
97832	CS	CS 411	Database Systems	4	29
98204	CS	CS 412	Introduction to Data Mining	4	29
18453	CS	CS 413	Intro to Combinatorics	4	29
54854	CS	CS 418	Interactive Computer Graphics	4	29
51819	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	29
71998	CS	CS 421	Programming Languages & Compilers	4	29
42574	CS	CS 424	Real-Time Systems	4	29
97476	CS	CS 425	Distributed Systems	4	29
80894	CS	CS 426	Compiler Construction	4	29
27894	CS	CS 427	Software Engineering I	4	29
66742	CS	CS 433	Computer System Organization	4	29
33279	CS	CS 438	Communication Networks	4	29
61799	CS	CS 440	Artificial Intelligence	3	29
74647	CS	CS 445	Computational Photography	4	29
74503	CS	CS 446	Machine Learning	4	29
19574	CS	CS 447	Natural Language Processing	4	29
23729	CS	CS 450	Numerical Analysis	4	29
31861	CS	CS 461	Computer Security I	4	29
45664	CS	CS 465	User Interface Design	3	29
38427	CS	CS 466	Introduction to Bioinformatics	3	29
74638	CS	CS 473	Algorithms	5	29
20427	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	29
22406	CS	CS 483	Applied Parallel Programming	4	29
86506	CS	CS 484	Parallel Programming	4	29
28903	CS	CS 491	Seminar	4	29
13660	CS	CS 493	Senior Project II, ACP	4	29
30697	CS	CS 494	Senior Project II	4	29
27740	CS	CS 497	CS Team Project	4	29
74238	CS	CS 499	Senior Thesis	5	29
59388	CS	CS 510	Advanced Information Retrieval	5	29
37466	CS	CS 513	Theory & Practice of Data Cleaning	5	29
34193	CS	CS 523	Advanced Operating Systems	5	29
35457	CS	CS 536	Fault-Tolerant Dig Syst Design	5	29
11565	CS	CS 547	Deep Learning	5	29
79970	CS	CS 554	Parallel Numerical Algorithms	5	29
78848	CS	CS 563	Advanced Computer Security	5	29
68756	CS	CS 571	Combinatorial Mathematics	5	29
19181	CS	CS 576	Topics in Automated Deduction	5	29
44903	CS	CS 581	Algorithmic Genomic Biology	5	29
53181	CS	CS 584	Embedded System Verification	5	29
50968	CS	CS 591	Advanced Seminar	5	29
99669	CS	CS 598	Special Topics	5	29
78540	CS	CS 599	Thesis Research	5	29
41508	CS	CS 225	Data Structures	2	30
11913	CS	CS 233	Computer Architecture	2	30
82429	CS	CS 241	System Programming	4	30
34926	CS	CS 242	Programming Studio	4	30
81917	CS	CS 296	Honors Course	4	30
72651	CS	CS 357	Numerical Methods I	3	30
10566	CS	CS 361	Probability & Statistics for Computer Science	3	30
23840	CS	CS 374	Introduction to Algorithms & Models of Computation	4	30
70518	CS	CS 397	Individual Study	4	30
21163	CS	CS 410	Text Information Systems	4	30
72976	CS	CS 411	Database Systems	4	30
68875	CS	CS 412	Introduction to Data Mining	4	30
85350	CS	CS 413	Intro to Combinatorics	4	30
73977	CS	CS 418	Interactive Computer Graphics	4	30
77717	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	30
49483	CS	CS 421	Programming Languages & Compilers	4	30
18107	CS	CS 424	Real-Time Systems	4	30
87829	CS	CS 425	Distributed Systems	4	30
62616	CS	CS 426	Compiler Construction	4	30
21027	CS	CS 427	Software Engineering I	4	30
69488	CS	CS 433	Computer System Organization	4	30
72523	CS	CS 438	Communication Networks	4	30
78321	CS	CS 440	Artificial Intelligence	3	30
34645	CS	CS 445	Computational Photography	4	30
28720	CS	CS 446	Machine Learning	4	30
89684	CS	CS 447	Natural Language Processing	4	30
87362	CS	CS 450	Numerical Analysis	4	30
85009	CS	CS 461	Computer Security I	4	30
98206	CS	CS 465	User Interface Design	3	30
99981	CS	CS 466	Introduction to Bioinformatics	3	30
46789	CS	CS 473	Algorithms	5	30
37157	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	30
95210	CS	CS 483	Applied Parallel Programming	4	30
46594	CS	CS 484	Parallel Programming	4	30
22010	CS	CS 491	Seminar	4	30
69913	CS	CS 493	Senior Project II, ACP	4	30
10592	CS	CS 494	Senior Project II	4	30
31630	CS	CS 497	CS Team Project	4	30
37804	CS	CS 498	Special Topics	4	30
23166	CS	CS 499	Senior Thesis	5	30
46741	CS	CS 510	Advanced Information Retrieval	5	30
56870	CS	CS 513	Theory & Practice of Data Cleaning	5	30
66424	CS	CS 523	Advanced Operating Systems	5	30
65353	CS	CS 536	Fault-Tolerant Dig Syst Design	5	30
86927	CS	CS 547	Deep Learning	5	30
27682	CS	CS 554	Parallel Numerical Algorithms	5	30
81424	CS	CS 563	Advanced Computer Security	5	30
21670	CS	CS 571	Combinatorial Mathematics	5	30
34911	CS	CS 576	Topics in Automated Deduction	5	30
33309	CS	CS 581	Algorithmic Genomic Biology	5	30
43203	CS	CS 584	Embedded System Verification	5	30
33553	CS	CS 591	Advanced Seminar	5	30
22908	CS	CS 598	Special Topics	5	30
76706	CS	CS 599	Thesis Research	5	30
75729	CS	CS 225	Data Structures	2	26
15919	CS	CS 233	Computer Architecture	2	26
50486	CS	CS 241	System Programming	4	26
24256	CS	CS 242	Programming Studio	4	26
30020	CS	CS 296	Honors Course	4	26
49157	CS	CS 357	Numerical Methods I	3	26
51499	CS	CS 361	Probability & Statistics for Computer Science	3	26
84173	CS	CS 374	Introduction to Algorithms & Models of Computation	4	26
66522	CS	CS 397	Individual Study	4	26
41982	CS	CS 410	Text Information Systems	4	26
43291	CS	CS 411	Database Systems	4	26
46168	CS	CS 412	Introduction to Data Mining	4	26
92539	CS	CS 413	Intro to Combinatorics	4	26
66136	CS	CS 418	Interactive Computer Graphics	4	26
12392	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	26
81894	CS	CS 421	Programming Languages & Compilers	4	26
25481	CS	CS 424	Real-Time Systems	4	26
37957	CS	CS 425	Distributed Systems	4	26
77038	CS	CS 426	Compiler Construction	4	26
92005	CS	CS 427	Software Engineering I	4	26
94071	CS	CS 433	Computer System Organization	4	26
29837	CS	CS 438	Communication Networks	4	26
96720	CS	CS 440	Artificial Intelligence	3	26
60810	CS	CS 445	Computational Photography	4	26
12988	CS	CS 446	Machine Learning	4	26
32029	CS	CS 447	Natural Language Processing	4	26
70888	CS	CS 450	Numerical Analysis	4	26
53167	CS	CS 461	Computer Security I	4	26
50478	CS	CS 465	User Interface Design	3	26
16077	CS	CS 466	Introduction to Bioinformatics	3	26
74395	CS	CS 473	Algorithms	5	26
86110	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	26
26851	CS	CS 483	Applied Parallel Programming	4	26
94321	CS	CS 484	Parallel Programming	4	26
81776	CS	CS 491	Seminar	4	26
62998	CS	CS 493	Senior Project II, ACP	4	26
86814	CS	CS 494	Senior Project II	4	26
34164	CS	CS 497	CS Team Project	4	26
16353	CS	CS 498	Special Topics	4	26
32714	CS	CS 499	Senior Thesis	5	26
71910	CS	CS 510	Advanced Information Retrieval	5	26
67659	CS	CS 513	Theory & Practice of Data Cleaning	5	26
39484	CS	CS 523	Advanced Operating Systems	5	26
30937	CS	CS 536	Fault-Tolerant Dig Syst Design	5	26
63985	CS	CS 547	Deep Learning	5	26
70587	CS	CS 554	Parallel Numerical Algorithms	5	26
14974	CS	CS 563	Advanced Computer Security	5	26
82489	CS	CS 571	Combinatorial Mathematics	5	26
31931	CS	CS 576	Topics in Automated Deduction	5	26
26875	CS	CS 581	Algorithmic Genomic Biology	5	26
33312	CS	CS 584	Embedded System Verification	5	26
42311	CS	CS 591	Advanced Seminar	5	26
41552	CS	CS 598	Special Topics	5	26
27789	CS	CS 599	Thesis Research	5	26
23070	CS	CS 225	Data Structures	2	25
76540	CS	CS 233	Computer Architecture	2	25
33978	CS	CS 241	System Programming	4	25
58694	CS	CS 242	Programming Studio	4	25
23829	CS	CS 296	Honors Course	4	25
54260	CS	CS 357	Numerical Methods I	3	25
17635	CS	CS 361	Probability & Statistics for Computer Science	3	25
34155	CS	CS 374	Introduction to Algorithms & Models of Computation	4	25
68553	CS	CS 397	Individual Study	4	25
66360	CS	CS 410	Text Information Systems	4	25
96183	CS	CS 411	Database Systems	4	25
91821	CS	CS 412	Introduction to Data Mining	4	25
66282	CS	CS 413	Intro to Combinatorics	4	25
63070	CS	CS 418	Interactive Computer Graphics	4	25
90599	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	25
55246	CS	CS 421	Programming Languages & Compilers	4	25
74093	CS	CS 424	Real-Time Systems	4	25
55053	CS	CS 425	Distributed Systems	4	25
82010	CS	CS 426	Compiler Construction	4	25
73277	CS	CS 427	Software Engineering I	4	25
92040	CS	CS 433	Computer System Organization	4	25
96763	CS	CS 438	Communication Networks	4	25
59623	CS	CS 440	Artificial Intelligence	3	25
58962	CS	CS 445	Computational Photography	4	25
38226	CS	CS 446	Machine Learning	4	25
73829	CS	CS 447	Natural Language Processing	4	25
76057	CS	CS 450	Numerical Analysis	4	25
83603	CS	CS 461	Computer Security I	4	25
36463	CS	CS 465	User Interface Design	3	25
37401	CS	CS 466	Introduction to Bioinformatics	3	25
88959	CS	CS 473	Algorithms	5	25
98395	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	25
34093	CS	CS 483	Applied Parallel Programming	4	25
91659	CS	CS 484	Parallel Programming	4	25
43390	CS	CS 491	Seminar	4	25
31140	CS	CS 493	Senior Project II, ACP	4	25
78175	CS	CS 494	Senior Project II	4	25
30281	CS	CS 497	CS Team Project	4	25
28192	CS	CS 498	Special Topics	4	25
29757	CS	CS 499	Senior Thesis	5	25
33656	CS	CS 510	Advanced Information Retrieval	5	25
54499	CS	CS 513	Theory & Practice of Data Cleaning	5	25
35368	CS	CS 523	Advanced Operating Systems	5	25
32844	CS	CS 536	Fault-Tolerant Dig Syst Design	5	25
87207	CS	CS 547	Deep Learning	5	25
38053	CS	CS 554	Parallel Numerical Algorithms	5	25
34453	CS	CS 563	Advanced Computer Security	5	25
47080	CS	CS 571	Combinatorial Mathematics	5	25
26948	CS	CS 576	Topics in Automated Deduction	5	25
54299	CS	CS 581	Algorithmic Genomic Biology	5	25
19050	CS	CS 584	Embedded System Verification	5	25
92069	CS	CS 591	Advanced Seminar	5	25
80590	CS	CS 598	Special Topics	5	25
13548	CS	CS 599	Thesis Research	5	25
11127	CS	CS 225	Data Structures	2	22
55108	CS	CS 233	Computer Architecture	2	22
81315	CS	CS 241	System Programming	4	22
39512	CS	CS 242	Programming Studio	4	22
56479	CS	CS 296	Honors Course	4	22
55177	CS	CS 357	Numerical Methods I	3	22
89512	CS	CS 361	Probability & Statistics for Computer Science	3	22
68722	CS	CS 374	Introduction to Algorithms & Models of Computation	4	22
50274	CS	CS 397	Individual Study	4	22
79960	CS	CS 410	Text Information Systems	4	22
49299	CS	CS 411	Database Systems	4	22
61911	CS	CS 412	Introduction to Data Mining	4	22
98361	CS	CS 413	Intro to Combinatorics	4	22
47135	CS	CS 418	Interactive Computer Graphics	4	22
14111	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	22
49616	CS	CS 421	Programming Languages & Compilers	4	22
21821	CS	CS 424	Real-Time Systems	4	22
75874	CS	CS 425	Distributed Systems	4	22
61486	CS	CS 426	Compiler Construction	4	22
97617	CS	CS 427	Software Engineering I	4	22
34711	CS	CS 433	Computer System Organization	4	22
62911	CS	CS 438	Communication Networks	4	22
75778	CS	CS 440	Artificial Intelligence	3	22
18606	CS	CS 445	Computational Photography	4	22
56412	CS	CS 446	Machine Learning	4	22
27065	CS	CS 447	Natural Language Processing	4	22
98349	CS	CS 450	Numerical Analysis	4	22
60129	CS	CS 461	Computer Security I	4	22
19613	CS	CS 465	User Interface Design	3	22
51236	CS	CS 466	Introduction to Bioinformatics	3	22
94722	CS	CS 473	Algorithms	5	22
73827	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	22
97203	CS	CS 483	Applied Parallel Programming	4	22
23104	CS	CS 484	Parallel Programming	4	22
93362	CS	CS 491	Seminar	4	22
82296	CS	CS 493	Senior Project II, ACP	4	22
87229	CS	CS 494	Senior Project II	4	22
66619	CS	CS 497	CS Team Project	4	22
78837	CS	CS 498	Special Topics	4	22
87113	CS	CS 499	Senior Thesis	5	22
41516	CS	CS 510	Advanced Information Retrieval	5	22
42767	CS	CS 513	Theory & Practice of Data Cleaning	5	22
69160	CS	CS 523	Advanced Operating Systems	5	22
37062	CS	CS 536	Fault-Tolerant Dig Syst Design	5	22
36512	CS	CS 547	Deep Learning	5	22
74352	CS	CS 554	Parallel Numerical Algorithms	5	22
53414	CS	CS 563	Advanced Computer Security	5	22
57322	CS	CS 571	Combinatorial Mathematics	5	22
71193	CS	CS 576	Topics in Automated Deduction	5	22
95957	CS	CS 581	Algorithmic Genomic Biology	5	22
81999	CS	CS 584	Embedded System Verification	5	22
19904	CS	CS 591	Advanced Seminar	5	22
40251	CS	CS 598	Special Topics	5	22
53762	CS	CS 599	Thesis Research	5	22
41465	CS	CS 225	Data Structures	2	22
82801	CS	CS 233	Computer Architecture	2	22
94641	CS	CS 241	System Programming	4	22
17941	CS	CS 242	Programming Studio	4	22
72764	CS	CS 296	Honors Course	4	22
82432	CS	CS 357	Numerical Methods I	3	22
93333	CS	CS 361	Probability & Statistics for Computer Science	3	22
62407	CS	CS 374	Introduction to Algorithms & Models of Computation	4	22
81951	CS	CS 397	Individual Study	4	22
19754	CS	CS 410	Text Information Systems	4	22
20133	CS	CS 411	Database Systems	4	22
79569	CS	CS 412	Introduction to Data Mining	4	22
87751	CS	CS 413	Intro to Combinatorics	4	22
93092	CS	CS 418	Interactive Computer Graphics	4	22
82449	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	22
86591	CS	CS 421	Programming Languages & Compilers	4	22
82174	CS	CS 424	Real-Time Systems	4	22
24924	CS	CS 425	Distributed Systems	4	22
89936	CS	CS 426	Compiler Construction	4	22
10574	CS	CS 427	Software Engineering I	4	22
91053	CS	CS 433	Computer System Organization	4	22
18933	CS	CS 438	Communication Networks	4	22
92467	CS	CS 440	Artificial Intelligence	3	22
10275	CS	CS 445	Computational Photography	4	22
65993	CS	CS 446	Machine Learning	4	22
95507	CS	CS 447	Natural Language Processing	4	22
96995	CS	CS 450	Numerical Analysis	4	22
96164	CS	CS 461	Computer Security I	4	22
76959	CS	CS 465	User Interface Design	3	22
17041	CS	CS 466	Introduction to Bioinformatics	3	22
63817	CS	CS 473	Algorithms	5	22
56018	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	22
47032	CS	CS 483	Applied Parallel Programming	4	22
40335	CS	CS 484	Parallel Programming	4	22
53089	CS	CS 491	Seminar	4	22
26641	CS	CS 493	Senior Project II, ACP	4	22
88731	CS	CS 494	Senior Project II	4	22
96112	CS	CS 497	CS Team Project	4	22
90300	CS	CS 498	Special Topics	4	22
53188	CS	CS 499	Senior Thesis	5	22
69667	CS	CS 510	Advanced Information Retrieval	5	22
48980	CS	CS 513	Theory & Practice of Data Cleaning	5	22
68758	CS	CS 523	Advanced Operating Systems	5	22
22810	CS	CS 536	Fault-Tolerant Dig Syst Design	5	22
27967	CS	CS 547	Deep Learning	5	22
18782	CS	CS 554	Parallel Numerical Algorithms	5	22
90257	CS	CS 563	Advanced Computer Security	5	22
96885	CS	CS 571	Combinatorial Mathematics	5	22
96171	CS	CS 576	Topics in Automated Deduction	5	22
89877	CS	CS 581	Algorithmic Genomic Biology	5	22
59169	CS	CS 584	Embedded System Verification	5	22
74116	CS	CS 591	Advanced Seminar	5	22
38095	CS	CS 598	Special Topics	5	22
58824	CS	CS 599	Thesis Research	5	22
93603	CS	CS 225	Data Structures	2	21
73879	CS	CS 233	Computer Architecture	2	21
73466	CS	CS 241	System Programming	4	21
95601	CS	CS 242	Programming Studio	4	21
63621	CS	CS 296	Honors Course	4	21
42190	CS	CS 357	Numerical Methods I	3	21
70602	CS	CS 361	Probability & Statistics for Computer Science	3	21
14154	CS	CS 374	Introduction to Algorithms & Models of Computation	4	21
34036	CS	CS 397	Individual Study	4	21
65311	CS	CS 410	Text Information Systems	4	21
66383	CS	CS 411	Database Systems	4	21
63228	CS	CS 412	Introduction to Data Mining	4	21
13382	CS	CS 413	Intro to Combinatorics	4	21
57133	CS	CS 418	Interactive Computer Graphics	4	21
25519	CS	CS 420	Parallel Progrmg: Sci & Engrg	4	21
29543	CS	CS 421	Programming Languages & Compilers	4	21
70661	CS	CS 424	Real-Time Systems	4	21
67563	CS	CS 425	Distributed Systems	4	21
27798	CS	CS 426	Compiler Construction	4	21
28702	CS	CS 427	Software Engineering I	4	21
24863	CS	CS 433	Computer System Organization	4	21
69734	CS	CS 438	Communication Networks	4	21
82000	CS	CS 440	Artificial Intelligence	3	21
74176	CS	CS 445	Computational Photography	4	21
85574	CS	CS 446	Machine Learning	4	21
92873	CS	CS 447	Natural Language Processing	4	21
40394	CS	CS 450	Numerical Analysis	4	21
48289	CS	CS 461	Computer Security I	4	21
12277	CS	CS 465	User Interface Design	3	21
25773	CS	CS 466	Introduction to Bioinformatics	3	21
73564	CS	CS 473	Algorithms	5	21
28534	CS	CS 481	Advanced Topics in Stochastic Processes & Applications	5	21
68328	CS	CS 483	Applied Parallel Programming	4	21
26441	CS	CS 484	Parallel Programming	4	21
12137	CS	CS 491	Seminar	4	21
20540	CS	CS 493	Senior Project II, ACP	4	21
25888	CS	CS 494	Senior Project II	4	21
47993	CS	CS 497	CS Team Project	4	21
18903	CS	CS 498	Special Topics	4	21
73341	CS	CS 499	Senior Thesis	5	21
71425	CS	CS 510	Advanced Information Retrieval	5	21
26122	CS	CS 513	Theory & Practice of Data Cleaning	5	21
51902	CS	CS 523	Advanced Operating Systems	5	21
38885	CS	CS 536	Fault-Tolerant Dig Syst Design	5	21
18907	CS	CS 547	Deep Learning	5	21
48783	CS	CS 554	Parallel Numerical Algorithms	5	21
67249	CS	CS 563	Advanced Computer Security	5	21
78516	CS	CS 571	Combinatorial Mathematics	5	21
45610	CS	CS 576	Topics in Automated Deduction	5	21
71530	CS	CS 581	Algorithmic Genomic Biology	5	21
96407	CS	CS 584	Embedded System Verification	5	21
68451	CS	CS 591	Advanced Seminar	5	21
72501	CS	CS 598	Special Topics	5	21
75317	CS	CS 599	Thesis Research	5	21
50223	ECE	ECE 304	Photonic Devices	3	38
45298	ECE	ECE 365	Data Science and Engineering	3	38
23358	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	38
45654	ECE	ECE 380	Biomedical Imaging	4	38
24324	ECE	ECE 402	Electronic Music Synthesis	4	38
10847	ECE	ECE 408	Applied Parallel Programming	4	38
67370	ECE	ECE 411	Computer Organization & Design	4	38
57730	ECE	ECE 414	Biomedical Instrumentation	4	38
44589	ECE	ECE 417	Multimedia Signal Processing	4	38
28009	ECE	ECE 420	Embedded DSP Laboratory	4	38
23654	ECE	ECE 422	Computer Security I	4	38
95462	ECE	ECE 428	Distributed Systems	4	38
86491	ECE	ECE 437	Sensors and Instrumentation	4	38
77089	ECE	ECE 438	Communication Networks	4	38
84366	ECE	ECE 444	IC Device Theory & Fabrication	4	38
87186	ECE	ECE 445	Senior Design Project Lab	4	38
81231	ECE	ECE 446	Principles of Experimental Research in EE	4	38
95446	ECE	ECE 447	Active Microwave Ckt Design	4	38
67170	ECE	ECE 448	Artificial Intelligence	4	38
70148	ECE	ECE 452	Electromagnetic Fields	4	38
95947	ECE	ECE 453	Wireless Communication Systems	4	38
43295	ECE	ECE 459	Communications Systems	4	38
59111	ECE	ECE 463	Digital Communications Lab	4	38
83013	ECE	ECE 464	Power Electronics	4	38
35521	ECE	ECE 465	Optical Communications Systems	4	38
82015	ECE	ECE 469	Power Electronics Laboratory	4	38
84838	ECE	ECE 470	Introduction to Robotics	3	38
39709	ECE	ECE 473	Fund of Engrg Acoustics	4	38
54341	ECE	ECE 476	Power System Analysis	4	38
20927	ECE	ECE 482	Digital IC Design	4	38
37823	ECE	ECE 486	Control Systems	4	38
98419	ECE	ECE 487	Intro Quantum Electr for EEs	3	38
22698	ECE	ECE 488	Compound Semicond & Devices	4	38
25444	ECE	ECE 491	Numerical Analysis	4	38
18085	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	38
89050	ECE	ECE 493	Advanced Engineering Math	5	38
29363	ECE	ECE 496	Senior Research Project	5	38
42530	ECE	ECE 515	Control System Theory & Design	5	38
27746	ECE	ECE 517	Nonlinear & Adaptive Control	5	38
87230	ECE	ECE 518	Adv Semiconductor Nanotech	5	38
35185	ECE	ECE 524	Advanced Computer Security	5	38
77886	ECE	ECE 530	Large-Scale System Analysis	5	38
96474	ECE	ECE 534	Random Processes	5	38
33736	ECE	ECE 535	Theory of Semicond & Devices	5	38
82898	ECE	ECE 540	Computational Electromagnetics	5	38
33263	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	38
65014	ECE	ECE 544	Topics in Signal Processing	5	38
62067	ECE	ECE 551	Digital Signal Processing II	5	38
34121	ECE	ECE 562	Advanced Digital Communication	5	38
50774	ECE	ECE 563	Information Theory	5	38
37761	ECE	ECE 564	Modern Light Microscopy	5	38
99581	ECE	ECE 566	Computational Inference and Learning	5	38
14828	ECE	ECE 574	Nanophotonics	5	38
27471	ECE	ECE 584	Embedded System Verification	5	38
39802	ECE	ECE 304	Photonic Devices	3	37
86484	ECE	ECE 365	Data Science and Engineering	3	37
64259	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	37
27936	ECE	ECE 380	Biomedical Imaging	4	37
62330	ECE	ECE 402	Electronic Music Synthesis	4	37
27605	ECE	ECE 408	Applied Parallel Programming	4	37
61074	ECE	ECE 411	Computer Organization & Design	4	37
99306	ECE	ECE 414	Biomedical Instrumentation	4	37
61020	ECE	ECE 417	Multimedia Signal Processing	4	37
78034	ECE	ECE 420	Embedded DSP Laboratory	4	37
32135	ECE	ECE 422	Computer Security I	4	37
85594	ECE	ECE 428	Distributed Systems	4	37
73331	ECE	ECE 437	Sensors and Instrumentation	4	37
22101	ECE	ECE 438	Communication Networks	4	37
19595	ECE	ECE 444	IC Device Theory & Fabrication	4	37
23022	ECE	ECE 445	Senior Design Project Lab	4	37
15617	ECE	ECE 446	Principles of Experimental Research in EE	4	37
45884	ECE	ECE 447	Active Microwave Ckt Design	4	37
73767	ECE	ECE 448	Artificial Intelligence	4	37
14679	ECE	ECE 452	Electromagnetic Fields	4	37
97273	ECE	ECE 453	Wireless Communication Systems	4	37
45191	ECE	ECE 459	Communications Systems	4	37
96721	ECE	ECE 463	Digital Communications Lab	4	37
54719	ECE	ECE 464	Power Electronics	4	37
90677	ECE	ECE 465	Optical Communications Systems	4	37
66613	ECE	ECE 469	Power Electronics Laboratory	4	37
88720	ECE	ECE 470	Introduction to Robotics	3	37
25001	ECE	ECE 473	Fund of Engrg Acoustics	4	37
73278	ECE	ECE 476	Power System Analysis	4	37
44345	ECE	ECE 482	Digital IC Design	4	37
39046	ECE	ECE 486	Control Systems	4	37
54186	ECE	ECE 487	Intro Quantum Electr for EEs	3	37
36925	ECE	ECE 488	Compound Semicond & Devices	4	37
74467	ECE	ECE 491	Numerical Analysis	4	37
87849	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	37
71704	ECE	ECE 493	Advanced Engineering Math	5	37
89251	ECE	ECE 496	Senior Research Project	5	37
69952	ECE	ECE 515	Control System Theory & Design	5	37
81323	ECE	ECE 517	Nonlinear & Adaptive Control	5	37
94286	ECE	ECE 518	Adv Semiconductor Nanotech	5	37
53178	ECE	ECE 524	Advanced Computer Security	5	37
77654	ECE	ECE 530	Large-Scale System Analysis	5	37
66191	ECE	ECE 534	Random Processes	5	37
33240	ECE	ECE 535	Theory of Semicond & Devices	5	37
53419	ECE	ECE 540	Computational Electromagnetics	5	37
11232	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	37
50121	ECE	ECE 544	Topics in Signal Processing	5	37
37474	ECE	ECE 551	Digital Signal Processing II	5	37
63422	ECE	ECE 562	Advanced Digital Communication	5	37
15491	ECE	ECE 563	Information Theory	5	37
87682	ECE	ECE 564	Modern Light Microscopy	5	37
26724	ECE	ECE 566	Computational Inference and Learning	5	37
13818	ECE	ECE 574	Nanophotonics	5	37
98393	ECE	ECE 584	Embedded System Verification	5	37
18287	ECE	ECE 304	Photonic Devices	3	34
62909	ECE	ECE 365	Data Science and Engineering	3	34
33950	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	34
85281	ECE	ECE 380	Biomedical Imaging	4	34
70137	ECE	ECE 402	Electronic Music Synthesis	4	34
51662	ECE	ECE 408	Applied Parallel Programming	4	34
59551	ECE	ECE 411	Computer Organization & Design	4	34
94645	ECE	ECE 414	Biomedical Instrumentation	4	34
28815	ECE	ECE 417	Multimedia Signal Processing	4	34
90612	ECE	ECE 420	Embedded DSP Laboratory	4	34
43228	ECE	ECE 422	Computer Security I	4	34
27205	ECE	ECE 428	Distributed Systems	4	34
22223	ECE	ECE 437	Sensors and Instrumentation	4	34
32217	ECE	ECE 438	Communication Networks	4	34
38174	ECE	ECE 444	IC Device Theory & Fabrication	4	34
44011	ECE	ECE 445	Senior Design Project Lab	4	34
84572	ECE	ECE 446	Principles of Experimental Research in EE	4	34
10580	ECE	ECE 447	Active Microwave Ckt Design	4	34
54912	ECE	ECE 448	Artificial Intelligence	4	34
15363	ECE	ECE 452	Electromagnetic Fields	4	34
20844	ECE	ECE 453	Wireless Communication Systems	4	34
80683	ECE	ECE 459	Communications Systems	4	34
77161	ECE	ECE 463	Digital Communications Lab	4	34
27631	ECE	ECE 464	Power Electronics	4	34
49792	ECE	ECE 465	Optical Communications Systems	4	34
65034	ECE	ECE 469	Power Electronics Laboratory	4	34
59995	ECE	ECE 470	Introduction to Robotics	3	34
59862	ECE	ECE 473	Fund of Engrg Acoustics	4	34
88032	ECE	ECE 476	Power System Analysis	4	34
24130	ECE	ECE 482	Digital IC Design	4	34
88790	ECE	ECE 486	Control Systems	4	34
53276	ECE	ECE 487	Intro Quantum Electr for EEs	3	34
51586	ECE	ECE 488	Compound Semicond & Devices	4	34
74693	ECE	ECE 491	Numerical Analysis	4	34
13572	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	34
24964	ECE	ECE 493	Advanced Engineering Math	5	34
40263	ECE	ECE 496	Senior Research Project	5	34
28408	ECE	ECE 515	Control System Theory & Design	5	34
91375	ECE	ECE 517	Nonlinear & Adaptive Control	5	34
67612	ECE	ECE 518	Adv Semiconductor Nanotech	5	34
88436	ECE	ECE 524	Advanced Computer Security	5	34
84436	ECE	ECE 530	Large-Scale System Analysis	5	34
17464	ECE	ECE 534	Random Processes	5	34
17750	ECE	ECE 535	Theory of Semicond & Devices	5	34
63275	ECE	ECE 540	Computational Electromagnetics	5	34
84440	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	34
35048	ECE	ECE 544	Topics in Signal Processing	5	34
31711	ECE	ECE 551	Digital Signal Processing II	5	34
31467	ECE	ECE 562	Advanced Digital Communication	5	34
88103	ECE	ECE 563	Information Theory	5	34
38929	ECE	ECE 564	Modern Light Microscopy	5	34
60661	ECE	ECE 566	Computational Inference and Learning	5	34
37586	ECE	ECE 574	Nanophotonics	5	34
61152	ECE	ECE 584	Embedded System Verification	5	34
69996	ECE	ECE 304	Photonic Devices	3	34
14114	ECE	ECE 365	Data Science and Engineering	3	34
67679	ECE	ECE 574	Nanophotonics	5	21
72391	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	34
54076	ECE	ECE 380	Biomedical Imaging	4	34
34599	ECE	ECE 402	Electronic Music Synthesis	4	34
88211	ECE	ECE 408	Applied Parallel Programming	4	34
59673	ECE	ECE 411	Computer Organization & Design	4	34
32857	ECE	ECE 414	Biomedical Instrumentation	4	34
78622	ECE	ECE 417	Multimedia Signal Processing	4	34
71168	ECE	ECE 420	Embedded DSP Laboratory	4	34
13886	ECE	ECE 422	Computer Security I	4	34
24532	ECE	ECE 428	Distributed Systems	4	34
99085	ECE	ECE 437	Sensors and Instrumentation	4	34
50349	ECE	ECE 438	Communication Networks	4	34
14171	ECE	ECE 444	IC Device Theory & Fabrication	4	34
94607	ECE	ECE 445	Senior Design Project Lab	4	34
93134	ECE	ECE 446	Principles of Experimental Research in EE	4	34
35100	ECE	ECE 447	Active Microwave Ckt Design	4	34
79636	ECE	ECE 448	Artificial Intelligence	4	34
80500	ECE	ECE 452	Electromagnetic Fields	4	34
64673	ECE	ECE 453	Wireless Communication Systems	4	34
68478	ECE	ECE 459	Communications Systems	4	34
69002	ECE	ECE 463	Digital Communications Lab	4	34
90105	ECE	ECE 464	Power Electronics	4	34
14007	ECE	ECE 465	Optical Communications Systems	4	34
24694	ECE	ECE 469	Power Electronics Laboratory	4	34
86040	ECE	ECE 470	Introduction to Robotics	3	34
15007	ECE	ECE 473	Fund of Engrg Acoustics	4	34
43733	ECE	ECE 476	Power System Analysis	4	34
87634	ECE	ECE 482	Digital IC Design	4	34
60133	ECE	ECE 486	Control Systems	4	34
78582	ECE	ECE 487	Intro Quantum Electr for EEs	3	34
14271	ECE	ECE 488	Compound Semicond & Devices	4	34
94745	ECE	ECE 491	Numerical Analysis	4	34
19052	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	34
31293	ECE	ECE 493	Advanced Engineering Math	5	34
46545	ECE	ECE 496	Senior Research Project	5	34
83184	ECE	ECE 515	Control System Theory & Design	5	34
44834	ECE	ECE 517	Nonlinear & Adaptive Control	5	34
84273	ECE	ECE 518	Adv Semiconductor Nanotech	5	34
30048	ECE	ECE 524	Advanced Computer Security	5	34
55936	ECE	ECE 530	Large-Scale System Analysis	5	34
52840	ECE	ECE 534	Random Processes	5	34
75967	ECE	ECE 535	Theory of Semicond & Devices	5	34
36186	ECE	ECE 540	Computational Electromagnetics	5	34
61406	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	34
27725	ECE	ECE 544	Topics in Signal Processing	5	34
70776	ECE	ECE 551	Digital Signal Processing II	5	34
81810	ECE	ECE 562	Advanced Digital Communication	5	34
42209	ECE	ECE 563	Information Theory	5	34
59255	ECE	ECE 564	Modern Light Microscopy	5	34
36068	ECE	ECE 566	Computational Inference and Learning	5	34
39157	ECE	ECE 574	Nanophotonics	5	34
32027	ECE	ECE 584	Embedded System Verification	5	34
56942	ECE	ECE 304	Photonic Devices	3	33
23455	ECE	ECE 365	Data Science and Engineering	3	33
99337	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	33
80114	ECE	ECE 380	Biomedical Imaging	4	33
94163	ECE	ECE 402	Electronic Music Synthesis	4	33
37059	ECE	ECE 408	Applied Parallel Programming	4	33
24617	ECE	ECE 411	Computer Organization & Design	4	33
73718	ECE	ECE 414	Biomedical Instrumentation	4	33
55564	ECE	ECE 417	Multimedia Signal Processing	4	33
73259	ECE	ECE 420	Embedded DSP Laboratory	4	33
43723	ECE	ECE 422	Computer Security I	4	33
94737	ECE	ECE 428	Distributed Systems	4	33
40492	ECE	ECE 437	Sensors and Instrumentation	4	33
44251	ECE	ECE 438	Communication Networks	4	33
98770	ECE	ECE 444	IC Device Theory & Fabrication	4	33
16806	ECE	ECE 445	Senior Design Project Lab	4	33
73528	ECE	ECE 446	Principles of Experimental Research in EE	4	33
30118	ECE	ECE 447	Active Microwave Ckt Design	4	33
37428	ECE	ECE 448	Artificial Intelligence	4	33
96614	ECE	ECE 452	Electromagnetic Fields	4	33
42539	ECE	ECE 453	Wireless Communication Systems	4	33
32097	ECE	ECE 459	Communications Systems	4	33
82796	ECE	ECE 463	Digital Communications Lab	4	33
19594	ECE	ECE 464	Power Electronics	4	33
86911	ECE	ECE 465	Optical Communications Systems	4	33
89798	ECE	ECE 469	Power Electronics Laboratory	4	33
18387	ECE	ECE 470	Introduction to Robotics	3	33
97291	ECE	ECE 473	Fund of Engrg Acoustics	4	33
47111	ECE	ECE 476	Power System Analysis	4	33
97542	ECE	ECE 482	Digital IC Design	4	33
46544	ECE	ECE 486	Control Systems	4	33
24745	ECE	ECE 487	Intro Quantum Electr for EEs	3	33
51617	ECE	ECE 488	Compound Semicond & Devices	4	33
24740	ECE	ECE 491	Numerical Analysis	4	33
50682	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	33
56603	ECE	ECE 493	Advanced Engineering Math	5	33
90239	ECE	ECE 496	Senior Research Project	5	33
81582	ECE	ECE 515	Control System Theory & Design	5	33
37851	ECE	ECE 517	Nonlinear & Adaptive Control	5	33
44840	ECE	ECE 518	Adv Semiconductor Nanotech	5	33
85427	ECE	ECE 524	Advanced Computer Security	5	33
29432	ECE	ECE 530	Large-Scale System Analysis	5	33
69109	ECE	ECE 534	Random Processes	5	33
20305	ECE	ECE 535	Theory of Semicond & Devices	5	33
87983	ECE	ECE 540	Computational Electromagnetics	5	33
15848	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	33
14941	ECE	ECE 544	Topics in Signal Processing	5	33
26440	ECE	ECE 551	Digital Signal Processing II	5	33
25887	ECE	ECE 562	Advanced Digital Communication	5	33
45485	ECE	ECE 563	Information Theory	5	33
78026	ECE	ECE 564	Modern Light Microscopy	5	33
84375	ECE	ECE 566	Computational Inference and Learning	5	33
90826	ECE	ECE 574	Nanophotonics	5	33
76713	ECE	ECE 584	Embedded System Verification	5	33
14567	ECE	ECE 304	Photonic Devices	3	29
77459	ECE	ECE 365	Data Science and Engineering	3	29
17545	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	29
58816	ECE	ECE 380	Biomedical Imaging	4	29
50092	ECE	ECE 402	Electronic Music Synthesis	4	29
89758	ECE	ECE 408	Applied Parallel Programming	4	29
68460	ECE	ECE 411	Computer Organization & Design	4	29
18704	ECE	ECE 414	Biomedical Instrumentation	4	29
29603	ECE	ECE 417	Multimedia Signal Processing	4	29
61918	ECE	ECE 420	Embedded DSP Laboratory	4	29
50002	ECE	ECE 422	Computer Security I	4	29
19053	ECE	ECE 428	Distributed Systems	4	29
75213	ECE	ECE 437	Sensors and Instrumentation	4	29
12247	ECE	ECE 438	Communication Networks	4	29
88674	ECE	ECE 444	IC Device Theory & Fabrication	4	29
34185	ECE	ECE 445	Senior Design Project Lab	4	29
44833	ECE	ECE 446	Principles of Experimental Research in EE	4	29
24197	ECE	ECE 447	Active Microwave Ckt Design	4	29
66143	ECE	ECE 448	Artificial Intelligence	4	29
73401	ECE	ECE 452	Electromagnetic Fields	4	29
85609	ECE	ECE 453	Wireless Communication Systems	4	29
71774	ECE	ECE 459	Communications Systems	4	29
26938	ECE	ECE 463	Digital Communications Lab	4	29
61445	ECE	ECE 464	Power Electronics	4	29
65532	ECE	ECE 465	Optical Communications Systems	4	29
28092	ECE	ECE 469	Power Electronics Laboratory	4	29
22243	ECE	ECE 470	Introduction to Robotics	3	29
33305	ECE	ECE 473	Fund of Engrg Acoustics	4	29
42027	ECE	ECE 476	Power System Analysis	4	29
63986	ECE	ECE 482	Digital IC Design	4	29
18905	ECE	ECE 486	Control Systems	4	29
38361	ECE	ECE 487	Intro Quantum Electr for EEs	3	29
27193	ECE	ECE 488	Compound Semicond & Devices	4	29
49076	ECE	ECE 491	Numerical Analysis	4	29
88658	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	29
67416	ECE	ECE 493	Advanced Engineering Math	5	29
26672	ECE	ECE 496	Senior Research Project	5	29
24742	ECE	ECE 515	Control System Theory & Design	5	29
70103	ECE	ECE 517	Nonlinear & Adaptive Control	5	29
20700	ECE	ECE 518	Adv Semiconductor Nanotech	5	29
34099	ECE	ECE 524	Advanced Computer Security	5	29
22656	ECE	ECE 530	Large-Scale System Analysis	5	29
54835	ECE	ECE 534	Random Processes	5	29
56589	ECE	ECE 535	Theory of Semicond & Devices	5	29
70516	ECE	ECE 540	Computational Electromagnetics	5	29
56120	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	29
48084	ECE	ECE 544	Topics in Signal Processing	5	29
13770	ECE	ECE 551	Digital Signal Processing II	5	29
13895	ECE	ECE 562	Advanced Digital Communication	5	29
79998	ECE	ECE 563	Information Theory	5	29
41269	ECE	ECE 564	Modern Light Microscopy	5	29
97872	ECE	ECE 566	Computational Inference and Learning	5	29
31306	ECE	ECE 574	Nanophotonics	5	29
59199	ECE	ECE 584	Embedded System Verification	5	29
86164	ECE	ECE 304	Photonic Devices	3	30
83991	ECE	ECE 365	Data Science and Engineering	3	30
61770	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	30
30322	ECE	ECE 380	Biomedical Imaging	4	30
21145	ECE	ECE 402	Electronic Music Synthesis	4	30
13585	ECE	ECE 408	Applied Parallel Programming	4	30
17637	ECE	ECE 411	Computer Organization & Design	4	30
13925	ECE	ECE 414	Biomedical Instrumentation	4	30
52782	ECE	ECE 417	Multimedia Signal Processing	4	30
69038	ECE	ECE 420	Embedded DSP Laboratory	4	30
96616	ECE	ECE 422	Computer Security I	4	30
56513	ECE	ECE 428	Distributed Systems	4	30
56276	ECE	ECE 437	Sensors and Instrumentation	4	30
75296	ECE	ECE 438	Communication Networks	4	30
71879	ECE	ECE 444	IC Device Theory & Fabrication	4	30
32339	ECE	ECE 445	Senior Design Project Lab	4	30
14899	ECE	ECE 446	Principles of Experimental Research in EE	4	30
79328	ECE	ECE 447	Active Microwave Ckt Design	4	30
18242	ECE	ECE 448	Artificial Intelligence	4	30
25766	ECE	ECE 452	Electromagnetic Fields	4	30
48251	ECE	ECE 453	Wireless Communication Systems	4	30
84771	ECE	ECE 459	Communications Systems	4	30
79227	ECE	ECE 463	Digital Communications Lab	4	30
91909	ECE	ECE 464	Power Electronics	4	30
13794	ECE	ECE 465	Optical Communications Systems	4	30
64133	ECE	ECE 469	Power Electronics Laboratory	4	30
42172	ECE	ECE 470	Introduction to Robotics	3	30
14911	ECE	ECE 473	Fund of Engrg Acoustics	4	30
89351	ECE	ECE 476	Power System Analysis	4	30
22596	ECE	ECE 482	Digital IC Design	4	30
26228	ECE	ECE 486	Control Systems	4	30
14743	ECE	ECE 487	Intro Quantum Electr for EEs	3	30
29492	ECE	ECE 488	Compound Semicond & Devices	4	30
40720	ECE	ECE 491	Numerical Analysis	4	30
71620	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	30
15510	ECE	ECE 493	Advanced Engineering Math	5	30
22398	ECE	ECE 496	Senior Research Project	5	30
33213	ECE	ECE 515	Control System Theory & Design	5	30
43266	ECE	ECE 517	Nonlinear & Adaptive Control	5	30
10930	ECE	ECE 518	Adv Semiconductor Nanotech	5	30
68407	ECE	ECE 524	Advanced Computer Security	5	30
72203	ECE	ECE 530	Large-Scale System Analysis	5	30
11323	ECE	ECE 534	Random Processes	5	30
46012	ECE	ECE 535	Theory of Semicond & Devices	5	30
96845	ECE	ECE 540	Computational Electromagnetics	5	30
43506	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	30
93705	ECE	ECE 544	Topics in Signal Processing	5	30
13126	ECE	ECE 551	Digital Signal Processing II	5	30
61741	ECE	ECE 562	Advanced Digital Communication	5	30
16389	ECE	ECE 563	Information Theory	5	30
60537	ECE	ECE 564	Modern Light Microscopy	5	30
53633	ECE	ECE 566	Computational Inference and Learning	5	30
75182	ECE	ECE 574	Nanophotonics	5	30
52928	ECE	ECE 584	Embedded System Verification	5	30
59729	ECE	ECE 304	Photonic Devices	3	26
39541	ECE	ECE 365	Data Science and Engineering	3	26
65941	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	26
85283	ECE	ECE 380	Biomedical Imaging	4	26
34142	ECE	ECE 402	Electronic Music Synthesis	4	26
42256	ECE	ECE 408	Applied Parallel Programming	4	26
79165	ECE	ECE 411	Computer Organization & Design	4	26
80815	ECE	ECE 414	Biomedical Instrumentation	4	26
13815	ECE	ECE 417	Multimedia Signal Processing	4	26
30354	ECE	ECE 420	Embedded DSP Laboratory	4	26
83353	ECE	ECE 422	Computer Security I	4	26
89181	ECE	ECE 428	Distributed Systems	4	26
35984	ECE	ECE 437	Sensors and Instrumentation	4	26
41177	ECE	ECE 438	Communication Networks	4	26
95997	ECE	ECE 444	IC Device Theory & Fabrication	4	26
23132	ECE	ECE 445	Senior Design Project Lab	4	26
45257	ECE	ECE 446	Principles of Experimental Research in EE	4	26
64628	ECE	ECE 447	Active Microwave Ckt Design	4	26
59041	ECE	ECE 448	Artificial Intelligence	4	26
32925	ECE	ECE 452	Electromagnetic Fields	4	26
91584	ECE	ECE 453	Wireless Communication Systems	4	26
77166	ECE	ECE 459	Communications Systems	4	26
90711	ECE	ECE 463	Digital Communications Lab	4	26
18595	ECE	ECE 464	Power Electronics	4	26
91074	ECE	ECE 465	Optical Communications Systems	4	26
59198	ECE	ECE 469	Power Electronics Laboratory	4	26
17740	ECE	ECE 470	Introduction to Robotics	3	26
43996	ECE	ECE 473	Fund of Engrg Acoustics	4	26
62325	ECE	ECE 476	Power System Analysis	4	26
48796	ECE	ECE 482	Digital IC Design	4	26
71310	ECE	ECE 486	Control Systems	4	26
80885	ECE	ECE 487	Intro Quantum Electr for EEs	3	26
14640	ECE	ECE 488	Compound Semicond & Devices	4	26
30165	ECE	ECE 491	Numerical Analysis	4	26
88460	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	26
90380	ECE	ECE 493	Advanced Engineering Math	5	26
24450	ECE	ECE 496	Senior Research Project	5	26
32671	ECE	ECE 515	Control System Theory & Design	5	26
68075	ECE	ECE 517	Nonlinear & Adaptive Control	5	26
67585	ECE	ECE 518	Adv Semiconductor Nanotech	5	26
76800	ECE	ECE 524	Advanced Computer Security	5	26
76673	ECE	ECE 530	Large-Scale System Analysis	5	26
19940	ECE	ECE 534	Random Processes	5	26
49269	ECE	ECE 535	Theory of Semicond & Devices	5	26
41864	ECE	ECE 540	Computational Electromagnetics	5	26
28336	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	26
42039	ECE	ECE 544	Topics in Signal Processing	5	26
40329	ECE	ECE 551	Digital Signal Processing II	5	26
97154	ECE	ECE 562	Advanced Digital Communication	5	26
55251	ECE	ECE 563	Information Theory	5	26
30041	ECE	ECE 564	Modern Light Microscopy	5	26
25163	ECE	ECE 566	Computational Inference and Learning	5	26
78004	ECE	ECE 574	Nanophotonics	5	26
74563	ECE	ECE 584	Embedded System Verification	5	26
12676	ECE	ECE 304	Photonic Devices	3	25
58568	ECE	ECE 365	Data Science and Engineering	3	25
83109	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	25
29926	ECE	ECE 380	Biomedical Imaging	4	25
75863	ECE	ECE 402	Electronic Music Synthesis	4	25
84365	ECE	ECE 408	Applied Parallel Programming	4	25
95429	ECE	ECE 411	Computer Organization & Design	4	25
72548	ECE	ECE 414	Biomedical Instrumentation	4	25
12769	ECE	ECE 417	Multimedia Signal Processing	4	25
59631	ECE	ECE 420	Embedded DSP Laboratory	4	25
13607	ECE	ECE 422	Computer Security I	4	25
26786	ECE	ECE 428	Distributed Systems	4	25
53965	ECE	ECE 437	Sensors and Instrumentation	4	25
29928	ECE	ECE 438	Communication Networks	4	25
42206	ECE	ECE 444	IC Device Theory & Fabrication	4	25
63896	ECE	ECE 445	Senior Design Project Lab	4	25
95814	ECE	ECE 446	Principles of Experimental Research in EE	4	25
73188	ECE	ECE 447	Active Microwave Ckt Design	4	25
15520	ECE	ECE 448	Artificial Intelligence	4	25
21591	ECE	ECE 452	Electromagnetic Fields	4	25
73009	ECE	ECE 453	Wireless Communication Systems	4	25
30891	ECE	ECE 459	Communications Systems	4	25
38942	ECE	ECE 463	Digital Communications Lab	4	25
52516	ECE	ECE 464	Power Electronics	4	25
22580	ECE	ECE 465	Optical Communications Systems	4	25
56594	ECE	ECE 469	Power Electronics Laboratory	4	25
12664	ECE	ECE 470	Introduction to Robotics	3	25
65488	ECE	ECE 473	Fund of Engrg Acoustics	4	25
82915	ECE	ECE 476	Power System Analysis	4	25
84561	ECE	ECE 482	Digital IC Design	4	25
22902	ECE	ECE 486	Control Systems	4	25
58734	ECE	ECE 487	Intro Quantum Electr for EEs	3	25
70444	ECE	ECE 488	Compound Semicond & Devices	4	25
73985	ECE	ECE 491	Numerical Analysis	4	25
52177	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	25
12004	ECE	ECE 493	Advanced Engineering Math	5	25
50160	ECE	ECE 496	Senior Research Project	5	25
35350	ECE	ECE 515	Control System Theory & Design	5	25
88443	ECE	ECE 517	Nonlinear & Adaptive Control	5	25
49498	ECE	ECE 518	Adv Semiconductor Nanotech	5	25
13418	ECE	ECE 524	Advanced Computer Security	5	25
29098	ECE	ECE 530	Large-Scale System Analysis	5	25
57471	ECE	ECE 534	Random Processes	5	25
11299	ECE	ECE 535	Theory of Semicond & Devices	5	25
76291	ECE	ECE 540	Computational Electromagnetics	5	25
80915	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	25
47118	ECE	ECE 544	Topics in Signal Processing	5	25
79577	ECE	ECE 551	Digital Signal Processing II	5	25
70653	ECE	ECE 562	Advanced Digital Communication	5	25
59877	ECE	ECE 563	Information Theory	5	25
13357	ECE	ECE 564	Modern Light Microscopy	5	25
64903	ECE	ECE 566	Computational Inference and Learning	5	25
84662	ECE	ECE 574	Nanophotonics	5	25
98949	ECE	ECE 584	Embedded System Verification	5	25
21851	ECE	ECE 304	Photonic Devices	3	22
89068	ECE	ECE 365	Data Science and Engineering	3	22
66531	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	22
85710	ECE	ECE 380	Biomedical Imaging	4	22
23966	ECE	ECE 402	Electronic Music Synthesis	4	22
49395	ECE	ECE 408	Applied Parallel Programming	4	22
36498	ECE	ECE 411	Computer Organization & Design	4	22
86389	ECE	ECE 414	Biomedical Instrumentation	4	22
15433	ECE	ECE 417	Multimedia Signal Processing	4	22
64473	ECE	ECE 420	Embedded DSP Laboratory	4	22
23527	ECE	ECE 422	Computer Security I	4	22
81874	ECE	ECE 428	Distributed Systems	4	22
34642	ECE	ECE 437	Sensors and Instrumentation	4	22
95110	ECE	ECE 438	Communication Networks	4	22
68266	ECE	ECE 444	IC Device Theory & Fabrication	4	22
80369	ECE	ECE 445	Senior Design Project Lab	4	22
71730	ECE	ECE 446	Principles of Experimental Research in EE	4	22
71280	ECE	ECE 447	Active Microwave Ckt Design	4	22
29933	ECE	ECE 448	Artificial Intelligence	4	22
26452	ECE	ECE 452	Electromagnetic Fields	4	22
82797	ECE	ECE 453	Wireless Communication Systems	4	22
99162	ECE	ECE 459	Communications Systems	4	22
75660	ECE	ECE 463	Digital Communications Lab	4	22
57150	ECE	ECE 464	Power Electronics	4	22
31383	ECE	ECE 465	Optical Communications Systems	4	22
45368	ECE	ECE 469	Power Electronics Laboratory	4	22
75247	ECE	ECE 470	Introduction to Robotics	3	22
11249	ECE	ECE 473	Fund of Engrg Acoustics	4	22
62006	ECE	ECE 476	Power System Analysis	4	22
82045	ECE	ECE 482	Digital IC Design	4	22
56332	ECE	ECE 486	Control Systems	4	22
20019	ECE	ECE 487	Intro Quantum Electr for EEs	3	22
21841	ECE	ECE 488	Compound Semicond & Devices	4	22
13276	ECE	ECE 491	Numerical Analysis	4	22
23452	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	22
76512	ECE	ECE 493	Advanced Engineering Math	5	22
24728	ECE	ECE 496	Senior Research Project	5	22
10775	ECE	ECE 515	Control System Theory & Design	5	22
60768	ECE	ECE 517	Nonlinear & Adaptive Control	5	22
50814	ECE	ECE 518	Adv Semiconductor Nanotech	5	22
33519	ECE	ECE 524	Advanced Computer Security	5	22
16556	ECE	ECE 530	Large-Scale System Analysis	5	22
19370	ECE	ECE 534	Random Processes	5	22
86843	ECE	ECE 535	Theory of Semicond & Devices	5	22
36233	ECE	ECE 540	Computational Electromagnetics	5	22
17188	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	22
23121	ECE	ECE 544	Topics in Signal Processing	5	22
90228	ECE	ECE 551	Digital Signal Processing II	5	22
78556	ECE	ECE 562	Advanced Digital Communication	5	22
39595	ECE	ECE 563	Information Theory	5	22
69458	ECE	ECE 564	Modern Light Microscopy	5	22
19947	ECE	ECE 566	Computational Inference and Learning	5	22
72337	ECE	ECE 574	Nanophotonics	5	22
18422	ECE	ECE 584	Embedded System Verification	5	22
30471	ECE	ECE 304	Photonic Devices	3	22
38606	ECE	ECE 365	Data Science and Engineering	3	22
94726	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	22
57102	ECE	ECE 380	Biomedical Imaging	4	22
91093	ECE	ECE 402	Electronic Music Synthesis	4	22
40993	ECE	ECE 408	Applied Parallel Programming	4	22
19221	ECE	ECE 411	Computer Organization & Design	4	22
92383	ECE	ECE 414	Biomedical Instrumentation	4	22
18721	ECE	ECE 417	Multimedia Signal Processing	4	22
10971	ECE	ECE 420	Embedded DSP Laboratory	4	22
79819	ECE	ECE 422	Computer Security I	4	22
97412	ECE	ECE 428	Distributed Systems	4	22
94928	ECE	ECE 437	Sensors and Instrumentation	4	22
61031	ECE	ECE 438	Communication Networks	4	22
68160	ECE	ECE 444	IC Device Theory & Fabrication	4	22
33888	ECE	ECE 445	Senior Design Project Lab	4	22
42299	ECE	ECE 446	Principles of Experimental Research in EE	4	22
34092	ECE	ECE 447	Active Microwave Ckt Design	4	22
25107	ECE	ECE 448	Artificial Intelligence	4	22
97796	ECE	ECE 452	Electromagnetic Fields	4	22
45863	ECE	ECE 453	Wireless Communication Systems	4	22
48538	ECE	ECE 459	Communications Systems	4	22
56401	ECE	ECE 463	Digital Communications Lab	4	22
14471	ECE	ECE 464	Power Electronics	4	22
58058	ECE	ECE 465	Optical Communications Systems	4	22
12901	ECE	ECE 469	Power Electronics Laboratory	4	22
49552	ECE	ECE 470	Introduction to Robotics	3	22
36659	ECE	ECE 473	Fund of Engrg Acoustics	4	22
37457	ECE	ECE 476	Power System Analysis	4	22
45950	ECE	ECE 482	Digital IC Design	4	22
24255	ECE	ECE 486	Control Systems	4	22
40456	ECE	ECE 487	Intro Quantum Electr for EEs	3	22
27686	ECE	ECE 488	Compound Semicond & Devices	4	22
76825	ECE	ECE 491	Numerical Analysis	4	22
51727	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	22
40903	ECE	ECE 493	Advanced Engineering Math	5	22
12198	ECE	ECE 496	Senior Research Project	5	22
32588	ECE	ECE 515	Control System Theory & Design	5	22
64143	ECE	ECE 517	Nonlinear & Adaptive Control	5	22
38668	ECE	ECE 518	Adv Semiconductor Nanotech	5	22
13628	ECE	ECE 524	Advanced Computer Security	5	22
79279	ECE	ECE 530	Large-Scale System Analysis	5	22
28586	ECE	ECE 534	Random Processes	5	22
45879	ECE	ECE 535	Theory of Semicond & Devices	5	22
36692	ECE	ECE 540	Computational Electromagnetics	5	22
93245	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	22
34908	ECE	ECE 544	Topics in Signal Processing	5	22
62938	ECE	ECE 551	Digital Signal Processing II	5	22
40950	ECE	ECE 562	Advanced Digital Communication	5	22
83208	ECE	ECE 563	Information Theory	5	22
33854	ECE	ECE 564	Modern Light Microscopy	5	22
89135	ECE	ECE 566	Computational Inference and Learning	5	22
86187	ECE	ECE 574	Nanophotonics	5	22
83218	ECE	ECE 584	Embedded System Verification	5	22
33510	ECE	ECE 304	Photonic Devices	3	21
73855	ECE	ECE 365	Data Science and Engineering	3	21
13963	ECE	ECE 374	Introduction to Algorithms & Models of Computation	4	21
74053	ECE	ECE 380	Biomedical Imaging	4	21
88388	ECE	ECE 402	Electronic Music Synthesis	4	21
88811	ECE	ECE 408	Applied Parallel Programming	4	21
20480	ECE	ECE 411	Computer Organization & Design	4	21
73998	ECE	ECE 414	Biomedical Instrumentation	4	21
26118	ECE	ECE 417	Multimedia Signal Processing	4	21
93144	ECE	ECE 420	Embedded DSP Laboratory	4	21
82832	ECE	ECE 422	Computer Security I	4	21
27830	ECE	ECE 428	Distributed Systems	4	21
49627	ECE	ECE 437	Sensors and Instrumentation	4	21
79332	ECE	ECE 438	Communication Networks	4	21
74080	ECE	ECE 444	IC Device Theory & Fabrication	4	21
25251	ECE	ECE 445	Senior Design Project Lab	4	21
17589	ECE	ECE 446	Principles of Experimental Research in EE	4	21
45889	ECE	ECE 447	Active Microwave Ckt Design	4	21
96909	ECE	ECE 448	Artificial Intelligence	4	21
97439	ECE	ECE 452	Electromagnetic Fields	4	21
41482	ECE	ECE 453	Wireless Communication Systems	4	21
14165	ECE	ECE 459	Communications Systems	4	21
71964	ECE	ECE 463	Digital Communications Lab	4	21
50449	ECE	ECE 464	Power Electronics	4	21
21869	ECE	ECE 465	Optical Communications Systems	4	21
22782	ECE	ECE 469	Power Electronics Laboratory	4	21
43083	ECE	ECE 470	Introduction to Robotics	3	21
44435	ECE	ECE 473	Fund of Engrg Acoustics	4	21
17970	ECE	ECE 476	Power System Analysis	4	21
23371	ECE	ECE 482	Digital IC Design	4	21
92055	ECE	ECE 486	Control Systems	4	21
29372	ECE	ECE 487	Intro Quantum Electr for EEs	3	21
43949	ECE	ECE 488	Compound Semicond & Devices	4	21
97323	ECE	ECE 491	Numerical Analysis	4	21
31485	ECE	ECE 492	Parallel Progrmg: Sci & Engrg	4	21
20190	ECE	ECE 493	Advanced Engineering Math	5	21
29552	ECE	ECE 496	Senior Research Project	5	21
86116	ECE	ECE 515	Control System Theory & Design	5	21
33084	ECE	ECE 517	Nonlinear & Adaptive Control	5	21
40746	ECE	ECE 518	Adv Semiconductor Nanotech	5	21
63874	ECE	ECE 524	Advanced Computer Security	5	21
54822	ECE	ECE 530	Large-Scale System Analysis	5	21
72662	ECE	ECE 534	Random Processes	5	21
62664	ECE	ECE 535	Theory of Semicond & Devices	5	21
62553	ECE	ECE 540	Computational Electromagnetics	5	21
57769	ECE	ECE 542	Fault-Tolerant Dig Syst Design	5	21
73812	ECE	ECE 544	Topics in Signal Processing	5	21
68809	ECE	ECE 551	Digital Signal Processing II	5	21
95035	ECE	ECE 562	Advanced Digital Communication	5	21
50526	ECE	ECE 563	Information Theory	5	21
41863	ECE	ECE 564	Modern Light Microscopy	5	21
53400	ECE	ECE 566	Computational Inference and Learning	5	21
42139	ECE	ECE 584	Embedded System Verification	5	21
\.


--
-- Data for Name: course_coursemember; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_coursemember (id, course_id, student_id) FROM stdin;
1	24915	1
2	39093	1
3	79805	1
4	23728	1
5	83994	1
6	24913	2
7	39093	2
8	79805	2
9	23728	2
10	83994	2
11	83994	3
12	24913	3
13	24915	3
14	35827	3
15	23728	3
16	35827	4
17	24913	4
18	24915	4
19	83994	4
20	79805	4
21	24913	5
22	23728	5
23	39093	5
24	24915	5
25	83994	5
26	83994	6
27	23728	6
28	24915	6
29	79805	6
30	24913	6
31	24913	7
32	83994	7
33	79805	7
34	24915	7
35	23728	7
36	24913	8
37	39093	8
38	83994	8
39	23728	8
40	79805	8
41	23728	9
42	24915	9
43	24913	9
44	79805	9
45	35827	9
46	79805	10
47	24913	10
48	83994	10
49	24915	10
50	23728	10
51	35827	11
52	39093	11
53	24915	11
54	23728	11
55	83994	11
56	83994	12
57	24915	12
58	24913	12
59	35827	12
60	23728	12
61	35827	13
62	79805	13
63	39093	13
64	24913	13
65	83994	13
66	39093	14
67	24913	14
68	35827	14
69	23728	14
70	79805	14
71	24913	15
72	79805	15
73	39093	15
74	24915	15
75	23728	15
76	23728	16
77	39093	16
78	79805	16
79	83994	16
80	24915	16
81	24913	17
82	24915	17
83	35827	17
84	23728	17
85	39093	17
86	23728	18
87	79805	18
88	35827	18
89	24915	18
90	39093	18
91	24915	19
92	35827	19
93	83994	19
94	23728	19
95	24913	19
96	83994	20
97	39093	20
98	35827	20
99	79805	20
100	24913	20
101	35827	21
102	39093	21
103	24913	21
104	83994	21
105	24915	21
106	39093	22
107	79805	22
108	24913	22
109	23728	22
110	24915	22
111	23728	23
112	35827	23
113	39093	23
114	79805	23
115	24913	23
116	23728	24
117	83994	24
118	35827	24
119	79805	24
120	39093	24
121	35827	25
122	83994	25
123	24915	25
124	24913	25
125	23728	25
126	24915	26
127	35827	26
128	83994	26
129	24913	26
130	79805	26
131	79805	27
132	39093	27
133	24913	27
134	35827	27
135	23728	27
136	23728	28
137	83994	28
138	79805	28
139	24913	28
140	39093	28
141	39093	29
142	35827	29
143	23728	29
144	79805	29
145	24913	29
146	24915	30
147	23728	30
148	35827	30
149	24913	30
150	39093	30
151	24913	31
152	83994	31
153	79805	31
154	35827	31
155	39093	31
156	24913	32
157	35827	32
158	83994	32
159	79805	32
160	39093	32
161	23728	33
162	35827	33
163	39093	33
164	79805	33
165	24913	33
166	39093	34
167	23728	34
168	79805	34
169	24915	34
170	83994	34
171	23728	35
172	79805	35
173	24913	35
174	83994	35
175	39093	35
176	83994	36
177	24913	36
178	23728	36
179	39093	36
180	79805	36
181	39093	37
182	35827	37
183	23728	37
184	79805	37
185	24913	37
186	35827	301
\.


--
-- Data for Name: course_coursestaff; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_coursestaff (id, course_id, instructor_id) FROM stdin;
\.


--
-- Data for Name: course_semester; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_semester (id, year, semester) FROM stdin;
1	2010	Fall
2	2010	Spring
3	2010	Summer
4	2010	Winter
5	2011	Fall
6	2011	Spring
7	2011	Summer
8	2011	Winter
9	2012	Fall
10	2012	Spring
11	2012	Summer
12	2012	Winter
13	2013	Fall
14	2013	Spring
15	2013	Summer
16	2013	Winter
17	2014	Fall
18	2014	Spring
19	2014	Summer
20	2014	Winter
21	2015	Fall
22	2015	Spring
23	2015	Summer
24	2015	Winter
25	2016	Fall
26	2016	Spring
27	2016	Summer
28	2016	Winter
29	2017	Fall
30	2017	Spring
31	2017	Summer
32	2017	Winter
33	2018	Fall
34	2018	Spring
35	2018	Summer
36	2018	Winter
37	2019	Fall
38	2019	Spring
39	2019	Summer
40	2019	Winter
\.


--
-- Data for Name: course_skillstaught; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_skillstaught (id, course_id, skill_id) FROM stdin;
1	35827	5
2	35827	6
3	35827	11
4	23728	8
5	23728	13
6	83994	5
7	83994	8
8	83994	11
9	39093	2
10	39093	4
11	39093	11
12	39093	16
13	39093	20
14	24915	2
15	24915	13
16	24915	22
17	24915	28
18	24915	29
19	79805	2
20	79805	28
21	24913	2
22	24913	11
23	24913	13
24	24913	22
25	80777	2
26	80777	18
27	80777	22
28	80777	29
29	41198	4
30	41198	10
31	41198	11
32	41198	16
33	22889	34
34	32991	14
35	32991	24
36	32991	25
37	32991	31
38	32991	33
39	82453	7
40	82453	11
41	82453	27
42	82453	32
43	84637	5
44	84637	6
45	84637	14
46	84637	30
47	38762	1
48	38762	3
49	38762	9
50	38762	23
51	83887	17
52	83887	20
53	83887	25
54	83887	28
55	83887	34
56	49373	18
57	49373	23
58	38681	1
59	38681	4
60	38681	12
61	38681	16
62	38681	34
63	61627	8
64	61627	9
65	61627	12
66	61627	14
67	61627	15
68	61627	20
69	61627	28
70	61627	33
71	96486	7
72	96486	12
73	96486	27
74	96486	28
75	96486	31
76	96486	32
77	30364	4
78	30364	10
79	30364	16
80	30364	23
81	30364	26
82	30364	31
83	30364	35
84	53855	6
85	53855	9
86	53855	15
87	53855	30
88	25508	1
89	25508	6
90	25508	7
91	25508	8
92	25508	10
93	25508	12
94	25508	20
95	25508	22
96	56263	7
97	56263	15
98	56263	17
99	56263	26
100	56263	27
101	68511	1
102	68511	8
103	68511	10
104	68511	11
105	68511	20
106	68511	23
107	68511	29
108	58410	2
109	58410	17
110	58410	22
111	58410	27
112	58410	33
113	37583	6
114	37583	7
115	37583	15
116	37583	22
117	37583	24
118	37583	25
119	37583	27
120	37583	35
121	81340	18
122	81340	19
123	81340	20
124	81340	25
125	65856	4
126	65856	8
127	65856	28
128	65856	33
129	84487	14
130	84487	16
131	84487	18
132	84487	28
133	84487	30
134	84487	31
135	84487	32
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	user	user
7	user	skill
8	user	instructor
9	user	student
10	user	skillset
11	course	course
12	course	coursemember
13	course	coursestaff
14	course	semester
15	course	skillstaught
16	project	project
17	project	skillrequired
18	team	membership
19	team	team
20	stage	feedback
21	stage	task
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-07-30 18:26:42.695828-05
2	contenttypes	0002_remove_content_type_name	2019-07-30 18:26:42.712271-05
3	auth	0001_initial	2019-07-30 18:26:42.769581-05
4	auth	0002_alter_permission_name_max_length	2019-07-30 18:26:42.836642-05
5	auth	0003_alter_user_email_max_length	2019-07-30 18:26:42.853502-05
6	auth	0004_alter_user_username_opts	2019-07-30 18:26:42.870776-05
7	auth	0005_alter_user_last_login_null	2019-07-30 18:26:42.887486-05
8	auth	0006_require_contenttypes_0002	2019-07-30 18:26:42.892888-05
9	auth	0007_alter_validators_add_error_messages	2019-07-30 18:26:42.905148-05
10	auth	0008_alter_user_username_max_length	2019-07-30 18:26:42.915791-05
11	auth	0009_alter_user_last_name_max_length	2019-07-30 18:26:42.923524-05
12	auth	0010_alter_group_name_max_length	2019-07-30 18:26:42.930627-05
13	auth	0011_update_proxy_permissions	2019-07-30 18:26:42.93732-05
14	user	0001_initial	2019-07-30 18:26:43.071805-05
15	admin	0001_initial	2019-07-30 18:26:43.165242-05
16	admin	0002_logentry_remove_auto_add	2019-07-30 18:26:43.187152-05
17	admin	0003_logentry_add_action_flag_choices	2019-07-30 18:26:43.196421-05
18	course	0001_initial	2019-07-30 18:26:43.235804-05
19	course	0002_auto_20190730_2326	2019-07-30 18:26:43.347808-05
20	project	0001_initial	2019-07-30 18:26:43.445141-05
21	project	0002_auto_20190730_2326	2019-07-30 18:26:43.516614-05
22	sessions	0001_initial	2019-07-30 18:26:43.550834-05
23	team	0001_initial	2019-07-30 18:26:43.584754-05
24	stage	0001_initial	2019-07-30 18:26:43.630603-05
25	stage	0002_auto_20190730_2326	2019-07-30 18:26:43.720382-05
26	team	0002_auto_20190730_2326	2019-07-30 18:26:43.907639-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
aw7xtrhavek4ph021ekojrxzr0sko0vz	NGM4ZTcwY2I3NGFkNzFlZmRhYTgyNWZhMGM4NDJhYmI4YWM3ZDRkMTp7Il9hdXRoX3VzZXJfaWQiOiIzMDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhhYjllNzJlMmJiZWNkMjBhNjRjYjg1Mjk5Y2FlNjlmOWU0ZThjOTEifQ==	2019-08-13 18:32:16.997425-05
\.


--
-- Data for Name: project_project; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.project_project (id, name, durations, stage_num, team_size, due, course_id) FROM stdin;
0	Apple Cat Toad	7	2	5	2018-08-03 12:34:00-05	35827
1	Apple Potato Elephant	4	1	3	2018-10-10 13:51:00-05	35827
2	Fish Dog Potato	5	3	5	2018-09-18 12:48:00-05	35827
3	Cat Fish Sriracha	8	3	3	2018-11-28 23:29:00-06	35827
4	Toad Dog Banana	2	2	5	2019-07-22 19:11:00-05	35827
5	Elephant Banana Apple	3	3	4	2018-03-24 13:11:00-05	35827
6	Ketchup Potato Potato	11	2	4	2018-07-02 10:22:00-05	35827
7	Apple Banana Computer	10	3	5	2018-03-09 15:29:00-06	35827
8	Fish Computer Potato	2	1	4	2018-05-14 13:51:00-05	35827
9	Words Cat Apple	11	1	4	2018-05-28 12:50:00-05	35827
10	Dictionary Machine Sriracha	4	3	4	2019-12-02 22:15:00-06	35827
11	Sriracha Machine Words	11	2	4	2018-10-06 23:59:00-05	35827
12	Potato Apple Toad	2	2	5	2019-09-03 12:30:00-05	35827
13	Potato Dictionary Words	5	2	3	2018-07-15 19:55:00-05	23728
14	Cat Machine Machine	12	1	3	2019-06-21 16:24:00-05	23728
15	Shrimp Database Shrimp	11	3	2	2018-12-02 16:25:00-06	23728
16	Toad Words Banana	3	2	3	2019-01-14 14:10:00-06	23728
17	Banana Banana Elephant	2	2	4	2018-04-14 16:30:00-05	23728
18	Dictionary Fish Dog	12	3	4	2018-07-27 15:29:00-05	23728
19	Toad Database Ketchup	6	3	2	2018-08-10 12:50:00-05	23728
20	Banana Sriracha Dictionary	3	3	2	2019-05-14 13:41:00-05	23728
21	Database Cat Dictionary	11	1	5	2019-09-10 11:30:00-05	23728
22	Elephant Toad Dog	10	3	4	2018-03-18 17:19:00-05	23728
23	Banana Dictionary Fish	7	3	4	2019-01-09 16:45:00-06	23728
24	Dog Computer Elephant	11	2	4	2018-05-28 20:23:00-05	23728
25	Apple Banana Toad	8	3	3	2019-07-23 10:43:00-05	23728
26	Sriracha Elephant Banana	6	1	2	2018-12-21 13:22:00-06	23728
27	Fish Toad Dog	5	3	2	2019-07-15 17:59:00-05	23728
28	Potato Computer Elephant	4	3	5	2019-01-12 19:41:00-06	23728
29	Elephant Machine Computer	4	3	2	2018-06-12 17:59:00-05	23728
30	Banana Fish Apple	10	2	3	2018-07-01 20:51:00-05	83994
31	Banana Words Shrimp	4	3	4	2019-03-27 12:56:00-05	83994
32	Banana Toad Elephant	6	3	4	2019-07-22 17:57:00-05	83994
33	Words Words Fish	5	3	3	2019-03-07 18:35:00-06	83994
34	Banana Toad Sriracha	11	1	4	2018-02-07 11:14:00-06	83994
35	Database Toad Ketchup	11	2	3	2019-08-23 10:54:00-05	83994
36	Potato Database Dog	3	2	5	2018-05-21 22:36:00-05	83994
37	Sriracha Shrimp Apple	10	2	3	2018-05-03 10:14:00-05	83994
38	Computer Potato Computer	4	3	4	2018-06-11 23:20:00-05	83994
39	Dictionary Computer Sriracha	9	3	4	2019-04-03 18:37:00-05	83994
40	Elephant Sriracha Computer	11	3	5	2019-11-19 11:45:00-06	83994
41	Dog Toad Dictionary	8	3	2	2018-10-24 12:10:00-05	83994
42	Apple Banana Dictionary	5	2	4	2018-11-07 12:55:00-06	83994
43	Apple Shrimp Dictionary	12	3	4	2019-06-13 17:59:00-05	83994
44	Sriracha Sriracha Sriracha	7	2	4	2018-01-03 18:27:00-06	83994
45	Sriracha Potato Shrimp	5	3	2	2018-08-16 20:14:00-05	83994
46	Computer Ketchup Apple	9	2	4	2018-10-27 20:49:00-05	39093
47	Database Dictionary Apple	4	2	3	2019-12-09 18:10:00-06	39093
48	Apple Banana Database	1	1	4	2019-03-15 11:18:00-05	39093
49	Elephant Cat Banana	9	2	4	2018-05-10 12:30:00-05	39093
50	Elephant Banana Cat	10	3	5	2018-03-07 23:35:00-06	39093
51	Potato Ketchup Potato	4	3	2	2018-07-01 23:47:00-05	39093
52	Shrimp Toad Dictionary	12	2	5	2019-08-28 13:41:00-05	39093
53	Toad Apple Shrimp	9	2	3	2018-02-28 18:56:00-06	39093
54	Fish Sriracha Fish	8	2	5	2019-09-21 21:51:00-05	39093
55	Banana Banana Apple	2	1	2	2019-11-14 16:54:00-06	39093
56	Sriracha Words Toad	12	1	4	2019-02-10 10:50:00-06	39093
57	Toad Machine Dictionary	5	3	2	2018-09-02 15:45:00-05	39093
58	Dog Potato Database	9	3	2	2019-03-11 21:57:00-05	39093
59	Machine Shrimp Toad	3	3	5	2019-06-26 16:41:00-05	39093
60	Banana Fish Potato	10	2	4	2019-04-12 18:59:00-05	39093
61	Fish Sriracha Cat	3	3	2	2018-02-09 10:36:00-06	39093
62	Cat Toad Cat	7	3	3	2019-12-25 14:21:00-06	43809
63	Ketchup Dictionary Fish	2	1	4	2018-06-19 22:45:00-05	43809
64	Banana Computer Apple	7	3	2	2018-08-16 21:32:00-05	43809
65	Cat Dog Shrimp	12	2	5	2018-12-28 19:52:00-06	43809
66	Toad Computer Cat	8	2	5	2018-08-13 23:46:00-05	43809
67	Apple Toad Words	6	1	2	2019-03-20 15:52:00-05	43809
68	Shrimp Apple Toad	3	2	5	2019-03-23 10:23:00-05	43809
69	Database Ketchup Banana	1	3	5	2018-11-12 18:34:00-06	43809
70	Toad Cat Dictionary	12	3	2	2019-11-23 22:46:00-06	43809
71	Sriracha Sriracha Words	7	1	5	2019-07-09 10:44:00-05	43809
72	Elephant Fish Machine	12	1	3	2019-12-08 22:28:00-06	24915
73	Sriracha Ketchup Ketchup	6	2	4	2019-04-14 21:52:00-05	24915
74	Machine Dictionary Banana	1	1	3	2019-09-21 14:11:00-05	24915
75	Toad Apple Dictionary	6	2	2	2019-02-24 16:47:00-06	24915
76	Machine Banana Machine	3	2	3	2018-05-17 16:57:00-05	24915
77	Sriracha Banana Ketchup	5	3	2	2018-03-11 11:45:00-05	24915
78	Words Dog Shrimp	2	2	5	2018-06-01 10:17:00-05	24915
79	Cat Computer Shrimp	3	1	5	2019-04-28 13:10:00-05	24915
80	Dictionary Computer Sriracha	12	1	3	2019-02-13 10:41:00-06	79805
81	Apple Potato Cat	9	3	3	2019-05-26 11:47:00-05	79805
82	Banana Ketchup Ketchup	7	3	2	2019-08-28 21:54:00-05	79805
83	Dog Toad Words	6	2	2	2019-08-05 20:54:00-05	79805
84	Machine Sriracha Words	6	1	2	2018-11-10 21:20:00-06	79805
85	Toad Cat Elephant	9	2	5	2019-08-05 23:37:00-05	79805
86	Banana Dog Shrimp	11	2	3	2018-01-03 21:27:00-06	79805
87	Dictionary Machine Machine	9	1	2	2019-06-19 18:11:00-05	79805
88	Toad Database Apple	4	1	2	2019-06-16 13:17:00-05	79805
89	Dictionary Apple Apple	12	3	4	2019-07-10 19:30:00-05	79805
90	Apple Potato Database	8	1	2	2019-08-18 18:54:00-05	24913
91	Database Dog Potato	5	2	4	2018-07-02 21:45:00-05	24913
92	Dog Cat Potato	7	1	4	2019-01-01 12:14:00-06	24913
93	Fish Shrimp Toad	1	3	3	2018-04-12 23:21:00-05	24913
94	Potato Database Cat	10	2	5	2019-07-02 22:43:00-05	24913
95	Sriracha Elephant Computer	6	1	2	2019-02-05 12:35:00-06	24913
96	Elephant Words Machine	1	2	4	2019-07-24 11:16:00-05	24913
97	Dog Ketchup Sriracha	2	3	2	2019-11-08 11:47:00-06	24913
98	Potato Dog Sriracha	4	2	2	2019-06-10 21:39:00-05	24913
99	Cat Potato Machine	1	2	4	2019-06-22 15:54:00-05	24913
100	Machine Shrimp Toad	7	1	3	2018-10-27 13:59:00-05	24913
101	Potato Ketchup Computer	12	1	5	2018-03-23 15:31:00-05	24913
102	Toad Cat Computer	2	2	2	2018-12-03 22:47:00-06	24913
103	Sriracha Shrimp Machine	3	3	3	2018-01-14 15:59:00-06	24913
104	Database Apple Computer	1	2	5	2019-03-07 11:25:00-06	24913
105	Database Dog Machine	9	2	2	2018-02-07 12:56:00-06	24913
106	Words Ketchup Sriracha	11	3	4	2018-12-14 14:42:00-06	24913
107	Words Fish Fish	12	3	3	2018-08-10 20:16:00-05	24913
108	Words Toad Dog	2	3	2	2019-09-20 21:54:00-05	30617
109	Shrimp Cat Fish	6	3	5	2018-11-15 10:34:00-06	30617
110	Apple Words Machine	11	2	3	2019-07-20 20:42:00-05	30617
111	Elephant Banana Cat	9	1	3	2018-12-20 18:59:00-06	30617
112	Banana Potato Computer	12	3	2	2019-10-23 14:58:00-05	30617
113	Elephant Shrimp Database	2	2	3	2019-01-03 20:59:00-06	30617
114	Potato Sriracha Computer	1	3	2	2018-02-22 14:46:00-06	30617
115	Computer Machine Apple	7	1	3	2018-09-01 14:34:00-05	30617
116	Shrimp Database Apple	10	2	4	2018-10-08 21:59:00-05	30617
117	Toad Ketchup Cat	12	3	4	2018-09-15 13:38:00-05	30617
118	Dictionary Cat Shrimp	5	2	2	2018-03-05 14:27:00-06	30617
119	Apple Elephant Database	6	3	3	2019-06-15 16:14:00-05	30617
120	Shrimp Dictionary Sriracha	3	2	2	2018-08-04 19:40:00-05	30617
121	Potato Elephant Toad	11	2	5	2019-12-28 16:16:00-06	30617
122	Words Dictionary Computer	8	1	4	2018-08-06 23:48:00-05	30617
123	Toad Machine Dictionary	1	1	2	2018-04-10 18:46:00-05	30617
124	Apple Sriracha Dog	3	2	3	2018-05-07 20:10:00-05	30617
125	Shrimp Dictionary Database	5	2	2	2018-09-22 12:55:00-05	80777
126	Database Computer Words	5	2	5	2019-05-07 12:42:00-05	80777
127	Banana Toad Sriracha	5	3	5	2019-06-15 17:59:00-05	80777
128	Toad Apple Machine	4	2	3	2018-07-05 17:33:00-05	80777
129	Potato Potato Dictionary	3	3	2	2019-01-02 11:41:00-06	41198
130	Shrimp Cat Words	9	1	5	2019-08-19 16:34:00-05	41198
131	Elephant Toad Banana	3	1	3	2018-12-06 13:30:00-06	41198
132	Ketchup Shrimp Database	7	2	2	2019-04-08 16:13:00-05	41198
133	Banana Shrimp Database	3	2	2	2019-10-21 20:39:00-05	41198
134	Banana Machine Banana	1	3	3	2019-10-03 12:14:00-05	41198
135	Dictionary Fish Fish	4	1	3	2019-10-05 13:39:00-05	41198
136	Cat Fish Ketchup	9	3	2	2019-11-16 10:17:00-06	41198
137	Elephant Toad Banana	12	2	3	2018-04-21 13:21:00-05	41198
138	Apple Fish Fish	3	1	2	2018-06-04 18:49:00-05	41198
139	Banana Dog Machine	6	3	5	2018-02-13 19:41:00-06	41198
140	Ketchup Elephant Toad	9	2	3	2018-01-02 15:38:00-06	41198
141	Words Fish Shrimp	12	3	2	2019-02-02 16:48:00-06	41198
142	Machine Apple Potato	5	3	2	2018-09-14 21:58:00-05	41198
143	Cat Sriracha Elephant	1	3	3	2019-11-09 13:13:00-06	41198
144	Sriracha Banana Database	4	1	4	2018-12-05 19:27:00-06	41198
145	Potato Machine Potato	11	2	4	2019-07-18 12:40:00-05	41198
146	Ketchup Computer Cat	11	3	3	2018-12-20 13:59:00-06	41198
147	Banana Fish Potato	8	2	2	2018-07-20 23:21:00-05	27076
148	Elephant Computer Dictionary	10	2	2	2018-01-28 12:53:00-06	27076
149	Apple Database Machine	8	1	5	2019-06-01 12:12:00-05	27076
150	Database Shrimp Computer	7	1	4	2018-11-03 12:18:00-05	27076
151	Words Computer Machine	2	3	3	2019-01-16 12:32:00-06	27076
152	Apple Apple Potato	11	2	5	2019-04-03 12:14:00-05	27076
153	Elephant Elephant Banana	8	1	5	2018-01-28 17:40:00-06	27076
154	Database Dictionary Dictionary	9	3	4	2018-12-24 22:37:00-06	27076
155	Sriracha Computer Banana	9	2	5	2018-11-05 15:18:00-06	27076
156	Words Apple Words	8	1	2	2019-07-02 22:16:00-05	27076
157	Banana Elephant Database	1	3	5	2019-08-04 20:50:00-05	27076
158	Database Machine Machine	12	2	5	2018-10-25 10:51:00-05	27076
159	Dog Ketchup Banana	3	1	4	2018-01-08 14:33:00-06	27076
160	Fish Cat Computer	7	2	5	2019-08-04 19:35:00-05	68863
161	Apple Database Fish	12	1	2	2019-01-16 11:59:00-06	68863
162	Sriracha Sriracha Computer	11	3	5	2019-05-26 22:55:00-05	68863
163	Machine Dog Toad	4	3	5	2019-11-14 23:59:00-06	68863
164	Elephant Potato Cat	1	3	4	2019-02-04 17:27:00-06	68863
165	Toad Ketchup Banana	4	3	5	2019-07-08 17:28:00-05	84086
166	Machine Banana Elephant	9	1	5	2018-05-02 18:11:00-05	84086
167	Machine Shrimp Toad	9	3	5	2018-08-20 15:11:00-05	84086
168	Dog Ketchup Elephant	7	1	3	2019-11-11 18:33:00-06	84086
169	Elephant Machine Shrimp	2	3	4	2019-12-03 13:39:00-06	84086
170	Database Shrimp Elephant	11	1	5	2019-02-28 16:35:00-06	84086
171	Database Cat Sriracha	6	2	4	2019-02-05 15:21:00-06	22889
172	Shrimp Banana Dog	5	3	2	2019-09-18 16:35:00-05	22889
173	Words Sriracha Dictionary	10	3	5	2019-05-22 21:30:00-05	22889
174	Shrimp Machine Dictionary	12	3	5	2018-04-19 15:36:00-05	22889
175	Apple Machine Elephant	5	1	5	2019-03-02 23:13:00-06	22889
176	Banana Cat Shrimp	6	2	3	2019-03-16 23:10:00-05	22889
177	Toad Cat Potato	2	1	3	2018-03-28 16:53:00-05	22889
178	Potato Machine Cat	1	2	5	2018-06-15 23:13:00-05	22889
179	Computer Potato Toad	10	1	4	2018-08-23 10:10:00-05	22889
180	Toad Potato Elephant	4	1	2	2018-02-09 11:37:00-06	22889
181	Banana Apple Toad	5	3	3	2018-03-07 18:25:00-06	22889
182	Cat Database Fish	3	3	4	2019-03-26 23:26:00-05	22889
183	Computer Cat Potato	6	3	5	2019-10-18 21:19:00-05	22889
184	Shrimp Database Elephant	11	3	2	2018-03-15 13:36:00-05	22889
185	Toad Dog Toad	12	3	4	2019-04-05 18:34:00-05	22889
186	Words Computer Shrimp	4	3	4	2018-04-23 20:21:00-05	22889
187	Apple Dictionary Dog	8	1	3	2018-06-22 13:28:00-05	32991
188	Potato Fish Potato	2	1	4	2018-12-23 10:46:00-06	32991
189	Elephant Database Computer	1	2	3	2018-10-06 23:59:00-05	32991
190	Shrimp Elephant Fish	2	3	4	2018-02-02 10:35:00-06	32991
191	Dictionary Dictionary Fish	5	3	3	2019-05-19 16:53:00-05	32991
192	Cat Apple Dictionary	11	2	2	2018-06-26 23:41:00-05	32991
193	Toad Cat Fish	1	3	5	2019-03-06 18:20:00-06	32991
194	Potato Toad Computer	12	2	2	2018-11-28 22:21:00-06	32991
195	Ketchup Shrimp Toad	4	1	2	2018-11-11 16:53:00-06	32991
196	Ketchup Computer Fish	9	1	2	2018-07-13 11:54:00-05	32991
197	Words Sriracha Sriracha	1	2	4	2018-01-24 18:26:00-06	32991
198	Apple Ketchup Elephant	12	1	5	2019-03-23 22:29:00-05	32991
199	Dog Cat Machine	6	1	3	2019-10-09 15:26:00-05	32991
200	Computer Dictionary Cat	12	1	2	2019-12-12 12:30:00-06	32991
201	Dictionary Sriracha Computer	8	1	4	2019-04-06 12:38:00-05	32991
202	Words Potato Banana	10	3	4	2019-02-14 14:46:00-06	32991
203	Elephant Dog Banana	12	3	3	2019-09-23 20:33:00-05	82453
204	Elephant Database Fish	8	1	4	2019-06-26 14:15:00-05	82453
205	Words Dog Ketchup	11	2	2	2019-04-20 22:49:00-05	82453
206	Database Toad Database	1	3	4	2019-09-27 21:26:00-05	82453
207	Potato Ketchup Fish	4	3	5	2018-03-02 21:18:00-06	82453
208	Apple Machine Ketchup	1	3	4	2018-08-26 23:21:00-05	82453
209	Elephant Computer Database	3	3	3	2019-12-08 17:26:00-06	82453
210	Computer Computer Database	5	2	4	2019-12-09 15:47:00-06	82453
211	Toad Toad Machine	7	1	3	2018-12-02 17:12:00-06	82453
212	Dictionary Sriracha Shrimp	4	3	4	2019-10-11 12:48:00-05	82453
213	Potato Shrimp Elephant	3	3	3	2018-08-08 12:45:00-05	82453
214	Words Potato Cat	9	1	2	2019-08-24 11:13:00-05	82453
215	Computer Words Toad	6	1	4	2018-12-07 14:29:00-06	82453
216	Sriracha Ketchup Fish	6	2	5	2018-11-16 14:23:00-06	82453
217	Sriracha Dictionary Banana	10	2	5	2018-05-23 19:29:00-05	82453
218	Banana Fish Shrimp	4	3	2	2018-10-14 17:27:00-05	82453
219	Potato Database Cat	6	1	5	2018-07-03 11:18:00-05	82453
220	Machine Fish Machine	7	3	5	2018-07-21 17:17:00-05	82453
221	Shrimp Elephant Words	4	3	5	2018-10-23 10:17:00-05	82453
222	Machine Machine Shrimp	4	2	5	2019-08-04 23:24:00-05	82453
223	Potato Dictionary Cat	11	3	2	2018-06-03 14:41:00-05	84637
224	Fish Shrimp Dog	5	3	4	2018-02-21 12:11:00-06	84637
225	Apple Toad Ketchup	12	3	5	2018-05-07 14:32:00-05	84637
226	Database Database Computer	11	2	4	2018-06-10 15:25:00-05	84637
227	Computer Apple Shrimp	10	3	5	2018-12-25 16:44:00-06	84637
228	Shrimp Machine Ketchup	5	1	2	2019-06-16 21:16:00-05	84637
229	Banana Computer Toad	3	1	3	2019-11-09 11:37:00-06	84637
230	Apple Sriracha Database	1	1	5	2019-08-25 15:40:00-05	84637
231	Toad Dictionary Dog	7	1	2	2019-12-14 17:37:00-06	84637
232	Fish Potato Machine	7	2	3	2018-01-11 13:52:00-06	84637
233	Elephant Cat Sriracha	12	3	3	2018-01-14 20:35:00-06	84637
234	Shrimp Computer Ketchup	10	2	3	2019-07-04 13:49:00-05	84637
235	Toad Fish Computer	5	2	4	2019-02-24 23:21:00-06	84637
236	Toad Dictionary Potato	9	1	4	2019-07-09 15:26:00-05	84637
237	Words Potato Dictionary	5	2	5	2019-06-19 14:51:00-05	84637
238	Words Sriracha Elephant	1	3	2	2018-12-24 18:34:00-06	84637
239	Dog Elephant Ketchup	1	2	4	2018-02-03 10:32:00-06	84637
240	Shrimp Potato Computer	10	2	4	2018-01-18 13:11:00-06	84637
241	Sriracha Cat Ketchup	6	1	5	2018-09-06 15:28:00-05	84637
242	Fish Apple Elephant	6	1	5	2018-09-24 11:12:00-05	38762
243	Elephant Database Database	3	1	4	2018-09-08 10:46:00-05	38762
244	Shrimp Ketchup Ketchup	9	2	5	2019-09-14 17:35:00-05	38762
245	Fish Toad Cat	6	1	3	2018-05-22 12:30:00-05	38762
246	Dictionary Fish Fish	2	2	5	2019-07-16 16:50:00-05	38762
247	Elephant Dictionary Banana	4	1	3	2018-10-05 14:49:00-05	38762
248	Dictionary Banana Cat	10	1	5	2019-02-23 21:58:00-06	38762
249	Banana Toad Apple	3	3	5	2018-05-28 23:41:00-05	38762
250	Dog Dictionary Potato	2	3	3	2019-12-24 22:23:00-06	38762
251	Sriracha Database Fish	7	3	3	2018-12-11 19:22:00-06	38762
252	Dictionary Dog Apple	1	1	5	2019-08-05 18:18:00-05	38762
253	Shrimp Shrimp Fish	6	1	5	2019-11-07 21:28:00-06	38762
254	Potato Sriracha Cat	5	1	2	2018-06-24 17:33:00-05	38762
255	Elephant Toad Database	10	2	4	2018-12-10 10:45:00-06	38762
256	Elephant Sriracha Sriracha	12	3	4	2018-02-22 13:25:00-06	83887
257	Shrimp Computer Sriracha	5	3	2	2019-11-07 17:39:00-06	83887
258	Toad Words Ketchup	11	1	4	2018-04-16 10:22:00-05	83887
259	Computer Potato Computer	6	3	2	2018-03-20 22:33:00-05	83887
260	Dictionary Database Database	10	2	3	2018-10-03 10:16:00-05	83887
261	Cat Dog Banana	4	3	5	2018-02-09 11:50:00-06	49373
262	Cat Toad Toad	7	3	4	2018-12-14 15:26:00-06	49373
263	Toad Ketchup Words	10	1	3	2019-01-10 20:39:00-06	49373
264	Cat Database Elephant	10	2	3	2019-05-04 18:47:00-05	49373
265	Words Dog Dictionary	4	3	3	2018-03-01 10:53:00-06	38681
266	Ketchup Apple Database	9	2	4	2019-12-25 20:46:00-06	38681
267	Potato Words Words	6	1	2	2018-12-08 20:10:00-06	38681
268	Words Banana Toad	6	3	2	2018-09-06 22:28:00-05	38681
269	Shrimp Machine Sriracha	8	1	3	2018-02-19 17:49:00-06	38681
270	Database Computer Database	1	2	5	2019-03-28 21:56:00-05	38681
271	Dog Apple Cat	2	1	4	2018-08-03 23:34:00-05	38681
272	Shrimp Dictionary Dictionary	12	1	2	2019-11-03 17:59:00-06	38681
273	Cat Words Apple	6	3	2	2019-01-11 16:29:00-06	38681
274	Shrimp Words Shrimp	10	3	2	2018-12-08 12:46:00-06	38681
275	Banana Dictionary Sriracha	8	3	4	2019-07-20 13:27:00-05	61627
276	Potato Ketchup Fish	6	1	4	2018-03-08 21:31:00-06	61627
277	Potato Machine Dictionary	3	3	3	2019-03-27 19:38:00-05	61627
278	Fish Banana Dog	8	1	3	2018-04-01 16:54:00-05	61627
279	Machine Toad Fish	10	3	2	2018-04-23 14:41:00-05	61627
280	Dog Banana Shrimp	2	3	4	2019-08-17 22:35:00-05	96486
281	Potato Dog Machine	1	1	2	2019-02-11 23:14:00-06	96486
282	Potato Dictionary Elephant	3	1	3	2018-11-05 21:27:00-06	96486
283	Sriracha Elephant Machine	10	2	5	2019-09-11 12:14:00-05	96486
284	Database Banana Shrimp	1	1	3	2019-07-01 11:31:00-05	96486
285	Words Sriracha Ketchup	4	2	4	2019-08-04 10:43:00-05	96486
286	Elephant Banana Shrimp	6	1	5	2018-03-02 10:42:00-06	96486
287	Potato Dog Words	4	2	2	2018-08-16 18:45:00-05	96486
288	Ketchup Apple Dog	7	2	4	2019-04-01 17:43:00-05	96486
289	Dictionary Machine Database	8	2	4	2018-01-15 17:20:00-06	96486
290	Apple Toad Words	4	1	5	2019-05-08 15:39:00-05	96486
291	Toad Banana Elephant	5	3	4	2018-09-15 11:46:00-05	96486
292	Words Dog Machine	3	2	5	2018-03-08 23:36:00-06	96486
293	Dictionary Words Shrimp	1	1	5	2018-10-21 14:37:00-05	96486
294	Database Ketchup Ketchup	3	2	3	2019-02-04 22:31:00-06	96486
295	Computer Ketchup Words	9	3	2	2019-02-27 17:10:00-06	96486
296	Apple Sriracha Database	7	2	2	2018-07-23 16:56:00-05	96486
297	Potato Banana Apple	10	2	3	2019-08-06 10:35:00-05	96486
298	Fish Ketchup Sriracha	1	2	3	2018-06-14 13:10:00-05	96486
299	Apple Sriracha Cat	2	3	3	2019-10-07 18:58:00-05	96486
300	Words Dog Banana	5	1	4	2018-02-12 20:28:00-06	30364
301	Cat Potato Shrimp	6	1	4	2019-10-25 11:44:00-05	30364
302	Database Ketchup Machine	4	1	5	2018-03-18 19:10:00-05	30364
303	Sriracha Fish Apple	1	1	2	2019-11-27 11:34:00-06	30364
304	Fish Fish Fish	11	2	4	2019-04-17 12:13:00-05	30364
305	Sriracha Cat Machine	5	1	2	2019-12-22 17:58:00-06	30364
306	Potato Toad Shrimp	6	3	4	2018-12-14 15:46:00-06	30364
307	Banana Dog Dog	8	3	3	2018-09-09 11:27:00-05	30364
308	Fish Apple Dog	1	2	4	2019-03-16 19:53:00-05	30364
309	Shrimp Shrimp Sriracha	10	2	2	2019-11-24 21:58:00-06	30364
310	Elephant Apple Database	11	2	4	2018-02-12 14:33:00-06	30364
311	Dog Cat Machine	5	2	4	2018-06-03 12:54:00-05	30364
312	Cat Dog Words	7	3	4	2019-11-24 23:14:00-06	30364
313	Shrimp Ketchup Cat	8	1	2	2019-10-04 14:43:00-05	30364
314	Machine Cat Sriracha	8	1	2	2019-01-26 20:20:00-06	30364
315	Cat Database Computer	7	2	2	2018-02-14 18:25:00-06	30364
316	Apple Dictionary Machine	8	1	2	2019-12-02 19:49:00-06	30364
317	Toad Toad Dog	11	1	3	2019-12-21 12:11:00-06	53855
318	Potato Potato Computer	11	3	3	2019-07-13 23:26:00-05	53855
319	Potato Banana Potato	6	2	2	2018-04-02 17:35:00-05	53855
320	Words Dog Computer	7	1	4	2018-05-16 14:28:00-05	53855
321	Potato Toad Sriracha	1	3	4	2019-10-23 19:51:00-05	53855
322	Toad Banana Ketchup	1	3	5	2019-12-19 15:12:00-06	53855
323	Machine Machine Machine	8	2	2	2018-12-22 10:47:00-06	53855
324	Banana Words Dictionary	3	1	5	2018-09-26 19:16:00-05	53855
325	Toad Dictionary Dog	1	1	4	2018-11-08 21:11:00-06	53855
326	Words Words Machine	1	2	2	2018-11-24 14:26:00-06	53855
327	Elephant Ketchup Computer	11	3	5	2018-03-20 13:11:00-05	53855
328	Apple Dictionary Words	4	2	4	2019-06-08 17:43:00-05	53855
329	Toad Machine Machine	3	2	3	2019-02-12 15:25:00-06	53855
330	Database Sriracha Sriracha	12	3	5	2019-06-14 12:35:00-05	53855
331	Toad Words Fish	2	1	5	2018-05-06 12:37:00-05	25508
332	Database Toad Ketchup	11	3	2	2018-03-23 13:37:00-05	25508
333	Elephant Sriracha Dictionary	12	3	2	2018-05-16 20:43:00-05	25508
334	Database Machine Ketchup	4	2	5	2018-06-14 11:24:00-05	25508
335	Computer Shrimp Apple	12	3	5	2018-05-07 13:34:00-05	25508
336	Elephant Banana Cat	9	3	5	2018-01-07 13:50:00-06	25508
337	Dictionary Sriracha Dictionary	7	2	3	2019-06-03 17:30:00-05	25508
338	Sriracha Machine Shrimp	7	1	5	2018-11-03 14:43:00-05	25508
339	Potato Potato Words	12	3	2	2018-07-13 16:45:00-05	25508
340	Potato Cat Database	5	1	4	2018-02-22 10:56:00-06	25508
341	Cat Ketchup Potato	2	3	2	2019-11-08 22:24:00-06	25508
342	Banana Toad Elephant	7	3	3	2018-02-23 23:59:00-06	25508
343	Dictionary Fish Database	9	1	3	2019-10-06 13:31:00-05	56263
344	Dictionary Database Apple	6	3	3	2019-04-15 12:24:00-05	56263
345	Dictionary Fish Machine	8	3	2	2018-03-22 19:41:00-05	56263
346	Toad Apple Toad	4	2	4	2018-01-06 15:46:00-06	56263
347	Words Dog Banana	2	2	2	2018-07-25 22:23:00-05	56263
348	Fish Cat Sriracha	9	1	5	2019-11-04 12:27:00-06	56263
349	Fish Ketchup Elephant	8	2	2	2019-03-22 13:52:00-05	56263
350	Banana Fish Apple	2	3	4	2019-05-27 10:50:00-05	56263
351	Computer Banana Banana	7	1	4	2018-12-09 10:52:00-06	56263
352	Cat Ketchup Cat	12	3	4	2018-10-16 14:15:00-05	56263
353	Apple Fish Computer	3	3	3	2018-02-11 17:56:00-06	56263
354	Sriracha Fish Computer	1	3	4	2018-03-24 15:33:00-05	56263
355	Fish Elephant Cat	12	1	5	2019-09-04 12:41:00-05	56263
356	Fish Machine Dog	2	2	2	2018-09-27 22:47:00-05	56263
357	Sriracha Machine Ketchup	11	2	3	2018-10-13 11:33:00-05	56263
358	Dictionary Database Database	6	1	3	2019-02-26 13:31:00-06	68511
359	Shrimp Toad Words	9	1	4	2018-10-25 20:55:00-05	68511
360	Sriracha Computer Dictionary	3	2	2	2018-08-21 21:59:00-05	68511
361	Potato Words Banana	9	3	4	2018-04-17 23:46:00-05	68511
362	Shrimp Computer Toad	9	3	4	2018-07-27 19:53:00-05	68511
363	Shrimp Potato Toad	2	2	4	2019-06-05 13:20:00-05	68511
364	Ketchup Dictionary Fish	4	3	2	2019-11-09 17:16:00-06	68511
365	Potato Dictionary Dog	12	2	4	2019-05-28 23:44:00-05	68511
366	Words Sriracha Banana	5	3	5	2018-12-01 11:49:00-06	68511
367	Database Ketchup Elephant	8	3	2	2019-07-15 20:15:00-05	58410
368	Dog Cat Toad	7	3	5	2018-02-13 19:47:00-06	58410
369	Database Words Dictionary	1	2	4	2019-05-04 20:12:00-05	58410
370	Cat Fish Toad	1	1	5	2018-06-04 22:38:00-05	58410
371	Sriracha Dictionary Words	11	1	2	2018-05-10 13:12:00-05	58410
372	Ketchup Cat Dog	4	3	4	2019-05-02 11:41:00-05	58410
373	Apple Machine Ketchup	3	1	2	2019-12-03 11:32:00-06	58410
374	Ketchup Fish Fish	5	2	5	2018-10-12 21:45:00-05	58410
375	Fish Database Ketchup	11	2	4	2018-11-18 13:33:00-06	58410
376	Fish Potato Cat	2	1	4	2019-01-03 18:20:00-06	37583
377	Words Dictionary Dictionary	10	3	5	2018-02-08 21:24:00-06	37583
378	Dog Banana Sriracha	4	2	2	2018-11-02 13:38:00-05	37583
379	Ketchup Database Shrimp	3	3	5	2019-11-23 10:29:00-06	37583
380	Banana Dictionary Ketchup	5	1	2	2018-07-24 10:49:00-05	37583
381	Computer Dog Toad	5	2	4	2018-06-14 21:27:00-05	37583
382	Sriracha Words Cat	12	2	4	2018-11-02 20:25:00-05	37583
383	Toad Machine Banana	3	3	3	2019-07-07 22:48:00-05	37583
384	Potato Apple Dictionary	8	1	4	2018-01-16 18:54:00-06	37583
385	Banana Sriracha Machine	3	1	5	2018-06-05 20:35:00-05	37583
386	Database Cat Computer	1	3	5	2019-11-27 14:17:00-06	37583
387	Apple Fish Potato	10	1	5	2019-02-10 19:20:00-06	37583
388	Toad Machine Dictionary	2	3	2	2019-08-10 21:52:00-05	37583
389	Potato Sriracha Words	11	1	3	2018-07-10 10:47:00-05	81340
390	Fish Machine Elephant	8	2	3	2018-03-16 19:50:00-05	81340
391	Fish Words Cat	4	2	5	2018-04-08 20:54:00-05	81340
392	Potato Dog Machine	12	2	5	2018-12-28 22:27:00-06	81340
393	Elephant Fish Sriracha	1	3	5	2018-02-05 17:48:00-06	81340
394	Ketchup Toad Dictionary	1	1	5	2019-12-11 23:33:00-06	81340
395	Computer Computer Dog	10	1	4	2018-03-20 11:15:00-05	81340
396	Fish Ketchup Toad	4	2	5	2018-06-04 19:41:00-05	81340
397	Sriracha Apple Shrimp	9	1	2	2019-07-09 19:27:00-05	81340
398	Words Machine Dog	1	3	3	2018-01-18 12:12:00-06	81340
399	Database Potato Fish	10	1	5	2019-05-09 23:58:00-05	81340
400	Words Machine Fish	3	2	3	2018-12-04 16:28:00-06	81340
401	Machine Banana Database	12	2	4	2018-08-07 16:57:00-05	65856
402	Database Shrimp Banana	11	1	2	2018-08-15 21:38:00-05	65856
403	Ketchup Dictionary Computer	1	1	2	2018-12-17 21:43:00-06	65856
404	Banana Database Computer	3	2	3	2018-02-25 15:32:00-06	65856
405	Cat Banana Shrimp	9	3	3	2019-05-14 19:57:00-05	65856
406	Computer Sriracha Ketchup	4	3	3	2019-11-23 14:20:00-06	65856
407	Sriracha Sriracha Machine	6	2	3	2019-01-16 14:41:00-06	65856
408	Sriracha Dog Apple	3	1	4	2018-11-25 10:11:00-06	65856
409	Database Machine Elephant	6	3	3	2019-01-06 16:24:00-06	65856
410	Sriracha Fish Sriracha	7	2	5	2018-01-03 21:42:00-06	65856
411	Computer Sriracha Potato	11	1	3	2019-03-17 10:49:00-05	65856
412	Potato Elephant Cat	5	1	2	2019-01-21 15:25:00-06	65856
413	Fish Ketchup Words	9	1	5	2018-01-27 16:53:00-06	65856
414	Banana Sriracha Dog	4	1	2	2018-12-17 23:15:00-06	65856
415	Toad Database Dictionary	4	1	2	2018-09-09 21:32:00-05	84487
416	Banana Apple Computer	10	2	4	2019-11-24 21:42:00-06	84487
417	Shrimp Sriracha Fish	4	3	3	2018-04-02 23:47:00-05	84487
418	Sriracha Computer Words	1	1	2	2018-10-19 20:24:00-05	84487
419	Machine Sriracha Dictionary	3	2	5	2018-04-22 21:23:00-05	84487
420	Ketchup Cat Dog	10	3	3	2018-03-20 10:50:00-05	84487
421	Cat Dictionary Banana	1	1	4	2018-09-13 17:41:00-05	84487
422	Words Fish Machine	4	2	3	2018-01-20 16:23:00-06	84487
423	Database Elephant Fish	4	1	2	2019-07-26 23:20:00-05	84487
424	Dictionary Shrimp Fish	9	3	3	2019-07-19 17:28:00-05	84487
425	Machine Banana Machine	10	3	5	2019-06-08 19:43:00-05	84487
426	Computer Machine Dog	7	3	5	2019-02-06 16:53:00-06	37711
427	Toad Elephant Database	2	1	5	2018-09-21 22:31:00-05	37711
428	Elephant Ketchup Apple	11	2	5	2019-06-16 14:28:00-05	37711
429	Database Apple Cat	3	2	2	2018-10-06 15:54:00-05	37711
430	Computer Database Machine	8	3	4	2019-02-23 18:33:00-06	37711
431	Banana Cat Words	3	3	5	2018-01-17 14:52:00-06	63005
432	Database Cat Words	2	1	3	2019-03-17 10:24:00-05	63005
433	Banana Ketchup Sriracha	3	1	5	2018-07-08 10:46:00-05	63005
434	Dictionary Computer Sriracha	4	3	5	2018-01-04 13:43:00-06	63005
435	Shrimp Cat Cat	3	2	3	2019-10-06 18:25:00-05	97543
436	Computer Database Shrimp	1	3	3	2019-04-18 15:44:00-05	97543
437	Shrimp Potato Elephant	11	3	4	2018-07-17 20:57:00-05	97543
438	Toad Dog Cat	2	2	2	2019-04-15 21:33:00-05	97543
439	Toad Banana Banana	9	3	5	2018-05-18 10:44:00-05	44403
440	Toad Fish Words	11	1	2	2019-03-19 14:59:00-05	44403
441	Fish Machine Database	10	1	3	2019-03-01 13:22:00-06	44403
442	Fish Shrimp Words	4	1	2	2019-09-24 11:42:00-05	44403
443	Dog Banana Sriracha	5	1	5	2018-10-18 10:56:00-05	44403
444	Apple Shrimp Banana	4	1	5	2019-07-25 12:50:00-05	44403
445	Shrimp Words Ketchup	4	2	3	2019-07-27 22:46:00-05	44403
446	Cat Cat Words	11	1	5	2019-09-14 23:47:00-05	44403
447	Database Cat Words	3	1	5	2018-02-09 18:47:00-06	96988
448	Database Dictionary Potato	8	2	5	2018-12-12 13:23:00-06	96988
449	Database Machine Machine	5	2	2	2018-04-06 10:27:00-05	96988
450	Words Ketchup Words	6	3	4	2018-01-06 15:53:00-06	96988
451	Words Elephant Toad	11	3	4	2019-04-03 22:43:00-05	96988
452	Shrimp Machine Machine	2	2	5	2018-01-26 19:53:00-06	96988
453	Elephant Machine Dog	5	3	2	2019-04-27 15:32:00-05	96988
454	Toad Computer Machine	8	3	4	2019-11-27 16:57:00-06	96988
455	Toad Computer Dictionary	7	3	2	2019-03-21 20:14:00-05	96988
456	Dog Computer Words	4	3	5	2018-03-10 11:56:00-06	96988
457	Dog Machine Database	2	1	5	2018-04-21 17:26:00-05	96988
458	Computer Fish Banana	7	3	3	2019-06-12 22:20:00-05	96988
459	Cat Sriracha Fish	10	1	3	2018-05-23 16:23:00-05	68608
460	Potato Database Dictionary	6	2	3	2019-04-18 18:11:00-05	68608
461	Words Elephant Dictionary	12	3	5	2019-06-23 23:41:00-05	68608
462	Elephant Cat Potato	4	1	2	2019-03-04 20:27:00-06	68608
463	Toad Machine Apple	8	1	4	2019-01-12 17:31:00-06	68608
464	Fish Words Elephant	10	1	4	2019-04-22 13:24:00-05	68608
465	Shrimp Ketchup Potato	9	3	5	2019-05-11 15:53:00-05	68608
466	Toad Potato Potato	1	1	4	2019-02-17 11:49:00-06	68608
467	Dictionary Fish Banana	11	1	4	2018-07-21 17:59:00-05	71233
468	Shrimp Machine Dictionary	5	3	2	2019-02-12 19:49:00-06	71233
469	Toad Sriracha Shrimp	12	3	4	2018-10-16 19:36:00-05	71233
470	Ketchup Sriracha Words	3	2	2	2018-05-17 13:55:00-05	71233
471	Cat Cat Potato	8	1	3	2019-12-18 12:11:00-06	71233
472	Shrimp Sriracha Machine	3	2	2	2019-11-03 17:53:00-06	95564
473	Cat Fish Machine	7	2	2	2018-01-28 15:35:00-06	95564
474	Banana Words Toad	12	2	2	2018-11-16 19:15:00-06	95564
475	Apple Database Machine	9	1	2	2018-06-14 10:42:00-05	95564
476	Apple Toad Machine	11	2	4	2019-08-09 15:38:00-05	95564
477	Machine Ketchup Sriracha	5	2	4	2019-05-24 11:34:00-05	95564
478	Ketchup Dog Cat	10	1	2	2019-08-12 12:41:00-05	95564
479	Dog Banana Elephant	8	3	4	2018-12-15 20:59:00-06	95564
480	Ketchup Banana Words	4	1	2	2019-11-08 14:54:00-06	95564
481	Machine Elephant Elephant	4	3	2	2018-07-05 19:19:00-05	95564
482	Elephant Database Potato	9	1	5	2019-08-07 11:54:00-05	95564
483	Dictionary Sriracha Banana	12	2	5	2019-03-11 14:55:00-05	95564
484	Ketchup Words Fish	11	3	3	2019-09-01 15:16:00-05	95564
485	Elephant Apple Dictionary	11	1	2	2019-07-25 15:49:00-05	95564
486	Dictionary Elephant Ketchup	11	2	2	2019-09-15 12:32:00-05	95564
487	Cat Dog Computer	12	3	5	2018-02-14 13:30:00-06	95564
488	Toad Ketchup Toad	8	3	3	2019-03-17 11:15:00-05	95564
489	Banana Dictionary Dog	7	1	2	2019-05-23 16:59:00-05	95564
490	Machine Potato Toad	9	3	2	2019-02-25 18:35:00-06	95564
491	Banana Potato Computer	5	2	3	2018-09-27 18:40:00-05	70041
492	Toad Words Machine	8	3	2	2019-02-24 15:26:00-06	70041
493	Banana Dog Words	11	3	5	2018-05-24 20:21:00-05	70041
494	Words Potato Elephant	5	2	4	2019-03-26 14:39:00-05	70041
495	Ketchup Words Toad	9	3	5	2019-03-15 14:57:00-05	70041
496	Toad Dog Potato	3	2	4	2019-06-24 20:23:00-05	70041
497	Dog Cat Dog	1	1	4	2018-02-28 12:55:00-06	70041
498	Fish Machine Elephant	10	3	3	2019-02-28 14:18:00-06	70041
499	Sriracha Sriracha Computer	8	3	2	2019-07-06 22:48:00-05	70041
500	Dog Potato Cat	8	2	2	2018-07-24 15:30:00-05	70041
501	Words Apple Apple	3	1	3	2018-07-11 17:31:00-05	70041
502	Database Dog Database	5	3	5	2018-10-23 19:23:00-05	70041
503	Banana Fish Sriracha	6	1	4	2018-09-02 23:19:00-05	37053
504	Elephant Dog Ketchup	11	1	3	2019-03-01 15:12:00-06	37053
505	Elephant Database Shrimp	5	1	3	2018-12-05 10:46:00-06	37053
506	Computer Shrimp Shrimp	3	2	3	2018-06-18 18:49:00-05	37053
507	Dog Elephant Potato	5	1	3	2018-04-26 23:54:00-05	37053
508	Words Shrimp Database	8	2	4	2018-10-16 21:29:00-05	37053
509	Words Sriracha Dictionary	12	3	4	2018-03-12 22:39:00-05	37053
510	Fish Sriracha Shrimp	6	1	4	2019-02-25 11:20:00-06	37053
511	Dog Ketchup Apple	10	2	3	2018-11-02 15:30:00-05	37053
512	Shrimp Shrimp Potato	12	2	4	2018-12-07 19:46:00-06	37053
513	Computer Sriracha Apple	5	1	4	2019-09-10 16:23:00-05	39440
514	Cat Sriracha Banana	2	2	4	2018-10-15 22:31:00-05	39440
515	Ketchup Dog Dog	4	3	2	2018-03-19 12:43:00-05	39440
516	Cat Potato Potato	6	1	5	2019-10-16 13:53:00-05	39440
517	Cat Database Computer	4	1	3	2018-06-28 21:24:00-05	39440
518	Cat Fish Words	3	1	3	2019-12-17 16:19:00-06	39440
519	Sriracha Fish Ketchup	10	2	5	2018-09-24 18:14:00-05	39440
520	Database Dictionary Computer	7	3	2	2019-03-08 16:30:00-06	39440
521	Machine Database Elephant	3	3	4	2018-11-02 10:55:00-05	39440
522	Fish Sriracha Elephant	5	3	2	2019-10-25 18:11:00-05	62667
523	Shrimp Computer Apple	1	2	2	2019-06-22 19:57:00-05	62667
524	Fish Database Banana	1	1	2	2019-07-26 11:59:00-05	62667
525	Words Computer Dog	11	1	3	2019-06-06 23:51:00-05	62667
526	Elephant Sriracha Database	7	2	2	2018-03-02 12:31:00-06	62667
527	Database Database Shrimp	12	1	5	2019-05-23 19:24:00-05	62667
528	Words Computer Potato	5	2	5	2019-04-22 10:14:00-05	62667
529	Banana Elephant Dog	8	1	3	2018-11-23 10:17:00-06	16203
530	Shrimp Database Database	4	3	3	2019-12-28 12:59:00-06	16203
531	Banana Fish Cat	7	2	5	2018-01-13 18:17:00-06	16203
532	Ketchup Words Apple	11	3	3	2018-09-28 19:25:00-05	98389
533	Apple Toad Database	1	1	2	2018-02-28 23:36:00-06	98389
534	Dog Shrimp Dictionary	3	2	4	2019-03-12 23:10:00-05	98389
535	Banana Ketchup Toad	1	2	4	2019-09-20 13:50:00-05	98389
536	Banana Toad Cat	9	1	4	2019-01-20 10:16:00-06	98389
537	Shrimp Ketchup Apple	4	3	5	2019-05-05 16:15:00-05	98389
538	Ketchup Words Banana	7	1	5	2019-04-25 16:24:00-05	98389
539	Elephant Machine Apple	2	1	3	2018-11-26 17:14:00-06	98389
540	Potato Database Database	9	2	4	2019-12-07 11:53:00-06	25456
541	Elephant Cat Computer	4	1	2	2019-01-12 15:18:00-06	25456
542	Machine Apple Database	8	2	3	2018-06-05 20:48:00-05	25456
543	Toad Banana Machine	7	3	3	2019-11-01 13:23:00-05	25456
544	Apple Ketchup Cat	3	2	5	2019-08-17 21:46:00-05	25456
545	Ketchup Sriracha Elephant	6	2	5	2018-06-06 11:34:00-05	25456
546	Cat Words Fish	12	3	3	2019-04-27 12:20:00-05	25456
547	Shrimp Banana Cat	12	2	3	2018-07-13 22:21:00-05	25456
548	Sriracha Cat Computer	11	2	3	2019-03-08 11:37:00-06	25456
549	Words Fish Computer	8	2	4	2019-12-08 13:32:00-06	25456
550	Cat Shrimp Dictionary	8	3	5	2019-06-12 17:56:00-05	25456
551	Sriracha Potato Computer	5	3	3	2018-12-08 13:30:00-06	25456
552	Cat Database Shrimp	3	3	4	2019-01-08 13:18:00-06	25456
553	Dictionary Potato Cat	2	3	3	2019-07-06 21:28:00-05	25456
554	Machine Words Apple	3	1	5	2019-12-20 10:45:00-06	25456
555	Apple Shrimp Toad	11	1	3	2018-02-25 18:42:00-06	88969
556	Computer Elephant Elephant	6	3	2	2019-03-06 11:55:00-06	88969
557	Cat Dictionary Shrimp	5	2	5	2019-12-22 16:47:00-06	88969
558	Shrimp Banana Cat	2	1	3	2018-04-02 20:11:00-05	88969
559	Database Apple Computer	4	2	3	2018-03-15 18:51:00-05	88969
560	Computer Dog Dictionary	3	3	5	2018-05-21 16:30:00-05	88969
561	Banana Machine Sriracha	4	2	4	2019-04-23 23:51:00-05	88969
562	Ketchup Dog Ketchup	9	2	5	2019-10-14 19:31:00-05	88969
563	Computer Toad Shrimp	7	2	3	2018-05-03 13:53:00-05	88969
564	Words Ketchup Computer	2	2	2	2018-08-25 10:33:00-05	88969
565	Words Ketchup Dictionary	2	1	3	2018-06-20 11:54:00-05	88969
566	Apple Ketchup Fish	4	3	3	2019-09-21 22:30:00-05	88969
567	Dog Apple Potato	8	2	2	2018-02-06 18:13:00-06	13679
568	Fish Words Cat	11	3	2	2019-09-12 23:29:00-05	13679
569	Elephant Cat Words	6	3	3	2019-02-28 23:51:00-06	13679
570	Dictionary Toad Apple	6	3	3	2018-02-13 19:27:00-06	13679
571	Words Toad Ketchup	7	2	3	2018-01-04 12:49:00-06	13679
572	Database Potato Banana	5	3	2	2019-11-17 21:16:00-06	13679
573	Fish Elephant Fish	7	2	5	2019-06-25 10:15:00-05	13679
574	Database Database Dictionary	9	1	5	2018-03-12 23:52:00-05	13679
575	Elephant Dictionary Dictionary	6	2	5	2019-03-20 18:25:00-05	13679
576	Dog Toad Shrimp	1	1	5	2019-09-20 18:41:00-05	13679
577	Fish Ketchup Fish	3	1	2	2019-05-01 23:55:00-05	13679
578	Elephant Computer Fish	8	3	2	2018-12-22 19:31:00-06	13679
579	Shrimp Database Apple	2	1	2	2019-12-11 13:42:00-06	13679
580	Shrimp Sriracha Sriracha	4	1	5	2019-07-09 13:46:00-05	13679
581	Machine Computer Sriracha	6	1	2	2019-06-10 15:24:00-05	13679
582	Dictionary Dictionary Dog	3	1	2	2018-10-22 23:48:00-05	13679
583	Cat Elephant Toad	12	1	5	2019-10-28 22:17:00-05	79931
584	Dog Elephant Computer	1	3	4	2019-07-11 10:34:00-05	79931
585	Machine Banana Dictionary	9	1	4	2019-05-04 21:11:00-05	79931
586	Elephant Banana Toad	1	3	2	2019-05-13 23:35:00-05	79931
587	Cat Dictionary Dog	1	2	4	2018-01-02 23:53:00-06	79931
588	Potato Apple Words	2	2	2	2019-04-12 15:25:00-05	79931
589	Potato Words Database	12	3	5	2018-10-15 19:58:00-05	79931
590	Elephant Ketchup Banana	12	1	4	2019-09-12 12:47:00-05	79931
591	Dog Database Apple	2	3	3	2018-07-04 17:13:00-05	79931
592	Fish Toad Apple	10	3	5	2018-08-25 11:52:00-05	79931
593	Apple Dictionary Fish	11	2	4	2019-03-06 14:23:00-06	79931
594	Dictionary Database Potato	1	1	2	2019-04-20 19:42:00-05	79931
595	Shrimp Banana Machine	8	2	2	2018-11-20 15:14:00-06	79931
596	Ketchup Toad Apple	8	2	5	2019-02-24 15:18:00-06	79931
597	Sriracha Shrimp Elephant	9	2	2	2019-08-05 18:40:00-05	79931
598	Shrimp Banana Apple	12	1	5	2019-12-07 11:18:00-06	79931
599	Shrimp Dog Ketchup	3	1	5	2019-01-17 23:31:00-06	79931
600	Banana Database Database	1	2	4	2019-05-18 17:24:00-05	61635
601	Elephant Cat Potato	6	1	4	2019-01-11 11:45:00-06	61635
602	Shrimp Machine Banana	4	1	4	2018-01-15 21:55:00-06	61635
603	Dictionary Shrimp Fish	5	2	2	2018-06-15 15:17:00-05	61635
604	Apple Machine Toad	4	3	3	2019-09-22 10:26:00-05	61635
605	Dictionary Sriracha Apple	6	2	2	2019-01-10 15:41:00-06	61635
606	Banana Ketchup Shrimp	2	3	4	2019-06-15 17:30:00-05	61635
607	Apple Toad Computer	7	2	5	2018-05-25 20:49:00-05	61635
608	Database Cat Cat	4	3	3	2019-11-10 12:48:00-06	61635
609	Apple Elephant Sriracha	4	1	4	2019-03-14 11:45:00-05	61635
610	Toad Apple Sriracha	2	2	3	2018-12-09 21:32:00-06	61635
611	Cat Fish Sriracha	1	2	5	2019-05-17 11:54:00-05	61635
612	Apple Words Machine	1	1	2	2018-04-23 12:57:00-05	61635
613	Machine Database Words	7	3	3	2018-03-08 13:39:00-06	61635
614	Dog Dog Cat	2	2	2	2019-01-13 18:50:00-06	61635
615	Database Toad Apple	12	3	5	2018-10-06 22:46:00-05	61635
616	Fish Machine Banana	6	2	2	2018-03-12 23:18:00-05	61635
617	Dictionary Dog Toad	5	2	3	2019-02-08 11:14:00-06	61635
618	Machine Fish Toad	1	3	2	2019-10-22 17:26:00-05	98714
619	Banana Dog Cat	8	3	4	2018-03-13 15:20:00-05	98714
620	Potato Words Potato	6	1	4	2018-05-24 16:15:00-05	98714
621	Computer Cat Dictionary	4	2	4	2019-07-04 10:52:00-05	50223
622	Ketchup Banana Database	4	2	2	2019-11-12 14:53:00-06	50223
623	Potato Words Computer	11	1	5	2019-11-16 13:34:00-06	50223
624	Ketchup Ketchup Shrimp	9	3	2	2019-12-06 14:47:00-06	50223
625	Dictionary Apple Computer	12	3	4	2019-06-15 19:55:00-05	50223
626	Database Machine Fish	2	2	5	2019-04-27 18:41:00-05	50223
627	Elephant Apple Ketchup	6	3	2	2018-09-04 10:30:00-05	50223
628	Ketchup Potato Computer	3	3	5	2019-11-02 11:17:00-05	50223
629	Potato Fish Elephant	11	3	4	2019-05-02 13:10:00-05	50223
630	Ketchup Cat Potato	3	3	3	2018-01-28 13:18:00-06	50223
631	Sriracha Sriracha Computer	3	2	5	2018-03-27 11:56:00-05	50223
632	Computer Sriracha Elephant	7	3	4	2019-08-18 10:46:00-05	45298
633	Ketchup Database Apple	5	1	2	2019-12-28 16:33:00-06	45298
634	Dog Database Fish	1	1	3	2019-11-02 21:48:00-05	45298
635	Potato Apple Words	6	2	2	2019-03-12 12:22:00-05	45298
636	Ketchup Cat Dictionary	7	3	5	2019-08-17 21:37:00-05	45298
637	Computer Machine Ketchup	1	1	3	2019-08-21 10:13:00-05	23358
638	Database Apple Cat	5	3	2	2019-10-21 16:58:00-05	23358
639	Elephant Fish Sriracha	9	3	3	2018-05-02 17:26:00-05	23358
640	Dog Computer Banana	9	2	5	2018-02-10 18:26:00-06	45654
641	Elephant Fish Fish	6	1	5	2019-07-13 11:19:00-05	45654
642	Dictionary Computer Banana	3	3	5	2019-02-01 11:52:00-06	45654
643	Ketchup Elephant Words	8	3	3	2018-10-27 22:20:00-05	45654
644	Toad Toad Cat	9	2	4	2019-08-23 20:17:00-05	45654
645	Apple Sriracha Machine	9	1	3	2018-06-22 22:48:00-05	45654
646	Potato Database Dog	4	2	4	2018-10-07 19:50:00-05	45654
647	Shrimp Words Database	5	1	2	2019-02-28 19:46:00-06	45654
648	Ketchup Elephant Dog	4	2	3	2019-03-12 16:58:00-05	45654
649	Banana Words Machine	1	2	5	2018-10-03 19:59:00-05	24324
650	Words Words Banana	5	3	4	2018-08-11 13:13:00-05	24324
651	Toad Machine Shrimp	3	2	5	2018-06-06 13:31:00-05	24324
652	Fish Banana Potato	11	2	5	2018-10-23 15:23:00-05	24324
653	Dictionary Words Potato	7	2	4	2018-11-16 23:27:00-06	24324
654	Cat Apple Words	10	2	4	2018-01-10 17:57:00-06	24324
655	Database Shrimp Computer	9	1	5	2018-10-24 19:49:00-05	24324
656	Potato Toad Cat	9	1	2	2019-11-24 16:51:00-06	24324
657	Fish Apple Ketchup	2	3	2	2018-04-26 14:50:00-05	24324
658	Potato Dog Elephant	1	1	4	2018-08-02 14:43:00-05	24324
659	Banana Fish Apple	5	1	3	2018-09-13 20:44:00-05	24324
660	Potato Banana Apple	11	2	2	2019-04-02 10:39:00-05	24324
661	Dictionary Banana Computer	4	3	2	2018-12-21 13:36:00-06	24324
662	Shrimp Words Potato	3	3	4	2019-07-27 10:34:00-05	24324
663	Ketchup Machine Banana	1	3	4	2019-07-28 11:26:00-05	24324
664	Machine Apple Dog	12	3	2	2018-03-09 12:38:00-06	24324
665	Banana Machine Fish	12	3	4	2019-01-12 14:22:00-06	10847
666	Dog Computer Fish	3	3	5	2019-10-15 16:52:00-05	10847
667	Shrimp Computer Elephant	3	2	3	2018-05-08 17:23:00-05	10847
668	Shrimp Potato Potato	10	3	3	2019-03-10 12:52:00-05	10847
669	Database Toad Database	11	2	3	2019-04-15 17:36:00-05	10847
670	Elephant Words Words	8	3	3	2019-09-24 21:25:00-05	10847
671	Machine Apple Sriracha	8	3	2	2019-11-21 21:16:00-06	10847
672	Banana Elephant Dog	6	2	3	2019-01-21 10:50:00-06	10847
673	Banana Dictionary Elephant	12	2	2	2019-09-17 10:12:00-05	10847
674	Computer Potato Sriracha	12	2	5	2019-04-08 12:35:00-05	10847
675	Dog Words Elephant	11	2	5	2018-07-24 23:50:00-05	10847
676	Fish Toad Apple	11	1	4	2019-07-16 11:35:00-05	10847
677	Banana Sriracha Cat	8	3	2	2019-02-13 19:35:00-06	10847
678	Words Dictionary Fish	11	3	2	2018-03-04 19:51:00-06	10847
679	Elephant Fish Apple	12	1	3	2018-06-18 10:59:00-05	10847
680	Fish Fish Machine	2	2	4	2019-08-25 21:27:00-05	67370
681	Dictionary Potato Dog	3	2	3	2019-02-09 16:25:00-06	67370
682	Words Elephant Words	10	1	2	2018-03-15 17:33:00-05	67370
683	Machine Banana Apple	7	2	5	2019-10-22 10:31:00-05	67370
684	Apple Ketchup Machine	8	1	2	2018-11-25 12:11:00-06	67370
685	Database Apple Banana	10	2	4	2018-02-02 22:22:00-06	67370
686	Dog Ketchup Sriracha	11	1	4	2018-10-24 10:32:00-05	67370
687	Cat Sriracha Fish	3	3	2	2019-02-25 15:51:00-06	67370
688	Database Banana Shrimp	9	2	3	2019-12-09 13:18:00-06	67370
689	Shrimp Elephant Apple	5	2	2	2018-05-28 11:42:00-05	67370
690	Sriracha Fish Sriracha	11	2	4	2018-07-16 18:13:00-05	67370
691	Computer Shrimp Fish	4	2	2	2019-11-09 22:17:00-06	67370
692	Dictionary Shrimp Computer	3	1	2	2019-06-11 20:36:00-05	67370
693	Dictionary Words Dictionary	6	2	2	2019-02-19 13:59:00-06	67370
694	Elephant Elephant Computer	5	1	5	2019-06-23 10:21:00-05	67370
695	Cat Ketchup Shrimp	8	2	4	2018-09-01 16:31:00-05	67370
696	Words Shrimp Elephant	9	1	5	2018-07-21 17:15:00-05	67370
697	Potato Shrimp Sriracha	1	3	3	2018-11-06 16:33:00-06	57730
698	Potato Sriracha Computer	7	3	3	2019-01-01 22:29:00-06	57730
699	Dictionary Elephant Potato	10	3	5	2018-09-14 15:15:00-05	57730
700	Sriracha Apple Database	10	3	5	2019-04-18 10:53:00-05	57730
701	Banana Sriracha Database	10	2	5	2019-11-21 13:39:00-06	57730
702	Banana Potato Shrimp	7	2	4	2019-12-13 13:15:00-06	57730
703	Sriracha Dog Dictionary	8	3	4	2018-05-24 15:26:00-05	57730
704	Machine Toad Dictionary	3	2	4	2019-04-26 23:21:00-05	57730
705	Cat Dog Fish	11	3	4	2019-01-21 19:32:00-06	57730
706	Shrimp Fish Banana	1	3	4	2019-09-28 17:22:00-05	44589
707	Toad Machine Potato	2	1	5	2018-09-25 22:42:00-05	44589
708	Banana Cat Machine	9	2	5	2019-07-28 11:21:00-05	44589
709	Ketchup Apple Elephant	9	3	2	2018-04-23 16:53:00-05	44589
710	Computer Fish Database	5	1	2	2019-07-18 10:40:00-05	44589
711	Ketchup Potato Shrimp	8	1	4	2019-04-18 13:50:00-05	44589
712	Database Elephant Cat	5	1	4	2018-12-12 11:35:00-06	44589
713	Machine Database Shrimp	2	2	4	2018-11-13 16:25:00-06	44589
714	Words Machine Sriracha	6	2	5	2019-07-19 18:19:00-05	44589
715	Words Words Database	10	3	2	2018-03-14 18:58:00-05	44589
716	Computer Computer Words	10	3	3	2019-07-02 11:23:00-05	28009
717	Toad Database Sriracha	10	3	5	2018-09-02 17:41:00-05	28009
718	Machine Database Toad	11	2	3	2018-02-07 13:25:00-06	28009
719	Shrimp Database Toad	7	2	5	2019-06-14 11:45:00-05	28009
720	Machine Potato Toad	11	1	2	2018-10-17 17:47:00-05	28009
721	Shrimp Apple Potato	4	3	4	2019-10-11 13:37:00-05	28009
722	Database Banana Computer	7	2	4	2019-11-17 11:18:00-06	23654
723	Elephant Banana Banana	5	3	3	2018-06-23 10:35:00-05	23654
724	Words Machine Banana	4	3	4	2018-11-25 17:59:00-06	23654
725	Shrimp Database Cat	10	2	4	2019-04-15 20:41:00-05	23654
726	Cat Shrimp Dictionary	6	3	5	2018-07-15 11:12:00-05	23654
727	Potato Apple Apple	5	2	5	2019-04-10 18:49:00-05	23654
728	Ketchup Words Shrimp	1	2	4	2018-11-23 12:37:00-06	23654
729	Cat Ketchup Database	5	2	5	2019-01-01 18:35:00-06	23654
730	Fish Toad Shrimp	5	1	4	2019-04-23 21:24:00-05	23654
731	Dog Computer Computer	1	1	5	2019-03-08 21:28:00-06	23654
732	Fish Toad Dictionary	8	2	4	2018-07-07 21:13:00-05	23654
733	Apple Database Banana	3	2	3	2019-01-16 21:41:00-06	23654
734	Words Apple Database	3	1	5	2018-04-26 17:16:00-05	23654
735	Toad Database Cat	4	2	5	2018-12-07 10:54:00-06	95462
736	Toad Elephant Machine	4	3	2	2019-07-08 17:29:00-05	95462
737	Shrimp Potato Fish	8	2	3	2018-08-25 11:38:00-05	95462
738	Dog Apple Elephant	8	1	2	2019-11-25 23:39:00-06	95462
739	Database Ketchup Potato	5	3	2	2018-01-11 11:50:00-06	95462
740	Ketchup Dictionary Database	9	1	2	2018-06-16 23:53:00-05	95462
741	Machine Ketchup Sriracha	2	1	5	2018-03-24 20:14:00-05	95462
742	Potato Words Dog	7	3	2	2019-04-11 18:23:00-05	95462
743	Shrimp Sriracha Ketchup	9	2	2	2019-09-24 20:57:00-05	95462
744	Cat Apple Words	6	3	4	2019-02-06 14:28:00-06	95462
745	Dog Potato Machine	1	3	4	2018-04-11 23:23:00-05	95462
746	Shrimp Dog Dictionary	4	1	4	2018-06-18 19:58:00-05	95462
747	Toad Elephant Computer	8	1	4	2019-10-19 21:39:00-05	95462
748	Ketchup Elephant Computer	1	1	4	2018-10-18 16:44:00-05	95462
749	Elephant Words Potato	3	1	2	2019-10-07 19:50:00-05	95462
750	Words Elephant Database	7	3	2	2018-06-20 20:48:00-05	95462
751	Elephant Banana Toad	3	1	3	2018-11-05 18:10:00-06	95462
752	Dog Toad Computer	7	3	2	2018-01-13 17:43:00-06	95462
753	Dictionary Sriracha Cat	8	3	2	2019-03-13 23:41:00-05	86491
754	Computer Fish Cat	5	3	3	2019-10-13 16:38:00-05	86491
755	Dictionary Apple Banana	4	2	4	2019-04-19 13:14:00-05	86491
756	Potato Dog Toad	4	1	2	2018-12-19 19:14:00-06	77089
757	Elephant Apple Computer	2	2	4	2018-08-16 19:11:00-05	77089
758	Toad Machine Banana	2	2	3	2018-05-28 20:20:00-05	77089
759	Sriracha Database Machine	7	2	2	2018-11-02 22:22:00-05	77089
760	Potato Ketchup Computer	6	2	2	2018-07-08 20:48:00-05	77089
761	Sriracha Words Cat	9	3	4	2019-09-10 10:21:00-05	84366
762	Toad Dog Ketchup	9	2	4	2019-01-24 20:40:00-06	84366
763	Banana Toad Sriracha	4	1	3	2018-11-27 14:26:00-06	84366
764	Fish Ketchup Dog	1	1	3	2018-09-08 14:54:00-05	84366
765	Toad Shrimp Toad	8	3	5	2018-10-16 16:44:00-05	84366
766	Ketchup Shrimp Dog	2	2	2	2018-06-22 16:14:00-05	84366
767	Elephant Dog Fish	9	3	3	2019-03-11 11:41:00-05	84366
768	Machine Dictionary Shrimp	3	2	3	2018-09-16 12:49:00-05	84366
769	Dog Banana Apple	12	2	5	2018-03-27 21:42:00-05	84366
770	Ketchup Database Potato	9	3	2	2019-11-15 15:39:00-06	84366
771	Computer Banana Words	10	2	4	2019-05-26 18:10:00-05	84366
772	Fish Cat Cat	3	2	2	2018-04-08 17:42:00-05	84366
773	Database Elephant Shrimp	6	1	2	2019-08-08 17:10:00-05	87186
774	Words Cat Elephant	2	2	5	2019-03-28 22:58:00-05	87186
775	Database Elephant Machine	12	3	5	2019-02-21 18:25:00-06	87186
776	Words Database Potato	8	1	2	2018-06-19 20:18:00-05	87186
777	Potato Fish Fish	3	1	5	2018-09-24 16:56:00-05	87186
778	Apple Apple Database	9	1	3	2019-08-19 10:52:00-05	87186
779	Machine Machine Toad	8	3	5	2019-10-03 13:17:00-05	87186
780	Toad Dictionary Words	7	1	4	2019-06-11 20:36:00-05	87186
781	Banana Apple Toad	6	1	5	2019-05-17 10:35:00-05	87186
782	Fish Cat Words	10	3	3	2018-01-01 22:51:00-06	81231
783	Computer Machine Words	1	3	4	2018-05-07 13:41:00-05	81231
784	Toad Cat Words	4	1	2	2018-04-02 10:43:00-05	81231
785	Fish Potato Elephant	12	2	5	2018-07-18 23:17:00-05	81231
786	Ketchup Dog Database	12	3	3	2019-06-11 23:38:00-05	81231
787	Dictionary Toad Apple	12	1	4	2018-08-23 18:30:00-05	81231
788	Apple Ketchup Ketchup	3	2	4	2019-05-12 22:31:00-05	81231
789	Ketchup Banana Potato	1	2	2	2019-12-02 18:42:00-06	81231
790	Sriracha Cat Computer	5	2	5	2018-12-06 19:21:00-06	81231
791	Apple Sriracha Cat	4	3	5	2019-02-02 22:21:00-06	81231
792	Toad Dictionary Computer	5	3	5	2019-05-25 14:20:00-05	81231
793	Apple Shrimp Toad	4	1	4	2018-07-28 17:15:00-05	81231
794	Database Dictionary Apple	9	2	2	2019-07-12 23:36:00-05	81231
795	Dog Dictionary Machine	10	3	3	2019-05-17 20:10:00-05	95446
796	Potato Apple Toad	3	1	5	2018-03-27 16:48:00-05	95446
797	Sriracha Computer Potato	8	2	4	2018-09-27 22:18:00-05	95446
798	Banana Apple Apple	3	3	2	2018-06-18 11:14:00-05	95446
799	Fish Toad Computer	7	1	2	2019-01-03 10:58:00-06	95446
800	Machine Shrimp Computer	8	2	3	2018-04-20 11:14:00-05	95446
801	Banana Cat Dictionary	3	3	3	2018-08-13 20:23:00-05	95446
802	Elephant Elephant Cat	3	1	2	2019-06-20 21:37:00-05	95446
803	Database Fish Banana	4	2	5	2019-05-01 20:38:00-05	95446
804	Toad Ketchup Banana	8	3	2	2018-01-26 19:50:00-06	95446
805	Words Ketchup Machine	4	3	5	2019-06-12 19:45:00-05	95446
806	Words Dog Banana	4	1	4	2019-12-13 19:36:00-06	95446
807	Apple Banana Ketchup	10	1	5	2019-03-10 20:48:00-05	95446
808	Elephant Elephant Words	6	1	3	2018-11-06 13:28:00-06	67170
809	Cat Elephant Dog	9	2	5	2018-02-18 20:16:00-06	67170
810	Apple Banana Words	2	3	5	2019-05-28 15:39:00-05	67170
811	Toad Cat Dog	4	2	4	2018-01-23 17:25:00-06	67170
812	Banana Sriracha Dictionary	10	1	3	2018-08-10 17:27:00-05	67170
813	Dog Toad Shrimp	2	3	5	2018-05-11 14:21:00-05	67170
814	Fish Shrimp Shrimp	10	2	2	2018-07-01 22:12:00-05	67170
815	Sriracha Ketchup Machine	3	2	2	2018-01-21 17:50:00-06	67170
816	Machine Elephant Cat	8	2	5	2019-04-27 14:40:00-05	67170
817	Computer Apple Banana	8	2	3	2019-02-09 14:43:00-06	67170
818	Database Banana Database	9	1	2	2018-08-01 13:25:00-05	67170
819	Apple Apple Elephant	6	3	4	2019-12-13 12:28:00-06	67170
820	Toad Cat Dog	1	3	2	2018-05-14 23:44:00-05	67170
821	Machine Elephant Shrimp	8	2	3	2018-07-20 22:27:00-05	70148
822	Machine Toad Potato	6	2	5	2018-01-06 17:58:00-06	70148
823	Banana Dictionary Dog	3	2	3	2019-02-13 12:31:00-06	70148
824	Potato Banana Database	2	1	2	2018-02-26 21:31:00-06	70148
825	Fish Dictionary Cat	11	3	3	2018-04-19 12:46:00-05	70148
826	Toad Database Computer	9	3	3	2019-02-16 18:32:00-06	70148
827	Elephant Toad Elephant	1	1	3	2018-08-28 18:20:00-05	70148
828	Banana Machine Dictionary	7	1	4	2018-07-03 13:16:00-05	70148
829	Dictionary Machine Fish	8	1	5	2018-11-23 15:59:00-06	70148
830	Elephant Potato Toad	6	2	5	2019-06-02 20:11:00-05	70148
831	Elephant Words Sriracha	11	3	3	2019-12-21 10:55:00-06	70148
832	Computer Database Cat	8	2	4	2018-11-12 12:25:00-06	95947
833	Dog Potato Potato	12	3	2	2019-12-07 12:43:00-06	95947
834	Computer Computer Toad	2	1	4	2019-06-27 18:46:00-05	95947
835	Sriracha Elephant Dog	9	3	3	2018-12-28 10:19:00-06	95947
836	Ketchup Dog Shrimp	3	1	3	2019-06-05 22:36:00-05	95947
837	Dog Machine Toad	8	3	2	2018-08-10 16:14:00-05	95947
838	Cat Dictionary Apple	9	1	2	2019-04-08 14:13:00-05	95947
839	Computer Sriracha Apple	8	2	2	2019-05-15 11:26:00-05	95947
840	Potato Dog Sriracha	2	1	5	2018-04-24 11:49:00-05	95947
841	Toad Sriracha Computer	4	1	4	2018-07-19 18:45:00-05	95947
842	Ketchup Potato Computer	7	2	4	2019-10-19 14:38:00-05	95947
843	Fish Machine Computer	1	3	3	2018-11-06 23:31:00-06	95947
844	Dictionary Words Toad	8	1	5	2018-07-04 10:55:00-05	95947
845	Toad Ketchup Toad	7	3	3	2019-01-20 10:36:00-06	95947
846	Database Apple Sriracha	11	2	3	2018-01-22 10:47:00-06	95947
847	Shrimp Words Words	7	1	5	2019-06-16 22:46:00-05	95947
848	Dictionary Potato Cat	3	3	2	2019-03-26 20:27:00-05	95947
849	Elephant Machine Machine	1	3	4	2018-12-27 11:46:00-06	95947
850	Sriracha Dog Dog	7	2	2	2018-05-06 11:14:00-05	95947
851	Elephant Dog Machine	4	1	4	2019-12-10 22:29:00-06	43295
852	Elephant Banana Elephant	3	1	3	2018-06-13 15:42:00-05	43295
853	Sriracha Fish Banana	8	1	2	2018-08-04 21:57:00-05	43295
854	Cat Dog Ketchup	6	1	5	2018-01-25 19:36:00-06	43295
855	Fish Ketchup Computer	2	1	4	2019-03-19 11:37:00-05	43295
856	Shrimp Dog Potato	12	1	3	2019-08-27 18:51:00-05	43295
857	Apple Cat Shrimp	7	2	3	2018-05-25 14:55:00-05	43295
858	Potato Dictionary Toad	12	3	3	2019-07-15 23:30:00-05	43295
859	Fish Cat Machine	10	3	3	2019-06-04 13:30:00-05	43295
860	Ketchup Computer Database	9	2	4	2018-02-18 12:29:00-06	43295
861	Cat Elephant Apple	8	1	5	2019-09-01 18:22:00-05	43295
862	Banana Potato Words	8	1	3	2019-02-26 20:50:00-06	43295
863	Potato Fish Fish	12	2	5	2018-09-28 13:59:00-05	43295
864	Computer Machine Computer	8	1	2	2019-04-01 22:24:00-05	43295
865	Elephant Apple Toad	5	1	5	2019-11-07 13:43:00-06	43295
866	Sriracha Banana Cat	11	1	3	2018-07-16 15:33:00-05	43295
867	Computer Fish Shrimp	9	2	5	2018-05-11 15:54:00-05	43295
868	Shrimp Computer Dictionary	6	2	5	2018-08-23 19:23:00-05	59111
869	Banana Ketchup Shrimp	10	3	3	2019-01-23 22:16:00-06	59111
870	Machine Fish Toad	10	3	4	2019-03-10 22:29:00-05	59111
871	Sriracha Dog Machine	8	2	3	2018-03-25 15:47:00-05	59111
872	Fish Dog Dictionary	4	3	3	2018-07-12 20:49:00-05	59111
873	Banana Ketchup Toad	4	2	5	2018-01-10 22:42:00-06	59111
874	Banana Ketchup Toad	5	2	5	2018-05-21 12:11:00-05	83013
875	Toad Toad Cat	10	2	4	2019-08-27 12:22:00-05	83013
876	Fish Cat Words	1	2	2	2018-06-21 15:47:00-05	83013
877	Ketchup Fish Shrimp	2	1	4	2019-09-09 10:19:00-05	83013
878	Words Potato Computer	8	3	2	2018-07-11 17:22:00-05	83013
879	Cat Database Sriracha	8	2	3	2018-08-06 21:23:00-05	83013
880	Sriracha Banana Cat	1	2	4	2018-09-16 10:32:00-05	83013
881	Apple Banana Sriracha	12	3	3	2018-04-07 16:22:00-05	83013
882	Shrimp Banana Fish	3	3	4	2019-07-19 14:19:00-05	83013
883	Computer Apple Shrimp	10	1	5	2018-09-12 23:31:00-05	83013
884	Banana Sriracha Apple	3	1	4	2019-06-03 14:44:00-05	83013
885	Sriracha Shrimp Computer	5	3	4	2019-11-04 18:47:00-06	83013
886	Shrimp Fish Machine	2	3	4	2018-12-18 12:54:00-06	35521
887	Cat Dog Machine	1	1	3	2018-01-10 23:10:00-06	35521
888	Potato Shrimp Words	1	1	5	2019-03-21 22:16:00-05	35521
889	Dictionary Shrimp Machine	5	1	4	2018-09-25 15:13:00-05	82015
890	Fish Machine Fish	4	3	5	2018-02-05 10:33:00-06	82015
891	Machine Fish Computer	8	2	5	2018-02-09 11:10:00-06	82015
892	Sriracha Dog Computer	5	3	5	2019-09-02 12:45:00-05	82015
893	Banana Shrimp Ketchup	10	1	4	2018-04-10 13:47:00-05	82015
894	Potato Dog Toad	9	3	3	2018-08-15 12:20:00-05	82015
895	Words Shrimp Sriracha	7	1	3	2018-11-19 20:22:00-06	82015
896	Dictionary Potato Apple	9	1	3	2019-11-28 11:55:00-06	82015
897	Banana Banana Machine	5	1	2	2019-08-12 18:26:00-05	82015
898	Potato Potato Elephant	1	1	2	2019-06-16 21:48:00-05	82015
899	Machine Fish Banana	5	3	4	2018-06-27 23:14:00-05	82015
900	Database Dog Potato	2	1	2	2018-01-18 18:55:00-06	82015
901	Machine Ketchup Toad	11	3	3	2018-09-09 19:53:00-05	82015
902	Toad Ketchup Sriracha	3	1	5	2018-06-09 16:45:00-05	82015
903	Shrimp Fish Machine	5	2	2	2019-04-26 15:33:00-05	82015
904	Apple Computer Ketchup	6	2	5	2018-08-10 13:40:00-05	82015
905	Machine Cat Machine	6	2	2	2019-03-22 11:18:00-05	82015
906	Dictionary Sriracha Shrimp	3	3	2	2019-02-05 16:36:00-06	82015
907	Dictionary Sriracha Words	11	2	3	2018-09-05 14:39:00-05	84838
908	Shrimp Ketchup Ketchup	10	2	3	2018-12-05 12:13:00-06	84838
909	Cat Toad Cat	6	3	4	2018-01-19 17:20:00-06	84838
910	Banana Toad Shrimp	4	2	3	2019-05-02 17:12:00-05	84838
911	Dictionary Ketchup Banana	6	2	3	2018-08-14 10:34:00-05	84838
912	Computer Sriracha Database	12	1	3	2018-12-09 21:49:00-06	84838
913	Words Banana Elephant	10	2	4	2018-09-08 18:20:00-05	84838
914	Apple Fish Sriracha	1	1	4	2018-01-24 22:46:00-06	84838
915	Cat Shrimp Sriracha	9	1	4	2018-05-24 20:28:00-05	84838
916	Dog Potato Words	7	1	2	2018-09-05 17:15:00-05	84838
917	Computer Apple Computer	9	2	3	2019-06-27 14:35:00-05	84838
918	Banana Cat Potato	2	1	5	2018-07-27 14:16:00-05	84838
919	Banana Sriracha Dog	6	3	5	2019-06-19 14:47:00-05	84838
920	Dictionary Banana Computer	2	1	5	2018-01-14 17:53:00-06	84838
921	Cat Dictionary Computer	9	1	3	2019-02-21 15:28:00-06	84838
922	Ketchup Dictionary Dictionary	3	3	3	2019-01-05 14:24:00-06	84838
923	Banana Potato Apple	9	1	3	2018-03-26 23:29:00-05	39709
924	Computer Potato Banana	7	3	5	2019-01-01 17:20:00-06	39709
925	Cat Toad Sriracha	5	1	2	2019-07-07 12:50:00-05	39709
926	Dictionary Fish Words	8	2	3	2018-07-05 13:53:00-05	39709
927	Dog Words Dictionary	8	2	5	2019-07-04 11:59:00-05	39709
928	Machine Database Banana	4	1	2	2018-04-07 14:35:00-05	39709
929	Sriracha Machine Dictionary	3	2	5	2019-01-10 19:17:00-06	39709
930	Cat Fish Apple	11	1	2	2018-02-01 11:10:00-06	39709
931	Machine Fish Potato	8	1	5	2018-12-10 20:11:00-06	39709
932	Apple Dictionary Elephant	1	2	3	2018-02-15 16:24:00-06	54341
933	Apple Computer Fish	8	3	5	2018-07-23 17:28:00-05	54341
934	Elephant Cat Dictionary	3	2	2	2018-05-05 14:57:00-05	54341
935	Sriracha Fish Computer	2	2	5	2019-03-13 15:21:00-05	54341
936	Computer Machine Sriracha	1	2	3	2018-11-06 18:42:00-06	54341
937	Banana Apple Potato	9	2	5	2018-09-11 22:50:00-05	54341
938	Apple Apple Potato	6	1	4	2018-10-04 21:55:00-05	54341
939	Machine Dictionary Apple	7	1	3	2018-06-13 14:48:00-05	54341
940	Shrimp Cat Computer	11	3	5	2018-07-18 10:30:00-05	54341
941	Banana Ketchup Elephant	5	3	4	2019-02-24 10:11:00-06	54341
942	Database Apple Fish	1	3	5	2018-03-06 13:30:00-06	54341
943	Potato Potato Ketchup	8	3	4	2019-07-23 15:30:00-05	54341
944	Banana Cat Apple	2	3	4	2018-05-17 19:12:00-05	54341
945	Apple Sriracha Database	5	2	5	2018-09-22 16:53:00-05	54341
946	Cat Fish Banana	10	1	3	2019-03-27 14:42:00-05	54341
947	Potato Fish Computer	10	3	4	2019-12-12 13:20:00-06	54341
948	Potato Sriracha Toad	1	2	4	2018-10-04 17:33:00-05	54341
949	Shrimp Ketchup Words	9	2	2	2019-03-03 22:31:00-06	20927
950	Cat Toad Banana	7	3	5	2019-02-05 13:23:00-06	20927
951	Machine Toad Words	10	1	2	2018-11-27 20:13:00-06	20927
952	Apple Elephant Dictionary	2	2	2	2019-01-18 15:29:00-06	20927
953	Fish Ketchup Database	5	3	3	2019-01-12 21:48:00-06	37823
954	Machine Computer Machine	11	1	3	2019-04-03 23:21:00-05	37823
955	Sriracha Banana Sriracha	10	2	5	2018-11-10 17:12:00-06	37823
956	Dog Potato Dog	10	1	5	2018-03-05 17:10:00-06	37823
957	Apple Banana Banana	3	3	4	2018-02-26 19:19:00-06	37823
958	Banana Fish Ketchup	12	2	4	2018-04-09 10:50:00-05	37823
959	Toad Toad Potato	7	3	5	2019-06-13 18:59:00-05	37823
960	Apple Words Machine	5	3	3	2018-05-14 19:53:00-05	37823
961	Cat Apple Machine	1	3	4	2018-05-19 12:42:00-05	37823
962	Banana Banana Ketchup	4	1	4	2019-11-25 20:31:00-06	37823
963	Potato Dictionary Sriracha	11	3	5	2018-10-14 11:57:00-05	37823
964	Machine Banana Ketchup	2	3	3	2019-12-26 18:37:00-06	37823
965	Elephant Cat Fish	11	2	3	2018-09-24 15:58:00-05	37823
966	Toad Dictionary Shrimp	5	3	3	2018-07-21 13:13:00-05	37823
967	Database Potato Ketchup	5	2	5	2019-01-12 21:56:00-06	37823
968	Apple Banana Fish	6	2	2	2019-01-27 18:44:00-06	37823
969	Database Potato Sriracha	12	1	4	2019-11-06 18:32:00-06	37823
970	Sriracha Banana Banana	3	3	5	2019-02-15 16:45:00-06	37823
971	Computer Elephant Apple	10	2	3	2018-03-27 19:44:00-05	37823
972	Cat Sriracha Dog	5	1	2	2018-10-17 11:40:00-05	98419
973	Sriracha Database Dictionary	4	3	3	2018-05-04 20:17:00-05	98419
974	Dog Potato Cat	6	3	2	2018-05-04 17:19:00-05	98419
975	Dictionary Dictionary Toad	9	1	5	2019-05-08 21:18:00-05	98419
976	Toad Apple Words	9	3	3	2018-05-06 22:26:00-05	22698
977	Dog Machine Database	4	2	4	2019-11-15 23:45:00-06	22698
978	Banana Machine Dog	9	3	2	2019-06-16 20:39:00-05	22698
979	Words Machine Dog	12	3	3	2019-01-16 23:58:00-06	22698
980	Apple Ketchup Banana	1	2	4	2018-11-11 18:39:00-06	22698
981	Toad Cat Shrimp	7	2	4	2018-03-07 19:24:00-06	22698
982	Dog Ketchup Computer	12	2	4	2019-06-07 22:58:00-05	25444
983	Shrimp Fish Sriracha	3	2	3	2019-12-04 15:52:00-06	25444
984	Ketchup Toad Ketchup	3	3	4	2019-10-25 10:32:00-05	25444
985	Cat Shrimp Shrimp	9	3	4	2019-08-12 18:20:00-05	25444
986	Ketchup Dog Dog	9	1	4	2018-06-09 11:15:00-05	25444
987	Cat Dictionary Apple	9	1	4	2018-06-20 17:14:00-05	18085
988	Banana Banana Cat	8	3	3	2018-12-05 17:59:00-06	18085
989	Words Toad Shrimp	1	3	5	2018-04-08 21:12:00-05	18085
990	Cat Cat Sriracha	8	2	2	2019-02-10 17:22:00-06	18085
991	Ketchup Elephant Shrimp	5	3	2	2018-07-08 13:39:00-05	18085
992	Potato Machine Words	3	3	4	2019-02-06 10:33:00-06	18085
993	Cat Dictionary Cat	8	1	2	2019-03-20 11:32:00-05	89050
994	Machine Shrimp Ketchup	7	2	3	2018-01-15 19:56:00-06	89050
995	Toad Toad Shrimp	10	2	3	2019-08-09 20:34:00-05	89050
996	Database Computer Toad	5	1	4	2018-03-18 18:36:00-05	89050
997	Dog Dog Elephant	5	1	4	2018-07-10 22:14:00-05	89050
998	Cat Sriracha Sriracha	6	3	3	2018-09-09 11:41:00-05	89050
999	Database Machine Dictionary	3	1	3	2019-03-02 20:47:00-06	89050
1000	Sriracha Dog Shrimp	6	3	3	2018-03-18 18:13:00-05	89050
1001	Fish Banana Dictionary	2	1	4	2019-09-13 23:57:00-05	89050
1002	Dog Potato Elephant	7	2	5	2018-05-07 18:42:00-05	89050
1003	Toad Database Machine	12	3	4	2019-12-20 22:24:00-06	89050
1004	Banana Database Potato	5	2	4	2018-04-16 15:28:00-05	89050
1005	Ketchup Machine Shrimp	4	2	3	2019-02-05 20:31:00-06	89050
1006	Shrimp Toad Computer	5	3	3	2018-03-05 16:35:00-06	89050
1007	Banana Apple Dictionary	2	1	2	2019-12-26 18:21:00-06	89050
1008	Banana Apple Machine	10	1	4	2018-08-12 15:10:00-05	29363
1009	Dictionary Dictionary Dictionary	2	3	4	2018-06-01 10:57:00-05	29363
1010	Sriracha Elephant Sriracha	10	2	4	2019-10-03 16:30:00-05	29363
1011	Dictionary Cat Machine	5	2	4	2018-02-28 19:55:00-06	29363
1012	Apple Banana Words	11	1	5	2019-02-01 10:35:00-06	29363
1013	Shrimp Banana Dictionary	8	3	5	2018-01-15 20:59:00-06	29363
1014	Database Database Toad	7	1	4	2019-10-10 13:14:00-05	29363
1015	Shrimp Banana Toad	6	2	2	2018-08-28 20:24:00-05	29363
1016	Shrimp Dictionary Ketchup	2	2	5	2019-07-28 18:59:00-05	29363
1017	Machine Potato Sriracha	7	1	5	2019-06-08 21:37:00-05	29363
1018	Dog Sriracha Words	3	3	4	2018-05-06 15:22:00-05	29363
1019	Dog Apple Words	10	3	3	2019-11-12 10:18:00-06	29363
1020	Machine Potato Ketchup	6	1	4	2018-06-04 16:12:00-05	29363
1021	Dog Ketchup Sriracha	2	1	5	2018-03-24 12:25:00-05	29363
1022	Cat Words Apple	5	2	4	2018-10-25 11:45:00-05	42530
1023	Apple Apple Ketchup	5	2	3	2019-12-24 19:30:00-06	42530
1024	Words Elephant Shrimp	9	3	5	2019-04-10 11:25:00-05	42530
1025	Toad Dictionary Shrimp	3	1	3	2018-09-27 19:20:00-05	27746
1026	Machine Dictionary Dog	6	1	3	2018-12-09 10:29:00-06	27746
1027	Potato Dictionary Words	4	2	2	2019-02-14 22:39:00-06	27746
1028	Banana Dictionary Dictionary	1	1	3	2019-07-14 12:40:00-05	27746
1029	Dictionary Apple Database	11	2	2	2018-05-24 23:32:00-05	27746
1030	Fish Toad Fish	2	2	5	2019-08-25 20:31:00-05	27746
1031	Computer Computer Ketchup	10	3	2	2018-03-05 16:52:00-06	27746
1032	Database Dog Fish	11	2	4	2019-11-08 22:48:00-06	27746
1033	Fish Ketchup Dictionary	9	2	5	2019-08-12 21:17:00-05	27746
1034	Dictionary Sriracha Banana	8	2	2	2018-08-12 14:38:00-05	87230
1035	Apple Ketchup Computer	8	1	4	2018-12-04 10:21:00-06	87230
1036	Sriracha Potato Dog	1	3	3	2019-09-21 13:26:00-05	87230
1037	Apple Shrimp Dictionary	3	1	5	2018-01-14 14:22:00-06	87230
1038	Dictionary Banana Toad	6	3	2	2018-02-20 13:44:00-06	87230
1039	Words Machine Ketchup	7	1	2	2019-02-13 23:46:00-06	87230
1040	Machine Fish Words	5	3	4	2018-10-22 23:35:00-05	87230
1041	Elephant Shrimp Banana	2	1	4	2019-10-19 20:37:00-05	87230
1042	Dictionary Database Potato	1	2	4	2018-02-24 12:56:00-06	87230
1043	Fish Shrimp Potato	10	1	3	2018-09-17 10:45:00-05	87230
1044	Database Elephant Sriracha	9	2	5	2019-04-28 10:37:00-05	87230
1045	Machine Words Computer	5	2	3	2018-06-25 14:11:00-05	87230
1046	Computer Cat Sriracha	10	3	3	2018-12-05 14:31:00-06	87230
1047	Database Apple Elephant	2	1	5	2019-05-13 20:35:00-05	87230
1048	Cat Dog Potato	5	2	2	2019-08-14 20:27:00-05	35185
1049	Machine Apple Potato	7	2	2	2019-01-14 10:54:00-06	35185
1050	Database Dictionary Banana	6	2	5	2019-05-26 19:37:00-05	35185
1051	Apple Cat Dog	6	1	3	2019-08-19 22:25:00-05	35185
1052	Dictionary Banana Fish	5	1	4	2019-12-18 11:47:00-06	35185
1053	Dog Shrimp Computer	7	3	3	2019-01-27 15:56:00-06	35185
1054	Computer Database Sriracha	11	2	4	2018-03-14 10:39:00-05	35185
1055	Toad Database Toad	7	2	3	2019-10-13 14:23:00-05	35185
1056	Apple Dog Ketchup	7	2	5	2019-02-19 18:27:00-06	35185
1057	Machine Elephant Database	1	2	4	2018-05-23 14:17:00-05	35185
1058	Database Fish Elephant	4	2	4	2019-12-06 21:58:00-06	35185
1059	Dog Cat Potato	8	2	5	2019-11-18 14:14:00-06	35185
1060	Words Computer Ketchup	12	1	4	2018-10-12 10:18:00-05	77886
1061	Computer Potato Computer	4	3	4	2018-09-14 15:27:00-05	77886
1062	Shrimp Elephant Computer	8	1	5	2019-09-16 21:29:00-05	77886
1063	Dictionary Machine Toad	11	2	2	2019-05-27 20:44:00-05	77886
1064	Shrimp Ketchup Elephant	11	3	5	2019-05-28 14:43:00-05	96474
1065	Dictionary Toad Fish	6	2	4	2019-12-27 18:58:00-06	96474
1066	Ketchup Machine Dog	12	3	2	2019-03-19 11:58:00-05	96474
1067	Ketchup Database Machine	9	3	3	2019-03-11 15:41:00-05	96474
1068	Elephant Computer Words	10	2	4	2019-08-16 19:25:00-05	96474
1069	Machine Ketchup Elephant	1	2	5	2019-05-15 11:26:00-05	96474
1070	Banana Banana Words	1	1	4	2019-03-16 21:29:00-05	96474
1071	Dictionary Words Dog	9	3	3	2018-01-07 15:30:00-06	96474
1072	Words Potato Potato	7	1	4	2019-06-05 13:22:00-05	96474
1073	Banana Potato Words	4	3	4	2018-09-05 10:40:00-05	96474
1074	Fish Elephant Dictionary	8	2	5	2019-07-17 10:17:00-05	96474
1075	Database Shrimp Dictionary	10	2	3	2019-03-01 11:31:00-06	96474
1076	Potato Fish Database	7	3	5	2018-04-23 11:52:00-05	96474
1077	Machine Cat Words	5	3	3	2018-08-03 19:27:00-05	96474
1078	Dictionary Database Dictionary	2	3	2	2019-04-14 17:19:00-05	96474
1079	Database Cat Words	6	1	2	2019-11-08 10:38:00-06	96474
1080	Toad Database Words	3	2	3	2019-10-25 17:39:00-05	96474
1081	Potato Machine Dictionary	11	2	3	2019-08-10 12:27:00-05	96474
1082	Fish Dictionary Computer	3	3	4	2018-01-25 17:52:00-06	33736
1083	Sriracha Dictionary Words	9	2	2	2018-05-22 14:58:00-05	33736
1084	Toad Apple Banana	4	3	2	2018-06-14 15:47:00-05	33736
1085	Computer Toad Potato	9	1	5	2018-07-18 10:58:00-05	33736
1086	Banana Sriracha Cat	12	1	4	2019-04-07 14:53:00-05	33736
1087	Shrimp Words Shrimp	3	2	4	2018-07-22 20:57:00-05	33736
1088	Elephant Database Ketchup	5	2	3	2018-02-01 23:43:00-06	33736
1089	Banana Cat Words	7	2	3	2019-01-19 18:19:00-06	33736
1090	Elephant Shrimp Database	8	2	3	2018-09-28 15:25:00-05	33736
1091	Potato Sriracha Sriracha	9	1	2	2018-07-17 12:48:00-05	33736
1092	Machine Dog Cat	4	3	2	2019-11-24 21:33:00-06	33736
1093	Potato Fish Toad	10	1	2	2018-12-13 13:25:00-06	33736
1094	Potato Sriracha Shrimp	1	1	3	2019-03-09 15:48:00-06	82898
1095	Elephant Sriracha Dog	3	1	3	2018-11-08 14:10:00-06	82898
1096	Apple Words Fish	4	3	5	2018-07-01 20:57:00-05	82898
1097	Computer Sriracha Cat	9	3	5	2019-06-24 13:15:00-05	82898
1098	Words Ketchup Cat	3	2	2	2018-10-01 14:36:00-05	82898
1099	Dictionary Potato Apple	4	1	5	2019-04-01 13:20:00-05	82898
1100	Shrimp Machine Words	3	2	2	2019-03-02 16:46:00-06	82898
1101	Dictionary Elephant Fish	1	1	2	2018-11-04 13:28:00-06	82898
1102	Database Computer Dog	7	1	2	2018-04-09 10:27:00-05	82898
1103	Potato Sriracha Ketchup	3	3	5	2018-12-28 11:59:00-06	82898
1104	Cat Potato Fish	4	1	3	2018-10-07 17:24:00-05	82898
1105	Dog Dictionary Apple	1	2	4	2018-11-24 18:24:00-06	82898
1106	Apple Words Cat	9	1	4	2018-02-24 21:15:00-06	82898
1107	Potato Words Ketchup	1	1	3	2018-02-01 23:31:00-06	33263
1108	Cat Fish Banana	7	1	3	2019-02-24 20:32:00-06	33263
1109	Toad Elephant Sriracha	11	3	4	2019-04-17 13:52:00-05	33263
1110	Potato Shrimp Sriracha	1	2	5	2018-04-20 18:34:00-05	33263
1111	Banana Cat Banana	2	3	3	2018-07-02 17:11:00-05	33263
1112	Sriracha Machine Elephant	9	2	5	2018-04-10 16:15:00-05	33263
1113	Dictionary Words Apple	10	2	4	2018-05-17 15:10:00-05	33263
1114	Toad Apple Fish	3	2	3	2018-07-09 10:38:00-05	33263
1115	Database Dictionary Shrimp	9	1	4	2018-03-02 17:36:00-06	33263
1116	Banana Sriracha Banana	6	3	5	2019-04-10 21:53:00-05	33263
1117	Banana Sriracha Database	3	1	3	2018-08-17 14:57:00-05	33263
1118	Dog Potato Cat	2	1	4	2019-01-10 17:16:00-06	65014
1119	Apple Fish Shrimp	1	2	2	2019-03-18 19:30:00-05	65014
1120	Fish Potato Machine	7	2	5	2019-10-15 19:58:00-05	65014
1121	Apple Elephant Words	2	3	2	2018-01-02 17:53:00-06	65014
1122	Machine Fish Sriracha	2	3	3	2018-05-14 15:17:00-05	65014
1123	Ketchup Dictionary Computer	3	1	3	2018-09-05 16:15:00-05	65014
1124	Toad Sriracha Elephant	2	2	2	2019-05-04 16:21:00-05	65014
1125	Toad Words Machine	6	2	2	2018-10-09 16:23:00-05	65014
1126	Dictionary Potato Database	7	2	2	2019-06-10 18:27:00-05	62067
1127	Dictionary Words Sriracha	3	3	4	2018-03-22 15:28:00-05	62067
1128	Toad Computer Potato	6	3	3	2018-10-26 12:45:00-05	62067
1129	Words Machine Dog	6	1	4	2018-01-14 20:41:00-06	62067
1130	Shrimp Sriracha Cat	11	3	3	2019-05-21 10:13:00-05	62067
1131	Shrimp Machine Elephant	1	3	5	2019-09-26 10:24:00-05	62067
1132	Fish Database Sriracha	1	2	5	2019-08-15 16:21:00-05	62067
1133	Potato Sriracha Machine	7	2	3	2019-05-22 18:19:00-05	62067
1134	Elephant Machine Shrimp	9	3	2	2019-12-02 21:47:00-06	62067
1135	Toad Potato Potato	11	2	3	2018-10-06 10:34:00-05	62067
1136	Computer Sriracha Database	10	3	3	2018-06-20 11:47:00-05	62067
1137	Potato Database Computer	5	3	5	2019-09-08 15:49:00-05	62067
1138	Dictionary Words Dog	9	1	5	2019-07-26 14:55:00-05	62067
1139	Potato Elephant Banana	5	3	2	2018-02-20 20:37:00-06	62067
1140	Database Database Dictionary	2	2	4	2018-09-21 12:46:00-05	62067
1141	Apple Toad Computer	11	3	2	2018-05-13 23:40:00-05	62067
1142	Machine Sriracha Banana	8	2	4	2018-07-05 19:20:00-05	62067
1143	Dog Cat Apple	7	3	5	2018-02-19 19:19:00-06	34121
1144	Database Elephant Apple	10	1	4	2019-08-03 11:51:00-05	34121
1145	Database Banana Sriracha	1	3	5	2019-10-16 21:53:00-05	34121
1146	Banana Dog Database	4	2	5	2018-01-23 21:28:00-06	34121
1147	Database Sriracha Fish	10	1	3	2018-03-02 23:54:00-06	34121
1148	Fish Dog Banana	6	2	5	2019-02-13 23:37:00-06	50774
1149	Fish Banana Banana	11	2	5	2019-12-11 23:10:00-06	50774
1150	Shrimp Potato Fish	4	2	5	2019-03-03 15:32:00-06	50774
1151	Sriracha Cat Cat	2	2	4	2018-04-03 11:27:00-05	50774
1152	Apple Elephant Banana	3	3	3	2019-09-18 20:33:00-05	50774
1153	Ketchup Banana Potato	1	3	5	2019-11-27 19:54:00-06	50774
1154	Words Words Words	2	1	4	2018-03-23 17:23:00-05	50774
1155	Ketchup Toad Computer	8	2	3	2018-09-11 19:31:00-05	50774
1156	Dictionary Fish Banana	4	3	4	2018-08-16 22:43:00-05	50774
1157	Machine Sriracha Fish	3	1	5	2019-12-19 14:35:00-06	50774
1158	Elephant Dog Banana	5	2	3	2018-04-26 12:30:00-05	50774
1159	Computer Fish Shrimp	5	3	4	2018-07-05 13:25:00-05	50774
1160	Computer Apple Sriracha	12	1	5	2019-06-08 10:13:00-05	50774
1161	Shrimp Apple Dictionary	3	1	2	2018-07-12 15:45:00-05	50774
1162	Apple Potato Elephant	5	1	4	2018-02-07 19:19:00-06	50774
1163	Banana Elephant Computer	9	2	2	2018-02-27 11:13:00-06	50774
1164	Shrimp Dog Ketchup	8	3	4	2019-05-07 18:20:00-05	37761
1165	Potato Sriracha Ketchup	7	3	2	2018-06-11 10:18:00-05	37761
1166	Cat Cat Ketchup	1	3	3	2018-11-02 23:26:00-05	37761
1167	Fish Ketchup Ketchup	9	1	3	2018-11-28 14:31:00-06	37761
1168	Words Fish Shrimp	7	1	3	2018-08-03 19:52:00-05	37761
1169	Toad Potato Potato	4	2	5	2019-11-19 20:48:00-06	37761
1170	Database Machine Shrimp	6	2	4	2019-09-20 18:39:00-05	37761
1171	Dog Apple Machine	1	3	2	2019-06-20 16:55:00-05	37761
1172	Sriracha Shrimp Ketchup	3	3	4	2019-08-15 16:26:00-05	37761
1173	Ketchup Fish Apple	8	3	2	2018-10-20 18:17:00-05	37761
1174	Computer Banana Cat	6	3	4	2019-07-26 13:35:00-05	37761
1175	Words Machine Shrimp	6	2	3	2018-12-24 23:52:00-06	37761
1176	Computer Apple Shrimp	11	1	5	2019-01-26 16:57:00-06	37761
1177	Database Dictionary Dog	1	3	4	2019-01-26 17:32:00-06	37761
1178	Machine Machine Cat	5	3	5	2019-06-18 14:51:00-05	37761
1179	Shrimp Ketchup Cat	2	3	3	2018-09-19 15:18:00-05	99581
1180	Toad Dog Machine	12	1	4	2019-01-08 21:12:00-06	99581
1181	Potato Toad Banana	7	3	3	2018-01-18 21:39:00-06	99581
1182	Toad Database Database	10	2	5	2019-09-13 14:56:00-05	99581
1183	Database Dog Database	9	1	2	2019-03-23 11:31:00-05	99581
1184	Sriracha Elephant Shrimp	2	1	5	2019-09-07 23:37:00-05	99581
1185	Ketchup Database Elephant	12	3	5	2019-02-25 15:12:00-06	99581
1186	Computer Fish Fish	12	1	4	2018-12-22 19:58:00-06	99581
1187	Toad Words Cat	10	1	2	2018-02-05 19:40:00-06	99581
1188	Banana Database Toad	6	1	3	2019-07-15 22:29:00-05	99581
1189	Sriracha Machine Dog	5	3	4	2018-07-20 19:26:00-05	99581
1190	Dog Toad Sriracha	8	1	4	2018-11-17 15:41:00-06	99581
1191	Toad Shrimp Sriracha	12	3	4	2018-07-12 10:14:00-05	99581
1192	Apple Elephant Apple	5	3	2	2018-12-19 22:21:00-06	99581
1193	Apple Ketchup Dictionary	10	1	5	2018-06-09 18:44:00-05	99581
1194	Fish Dog Banana	10	3	5	2018-06-22 23:39:00-05	99581
1195	Dictionary Toad Toad	5	2	3	2019-12-15 11:41:00-06	99581
1196	Dog Dog Machine	1	1	3	2018-01-03 13:33:00-06	99581
1197	Shrimp Cat Computer	2	1	4	2018-01-06 11:44:00-06	14828
1198	Machine Words Words	10	1	4	2018-08-21 22:56:00-05	14828
1199	Dictionary Elephant Dog	3	1	2	2019-08-24 10:44:00-05	14828
1200	Fish Sriracha Dog	10	3	4	2019-08-10 15:55:00-05	14828
1201	Words Words Apple	10	2	4	2018-01-06 11:10:00-06	14828
1202	Ketchup Words Toad	9	3	5	2019-08-01 21:26:00-05	14828
1203	Fish Computer Computer	7	3	5	2019-09-13 12:47:00-05	14828
1204	Database Words Ketchup	8	2	3	2019-10-21 15:46:00-05	14828
1205	Cat Toad Potato	11	2	3	2018-07-01 10:37:00-05	14828
1206	Words Toad Words	8	1	5	2018-05-06 15:31:00-05	14828
1207	Ketchup Dog Fish	3	3	4	2018-07-24 12:28:00-05	14828
1208	Machine Cat Toad	6	1	3	2018-06-14 17:54:00-05	14828
1209	Dictionary Machine Elephant	2	1	4	2019-01-11 16:56:00-06	14828
1210	Ketchup Fish Toad	10	1	2	2019-11-27 21:39:00-06	14828
1211	Words Dog Computer	8	3	4	2018-07-13 12:45:00-05	14828
1212	Cat Fish Toad	4	3	5	2019-02-21 23:15:00-06	14828
1213	Dictionary Toad Elephant	9	2	4	2019-02-17 16:45:00-06	14828
1214	Cat Fish Toad	3	2	3	2019-10-01 22:35:00-05	14828
1215	Banana Dictionary Toad	9	2	3	2019-03-23 23:16:00-05	27471
1216	Shrimp Sriracha Machine	2	1	5	2019-08-28 17:34:00-05	27471
1217	Sriracha Elephant Elephant	3	1	3	2018-03-25 22:28:00-05	27471
1218	Ketchup Computer Elephant	11	1	3	2019-10-19 12:36:00-05	27471
1219	Database Sriracha Banana	2	1	4	2019-04-13 21:37:00-05	27471
1220	Dictionary Elephant Ketchup	1	2	5	2019-12-09 15:24:00-06	27471
1221	Dictionary Computer Ketchup	2	2	2	2019-12-21 23:40:00-06	27471
1222	Words Toad Computer	9	3	4	2019-06-26 18:37:00-05	27471
1223	Cat Words Banana	2	1	5	2018-09-05 10:10:00-05	27471
1224	Cat Dictionary Sriracha	9	3	4	2018-12-06 11:50:00-06	27471
1225	Database Elephant Dictionary	8	3	2	2018-01-28 22:39:00-06	27471
1226	Fish Shrimp Dog	4	2	4	2019-06-20 22:39:00-05	27471
1227	Elephant Database Potato	4	3	5	2018-04-15 20:58:00-05	27471
\.


--
-- Data for Name: project_skillrequired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.project_skillrequired (id, project_id, skill_id) FROM stdin;
1	0	30
2	0	33
3	1	6
4	1	13
5	1	16
6	1	18
7	2	2
8	3	26
9	4	17
10	6	3
11	7	2
12	7	30
13	7	31
14	7	34
15	8	20
16	8	24
17	9	3
18	9	18
19	9	21
20	9	31
21	9	32
22	10	15
23	10	30
24	11	8
25	12	22
26	12	23
27	12	30
28	12	33
29	13	19
30	16	1
31	16	9
32	16	21
33	17	2
34	17	5
35	18	25
36	20	1
37	20	14
38	20	34
39	21	3
40	21	15
41	22	24
42	22	35
43	23	4
44	23	16
45	23	17
46	24	4
47	24	6
48	24	14
49	24	20
50	24	21
51	25	13
52	25	18
53	26	2
54	27	16
55	28	4
56	28	12
57	28	15
58	28	25
59	28	31
60	29	3
61	29	9
62	29	14
63	29	32
64	30	13
65	30	28
66	30	34
67	31	5
68	31	8
69	32	1
70	32	4
71	32	10
72	32	23
73	33	34
74	34	1
75	34	4
76	34	8
77	34	10
78	34	20
79	35	13
80	35	21
81	35	22
82	35	24
83	35	25
84	35	33
85	35	35
86	36	23
87	36	27
88	36	28
89	36	30
90	37	20
91	38	7
92	38	12
93	39	9
94	39	28
95	40	6
96	40	19
97	41	9
98	41	15
99	41	33
100	42	12
101	42	35
102	43	6
103	43	11
104	43	22
105	43	30
106	44	11
107	44	20
108	46	4
109	46	8
110	46	22
111	46	26
112	47	25
113	49	6
114	50	9
115	50	19
116	51	20
117	52	4
118	52	13
119	52	18
120	53	1
121	53	10
122	53	11
123	53	12
124	54	34
125	54	35
126	56	7
127	56	20
128	56	23
129	56	24
130	57	8
131	57	10
132	57	14
133	58	17
134	58	30
135	59	17
136	60	24
137	60	26
138	60	27
139	61	5
140	61	6
141	61	28
142	61	31
143	61	33
144	62	7
145	62	15
146	64	1
147	65	27
148	66	13
149	66	29
150	68	10
151	68	22
152	68	29
153	69	4
154	69	6
155	71	11
156	71	29
157	72	1
158	72	10
159	72	13
160	73	14
161	73	31
162	74	11
163	75	27
164	76	12
165	76	15
166	76	16
167	76	27
168	76	29
169	76	33
170	77	3
171	77	13
172	77	19
173	77	25
174	78	16
175	78	21
176	80	17
177	80	35
178	81	7
179	81	15
180	81	21
181	82	14
182	82	15
183	82	33
184	83	16
185	84	4
186	84	31
187	84	35
188	85	10
189	85	22
190	86	2
191	86	33
192	87	27
193	87	33
194	88	7
195	88	19
196	88	21
197	88	23
198	88	34
199	89	1
200	89	2
201	89	10
202	89	18
203	89	23
204	89	28
205	90	13
206	91	18
207	91	21
208	91	32
209	92	25
210	93	20
211	93	32
212	94	4
213	94	21
214	94	30
215	94	35
216	95	22
217	96	21
218	96	24
219	96	33
220	97	23
221	98	21
222	98	27
223	99	22
224	100	1
225	100	8
226	100	26
227	101	12
228	101	13
229	101	29
230	102	14
231	102	18
232	103	10
233	103	35
234	104	23
235	106	2
236	106	20
237	108	13
238	108	20
239	109	5
240	109	22
241	109	35
242	110	2
243	110	5
244	110	19
245	111	2
246	111	13
247	111	26
248	112	3
249	112	15
250	112	32
251	113	9
252	113	17
253	113	22
254	113	29
255	113	34
256	115	4
257	115	23
258	116	8
259	116	14
260	116	17
261	116	35
262	118	1
263	118	5
264	118	11
265	120	3
266	120	5
267	120	15
268	120	35
269	121	29
270	121	32
271	121	34
272	122	34
273	123	2
274	124	7
275	124	10
276	124	16
277	124	20
278	124	34
279	125	2
280	125	12
281	125	14
282	126	4
283	128	1
284	128	6
285	128	19
286	128	35
287	129	26
288	129	32
289	130	3
290	130	7
291	130	20
292	130	32
293	132	18
294	133	1
295	133	2
296	133	13
297	133	17
298	133	19
299	133	33
300	134	2
301	134	12
302	135	17
303	135	18
304	135	19
305	136	12
306	136	25
307	136	35
308	137	8
309	137	33
310	138	1
311	138	12
312	138	18
313	138	35
314	139	26
315	139	33
316	140	2
317	140	24
318	140	29
319	140	35
320	141	10
321	141	14
322	141	31
323	142	11
324	142	17
325	142	18
326	142	23
327	142	29
328	143	7
329	144	19
330	144	27
331	145	13
332	145	18
333	145	32
334	146	6
335	146	22
336	147	7
337	147	24
338	148	10
339	148	19
340	148	22
341	148	30
342	149	12
343	149	17
344	149	21
345	149	23
346	149	24
347	149	32
348	150	6
349	150	14
350	150	34
351	151	5
352	151	23
353	152	2
354	152	12
355	152	18
356	153	4
357	153	7
358	153	10
359	153	11
360	153	25
361	153	30
362	153	34
363	154	32
364	155	9
365	155	35
366	156	18
367	157	3
368	157	17
369	158	12
370	158	25
371	159	3
372	159	7
373	159	26
374	159	28
375	160	26
376	160	31
377	161	1
378	161	11
379	161	17
380	161	24
381	162	28
382	163	21
383	164	11
384	164	13
385	164	15
386	164	18
387	164	24
388	164	32
389	165	4
390	165	10
391	165	26
392	165	29
393	166	10
394	166	22
395	166	30
396	166	31
397	167	2
398	167	5
399	168	2
400	168	32
401	169	3
402	169	26
403	169	34
404	172	19
405	173	2
406	173	15
407	173	16
408	173	22
409	174	15
410	174	24
411	176	6
412	176	24
413	176	31
414	177	2
415	177	9
416	177	18
417	177	19
418	178	15
419	179	1
420	179	14
421	179	24
422	180	5
423	180	17
424	181	13
425	181	19
426	181	35
427	182	5
428	182	13
429	183	5
430	183	15
431	183	24
432	184	1
433	184	11
434	184	21
435	185	1
436	185	5
437	185	26
438	185	27
439	185	34
440	186	20
441	186	24
442	187	2
443	187	17
444	187	25
445	187	35
446	190	1
447	191	2
448	191	27
449	192	3
450	192	9
451	192	20
452	192	26
453	192	31
454	192	35
455	193	18
456	194	26
457	194	35
458	195	3
459	195	4
460	195	19
461	195	29
462	196	4
463	196	26
464	197	15
465	197	17
466	198	7
467	199	1
468	199	20
469	199	21
470	201	17
471	202	1
472	202	23
473	202	32
474	202	33
475	203	11
476	203	16
477	203	30
478	204	18
479	204	19
480	204	30
481	205	10
482	206	8
483	206	20
484	206	26
485	207	8
486	207	10
487	207	15
488	207	26
489	207	29
490	208	2
491	208	12
492	208	20
493	208	23
494	208	27
495	208	30
496	210	2
497	210	9
498	210	20
499	210	34
500	211	4
501	212	25
502	212	34
503	213	12
504	213	17
505	215	2
506	215	24
507	215	27
508	215	32
509	216	5
510	216	6
511	216	11
512	216	13
513	216	25
514	217	3
515	217	18
516	217	32
517	218	11
518	218	18
519	218	25
520	218	32
521	219	3
522	219	5
523	220	15
524	220	25
525	220	33
526	221	2
527	221	7
528	221	19
529	221	29
530	222	1
531	222	2
532	222	3
533	222	11
534	222	13
535	223	7
536	223	11
537	223	13
538	223	21
539	224	6
540	224	12
541	224	20
542	224	33
543	224	34
544	224	35
545	225	1
546	225	14
547	226	17
548	226	18
549	227	4
550	227	7
551	227	9
552	227	24
553	227	26
554	227	29
555	228	5
556	228	29
557	228	31
558	228	35
559	229	30
560	229	35
561	230	4
562	230	18
563	230	31
564	230	32
565	231	7
566	231	12
567	231	18
568	232	35
569	233	7
570	233	9
571	233	10
572	234	20
573	235	12
574	235	23
575	235	28
576	236	1
577	236	7
578	236	10
579	236	13
580	237	6
581	237	7
582	238	11
583	238	15
584	238	21
585	239	3
586	239	5
587	239	17
588	239	33
589	241	21
590	243	19
591	243	35
592	244	1
593	245	17
594	245	19
595	245	29
596	245	31
597	246	4
598	246	14
599	247	1
600	247	9
601	247	23
602	248	27
603	248	31
604	249	10
605	249	26
606	249	29
607	250	6
608	251	3
609	252	31
610	253	6
611	253	7
612	253	12
613	253	29
614	254	22
615	254	27
616	254	34
617	255	8
618	255	17
619	256	5
620	256	17
621	256	20
622	257	14
623	258	11
624	258	30
625	259	7
626	259	20
627	259	34
628	260	4
629	260	29
630	261	9
631	261	24
632	262	1
633	262	19
634	262	20
635	262	31
636	262	34
637	263	10
638	263	24
639	264	3
640	264	4
641	264	25
642	264	30
643	264	31
644	264	33
645	265	5
646	265	26
647	265	30
648	266	11
649	267	10
650	267	23
651	268	7
652	268	33
653	269	4
654	269	5
655	269	6
656	269	18
657	269	26
658	269	31
659	270	25
660	271	14
661	272	4
662	272	24
663	272	32
664	272	34
665	273	1
666	273	15
667	273	16
668	273	19
669	273	25
670	274	10
671	274	31
672	275	14
673	275	23
674	277	1
675	277	7
676	277	11
677	277	30
678	278	11
679	278	23
680	278	33
681	280	11
682	281	1
683	281	22
684	281	28
685	282	9
686	282	20
687	283	10
688	284	7
689	284	14
690	284	17
691	284	26
692	284	29
693	285	18
694	286	24
695	286	25
696	286	33
697	287	6
698	287	26
699	287	28
700	287	30
701	287	32
702	288	3
703	288	31
704	289	4
705	289	12
706	289	21
707	289	26
708	289	28
709	289	29
710	290	4
711	290	10
712	290	18
713	291	22
714	292	9
715	293	7
716	293	32
717	294	29
718	294	34
719	295	12
720	296	2
721	296	14
722	296	16
723	296	18
724	296	22
725	296	24
726	296	28
727	298	1
728	298	10
729	298	14
730	298	24
731	298	32
732	299	7
733	299	8
734	299	11
735	299	12
736	299	14
737	299	17
738	299	25
739	299	27
740	300	33
741	301	4
742	301	11
743	301	20
744	302	29
745	303	14
746	303	21
747	303	23
748	304	22
749	305	4
750	305	18
751	306	13
752	306	31
753	307	18
754	308	5
755	310	5
756	310	13
757	311	28
758	314	3
759	314	6
760	314	27
761	314	34
762	315	2
763	315	5
764	315	10
765	316	16
766	316	19
767	317	19
768	317	20
769	318	9
770	318	20
771	318	27
772	318	28
773	319	1
774	319	25
775	320	8
776	320	9
777	320	16
778	320	22
779	320	28
780	321	7
781	321	10
782	321	31
783	321	32
784	323	15
785	323	22
786	323	23
787	324	10
788	324	12
789	324	33
790	325	12
791	325	31
792	326	29
793	327	18
794	327	25
795	328	14
796	329	9
797	329	11
798	329	13
799	329	17
800	329	32
801	331	8
802	331	19
803	331	24
804	332	21
805	332	31
806	333	3
807	333	8
808	333	14
809	333	18
810	333	22
811	334	7
812	334	11
813	335	16
814	335	17
815	335	19
816	335	25
817	336	6
818	336	7
819	336	23
820	337	6
821	337	13
822	339	12
823	339	16
824	339	31
825	340	5
826	340	14
827	340	21
828	340	22
829	340	30
830	341	2
831	341	5
832	341	12
833	341	30
834	342	8
835	342	35
836	343	16
837	343	28
838	343	31
839	343	32
840	344	7
841	344	29
842	347	2
843	347	33
844	348	34
845	349	16
846	349	19
847	350	12
848	350	22
849	350	24
850	351	30
851	352	35
852	353	2
853	353	30
854	353	33
855	353	34
856	353	35
857	354	5
858	354	7
859	354	21
860	355	2
861	356	3
862	356	11
863	356	12
864	356	15
865	357	10
866	358	5
867	358	10
868	358	20
869	359	14
870	359	24
871	359	28
872	360	17
873	360	23
874	360	25
875	361	2
876	361	21
877	361	32
878	362	2
879	362	6
880	362	18
881	362	25
882	362	31
883	363	17
884	363	21
885	365	15
886	365	26
887	366	17
888	366	21
889	366	28
890	367	6
891	367	12
892	368	6
893	368	12
894	368	15
895	368	21
896	369	1
897	369	3
898	369	6
899	369	10
900	369	26
901	369	35
902	370	3
903	370	5
904	370	23
905	371	1
906	371	4
907	371	6
908	371	32
909	373	1
910	373	25
911	374	33
912	375	22
913	375	27
914	375	29
915	377	7
916	377	23
917	378	26
918	379	1
919	379	4
920	379	13
921	379	14
922	379	16
923	379	34
924	380	5
925	380	9
926	380	14
927	381	10
928	382	11
929	382	15
930	382	27
931	383	35
932	384	10
933	385	1
934	385	19
935	386	5
936	386	9
937	386	17
938	386	24
939	387	9
940	387	13
941	387	16
942	387	19
943	387	35
944	388	4
945	388	10
946	388	11
947	388	26
948	388	33
949	389	25
950	389	27
951	390	10
952	391	21
953	391	26
954	391	31
955	391	32
956	392	3
957	392	5
958	393	3
959	394	2
960	394	9
961	395	33
962	395	34
963	396	5
964	396	28
965	397	15
966	397	16
967	397	23
968	398	16
969	399	5
970	399	9
971	399	13
972	399	19
973	399	29
974	400	5
975	400	21
976	400	35
977	401	1
978	401	2
979	401	21
980	401	29
981	402	7
982	402	8
983	402	12
984	402	22
985	402	25
986	402	34
987	403	7
988	403	20
989	403	28
990	404	15
991	404	16
992	404	27
993	405	4
994	405	6
995	405	25
996	406	2
997	406	4
998	406	8
999	406	28
1000	408	6
1001	408	22
1002	408	32
1003	408	35
1004	409	31
1005	410	6
1006	410	30
1007	411	1
1008	411	9
1009	411	13
1010	411	18
1011	411	21
1012	411	34
1013	412	3
1014	412	8
1015	412	11
1016	412	15
1017	412	25
1018	413	21
1019	413	31
1020	414	18
1021	414	28
1022	414	31
1023	414	32
1024	415	8
1025	415	29
1026	416	10
1027	416	25
1028	417	5
1029	417	18
1030	417	31
1031	418	9
1032	418	25
1033	420	12
1034	420	18
1035	420	22
1036	420	28
1037	420	29
1038	420	34
1039	421	5
1040	421	6
1041	421	19
1042	421	31
1043	422	5
1044	422	10
1045	422	19
1046	422	21
1047	423	14
1048	423	15
1049	423	23
1050	423	27
1051	423	35
1052	424	16
1053	424	17
1054	425	12
1055	425	14
1056	425	15
1057	425	16
1058	425	24
1059	425	30
1060	425	33
1061	426	12
1062	428	7
1063	428	26
1064	429	2
1065	429	4
1066	429	20
1067	429	22
1068	429	27
1069	430	17
1070	431	17
1071	431	24
1072	432	7
1073	432	31
1074	432	33
1075	433	23
1076	433	26
1077	433	30
1078	434	16
1079	434	18
1080	434	19
1081	434	22
1082	435	33
1083	435	35
1084	436	24
1085	437	34
1086	438	10
1087	438	33
1088	439	6
1089	439	15
1090	439	29
1091	440	3
1092	440	34
1093	441	12
1094	441	13
1095	441	32
1096	442	15
1097	444	18
1098	444	20
1099	444	33
1100	445	3
1101	446	5
1102	446	14
1103	446	17
1104	447	18
1105	448	24
1106	448	30
1107	449	7
1108	450	1
1109	450	22
1110	450	31
1111	450	33
1112	451	1
1113	451	22
1114	451	30
1115	451	31
1116	451	34
1117	452	5
1118	452	21
1119	453	6
1120	453	25
1121	453	27
1122	454	15
1123	455	13
1124	455	14
1125	455	18
1126	455	32
1127	456	2
1128	456	23
1129	457	3
1130	457	6
1131	457	8
1132	457	10
1133	457	16
1134	457	18
1135	457	25
1136	458	10
1137	458	11
1138	458	14
1139	458	24
1140	459	4
1141	460	8
1142	460	24
1143	461	15
1144	462	13
1145	462	29
1146	463	26
1147	464	6
1148	464	18
1149	466	12
1150	466	14
1151	466	32
1152	467	3
1153	467	6
1154	467	9
1155	467	33
1156	468	2
1157	468	5
1158	468	11
1159	468	29
1160	469	16
1161	469	17
1162	469	19
1163	469	35
1164	470	10
1165	470	24
1166	470	31
1167	471	2
1168	471	21
1169	471	33
1170	472	7
1171	472	11
1172	472	22
1173	472	27
1174	472	29
1175	472	32
1176	473	16
1177	475	18
1178	475	22
1179	475	31
1180	476	10
1181	476	12
1182	476	20
1183	476	26
1184	476	31
1185	477	23
1186	477	35
1187	478	7
1188	478	15
1189	478	16
1190	478	26
1191	478	27
1192	478	28
1193	478	29
1194	480	16
1195	481	8
1196	481	16
1197	481	17
1198	481	24
1199	482	14
1200	483	14
1201	483	17
1202	483	20
1203	483	31
1204	483	34
1205	484	8
1206	484	29
1207	484	34
1208	485	1
1209	485	9
1210	485	28
1211	486	31
1212	487	7
1213	487	11
1214	488	3
1215	488	29
1216	489	1
1217	489	8
1218	489	24
1219	490	4
1220	490	9
1221	490	11
1222	491	3
1223	491	19
1224	491	23
1225	492	5
1226	492	12
1227	492	14
1228	492	19
1229	493	1
1230	493	4
1231	494	16
1232	494	35
1233	495	2
1234	495	14
1235	496	8
1236	496	22
1237	496	25
1238	496	29
1239	497	28
1240	498	8
1241	499	8
1242	499	24
1243	499	27
1244	499	34
1245	500	6
1246	500	7
1247	500	15
1248	500	23
1249	500	29
1250	501	11
1251	501	15
1252	501	23
1253	502	2
1254	502	8
1255	502	12
1256	502	16
1257	502	23
1258	502	34
1259	503	15
1260	504	7
1261	504	18
1262	504	21
1263	505	11
1264	505	26
1265	506	10
1266	508	3
1267	508	7
1268	508	21
1269	508	35
1270	509	6
1271	509	10
1272	509	14
1273	509	28
1274	509	33
1275	510	10
1276	510	12
1277	512	3
1278	512	20
1279	512	27
1280	512	34
1281	513	8
1282	513	9
1283	513	16
1284	513	25
1285	513	33
1286	514	16
1287	514	20
1288	514	24
1289	515	11
1290	515	14
1291	516	28
1292	518	5
1293	519	6
1294	519	27
1295	519	34
1296	521	26
1297	521	33
1298	522	4
1299	522	19
1300	522	20
1301	522	23
1302	522	33
1303	523	34
1304	524	2
1305	524	6
1306	524	31
1307	526	10
1308	527	2
1309	527	4
1310	527	18
1311	528	4
1312	528	28
1313	529	8
1314	529	16
1315	529	31
1316	529	35
1317	530	1
1318	530	16
1319	530	30
1320	531	12
1321	531	14
1322	531	24
1323	531	29
1324	532	7
1325	533	18
1326	533	33
1327	534	4
1328	534	19
1329	534	20
1330	534	22
1331	534	23
1332	535	1
1333	535	18
1334	535	20
1335	535	27
1336	536	33
1337	537	6
1338	537	15
1339	538	26
1340	538	32
1341	539	30
1342	540	25
1343	540	30
1344	540	31
1345	541	6
1346	541	12
1347	542	33
1348	543	1
1349	543	8
1350	543	31
1351	544	11
1352	544	29
1353	545	11
1354	546	3
1355	546	24
1356	546	26
1357	547	27
1358	548	1
1359	548	17
1360	548	32
1361	549	13
1362	549	22
1363	550	3
1364	551	8
1365	551	17
1366	551	30
1367	552	8
1368	552	22
1369	552	27
1370	553	10
1371	553	25
1372	553	29
1373	553	32
1374	554	26
1375	554	29
1376	555	29
1377	556	7
1378	557	3
1379	557	13
1380	557	19
1381	558	29
1382	559	6
1383	559	14
1384	560	3
1385	561	3
1386	561	6
1387	561	7
1388	562	13
1389	562	25
1390	562	26
1391	562	28
1392	563	4
1393	563	19
1394	563	25
1395	564	21
1396	564	23
1397	564	25
1398	565	18
1399	565	25
1400	566	7
1401	566	14
1402	566	30
1403	566	32
1404	567	12
1405	567	14
1406	568	6
1407	569	32
1408	570	15
1409	570	20
1410	571	27
1411	571	30
1412	571	34
1413	572	17
1414	572	23
1415	572	27
1416	572	31
1417	572	34
1418	573	2
1419	573	8
1420	573	16
1421	573	22
1422	573	33
1423	574	17
1424	574	24
1425	575	9
1426	575	15
1427	575	25
1428	575	31
1429	576	5
1430	577	7
1431	578	7
1432	578	12
1433	578	26
1434	579	25
1435	579	26
1436	579	29
1437	579	31
1438	580	23
1439	580	27
1440	580	30
1441	581	4
1442	581	9
1443	582	8
1444	582	10
1445	582	12
1446	582	22
1447	583	21
1448	583	26
1449	584	4
1450	584	10
1451	584	14
1452	585	3
1453	585	6
1454	587	3
1455	587	27
1456	587	31
1457	588	3
1458	588	27
1459	588	35
1460	589	19
1461	590	2
1462	592	6
1463	592	31
1464	593	9
1465	593	13
1466	593	24
1467	594	10
1468	595	18
1469	595	21
1470	596	28
1471	596	31
1472	597	24
1473	598	14
1474	598	18
1475	598	30
1476	599	18
1477	600	8
1478	600	13
1479	601	16
1480	601	17
1481	601	23
1482	602	17
1483	602	20
1484	602	21
1485	602	27
1486	602	33
1487	603	19
1488	603	25
1489	603	26
1490	604	27
1491	605	1
1492	605	2
1493	606	8
1494	606	19
1495	608	7
1496	608	22
1497	609	5
1498	609	9
1499	609	22
1500	610	8
1501	610	11
1502	610	34
1503	611	3
1504	611	15
1505	611	22
1506	611	32
1507	612	10
1508	612	16
1509	612	22
1510	613	7
1511	613	8
1512	613	21
1513	614	4
1514	614	5
1515	614	12
1516	614	30
1517	615	21
1518	616	15
1519	618	26
1520	619	6
1521	619	7
1522	619	8
1523	619	12
1524	619	16
1525	619	18
1526	620	13
1527	620	21
1528	620	24
1529	620	35
1530	621	4
1531	621	6
1532	621	18
1533	622	4
1534	622	8
1535	622	11
1536	622	13
1537	622	25
1538	622	31
1539	622	35
1540	623	20
1541	624	7
1542	624	22
1543	625	5
1544	625	9
1545	625	16
1546	625	22
1547	625	25
1548	625	26
1549	626	11
1550	627	15
1551	628	34
1552	629	14
1553	629	21
1554	629	35
1555	630	14
1556	630	17
1557	630	22
1558	631	21
1559	632	18
1560	632	30
1561	632	32
1562	632	35
1563	633	19
1564	634	26
1565	634	27
1566	635	18
1567	635	29
1568	635	32
1569	636	6
1570	636	9
1571	636	35
1572	637	9
1573	637	14
1574	637	16
1575	637	23
1576	638	13
1577	638	21
1578	638	26
1579	638	29
1580	639	16
1581	639	20
1582	639	27
1583	639	28
1584	640	18
1585	640	34
1586	641	12
1587	641	13
1588	641	23
1589	642	1
1590	643	21
1591	643	26
1592	644	3
1593	645	8
1594	645	15
1595	645	21
1596	646	27
1597	646	32
1598	647	29
1599	648	9
1600	649	1
1601	649	33
1602	649	35
1603	650	3
1604	651	4
1605	651	17
1606	651	19
1607	652	5
1608	652	13
1609	652	25
1610	652	28
1611	652	34
1612	653	12
1613	653	28
1614	653	32
1615	654	5
1616	654	11
1617	654	32
1618	655	6
1619	655	9
1620	655	34
1621	656	10
1622	656	12
1623	656	16
1624	656	24
1625	657	5
1626	657	34
1627	658	7
1628	658	17
1629	658	28
1630	660	2
1631	660	19
1632	660	34
1633	661	7
1634	661	13
1635	661	32
1636	662	1
1637	662	12
1638	662	24
1639	663	13
1640	663	33
1641	664	9
1642	664	21
1643	664	26
1644	665	6
1645	665	14
1646	665	16
1647	665	26
1648	665	28
1649	666	16
1650	666	18
1651	666	22
1652	666	25
1653	667	17
1654	667	18
1655	667	35
1656	668	5
1657	668	24
1658	668	27
1659	669	19
1660	670	14
1661	671	3
1662	671	7
1663	671	17
1664	671	29
1665	671	35
1666	672	10
1667	672	21
1668	672	32
1669	673	21
1670	673	30
1671	673	32
1672	674	19
1673	674	31
1674	675	30
1675	675	32
1676	676	26
1677	677	26
1678	678	5
1679	678	32
1680	679	11
1681	679	18
1682	679	20
1683	680	1
1684	680	3
1685	680	8
1686	681	4
1687	681	7
1688	681	9
1689	682	2
1690	682	20
1691	682	25
1692	683	2
1693	683	13
1694	683	15
1695	684	4
1696	684	16
1697	685	23
1698	685	25
1699	686	5
1700	686	6
1701	686	27
1702	687	2
1703	687	31
1704	689	4
1705	689	10
1706	690	9
1707	690	13
1708	690	33
1709	691	12
1710	691	25
1711	693	25
1712	694	13
1713	694	24
1714	694	35
1715	695	25
1716	695	26
1717	695	27
1718	696	4
1719	696	10
1720	696	30
1721	696	32
1722	697	3
1723	697	33
1724	698	4
1725	698	5
1726	698	17
1727	699	7
1728	699	13
1729	699	22
1730	699	26
1731	700	5
1732	700	6
1733	700	9
1734	700	24
1735	701	1
1736	701	9
1737	701	12
1738	701	32
1739	702	3
1740	702	4
1741	702	24
1742	703	26
1743	705	1
1744	705	15
1745	705	19
1746	705	29
1747	705	34
1748	706	7
1749	706	11
1750	706	28
1751	706	35
1752	707	19
1753	708	4
1754	708	13
1755	708	20
1756	709	13
1757	709	28
1758	710	32
1759	711	1
1760	711	27
1761	711	33
1762	712	13
1763	712	18
1764	712	22
1765	712	32
1766	713	2
1767	713	3
1768	713	8
1769	713	26
1770	714	7
1771	714	15
1772	714	16
1773	714	20
1774	715	8
1775	715	22
1776	716	14
1777	717	19
1778	717	27
1779	717	31
1780	718	12
1781	719	9
1782	719	20
1783	719	24
1784	720	4
1785	720	5
1786	720	19
1787	720	31
1788	721	13
1789	722	22
1790	722	28
1791	722	32
1792	723	34
1793	724	8
1794	724	11
1795	724	26
1796	724	34
1797	726	2
1798	726	18
1799	726	34
1800	727	8
1801	727	15
1802	728	7
1803	728	21
1804	728	27
1805	728	32
1806	729	5
1807	729	11
1808	729	31
1809	730	22
1810	730	32
1811	731	8
1812	731	34
1813	733	30
1814	733	34
1815	734	7
1816	734	10
1817	735	7
1818	735	26
1819	735	30
1820	736	16
1821	736	32
1822	736	33
1823	737	6
1824	737	31
1825	738	4
1826	738	6
1827	738	15
1828	738	29
1829	738	31
1830	739	8
1831	739	13
1832	739	15
1833	740	2
1834	740	17
1835	740	23
1836	741	6
1837	742	35
1838	744	1
1839	744	3
1840	744	10
1841	744	29
1842	745	4
1843	746	21
1844	746	24
1845	746	28
1846	746	31
1847	746	34
1848	747	20
1849	748	3
1850	748	25
1851	749	11
1852	749	20
1853	749	23
1854	749	29
1855	750	9
1856	751	17
1857	751	18
1858	751	25
1859	752	32
1860	753	11
1861	753	12
1862	753	14
1863	753	16
1864	753	27
1865	753	33
1866	754	5
1867	754	33
1868	755	22
1869	756	19
1870	757	12
1871	757	13
1872	757	15
1873	757	18
1874	758	14
1875	758	16
1876	759	3
1877	759	13
1878	759	14
1879	759	35
1880	760	16
1881	760	21
1882	760	33
1883	760	34
1884	761	21
1885	762	1
1886	762	6
1887	762	15
1888	763	2
1889	763	11
1890	763	31
1891	764	7
1892	764	12
1893	764	15
1894	764	27
1895	764	30
1896	764	33
1897	765	5
1898	765	31
1899	766	24
1900	767	17
1901	767	23
1902	767	31
1903	768	24
1904	768	25
1905	769	24
1906	771	33
1907	771	35
1908	772	3
1909	772	16
1910	772	18
1911	772	32
1912	773	23
1913	774	2
1914	774	32
1915	776	3
1916	776	6
1917	776	10
1918	776	20
1919	777	2
1920	778	30
1921	779	11
1922	779	30
1923	780	26
1924	782	8
1925	782	26
1926	783	16
1927	783	29
1928	784	2
1929	784	27
1930	785	21
1931	786	4
1932	786	6
1933	787	24
1934	787	29
1935	788	15
1936	788	17
1937	790	35
1938	791	2
1939	791	17
1940	792	11
1941	793	7
1942	793	11
1943	795	1
1944	795	20
1945	795	33
1946	796	4
1947	796	24
1948	797	15
1949	797	35
1950	798	20
1951	800	12
1952	800	13
1953	800	18
1954	800	30
1955	801	13
1956	801	23
1957	801	34
1958	802	1
1959	803	20
1960	803	22
1961	803	31
1962	803	34
1963	804	9
1964	805	21
1965	805	25
1966	806	33
1967	807	3
1968	807	26
1969	808	9
1970	808	12
1971	808	27
1972	809	1
1973	809	12
1974	809	20
1975	809	22
1976	809	25
1977	809	35
1978	810	26
1979	811	14
1980	811	16
1981	811	21
1982	811	30
1983	812	6
1984	812	13
1985	812	16
1986	813	2
1987	813	20
1988	814	13
1989	815	19
1990	816	13
1991	816	16
1992	816	17
1993	816	25
1994	817	14
1995	817	16
1996	817	32
1997	818	4
1998	818	10
1999	818	12
2000	818	18
2001	818	34
2002	819	1
2003	820	10
2004	821	12
2005	821	19
2006	821	25
2007	822	7
2008	822	11
2009	822	24
2010	823	25
2011	823	26
2012	823	32
2013	824	5
2014	824	35
2015	825	22
2016	825	29
2017	825	33
2018	826	1
2019	826	7
2020	826	10
2021	828	5
2022	828	19
2023	828	22
2024	830	9
2025	830	13
2026	831	21
2027	832	1
2028	832	9
2029	832	27
2030	833	4
2031	833	18
2032	833	21
2033	833	29
2034	833	33
2035	834	5
2036	834	21
2037	835	3
2038	835	8
2039	835	29
2040	836	2
2041	836	18
2042	838	29
2043	839	32
2044	840	6
2045	840	13
2046	840	20
2047	841	32
2048	842	6
2049	842	34
2050	843	6
2051	843	20
2052	843	33
2053	844	15
2054	844	16
2055	844	21
2056	844	29
2057	844	30
2058	845	5
2059	845	14
2060	845	31
2061	846	1
2062	846	5
2063	846	7
2064	848	35
2065	849	2
2066	849	11
2067	849	20
2068	849	26
2069	849	28
2070	850	4
2071	850	10
2072	850	14
2073	850	22
2074	851	2
2075	851	11
2076	851	18
2077	852	12
2078	854	15
2079	855	17
2080	856	11
2081	856	15
2082	858	9
2083	858	25
2084	859	4
2085	859	14
2086	859	27
2087	860	13
2088	860	17
2089	860	18
2090	861	7
2091	861	14
2092	862	18
2093	862	29
2094	862	31
2095	863	5
2096	863	14
2097	863	16
2098	864	9
2099	864	15
2100	865	11
2101	865	21
2102	865	32
2103	866	8
2104	866	11
2105	866	25
2106	867	2
2107	867	12
2108	867	34
2109	868	5
2110	869	5
2111	869	13
2112	869	16
2113	869	35
2114	870	9
2115	870	26
2116	870	29
2117	870	30
2118	870	33
2119	871	3
2120	871	26
2121	871	27
2122	871	31
2123	872	15
2124	872	29
2125	873	3
2126	873	29
2127	874	4
2128	874	10
2129	875	5
2130	876	11
2131	876	13
2132	876	16
2133	876	32
2134	877	28
2135	878	1
2136	878	7
2137	878	16
2138	878	18
2139	878	35
2140	880	8
2141	880	32
2142	881	23
2143	881	35
2144	882	9
2145	882	14
2146	882	27
2147	883	11
2148	883	15
2149	883	23
2150	884	7
2151	884	8
2152	884	25
2153	884	27
2154	884	34
2155	884	35
2156	885	3
2157	885	31
2158	886	5
2159	886	13
2160	886	25
2161	886	31
2162	887	12
2163	887	20
2164	887	27
2165	888	15
2166	888	31
2167	889	14
2168	889	22
2169	889	25
2170	889	33
2171	890	3
2172	890	10
2173	891	6
2174	891	28
2175	892	2
2176	892	3
2177	892	12
2178	893	29
2179	893	34
2180	894	2
2181	894	5
2182	894	19
2183	894	22
2184	894	26
2185	895	11
2186	895	14
2187	895	16
2188	895	35
2189	896	1
2190	896	4
2191	898	7
2192	898	8
2193	898	9
2194	898	15
2195	898	29
2196	899	8
2197	899	18
2198	899	22
2199	899	30
2200	899	34
2201	900	7
2202	900	23
2203	900	35
2204	901	31
2205	902	1
2206	902	23
2207	903	14
2208	903	19
2209	903	32
2210	903	34
2211	904	2
2212	904	10
2213	904	20
2214	904	21
2215	904	23
2216	904	26
2217	904	34
2218	905	18
2219	906	2
2220	906	8
2221	906	23
2222	906	33
2223	907	2
2224	907	3
2225	907	35
2226	910	14
2227	910	23
2228	911	10
2229	912	4
2230	912	29
2231	912	34
2232	913	2
2233	913	21
2234	913	24
2235	913	30
2236	913	34
2237	913	35
2238	914	3
2239	914	29
2240	915	5
2241	915	31
2242	916	24
2243	916	31
2244	917	2
2245	917	4
2246	917	11
2247	917	21
2248	918	12
2249	918	17
2250	918	19
2251	921	5
2252	922	1
2253	923	30
2254	923	35
2255	924	6
2256	924	7
2257	924	12
2258	925	15
2259	926	31
2260	928	5
2261	929	9
2262	929	24
2263	929	25
2264	929	29
2265	930	1
2266	931	4
2267	931	11
2268	931	13
2269	932	1
2270	932	9
2271	933	9
2272	933	33
2273	934	32
2274	934	35
2275	935	1
2276	935	17
2277	935	21
2278	935	23
2279	935	26
2280	935	27
2281	936	32
2282	937	7
2283	937	25
2284	938	2
2285	938	5
2286	938	6
2287	938	24
2288	939	1
2289	939	12
2290	939	30
2291	939	31
2292	940	16
2293	940	21
2294	941	5
2295	942	14
2296	942	18
2297	942	20
2298	942	28
2299	943	8
2300	943	11
2301	943	16
2302	944	7
2303	944	11
2304	944	25
2305	945	2
2306	945	29
2307	945	35
2308	946	20
2309	947	3
2310	947	7
2311	948	5
2312	948	29
2313	949	1
2314	949	4
2315	949	5
2316	949	8
2317	951	13
2318	951	20
2319	951	28
2320	952	31
2321	952	33
2322	953	4
2323	953	8
2324	953	27
2325	955	5
2326	955	15
2327	956	24
2328	956	26
2329	957	18
2330	957	27
2331	958	32
2332	959	6
2333	959	9
2334	959	14
2335	960	1
2336	960	5
2337	961	5
2338	961	20
2339	962	15
2340	962	23
2341	962	31
2342	963	34
2343	964	7
2344	964	34
2345	965	12
2346	966	13
2347	966	19
2348	966	21
2349	966	27
2350	967	35
2351	968	1
2352	968	3
2353	968	29
2354	968	31
2355	969	7
2356	969	16
2357	969	27
2358	970	32
2359	971	3
2360	971	26
2361	971	28
2362	972	25
2363	972	34
2364	973	5
2365	973	9
2366	973	30
2367	974	2
2368	974	4
2369	974	5
2370	974	8
2371	974	24
2372	974	26
2373	975	14
2374	975	16
2375	975	28
2376	975	30
2377	976	2
2378	976	22
2379	977	11
2380	978	12
2381	978	14
2382	979	6
2383	979	19
2384	979	25
2385	980	1
2386	980	12
2387	980	16
2388	980	19
2389	981	3
2390	981	29
2391	982	14
2392	983	7
2393	983	15
2394	983	25
2395	984	15
2396	984	29
2397	985	4
2398	985	6
2399	985	22
2400	986	5
2401	986	8
2402	986	14
2403	987	1
2404	987	11
2405	987	21
2406	987	32
2407	988	13
2408	988	20
2409	988	30
2410	989	11
2411	989	19
2412	989	20
2413	989	34
2414	990	1
2415	990	27
2416	991	26
2417	991	31
2418	992	1
2419	992	24
2420	992	26
2421	992	34
2422	993	5
2423	993	11
2424	993	16
2425	993	25
2426	993	29
2427	994	19
2428	995	17
2429	995	20
2430	995	21
2431	996	3
2432	996	8
2433	996	25
2434	996	31
2435	997	13
2436	997	21
2437	998	19
2438	999	17
2439	999	20
2440	999	25
2441	1001	32
2442	1002	6
2443	1003	4
2444	1003	29
2445	1004	33
2446	1005	5
2447	1005	10
2448	1005	28
2449	1006	6
2450	1007	11
2451	1008	9
2452	1008	13
2453	1008	21
2454	1009	29
2455	1010	3
2456	1010	19
2457	1010	23
2458	1011	1
2459	1011	6
2460	1011	15
2461	1011	17
2462	1011	26
2463	1012	2
2464	1012	17
2465	1012	18
2466	1012	34
2467	1013	2
2468	1013	5
2469	1013	33
2470	1014	35
2471	1015	5
2472	1015	7
2473	1015	20
2474	1015	25
2475	1015	34
2476	1016	22
2477	1017	10
2478	1017	21
2479	1018	8
2480	1019	15
2481	1019	21
2482	1020	18
2483	1020	30
2484	1020	34
2485	1020	35
2486	1021	34
2487	1022	24
2488	1023	2
2489	1023	30
2490	1024	2
2491	1024	27
2492	1024	29
2493	1025	6
2494	1025	12
2495	1025	14
2496	1025	15
2497	1025	29
2498	1026	29
2499	1027	5
2500	1027	6
2501	1027	27
2502	1027	29
2503	1027	33
2504	1028	30
2505	1028	31
2506	1029	9
2507	1029	28
2508	1030	3
2509	1030	10
2510	1030	19
2511	1031	24
2512	1031	28
2513	1032	3
2514	1032	11
2515	1032	23
2516	1032	27
2517	1033	2
2518	1033	16
2519	1034	12
2520	1034	35
2521	1035	14
2522	1035	16
2523	1036	10
2524	1036	15
2525	1036	33
2526	1037	10
2527	1037	13
2528	1037	18
2529	1037	20
2530	1037	31
2531	1038	4
2532	1038	10
2533	1039	2
2534	1039	10
2535	1039	22
2536	1039	31
2537	1040	26
2538	1040	35
2539	1042	13
2540	1042	15
2541	1042	16
2542	1042	17
2543	1042	31
2544	1043	9
2545	1043	14
2546	1043	15
2547	1044	5
2548	1044	20
2549	1044	26
2550	1046	33
2551	1047	13
2552	1047	25
2553	1047	27
2554	1048	12
2555	1049	7
2556	1050	7
2557	1051	34
2558	1052	18
2559	1052	27
2560	1053	27
2561	1053	35
2562	1054	15
2563	1054	21
2564	1054	28
2565	1054	29
2566	1054	35
2567	1055	3
2568	1055	6
2569	1055	14
2570	1055	30
2571	1056	3
2572	1056	7
2573	1057	22
2574	1057	30
2575	1059	8
2576	1059	11
2577	1059	15
2578	1060	5
2579	1061	5
2580	1061	11
2581	1062	33
2582	1063	13
2583	1063	20
2584	1064	1
2585	1064	3
2586	1064	8
2587	1064	14
2588	1064	23
2589	1064	32
2590	1065	9
2591	1065	28
2592	1066	14
2593	1066	16
2594	1066	20
2595	1066	34
2596	1067	2
2597	1067	26
2598	1068	2
2599	1068	11
2600	1068	19
2601	1068	25
2602	1068	30
2603	1069	15
2604	1070	25
2605	1071	3
2606	1071	25
2607	1073	10
2608	1073	13
2609	1073	14
2610	1073	19
2611	1073	20
2612	1073	31
2613	1073	33
2614	1075	9
2615	1075	23
2616	1075	27
2617	1076	10
2618	1076	16
2619	1076	20
2620	1076	23
2621	1078	3
2622	1078	4
2623	1078	5
2624	1078	11
2625	1079	1
2626	1079	3
2627	1079	6
2628	1079	14
2629	1079	22
2630	1079	25
2631	1079	26
2632	1080	29
2633	1080	35
2634	1081	2
2635	1081	13
2636	1081	15
2637	1081	17
2638	1081	22
2639	1081	35
2640	1082	12
2641	1083	10
2642	1083	14
2643	1083	27
2644	1084	19
2645	1084	21
2646	1085	13
2647	1085	16
2648	1085	21
2649	1085	22
2650	1085	32
2651	1086	14
2652	1086	18
2653	1087	14
2654	1087	19
2655	1087	34
2656	1088	11
2657	1088	16
2658	1088	28
2659	1089	18
2660	1090	23
2661	1091	9
2662	1091	29
2663	1092	11
2664	1092	25
2665	1092	28
2666	1094	5
2667	1094	10
2668	1094	11
2669	1094	15
2670	1094	22
2671	1094	23
2672	1096	9
2673	1096	23
2674	1096	28
2675	1096	35
2676	1097	9
2677	1097	15
2678	1097	28
2679	1098	7
2680	1098	29
2681	1098	33
2682	1098	35
2683	1099	31
2684	1100	13
2685	1101	3
2686	1101	6
2687	1101	12
2688	1101	17
2689	1102	20
2690	1103	9
2691	1103	31
2692	1103	35
2693	1104	12
2694	1104	29
2695	1105	27
2696	1105	35
2697	1106	2
2698	1106	6
2699	1106	10
2700	1106	11
2701	1106	33
2702	1107	11
2703	1107	30
2704	1107	31
2705	1108	5
2706	1108	16
2707	1108	35
2708	1109	8
2709	1109	13
2710	1109	33
2711	1109	34
2712	1110	3
2713	1110	22
2714	1110	23
2715	1110	31
2716	1111	12
2717	1111	35
2718	1112	4
2719	1112	28
2720	1113	30
2721	1114	28
2722	1114	33
2723	1114	34
2724	1115	2
2725	1115	5
2726	1115	7
2727	1115	8
2728	1115	32
2729	1116	4
2730	1116	11
2731	1117	5
2732	1117	15
2733	1117	20
2734	1117	34
2735	1118	5
2736	1118	13
2737	1118	21
2738	1118	32
2739	1119	10
2740	1119	21
2741	1119	25
2742	1119	28
2743	1120	9
2744	1121	9
2745	1121	16
2746	1121	23
2747	1121	31
2748	1122	15
2749	1122	23
2750	1123	10
2751	1123	31
2752	1124	4
2753	1124	28
2754	1125	35
2755	1126	8
2756	1126	17
2757	1126	35
2758	1127	8
2759	1127	9
2760	1127	12
2761	1127	24
2762	1127	30
2763	1128	9
2764	1128	28
2765	1129	13
2766	1129	16
2767	1129	17
2768	1129	25
2769	1129	32
2770	1130	13
2771	1130	15
2772	1130	29
2773	1130	31
2774	1131	2
2775	1131	9
2776	1131	16
2777	1131	34
2778	1131	35
2779	1132	34
2780	1133	4
2781	1133	9
2782	1133	15
2783	1133	21
2784	1133	28
2785	1134	2
2786	1134	8
2787	1134	26
2788	1135	1
2789	1135	13
2790	1135	23
2791	1135	33
2792	1135	35
2793	1136	8
2794	1136	16
2795	1136	20
2796	1137	4
2797	1137	32
2798	1138	3
2799	1138	12
2800	1138	16
2801	1139	6
2802	1139	19
2803	1139	29
2804	1141	10
2805	1141	18
2806	1141	20
2807	1141	28
2808	1142	16
2809	1142	26
2810	1142	33
2811	1143	9
2812	1143	19
2813	1143	24
2814	1143	25
2815	1144	22
2816	1145	11
2817	1146	5
2818	1146	16
2819	1146	18
2820	1146	35
2821	1147	3
2822	1147	15
2823	1147	16
2824	1147	23
2825	1147	25
2826	1148	14
2827	1149	10
2828	1149	19
2829	1149	21
2830	1149	32
2831	1149	34
2832	1150	12
2833	1150	23
2834	1150	24
2835	1150	29
2836	1151	17
2837	1152	3
2838	1152	35
2839	1153	2
2840	1153	21
2841	1153	33
2842	1154	7
2843	1154	19
2844	1154	21
2845	1155	3
2846	1155	22
2847	1155	31
2848	1156	9
2849	1156	11
2850	1157	11
2851	1157	15
2852	1157	20
2853	1159	35
2854	1160	22
2855	1161	6
2856	1161	12
2857	1161	24
2858	1161	30
2859	1162	30
2860	1163	9
2861	1163	11
2862	1163	20
2863	1163	30
2864	1163	32
2865	1164	14
2866	1164	21
2867	1164	30
2868	1165	2
2869	1165	10
2870	1165	23
2871	1165	27
2872	1165	32
2873	1166	11
2874	1166	12
2875	1166	14
2876	1166	35
2877	1167	1
2878	1167	12
2879	1167	13
2880	1167	16
2881	1167	22
2882	1167	25
2883	1167	35
2884	1168	2
2885	1168	12
2886	1168	25
2887	1169	23
2888	1170	11
2889	1170	28
2890	1170	29
2891	1171	3
2892	1171	25
2893	1171	27
2894	1171	28
2895	1172	21
2896	1173	6
2897	1173	32
2898	1173	34
2899	1174	35
2900	1175	4
2901	1175	12
2902	1176	1
2903	1176	12
2904	1177	5
2905	1177	7
2906	1177	22
2907	1177	26
2908	1177	31
2909	1178	16
2910	1178	19
2911	1179	9
2912	1179	32
2913	1180	2
2914	1180	22
2915	1180	27
2916	1180	33
2917	1181	29
2918	1181	32
2919	1181	34
2920	1182	14
2921	1182	26
2922	1182	34
2923	1183	8
2924	1184	9
2925	1184	11
2926	1184	12
2927	1184	21
2928	1185	2
2929	1185	11
2930	1185	27
2931	1185	34
2932	1186	22
2933	1187	10
2934	1187	11
2935	1187	19
2936	1187	31
2937	1187	34
2938	1188	1
2939	1189	3
2940	1189	4
2941	1189	24
2942	1189	28
2943	1190	5
2944	1190	19
2945	1190	21
2946	1191	30
2947	1194	6
2948	1194	17
2949	1194	19
2950	1195	13
2951	1195	24
2952	1195	31
2953	1196	6
2954	1196	18
2955	1196	23
2956	1197	1
2957	1198	1
2958	1198	24
2959	1198	33
2960	1199	13
2961	1199	25
2962	1199	30
2963	1199	33
2964	1200	7
2965	1201	12
2966	1202	2
2967	1203	4
2968	1203	6
2969	1204	2
2970	1204	6
2971	1204	21
2972	1204	27
2973	1205	8
2974	1206	1
2975	1206	5
2976	1206	21
2977	1206	31
2978	1208	8
2979	1208	21
2980	1208	22
2981	1208	24
2982	1208	30
2983	1209	9
2984	1209	17
2985	1209	20
2986	1209	34
2987	1212	14
2988	1213	4
2989	1213	11
2990	1213	15
2991	1214	10
2992	1215	14
2993	1216	1
2994	1217	7
2995	1217	10
2996	1217	16
2997	1217	26
2998	1219	32
2999	1219	34
3000	1221	2
3001	1221	4
3002	1221	13
3003	1221	23
3004	1221	34
3005	1222	6
3006	1222	31
3007	1222	33
3008	1223	5
3009	1223	9
3010	1223	12
3011	1223	20
3012	1223	25
3013	1224	23
3014	1224	34
3015	1225	2
3016	1225	5
3017	1225	13
\.


--
-- Data for Name: stage_feedback; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stage_feedback (id, stage, feedback, rate, date_rated, grader_id, receiver_id, team_id) FROM stdin;
\.


--
-- Data for Name: stage_task; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stage_task (id, stage, title, goal, status, schedule, student_id, team_id) FROM stdin;
\.


--
-- Data for Name: team_membership; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.team_membership (id, captain_id, course_id, project_id, student_id, team_id) FROM stdin;
1	301	35827	7	301	2
3	301	35827	0	301	3
\.


--
-- Data for Name: team_team; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.team_team (id, name, size, availability, grade, captain_id, course_id, project_id) FROM stdin;
2	char	5	t	0	301	35827	7
3	sth	5	t	0	301	35827	0
\.


--
-- Data for Name: user_instructor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_instructor (user_id, netid, email, "firstName", "lastName") FROM stdin;
\.


--
-- Data for Name: user_skill; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_skill (id, skill_name) FROM stdin;
1	AI 
2	algorithm
3	android development
4	backend
5	c
6	c++
7	compiler
8	computer architecture
9	computer vision
10	data science
11	data structure
12	deep learning
13	discrete maths
14	distributed system
15	FPGA
16	frontend
17	graphics
18	information science
19	IOS development
20	java
21	javascript
22	linear algebra
23	machine learning
24	networking
25	NLP
26	OS
27	parallel programming
28	probability
29	python
30	research
31	security
32	software engineering
33	system verilog
34	UI design
35	VR
\.


--
-- Data for Name: user_skillset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_skillset (id, score, skill_id, student_id) FROM stdin;
1	77	1	1
2	0	2	1
3	82	3	1
4	0	4	1
5	79	5	1
6	0	6	1
7	77	7	1
8	0	8	1
9	0	9	1
10	0	10	1
11	0	11	1
12	64	12	1
13	0	13	1
14	0	14	1
15	0	15	1
16	0	16	1
17	0	17	1
18	0	18	1
19	78	19	1
20	0	20	1
21	0	21	1
22	41	22	1
23	0	23	1
24	0	24	1
25	0	25	1
26	0	26	1
27	0	27	1
28	0	28	1
29	23	29	1
30	0	30	1
31	47	31	1
32	27	32	1
33	16	33	1
34	88	34	1
35	0	35	1
36	92	1	2
37	2	2	2
38	42	3	2
39	0	4	2
40	0	5	2
41	0	6	2
42	97	7	2
43	0	8	2
44	0	9	2
45	0	10	2
46	0	11	2
47	0	12	2
48	0	13	2
49	0	14	2
50	0	15	2
51	0	16	2
52	0	17	2
53	0	18	2
54	0	19	2
55	0	20	2
56	0	21	2
57	0	22	2
58	85	23	2
59	96	24	2
60	0	25	2
61	0	26	2
62	15	27	2
63	0	28	2
64	0	29	2
65	0	30	2
66	0	31	2
67	50	32	2
68	0	33	2
69	0	34	2
70	0	35	2
71	16	1	3
72	13	2	3
73	10	3	3
74	81	4	3
75	53	5	3
76	43	6	3
77	0	7	3
78	73	8	3
79	0	9	3
80	37	10	3
81	0	11	3
82	0	12	3
83	86	13	3
84	0	14	3
85	0	15	3
86	0	16	3
87	33	17	3
88	0	18	3
89	0	19	3
90	56	20	3
91	81	21	3
92	0	22	3
93	30	23	3
94	74	24	3
95	53	25	3
96	0	26	3
97	0	27	3
98	68	28	3
99	0	29	3
100	33	30	3
101	0	31	3
102	47	32	3
103	85	33	3
104	0	34	3
105	0	35	3
106	0	1	4
107	0	2	4
108	0	3	4
109	0	4	4
110	0	5	4
111	0	6	4
112	0	7	4
113	0	8	4
114	0	9	4
115	0	10	4
116	0	11	4
117	0	12	4
118	0	13	4
119	0	14	4
120	0	15	4
121	0	16	4
122	0	17	4
123	0	18	4
124	0	19	4
125	0	20	4
126	34	21	4
127	0	22	4
128	0	23	4
129	0	24	4
130	0	25	4
131	70	26	4
132	0	27	4
133	0	28	4
134	0	29	4
135	0	30	4
136	0	31	4
137	0	32	4
138	0	33	4
139	0	34	4
140	52	35	4
141	0	1	5
142	77	2	5
143	0	3	5
144	0	4	5
145	0	5	5
146	0	6	5
147	67	7	5
148	29	8	5
149	0	9	5
150	25	10	5
151	42	11	5
152	70	12	5
153	0	13	5
154	74	14	5
155	0	15	5
156	97	16	5
157	0	17	5
158	53	18	5
159	0	19	5
160	58	20	5
161	0	21	5
162	23	22	5
163	14	23	5
164	0	24	5
165	52	25	5
166	0	26	5
167	85	27	5
168	70	28	5
169	0	29	5
170	64	30	5
171	0	31	5
172	0	32	5
173	0	33	5
174	35	34	5
175	0	35	5
176	0	1	6
177	0	2	6
178	0	3	6
179	0	4	6
180	0	5	6
181	0	6	6
182	0	7	6
183	0	8	6
184	0	9	6
185	0	10	6
186	18	11	6
187	72	12	6
188	0	13	6
189	0	14	6
190	35	15	6
191	0	16	6
192	0	17	6
193	0	18	6
194	0	19	6
195	84	20	6
196	0	21	6
197	0	22	6
198	0	23	6
199	0	24	6
200	0	25	6
201	0	26	6
202	43	27	6
203	95	28	6
204	37	29	6
205	22	30	6
206	0	31	6
207	0	32	6
208	0	33	6
209	99	34	6
210	0	35	6
211	0	1	7
212	0	2	7
213	0	3	7
214	0	4	7
215	0	5	7
216	0	6	7
217	0	7	7
218	0	8	7
219	0	9	7
220	0	10	7
221	0	11	7
222	0	12	7
223	0	13	7
224	0	14	7
225	0	15	7
226	0	16	7
227	0	17	7
228	0	18	7
229	0	19	7
230	0	20	7
231	0	21	7
232	0	22	7
233	0	23	7
234	0	24	7
235	0	25	7
236	0	26	7
237	0	27	7
238	0	28	7
239	0	29	7
240	0	30	7
241	0	31	7
242	74	32	7
243	0	33	7
244	65	34	7
245	0	35	7
246	0	1	8
247	0	2	8
248	0	3	8
249	0	4	8
250	0	5	8
251	0	6	8
252	0	7	8
253	0	8	8
254	98	9	8
255	0	10	8
256	0	11	8
257	0	12	8
258	0	13	8
259	0	14	8
260	0	15	8
261	0	16	8
262	0	17	8
263	4	18	8
264	0	19	8
265	0	20	8
266	0	21	8
267	0	22	8
268	0	23	8
269	0	24	8
270	0	25	8
271	42	26	8
272	0	27	8
273	0	28	8
274	0	29	8
275	0	30	8
276	0	31	8
277	0	32	8
278	0	33	8
279	85	34	8
280	0	35	8
281	52	1	9
282	0	2	9
283	38	3	9
284	0	4	9
285	0	5	9
286	46	6	9
287	0	7	9
288	62	8	9
289	0	9	9
290	0	10	9
291	0	11	9
292	0	12	9
293	0	13	9
294	0	14	9
295	0	15	9
296	0	16	9
297	0	17	9
298	0	18	9
299	0	19	9
300	0	20	9
301	0	21	9
302	0	22	9
303	0	23	9
304	0	24	9
305	0	25	9
306	0	26	9
307	0	27	9
308	76	28	9
309	0	29	9
310	87	30	9
311	0	31	9
312	0	32	9
313	0	33	9
314	0	34	9
315	0	35	9
316	0	1	10
317	84	2	10
318	0	3	10
319	0	4	10
320	56	5	10
321	0	6	10
322	24	7	10
323	0	8	10
324	0	9	10
325	0	10	10
326	0	11	10
327	33	12	10
328	46	13	10
329	0	14	10
330	0	15	10
331	0	16	10
332	0	17	10
333	0	18	10
334	0	19	10
335	0	20	10
336	0	21	10
337	0	22	10
338	13	23	10
339	0	24	10
340	43	25	10
341	0	26	10
342	0	27	10
343	78	28	10
344	49	29	10
345	0	30	10
346	0	31	10
347	0	32	10
348	0	33	10
349	0	34	10
350	0	35	10
351	0	1	11
352	0	2	11
353	0	3	11
354	0	4	11
355	0	5	11
356	27	6	11
357	86	7	11
358	0	8	11
359	0	9	11
360	0	10	11
361	66	11	11
362	0	12	11
363	0	13	11
364	0	14	11
365	66	15	11
366	89	16	11
367	0	17	11
368	0	18	11
369	0	19	11
370	0	20	11
371	0	21	11
372	0	22	11
373	0	23	11
374	0	24	11
375	75	25	11
376	0	26	11
377	0	27	11
378	98	28	11
379	0	29	11
380	0	30	11
381	0	31	11
382	63	32	11
383	0	33	11
384	0	34	11
385	7	35	11
386	58	1	12
387	0	2	12
388	0	3	12
389	0	4	12
390	9	5	12
391	0	6	12
392	54	7	12
393	0	8	12
394	0	9	12
395	48	10	12
396	0	11	12
397	0	12	12
398	7	13	12
399	0	14	12
400	0	15	12
401	23	16	12
402	0	17	12
403	47	18	12
404	0	19	12
405	64	20	12
406	0	21	12
407	0	22	12
408	0	23	12
409	0	24	12
410	0	25	12
411	0	26	12
412	100	27	12
413	0	28	12
414	0	29	12
415	0	30	12
416	26	31	12
417	0	32	12
418	20	33	12
419	20	34	12
420	0	35	12
421	43	1	13
422	0	2	13
423	0	3	13
424	43	4	13
425	0	5	13
426	0	6	13
427	0	7	13
428	0	8	13
429	0	9	13
430	0	10	13
431	0	11	13
432	57	12	13
433	17	13	13
434	22	14	13
435	0	15	13
436	0	16	13
437	0	17	13
438	0	18	13
439	0	19	13
440	0	20	13
441	0	21	13
442	0	22	13
443	35	23	13
444	100	24	13
445	0	25	13
446	0	26	13
447	58	27	13
448	0	28	13
449	0	29	13
450	0	30	13
451	29	31	13
452	0	32	13
453	25	33	13
454	81	34	13
455	0	35	13
456	0	1	14
457	0	2	14
458	0	3	14
459	0	4	14
460	1	5	14
461	0	6	14
462	23	7	14
463	0	8	14
464	6	9	14
465	0	10	14
466	61	11	14
467	0	12	14
468	0	13	14
469	0	14	14
470	0	15	14
471	38	16	14
472	0	17	14
473	38	18	14
474	98	19	14
475	10	20	14
476	0	21	14
477	0	22	14
478	0	23	14
479	0	24	14
480	0	25	14
481	0	26	14
482	0	27	14
483	0	28	14
484	0	29	14
485	0	30	14
486	0	31	14
487	0	32	14
488	0	33	14
489	4	34	14
490	0	35	14
491	0	1	15
492	0	2	15
493	0	3	15
494	0	4	15
495	0	5	15
496	0	6	15
497	58	7	15
498	0	8	15
499	0	9	15
500	4	10	15
501	0	11	15
502	0	12	15
503	0	13	15
504	14	14	15
505	0	15	15
506	97	16	15
507	0	17	15
508	58	18	15
509	0	19	15
510	0	20	15
511	0	21	15
512	0	22	15
513	0	23	15
514	0	24	15
515	0	25	15
516	0	26	15
517	0	27	15
518	0	28	15
519	0	29	15
520	0	30	15
521	0	31	15
522	83	32	15
523	56	33	15
524	0	34	15
525	0	35	15
526	0	1	16
527	0	2	16
528	0	3	16
529	0	4	16
530	64	5	16
531	0	6	16
532	0	7	16
533	0	8	16
534	0	9	16
535	0	10	16
536	0	11	16
537	0	12	16
538	0	13	16
539	0	14	16
540	0	15	16
541	0	16	16
542	0	17	16
543	0	18	16
544	0	19	16
545	0	20	16
546	0	21	16
547	0	22	16
548	0	23	16
549	0	24	16
550	0	25	16
551	0	26	16
552	0	27	16
553	59	28	16
554	0	29	16
555	20	30	16
556	0	31	16
557	0	32	16
558	0	33	16
559	0	34	16
560	0	35	16
561	29	1	17
562	0	2	17
563	44	3	17
564	0	4	17
565	4	5	17
566	0	6	17
567	0	7	17
568	0	8	17
569	0	9	17
570	50	10	17
571	0	11	17
572	0	12	17
573	0	13	17
574	77	14	17
575	0	15	17
576	0	16	17
577	0	17	17
578	0	18	17
579	0	19	17
580	0	20	17
581	75	21	17
582	0	22	17
583	0	23	17
584	0	24	17
585	33	25	17
586	0	26	17
587	0	27	17
588	46	28	17
589	0	29	17
590	65	30	17
591	74	31	17
592	0	32	17
593	98	33	17
594	20	34	17
595	11	35	17
596	0	1	18
597	0	2	18
598	0	3	18
599	0	4	18
600	0	5	18
601	28	6	18
602	0	7	18
603	0	8	18
604	0	9	18
605	0	10	18
606	0	11	18
607	43	12	18
608	3	13	18
609	0	14	18
610	0	15	18
611	24	16	18
612	52	17	18
613	0	18	18
614	22	19	18
615	0	20	18
616	68	21	18
617	0	22	18
618	21	23	18
619	0	24	18
620	0	25	18
621	77	26	18
622	50	27	18
623	0	28	18
624	0	29	18
625	0	30	18
626	81	31	18
627	0	32	18
628	0	33	18
629	57	34	18
630	0	35	18
631	0	1	19
632	0	2	19
633	0	3	19
634	54	4	19
635	0	5	19
636	0	6	19
637	45	7	19
638	0	8	19
639	0	9	19
640	17	10	19
641	0	11	19
642	0	12	19
643	0	13	19
644	0	14	19
645	0	15	19
646	85	16	19
647	0	17	19
648	0	18	19
649	0	19	19
650	0	20	19
651	0	21	19
652	0	22	19
653	0	23	19
654	0	24	19
655	63	25	19
656	0	26	19
657	41	27	19
658	0	28	19
659	0	29	19
660	0	30	19
661	12	31	19
662	7	32	19
663	0	33	19
664	0	34	19
665	0	35	19
666	0	1	20
667	0	2	20
668	0	3	20
669	93	4	20
670	0	5	20
671	0	6	20
672	0	7	20
673	0	8	20
674	0	9	20
675	0	10	20
676	70	11	20
677	0	12	20
678	0	13	20
679	54	14	20
680	0	15	20
681	96	16	20
682	0	17	20
683	0	18	20
684	0	19	20
685	0	20	20
686	0	21	20
687	8	22	20
688	94	23	20
689	0	24	20
690	0	25	20
691	0	26	20
692	0	27	20
693	0	28	20
694	22	29	20
695	51	30	20
696	0	31	20
697	0	32	20
698	0	33	20
699	0	34	20
700	44	35	20
701	0	1	21
702	0	2	21
703	0	3	21
704	0	4	21
705	0	5	21
706	0	6	21
707	0	7	21
708	0	8	21
709	0	9	21
710	0	10	21
711	0	11	21
712	0	12	21
713	0	13	21
714	0	14	21
715	0	15	21
716	0	16	21
717	0	17	21
718	0	18	21
719	0	19	21
720	0	20	21
721	0	21	21
722	0	22	21
723	0	23	21
724	68	24	21
725	0	25	21
726	0	26	21
727	0	27	21
728	27	28	21
729	86	29	21
730	0	30	21
731	81	31	21
732	0	32	21
733	0	33	21
734	0	34	21
735	0	35	21
736	31	1	22
737	0	2	22
738	0	3	22
739	0	4	22
740	0	5	22
741	0	6	22
742	64	7	22
743	0	8	22
744	0	9	22
745	0	10	22
746	0	11	22
747	79	12	22
748	0	13	22
749	0	14	22
750	0	15	22
751	0	16	22
752	0	17	22
753	0	18	22
754	0	19	22
755	0	20	22
756	0	21	22
757	43	22	22
758	35	23	22
759	0	24	22
760	0	25	22
761	0	26	22
762	13	27	22
763	71	28	22
764	18	29	22
765	78	30	22
766	0	31	22
767	81	32	22
768	4	33	22
769	0	34	22
770	0	35	22
771	0	1	23
772	73	2	23
773	0	3	23
774	0	4	23
775	21	5	23
776	96	6	23
777	0	7	23
778	0	8	23
779	0	9	23
780	0	10	23
781	61	11	23
782	0	12	23
783	97	13	23
784	0	14	23
785	21	15	23
786	0	16	23
787	0	17	23
788	0	18	23
789	0	19	23
790	0	20	23
791	0	21	23
792	0	22	23
793	49	23	23
794	0	24	23
795	29	25	23
796	0	26	23
797	0	27	23
798	0	28	23
799	81	29	23
800	2	30	23
801	63	31	23
802	0	32	23
803	0	33	23
804	0	34	23
805	0	35	23
806	87	1	24
807	24	2	24
808	0	3	24
809	68	4	24
810	0	5	24
811	0	6	24
812	0	7	24
813	0	8	24
814	96	9	24
815	0	10	24
816	0	11	24
817	0	12	24
818	0	13	24
819	99	14	24
820	0	15	24
821	39	16	24
822	0	17	24
823	0	18	24
824	20	19	24
825	0	20	24
826	0	21	24
827	0	22	24
828	0	23	24
829	64	24	24
830	0	25	24
831	0	26	24
832	0	27	24
833	0	28	24
834	0	29	24
835	0	30	24
836	0	31	24
837	0	32	24
838	0	33	24
839	0	34	24
840	0	35	24
841	0	1	25
842	0	2	25
843	0	3	25
844	0	4	25
845	0	5	25
846	59	6	25
847	0	7	25
848	0	8	25
849	0	9	25
850	0	10	25
851	55	11	25
852	0	12	25
853	0	13	25
854	0	14	25
855	0	15	25
856	20	16	25
857	18	17	25
858	0	18	25
859	0	19	25
860	0	20	25
861	0	21	25
862	0	22	25
863	0	23	25
864	0	24	25
865	0	25	25
866	0	26	25
867	0	27	25
868	0	28	25
869	81	29	25
870	0	30	25
871	0	31	25
872	0	32	25
873	7	33	25
874	80	34	25
875	0	35	25
876	84	1	26
877	0	2	26
878	12	3	26
879	0	4	26
880	0	5	26
881	0	6	26
882	0	7	26
883	0	8	26
884	0	9	26
885	0	10	26
886	4	11	26
887	31	12	26
888	0	13	26
889	0	14	26
890	0	15	26
891	51	16	26
892	0	17	26
893	0	18	26
894	0	19	26
895	0	20	26
896	0	21	26
897	0	22	26
898	0	23	26
899	0	24	26
900	0	25	26
901	10	26	26
902	0	27	26
903	0	28	26
904	45	29	26
905	0	30	26
906	0	31	26
907	0	32	26
908	0	33	26
909	0	34	26
910	0	35	26
911	0	1	27
912	0	2	27
913	0	3	27
914	26	4	27
915	17	5	27
916	0	6	27
917	0	7	27
918	78	8	27
919	0	9	27
920	0	10	27
921	0	11	27
922	0	12	27
923	0	13	27
924	0	14	27
925	0	15	27
926	0	16	27
927	0	17	27
928	0	18	27
929	0	19	27
930	0	20	27
931	51	21	27
932	0	22	27
933	0	23	27
934	0	24	27
935	0	25	27
936	0	26	27
937	0	27	27
938	0	28	27
939	0	29	27
940	58	30	27
941	0	31	27
942	0	32	27
943	0	33	27
944	0	34	27
945	0	35	27
946	71	1	28
947	0	2	28
948	0	3	28
949	0	4	28
950	0	5	28
951	0	6	28
952	45	7	28
953	0	8	28
954	29	9	28
955	0	10	28
956	0	11	28
957	0	12	28
958	84	13	28
959	0	14	28
960	83	15	28
961	0	16	28
962	14	17	28
963	0	18	28
964	48	19	28
965	0	20	28
966	74	21	28
967	0	22	28
968	0	23	28
969	0	24	28
970	0	25	28
971	0	26	28
972	78	27	28
973	0	28	28
974	86	29	28
975	0	30	28
976	0	31	28
977	0	32	28
978	0	33	28
979	0	34	28
980	26	35	28
981	0	1	29
982	0	2	29
983	0	3	29
984	0	4	29
985	0	5	29
986	23	6	29
987	0	7	29
988	0	8	29
989	0	9	29
990	0	10	29
991	0	11	29
992	0	12	29
993	100	13	29
994	0	14	29
995	0	15	29
996	0	16	29
997	0	17	29
998	0	18	29
999	0	19	29
1000	7	20	29
1001	0	21	29
1002	0	22	29
1003	0	23	29
1004	0	24	29
1005	30	25	29
1006	85	26	29
1007	83	27	29
1008	0	28	29
1009	0	29	29
1010	0	30	29
1011	0	31	29
1012	0	32	29
1013	0	33	29
1014	35	34	29
1015	0	35	29
1016	0	1	30
1017	0	2	30
1018	30	3	30
1019	0	4	30
1020	0	5	30
1021	81	6	30
1022	0	7	30
1023	86	8	30
1024	0	9	30
1025	0	10	30
1026	0	11	30
1027	0	12	30
1028	0	13	30
1029	0	14	30
1030	0	15	30
1031	28	16	30
1032	0	17	30
1033	0	18	30
1034	48	19	30
1035	0	20	30
1036	30	21	30
1037	0	22	30
1038	0	23	30
1039	66	24	30
1040	0	25	30
1041	53	26	30
1042	0	27	30
1043	52	28	30
1044	24	29	30
1045	0	30	30
1046	0	31	30
1047	0	32	30
1048	0	33	30
1049	0	34	30
1050	0	35	30
1051	0	1	31
1052	0	2	31
1053	0	3	31
1054	0	4	31
1055	0	5	31
1056	0	6	31
1057	0	7	31
1058	0	8	31
1059	0	9	31
1060	0	10	31
1061	0	11	31
1062	0	12	31
1063	0	13	31
1064	0	14	31
1065	0	15	31
1066	0	16	31
1067	0	17	31
1068	0	18	31
1069	0	19	31
1070	0	20	31
1071	0	21	31
1072	0	22	31
1073	0	23	31
1074	0	24	31
1075	0	25	31
1076	0	26	31
1077	20	27	31
1078	0	28	31
1079	0	29	31
1080	0	30	31
1081	93	31	31
1082	0	32	31
1083	0	33	31
1084	0	34	31
1085	0	35	31
1086	0	1	32
1087	0	2	32
1088	0	3	32
1089	0	4	32
1090	98	5	32
1091	0	6	32
1092	0	7	32
1093	0	8	32
1094	0	9	32
1095	73	10	32
1096	0	11	32
1097	0	12	32
1098	0	13	32
1099	0	14	32
1100	0	15	32
1101	0	16	32
1102	0	17	32
1103	0	18	32
1104	0	19	32
1105	0	20	32
1106	0	21	32
1107	0	22	32
1108	0	23	32
1109	0	24	32
1110	55	25	32
1111	0	26	32
1112	0	27	32
1113	0	28	32
1114	0	29	32
1115	0	30	32
1116	0	31	32
1117	10	32	32
1118	0	33	32
1119	0	34	32
1120	5	35	32
1121	28	1	33
1122	0	2	33
1123	0	3	33
1124	0	4	33
1125	80	5	33
1126	0	6	33
1127	0	7	33
1128	95	8	33
1129	0	9	33
1130	29	10	33
1131	0	11	33
1132	0	12	33
1133	0	13	33
1134	14	14	33
1135	60	15	33
1136	0	16	33
1137	0	17	33
1138	79	18	33
1139	0	19	33
1140	0	20	33
1141	68	21	33
1142	0	22	33
1143	0	23	33
1144	0	24	33
1145	0	25	33
1146	0	26	33
1147	0	27	33
1148	0	28	33
1149	92	29	33
1150	0	30	33
1151	57	31	33
1152	0	32	33
1153	0	33	33
1154	34	34	33
1155	0	35	33
1156	27	1	34
1157	0	2	34
1158	0	3	34
1159	0	4	34
1160	0	5	34
1161	56	6	34
1162	88	7	34
1163	29	8	34
1164	0	9	34
1165	0	10	34
1166	0	11	34
1167	0	12	34
1168	98	13	34
1169	56	14	34
1170	2	15	34
1171	0	16	34
1172	22	17	34
1173	89	18	34
1174	34	19	34
1175	0	20	34
1176	0	21	34
1177	0	22	34
1178	0	23	34
1179	0	24	34
1180	21	25	34
1181	98	26	34
1182	5	27	34
1183	42	28	34
1184	0	29	34
1185	7	30	34
1186	69	31	34
1187	73	32	34
1188	0	33	34
1189	0	34	34
1190	82	35	34
1191	0	1	35
1192	0	2	35
1193	0	3	35
1194	0	4	35
1195	41	5	35
1196	0	6	35
1197	68	7	35
1198	0	8	35
1199	0	9	35
1200	0	10	35
1201	0	11	35
1202	0	12	35
1203	0	13	35
1204	0	14	35
1205	0	15	35
1206	0	16	35
1207	0	17	35
1208	87	18	35
1209	0	19	35
1210	83	20	35
1211	0	21	35
1212	0	22	35
1213	0	23	35
1214	0	24	35
1215	0	25	35
1216	0	26	35
1217	0	27	35
1218	0	28	35
1219	7	29	35
1220	0	30	35
1221	0	31	35
1222	0	32	35
1223	0	33	35
1224	83	34	35
1225	0	35	35
1226	0	1	36
1227	0	2	36
1228	0	3	36
1229	0	4	36
1230	0	5	36
1231	0	6	36
1232	0	7	36
1233	53	8	36
1234	0	9	36
1235	0	10	36
1236	0	11	36
1237	86	12	36
1238	100	13	36
1239	12	14	36
1240	0	15	36
1241	7	16	36
1242	75	17	36
1243	0	18	36
1244	0	19	36
1245	0	20	36
1246	0	21	36
1247	75	22	36
1248	0	23	36
1249	16	24	36
1250	80	25	36
1251	0	26	36
1252	0	27	36
1253	0	28	36
1254	0	29	36
1255	0	30	36
1256	0	31	36
1257	0	32	36
1258	0	33	36
1259	71	34	36
1260	0	35	36
1261	5	1	37
1262	0	2	37
1263	0	3	37
1264	0	4	37
1265	0	5	37
1266	35	6	37
1267	0	7	37
1268	97	8	37
1269	0	9	37
1270	84	10	37
1271	0	11	37
1272	0	12	37
1273	0	13	37
1274	77	14	37
1275	0	15	37
1276	16	16	37
1277	0	17	37
1278	71	18	37
1279	0	19	37
1280	0	20	37
1281	0	21	37
1282	0	22	37
1283	0	23	37
1284	0	24	37
1285	68	25	37
1286	0	26	37
1287	53	27	37
1288	0	28	37
1289	0	29	37
1290	59	30	37
1291	0	31	37
1292	67	32	37
1293	0	33	37
1294	82	34	37
1295	0	35	37
1296	1	1	38
1297	1	2	38
1298	0	3	38
1299	0	4	38
1300	0	5	38
1301	0	6	38
1302	0	7	38
1303	0	8	38
1304	0	9	38
1305	0	10	38
1306	0	11	38
1307	0	12	38
1308	0	13	38
1309	0	14	38
1310	31	15	38
1311	0	16	38
1312	0	17	38
1313	0	18	38
1314	0	19	38
1315	54	20	38
1316	69	21	38
1317	0	22	38
1318	33	23	38
1319	0	24	38
1320	27	25	38
1321	16	26	38
1322	27	27	38
1323	0	28	38
1324	0	29	38
1325	0	30	38
1326	0	31	38
1327	49	32	38
1328	46	33	38
1329	64	34	38
1330	98	35	38
1331	0	1	39
1332	0	2	39
1333	0	3	39
1334	0	4	39
1335	0	5	39
1336	61	6	39
1337	0	7	39
1338	0	8	39
1339	83	9	39
1340	0	10	39
1341	0	11	39
1342	0	12	39
1343	0	13	39
1344	0	14	39
1345	0	15	39
1346	0	16	39
1347	0	17	39
1348	0	18	39
1349	0	19	39
1350	0	20	39
1351	0	21	39
1352	0	22	39
1353	0	23	39
1354	4	24	39
1355	90	25	39
1356	0	26	39
1357	0	27	39
1358	0	28	39
1359	0	29	39
1360	0	30	39
1361	0	31	39
1362	0	32	39
1363	14	33	39
1364	0	34	39
1365	81	35	39
1366	0	1	40
1367	24	2	40
1368	66	3	40
1369	0	4	40
1370	52	5	40
1371	0	6	40
1372	0	7	40
1373	0	8	40
1374	36	9	40
1375	0	10	40
1376	21	11	40
1377	0	12	40
1378	74	13	40
1379	0	14	40
1380	0	15	40
1381	0	16	40
1382	10	17	40
1383	0	18	40
1384	0	19	40
1385	32	20	40
1386	0	21	40
1387	0	22	40
1388	95	23	40
1389	23	24	40
1390	16	25	40
1391	66	26	40
1392	66	27	40
1393	0	28	40
1394	0	29	40
1395	0	30	40
1396	0	31	40
1397	2	32	40
1398	82	33	40
1399	0	34	40
1400	0	35	40
1401	0	1	41
1402	0	2	41
1403	0	3	41
1404	0	4	41
1405	0	5	41
1406	0	6	41
1407	14	7	41
1408	0	8	41
1409	0	9	41
1410	0	10	41
1411	0	11	41
1412	0	12	41
1413	0	13	41
1414	0	14	41
1415	0	15	41
1416	0	16	41
1417	0	17	41
1418	0	18	41
1419	0	19	41
1420	0	20	41
1421	0	21	41
1422	38	22	41
1423	0	23	41
1424	0	24	41
1425	0	25	41
1426	0	26	41
1427	0	27	41
1428	11	28	41
1429	0	29	41
1430	0	30	41
1431	0	31	41
1432	0	32	41
1433	0	33	41
1434	0	34	41
1435	0	35	41
1436	0	1	42
1437	0	2	42
1438	0	3	42
1439	53	4	42
1440	0	5	42
1441	0	6	42
1442	0	7	42
1443	30	8	42
1444	0	9	42
1445	0	10	42
1446	19	11	42
1447	0	12	42
1448	0	13	42
1449	0	14	42
1450	0	15	42
1451	40	16	42
1452	0	17	42
1453	83	18	42
1454	33	19	42
1455	0	20	42
1456	0	21	42
1457	1	22	42
1458	0	23	42
1459	0	24	42
1460	19	25	42
1461	0	26	42
1462	27	27	42
1463	0	28	42
1464	0	29	42
1465	53	30	42
1466	0	31	42
1467	0	32	42
1468	0	33	42
1469	0	34	42
1470	0	35	42
1471	0	1	43
1472	0	2	43
1473	0	3	43
1474	26	4	43
1475	0	5	43
1476	5	6	43
1477	0	7	43
1478	87	8	43
1479	0	9	43
1480	0	10	43
1481	0	11	43
1482	0	12	43
1483	82	13	43
1484	77	14	43
1485	3	15	43
1486	0	16	43
1487	0	17	43
1488	0	18	43
1489	0	19	43
1490	0	20	43
1491	0	21	43
1492	28	22	43
1493	0	23	43
1494	55	24	43
1495	0	25	43
1496	0	26	43
1497	0	27	43
1498	0	28	43
1499	28	29	43
1500	0	30	43
1501	0	31	43
1502	0	32	43
1503	0	33	43
1504	0	34	43
1505	0	35	43
1506	31	1	44
1507	0	2	44
1508	0	3	44
1509	0	4	44
1510	0	5	44
1511	0	6	44
1512	0	7	44
1513	0	8	44
1514	0	9	44
1515	0	10	44
1516	0	11	44
1517	0	12	44
1518	0	13	44
1519	0	14	44
1520	0	15	44
1521	0	16	44
1522	0	17	44
1523	15	18	44
1524	0	19	44
1525	0	20	44
1526	0	21	44
1527	0	22	44
1528	0	23	44
1529	80	24	44
1530	0	25	44
1531	0	26	44
1532	0	27	44
1533	0	28	44
1534	52	29	44
1535	0	30	44
1536	0	31	44
1537	0	32	44
1538	0	33	44
1539	0	34	44
1540	84	35	44
1541	0	1	45
1542	0	2	45
1543	21	3	45
1544	6	4	45
1545	0	5	45
1546	0	6	45
1547	0	7	45
1548	0	8	45
1549	0	9	45
1550	0	10	45
1551	0	11	45
1552	0	12	45
1553	0	13	45
1554	19	14	45
1555	0	15	45
1556	0	16	45
1557	71	17	45
1558	0	18	45
1559	0	19	45
1560	0	20	45
1561	41	21	45
1562	0	22	45
1563	0	23	45
1564	39	24	45
1565	0	25	45
1566	0	26	45
1567	0	27	45
1568	0	28	45
1569	0	29	45
1570	0	30	45
1571	0	31	45
1572	0	32	45
1573	0	33	45
1574	0	34	45
1575	1	35	45
1576	0	1	46
1577	47	2	46
1578	0	3	46
1579	0	4	46
1580	28	5	46
1581	0	6	46
1582	0	7	46
1583	0	8	46
1584	47	9	46
1585	18	10	46
1586	0	11	46
1587	79	12	46
1588	79	13	46
1589	76	14	46
1590	0	15	46
1591	32	16	46
1592	0	17	46
1593	0	18	46
1594	0	19	46
1595	44	20	46
1596	25	21	46
1597	10	22	46
1598	0	23	46
1599	0	24	46
1600	79	25	46
1601	0	26	46
1602	39	27	46
1603	0	28	46
1604	0	29	46
1605	68	30	46
1606	83	31	46
1607	0	32	46
1608	69	33	46
1609	0	34	46
1610	19	35	46
1611	0	1	47
1612	0	2	47
1613	27	3	47
1614	0	4	47
1615	0	5	47
1616	29	6	47
1617	0	7	47
1618	0	8	47
1619	0	9	47
1620	0	10	47
1621	0	11	47
1622	0	12	47
1623	56	13	47
1624	0	14	47
1625	0	15	47
1626	0	16	47
1627	95	17	47
1628	0	18	47
1629	80	19	47
1630	0	20	47
1631	0	21	47
1632	54	22	47
1633	0	23	47
1634	95	24	47
1635	28	25	47
1636	0	26	47
1637	31	27	47
1638	0	28	47
1639	18	29	47
1640	44	30	47
1641	28	31	47
1642	22	32	47
1643	0	33	47
1644	0	34	47
1645	0	35	47
1646	0	1	48
1647	0	2	48
1648	0	3	48
1649	0	4	48
1650	0	5	48
1651	0	6	48
1652	67	7	48
1653	41	8	48
1654	0	9	48
1655	11	10	48
1656	0	11	48
1657	0	12	48
1658	100	13	48
1659	0	14	48
1660	0	15	48
1661	0	16	48
1662	0	17	48
1663	18	18	48
1664	0	19	48
1665	0	20	48
1666	0	21	48
1667	0	22	48
1668	0	23	48
1669	0	24	48
1670	54	25	48
1671	0	26	48
1672	0	27	48
1673	0	28	48
1674	0	29	48
1675	0	30	48
1676	0	31	48
1677	0	32	48
1678	61	33	48
1679	0	34	48
1680	0	35	48
1681	0	1	49
1682	0	2	49
1683	0	3	49
1684	0	4	49
1685	0	5	49
1686	0	6	49
1687	0	7	49
1688	0	8	49
1689	0	9	49
1690	0	10	49
1691	0	11	49
1692	0	12	49
1693	0	13	49
1694	0	14	49
1695	0	15	49
1696	0	16	49
1697	0	17	49
1698	26	18	49
1699	0	19	49
1700	0	20	49
1701	0	21	49
1702	0	22	49
1703	0	23	49
1704	0	24	49
1705	0	25	49
1706	0	26	49
1707	0	27	49
1708	0	28	49
1709	0	29	49
1710	0	30	49
1711	0	31	49
1712	0	32	49
1713	0	33	49
1714	0	34	49
1715	0	35	49
1716	0	1	50
1717	95	2	50
1718	0	3	50
1719	0	4	50
1720	0	5	50
1721	0	6	50
1722	17	7	50
1723	0	8	50
1724	0	9	50
1725	65	10	50
1726	0	11	50
1727	0	12	50
1728	0	13	50
1729	0	14	50
1730	0	15	50
1731	0	16	50
1732	0	17	50
1733	0	18	50
1734	0	19	50
1735	0	20	50
1736	0	21	50
1737	0	22	50
1738	0	23	50
1739	0	24	50
1740	0	25	50
1741	0	26	50
1742	0	27	50
1743	0	28	50
1744	0	29	50
1745	0	30	50
1746	0	31	50
1747	0	32	50
1748	0	33	50
1749	82	34	50
1750	0	35	50
1751	0	1	51
1752	0	2	51
1753	0	3	51
1754	0	4	51
1755	0	5	51
1756	0	6	51
1757	0	7	51
1758	0	8	51
1759	0	9	51
1760	0	10	51
1761	19	11	51
1762	0	12	51
1763	0	13	51
1764	0	14	51
1765	0	15	51
1766	0	16	51
1767	0	17	51
1768	39	18	51
1769	0	19	51
1770	0	20	51
1771	0	21	51
1772	0	22	51
1773	0	23	51
1774	77	24	51
1775	0	25	51
1776	0	26	51
1777	0	27	51
1778	0	28	51
1779	0	29	51
1780	0	30	51
1781	0	31	51
1782	0	32	51
1783	0	33	51
1784	3	34	51
1785	0	35	51
1786	84	1	52
1787	45	2	52
1788	0	3	52
1789	0	4	52
1790	0	5	52
1791	65	6	52
1792	0	7	52
1793	58	8	52
1794	0	9	52
1795	0	10	52
1796	0	11	52
1797	73	12	52
1798	0	13	52
1799	0	14	52
1800	0	15	52
1801	95	16	52
1802	0	17	52
1803	0	18	52
1804	0	19	52
1805	0	20	52
1806	9	21	52
1807	0	22	52
1808	0	23	52
1809	0	24	52
1810	31	25	52
1811	6	26	52
1812	0	27	52
1813	0	28	52
1814	0	29	52
1815	51	30	52
1816	0	31	52
1817	0	32	52
1818	33	33	52
1819	0	34	52
1820	0	35	52
1821	11	1	53
1822	0	2	53
1823	0	3	53
1824	0	4	53
1825	0	5	53
1826	0	6	53
1827	0	7	53
1828	0	8	53
1829	0	9	53
1830	25	10	53
1831	0	11	53
1832	0	12	53
1833	0	13	53
1834	55	14	53
1835	0	15	53
1836	0	16	53
1837	0	17	53
1838	30	18	53
1839	0	19	53
1840	35	20	53
1841	0	21	53
1842	59	22	53
1843	0	23	53
1844	0	24	53
1845	0	25	53
1846	0	26	53
1847	0	27	53
1848	6	28	53
1849	0	29	53
1850	0	30	53
1851	0	31	53
1852	64	32	53
1853	0	33	53
1854	4	34	53
1855	0	35	53
1856	0	1	54
1857	0	2	54
1858	0	3	54
1859	55	4	54
1860	61	5	54
1861	0	6	54
1862	0	7	54
1863	0	8	54
1864	0	9	54
1865	0	10	54
1866	0	11	54
1867	0	12	54
1868	0	13	54
1869	0	14	54
1870	7	15	54
1871	0	16	54
1872	0	17	54
1873	97	18	54
1874	0	19	54
1875	0	20	54
1876	0	21	54
1877	0	22	54
1878	0	23	54
1879	0	24	54
1880	0	25	54
1881	5	26	54
1882	0	27	54
1883	38	28	54
1884	0	29	54
1885	0	30	54
1886	0	31	54
1887	0	32	54
1888	0	33	54
1889	0	34	54
1890	63	35	54
1891	93	1	55
1892	0	2	55
1893	0	3	55
1894	0	4	55
1895	0	5	55
1896	0	6	55
1897	7	7	55
1898	65	8	55
1899	0	9	55
1900	0	10	55
1901	0	11	55
1902	55	12	55
1903	0	13	55
1904	40	14	55
1905	29	15	55
1906	0	16	55
1907	0	17	55
1908	68	18	55
1909	30	19	55
1910	0	20	55
1911	0	21	55
1912	0	22	55
1913	0	23	55
1914	55	24	55
1915	5	25	55
1916	0	26	55
1917	0	27	55
1918	0	28	55
1919	0	29	55
1920	85	30	55
1921	42	31	55
1922	0	32	55
1923	0	33	55
1924	0	34	55
1925	0	35	55
1926	0	1	56
1927	0	2	56
1928	0	3	56
1929	0	4	56
1930	0	5	56
1931	0	6	56
1932	90	7	56
1933	27	8	56
1934	0	9	56
1935	0	10	56
1936	0	11	56
1937	0	12	56
1938	55	13	56
1939	2	14	56
1940	0	15	56
1941	0	16	56
1942	0	17	56
1943	42	18	56
1944	83	19	56
1945	0	20	56
1946	0	21	56
1947	0	22	56
1948	0	23	56
1949	0	24	56
1950	65	25	56
1951	0	26	56
1952	97	27	56
1953	34	28	56
1954	0	29	56
1955	0	30	56
1956	0	31	56
1957	87	32	56
1958	10	33	56
1959	0	34	56
1960	34	35	56
1961	0	1	57
1962	16	2	57
1963	0	3	57
1964	0	4	57
1965	0	5	57
1966	0	6	57
1967	0	7	57
1968	0	8	57
1969	0	9	57
1970	0	10	57
1971	0	11	57
1972	0	12	57
1973	0	13	57
1974	0	14	57
1975	0	15	57
1976	0	16	57
1977	0	17	57
1978	0	18	57
1979	0	19	57
1980	0	20	57
1981	24	21	57
1982	0	22	57
1983	0	23	57
1984	0	24	57
1985	0	25	57
1986	0	26	57
1987	0	27	57
1988	0	28	57
1989	0	29	57
1990	0	30	57
1991	0	31	57
1992	0	32	57
1993	0	33	57
1994	0	34	57
1995	0	35	57
1996	0	1	58
1997	0	2	58
1998	33	3	58
1999	0	4	58
2000	0	5	58
2001	0	6	58
2002	0	7	58
2003	0	8	58
2004	29	9	58
2005	0	10	58
2006	0	11	58
2007	0	12	58
2008	0	13	58
2009	0	14	58
2010	49	15	58
2011	0	16	58
2012	0	17	58
2013	0	18	58
2014	0	19	58
2015	66	20	58
2016	24	21	58
2017	0	22	58
2018	0	23	58
2019	68	24	58
2020	0	25	58
2021	85	26	58
2022	0	27	58
2023	0	28	58
2024	58	29	58
2025	71	30	58
2026	0	31	58
2027	53	32	58
2028	0	33	58
2029	41	34	58
2030	0	35	58
2031	1	1	59
2032	88	2	59
2033	0	3	59
2034	0	4	59
2035	0	5	59
2036	0	6	59
2037	70	7	59
2038	0	8	59
2039	83	9	59
2040	44	10	59
2041	0	11	59
2042	0	12	59
2043	0	13	59
2044	0	14	59
2045	0	15	59
2046	0	16	59
2047	0	17	59
2048	0	18	59
2049	0	19	59
2050	72	20	59
2051	78	21	59
2052	0	22	59
2053	0	23	59
2054	51	24	59
2055	0	25	59
2056	56	26	59
2057	87	27	59
2058	0	28	59
2059	0	29	59
2060	64	30	59
2061	22	31	59
2062	0	32	59
2063	0	33	59
2064	99	34	59
2065	0	35	59
2066	0	1	60
2067	0	2	60
2068	0	3	60
2069	84	4	60
2070	0	5	60
2071	22	6	60
2072	0	7	60
2073	0	8	60
2074	92	9	60
2075	0	10	60
2076	0	11	60
2077	16	12	60
2078	0	13	60
2079	0	14	60
2080	0	15	60
2081	0	16	60
2082	0	17	60
2083	0	18	60
2084	0	19	60
2085	0	20	60
2086	0	21	60
2087	0	22	60
2088	51	23	60
2089	79	24	60
2090	0	25	60
2091	0	26	60
2092	41	27	60
2093	0	28	60
2094	0	29	60
2095	0	30	60
2096	0	31	60
2097	64	32	60
2098	5	33	60
2099	0	34	60
2100	90	35	60
2101	0	1	61
2102	23	2	61
2103	0	3	61
2104	96	4	61
2105	50	5	61
2106	0	6	61
2107	19	7	61
2108	0	8	61
2109	0	9	61
2110	37	10	61
2111	0	11	61
2112	0	12	61
2113	31	13	61
2114	0	14	61
2115	80	15	61
2116	0	16	61
2117	0	17	61
2118	0	18	61
2119	0	19	61
2120	0	20	61
2121	0	21	61
2122	0	22	61
2123	0	23	61
2124	0	24	61
2125	0	25	61
2126	0	26	61
2127	0	27	61
2128	0	28	61
2129	0	29	61
2130	0	30	61
2131	25	31	61
2132	0	32	61
2133	0	33	61
2134	0	34	61
2135	0	35	61
2136	7	1	62
2137	26	2	62
2138	0	3	62
2139	0	4	62
2140	0	5	62
2141	0	6	62
2142	0	7	62
2143	21	8	62
2144	0	9	62
2145	48	10	62
2146	0	11	62
2147	22	12	62
2148	52	13	62
2149	0	14	62
2150	94	15	62
2151	6	16	62
2152	95	17	62
2153	0	18	62
2154	89	19	62
2155	0	20	62
2156	0	21	62
2157	72	22	62
2158	0	23	62
2159	0	24	62
2160	92	25	62
2161	96	26	62
2162	15	27	62
2163	0	28	62
2164	84	29	62
2165	5	30	62
2166	0	31	62
2167	93	32	62
2168	0	33	62
2169	0	34	62
2170	48	35	62
2171	0	1	63
2172	0	2	63
2173	0	3	63
2174	0	4	63
2175	0	5	63
2176	0	6	63
2177	0	7	63
2178	0	8	63
2179	97	9	63
2180	29	10	63
2181	0	11	63
2182	0	12	63
2183	0	13	63
2184	0	14	63
2185	0	15	63
2186	86	16	63
2187	0	17	63
2188	0	18	63
2189	0	19	63
2190	64	20	63
2191	0	21	63
2192	0	22	63
2193	0	23	63
2194	18	24	63
2195	0	25	63
2196	0	26	63
2197	82	27	63
2198	0	28	63
2199	0	29	63
2200	47	30	63
2201	0	31	63
2202	0	32	63
2203	82	33	63
2204	67	34	63
2205	0	35	63
2206	0	1	64
2207	0	2	64
2208	0	3	64
2209	0	4	64
2210	9	5	64
2211	0	6	64
2212	30	7	64
2213	0	8	64
2214	0	9	64
2215	45	10	64
2216	0	11	64
2217	0	12	64
2218	0	13	64
2219	0	14	64
2220	0	15	64
2221	57	16	64
2222	0	17	64
2223	0	18	64
2224	0	19	64
2225	80	20	64
2226	57	21	64
2227	0	22	64
2228	0	23	64
2229	0	24	64
2230	0	25	64
2231	83	26	64
2232	0	27	64
2233	0	28	64
2234	0	29	64
2235	23	30	64
2236	0	31	64
2237	0	32	64
2238	0	33	64
2239	0	34	64
2240	0	35	64
2241	99	1	65
2242	0	2	65
2243	60	3	65
2244	0	4	65
2245	97	5	65
2246	67	6	65
2247	0	7	65
2248	11	8	65
2249	0	9	65
2250	55	10	65
2251	0	11	65
2252	22	12	65
2253	61	13	65
2254	86	14	65
2255	0	15	65
2256	0	16	65
2257	0	17	65
2258	100	18	65
2259	0	19	65
2260	0	20	65
2261	0	21	65
2262	0	22	65
2263	14	23	65
2264	0	24	65
2265	0	25	65
2266	0	26	65
2267	53	27	65
2268	7	28	65
2269	73	29	65
2270	0	30	65
2271	68	31	65
2272	0	32	65
2273	0	33	65
2274	0	34	65
2275	71	35	65
2276	0	1	66
2277	0	2	66
2278	0	3	66
2279	0	4	66
2280	0	5	66
2281	0	6	66
2282	27	7	66
2283	0	8	66
2284	0	9	66
2285	0	10	66
2286	24	11	66
2287	0	12	66
2288	0	13	66
2289	0	14	66
2290	0	15	66
2291	12	16	66
2292	0	17	66
2293	0	18	66
2294	0	19	66
2295	0	20	66
2296	0	21	66
2297	0	22	66
2298	23	23	66
2299	0	24	66
2300	0	25	66
2301	0	26	66
2302	0	27	66
2303	0	28	66
2304	0	29	66
2305	0	30	66
2306	0	31	66
2307	0	32	66
2308	0	33	66
2309	0	34	66
2310	0	35	66
2311	0	1	67
2312	0	2	67
2313	0	3	67
2314	0	4	67
2315	0	5	67
2316	4	6	67
2317	0	7	67
2318	0	8	67
2319	45	9	67
2320	0	10	67
2321	0	11	67
2322	0	12	67
2323	9	13	67
2324	0	14	67
2325	0	15	67
2326	0	16	67
2327	0	17	67
2328	0	18	67
2329	0	19	67
2330	0	20	67
2331	0	21	67
2332	0	22	67
2333	0	23	67
2334	0	24	67
2335	0	25	67
2336	0	26	67
2337	34	27	67
2338	0	28	67
2339	0	29	67
2340	0	30	67
2341	40	31	67
2342	96	32	67
2343	0	33	67
2344	39	34	67
2345	16	35	67
2346	0	1	68
2347	0	2	68
2348	0	3	68
2349	95	4	68
2350	0	5	68
2351	0	6	68
2352	59	7	68
2353	0	8	68
2354	0	9	68
2355	0	10	68
2356	0	11	68
2357	0	12	68
2358	0	13	68
2359	0	14	68
2360	0	15	68
2361	27	16	68
2362	0	17	68
2363	0	18	68
2364	0	19	68
2365	0	20	68
2366	2	21	68
2367	79	22	68
2368	0	23	68
2369	0	24	68
2370	0	25	68
2371	0	26	68
2372	0	27	68
2373	83	28	68
2374	48	29	68
2375	0	30	68
2376	0	31	68
2377	0	32	68
2378	59	33	68
2379	0	34	68
2380	0	35	68
2381	0	1	69
2382	0	2	69
2383	0	3	69
2384	0	4	69
2385	0	5	69
2386	0	6	69
2387	0	7	69
2388	0	8	69
2389	0	9	69
2390	0	10	69
2391	0	11	69
2392	0	12	69
2393	0	13	69
2394	21	14	69
2395	62	15	69
2396	0	16	69
2397	0	17	69
2398	37	18	69
2399	0	19	69
2400	29	20	69
2401	0	21	69
2402	0	22	69
2403	84	23	69
2404	0	24	69
2405	0	25	69
2406	0	26	69
2407	0	27	69
2408	0	28	69
2409	0	29	69
2410	0	30	69
2411	0	31	69
2412	0	32	69
2413	0	33	69
2414	94	34	69
2415	58	35	69
2416	34	1	70
2417	77	2	70
2418	0	3	70
2419	0	4	70
2420	0	5	70
2421	0	6	70
2422	0	7	70
2423	0	8	70
2424	0	9	70
2425	68	10	70
2426	0	11	70
2427	0	12	70
2428	69	13	70
2429	0	14	70
2430	42	15	70
2431	61	16	70
2432	0	17	70
2433	0	18	70
2434	0	19	70
2435	0	20	70
2436	0	21	70
2437	0	22	70
2438	0	23	70
2439	0	24	70
2440	26	25	70
2441	0	26	70
2442	0	27	70
2443	0	28	70
2444	0	29	70
2445	0	30	70
2446	0	31	70
2447	31	32	70
2448	59	33	70
2449	0	34	70
2450	0	35	70
2451	0	1	71
2452	0	2	71
2453	0	3	71
2454	0	4	71
2455	36	5	71
2456	0	6	71
2457	0	7	71
2458	0	8	71
2459	96	9	71
2460	0	10	71
2461	0	11	71
2462	0	12	71
2463	0	13	71
2464	92	14	71
2465	0	15	71
2466	80	16	71
2467	0	17	71
2468	56	18	71
2469	0	19	71
2470	0	20	71
2471	97	21	71
2472	0	22	71
2473	0	23	71
2474	0	24	71
2475	0	25	71
2476	0	26	71
2477	0	27	71
2478	0	28	71
2479	0	29	71
2480	0	30	71
2481	31	31	71
2482	0	32	71
2483	0	33	71
2484	0	34	71
2485	0	35	71
2486	0	1	72
2487	0	2	72
2488	0	3	72
2489	21	4	72
2490	0	5	72
2491	0	6	72
2492	25	7	72
2493	0	8	72
2494	0	9	72
2495	0	10	72
2496	0	11	72
2497	0	12	72
2498	0	13	72
2499	17	14	72
2500	0	15	72
2501	74	16	72
2502	0	17	72
2503	0	18	72
2504	12	19	72
2505	0	20	72
2506	0	21	72
2507	0	22	72
2508	92	23	72
2509	0	24	72
2510	0	25	72
2511	0	26	72
2512	0	27	72
2513	0	28	72
2514	0	29	72
2515	0	30	72
2516	0	31	72
2517	0	32	72
2518	0	33	72
2519	0	34	72
2520	0	35	72
2521	32	1	73
2522	0	2	73
2523	22	3	73
2524	0	4	73
2525	0	5	73
2526	0	6	73
2527	0	7	73
2528	78	8	73
2529	0	9	73
2530	0	10	73
2531	0	11	73
2532	0	12	73
2533	89	13	73
2534	0	14	73
2535	0	15	73
2536	0	16	73
2537	13	17	73
2538	85	18	73
2539	0	19	73
2540	0	20	73
2541	20	21	73
2542	0	22	73
2543	17	23	73
2544	18	24	73
2545	0	25	73
2546	79	26	73
2547	79	27	73
2548	4	28	73
2549	36	29	73
2550	0	30	73
2551	0	31	73
2552	0	32	73
2553	0	33	73
2554	0	34	73
2555	70	35	73
2556	85	1	74
2557	0	2	74
2558	6	3	74
2559	0	4	74
2560	0	5	74
2561	56	6	74
2562	0	7	74
2563	0	8	74
2564	0	9	74
2565	0	10	74
2566	16	11	74
2567	0	12	74
2568	91	13	74
2569	12	14	74
2570	24	15	74
2571	19	16	74
2572	8	17	74
2573	0	18	74
2574	57	19	74
2575	75	20	74
2576	0	21	74
2577	0	22	74
2578	93	23	74
2579	0	24	74
2580	0	25	74
2581	0	26	74
2582	18	27	74
2583	43	28	74
2584	0	29	74
2585	33	30	74
2586	0	31	74
2587	3	32	74
2588	0	33	74
2589	0	34	74
2590	10	35	74
2591	0	1	75
2592	0	2	75
2593	82	3	75
2594	0	4	75
2595	0	5	75
2596	0	6	75
2597	16	7	75
2598	0	8	75
2599	0	9	75
2600	0	10	75
2601	0	11	75
2602	0	12	75
2603	0	13	75
2604	0	14	75
2605	0	15	75
2606	0	16	75
2607	0	17	75
2608	0	18	75
2609	0	19	75
2610	52	20	75
2611	0	21	75
2612	0	22	75
2613	0	23	75
2614	0	24	75
2615	0	25	75
2616	0	26	75
2617	28	27	75
2618	0	28	75
2619	0	29	75
2620	80	30	75
2621	58	31	75
2622	70	32	75
2623	0	33	75
2624	56	34	75
2625	0	35	75
2626	0	1	76
2627	0	2	76
2628	0	3	76
2629	27	4	76
2630	0	5	76
2631	0	6	76
2632	0	7	76
2633	0	8	76
2634	0	9	76
2635	0	10	76
2636	0	11	76
2637	0	12	76
2638	0	13	76
2639	0	14	76
2640	0	15	76
2641	0	16	76
2642	0	17	76
2643	0	18	76
2644	0	19	76
2645	21	20	76
2646	0	21	76
2647	0	22	76
2648	52	23	76
2649	0	24	76
2650	0	25	76
2651	0	26	76
2652	42	27	76
2653	0	28	76
2654	0	29	76
2655	0	30	76
2656	0	31	76
2657	44	32	76
2658	0	33	76
2659	0	34	76
2660	0	35	76
2661	0	1	77
2662	24	2	77
2663	72	3	77
2664	28	4	77
2665	0	5	77
2666	0	6	77
2667	0	7	77
2668	0	8	77
2669	0	9	77
2670	0	10	77
2671	61	11	77
2672	0	12	77
2673	0	13	77
2674	0	14	77
2675	0	15	77
2676	45	16	77
2677	0	17	77
2678	0	18	77
2679	32	19	77
2680	0	20	77
2681	0	21	77
2682	0	22	77
2683	0	23	77
2684	85	24	77
2685	0	25	77
2686	45	26	77
2687	29	27	77
2688	0	28	77
2689	96	29	77
2690	0	30	77
2691	0	31	77
2692	0	32	77
2693	37	33	77
2694	0	34	77
2695	77	35	77
2696	0	1	78
2697	0	2	78
2698	0	3	78
2699	0	4	78
2700	0	5	78
2701	0	6	78
2702	0	7	78
2703	0	8	78
2704	0	9	78
2705	0	10	78
2706	0	11	78
2707	50	12	78
2708	0	13	78
2709	0	14	78
2710	0	15	78
2711	0	16	78
2712	0	17	78
2713	0	18	78
2714	0	19	78
2715	69	20	78
2716	27	21	78
2717	0	22	78
2718	0	23	78
2719	0	24	78
2720	0	25	78
2721	31	26	78
2722	0	27	78
2723	0	28	78
2724	0	29	78
2725	0	30	78
2726	0	31	78
2727	0	32	78
2728	0	33	78
2729	0	34	78
2730	0	35	78
2731	0	1	79
2732	0	2	79
2733	24	3	79
2734	0	4	79
2735	0	5	79
2736	0	6	79
2737	0	7	79
2738	0	8	79
2739	0	9	79
2740	0	10	79
2741	0	11	79
2742	0	12	79
2743	0	13	79
2744	8	14	79
2745	0	15	79
2746	0	16	79
2747	0	17	79
2748	0	18	79
2749	0	19	79
2750	0	20	79
2751	0	21	79
2752	0	22	79
2753	68	23	79
2754	0	24	79
2755	0	25	79
2756	0	26	79
2757	0	27	79
2758	0	28	79
2759	0	29	79
2760	10	30	79
2761	0	31	79
2762	0	32	79
2763	0	33	79
2764	22	34	79
2765	0	35	79
2766	0	1	80
2767	0	2	80
2768	0	3	80
2769	0	4	80
2770	0	5	80
2771	0	6	80
2772	0	7	80
2773	0	8	80
2774	0	9	80
2775	0	10	80
2776	0	11	80
2777	77	12	80
2778	0	13	80
2779	0	14	80
2780	0	15	80
2781	0	16	80
2782	0	17	80
2783	36	18	80
2784	0	19	80
2785	0	20	80
2786	0	21	80
2787	0	22	80
2788	0	23	80
2789	0	24	80
2790	0	25	80
2791	0	26	80
2792	0	27	80
2793	0	28	80
2794	0	29	80
2795	0	30	80
2796	0	31	80
2797	0	32	80
2798	0	33	80
2799	0	34	80
2800	0	35	80
2801	0	1	81
2802	0	2	81
2803	0	3	81
2804	0	4	81
2805	45	5	81
2806	17	6	81
2807	0	7	81
2808	45	8	81
2809	0	9	81
2810	0	10	81
2811	0	11	81
2812	0	12	81
2813	0	13	81
2814	0	14	81
2815	0	15	81
2816	20	16	81
2817	0	17	81
2818	31	18	81
2819	0	19	81
2820	0	20	81
2821	0	21	81
2822	0	22	81
2823	0	23	81
2824	0	24	81
2825	68	25	81
2826	0	26	81
2827	0	27	81
2828	0	28	81
2829	53	29	81
2830	0	30	81
2831	0	31	81
2832	0	32	81
2833	26	33	81
2834	0	34	81
2835	61	35	81
2836	0	1	82
2837	0	2	82
2838	0	3	82
2839	0	4	82
2840	0	5	82
2841	0	6	82
2842	17	7	82
2843	0	8	82
2844	0	9	82
2845	0	10	82
2846	95	11	82
2847	60	12	82
2848	98	13	82
2849	0	14	82
2850	0	15	82
2851	0	16	82
2852	0	17	82
2853	28	18	82
2854	57	19	82
2855	0	20	82
2856	0	21	82
2857	0	22	82
2858	0	23	82
2859	0	24	82
2860	0	25	82
2861	0	26	82
2862	82	27	82
2863	0	28	82
2864	0	29	82
2865	0	30	82
2866	0	31	82
2867	0	32	82
2868	0	33	82
2869	0	34	82
2870	0	35	82
2871	0	1	83
2872	0	2	83
2873	0	3	83
2874	18	4	83
2875	0	5	83
2876	0	6	83
2877	0	7	83
2878	0	8	83
2879	0	9	83
2880	0	10	83
2881	0	11	83
2882	0	12	83
2883	0	13	83
2884	30	14	83
2885	0	15	83
2886	0	16	83
2887	0	17	83
2888	0	18	83
2889	0	19	83
2890	0	20	83
2891	0	21	83
2892	0	22	83
2893	0	23	83
2894	0	24	83
2895	0	25	83
2896	0	26	83
2897	0	27	83
2898	0	28	83
2899	100	29	83
2900	0	30	83
2901	0	31	83
2902	0	32	83
2903	0	33	83
2904	73	34	83
2905	0	35	83
2906	0	1	84
2907	0	2	84
2908	0	3	84
2909	0	4	84
2910	0	5	84
2911	0	6	84
2912	0	7	84
2913	90	8	84
2914	0	9	84
2915	0	10	84
2916	0	11	84
2917	0	12	84
2918	58	13	84
2919	0	14	84
2920	0	15	84
2921	100	16	84
2922	0	17	84
2923	0	18	84
2924	0	19	84
2925	0	20	84
2926	0	21	84
2927	62	22	84
2928	16	23	84
2929	0	24	84
2930	0	25	84
2931	23	26	84
2932	0	27	84
2933	92	28	84
2934	10	29	84
2935	72	30	84
2936	0	31	84
2937	0	32	84
2938	0	33	84
2939	0	34	84
2940	88	35	84
2941	0	1	85
2942	0	2	85
2943	45	3	85
2944	0	4	85
2945	0	5	85
2946	0	6	85
2947	0	7	85
2948	0	8	85
2949	0	9	85
2950	0	10	85
2951	0	11	85
2952	0	12	85
2953	77	13	85
2954	0	14	85
2955	0	15	85
2956	50	16	85
2957	0	17	85
2958	0	18	85
2959	0	19	85
2960	0	20	85
2961	0	21	85
2962	0	22	85
2963	0	23	85
2964	0	24	85
2965	44	25	85
2966	0	26	85
2967	0	27	85
2968	0	28	85
2969	0	29	85
2970	0	30	85
2971	0	31	85
2972	30	32	85
2973	0	33	85
2974	0	34	85
2975	11	35	85
2976	95	1	86
2977	0	2	86
2978	77	3	86
2979	8	4	86
2980	76	5	86
2981	36	6	86
2982	0	7	86
2983	0	8	86
2984	0	9	86
2985	0	10	86
2986	0	11	86
2987	0	12	86
2988	0	13	86
2989	71	14	86
2990	0	15	86
2991	0	16	86
2992	0	17	86
2993	38	18	86
2994	0	19	86
2995	97	20	86
2996	0	21	86
2997	27	22	86
2998	20	23	86
2999	0	24	86
3000	46	25	86
3001	0	26	86
3002	0	27	86
3003	0	28	86
3004	55	29	86
3005	39	30	86
3006	0	31	86
3007	16	32	86
3008	41	33	86
3009	0	34	86
3010	55	35	86
3011	0	1	87
3012	93	2	87
3013	27	3	87
3014	42	4	87
3015	0	5	87
3016	0	6	87
3017	62	7	87
3018	0	8	87
3019	11	9	87
3020	0	10	87
3021	82	11	87
3022	0	12	87
3023	21	13	87
3024	0	14	87
3025	62	15	87
3026	8	16	87
3027	83	17	87
3028	0	18	87
3029	30	19	87
3030	5	20	87
3031	0	21	87
3032	34	22	87
3033	11	23	87
3034	0	24	87
3035	0	25	87
3036	53	26	87
3037	17	27	87
3038	100	28	87
3039	27	29	87
3040	25	30	87
3041	13	31	87
3042	0	32	87
3043	44	33	87
3044	0	34	87
3045	0	35	87
3046	0	1	88
3047	67	2	88
3048	0	3	88
3049	91	4	88
3050	70	5	88
3051	0	6	88
3052	0	7	88
3053	0	8	88
3054	7	9	88
3055	0	10	88
3056	0	11	88
3057	0	12	88
3058	0	13	88
3059	0	14	88
3060	0	15	88
3061	0	16	88
3062	85	17	88
3063	99	18	88
3064	89	19	88
3065	0	20	88
3066	0	21	88
3067	0	22	88
3068	0	23	88
3069	93	24	88
3070	0	25	88
3071	0	26	88
3072	95	27	88
3073	0	28	88
3074	0	29	88
3075	30	30	88
3076	0	31	88
3077	3	32	88
3078	0	33	88
3079	0	34	88
3080	0	35	88
3081	79	1	89
3082	0	2	89
3083	2	3	89
3084	0	4	89
3085	73	5	89
3086	0	6	89
3087	0	7	89
3088	0	8	89
3089	26	9	89
3090	0	10	89
3091	0	11	89
3092	0	12	89
3093	0	13	89
3094	0	14	89
3095	0	15	89
3096	0	16	89
3097	0	17	89
3098	0	18	89
3099	0	19	89
3100	0	20	89
3101	0	21	89
3102	0	22	89
3103	0	23	89
3104	0	24	89
3105	0	25	89
3106	0	26	89
3107	72	27	89
3108	0	28	89
3109	0	29	89
3110	0	30	89
3111	0	31	89
3112	0	32	89
3113	0	33	89
3114	0	34	89
3115	0	35	89
3116	0	1	90
3117	0	2	90
3118	0	3	90
3119	0	4	90
3120	0	5	90
3121	0	6	90
3122	0	7	90
3123	0	8	90
3124	0	9	90
3125	0	10	90
3126	0	11	90
3127	66	12	90
3128	0	13	90
3129	30	14	90
3130	0	15	90
3131	0	16	90
3132	0	17	90
3133	0	18	90
3134	0	19	90
3135	70	20	90
3136	0	21	90
3137	0	22	90
3138	0	23	90
3139	0	24	90
3140	51	25	90
3141	0	26	90
3142	0	27	90
3143	14	28	90
3144	85	29	90
3145	0	30	90
3146	0	31	90
3147	0	32	90
3148	0	33	90
3149	0	34	90
3150	7	35	90
3151	0	1	91
3152	0	2	91
3153	30	3	91
3154	0	4	91
3155	11	5	91
3156	0	6	91
3157	22	7	91
3158	0	8	91
3159	0	9	91
3160	0	10	91
3161	91	11	91
3162	38	12	91
3163	0	13	91
3164	0	14	91
3165	0	15	91
3166	0	16	91
3167	0	17	91
3168	0	18	91
3169	33	19	91
3170	0	20	91
3171	0	21	91
3172	0	22	91
3173	25	23	91
3174	0	24	91
3175	80	25	91
3176	89	26	91
3177	0	27	91
3178	0	28	91
3179	0	29	91
3180	0	30	91
3181	75	31	91
3182	26	32	91
3183	0	33	91
3184	0	34	91
3185	0	35	91
3186	0	1	92
3187	0	2	92
3188	0	3	92
3189	0	4	92
3190	54	5	92
3191	0	6	92
3192	87	7	92
3193	0	8	92
3194	0	9	92
3195	7	10	92
3196	0	11	92
3197	0	12	92
3198	97	13	92
3199	0	14	92
3200	0	15	92
3201	72	16	92
3202	0	17	92
3203	0	18	92
3204	0	19	92
3205	0	20	92
3206	0	21	92
3207	0	22	92
3208	0	23	92
3209	0	24	92
3210	82	25	92
3211	0	26	92
3212	61	27	92
3213	0	28	92
3214	0	29	92
3215	0	30	92
3216	24	31	92
3217	98	32	92
3218	0	33	92
3219	15	34	92
3220	53	35	92
3221	0	1	93
3222	0	2	93
3223	0	3	93
3224	25	4	93
3225	0	5	93
3226	41	6	93
3227	0	7	93
3228	0	8	93
3229	0	9	93
3230	0	10	93
3231	0	11	93
3232	0	12	93
3233	0	13	93
3234	0	14	93
3235	0	15	93
3236	20	16	93
3237	0	17	93
3238	0	18	93
3239	0	19	93
3240	0	20	93
3241	0	21	93
3242	2	22	93
3243	0	23	93
3244	0	24	93
3245	0	25	93
3246	0	26	93
3247	0	27	93
3248	0	28	93
3249	0	29	93
3250	2	30	93
3251	0	31	93
3252	0	32	93
3253	0	33	93
3254	0	34	93
3255	0	35	93
3256	0	1	94
3257	0	2	94
3258	23	3	94
3259	0	4	94
3260	0	5	94
3261	0	6	94
3262	0	7	94
3263	0	8	94
3264	0	9	94
3265	0	10	94
3266	0	11	94
3267	0	12	94
3268	0	13	94
3269	0	14	94
3270	56	15	94
3271	0	16	94
3272	0	17	94
3273	0	18	94
3274	0	19	94
3275	0	20	94
3276	0	21	94
3277	71	22	94
3278	0	23	94
3279	0	24	94
3280	0	25	94
3281	83	26	94
3282	0	27	94
3283	0	28	94
3284	0	29	94
3285	0	30	94
3286	0	31	94
3287	0	32	94
3288	0	33	94
3289	0	34	94
3290	0	35	94
3291	0	1	95
3292	0	2	95
3293	0	3	95
3294	0	4	95
3295	70	5	95
3296	0	6	95
3297	0	7	95
3298	0	8	95
3299	58	9	95
3300	0	10	95
3301	0	11	95
3302	0	12	95
3303	58	13	95
3304	0	14	95
3305	0	15	95
3306	63	16	95
3307	58	17	95
3308	0	18	95
3309	0	19	95
3310	0	20	95
3311	0	21	95
3312	0	22	95
3313	0	23	95
3314	69	24	95
3315	65	25	95
3316	0	26	95
3317	0	27	95
3318	0	28	95
3319	0	29	95
3320	39	30	95
3321	0	31	95
3322	0	32	95
3323	0	33	95
3324	0	34	95
3325	17	35	95
3326	0	1	96
3327	0	2	96
3328	0	3	96
3329	0	4	96
3330	0	5	96
3331	0	6	96
3332	0	7	96
3333	0	8	96
3334	0	9	96
3335	69	10	96
3336	0	11	96
3337	0	12	96
3338	0	13	96
3339	0	14	96
3340	0	15	96
3341	0	16	96
3342	0	17	96
3343	0	18	96
3344	0	19	96
3345	34	20	96
3346	0	21	96
3347	0	22	96
3348	0	23	96
3349	0	24	96
3350	0	25	96
3351	0	26	96
3352	0	27	96
3353	0	28	96
3354	69	29	96
3355	0	30	96
3356	0	31	96
3357	0	32	96
3358	0	33	96
3359	62	34	96
3360	0	35	96
3361	0	1	97
3362	0	2	97
3363	0	3	97
3364	65	4	97
3365	0	5	97
3366	0	6	97
3367	60	7	97
3368	0	8	97
3369	53	9	97
3370	0	10	97
3371	0	11	97
3372	45	12	97
3373	0	13	97
3374	20	14	97
3375	0	15	97
3376	0	16	97
3377	0	17	97
3378	0	18	97
3379	2	19	97
3380	0	20	97
3381	0	21	97
3382	78	22	97
3383	0	23	97
3384	89	24	97
3385	0	25	97
3386	0	26	97
3387	0	27	97
3388	64	28	97
3389	65	29	97
3390	0	30	97
3391	0	31	97
3392	3	32	97
3393	0	33	97
3394	0	34	97
3395	0	35	97
3396	8	1	98
3397	0	2	98
3398	0	3	98
3399	0	4	98
3400	0	5	98
3401	0	6	98
3402	0	7	98
3403	0	8	98
3404	23	9	98
3405	0	10	98
3406	0	11	98
3407	0	12	98
3408	42	13	98
3409	32	14	98
3410	0	15	98
3411	0	16	98
3412	0	17	98
3413	67	18	98
3414	88	19	98
3415	0	20	98
3416	0	21	98
3417	0	22	98
3418	0	23	98
3419	0	24	98
3420	0	25	98
3421	0	26	98
3422	0	27	98
3423	45	28	98
3424	70	29	98
3425	15	30	98
3426	0	31	98
3427	0	32	98
3428	0	33	98
3429	23	34	98
3430	0	35	98
3431	0	1	99
3432	0	2	99
3433	0	3	99
3434	0	4	99
3435	0	5	99
3436	0	6	99
3437	62	7	99
3438	0	8	99
3439	0	9	99
3440	0	10	99
3441	0	11	99
3442	0	12	99
3443	0	13	99
3444	0	14	99
3445	5	15	99
3446	0	16	99
3447	7	17	99
3448	0	18	99
3449	0	19	99
3450	0	20	99
3451	35	21	99
3452	0	22	99
3453	0	23	99
3454	0	24	99
3455	0	25	99
3456	0	26	99
3457	0	27	99
3458	0	28	99
3459	0	29	99
3460	0	30	99
3461	0	31	99
3462	0	32	99
3463	0	33	99
3464	0	34	99
3465	0	35	99
3466	0	1	100
3467	0	2	100
3468	96	3	100
3469	0	4	100
3470	0	5	100
3471	0	6	100
3472	0	7	100
3473	88	8	100
3474	44	9	100
3475	0	10	100
3476	82	11	100
3477	90	12	100
3478	21	13	100
3479	90	14	100
3480	37	15	100
3481	41	16	100
3482	0	17	100
3483	0	18	100
3484	0	19	100
3485	46	20	100
3486	0	21	100
3487	50	22	100
3488	0	23	100
3489	0	24	100
3490	17	25	100
3491	0	26	100
3492	19	27	100
3493	31	28	100
3494	0	29	100
3495	0	30	100
3496	0	31	100
3497	0	32	100
3498	0	33	100
3499	79	34	100
3500	0	35	100
3501	94	1	101
3502	0	2	101
3503	0	3	101
3504	0	4	101
3505	0	5	101
3506	0	6	101
3507	0	7	101
3508	0	8	101
3509	0	9	101
3510	0	10	101
3511	0	11	101
3512	0	12	101
3513	40	13	101
3514	0	14	101
3515	0	15	101
3516	0	16	101
3517	0	17	101
3518	0	18	101
3519	0	19	101
3520	0	20	101
3521	0	21	101
3522	0	22	101
3523	0	23	101
3524	0	24	101
3525	0	25	101
3526	15	26	101
3527	65	27	101
3528	0	28	101
3529	25	29	101
3530	0	30	101
3531	32	31	101
3532	0	32	101
3533	0	33	101
3534	0	34	101
3535	0	35	101
3536	0	1	102
3537	39	2	102
3538	0	3	102
3539	74	4	102
3540	20	5	102
3541	0	6	102
3542	0	7	102
3543	55	8	102
3544	0	9	102
3545	0	10	102
3546	31	11	102
3547	0	12	102
3548	0	13	102
3549	0	14	102
3550	0	15	102
3551	0	16	102
3552	0	17	102
3553	59	18	102
3554	0	19	102
3555	83	20	102
3556	38	21	102
3557	0	22	102
3558	0	23	102
3559	0	24	102
3560	0	25	102
3561	0	26	102
3562	0	27	102
3563	0	28	102
3564	30	29	102
3565	0	30	102
3566	0	31	102
3567	0	32	102
3568	0	33	102
3569	0	34	102
3570	0	35	102
3571	0	1	103
3572	56	2	103
3573	0	3	103
3574	0	4	103
3575	0	5	103
3576	25	6	103
3577	16	7	103
3578	0	8	103
3579	0	9	103
3580	0	10	103
3581	0	11	103
3582	77	12	103
3583	0	13	103
3584	0	14	103
3585	0	15	103
3586	0	16	103
3587	0	17	103
3588	0	18	103
3589	31	19	103
3590	0	20	103
3591	0	21	103
3592	0	22	103
3593	0	23	103
3594	0	24	103
3595	0	25	103
3596	0	26	103
3597	0	27	103
3598	0	28	103
3599	70	29	103
3600	0	30	103
3601	84	31	103
3602	0	32	103
3603	19	33	103
3604	0	34	103
3605	0	35	103
3606	31	1	104
3607	0	2	104
3608	0	3	104
3609	25	4	104
3610	0	5	104
3611	73	6	104
3612	51	7	104
3613	11	8	104
3614	53	9	104
3615	0	10	104
3616	36	11	104
3617	0	12	104
3618	0	13	104
3619	85	14	104
3620	12	15	104
3621	69	16	104
3622	0	17	104
3623	0	18	104
3624	34	19	104
3625	0	20	104
3626	94	21	104
3627	0	22	104
3628	0	23	104
3629	12	24	104
3630	0	25	104
3631	0	26	104
3632	0	27	104
3633	0	28	104
3634	0	29	104
3635	0	30	104
3636	0	31	104
3637	0	32	104
3638	60	33	104
3639	97	34	104
3640	48	35	104
3641	0	1	105
3642	0	2	105
3643	43	3	105
3644	0	4	105
3645	0	5	105
3646	0	6	105
3647	0	7	105
3648	0	8	105
3649	0	9	105
3650	0	10	105
3651	0	11	105
3652	0	12	105
3653	0	13	105
3654	0	14	105
3655	0	15	105
3656	0	16	105
3657	0	17	105
3658	0	18	105
3659	0	19	105
3660	0	20	105
3661	0	21	105
3662	45	22	105
3663	0	23	105
3664	0	24	105
3665	0	25	105
3666	65	26	105
3667	0	27	105
3668	0	28	105
3669	0	29	105
3670	0	30	105
3671	16	31	105
3672	54	32	105
3673	0	33	105
3674	0	34	105
3675	0	35	105
3676	0	1	106
3677	0	2	106
3678	0	3	106
3679	0	4	106
3680	0	5	106
3681	96	6	106
3682	49	7	106
3683	54	8	106
3684	0	9	106
3685	0	10	106
3686	0	11	106
3687	0	12	106
3688	0	13	106
3689	0	14	106
3690	0	15	106
3691	0	16	106
3692	0	17	106
3693	43	18	106
3694	0	19	106
3695	0	20	106
3696	0	21	106
3697	0	22	106
3698	0	23	106
3699	0	24	106
3700	0	25	106
3701	0	26	106
3702	0	27	106
3703	0	28	106
3704	0	29	106
3705	0	30	106
3706	0	31	106
3707	0	32	106
3708	0	33	106
3709	15	34	106
3710	0	35	106
3711	0	1	107
3712	0	2	107
3713	0	3	107
3714	87	4	107
3715	0	5	107
3716	0	6	107
3717	98	7	107
3718	0	8	107
3719	63	9	107
3720	0	10	107
3721	0	11	107
3722	88	12	107
3723	46	13	107
3724	0	14	107
3725	97	15	107
3726	0	16	107
3727	0	17	107
3728	0	18	107
3729	0	19	107
3730	0	20	107
3731	0	21	107
3732	100	22	107
3733	0	23	107
3734	0	24	107
3735	0	25	107
3736	0	26	107
3737	88	27	107
3738	0	28	107
3739	0	29	107
3740	30	30	107
3741	0	31	107
3742	0	32	107
3743	59	33	107
3744	0	34	107
3745	1	35	107
3746	0	1	108
3747	0	2	108
3748	0	3	108
3749	0	4	108
3750	0	5	108
3751	0	6	108
3752	0	7	108
3753	0	8	108
3754	0	9	108
3755	0	10	108
3756	0	11	108
3757	0	12	108
3758	0	13	108
3759	54	14	108
3760	0	15	108
3761	0	16	108
3762	0	17	108
3763	100	18	108
3764	0	19	108
3765	0	20	108
3766	0	21	108
3767	0	22	108
3768	0	23	108
3769	20	24	108
3770	0	25	108
3771	0	26	108
3772	0	27	108
3773	0	28	108
3774	0	29	108
3775	0	30	108
3776	0	31	108
3777	35	32	108
3778	0	33	108
3779	0	34	108
3780	0	35	108
3781	51	1	109
3782	0	2	109
3783	88	3	109
3784	0	4	109
3785	0	5	109
3786	0	6	109
3787	0	7	109
3788	0	8	109
3789	0	9	109
3790	0	10	109
3791	68	11	109
3792	75	12	109
3793	0	13	109
3794	0	14	109
3795	41	15	109
3796	90	16	109
3797	69	17	109
3798	0	18	109
3799	11	19	109
3800	47	20	109
3801	0	21	109
3802	0	22	109
3803	0	23	109
3804	0	24	109
3805	0	25	109
3806	49	26	109
3807	0	27	109
3808	39	28	109
3809	51	29	109
3810	16	30	109
3811	0	31	109
3812	0	32	109
3813	28	33	109
3814	0	34	109
3815	0	35	109
3816	0	1	110
3817	0	2	110
3818	0	3	110
3819	0	4	110
3820	0	5	110
3821	0	6	110
3822	0	7	110
3823	0	8	110
3824	0	9	110
3825	0	10	110
3826	0	11	110
3827	0	12	110
3828	88	13	110
3829	0	14	110
3830	0	15	110
3831	0	16	110
3832	0	17	110
3833	0	18	110
3834	0	19	110
3835	34	20	110
3836	33	21	110
3837	0	22	110
3838	0	23	110
3839	0	24	110
3840	0	25	110
3841	0	26	110
3842	75	27	110
3843	0	28	110
3844	0	29	110
3845	0	30	110
3846	0	31	110
3847	0	32	110
3848	0	33	110
3849	0	34	110
3850	0	35	110
3851	7	1	111
3852	43	2	111
3853	7	3	111
3854	0	4	111
3855	75	5	111
3856	0	6	111
3857	6	7	111
3858	0	8	111
3859	0	9	111
3860	63	10	111
3861	0	11	111
3862	0	12	111
3863	0	13	111
3864	32	14	111
3865	60	15	111
3866	0	16	111
3867	56	17	111
3868	0	18	111
3869	0	19	111
3870	0	20	111
3871	65	21	111
3872	0	22	111
3873	0	23	111
3874	0	24	111
3875	17	25	111
3876	0	26	111
3877	67	27	111
3878	0	28	111
3879	0	29	111
3880	26	30	111
3881	0	31	111
3882	0	32	111
3883	54	33	111
3884	0	34	111
3885	0	35	111
3886	15	1	112
3887	4	2	112
3888	0	3	112
3889	65	4	112
3890	0	5	112
3891	0	6	112
3892	0	7	112
3893	0	8	112
3894	0	9	112
3895	0	10	112
3896	0	11	112
3897	96	12	112
3898	34	13	112
3899	0	14	112
3900	0	15	112
3901	0	16	112
3902	0	17	112
3903	7	18	112
3904	0	19	112
3905	50	20	112
3906	0	21	112
3907	0	22	112
3908	0	23	112
3909	0	24	112
3910	63	25	112
3911	0	26	112
3912	0	27	112
3913	0	28	112
3914	5	29	112
3915	0	30	112
3916	92	31	112
3917	0	32	112
3918	0	33	112
3919	0	34	112
3920	78	35	112
3921	0	1	113
3922	0	2	113
3923	0	3	113
3924	0	4	113
3925	28	5	113
3926	0	6	113
3927	0	7	113
3928	28	8	113
3929	0	9	113
3930	0	10	113
3931	0	11	113
3932	0	12	113
3933	0	13	113
3934	0	14	113
3935	96	15	113
3936	0	16	113
3937	0	17	113
3938	0	18	113
3939	0	19	113
3940	20	20	113
3941	84	21	113
3942	0	22	113
3943	64	23	113
3944	82	24	113
3945	0	25	113
3946	0	26	113
3947	0	27	113
3948	0	28	113
3949	0	29	113
3950	0	30	113
3951	0	31	113
3952	0	32	113
3953	0	33	113
3954	60	34	113
3955	0	35	113
3956	66	1	114
3957	21	2	114
3958	71	3	114
3959	51	4	114
3960	0	5	114
3961	0	6	114
3962	0	7	114
3963	92	8	114
3964	0	9	114
3965	51	10	114
3966	3	11	114
3967	0	12	114
3968	0	13	114
3969	0	14	114
3970	4	15	114
3971	0	16	114
3972	25	17	114
3973	0	18	114
3974	0	19	114
3975	0	20	114
3976	0	21	114
3977	0	22	114
3978	0	23	114
3979	0	24	114
3980	0	25	114
3981	24	26	114
3982	0	27	114
3983	0	28	114
3984	0	29	114
3985	0	30	114
3986	51	31	114
3987	0	32	114
3988	17	33	114
3989	0	34	114
3990	0	35	114
3991	0	1	115
3992	0	2	115
3993	0	3	115
3994	0	4	115
3995	0	5	115
3996	39	6	115
3997	0	7	115
3998	97	8	115
3999	0	9	115
4000	0	10	115
4001	0	11	115
4002	0	12	115
4003	96	13	115
4004	0	14	115
4005	0	15	115
4006	0	16	115
4007	0	17	115
4008	0	18	115
4009	0	19	115
4010	0	20	115
4011	0	21	115
4012	0	22	115
4013	5	23	115
4014	44	24	115
4015	0	25	115
4016	0	26	115
4017	0	27	115
4018	0	28	115
4019	0	29	115
4020	0	30	115
4021	3	31	115
4022	15	32	115
4023	0	33	115
4024	0	34	115
4025	0	35	115
4026	0	1	116
4027	0	2	116
4028	0	3	116
4029	0	4	116
4030	0	5	116
4031	0	6	116
4032	34	7	116
4033	0	8	116
4034	99	9	116
4035	0	10	116
4036	0	11	116
4037	29	12	116
4038	0	13	116
4039	0	14	116
4040	0	15	116
4041	0	16	116
4042	79	17	116
4043	12	18	116
4044	61	19	116
4045	0	20	116
4046	6	21	116
4047	0	22	116
4048	0	23	116
4049	33	24	116
4050	34	25	116
4051	0	26	116
4052	0	27	116
4053	12	28	116
4054	32	29	116
4055	0	30	116
4056	0	31	116
4057	0	32	116
4058	0	33	116
4059	0	34	116
4060	67	35	116
4061	0	1	117
4062	0	2	117
4063	0	3	117
4064	0	4	117
4065	0	5	117
4066	0	6	117
4067	0	7	117
4068	23	8	117
4069	0	9	117
4070	0	10	117
4071	0	11	117
4072	0	12	117
4073	15	13	117
4074	40	14	117
4075	75	15	117
4076	0	16	117
4077	35	17	117
4078	33	18	117
4079	0	19	117
4080	0	20	117
4081	70	21	117
4082	0	22	117
4083	0	23	117
4084	0	24	117
4085	0	25	117
4086	0	26	117
4087	28	27	117
4088	45	28	117
4089	0	29	117
4090	0	30	117
4091	83	31	117
4092	12	32	117
4093	0	33	117
4094	0	34	117
4095	0	35	117
4096	0	1	118
4097	0	2	118
4098	73	3	118
4099	0	4	118
4100	0	5	118
4101	0	6	118
4102	8	7	118
4103	11	8	118
4104	0	9	118
4105	70	10	118
4106	0	11	118
4107	0	12	118
4108	0	13	118
4109	0	14	118
4110	0	15	118
4111	0	16	118
4112	46	17	118
4113	0	18	118
4114	0	19	118
4115	0	20	118
4116	65	21	118
4117	81	22	118
4118	64	23	118
4119	0	24	118
4120	0	25	118
4121	0	26	118
4122	24	27	118
4123	0	28	118
4124	0	29	118
4125	0	30	118
4126	0	31	118
4127	0	32	118
4128	18	33	118
4129	0	34	118
4130	4	35	118
4131	0	1	119
4132	0	2	119
4133	11	3	119
4134	0	4	119
4135	0	5	119
4136	0	6	119
4137	0	7	119
4138	0	8	119
4139	0	9	119
4140	0	10	119
4141	0	11	119
4142	31	12	119
4143	100	13	119
4144	0	14	119
4145	37	15	119
4146	0	16	119
4147	0	17	119
4148	56	18	119
4149	0	19	119
4150	0	20	119
4151	58	21	119
4152	0	22	119
4153	0	23	119
4154	0	24	119
4155	0	25	119
4156	0	26	119
4157	12	27	119
4158	0	28	119
4159	72	29	119
4160	0	30	119
4161	0	31	119
4162	0	32	119
4163	0	33	119
4164	0	34	119
4165	0	35	119
4166	0	1	120
4167	8	2	120
4168	0	3	120
4169	0	4	120
4170	0	5	120
4171	0	6	120
4172	0	7	120
4173	0	8	120
4174	0	9	120
4175	0	10	120
4176	0	11	120
4177	0	12	120
4178	0	13	120
4179	0	14	120
4180	0	15	120
4181	0	16	120
4182	0	17	120
4183	0	18	120
4184	19	19	120
4185	0	20	120
4186	0	21	120
4187	0	22	120
4188	0	23	120
4189	0	24	120
4190	0	25	120
4191	0	26	120
4192	0	27	120
4193	0	28	120
4194	0	29	120
4195	0	30	120
4196	0	31	120
4197	0	32	120
4198	0	33	120
4199	0	34	120
4200	0	35	120
4201	7	1	121
4202	75	2	121
4203	0	3	121
4204	0	4	121
4205	59	5	121
4206	80	6	121
4207	0	7	121
4208	0	8	121
4209	0	9	121
4210	0	10	121
4211	100	11	121
4212	0	12	121
4213	0	13	121
4214	2	14	121
4215	0	15	121
4216	10	16	121
4217	0	17	121
4218	0	18	121
4219	42	19	121
4220	34	20	121
4221	0	21	121
4222	0	22	121
4223	0	23	121
4224	0	24	121
4225	0	25	121
4226	0	26	121
4227	0	27	121
4228	8	28	121
4229	0	29	121
4230	0	30	121
4231	0	31	121
4232	0	32	121
4233	41	33	121
4234	94	34	121
4235	0	35	121
4236	59	1	122
4237	0	2	122
4238	4	3	122
4239	82	4	122
4240	0	5	122
4241	34	6	122
4242	0	7	122
4243	0	8	122
4244	0	9	122
4245	0	10	122
4246	0	11	122
4247	0	12	122
4248	3	13	122
4249	0	14	122
4250	0	15	122
4251	0	16	122
4252	0	17	122
4253	0	18	122
4254	0	19	122
4255	50	20	122
4256	0	21	122
4257	0	22	122
4258	0	23	122
4259	0	24	122
4260	0	25	122
4261	0	26	122
4262	0	27	122
4263	0	28	122
4264	0	29	122
4265	0	30	122
4266	51	31	122
4267	0	32	122
4268	73	33	122
4269	73	34	122
4270	0	35	122
4271	0	1	123
4272	0	2	123
4273	14	3	123
4274	99	4	123
4275	0	5	123
4276	0	6	123
4277	0	7	123
4278	0	8	123
4279	0	9	123
4280	9	10	123
4281	0	11	123
4282	0	12	123
4283	0	13	123
4284	0	14	123
4285	3	15	123
4286	17	16	123
4287	0	17	123
4288	0	18	123
4289	0	19	123
4290	0	20	123
4291	39	21	123
4292	0	22	123
4293	0	23	123
4294	0	24	123
4295	13	25	123
4296	0	26	123
4297	0	27	123
4298	0	28	123
4299	5	29	123
4300	0	30	123
4301	0	31	123
4302	0	32	123
4303	0	33	123
4304	0	34	123
4305	0	35	123
4306	0	1	124
4307	49	2	124
4308	0	3	124
4309	75	4	124
4310	79	5	124
4311	69	6	124
4312	0	7	124
4313	0	8	124
4314	26	9	124
4315	0	10	124
4316	0	11	124
4317	0	12	124
4318	0	13	124
4319	0	14	124
4320	0	15	124
4321	67	16	124
4322	0	17	124
4323	0	18	124
4324	0	19	124
4325	6	20	124
4326	58	21	124
4327	0	22	124
4328	0	23	124
4329	0	24	124
4330	0	25	124
4331	72	26	124
4332	0	27	124
4333	0	28	124
4334	0	29	124
4335	5	30	124
4336	0	31	124
4337	0	32	124
4338	49	33	124
4339	3	34	124
4340	0	35	124
4341	0	1	125
4342	0	2	125
4343	11	3	125
4344	93	4	125
4345	0	5	125
4346	0	6	125
4347	0	7	125
4348	0	8	125
4349	0	9	125
4350	84	10	125
4351	0	11	125
4352	0	12	125
4353	42	13	125
4354	0	14	125
4355	0	15	125
4356	0	16	125
4357	0	17	125
4358	0	18	125
4359	0	19	125
4360	0	20	125
4361	0	21	125
4362	0	22	125
4363	51	23	125
4364	0	24	125
4365	0	25	125
4366	0	26	125
4367	75	27	125
4368	0	28	125
4369	0	29	125
4370	0	30	125
4371	0	31	125
4372	0	32	125
4373	0	33	125
4374	0	34	125
4375	0	35	125
4376	0	1	126
4377	0	2	126
4378	0	3	126
4379	0	4	126
4380	0	5	126
4381	0	6	126
4382	0	7	126
4383	0	8	126
4384	0	9	126
4385	0	10	126
4386	0	11	126
4387	0	12	126
4388	0	13	126
4389	0	14	126
4390	0	15	126
4391	0	16	126
4392	0	17	126
4393	0	18	126
4394	0	19	126
4395	0	20	126
4396	0	21	126
4397	0	22	126
4398	0	23	126
4399	0	24	126
4400	0	25	126
4401	35	26	126
4402	0	27	126
4403	0	28	126
4404	0	29	126
4405	0	30	126
4406	0	31	126
4407	0	32	126
4408	0	33	126
4409	0	34	126
4410	0	35	126
4411	0	1	127
4412	37	2	127
4413	13	3	127
4414	0	4	127
4415	37	5	127
4416	0	6	127
4417	0	7	127
4418	99	8	127
4419	0	9	127
4420	41	10	127
4421	0	11	127
4422	100	12	127
4423	58	13	127
4424	17	14	127
4425	29	15	127
4426	0	16	127
4427	83	17	127
4428	0	18	127
4429	47	19	127
4430	3	20	127
4431	0	21	127
4432	73	22	127
4433	0	23	127
4434	0	24	127
4435	0	25	127
4436	0	26	127
4437	44	27	127
4438	0	28	127
4439	0	29	127
4440	0	30	127
4441	0	31	127
4442	0	32	127
4443	75	33	127
4444	0	34	127
4445	0	35	127
4446	78	1	128
4447	0	2	128
4448	0	3	128
4449	21	4	128
4450	76	5	128
4451	0	6	128
4452	28	7	128
4453	52	8	128
4454	0	9	128
4455	18	10	128
4456	0	11	128
4457	0	12	128
4458	7	13	128
4459	0	14	128
4460	0	15	128
4461	93	16	128
4462	72	17	128
4463	0	18	128
4464	84	19	128
4465	93	20	128
4466	0	21	128
4467	0	22	128
4468	0	23	128
4469	59	24	128
4470	15	25	128
4471	0	26	128
4472	0	27	128
4473	0	28	128
4474	32	29	128
4475	0	30	128
4476	0	31	128
4477	0	32	128
4478	0	33	128
4479	57	34	128
4480	0	35	128
4481	30	1	129
4482	0	2	129
4483	0	3	129
4484	88	4	129
4485	0	5	129
4486	0	6	129
4487	0	7	129
4488	0	8	129
4489	0	9	129
4490	0	10	129
4491	0	11	129
4492	0	12	129
4493	0	13	129
4494	0	14	129
4495	0	15	129
4496	0	16	129
4497	0	17	129
4498	26	18	129
4499	0	19	129
4500	0	20	129
4501	57	21	129
4502	0	22	129
4503	0	23	129
4504	0	24	129
4505	0	25	129
4506	44	26	129
4507	0	27	129
4508	0	28	129
4509	0	29	129
4510	0	30	129
4511	0	31	129
4512	0	32	129
4513	0	33	129
4514	0	34	129
4515	0	35	129
4516	0	1	130
4517	0	2	130
4518	0	3	130
4519	77	4	130
4520	0	5	130
4521	0	6	130
4522	0	7	130
4523	0	8	130
4524	0	9	130
4525	0	10	130
4526	0	11	130
4527	0	12	130
4528	2	13	130
4529	0	14	130
4530	0	15	130
4531	0	16	130
4532	0	17	130
4533	0	18	130
4534	0	19	130
4535	0	20	130
4536	89	21	130
4537	0	22	130
4538	0	23	130
4539	0	24	130
4540	0	25	130
4541	0	26	130
4542	13	27	130
4543	0	28	130
4544	0	29	130
4545	0	30	130
4546	0	31	130
4547	0	32	130
4548	0	33	130
4549	0	34	130
4550	25	35	130
4551	0	1	131
4552	52	2	131
4553	0	3	131
4554	0	4	131
4555	0	5	131
4556	96	6	131
4557	2	7	131
4558	38	8	131
4559	0	9	131
4560	58	10	131
4561	0	11	131
4562	0	12	131
4563	0	13	131
4564	54	14	131
4565	0	15	131
4566	0	16	131
4567	0	17	131
4568	63	18	131
4569	0	19	131
4570	0	20	131
4571	84	21	131
4572	85	22	131
4573	0	23	131
4574	0	24	131
4575	0	25	131
4576	0	26	131
4577	0	27	131
4578	28	28	131
4579	0	29	131
4580	0	30	131
4581	0	31	131
4582	7	32	131
4583	57	33	131
4584	78	34	131
4585	31	35	131
4586	0	1	132
4587	0	2	132
4588	84	3	132
4589	0	4	132
4590	0	5	132
4591	30	6	132
4592	94	7	132
4593	9	8	132
4594	25	9	132
4595	96	10	132
4596	0	11	132
4597	86	12	132
4598	0	13	132
4599	0	14	132
4600	0	15	132
4601	51	16	132
4602	19	17	132
4603	0	18	132
4604	56	19	132
4605	0	20	132
4606	0	21	132
4607	0	22	132
4608	80	23	132
4609	0	24	132
4610	0	25	132
4611	30	26	132
4612	47	27	132
4613	0	28	132
4614	0	29	132
4615	26	30	132
4616	0	31	132
4617	0	32	132
4618	0	33	132
4619	0	34	132
4620	0	35	132
4621	0	1	133
4622	0	2	133
4623	0	3	133
4624	42	4	133
4625	20	5	133
4626	0	6	133
4627	17	7	133
4628	0	8	133
4629	0	9	133
4630	0	10	133
4631	0	11	133
4632	0	12	133
4633	0	13	133
4634	0	14	133
4635	0	15	133
4636	50	16	133
4637	17	17	133
4638	0	18	133
4639	0	19	133
4640	0	20	133
4641	0	21	133
4642	0	22	133
4643	0	23	133
4644	86	24	133
4645	0	25	133
4646	0	26	133
4647	0	27	133
4648	0	28	133
4649	33	29	133
4650	0	30	133
4651	0	31	133
4652	0	32	133
4653	0	33	133
4654	86	34	133
4655	17	35	133
4656	0	1	134
4657	0	2	134
4658	7	3	134
4659	0	4	134
4660	0	5	134
4661	0	6	134
4662	0	7	134
4663	0	8	134
4664	0	9	134
4665	0	10	134
4666	0	11	134
4667	0	12	134
4668	0	13	134
4669	0	14	134
4670	0	15	134
4671	0	16	134
4672	60	17	134
4673	0	18	134
4674	0	19	134
4675	0	20	134
4676	0	21	134
4677	0	22	134
4678	0	23	134
4679	0	24	134
4680	0	25	134
4681	97	26	134
4682	87	27	134
4683	0	28	134
4684	0	29	134
4685	88	30	134
4686	0	31	134
4687	67	32	134
4688	0	33	134
4689	0	34	134
4690	0	35	134
4691	0	1	135
4692	0	2	135
4693	0	3	135
4694	0	4	135
4695	0	5	135
4696	0	6	135
4697	0	7	135
4698	0	8	135
4699	0	9	135
4700	0	10	135
4701	0	11	135
4702	0	12	135
4703	0	13	135
4704	0	14	135
4705	0	15	135
4706	0	16	135
4707	1	17	135
4708	0	18	135
4709	0	19	135
4710	0	20	135
4711	0	21	135
4712	0	22	135
4713	0	23	135
4714	72	24	135
4715	11	25	135
4716	90	26	135
4717	0	27	135
4718	35	28	135
4719	19	29	135
4720	0	30	135
4721	0	31	135
4722	87	32	135
4723	0	33	135
4724	0	34	135
4725	0	35	135
4726	0	1	136
4727	0	2	136
4728	0	3	136
4729	0	4	136
4730	77	5	136
4731	0	6	136
4732	0	7	136
4733	0	8	136
4734	0	9	136
4735	0	10	136
4736	0	11	136
4737	0	12	136
4738	9	13	136
4739	0	14	136
4740	0	15	136
4741	0	16	136
4742	59	17	136
4743	0	18	136
4744	0	19	136
4745	0	20	136
4746	15	21	136
4747	69	22	136
4748	0	23	136
4749	59	24	136
4750	0	25	136
4751	0	26	136
4752	0	27	136
4753	0	28	136
4754	0	29	136
4755	93	30	136
4756	0	31	136
4757	0	32	136
4758	0	33	136
4759	34	34	136
4760	57	35	136
4761	0	1	137
4762	17	2	137
4763	0	3	137
4764	0	4	137
4765	0	5	137
4766	0	6	137
4767	0	7	137
4768	0	8	137
4769	0	9	137
4770	75	10	137
4771	0	11	137
4772	33	12	137
4773	18	13	137
4774	0	14	137
4775	0	15	137
4776	20	16	137
4777	0	17	137
4778	0	18	137
4779	0	19	137
4780	63	20	137
4781	0	21	137
4782	0	22	137
4783	0	23	137
4784	0	24	137
4785	0	25	137
4786	0	26	137
4787	0	27	137
4788	48	28	137
4789	0	29	137
4790	0	30	137
4791	0	31	137
4792	0	32	137
4793	38	33	137
4794	43	34	137
4795	0	35	137
4796	67	1	138
4797	9	2	138
4798	73	3	138
4799	0	4	138
4800	0	5	138
4801	66	6	138
4802	21	7	138
4803	52	8	138
4804	0	9	138
4805	0	10	138
4806	0	11	138
4807	22	12	138
4808	0	13	138
4809	0	14	138
4810	97	15	138
4811	0	16	138
4812	0	17	138
4813	0	18	138
4814	27	19	138
4815	0	20	138
4816	17	21	138
4817	0	22	138
4818	0	23	138
4819	0	24	138
4820	0	25	138
4821	0	26	138
4822	0	27	138
4823	0	28	138
4824	0	29	138
4825	20	30	138
4826	0	31	138
4827	0	32	138
4828	0	33	138
4829	0	34	138
4830	0	35	138
4831	28	1	139
4832	0	2	139
4833	0	3	139
4834	0	4	139
4835	0	5	139
4836	71	6	139
4837	0	7	139
4838	0	8	139
4839	0	9	139
4840	0	10	139
4841	0	11	139
4842	0	12	139
4843	0	13	139
4844	0	14	139
4845	43	15	139
4846	0	16	139
4847	17	17	139
4848	0	18	139
4849	0	19	139
4850	0	20	139
4851	0	21	139
4852	20	22	139
4853	0	23	139
4854	0	24	139
4855	0	25	139
4856	0	26	139
4857	0	27	139
4858	0	28	139
4859	0	29	139
4860	0	30	139
4861	0	31	139
4862	0	32	139
4863	0	33	139
4864	0	34	139
4865	0	35	139
4866	0	1	140
4867	0	2	140
4868	0	3	140
4869	0	4	140
4870	0	5	140
4871	0	6	140
4872	0	7	140
4873	0	8	140
4874	0	9	140
4875	0	10	140
4876	0	11	140
4877	0	12	140
4878	0	13	140
4879	0	14	140
4880	0	15	140
4881	0	16	140
4882	0	17	140
4883	0	18	140
4884	0	19	140
4885	0	20	140
4886	0	21	140
4887	0	22	140
4888	16	23	140
4889	0	24	140
4890	0	25	140
4891	0	26	140
4892	0	27	140
4893	67	28	140
4894	0	29	140
4895	79	30	140
4896	0	31	140
4897	0	32	140
4898	0	33	140
4899	0	34	140
4900	0	35	140
4901	0	1	141
4902	81	2	141
4903	98	3	141
4904	44	4	141
4905	0	5	141
4906	0	6	141
4907	21	7	141
4908	90	8	141
4909	0	9	141
4910	97	10	141
4911	0	11	141
4912	86	12	141
4913	92	13	141
4914	7	14	141
4915	0	15	141
4916	34	16	141
4917	0	17	141
4918	0	18	141
4919	0	19	141
4920	18	20	141
4921	0	21	141
4922	0	22	141
4923	0	23	141
4924	0	24	141
4925	0	25	141
4926	0	26	141
4927	81	27	141
4928	66	28	141
4929	31	29	141
4930	0	30	141
4931	22	31	141
4932	69	32	141
4933	78	33	141
4934	0	34	141
4935	0	35	141
4936	0	1	142
4937	0	2	142
4938	0	3	142
4939	0	4	142
4940	0	5	142
4941	0	6	142
4942	79	7	142
4943	0	8	142
4944	0	9	142
4945	0	10	142
4946	0	11	142
4947	0	12	142
4948	0	13	142
4949	57	14	142
4950	0	15	142
4951	0	16	142
4952	0	17	142
4953	0	18	142
4954	0	19	142
4955	0	20	142
4956	0	21	142
4957	0	22	142
4958	0	23	142
4959	0	24	142
4960	61	25	142
4961	0	26	142
4962	0	27	142
4963	0	28	142
4964	0	29	142
4965	0	30	142
4966	0	31	142
4967	0	32	142
4968	0	33	142
4969	0	34	142
4970	0	35	142
4971	0	1	143
4972	0	2	143
4973	82	3	143
4974	0	4	143
4975	0	5	143
4976	0	6	143
4977	0	7	143
4978	0	8	143
4979	0	9	143
4980	0	10	143
4981	0	11	143
4982	0	12	143
4983	0	13	143
4984	0	14	143
4985	0	15	143
4986	0	16	143
4987	0	17	143
4988	0	18	143
4989	21	19	143
4990	71	20	143
4991	0	21	143
4992	0	22	143
4993	0	23	143
4994	0	24	143
4995	0	25	143
4996	0	26	143
4997	0	27	143
4998	0	28	143
4999	0	29	143
5000	0	30	143
5001	0	31	143
5002	0	32	143
5003	0	33	143
5004	27	34	143
5005	0	35	143
5006	80	1	144
5007	81	2	144
5008	0	3	144
5009	0	4	144
5010	64	5	144
5011	2	6	144
5012	0	7	144
5013	0	8	144
5014	0	9	144
5015	0	10	144
5016	0	11	144
5017	0	12	144
5018	0	13	144
5019	0	14	144
5020	0	15	144
5021	0	16	144
5022	0	17	144
5023	0	18	144
5024	87	19	144
5025	0	20	144
5026	1	21	144
5027	46	22	144
5028	0	23	144
5029	11	24	144
5030	0	25	144
5031	0	26	144
5032	0	27	144
5033	100	28	144
5034	33	29	144
5035	0	30	144
5036	0	31	144
5037	0	32	144
5038	0	33	144
5039	0	34	144
5040	0	35	144
5041	0	1	145
5042	0	2	145
5043	19	3	145
5044	68	4	145
5045	0	5	145
5046	0	6	145
5047	14	7	145
5048	29	8	145
5049	0	9	145
5050	0	10	145
5051	0	11	145
5052	0	12	145
5053	0	13	145
5054	16	14	145
5055	0	15	145
5056	0	16	145
5057	66	17	145
5058	0	18	145
5059	0	19	145
5060	0	20	145
5061	0	21	145
5062	0	22	145
5063	0	23	145
5064	0	24	145
5065	0	25	145
5066	41	26	145
5067	100	27	145
5068	0	28	145
5069	0	29	145
5070	0	30	145
5071	68	31	145
5072	0	32	145
5073	0	33	145
5074	62	34	145
5075	39	35	145
5076	0	1	146
5077	25	2	146
5078	0	3	146
5079	0	4	146
5080	0	5	146
5081	0	6	146
5082	77	7	146
5083	0	8	146
5084	35	9	146
5085	0	10	146
5086	0	11	146
5087	0	12	146
5088	0	13	146
5089	32	14	146
5090	0	15	146
5091	0	16	146
5092	0	17	146
5093	37	18	146
5094	0	19	146
5095	39	20	146
5096	0	21	146
5097	0	22	146
5098	78	23	146
5099	40	24	146
5100	0	25	146
5101	52	26	146
5102	0	27	146
5103	84	28	146
5104	0	29	146
5105	0	30	146
5106	4	31	146
5107	0	32	146
5108	88	33	146
5109	0	34	146
5110	0	35	146
5111	0	1	147
5112	32	2	147
5113	0	3	147
5114	0	4	147
5115	82	5	147
5116	0	6	147
5117	0	7	147
5118	0	8	147
5119	0	9	147
5120	0	10	147
5121	0	11	147
5122	0	12	147
5123	0	13	147
5124	0	14	147
5125	51	15	147
5126	0	16	147
5127	0	17	147
5128	0	18	147
5129	0	19	147
5130	57	20	147
5131	0	21	147
5132	94	22	147
5133	0	23	147
5134	0	24	147
5135	0	25	147
5136	0	26	147
5137	0	27	147
5138	0	28	147
5139	0	29	147
5140	65	30	147
5141	0	31	147
5142	0	32	147
5143	0	33	147
5144	0	34	147
5145	0	35	147
5146	0	1	148
5147	0	2	148
5148	0	3	148
5149	0	4	148
5150	76	5	148
5151	0	6	148
5152	0	7	148
5153	0	8	148
5154	12	9	148
5155	0	10	148
5156	0	11	148
5157	0	12	148
5158	0	13	148
5159	0	14	148
5160	0	15	148
5161	0	16	148
5162	0	17	148
5163	0	18	148
5164	17	19	148
5165	0	20	148
5166	0	21	148
5167	4	22	148
5168	0	23	148
5169	36	24	148
5170	0	25	148
5171	12	26	148
5172	45	27	148
5173	63	28	148
5174	0	29	148
5175	8	30	148
5176	0	31	148
5177	0	32	148
5178	0	33	148
5179	0	34	148
5180	99	35	148
5181	32	1	149
5182	0	2	149
5183	0	3	149
5184	0	4	149
5185	0	5	149
5186	0	6	149
5187	0	7	149
5188	0	8	149
5189	0	9	149
5190	67	10	149
5191	0	11	149
5192	0	12	149
5193	0	13	149
5194	86	14	149
5195	0	15	149
5196	0	16	149
5197	55	17	149
5198	37	18	149
5199	0	19	149
5200	90	20	149
5201	46	21	149
5202	0	22	149
5203	0	23	149
5204	0	24	149
5205	0	25	149
5206	0	26	149
5207	0	27	149
5208	0	28	149
5209	0	29	149
5210	67	30	149
5211	0	31	149
5212	0	32	149
5213	0	33	149
5214	0	34	149
5215	0	35	149
5216	0	1	150
5217	0	2	150
5218	0	3	150
5219	0	4	150
5220	0	5	150
5221	0	6	150
5222	0	7	150
5223	93	8	150
5224	0	9	150
5225	0	10	150
5226	0	11	150
5227	0	12	150
5228	0	13	150
5229	0	14	150
5230	0	15	150
5231	71	16	150
5232	0	17	150
5233	18	18	150
5234	0	19	150
5235	0	20	150
5236	0	21	150
5237	0	22	150
5238	0	23	150
5239	0	24	150
5240	0	25	150
5241	0	26	150
5242	0	27	150
5243	0	28	150
5244	38	29	150
5245	0	30	150
5246	97	31	150
5247	0	32	150
5248	13	33	150
5249	59	34	150
5250	0	35	150
5251	0	1	151
5252	0	2	151
5253	37	3	151
5254	0	4	151
5255	0	5	151
5256	0	6	151
5257	0	7	151
5258	0	8	151
5259	0	9	151
5260	61	10	151
5261	0	11	151
5262	0	12	151
5263	0	13	151
5264	0	14	151
5265	0	15	151
5266	45	16	151
5267	41	17	151
5268	0	18	151
5269	0	19	151
5270	85	20	151
5271	0	21	151
5272	0	22	151
5273	0	23	151
5274	0	24	151
5275	0	25	151
5276	0	26	151
5277	0	27	151
5278	12	28	151
5279	0	29	151
5280	0	30	151
5281	0	31	151
5282	0	32	151
5283	4	33	151
5284	0	34	151
5285	0	35	151
5286	0	1	152
5287	0	2	152
5288	0	3	152
5289	0	4	152
5290	15	5	152
5291	0	6	152
5292	0	7	152
5293	0	8	152
5294	0	9	152
5295	0	10	152
5296	81	11	152
5297	0	12	152
5298	0	13	152
5299	0	14	152
5300	0	15	152
5301	0	16	152
5302	73	17	152
5303	0	18	152
5304	0	19	152
5305	8	20	152
5306	97	21	152
5307	0	22	152
5308	0	23	152
5309	0	24	152
5310	0	25	152
5311	0	26	152
5312	3	27	152
5313	0	28	152
5314	0	29	152
5315	0	30	152
5316	0	31	152
5317	0	32	152
5318	23	33	152
5319	0	34	152
5320	0	35	152
5321	0	1	153
5322	0	2	153
5323	0	3	153
5324	0	4	153
5325	0	5	153
5326	0	6	153
5327	0	7	153
5328	0	8	153
5329	0	9	153
5330	0	10	153
5331	51	11	153
5332	33	12	153
5333	70	13	153
5334	0	14	153
5335	0	15	153
5336	0	16	153
5337	0	17	153
5338	0	18	153
5339	0	19	153
5340	0	20	153
5341	0	21	153
5342	57	22	153
5343	60	23	153
5344	25	24	153
5345	31	25	153
5346	99	26	153
5347	0	27	153
5348	98	28	153
5349	40	29	153
5350	69	30	153
5351	48	31	153
5352	0	32	153
5353	0	33	153
5354	0	34	153
5355	0	35	153
5356	0	1	154
5357	48	2	154
5358	12	3	154
5359	74	4	154
5360	0	5	154
5361	57	6	154
5362	78	7	154
5363	0	8	154
5364	96	9	154
5365	34	10	154
5366	0	11	154
5367	37	12	154
5368	0	13	154
5369	0	14	154
5370	4	15	154
5371	0	16	154
5372	0	17	154
5373	0	18	154
5374	77	19	154
5375	0	20	154
5376	0	21	154
5377	44	22	154
5378	0	23	154
5379	11	24	154
5380	10	25	154
5381	0	26	154
5382	0	27	154
5383	45	28	154
5384	0	29	154
5385	0	30	154
5386	5	31	154
5387	0	32	154
5388	45	33	154
5389	90	34	154
5390	76	35	154
5391	0	1	155
5392	4	2	155
5393	7	3	155
5394	63	4	155
5395	0	5	155
5396	0	6	155
5397	0	7	155
5398	0	8	155
5399	36	9	155
5400	12	10	155
5401	0	11	155
5402	0	12	155
5403	0	13	155
5404	0	14	155
5405	38	15	155
5406	81	16	155
5407	0	17	155
5408	0	18	155
5409	0	19	155
5410	11	20	155
5411	0	21	155
5412	0	22	155
5413	0	23	155
5414	0	24	155
5415	60	25	155
5416	0	26	155
5417	0	27	155
5418	0	28	155
5419	0	29	155
5420	0	30	155
5421	0	31	155
5422	0	32	155
5423	83	33	155
5424	0	34	155
5425	0	35	155
5426	0	1	156
5427	0	2	156
5428	0	3	156
5429	0	4	156
5430	0	5	156
5431	78	6	156
5432	0	7	156
5433	45	8	156
5434	0	9	156
5435	0	10	156
5436	0	11	156
5437	0	12	156
5438	0	13	156
5439	0	14	156
5440	0	15	156
5441	0	16	156
5442	0	17	156
5443	0	18	156
5444	0	19	156
5445	0	20	156
5446	0	21	156
5447	43	22	156
5448	0	23	156
5449	0	24	156
5450	0	25	156
5451	0	26	156
5452	0	27	156
5453	19	28	156
5454	0	29	156
5455	0	30	156
5456	0	31	156
5457	0	32	156
5458	0	33	156
5459	89	34	156
5460	0	35	156
5461	0	1	157
5462	0	2	157
5463	0	3	157
5464	0	4	157
5465	0	5	157
5466	3	6	157
5467	0	7	157
5468	0	8	157
5469	0	9	157
5470	5	10	157
5471	0	11	157
5472	16	12	157
5473	0	13	157
5474	0	14	157
5475	0	15	157
5476	0	16	157
5477	89	17	157
5478	0	18	157
5479	0	19	157
5480	0	20	157
5481	39	21	157
5482	0	22	157
5483	0	23	157
5484	0	24	157
5485	0	25	157
5486	0	26	157
5487	0	27	157
5488	0	28	157
5489	0	29	157
5490	73	30	157
5491	0	31	157
5492	0	32	157
5493	0	33	157
5494	0	34	157
5495	0	35	157
5496	34	1	158
5497	0	2	158
5498	0	3	158
5499	98	4	158
5500	0	5	158
5501	0	6	158
5502	0	7	158
5503	0	8	158
5504	47	9	158
5505	43	10	158
5506	66	11	158
5507	88	12	158
5508	83	13	158
5509	89	14	158
5510	0	15	158
5511	0	16	158
5512	0	17	158
5513	97	18	158
5514	0	19	158
5515	0	20	158
5516	0	21	158
5517	50	22	158
5518	96	23	158
5519	0	24	158
5520	0	25	158
5521	0	26	158
5522	64	27	158
5523	0	28	158
5524	0	29	158
5525	59	30	158
5526	0	31	158
5527	0	32	158
5528	0	33	158
5529	25	34	158
5530	0	35	158
5531	0	1	159
5532	0	2	159
5533	0	3	159
5534	52	4	159
5535	0	5	159
5536	98	6	159
5537	0	7	159
5538	45	8	159
5539	0	9	159
5540	56	10	159
5541	72	11	159
5542	0	12	159
5543	0	13	159
5544	93	14	159
5545	2	15	159
5546	0	16	159
5547	66	17	159
5548	82	18	159
5549	21	19	159
5550	93	20	159
5551	0	21	159
5552	0	22	159
5553	0	23	159
5554	48	24	159
5555	11	25	159
5556	80	26	159
5557	0	27	159
5558	39	28	159
5559	14	29	159
5560	37	30	159
5561	0	31	159
5562	0	32	159
5563	85	33	159
5564	0	34	159
5565	0	35	159
5566	0	1	160
5567	0	2	160
5568	0	3	160
5569	21	4	160
5570	0	5	160
5571	14	6	160
5572	0	7	160
5573	0	8	160
5574	0	9	160
5575	0	10	160
5576	0	11	160
5577	0	12	160
5578	0	13	160
5579	0	14	160
5580	0	15	160
5581	0	16	160
5582	0	17	160
5583	0	18	160
5584	53	19	160
5585	27	20	160
5586	0	21	160
5587	0	22	160
5588	0	23	160
5589	0	24	160
5590	0	25	160
5591	0	26	160
5592	0	27	160
5593	0	28	160
5594	0	29	160
5595	0	30	160
5596	0	31	160
5597	0	32	160
5598	0	33	160
5599	0	34	160
5600	0	35	160
5601	0	1	161
5602	0	2	161
5603	0	3	161
5604	0	4	161
5605	0	5	161
5606	0	6	161
5607	0	7	161
5608	0	8	161
5609	0	9	161
5610	0	10	161
5611	70	11	161
5612	0	12	161
5613	0	13	161
5614	52	14	161
5615	0	15	161
5616	0	16	161
5617	0	17	161
5618	13	18	161
5619	40	19	161
5620	0	20	161
5621	0	21	161
5622	0	22	161
5623	16	23	161
5624	0	24	161
5625	0	25	161
5626	0	26	161
5627	16	27	161
5628	0	28	161
5629	0	29	161
5630	54	30	161
5631	0	31	161
5632	0	32	161
5633	0	33	161
5634	0	34	161
5635	21	35	161
5636	0	1	162
5637	0	2	162
5638	70	3	162
5639	0	4	162
5640	0	5	162
5641	0	6	162
5642	0	7	162
5643	0	8	162
5644	0	9	162
5645	0	10	162
5646	0	11	162
5647	0	12	162
5648	0	13	162
5649	0	14	162
5650	57	15	162
5651	0	16	162
5652	0	17	162
5653	0	18	162
5654	0	19	162
5655	0	20	162
5656	0	21	162
5657	22	22	162
5658	0	23	162
5659	0	24	162
5660	0	25	162
5661	0	26	162
5662	88	27	162
5663	17	28	162
5664	0	29	162
5665	0	30	162
5666	42	31	162
5667	27	32	162
5668	0	33	162
5669	0	34	162
5670	0	35	162
5671	0	1	163
5672	0	2	163
5673	0	3	163
5674	0	4	163
5675	0	5	163
5676	0	6	163
5677	95	7	163
5678	0	8	163
5679	0	9	163
5680	0	10	163
5681	30	11	163
5682	69	12	163
5683	75	13	163
5684	0	14	163
5685	0	15	163
5686	0	16	163
5687	84	17	163
5688	61	18	163
5689	0	19	163
5690	0	20	163
5691	93	21	163
5692	34	22	163
5693	57	23	163
5694	0	24	163
5695	0	25	163
5696	0	26	163
5697	0	27	163
5698	0	28	163
5699	0	29	163
5700	34	30	163
5701	0	31	163
5702	98	32	163
5703	38	33	163
5704	48	34	163
5705	0	35	163
5706	0	1	164
5707	0	2	164
5708	0	3	164
5709	0	4	164
5710	0	5	164
5711	0	6	164
5712	0	7	164
5713	0	8	164
5714	0	9	164
5715	0	10	164
5716	0	11	164
5717	0	12	164
5718	0	13	164
5719	80	14	164
5720	69	15	164
5721	20	16	164
5722	4	17	164
5723	0	18	164
5724	0	19	164
5725	42	20	164
5726	74	21	164
5727	78	22	164
5728	10	23	164
5729	33	24	164
5730	0	25	164
5731	0	26	164
5732	0	27	164
5733	0	28	164
5734	0	29	164
5735	31	30	164
5736	0	31	164
5737	69	32	164
5738	0	33	164
5739	0	34	164
5740	0	35	164
5741	98	1	165
5742	0	2	165
5743	0	3	165
5744	61	4	165
5745	0	5	165
5746	11	6	165
5747	0	7	165
5748	0	8	165
5749	0	9	165
5750	0	10	165
5751	0	11	165
5752	86	12	165
5753	0	13	165
5754	45	14	165
5755	25	15	165
5756	55	16	165
5757	0	17	165
5758	0	18	165
5759	0	19	165
5760	0	20	165
5761	0	21	165
5762	0	22	165
5763	0	23	165
5764	27	24	165
5765	9	25	165
5766	0	26	165
5767	0	27	165
5768	59	28	165
5769	0	29	165
5770	0	30	165
5771	0	31	165
5772	0	32	165
5773	0	33	165
5774	0	34	165
5775	0	35	165
5776	0	1	166
5777	90	2	166
5778	0	3	166
5779	54	4	166
5780	0	5	166
5781	0	6	166
5782	0	7	166
5783	0	8	166
5784	0	9	166
5785	0	10	166
5786	62	11	166
5787	0	12	166
5788	0	13	166
5789	0	14	166
5790	10	15	166
5791	0	16	166
5792	0	17	166
5793	0	18	166
5794	5	19	166
5795	0	20	166
5796	36	21	166
5797	0	22	166
5798	62	23	166
5799	0	24	166
5800	0	25	166
5801	0	26	166
5802	0	27	166
5803	21	28	166
5804	0	29	166
5805	34	30	166
5806	0	31	166
5807	0	32	166
5808	0	33	166
5809	0	34	166
5810	0	35	166
5811	0	1	167
5812	0	2	167
5813	54	3	167
5814	0	4	167
5815	0	5	167
5816	0	6	167
5817	86	7	167
5818	0	8	167
5819	0	9	167
5820	0	10	167
5821	0	11	167
5822	0	12	167
5823	90	13	167
5824	0	14	167
5825	0	15	167
5826	0	16	167
5827	0	17	167
5828	0	18	167
5829	0	19	167
5830	0	20	167
5831	0	21	167
5832	0	22	167
5833	88	23	167
5834	33	24	167
5835	0	25	167
5836	0	26	167
5837	81	27	167
5838	0	28	167
5839	0	29	167
5840	0	30	167
5841	0	31	167
5842	0	32	167
5843	0	33	167
5844	0	34	167
5845	0	35	167
5846	55	1	168
5847	0	2	168
5848	4	3	168
5849	17	4	168
5850	0	5	168
5851	0	6	168
5852	0	7	168
5853	0	8	168
5854	0	9	168
5855	0	10	168
5856	69	11	168
5857	0	12	168
5858	0	13	168
5859	0	14	168
5860	0	15	168
5861	0	16	168
5862	0	17	168
5863	43	18	168
5864	51	19	168
5865	46	20	168
5866	0	21	168
5867	0	22	168
5868	59	23	168
5869	57	24	168
5870	96	25	168
5871	43	26	168
5872	0	27	168
5873	24	28	168
5874	3	29	168
5875	35	30	168
5876	0	31	168
5877	0	32	168
5878	0	33	168
5879	0	34	168
5880	0	35	168
5881	0	1	169
5882	0	2	169
5883	0	3	169
5884	30	4	169
5885	0	5	169
5886	0	6	169
5887	62	7	169
5888	0	8	169
5889	0	9	169
5890	63	10	169
5891	0	11	169
5892	0	12	169
5893	0	13	169
5894	55	14	169
5895	0	15	169
5896	0	16	169
5897	0	17	169
5898	0	18	169
5899	0	19	169
5900	0	20	169
5901	25	21	169
5902	0	22	169
5903	78	23	169
5904	0	24	169
5905	0	25	169
5906	9	26	169
5907	0	27	169
5908	0	28	169
5909	0	29	169
5910	0	30	169
5911	0	31	169
5912	0	32	169
5913	0	33	169
5914	46	34	169
5915	0	35	169
5916	0	1	170
5917	0	2	170
5918	0	3	170
5919	0	4	170
5920	0	5	170
5921	0	6	170
5922	0	7	170
5923	0	8	170
5924	0	9	170
5925	0	10	170
5926	0	11	170
5927	0	12	170
5928	0	13	170
5929	0	14	170
5930	0	15	170
5931	0	16	170
5932	0	17	170
5933	41	18	170
5934	0	19	170
5935	0	20	170
5936	0	21	170
5937	0	22	170
5938	0	23	170
5939	0	24	170
5940	0	25	170
5941	0	26	170
5942	63	27	170
5943	0	28	170
5944	0	29	170
5945	0	30	170
5946	0	31	170
5947	0	32	170
5948	0	33	170
5949	0	34	170
5950	0	35	170
5951	0	1	171
5952	0	2	171
5953	0	3	171
5954	0	4	171
5955	0	5	171
5956	0	6	171
5957	0	7	171
5958	0	8	171
5959	0	9	171
5960	0	10	171
5961	0	11	171
5962	0	12	171
5963	0	13	171
5964	0	14	171
5965	16	15	171
5966	0	16	171
5967	44	17	171
5968	0	18	171
5969	0	19	171
5970	0	20	171
5971	0	21	171
5972	0	22	171
5973	0	23	171
5974	0	24	171
5975	0	25	171
5976	0	26	171
5977	0	27	171
5978	0	28	171
5979	0	29	171
5980	0	30	171
5981	65	31	171
5982	6	32	171
5983	56	33	171
5984	0	34	171
5985	0	35	171
5986	50	1	172
5987	0	2	172
5988	54	3	172
5989	31	4	172
5990	55	5	172
5991	0	6	172
5992	21	7	172
5993	0	8	172
5994	0	9	172
5995	0	10	172
5996	0	11	172
5997	59	12	172
5998	0	13	172
5999	4	14	172
6000	0	15	172
6001	0	16	172
6002	0	17	172
6003	0	18	172
6004	0	19	172
6005	72	20	172
6006	0	21	172
6007	0	22	172
6008	0	23	172
6009	0	24	172
6010	0	25	172
6011	29	26	172
6012	0	27	172
6013	0	28	172
6014	0	29	172
6015	0	30	172
6016	0	31	172
6017	85	32	172
6018	66	33	172
6019	0	34	172
6020	0	35	172
6021	0	1	173
6022	0	2	173
6023	0	3	173
6024	0	4	173
6025	0	5	173
6026	0	6	173
6027	0	7	173
6028	0	8	173
6029	0	9	173
6030	0	10	173
6031	0	11	173
6032	0	12	173
6033	0	13	173
6034	42	14	173
6035	0	15	173
6036	0	16	173
6037	0	17	173
6038	0	18	173
6039	0	19	173
6040	0	20	173
6041	0	21	173
6042	0	22	173
6043	0	23	173
6044	0	24	173
6045	0	25	173
6046	0	26	173
6047	0	27	173
6048	93	28	173
6049	33	29	173
6050	0	30	173
6051	0	31	173
6052	0	32	173
6053	0	33	173
6054	0	34	173
6055	0	35	173
6056	0	1	174
6057	30	2	174
6058	0	3	174
6059	0	4	174
6060	87	5	174
6061	77	6	174
6062	0	7	174
6063	0	8	174
6064	0	9	174
6065	0	10	174
6066	0	11	174
6067	0	12	174
6068	29	13	174
6069	15	14	174
6070	0	15	174
6071	0	16	174
6072	61	17	174
6073	0	18	174
6074	0	19	174
6075	0	20	174
6076	0	21	174
6077	0	22	174
6078	0	23	174
6079	0	24	174
6080	0	25	174
6081	0	26	174
6082	0	27	174
6083	0	28	174
6084	31	29	174
6085	0	30	174
6086	0	31	174
6087	0	32	174
6088	0	33	174
6089	0	34	174
6090	0	35	174
6091	26	1	175
6092	63	2	175
6093	0	3	175
6094	0	4	175
6095	0	5	175
6096	0	6	175
6097	53	7	175
6098	0	8	175
6099	0	9	175
6100	0	10	175
6101	0	11	175
6102	0	12	175
6103	80	13	175
6104	0	14	175
6105	0	15	175
6106	0	16	175
6107	23	17	175
6108	0	18	175
6109	0	19	175
6110	15	20	175
6111	68	21	175
6112	65	22	175
6113	0	23	175
6114	0	24	175
6115	0	25	175
6116	0	26	175
6117	1	27	175
6118	15	28	175
6119	0	29	175
6120	0	30	175
6121	0	31	175
6122	90	32	175
6123	0	33	175
6124	0	34	175
6125	0	35	175
6126	0	1	176
6127	0	2	176
6128	0	3	176
6129	0	4	176
6130	0	5	176
6131	0	6	176
6132	0	7	176
6133	0	8	176
6134	0	9	176
6135	0	10	176
6136	0	11	176
6137	56	12	176
6138	0	13	176
6139	0	14	176
6140	73	15	176
6141	21	16	176
6142	0	17	176
6143	34	18	176
6144	64	19	176
6145	16	20	176
6146	0	21	176
6147	0	22	176
6148	0	23	176
6149	0	24	176
6150	9	25	176
6151	0	26	176
6152	0	27	176
6153	0	28	176
6154	0	29	176
6155	0	30	176
6156	0	31	176
6157	59	32	176
6158	0	33	176
6159	0	34	176
6160	0	35	176
6161	0	1	177
6162	0	2	177
6163	0	3	177
6164	0	4	177
6165	0	5	177
6166	62	6	177
6167	0	7	177
6168	0	8	177
6169	13	9	177
6170	0	10	177
6171	97	11	177
6172	5	12	177
6173	44	13	177
6174	0	14	177
6175	0	15	177
6176	0	16	177
6177	0	17	177
6178	0	18	177
6179	65	19	177
6180	44	20	177
6181	0	21	177
6182	0	22	177
6183	0	23	177
6184	0	24	177
6185	42	25	177
6186	94	26	177
6187	0	27	177
6188	0	28	177
6189	75	29	177
6190	0	30	177
6191	0	31	177
6192	0	32	177
6193	0	33	177
6194	0	34	177
6195	0	35	177
6196	19	1	178
6197	0	2	178
6198	0	3	178
6199	0	4	178
6200	29	5	178
6201	0	6	178
6202	0	7	178
6203	0	8	178
6204	0	9	178
6205	0	10	178
6206	0	11	178
6207	0	12	178
6208	0	13	178
6209	8	14	178
6210	0	15	178
6211	57	16	178
6212	0	17	178
6213	0	18	178
6214	20	19	178
6215	0	20	178
6216	0	21	178
6217	0	22	178
6218	0	23	178
6219	0	24	178
6220	0	25	178
6221	0	26	178
6222	0	27	178
6223	0	28	178
6224	23	29	178
6225	0	30	178
6226	0	31	178
6227	0	32	178
6228	0	33	178
6229	0	34	178
6230	0	35	178
6231	76	1	179
6232	0	2	179
6233	0	3	179
6234	0	4	179
6235	0	5	179
6236	0	6	179
6237	0	7	179
6238	0	8	179
6239	0	9	179
6240	0	10	179
6241	47	11	179
6242	0	12	179
6243	0	13	179
6244	0	14	179
6245	91	15	179
6246	0	16	179
6247	0	17	179
6248	0	18	179
6249	76	19	179
6250	0	20	179
6251	31	21	179
6252	15	22	179
6253	0	23	179
6254	0	24	179
6255	0	25	179
6256	9	26	179
6257	0	27	179
6258	47	28	179
6259	14	29	179
6260	0	30	179
6261	0	31	179
6262	0	32	179
6263	25	33	179
6264	72	34	179
6265	100	35	179
6266	0	1	180
6267	0	2	180
6268	0	3	180
6269	0	4	180
6270	0	5	180
6271	0	6	180
6272	0	7	180
6273	49	8	180
6274	0	9	180
6275	0	10	180
6276	0	11	180
6277	0	12	180
6278	0	13	180
6279	0	14	180
6280	0	15	180
6281	0	16	180
6282	0	17	180
6283	0	18	180
6284	0	19	180
6285	16	20	180
6286	0	21	180
6287	0	22	180
6288	0	23	180
6289	11	24	180
6290	0	25	180
6291	0	26	180
6292	0	27	180
6293	0	28	180
6294	0	29	180
6295	0	30	180
6296	0	31	180
6297	0	32	180
6298	0	33	180
6299	0	34	180
6300	0	35	180
6301	0	1	181
6302	0	2	181
6303	0	3	181
6304	0	4	181
6305	0	5	181
6306	0	6	181
6307	0	7	181
6308	74	8	181
6309	0	9	181
6310	0	10	181
6311	0	11	181
6312	0	12	181
6313	0	13	181
6314	0	14	181
6315	0	15	181
6316	0	16	181
6317	0	17	181
6318	0	18	181
6319	61	19	181
6320	0	20	181
6321	0	21	181
6322	0	22	181
6323	0	23	181
6324	0	24	181
6325	0	25	181
6326	0	26	181
6327	0	27	181
6328	0	28	181
6329	0	29	181
6330	0	30	181
6331	0	31	181
6332	0	32	181
6333	0	33	181
6334	0	34	181
6335	0	35	181
6336	0	1	182
6337	0	2	182
6338	0	3	182
6339	0	4	182
6340	0	5	182
6341	84	6	182
6342	0	7	182
6343	0	8	182
6344	0	9	182
6345	0	10	182
6346	0	11	182
6347	0	12	182
6348	0	13	182
6349	2	14	182
6350	0	15	182
6351	0	16	182
6352	0	17	182
6353	10	18	182
6354	0	19	182
6355	4	20	182
6356	0	21	182
6357	0	22	182
6358	0	23	182
6359	0	24	182
6360	37	25	182
6361	0	26	182
6362	0	27	182
6363	0	28	182
6364	0	29	182
6365	0	30	182
6366	0	31	182
6367	0	32	182
6368	0	33	182
6369	0	34	182
6370	0	35	182
6371	0	1	183
6372	0	2	183
6373	21	3	183
6374	46	4	183
6375	93	5	183
6376	0	6	183
6377	0	7	183
6378	0	8	183
6379	0	9	183
6380	0	10	183
6381	16	11	183
6382	0	12	183
6383	0	13	183
6384	73	14	183
6385	0	15	183
6386	0	16	183
6387	74	17	183
6388	100	18	183
6389	37	19	183
6390	67	20	183
6391	54	21	183
6392	5	22	183
6393	76	23	183
6394	0	24	183
6395	0	25	183
6396	49	26	183
6397	61	27	183
6398	6	28	183
6399	0	29	183
6400	0	30	183
6401	71	31	183
6402	0	32	183
6403	0	33	183
6404	0	34	183
6405	60	35	183
6406	0	1	184
6407	30	2	184
6408	0	3	184
6409	0	4	184
6410	0	5	184
6411	0	6	184
6412	0	7	184
6413	0	8	184
6414	0	9	184
6415	0	10	184
6416	0	11	184
6417	0	12	184
6418	0	13	184
6419	0	14	184
6420	0	15	184
6421	0	16	184
6422	0	17	184
6423	0	18	184
6424	22	19	184
6425	0	20	184
6426	58	21	184
6427	0	22	184
6428	0	23	184
6429	0	24	184
6430	0	25	184
6431	0	26	184
6432	0	27	184
6433	0	28	184
6434	0	29	184
6435	0	30	184
6436	0	31	184
6437	0	32	184
6438	0	33	184
6439	0	34	184
6440	0	35	184
6441	0	1	185
6442	0	2	185
6443	72	3	185
6444	79	4	185
6445	0	5	185
6446	0	6	185
6447	9	7	185
6448	0	8	185
6449	22	9	185
6450	0	10	185
6451	76	11	185
6452	0	12	185
6453	0	13	185
6454	0	14	185
6455	96	15	185
6456	0	16	185
6457	0	17	185
6458	0	18	185
6459	0	19	185
6460	56	20	185
6461	0	21	185
6462	0	22	185
6463	84	23	185
6464	0	24	185
6465	70	25	185
6466	0	26	185
6467	0	27	185
6468	59	28	185
6469	0	29	185
6470	39	30	185
6471	86	31	185
6472	79	32	185
6473	0	33	185
6474	56	34	185
6475	0	35	185
6476	0	1	186
6477	25	2	186
6478	0	3	186
6479	0	4	186
6480	0	5	186
6481	0	6	186
6482	0	7	186
6483	6	8	186
6484	0	9	186
6485	84	10	186
6486	0	11	186
6487	0	12	186
6488	0	13	186
6489	0	14	186
6490	0	15	186
6491	0	16	186
6492	0	17	186
6493	96	18	186
6494	0	19	186
6495	0	20	186
6496	0	21	186
6497	95	22	186
6498	0	23	186
6499	0	24	186
6500	0	25	186
6501	95	26	186
6502	0	27	186
6503	0	28	186
6504	0	29	186
6505	0	30	186
6506	0	31	186
6507	0	32	186
6508	0	33	186
6509	0	34	186
6510	68	35	186
6511	0	1	187
6512	27	2	187
6513	0	3	187
6514	0	4	187
6515	12	5	187
6516	1	6	187
6517	0	7	187
6518	0	8	187
6519	0	9	187
6520	0	10	187
6521	0	11	187
6522	83	12	187
6523	40	13	187
6524	30	14	187
6525	0	15	187
6526	44	16	187
6527	0	17	187
6528	0	18	187
6529	0	19	187
6530	44	20	187
6531	0	21	187
6532	22	22	187
6533	0	23	187
6534	91	24	187
6535	45	25	187
6536	0	26	187
6537	0	27	187
6538	0	28	187
6539	0	29	187
6540	0	30	187
6541	0	31	187
6542	22	32	187
6543	0	33	187
6544	85	34	187
6545	76	35	187
6546	0	1	188
6547	0	2	188
6548	0	3	188
6549	10	4	188
6550	0	5	188
6551	0	6	188
6552	0	7	188
6553	10	8	188
6554	89	9	188
6555	0	10	188
6556	71	11	188
6557	0	12	188
6558	0	13	188
6559	0	14	188
6560	0	15	188
6561	0	16	188
6562	41	17	188
6563	0	18	188
6564	0	19	188
6565	0	20	188
6566	0	21	188
6567	0	22	188
6568	0	23	188
6569	0	24	188
6570	0	25	188
6571	0	26	188
6572	12	27	188
6573	0	28	188
6574	0	29	188
6575	0	30	188
6576	79	31	188
6577	0	32	188
6578	0	33	188
6579	0	34	188
6580	0	35	188
6581	0	1	189
6582	0	2	189
6583	0	3	189
6584	0	4	189
6585	11	5	189
6586	0	6	189
6587	0	7	189
6588	0	8	189
6589	0	9	189
6590	0	10	189
6591	0	11	189
6592	0	12	189
6593	0	13	189
6594	0	14	189
6595	0	15	189
6596	0	16	189
6597	59	17	189
6598	0	18	189
6599	0	19	189
6600	0	20	189
6601	0	21	189
6602	0	22	189
6603	0	23	189
6604	0	24	189
6605	0	25	189
6606	0	26	189
6607	0	27	189
6608	0	28	189
6609	0	29	189
6610	0	30	189
6611	0	31	189
6612	16	32	189
6613	0	33	189
6614	0	34	189
6615	0	35	189
6616	0	1	190
6617	0	2	190
6618	0	3	190
6619	0	4	190
6620	0	5	190
6621	0	6	190
6622	0	7	190
6623	42	8	190
6624	12	9	190
6625	57	10	190
6626	0	11	190
6627	0	12	190
6628	0	13	190
6629	0	14	190
6630	2	15	190
6631	48	16	190
6632	0	17	190
6633	0	18	190
6634	0	19	190
6635	0	20	190
6636	0	21	190
6637	19	22	190
6638	0	23	190
6639	30	24	190
6640	0	25	190
6641	94	26	190
6642	75	27	190
6643	96	28	190
6644	0	29	190
6645	0	30	190
6646	0	31	190
6647	0	32	190
6648	0	33	190
6649	42	34	190
6650	0	35	190
6651	0	1	191
6652	21	2	191
6653	0	3	191
6654	0	4	191
6655	0	5	191
6656	0	6	191
6657	0	7	191
6658	0	8	191
6659	0	9	191
6660	0	10	191
6661	0	11	191
6662	0	12	191
6663	0	13	191
6664	0	14	191
6665	0	15	191
6666	0	16	191
6667	0	17	191
6668	100	18	191
6669	0	19	191
6670	0	20	191
6671	0	21	191
6672	92	22	191
6673	66	23	191
6674	0	24	191
6675	72	25	191
6676	0	26	191
6677	0	27	191
6678	0	28	191
6679	0	29	191
6680	0	30	191
6681	12	31	191
6682	50	32	191
6683	0	33	191
6684	0	34	191
6685	0	35	191
6686	0	1	192
6687	0	2	192
6688	0	3	192
6689	0	4	192
6690	0	5	192
6691	0	6	192
6692	0	7	192
6693	0	8	192
6694	0	9	192
6695	48	10	192
6696	0	11	192
6697	0	12	192
6698	0	13	192
6699	0	14	192
6700	0	15	192
6701	0	16	192
6702	0	17	192
6703	0	18	192
6704	0	19	192
6705	0	20	192
6706	0	21	192
6707	0	22	192
6708	0	23	192
6709	0	24	192
6710	0	25	192
6711	0	26	192
6712	0	27	192
6713	0	28	192
6714	0	29	192
6715	0	30	192
6716	0	31	192
6717	0	32	192
6718	0	33	192
6719	0	34	192
6720	0	35	192
6721	67	1	193
6722	0	2	193
6723	0	3	193
6724	0	4	193
6725	0	5	193
6726	0	6	193
6727	80	7	193
6728	0	8	193
6729	0	9	193
6730	0	10	193
6731	0	11	193
6732	0	12	193
6733	75	13	193
6734	0	14	193
6735	58	15	193
6736	0	16	193
6737	0	17	193
6738	21	18	193
6739	0	19	193
6740	19	20	193
6741	0	21	193
6742	24	22	193
6743	0	23	193
6744	33	24	193
6745	0	25	193
6746	0	26	193
6747	0	27	193
6748	67	28	193
6749	0	29	193
6750	0	30	193
6751	52	31	193
6752	0	32	193
6753	0	33	193
6754	28	34	193
6755	22	35	193
6756	0	1	194
6757	0	2	194
6758	0	3	194
6759	0	4	194
6760	0	5	194
6761	0	6	194
6762	0	7	194
6763	0	8	194
6764	0	9	194
6765	0	10	194
6766	0	11	194
6767	0	12	194
6768	0	13	194
6769	15	14	194
6770	0	15	194
6771	0	16	194
6772	0	17	194
6773	68	18	194
6774	0	19	194
6775	0	20	194
6776	0	21	194
6777	0	22	194
6778	0	23	194
6779	0	24	194
6780	0	25	194
6781	0	26	194
6782	0	27	194
6783	0	28	194
6784	0	29	194
6785	16	30	194
6786	0	31	194
6787	0	32	194
6788	0	33	194
6789	0	34	194
6790	0	35	194
6791	22	1	195
6792	0	2	195
6793	0	3	195
6794	0	4	195
6795	19	5	195
6796	99	6	195
6797	71	7	195
6798	73	8	195
6799	86	9	195
6800	37	10	195
6801	0	11	195
6802	0	12	195
6803	74	13	195
6804	0	14	195
6805	27	15	195
6806	0	16	195
6807	0	17	195
6808	0	18	195
6809	0	19	195
6810	0	20	195
6811	0	21	195
6812	16	22	195
6813	0	23	195
6814	0	24	195
6815	0	25	195
6816	0	26	195
6817	0	27	195
6818	0	28	195
6819	0	29	195
6820	0	30	195
6821	0	31	195
6822	0	32	195
6823	0	33	195
6824	0	34	195
6825	23	35	195
6826	0	1	196
6827	0	2	196
6828	0	3	196
6829	0	4	196
6830	8	5	196
6831	0	6	196
6832	0	7	196
6833	0	8	196
6834	0	9	196
6835	0	10	196
6836	0	11	196
6837	0	12	196
6838	0	13	196
6839	0	14	196
6840	0	15	196
6841	33	16	196
6842	0	17	196
6843	0	18	196
6844	0	19	196
6845	0	20	196
6846	0	21	196
6847	0	22	196
6848	0	23	196
6849	0	24	196
6850	0	25	196
6851	0	26	196
6852	0	27	196
6853	0	28	196
6854	0	29	196
6855	0	30	196
6856	0	31	196
6857	0	32	196
6858	6	33	196
6859	0	34	196
6860	0	35	196
6861	0	1	197
6862	0	2	197
6863	0	3	197
6864	0	4	197
6865	0	5	197
6866	0	6	197
6867	0	7	197
6868	0	8	197
6869	0	9	197
6870	0	10	197
6871	0	11	197
6872	0	12	197
6873	0	13	197
6874	0	14	197
6875	0	15	197
6876	0	16	197
6877	90	17	197
6878	54	18	197
6879	0	19	197
6880	0	20	197
6881	0	21	197
6882	0	22	197
6883	35	23	197
6884	0	24	197
6885	0	25	197
6886	0	26	197
6887	0	27	197
6888	50	28	197
6889	0	29	197
6890	0	30	197
6891	94	31	197
6892	0	32	197
6893	0	33	197
6894	0	34	197
6895	0	35	197
6896	23	1	198
6897	61	2	198
6898	39	3	198
6899	0	4	198
6900	0	5	198
6901	0	6	198
6902	31	7	198
6903	0	8	198
6904	0	9	198
6905	0	10	198
6906	0	11	198
6907	52	12	198
6908	0	13	198
6909	0	14	198
6910	0	15	198
6911	84	16	198
6912	0	17	198
6913	0	18	198
6914	0	19	198
6915	7	20	198
6916	53	21	198
6917	0	22	198
6918	0	23	198
6919	0	24	198
6920	65	25	198
6921	73	26	198
6922	0	27	198
6923	0	28	198
6924	29	29	198
6925	0	30	198
6926	0	31	198
6927	0	32	198
6928	21	33	198
6929	0	34	198
6930	0	35	198
6931	0	1	199
6932	39	2	199
6933	0	3	199
6934	13	4	199
6935	0	5	199
6936	85	6	199
6937	0	7	199
6938	0	8	199
6939	0	9	199
6940	0	10	199
6941	0	11	199
6942	0	12	199
6943	55	13	199
6944	0	14	199
6945	0	15	199
6946	0	16	199
6947	0	17	199
6948	0	18	199
6949	0	19	199
6950	11	20	199
6951	0	21	199
6952	0	22	199
6953	0	23	199
6954	0	24	199
6955	0	25	199
6956	0	26	199
6957	0	27	199
6958	0	28	199
6959	0	29	199
6960	81	30	199
6961	0	31	199
6962	26	32	199
6963	20	33	199
6964	57	34	199
6965	0	35	199
6966	0	1	200
6967	0	2	200
6968	0	3	200
6969	89	4	200
6970	0	5	200
6971	25	6	200
6972	0	7	200
6973	0	8	200
6974	0	9	200
6975	0	10	200
6976	0	11	200
6977	0	12	200
6978	0	13	200
6979	26	14	200
6980	85	15	200
6981	0	16	200
6982	0	17	200
6983	0	18	200
6984	0	19	200
6985	0	20	200
6986	8	21	200
6987	19	22	200
6988	0	23	200
6989	0	24	200
6990	0	25	200
6991	0	26	200
6992	0	27	200
6993	0	28	200
6994	0	29	200
6995	67	30	200
6996	0	31	200
6997	0	32	200
6998	0	33	200
6999	0	34	200
7000	0	35	200
7001	0	1	201
7002	0	2	201
7003	72	3	201
7004	0	4	201
7005	78	5	201
7006	0	6	201
7007	0	7	201
7008	0	8	201
7009	0	9	201
7010	0	10	201
7011	0	11	201
7012	0	12	201
7013	0	13	201
7014	0	14	201
7015	0	15	201
7016	0	16	201
7017	49	17	201
7018	0	18	201
7019	0	19	201
7020	0	20	201
7021	32	21	201
7022	0	22	201
7023	0	23	201
7024	0	24	201
7025	40	25	201
7026	0	26	201
7027	0	27	201
7028	0	28	201
7029	0	29	201
7030	0	30	201
7031	0	31	201
7032	65	32	201
7033	0	33	201
7034	0	34	201
7035	8	35	201
7036	0	1	202
7037	0	2	202
7038	3	3	202
7039	0	4	202
7040	0	5	202
7041	0	6	202
7042	0	7	202
7043	0	8	202
7044	0	9	202
7045	0	10	202
7046	0	11	202
7047	0	12	202
7048	0	13	202
7049	0	14	202
7050	0	15	202
7051	0	16	202
7052	0	17	202
7053	0	18	202
7054	0	19	202
7055	0	20	202
7056	84	21	202
7057	0	22	202
7058	0	23	202
7059	0	24	202
7060	0	25	202
7061	0	26	202
7062	0	27	202
7063	96	28	202
7064	80	29	202
7065	0	30	202
7066	0	31	202
7067	59	32	202
7068	0	33	202
7069	0	34	202
7070	0	35	202
7071	0	1	203
7072	0	2	203
7073	95	3	203
7074	0	4	203
7075	0	5	203
7076	0	6	203
7077	0	7	203
7078	75	8	203
7079	0	9	203
7080	0	10	203
7081	0	11	203
7082	0	12	203
7083	0	13	203
7084	0	14	203
7085	28	15	203
7086	0	16	203
7087	0	17	203
7088	73	18	203
7089	0	19	203
7090	0	20	203
7091	0	21	203
7092	0	22	203
7093	0	23	203
7094	0	24	203
7095	0	25	203
7096	0	26	203
7097	0	27	203
7098	0	28	203
7099	0	29	203
7100	75	30	203
7101	0	31	203
7102	0	32	203
7103	0	33	203
7104	0	34	203
7105	0	35	203
7106	0	1	204
7107	0	2	204
7108	0	3	204
7109	0	4	204
7110	82	5	204
7111	70	6	204
7112	0	7	204
7113	8	8	204
7114	0	9	204
7115	0	10	204
7116	41	11	204
7117	0	12	204
7118	65	13	204
7119	0	14	204
7120	0	15	204
7121	0	16	204
7122	42	17	204
7123	0	18	204
7124	0	19	204
7125	43	20	204
7126	0	21	204
7127	0	22	204
7128	29	23	204
7129	0	24	204
7130	65	25	204
7131	0	26	204
7132	0	27	204
7133	15	28	204
7134	88	29	204
7135	69	30	204
7136	0	31	204
7137	0	32	204
7138	0	33	204
7139	63	34	204
7140	0	35	204
7141	0	1	205
7142	0	2	205
7143	72	3	205
7144	0	4	205
7145	0	5	205
7146	0	6	205
7147	0	7	205
7148	0	8	205
7149	0	9	205
7150	0	10	205
7151	0	11	205
7152	0	12	205
7153	0	13	205
7154	0	14	205
7155	0	15	205
7156	0	16	205
7157	48	17	205
7158	0	18	205
7159	0	19	205
7160	11	20	205
7161	0	21	205
7162	0	22	205
7163	0	23	205
7164	0	24	205
7165	84	25	205
7166	0	26	205
7167	14	27	205
7168	0	28	205
7169	35	29	205
7170	0	30	205
7171	94	31	205
7172	0	32	205
7173	0	33	205
7174	0	34	205
7175	0	35	205
7176	0	1	206
7177	0	2	206
7178	0	3	206
7179	0	4	206
7180	0	5	206
7181	0	6	206
7182	0	7	206
7183	0	8	206
7184	0	9	206
7185	0	10	206
7186	0	11	206
7187	0	12	206
7188	0	13	206
7189	0	14	206
7190	0	15	206
7191	0	16	206
7192	0	17	206
7193	0	18	206
7194	0	19	206
7195	0	20	206
7196	0	21	206
7197	0	22	206
7198	0	23	206
7199	0	24	206
7200	0	25	206
7201	3	26	206
7202	0	27	206
7203	0	28	206
7204	0	29	206
7205	0	30	206
7206	79	31	206
7207	0	32	206
7208	0	33	206
7209	0	34	206
7210	0	35	206
7211	0	1	207
7212	0	2	207
7213	0	3	207
7214	0	4	207
7215	0	5	207
7216	0	6	207
7217	0	7	207
7218	0	8	207
7219	0	9	207
7220	85	10	207
7221	29	11	207
7222	0	12	207
7223	0	13	207
7224	0	14	207
7225	0	15	207
7226	0	16	207
7227	68	17	207
7228	0	18	207
7229	0	19	207
7230	0	20	207
7231	0	21	207
7232	0	22	207
7233	0	23	207
7234	0	24	207
7235	0	25	207
7236	62	26	207
7237	0	27	207
7238	62	28	207
7239	13	29	207
7240	0	30	207
7241	88	31	207
7242	0	32	207
7243	0	33	207
7244	0	34	207
7245	16	35	207
7246	0	1	208
7247	0	2	208
7248	0	3	208
7249	0	4	208
7250	0	5	208
7251	0	6	208
7252	0	7	208
7253	0	8	208
7254	0	9	208
7255	0	10	208
7256	46	11	208
7257	0	12	208
7258	0	13	208
7259	0	14	208
7260	84	15	208
7261	0	16	208
7262	69	17	208
7263	0	18	208
7264	0	19	208
7265	0	20	208
7266	60	21	208
7267	0	22	208
7268	0	23	208
7269	0	24	208
7270	0	25	208
7271	0	26	208
7272	0	27	208
7273	0	28	208
7274	0	29	208
7275	0	30	208
7276	0	31	208
7277	0	32	208
7278	56	33	208
7279	0	34	208
7280	0	35	208
7281	0	1	209
7282	0	2	209
7283	72	3	209
7284	0	4	209
7285	6	5	209
7286	0	6	209
7287	0	7	209
7288	0	8	209
7289	0	9	209
7290	0	10	209
7291	0	11	209
7292	0	12	209
7293	0	13	209
7294	14	14	209
7295	0	15	209
7296	71	16	209
7297	0	17	209
7298	0	18	209
7299	0	19	209
7300	0	20	209
7301	0	21	209
7302	0	22	209
7303	0	23	209
7304	0	24	209
7305	0	25	209
7306	0	26	209
7307	58	27	209
7308	0	28	209
7309	0	29	209
7310	0	30	209
7311	0	31	209
7312	0	32	209
7313	0	33	209
7314	84	34	209
7315	0	35	209
7316	0	1	210
7317	0	2	210
7318	0	3	210
7319	0	4	210
7320	0	5	210
7321	0	6	210
7322	0	7	210
7323	0	8	210
7324	0	9	210
7325	0	10	210
7326	0	11	210
7327	0	12	210
7328	0	13	210
7329	0	14	210
7330	0	15	210
7331	0	16	210
7332	0	17	210
7333	0	18	210
7334	0	19	210
7335	0	20	210
7336	0	21	210
7337	70	22	210
7338	0	23	210
7339	0	24	210
7340	0	25	210
7341	0	26	210
7342	59	27	210
7343	73	28	210
7344	0	29	210
7345	0	30	210
7346	0	31	210
7347	0	32	210
7348	0	33	210
7349	0	34	210
7350	36	35	210
7351	0	1	211
7352	42	2	211
7353	0	3	211
7354	0	4	211
7355	0	5	211
7356	97	6	211
7357	0	7	211
7358	0	8	211
7359	0	9	211
7360	0	10	211
7361	29	11	211
7362	0	12	211
7363	0	13	211
7364	4	14	211
7365	0	15	211
7366	0	16	211
7367	62	17	211
7368	0	18	211
7369	0	19	211
7370	0	20	211
7371	0	21	211
7372	0	22	211
7373	0	23	211
7374	0	24	211
7375	0	25	211
7376	83	26	211
7377	22	27	211
7378	96	28	211
7379	0	29	211
7380	0	30	211
7381	0	31	211
7382	0	32	211
7383	0	33	211
7384	0	34	211
7385	0	35	211
7386	0	1	212
7387	0	2	212
7388	32	3	212
7389	20	4	212
7390	0	5	212
7391	17	6	212
7392	58	7	212
7393	0	8	212
7394	0	9	212
7395	0	10	212
7396	0	11	212
7397	0	12	212
7398	17	13	212
7399	0	14	212
7400	0	15	212
7401	6	16	212
7402	0	17	212
7403	0	18	212
7404	0	19	212
7405	93	20	212
7406	0	21	212
7407	7	22	212
7408	0	23	212
7409	0	24	212
7410	0	25	212
7411	99	26	212
7412	0	27	212
7413	0	28	212
7414	21	29	212
7415	0	30	212
7416	0	31	212
7417	0	32	212
7418	0	33	212
7419	0	34	212
7420	0	35	212
7421	41	1	213
7422	0	2	213
7423	0	3	213
7424	0	4	213
7425	44	5	213
7426	0	6	213
7427	39	7	213
7428	38	8	213
7429	41	9	213
7430	0	10	213
7431	19	11	213
7432	0	12	213
7433	51	13	213
7434	0	14	213
7435	49	15	213
7436	0	16	213
7437	61	17	213
7438	68	18	213
7439	10	19	213
7440	0	20	213
7441	21	21	213
7442	0	22	213
7443	0	23	213
7444	0	24	213
7445	25	25	213
7446	59	26	213
7447	73	27	213
7448	0	28	213
7449	12	29	213
7450	0	30	213
7451	0	31	213
7452	0	32	213
7453	0	33	213
7454	0	34	213
7455	0	35	213
7456	0	1	214
7457	0	2	214
7458	0	3	214
7459	0	4	214
7460	28	5	214
7461	0	6	214
7462	0	7	214
7463	51	8	214
7464	0	9	214
7465	0	10	214
7466	0	11	214
7467	0	12	214
7468	0	13	214
7469	39	14	214
7470	0	15	214
7471	71	16	214
7472	97	17	214
7473	75	18	214
7474	0	19	214
7475	65	20	214
7476	0	21	214
7477	0	22	214
7478	0	23	214
7479	37	24	214
7480	0	25	214
7481	0	26	214
7482	0	27	214
7483	0	28	214
7484	7	29	214
7485	0	30	214
7486	0	31	214
7487	0	32	214
7488	0	33	214
7489	0	34	214
7490	37	35	214
7491	95	1	215
7492	0	2	215
7493	0	3	215
7494	0	4	215
7495	0	5	215
7496	0	6	215
7497	0	7	215
7498	0	8	215
7499	0	9	215
7500	0	10	215
7501	0	11	215
7502	0	12	215
7503	50	13	215
7504	0	14	215
7505	0	15	215
7506	26	16	215
7507	0	17	215
7508	15	18	215
7509	0	19	215
7510	86	20	215
7511	100	21	215
7512	0	22	215
7513	0	23	215
7514	16	24	215
7515	100	25	215
7516	77	26	215
7517	69	27	215
7518	0	28	215
7519	0	29	215
7520	0	30	215
7521	57	31	215
7522	8	32	215
7523	91	33	215
7524	0	34	215
7525	0	35	215
7526	0	1	216
7527	0	2	216
7528	0	3	216
7529	0	4	216
7530	0	5	216
7531	97	6	216
7532	0	7	216
7533	0	8	216
7534	0	9	216
7535	0	10	216
7536	0	11	216
7537	0	12	216
7538	77	13	216
7539	0	14	216
7540	0	15	216
7541	0	16	216
7542	0	17	216
7543	90	18	216
7544	0	19	216
7545	56	20	216
7546	0	21	216
7547	0	22	216
7548	0	23	216
7549	0	24	216
7550	0	25	216
7551	0	26	216
7552	3	27	216
7553	0	28	216
7554	0	29	216
7555	0	30	216
7556	0	31	216
7557	0	32	216
7558	0	33	216
7559	0	34	216
7560	0	35	216
7561	0	1	217
7562	0	2	217
7563	0	3	217
7564	0	4	217
7565	0	5	217
7566	0	6	217
7567	0	7	217
7568	0	8	217
7569	5	9	217
7570	0	10	217
7571	0	11	217
7572	64	12	217
7573	0	13	217
7574	0	14	217
7575	0	15	217
7576	50	16	217
7577	0	17	217
7578	0	18	217
7579	10	19	217
7580	66	20	217
7581	0	21	217
7582	0	22	217
7583	0	23	217
7584	81	24	217
7585	0	25	217
7586	0	26	217
7587	0	27	217
7588	53	28	217
7589	0	29	217
7590	0	30	217
7591	0	31	217
7592	0	32	217
7593	0	33	217
7594	2	34	217
7595	0	35	217
7596	74	1	218
7597	0	2	218
7598	16	3	218
7599	91	4	218
7600	91	5	218
7601	83	6	218
7602	0	7	218
7603	54	8	218
7604	0	9	218
7605	95	10	218
7606	0	11	218
7607	0	12	218
7608	0	13	218
7609	0	14	218
7610	0	15	218
7611	0	16	218
7612	0	17	218
7613	0	18	218
7614	0	19	218
7615	0	20	218
7616	16	21	218
7617	0	22	218
7618	0	23	218
7619	0	24	218
7620	0	25	218
7621	0	26	218
7622	0	27	218
7623	0	28	218
7624	39	29	218
7625	0	30	218
7626	16	31	218
7627	40	32	218
7628	0	33	218
7629	0	34	218
7630	0	35	218
7631	0	1	219
7632	0	2	219
7633	0	3	219
7634	59	4	219
7635	14	5	219
7636	0	6	219
7637	86	7	219
7638	90	8	219
7639	0	9	219
7640	0	10	219
7641	0	11	219
7642	0	12	219
7643	0	13	219
7644	0	14	219
7645	0	15	219
7646	7	16	219
7647	0	17	219
7648	0	18	219
7649	14	19	219
7650	0	20	219
7651	0	21	219
7652	0	22	219
7653	0	23	219
7654	65	24	219
7655	39	25	219
7656	0	26	219
7657	0	27	219
7658	0	28	219
7659	0	29	219
7660	4	30	219
7661	0	31	219
7662	0	32	219
7663	0	33	219
7664	0	34	219
7665	0	35	219
7666	0	1	220
7667	0	2	220
7668	0	3	220
7669	34	4	220
7670	84	5	220
7671	0	6	220
7672	0	7	220
7673	0	8	220
7674	57	9	220
7675	78	10	220
7676	0	11	220
7677	0	12	220
7678	0	13	220
7679	0	14	220
7680	0	15	220
7681	0	16	220
7682	0	17	220
7683	0	18	220
7684	0	19	220
7685	33	20	220
7686	0	21	220
7687	98	22	220
7688	0	23	220
7689	0	24	220
7690	0	25	220
7691	0	26	220
7692	0	27	220
7693	0	28	220
7694	0	29	220
7695	0	30	220
7696	73	31	220
7697	0	32	220
7698	0	33	220
7699	0	34	220
7700	0	35	220
7701	0	1	221
7702	0	2	221
7703	0	3	221
7704	0	4	221
7705	0	5	221
7706	0	6	221
7707	0	7	221
7708	0	8	221
7709	0	9	221
7710	0	10	221
7711	0	11	221
7712	39	12	221
7713	0	13	221
7714	0	14	221
7715	0	15	221
7716	0	16	221
7717	0	17	221
7718	0	18	221
7719	0	19	221
7720	26	20	221
7721	0	21	221
7722	0	22	221
7723	0	23	221
7724	0	24	221
7725	91	25	221
7726	0	26	221
7727	0	27	221
7728	0	28	221
7729	0	29	221
7730	0	30	221
7731	0	31	221
7732	1	32	221
7733	92	33	221
7734	0	34	221
7735	0	35	221
7736	0	1	222
7737	0	2	222
7738	66	3	222
7739	5	4	222
7740	0	5	222
7741	5	6	222
7742	0	7	222
7743	0	8	222
7744	0	9	222
7745	0	10	222
7746	0	11	222
7747	0	12	222
7748	0	13	222
7749	0	14	222
7750	0	15	222
7751	85	16	222
7752	29	17	222
7753	0	18	222
7754	0	19	222
7755	78	20	222
7756	38	21	222
7757	68	22	222
7758	0	23	222
7759	87	24	222
7760	0	25	222
7761	0	26	222
7762	0	27	222
7763	0	28	222
7764	0	29	222
7765	0	30	222
7766	0	31	222
7767	0	32	222
7768	0	33	222
7769	0	34	222
7770	0	35	222
7771	0	1	223
7772	0	2	223
7773	0	3	223
7774	25	4	223
7775	0	5	223
7776	47	6	223
7777	0	7	223
7778	12	8	223
7779	0	9	223
7780	80	10	223
7781	0	11	223
7782	13	12	223
7783	0	13	223
7784	93	14	223
7785	0	15	223
7786	13	16	223
7787	0	17	223
7788	0	18	223
7789	0	19	223
7790	0	20	223
7791	0	21	223
7792	0	22	223
7793	0	23	223
7794	0	24	223
7795	38	25	223
7796	0	26	223
7797	0	27	223
7798	0	28	223
7799	13	29	223
7800	66	30	223
7801	4	31	223
7802	0	32	223
7803	0	33	223
7804	40	34	223
7805	0	35	223
7806	15	1	224
7807	97	2	224
7808	84	3	224
7809	0	4	224
7810	0	5	224
7811	0	6	224
7812	0	7	224
7813	93	8	224
7814	67	9	224
7815	9	10	224
7816	0	11	224
7817	0	12	224
7818	0	13	224
7819	0	14	224
7820	0	15	224
7821	0	16	224
7822	0	17	224
7823	14	18	224
7824	28	19	224
7825	86	20	224
7826	0	21	224
7827	0	22	224
7828	67	23	224
7829	0	24	224
7830	0	25	224
7831	63	26	224
7832	55	27	224
7833	0	28	224
7834	0	29	224
7835	0	30	224
7836	0	31	224
7837	59	32	224
7838	0	33	224
7839	0	34	224
7840	0	35	224
7841	0	1	225
7842	0	2	225
7843	0	3	225
7844	36	4	225
7845	11	5	225
7846	0	6	225
7847	0	7	225
7848	96	8	225
7849	5	9	225
7850	0	10	225
7851	0	11	225
7852	0	12	225
7853	0	13	225
7854	0	14	225
7855	0	15	225
7856	0	16	225
7857	0	17	225
7858	0	18	225
7859	24	19	225
7860	0	20	225
7861	0	21	225
7862	42	22	225
7863	0	23	225
7864	0	24	225
7865	0	25	225
7866	0	26	225
7867	0	27	225
7868	0	28	225
7869	0	29	225
7870	0	30	225
7871	0	31	225
7872	0	32	225
7873	0	33	225
7874	0	34	225
7875	0	35	225
7876	0	1	226
7877	0	2	226
7878	34	3	226
7879	0	4	226
7880	0	5	226
7881	0	6	226
7882	81	7	226
7883	0	8	226
7884	0	9	226
7885	0	10	226
7886	0	11	226
7887	0	12	226
7888	0	13	226
7889	0	14	226
7890	0	15	226
7891	0	16	226
7892	0	17	226
7893	96	18	226
7894	0	19	226
7895	0	20	226
7896	25	21	226
7897	0	22	226
7898	14	23	226
7899	0	24	226
7900	55	25	226
7901	0	26	226
7902	0	27	226
7903	0	28	226
7904	0	29	226
7905	0	30	226
7906	0	31	226
7907	0	32	226
7908	0	33	226
7909	0	34	226
7910	0	35	226
7911	0	1	227
7912	0	2	227
7913	0	3	227
7914	0	4	227
7915	0	5	227
7916	0	6	227
7917	50	7	227
7918	0	8	227
7919	0	9	227
7920	0	10	227
7921	0	11	227
7922	0	12	227
7923	32	13	227
7924	0	14	227
7925	0	15	227
7926	23	16	227
7927	0	17	227
7928	58	18	227
7929	48	19	227
7930	0	20	227
7931	0	21	227
7932	0	22	227
7933	4	23	227
7934	0	24	227
7935	0	25	227
7936	0	26	227
7937	63	27	227
7938	82	28	227
7939	0	29	227
7940	0	30	227
7941	0	31	227
7942	19	32	227
7943	0	33	227
7944	80	34	227
7945	0	35	227
7946	0	1	228
7947	0	2	228
7948	0	3	228
7949	0	4	228
7950	0	5	228
7951	0	6	228
7952	0	7	228
7953	0	8	228
7954	0	9	228
7955	0	10	228
7956	0	11	228
7957	0	12	228
7958	49	13	228
7959	0	14	228
7960	0	15	228
7961	0	16	228
7962	27	17	228
7963	0	18	228
7964	0	19	228
7965	18	20	228
7966	0	21	228
7967	0	22	228
7968	0	23	228
7969	0	24	228
7970	0	25	228
7971	0	26	228
7972	0	27	228
7973	0	28	228
7974	0	29	228
7975	0	30	228
7976	33	31	228
7977	15	32	228
7978	0	33	228
7979	0	34	228
7980	0	35	228
7981	0	1	229
7982	0	2	229
7983	86	3	229
7984	0	4	229
7985	0	5	229
7986	0	6	229
7987	0	7	229
7988	0	8	229
7989	0	9	229
7990	0	10	229
7991	0	11	229
7992	0	12	229
7993	51	13	229
7994	0	14	229
7995	68	15	229
7996	37	16	229
7997	0	17	229
7998	0	18	229
7999	0	19	229
8000	0	20	229
8001	0	21	229
8002	40	22	229
8003	82	23	229
8004	0	24	229
8005	0	25	229
8006	0	26	229
8007	58	27	229
8008	0	28	229
8009	0	29	229
8010	0	30	229
8011	0	31	229
8012	55	32	229
8013	41	33	229
8014	23	34	229
8015	0	35	229
8016	0	1	230
8017	0	2	230
8018	89	3	230
8019	41	4	230
8020	28	5	230
8021	0	6	230
8022	0	7	230
8023	0	8	230
8024	0	9	230
8025	55	10	230
8026	0	11	230
8027	0	12	230
8028	0	13	230
8029	86	14	230
8030	0	15	230
8031	0	16	230
8032	0	17	230
8033	0	18	230
8034	0	19	230
8035	0	20	230
8036	0	21	230
8037	0	22	230
8038	23	23	230
8039	0	24	230
8040	0	25	230
8041	0	26	230
8042	0	27	230
8043	86	28	230
8044	0	29	230
8045	0	30	230
8046	0	31	230
8047	0	32	230
8048	66	33	230
8049	0	34	230
8050	38	35	230
8051	0	1	231
8052	0	2	231
8053	0	3	231
8054	0	4	231
8055	11	5	231
8056	21	6	231
8057	49	7	231
8058	0	8	231
8059	8	9	231
8060	4	10	231
8061	78	11	231
8062	0	12	231
8063	70	13	231
8064	0	14	231
8065	0	15	231
8066	0	16	231
8067	0	17	231
8068	0	18	231
8069	65	19	231
8070	80	20	231
8071	99	21	231
8072	38	22	231
8073	0	23	231
8074	0	24	231
8075	0	25	231
8076	0	26	231
8077	0	27	231
8078	0	28	231
8079	19	29	231
8080	0	30	231
8081	44	31	231
8082	0	32	231
8083	0	33	231
8084	30	34	231
8085	74	35	231
8086	0	1	232
8087	0	2	232
8088	0	3	232
8089	0	4	232
8090	0	5	232
8091	0	6	232
8092	0	7	232
8093	0	8	232
8094	0	9	232
8095	11	10	232
8096	65	11	232
8097	0	12	232
8098	0	13	232
8099	0	14	232
8100	0	15	232
8101	0	16	232
8102	0	17	232
8103	0	18	232
8104	0	19	232
8105	0	20	232
8106	0	21	232
8107	0	22	232
8108	0	23	232
8109	0	24	232
8110	0	25	232
8111	0	26	232
8112	94	27	232
8113	0	28	232
8114	35	29	232
8115	94	30	232
8116	0	31	232
8117	0	32	232
8118	0	33	232
8119	0	34	232
8120	0	35	232
8121	0	1	233
8122	0	2	233
8123	0	3	233
8124	0	4	233
8125	41	5	233
8126	0	6	233
8127	0	7	233
8128	0	8	233
8129	0	9	233
8130	15	10	233
8131	0	11	233
8132	0	12	233
8133	0	13	233
8134	0	14	233
8135	0	15	233
8136	0	16	233
8137	82	17	233
8138	0	18	233
8139	0	19	233
8140	0	20	233
8141	42	21	233
8142	0	22	233
8143	0	23	233
8144	80	24	233
8145	0	25	233
8146	0	26	233
8147	0	27	233
8148	0	28	233
8149	0	29	233
8150	0	30	233
8151	0	31	233
8152	0	32	233
8153	0	33	233
8154	0	34	233
8155	0	35	233
8156	69	1	234
8157	17	2	234
8158	0	3	234
8159	0	4	234
8160	23	5	234
8161	96	6	234
8162	0	7	234
8163	0	8	234
8164	78	9	234
8165	26	10	234
8166	0	11	234
8167	0	12	234
8168	0	13	234
8169	4	14	234
8170	85	15	234
8171	0	16	234
8172	80	17	234
8173	41	18	234
8174	7	19	234
8175	56	20	234
8176	21	21	234
8177	94	22	234
8178	0	23	234
8179	0	24	234
8180	0	25	234
8181	0	26	234
8182	0	27	234
8183	0	28	234
8184	0	29	234
8185	96	30	234
8186	3	31	234
8187	0	32	234
8188	0	33	234
8189	0	34	234
8190	91	35	234
8191	81	1	235
8192	25	2	235
8193	40	3	235
8194	0	4	235
8195	0	5	235
8196	0	6	235
8197	0	7	235
8198	26	8	235
8199	0	9	235
8200	29	10	235
8201	0	11	235
8202	0	12	235
8203	0	13	235
8204	94	14	235
8205	33	15	235
8206	0	16	235
8207	0	17	235
8208	0	18	235
8209	0	19	235
8210	68	20	235
8211	0	21	235
8212	0	22	235
8213	0	23	235
8214	65	24	235
8215	0	25	235
8216	48	26	235
8217	0	27	235
8218	2	28	235
8219	0	29	235
8220	52	30	235
8221	21	31	235
8222	0	32	235
8223	0	33	235
8224	0	34	235
8225	14	35	235
8226	0	1	236
8227	0	2	236
8228	64	3	236
8229	0	4	236
8230	0	5	236
8231	0	6	236
8232	100	7	236
8233	61	8	236
8234	0	9	236
8235	0	10	236
8236	0	11	236
8237	44	12	236
8238	0	13	236
8239	0	14	236
8240	75	15	236
8241	0	16	236
8242	0	17	236
8243	0	18	236
8244	0	19	236
8245	47	20	236
8246	0	21	236
8247	96	22	236
8248	0	23	236
8249	0	24	236
8250	51	25	236
8251	0	26	236
8252	95	27	236
8253	0	28	236
8254	0	29	236
8255	50	30	236
8256	0	31	236
8257	0	32	236
8258	0	33	236
8259	58	34	236
8260	0	35	236
8261	58	1	237
8262	0	2	237
8263	0	3	237
8264	0	4	237
8265	0	5	237
8266	0	6	237
8267	90	7	237
8268	0	8	237
8269	0	9	237
8270	6	10	237
8271	0	11	237
8272	0	12	237
8273	0	13	237
8274	0	14	237
8275	7	15	237
8276	0	16	237
8277	0	17	237
8278	0	18	237
8279	0	19	237
8280	0	20	237
8281	0	21	237
8282	0	22	237
8283	0	23	237
8284	4	24	237
8285	0	25	237
8286	0	26	237
8287	0	27	237
8288	0	28	237
8289	0	29	237
8290	0	30	237
8291	0	31	237
8292	0	32	237
8293	56	33	237
8294	0	34	237
8295	0	35	237
8296	23	1	238
8297	0	2	238
8298	0	3	238
8299	0	4	238
8300	0	5	238
8301	86	6	238
8302	0	7	238
8303	0	8	238
8304	0	9	238
8305	71	10	238
8306	0	11	238
8307	0	12	238
8308	0	13	238
8309	0	14	238
8310	0	15	238
8311	0	16	238
8312	0	17	238
8313	0	18	238
8314	0	19	238
8315	0	20	238
8316	0	21	238
8317	0	22	238
8318	0	23	238
8319	0	24	238
8320	0	25	238
8321	0	26	238
8322	0	27	238
8323	47	28	238
8324	0	29	238
8325	0	30	238
8326	0	31	238
8327	0	32	238
8328	0	33	238
8329	0	34	238
8330	0	35	238
8331	0	1	239
8332	0	2	239
8333	53	3	239
8334	0	4	239
8335	0	5	239
8336	47	6	239
8337	4	7	239
8338	0	8	239
8339	99	9	239
8340	0	10	239
8341	0	11	239
8342	0	12	239
8343	0	13	239
8344	0	14	239
8345	0	15	239
8346	100	16	239
8347	0	17	239
8348	0	18	239
8349	0	19	239
8350	0	20	239
8351	24	21	239
8352	0	22	239
8353	0	23	239
8354	0	24	239
8355	0	25	239
8356	0	26	239
8357	0	27	239
8358	0	28	239
8359	0	29	239
8360	0	30	239
8361	0	31	239
8362	25	32	239
8363	4	33	239
8364	0	34	239
8365	0	35	239
8366	0	1	240
8367	71	2	240
8368	0	3	240
8369	0	4	240
8370	0	5	240
8371	0	6	240
8372	0	7	240
8373	0	8	240
8374	72	9	240
8375	95	10	240
8376	0	11	240
8377	0	12	240
8378	0	13	240
8379	20	14	240
8380	0	15	240
8381	0	16	240
8382	19	17	240
8383	11	18	240
8384	0	19	240
8385	15	20	240
8386	0	21	240
8387	0	22	240
8388	0	23	240
8389	0	24	240
8390	0	25	240
8391	0	26	240
8392	0	27	240
8393	0	28	240
8394	0	29	240
8395	0	30	240
8396	0	31	240
8397	0	32	240
8398	0	33	240
8399	0	34	240
8400	0	35	240
8401	0	1	241
8402	0	2	241
8403	0	3	241
8404	0	4	241
8405	0	5	241
8406	0	6	241
8407	0	7	241
8408	0	8	241
8409	70	9	241
8410	2	10	241
8411	0	11	241
8412	0	12	241
8413	1	13	241
8414	47	14	241
8415	0	15	241
8416	0	16	241
8417	0	17	241
8418	0	18	241
8419	0	19	241
8420	0	20	241
8421	0	21	241
8422	85	22	241
8423	0	23	241
8424	40	24	241
8425	0	25	241
8426	0	26	241
8427	0	27	241
8428	0	28	241
8429	0	29	241
8430	44	30	241
8431	0	31	241
8432	0	32	241
8433	0	33	241
8434	86	34	241
8435	0	35	241
8436	57	1	242
8437	0	2	242
8438	0	3	242
8439	0	4	242
8440	0	5	242
8441	0	6	242
8442	0	7	242
8443	98	8	242
8444	0	9	242
8445	0	10	242
8446	0	11	242
8447	28	12	242
8448	0	13	242
8449	0	14	242
8450	86	15	242
8451	26	16	242
8452	22	17	242
8453	0	18	242
8454	0	19	242
8455	58	20	242
8456	0	21	242
8457	0	22	242
8458	50	23	242
8459	0	24	242
8460	0	25	242
8461	0	26	242
8462	0	27	242
8463	69	28	242
8464	0	29	242
8465	36	30	242
8466	0	31	242
8467	0	32	242
8468	94	33	242
8469	10	34	242
8470	0	35	242
8471	60	1	243
8472	0	2	243
8473	0	3	243
8474	98	4	243
8475	0	5	243
8476	0	6	243
8477	0	7	243
8478	0	8	243
8479	0	9	243
8480	0	10	243
8481	13	11	243
8482	0	12	243
8483	0	13	243
8484	91	14	243
8485	30	15	243
8486	53	16	243
8487	0	17	243
8488	76	18	243
8489	0	19	243
8490	0	20	243
8491	59	21	243
8492	67	22	243
8493	0	23	243
8494	0	24	243
8495	0	25	243
8496	62	26	243
8497	0	27	243
8498	50	28	243
8499	54	29	243
8500	0	30	243
8501	0	31	243
8502	0	32	243
8503	0	33	243
8504	0	34	243
8505	0	35	243
8506	0	1	244
8507	0	2	244
8508	0	3	244
8509	0	4	244
8510	0	5	244
8511	0	6	244
8512	0	7	244
8513	0	8	244
8514	88	9	244
8515	0	10	244
8516	0	11	244
8517	0	12	244
8518	0	13	244
8519	0	14	244
8520	0	15	244
8521	0	16	244
8522	0	17	244
8523	0	18	244
8524	0	19	244
8525	0	20	244
8526	0	21	244
8527	0	22	244
8528	0	23	244
8529	0	24	244
8530	0	25	244
8531	0	26	244
8532	0	27	244
8533	0	28	244
8534	0	29	244
8535	0	30	244
8536	0	31	244
8537	0	32	244
8538	0	33	244
8539	0	34	244
8540	0	35	244
8541	0	1	245
8542	0	2	245
8543	53	3	245
8544	59	4	245
8545	0	5	245
8546	0	6	245
8547	99	7	245
8548	0	8	245
8549	0	9	245
8550	0	10	245
8551	31	11	245
8552	0	12	245
8553	50	13	245
8554	75	14	245
8555	86	15	245
8556	0	16	245
8557	0	17	245
8558	0	18	245
8559	0	19	245
8560	0	20	245
8561	0	21	245
8562	0	22	245
8563	0	23	245
8564	0	24	245
8565	12	25	245
8566	10	26	245
8567	67	27	245
8568	0	28	245
8569	67	29	245
8570	0	30	245
8571	19	31	245
8572	0	32	245
8573	0	33	245
8574	0	34	245
8575	0	35	245
8576	0	1	246
8577	0	2	246
8578	91	3	246
8579	0	4	246
8580	0	5	246
8581	0	6	246
8582	0	7	246
8583	0	8	246
8584	0	9	246
8585	79	10	246
8586	0	11	246
8587	0	12	246
8588	0	13	246
8589	55	14	246
8590	6	15	246
8591	0	16	246
8592	37	17	246
8593	42	18	246
8594	0	19	246
8595	12	20	246
8596	0	21	246
8597	79	22	246
8598	54	23	246
8599	0	24	246
8600	77	25	246
8601	98	26	246
8602	0	27	246
8603	0	28	246
8604	0	29	246
8605	2	30	246
8606	0	31	246
8607	0	32	246
8608	0	33	246
8609	0	34	246
8610	0	35	246
8611	52	1	247
8612	76	2	247
8613	94	3	247
8614	0	4	247
8615	0	5	247
8616	0	6	247
8617	0	7	247
8618	28	8	247
8619	0	9	247
8620	0	10	247
8621	4	11	247
8622	77	12	247
8623	0	13	247
8624	23	14	247
8625	79	15	247
8626	0	16	247
8627	60	17	247
8628	43	18	247
8629	0	19	247
8630	0	20	247
8631	0	21	247
8632	0	22	247
8633	0	23	247
8634	0	24	247
8635	52	25	247
8636	0	26	247
8637	0	27	247
8638	6	28	247
8639	0	29	247
8640	0	30	247
8641	64	31	247
8642	0	32	247
8643	0	33	247
8644	84	34	247
8645	40	35	247
8646	0	1	248
8647	44	2	248
8648	0	3	248
8649	0	4	248
8650	38	5	248
8651	0	6	248
8652	49	7	248
8653	0	8	248
8654	0	9	248
8655	5	10	248
8656	0	11	248
8657	0	12	248
8658	49	13	248
8659	0	14	248
8660	0	15	248
8661	0	16	248
8662	3	17	248
8663	0	18	248
8664	0	19	248
8665	90	20	248
8666	4	21	248
8667	0	22	248
8668	0	23	248
8669	0	24	248
8670	0	25	248
8671	0	26	248
8672	0	27	248
8673	0	28	248
8674	16	29	248
8675	0	30	248
8676	0	31	248
8677	0	32	248
8678	2	33	248
8679	0	34	248
8680	7	35	248
8681	0	1	249
8682	0	2	249
8683	0	3	249
8684	8	4	249
8685	0	5	249
8686	0	6	249
8687	0	7	249
8688	0	8	249
8689	0	9	249
8690	0	10	249
8691	0	11	249
8692	0	12	249
8693	0	13	249
8694	0	14	249
8695	95	15	249
8696	0	16	249
8697	0	17	249
8698	0	18	249
8699	85	19	249
8700	0	20	249
8701	1	21	249
8702	0	22	249
8703	0	23	249
8704	0	24	249
8705	0	25	249
8706	0	26	249
8707	0	27	249
8708	0	28	249
8709	0	29	249
8710	0	30	249
8711	0	31	249
8712	0	32	249
8713	0	33	249
8714	0	34	249
8715	3	35	249
8716	0	1	250
8717	0	2	250
8718	0	3	250
8719	0	4	250
8720	0	5	250
8721	0	6	250
8722	0	7	250
8723	0	8	250
8724	0	9	250
8725	0	10	250
8726	0	11	250
8727	0	12	250
8728	0	13	250
8729	0	14	250
8730	0	15	250
8731	8	16	250
8732	3	17	250
8733	0	18	250
8734	0	19	250
8735	0	20	250
8736	0	21	250
8737	0	22	250
8738	0	23	250
8739	0	24	250
8740	0	25	250
8741	0	26	250
8742	0	27	250
8743	5	28	250
8744	0	29	250
8745	91	30	250
8746	0	31	250
8747	0	32	250
8748	0	33	250
8749	0	34	250
8750	0	35	250
8751	42	1	251
8752	0	2	251
8753	0	3	251
8754	79	4	251
8755	0	5	251
8756	77	6	251
8757	0	7	251
8758	56	8	251
8759	0	9	251
8760	0	10	251
8761	87	11	251
8762	88	12	251
8763	0	13	251
8764	0	14	251
8765	0	15	251
8766	50	16	251
8767	0	17	251
8768	0	18	251
8769	7	19	251
8770	0	20	251
8771	99	21	251
8772	0	22	251
8773	0	23	251
8774	0	24	251
8775	17	25	251
8776	0	26	251
8777	81	27	251
8778	0	28	251
8779	0	29	251
8780	0	30	251
8781	0	31	251
8782	0	32	251
8783	0	33	251
8784	0	34	251
8785	0	35	251
8786	0	1	252
8787	0	2	252
8788	0	3	252
8789	0	4	252
8790	0	5	252
8791	0	6	252
8792	0	7	252
8793	0	8	252
8794	0	9	252
8795	0	10	252
8796	0	11	252
8797	0	12	252
8798	0	13	252
8799	0	14	252
8800	20	15	252
8801	0	16	252
8802	0	17	252
8803	0	18	252
8804	0	19	252
8805	84	20	252
8806	0	21	252
8807	62	22	252
8808	31	23	252
8809	0	24	252
8810	0	25	252
8811	0	26	252
8812	0	27	252
8813	0	28	252
8814	0	29	252
8815	0	30	252
8816	0	31	252
8817	42	32	252
8818	83	33	252
8819	0	34	252
8820	73	35	252
8821	0	1	253
8822	0	2	253
8823	0	3	253
8824	0	4	253
8825	0	5	253
8826	0	6	253
8827	0	7	253
8828	0	8	253
8829	0	9	253
8830	0	10	253
8831	0	11	253
8832	0	12	253
8833	0	13	253
8834	0	14	253
8835	0	15	253
8836	0	16	253
8837	0	17	253
8838	0	18	253
8839	0	19	253
8840	5	20	253
8841	0	21	253
8842	0	22	253
8843	0	23	253
8844	0	24	253
8845	0	25	253
8846	0	26	253
8847	0	27	253
8848	0	28	253
8849	0	29	253
8850	0	30	253
8851	0	31	253
8852	69	32	253
8853	0	33	253
8854	0	34	253
8855	0	35	253
8856	0	1	254
8857	91	2	254
8858	0	3	254
8859	0	4	254
8860	15	5	254
8861	0	6	254
8862	100	7	254
8863	85	8	254
8864	0	9	254
8865	0	10	254
8866	0	11	254
8867	0	12	254
8868	0	13	254
8869	0	14	254
8870	0	15	254
8871	44	16	254
8872	0	17	254
8873	0	18	254
8874	0	19	254
8875	30	20	254
8876	0	21	254
8877	0	22	254
8878	0	23	254
8879	0	24	254
8880	51	25	254
8881	0	26	254
8882	0	27	254
8883	0	28	254
8884	0	29	254
8885	34	30	254
8886	0	31	254
8887	0	32	254
8888	0	33	254
8889	0	34	254
8890	0	35	254
8891	0	1	255
8892	0	2	255
8893	0	3	255
8894	0	4	255
8895	0	5	255
8896	0	6	255
8897	0	7	255
8898	0	8	255
8899	0	9	255
8900	0	10	255
8901	0	11	255
8902	0	12	255
8903	0	13	255
8904	73	14	255
8905	0	15	255
8906	0	16	255
8907	0	17	255
8908	0	18	255
8909	25	19	255
8910	0	20	255
8911	0	21	255
8912	0	22	255
8913	0	23	255
8914	0	24	255
8915	0	25	255
8916	0	26	255
8917	0	27	255
8918	0	28	255
8919	0	29	255
8920	0	30	255
8921	0	31	255
8922	7	32	255
8923	0	33	255
8924	0	34	255
8925	0	35	255
8926	0	1	256
8927	0	2	256
8928	0	3	256
8929	0	4	256
8930	0	5	256
8931	0	6	256
8932	51	7	256
8933	63	8	256
8934	0	9	256
8935	31	10	256
8936	0	11	256
8937	0	12	256
8938	0	13	256
8939	0	14	256
8940	20	15	256
8941	0	16	256
8942	0	17	256
8943	0	18	256
8944	0	19	256
8945	10	20	256
8946	82	21	256
8947	0	22	256
8948	0	23	256
8949	74	24	256
8950	0	25	256
8951	0	26	256
8952	0	27	256
8953	52	28	256
8954	0	29	256
8955	0	30	256
8956	41	31	256
8957	0	32	256
8958	99	33	256
8959	0	34	256
8960	0	35	256
8961	0	1	257
8962	0	2	257
8963	37	3	257
8964	0	4	257
8965	0	5	257
8966	0	6	257
8967	0	7	257
8968	78	8	257
8969	0	9	257
8970	0	10	257
8971	40	11	257
8972	0	12	257
8973	0	13	257
8974	0	14	257
8975	0	15	257
8976	0	16	257
8977	0	17	257
8978	0	18	257
8979	0	19	257
8980	0	20	257
8981	61	21	257
8982	53	22	257
8983	0	23	257
8984	75	24	257
8985	0	25	257
8986	41	26	257
8987	42	27	257
8988	0	28	257
8989	0	29	257
8990	0	30	257
8991	0	31	257
8992	0	32	257
8993	0	33	257
8994	0	34	257
8995	0	35	257
8996	0	1	258
8997	96	2	258
8998	0	3	258
8999	0	4	258
9000	0	5	258
9001	0	6	258
9002	0	7	258
9003	0	8	258
9004	64	9	258
9005	8	10	258
9006	45	11	258
9007	27	12	258
9008	0	13	258
9009	0	14	258
9010	84	15	258
9011	85	16	258
9012	87	17	258
9013	0	18	258
9014	79	19	258
9015	0	20	258
9016	14	21	258
9017	97	22	258
9018	0	23	258
9019	0	24	258
9020	0	25	258
9021	0	26	258
9022	0	27	258
9023	75	28	258
9024	0	29	258
9025	52	30	258
9026	0	31	258
9027	92	32	258
9028	69	33	258
9029	75	34	258
9030	0	35	258
9031	0	1	259
9032	36	2	259
9033	0	3	259
9034	0	4	259
9035	54	5	259
9036	0	6	259
9037	0	7	259
9038	0	8	259
9039	0	9	259
9040	0	10	259
9041	0	11	259
9042	0	12	259
9043	0	13	259
9044	0	14	259
9045	0	15	259
9046	0	16	259
9047	0	17	259
9048	0	18	259
9049	0	19	259
9050	0	20	259
9051	0	21	259
9052	0	22	259
9053	0	23	259
9054	0	24	259
9055	0	25	259
9056	0	26	259
9057	0	27	259
9058	0	28	259
9059	0	29	259
9060	0	30	259
9061	0	31	259
9062	0	32	259
9063	0	33	259
9064	0	34	259
9065	0	35	259
9066	0	1	260
9067	84	2	260
9068	0	3	260
9069	0	4	260
9070	84	5	260
9071	61	6	260
9072	0	7	260
9073	48	8	260
9074	0	9	260
9075	97	10	260
9076	52	11	260
9077	0	12	260
9078	0	13	260
9079	0	14	260
9080	0	15	260
9081	70	16	260
9082	0	17	260
9083	99	18	260
9084	54	19	260
9085	58	20	260
9086	0	21	260
9087	0	22	260
9088	77	23	260
9089	74	24	260
9090	83	25	260
9091	71	26	260
9092	0	27	260
9093	0	28	260
9094	41	29	260
9095	37	30	260
9096	37	31	260
9097	0	32	260
9098	0	33	260
9099	94	34	260
9100	31	35	260
9101	0	1	261
9102	0	2	261
9103	0	3	261
9104	0	4	261
9105	0	5	261
9106	0	6	261
9107	0	7	261
9108	0	8	261
9109	0	9	261
9110	0	10	261
9111	0	11	261
9112	0	12	261
9113	0	13	261
9114	18	14	261
9115	6	15	261
9116	0	16	261
9117	0	17	261
9118	0	18	261
9119	0	19	261
9120	0	20	261
9121	0	21	261
9122	0	22	261
9123	0	23	261
9124	0	24	261
9125	0	25	261
9126	0	26	261
9127	0	27	261
9128	0	28	261
9129	0	29	261
9130	0	30	261
9131	0	31	261
9132	0	32	261
9133	0	33	261
9134	0	34	261
9135	0	35	261
9136	50	1	262
9137	0	2	262
9138	4	3	262
9139	0	4	262
9140	23	5	262
9141	0	6	262
9142	15	7	262
9143	0	8	262
9144	0	9	262
9145	76	10	262
9146	0	11	262
9147	46	12	262
9148	0	13	262
9149	0	14	262
9150	0	15	262
9151	59	16	262
9152	0	17	262
9153	0	18	262
9154	0	19	262
9155	12	20	262
9156	0	21	262
9157	0	22	262
9158	0	23	262
9159	0	24	262
9160	16	25	262
9161	0	26	262
9162	0	27	262
9163	21	28	262
9164	0	29	262
9165	0	30	262
9166	0	31	262
9167	25	32	262
9168	0	33	262
9169	0	34	262
9170	0	35	262
9171	0	1	263
9172	0	2	263
9173	0	3	263
9174	0	4	263
9175	0	5	263
9176	90	6	263
9177	0	7	263
9178	47	8	263
9179	77	9	263
9180	23	10	263
9181	0	11	263
9182	30	12	263
9183	0	13	263
9184	0	14	263
9185	0	15	263
9186	0	16	263
9187	0	17	263
9188	0	18	263
9189	0	19	263
9190	23	20	263
9191	0	21	263
9192	0	22	263
9193	0	23	263
9194	0	24	263
9195	0	25	263
9196	0	26	263
9197	20	27	263
9198	0	28	263
9199	0	29	263
9200	51	30	263
9201	0	31	263
9202	0	32	263
9203	26	33	263
9204	0	34	263
9205	84	35	263
9206	0	1	264
9207	22	2	264
9208	79	3	264
9209	74	4	264
9210	0	5	264
9211	0	6	264
9212	0	7	264
9213	0	8	264
9214	0	9	264
9215	1	10	264
9216	0	11	264
9217	2	12	264
9218	0	13	264
9219	0	14	264
9220	0	15	264
9221	99	16	264
9222	0	17	264
9223	0	18	264
9224	0	19	264
9225	0	20	264
9226	0	21	264
9227	0	22	264
9228	0	23	264
9229	0	24	264
9230	0	25	264
9231	0	26	264
9232	0	27	264
9233	0	28	264
9234	0	29	264
9235	0	30	264
9236	0	31	264
9237	0	32	264
9238	0	33	264
9239	0	34	264
9240	0	35	264
9241	0	1	265
9242	83	2	265
9243	22	3	265
9244	21	4	265
9245	68	5	265
9246	0	6	265
9247	0	7	265
9248	0	8	265
9249	0	9	265
9250	0	10	265
9251	47	11	265
9252	0	12	265
9253	0	13	265
9254	0	14	265
9255	0	15	265
9256	0	16	265
9257	11	17	265
9258	0	18	265
9259	90	19	265
9260	0	20	265
9261	0	21	265
9262	0	22	265
9263	0	23	265
9264	0	24	265
9265	35	25	265
9266	61	26	265
9267	0	27	265
9268	22	28	265
9269	51	29	265
9270	0	30	265
9271	57	31	265
9272	0	32	265
9273	94	33	265
9274	0	34	265
9275	0	35	265
9276	0	1	266
9277	55	2	266
9278	0	3	266
9279	0	4	266
9280	0	5	266
9281	21	6	266
9282	1	7	266
9283	0	8	266
9284	38	9	266
9285	0	10	266
9286	0	11	266
9287	0	12	266
9288	62	13	266
9289	0	14	266
9290	0	15	266
9291	0	16	266
9292	0	17	266
9293	0	18	266
9294	0	19	266
9295	0	20	266
9296	39	21	266
9297	31	22	266
9298	0	23	266
9299	71	24	266
9300	8	25	266
9301	0	26	266
9302	66	27	266
9303	65	28	266
9304	0	29	266
9305	0	30	266
9306	59	31	266
9307	37	32	266
9308	30	33	266
9309	85	34	266
9310	58	35	266
9311	51	1	267
9312	0	2	267
9313	0	3	267
9314	0	4	267
9315	0	5	267
9316	0	6	267
9317	0	7	267
9318	0	8	267
9319	0	9	267
9320	0	10	267
9321	54	11	267
9322	0	12	267
9323	0	13	267
9324	0	14	267
9325	0	15	267
9326	0	16	267
9327	0	17	267
9328	50	18	267
9329	97	19	267
9330	83	20	267
9331	0	21	267
9332	0	22	267
9333	0	23	267
9334	0	24	267
9335	0	25	267
9336	0	26	267
9337	0	27	267
9338	46	28	267
9339	0	29	267
9340	36	30	267
9341	0	31	267
9342	0	32	267
9343	0	33	267
9344	0	34	267
9345	0	35	267
9346	0	1	268
9347	0	2	268
9348	0	3	268
9349	5	4	268
9350	0	5	268
9351	0	6	268
9352	0	7	268
9353	0	8	268
9354	0	9	268
9355	0	10	268
9356	0	11	268
9357	0	12	268
9358	0	13	268
9359	0	14	268
9360	0	15	268
9361	85	16	268
9362	0	17	268
9363	0	18	268
9364	0	19	268
9365	0	20	268
9366	45	21	268
9367	74	22	268
9368	0	23	268
9369	0	24	268
9370	0	25	268
9371	0	26	268
9372	0	27	268
9373	99	28	268
9374	0	29	268
9375	0	30	268
9376	0	31	268
9377	6	32	268
9378	0	33	268
9379	0	34	268
9380	0	35	268
9381	0	1	269
9382	0	2	269
9383	0	3	269
9384	0	4	269
9385	0	5	269
9386	77	6	269
9387	0	7	269
9388	0	8	269
9389	0	9	269
9390	0	10	269
9391	0	11	269
9392	41	12	269
9393	0	13	269
9394	0	14	269
9395	0	15	269
9396	0	16	269
9397	0	17	269
9398	0	18	269
9399	0	19	269
9400	0	20	269
9401	0	21	269
9402	0	22	269
9403	0	23	269
9404	0	24	269
9405	0	25	269
9406	0	26	269
9407	0	27	269
9408	0	28	269
9409	71	29	269
9410	0	30	269
9411	0	31	269
9412	0	32	269
9413	0	33	269
9414	0	34	269
9415	0	35	269
9416	0	1	270
9417	6	2	270
9418	0	3	270
9419	0	4	270
9420	68	5	270
9421	0	6	270
9422	0	7	270
9423	56	8	270
9424	8	9	270
9425	99	10	270
9426	76	11	270
9427	0	12	270
9428	50	13	270
9429	30	14	270
9430	9	15	270
9431	0	16	270
9432	0	17	270
9433	0	18	270
9434	0	19	270
9435	4	20	270
9436	0	21	270
9437	0	22	270
9438	0	23	270
9439	0	24	270
9440	0	25	270
9441	0	26	270
9442	0	27	270
9443	0	28	270
9444	0	29	270
9445	0	30	270
9446	0	31	270
9447	0	32	270
9448	23	33	270
9449	0	34	270
9450	0	35	270
9451	0	1	271
9452	72	2	271
9453	35	3	271
9454	44	4	271
9455	0	5	271
9456	64	6	271
9457	0	7	271
9458	0	8	271
9459	98	9	271
9460	0	10	271
9461	0	11	271
9462	0	12	271
9463	0	13	271
9464	0	14	271
9465	0	15	271
9466	58	16	271
9467	0	17	271
9468	0	18	271
9469	0	19	271
9470	0	20	271
9471	0	21	271
9472	0	22	271
9473	83	23	271
9474	0	24	271
9475	0	25	271
9476	0	26	271
9477	0	27	271
9478	0	28	271
9479	0	29	271
9480	0	30	271
9481	52	31	271
9482	0	32	271
9483	0	33	271
9484	91	34	271
9485	67	35	271
9486	12	1	272
9487	0	2	272
9488	33	3	272
9489	0	4	272
9490	100	5	272
9491	0	6	272
9492	6	7	272
9493	0	8	272
9494	0	9	272
9495	0	10	272
9496	0	11	272
9497	73	12	272
9498	62	13	272
9499	39	14	272
9500	0	15	272
9501	0	16	272
9502	0	17	272
9503	0	18	272
9504	0	19	272
9505	0	20	272
9506	41	21	272
9507	0	22	272
9508	72	23	272
9509	0	24	272
9510	0	25	272
9511	0	26	272
9512	0	27	272
9513	0	28	272
9514	0	29	272
9515	44	30	272
9516	0	31	272
9517	0	32	272
9518	0	33	272
9519	0	34	272
9520	65	35	272
9521	0	1	273
9522	0	2	273
9523	0	3	273
9524	0	4	273
9525	0	5	273
9526	0	6	273
9527	78	7	273
9528	26	8	273
9529	0	9	273
9530	0	10	273
9531	0	11	273
9532	0	12	273
9533	0	13	273
9534	7	14	273
9535	0	15	273
9536	0	16	273
9537	19	17	273
9538	0	18	273
9539	0	19	273
9540	40	20	273
9541	22	21	273
9542	0	22	273
9543	22	23	273
9544	84	24	273
9545	0	25	273
9546	0	26	273
9547	0	27	273
9548	0	28	273
9549	0	29	273
9550	35	30	273
9551	0	31	273
9552	0	32	273
9553	0	33	273
9554	0	34	273
9555	18	35	273
9556	0	1	274
9557	0	2	274
9558	0	3	274
9559	0	4	274
9560	0	5	274
9561	0	6	274
9562	0	7	274
9563	49	8	274
9564	0	9	274
9565	0	10	274
9566	90	11	274
9567	0	12	274
9568	0	13	274
9569	12	14	274
9570	0	15	274
9571	0	16	274
9572	26	17	274
9573	0	18	274
9574	0	19	274
9575	86	20	274
9576	0	21	274
9577	0	22	274
9578	0	23	274
9579	0	24	274
9580	0	25	274
9581	0	26	274
9582	0	27	274
9583	98	28	274
9584	0	29	274
9585	0	30	274
9586	0	31	274
9587	0	32	274
9588	47	33	274
9589	0	34	274
9590	0	35	274
9591	0	1	275
9592	0	2	275
9593	0	3	275
9594	0	4	275
9595	0	5	275
9596	27	6	275
9597	0	7	275
9598	0	8	275
9599	0	9	275
9600	72	10	275
9601	0	11	275
9602	22	12	275
9603	0	13	275
9604	0	14	275
9605	90	15	275
9606	0	16	275
9607	0	17	275
9608	0	18	275
9609	0	19	275
9610	0	20	275
9611	71	21	275
9612	0	22	275
9613	0	23	275
9614	0	24	275
9615	0	25	275
9616	0	26	275
9617	0	27	275
9618	0	28	275
9619	0	29	275
9620	0	30	275
9621	6	31	275
9622	0	32	275
9623	23	33	275
9624	0	34	275
9625	0	35	275
9626	74	1	276
9627	0	2	276
9628	0	3	276
9629	99	4	276
9630	10	5	276
9631	0	6	276
9632	20	7	276
9633	59	8	276
9634	0	9	276
9635	0	10	276
9636	45	11	276
9637	81	12	276
9638	0	13	276
9639	92	14	276
9640	0	15	276
9641	0	16	276
9642	0	17	276
9643	46	18	276
9644	0	19	276
9645	0	20	276
9646	64	21	276
9647	0	22	276
9648	0	23	276
9649	12	24	276
9650	0	25	276
9651	92	26	276
9652	0	27	276
9653	0	28	276
9654	39	29	276
9655	0	30	276
9656	0	31	276
9657	79	32	276
9658	0	33	276
9659	0	34	276
9660	0	35	276
9661	0	1	277
9662	0	2	277
9663	89	3	277
9664	0	4	277
9665	0	5	277
9666	0	6	277
9667	37	7	277
9668	0	8	277
9669	0	9	277
9670	0	10	277
9671	0	11	277
9672	50	12	277
9673	0	13	277
9674	0	14	277
9675	0	15	277
9676	0	16	277
9677	0	17	277
9678	0	18	277
9679	0	19	277
9680	0	20	277
9681	54	21	277
9682	0	22	277
9683	0	23	277
9684	0	24	277
9685	0	25	277
9686	0	26	277
9687	0	27	277
9688	13	28	277
9689	0	29	277
9690	0	30	277
9691	0	31	277
9692	0	32	277
9693	0	33	277
9694	0	34	277
9695	0	35	277
9696	0	1	278
9697	0	2	278
9698	0	3	278
9699	66	4	278
9700	0	5	278
9701	0	6	278
9702	0	7	278
9703	0	8	278
9704	0	9	278
9705	0	10	278
9706	0	11	278
9707	0	12	278
9708	61	13	278
9709	41	14	278
9710	0	15	278
9711	0	16	278
9712	0	17	278
9713	0	18	278
9714	76	19	278
9715	0	20	278
9716	0	21	278
9717	69	22	278
9718	0	23	278
9719	0	24	278
9720	0	25	278
9721	0	26	278
9722	0	27	278
9723	0	28	278
9724	0	29	278
9725	0	30	278
9726	0	31	278
9727	0	32	278
9728	27	33	278
9729	0	34	278
9730	0	35	278
9731	0	1	279
9732	0	2	279
9733	66	3	279
9734	0	4	279
9735	0	5	279
9736	0	6	279
9737	0	7	279
9738	0	8	279
9739	0	9	279
9740	0	10	279
9741	0	11	279
9742	0	12	279
9743	0	13	279
9744	0	14	279
9745	0	15	279
9746	0	16	279
9747	0	17	279
9748	0	18	279
9749	83	19	279
9750	0	20	279
9751	0	21	279
9752	22	22	279
9753	0	23	279
9754	0	24	279
9755	0	25	279
9756	0	26	279
9757	0	27	279
9758	0	28	279
9759	0	29	279
9760	73	30	279
9761	0	31	279
9762	0	32	279
9763	0	33	279
9764	0	34	279
9765	0	35	279
9766	0	1	280
9767	29	2	280
9768	0	3	280
9769	0	4	280
9770	0	5	280
9771	0	6	280
9772	0	7	280
9773	80	8	280
9774	0	9	280
9775	50	10	280
9776	0	11	280
9777	0	12	280
9778	0	13	280
9779	0	14	280
9780	0	15	280
9781	0	16	280
9782	80	17	280
9783	0	18	280
9784	77	19	280
9785	0	20	280
9786	0	21	280
9787	0	22	280
9788	0	23	280
9789	0	24	280
9790	0	25	280
9791	0	26	280
9792	0	27	280
9793	39	28	280
9794	51	29	280
9795	0	30	280
9796	0	31	280
9797	0	32	280
9798	94	33	280
9799	0	34	280
9800	89	35	280
9801	0	1	281
9802	0	2	281
9803	0	3	281
9804	0	4	281
9805	17	5	281
9806	0	6	281
9807	88	7	281
9808	0	8	281
9809	0	9	281
9810	0	10	281
9811	0	11	281
9812	18	12	281
9813	0	13	281
9814	0	14	281
9815	0	15	281
9816	0	16	281
9817	0	17	281
9818	0	18	281
9819	0	19	281
9820	0	20	281
9821	73	21	281
9822	30	22	281
9823	0	23	281
9824	0	24	281
9825	0	25	281
9826	0	26	281
9827	0	27	281
9828	0	28	281
9829	0	29	281
9830	0	30	281
9831	0	31	281
9832	0	32	281
9833	0	33	281
9834	0	34	281
9835	36	35	281
9836	0	1	282
9837	0	2	282
9838	0	3	282
9839	0	4	282
9840	0	5	282
9841	0	6	282
9842	63	7	282
9843	0	8	282
9844	0	9	282
9845	0	10	282
9846	0	11	282
9847	0	12	282
9848	0	13	282
9849	0	14	282
9850	66	15	282
9851	0	16	282
9852	0	17	282
9853	0	18	282
9854	0	19	282
9855	0	20	282
9856	0	21	282
9857	0	22	282
9858	0	23	282
9859	70	24	282
9860	0	25	282
9861	0	26	282
9862	0	27	282
9863	0	28	282
9864	0	29	282
9865	0	30	282
9866	0	31	282
9867	0	32	282
9868	0	33	282
9869	0	34	282
9870	0	35	282
9871	0	1	283
9872	0	2	283
9873	0	3	283
9874	0	4	283
9875	0	5	283
9876	92	6	283
9877	0	7	283
9878	0	8	283
9879	43	9	283
9880	91	10	283
9881	83	11	283
9882	0	12	283
9883	0	13	283
9884	0	14	283
9885	0	15	283
9886	0	16	283
9887	0	17	283
9888	83	18	283
9889	0	19	283
9890	0	20	283
9891	0	21	283
9892	0	22	283
9893	19	23	283
9894	0	24	283
9895	0	25	283
9896	0	26	283
9897	60	27	283
9898	33	28	283
9899	0	29	283
9900	0	30	283
9901	0	31	283
9902	67	32	283
9903	16	33	283
9904	0	34	283
9905	0	35	283
9906	0	1	284
9907	12	2	284
9908	0	3	284
9909	63	4	284
9910	0	5	284
9911	0	6	284
9912	34	7	284
9913	0	8	284
9914	0	9	284
9915	16	10	284
9916	0	11	284
9917	0	12	284
9918	0	13	284
9919	0	14	284
9920	0	15	284
9921	0	16	284
9922	0	17	284
9923	97	18	284
9924	0	19	284
9925	0	20	284
9926	0	21	284
9927	0	22	284
9928	0	23	284
9929	70	24	284
9930	0	25	284
9931	0	26	284
9932	66	27	284
9933	0	28	284
9934	0	29	284
9935	0	30	284
9936	0	31	284
9937	0	32	284
9938	0	33	284
9939	0	34	284
9940	0	35	284
9941	0	1	285
9942	69	2	285
9943	43	3	285
9944	31	4	285
9945	44	5	285
9946	0	6	285
9947	0	7	285
9948	8	8	285
9949	0	9	285
9950	0	10	285
9951	0	11	285
9952	0	12	285
9953	20	13	285
9954	0	14	285
9955	0	15	285
9956	0	16	285
9957	0	17	285
9958	0	18	285
9959	0	19	285
9960	0	20	285
9961	0	21	285
9962	0	22	285
9963	0	23	285
9964	0	24	285
9965	0	25	285
9966	0	26	285
9967	0	27	285
9968	0	28	285
9969	0	29	285
9970	0	30	285
9971	0	31	285
9972	0	32	285
9973	42	33	285
9974	0	34	285
9975	0	35	285
9976	0	1	286
9977	0	2	286
9978	42	3	286
9979	0	4	286
9980	0	5	286
9981	0	6	286
9982	0	7	286
9983	0	8	286
9984	3	9	286
9985	69	10	286
9986	0	11	286
9987	42	12	286
9988	0	13	286
9989	0	14	286
9990	0	15	286
9991	76	16	286
9992	0	17	286
9993	0	18	286
9994	94	19	286
9995	0	20	286
9996	0	21	286
9997	0	22	286
9998	0	23	286
9999	0	24	286
10000	0	25	286
10001	0	26	286
10002	0	27	286
10003	8	28	286
10004	29	29	286
10005	0	30	286
10006	0	31	286
10007	96	32	286
10008	0	33	286
10009	0	34	286
10010	0	35	286
10011	0	1	287
10012	0	2	287
10013	0	3	287
10014	0	4	287
10015	12	5	287
10016	0	6	287
10017	0	7	287
10018	0	8	287
10019	0	9	287
10020	0	10	287
10021	0	11	287
10022	0	12	287
10023	0	13	287
10024	98	14	287
10025	0	15	287
10026	0	16	287
10027	0	17	287
10028	0	18	287
10029	0	19	287
10030	0	20	287
10031	0	21	287
10032	0	22	287
10033	0	23	287
10034	0	24	287
10035	62	25	287
10036	31	26	287
10037	0	27	287
10038	0	28	287
10039	0	29	287
10040	0	30	287
10041	0	31	287
10042	24	32	287
10043	0	33	287
10044	76	34	287
10045	0	35	287
10046	0	1	288
10047	61	2	288
10048	0	3	288
10049	0	4	288
10050	0	5	288
10051	0	6	288
10052	0	7	288
10053	0	8	288
10054	0	9	288
10055	0	10	288
10056	0	11	288
10057	0	12	288
10058	0	13	288
10059	0	14	288
10060	0	15	288
10061	0	16	288
10062	0	17	288
10063	0	18	288
10064	0	19	288
10065	0	20	288
10066	0	21	288
10067	0	22	288
10068	28	23	288
10069	0	24	288
10070	0	25	288
10071	39	26	288
10072	0	27	288
10073	0	28	288
10074	0	29	288
10075	0	30	288
10076	0	31	288
10077	0	32	288
10078	0	33	288
10079	81	34	288
10080	0	35	288
10081	59	1	289
10082	0	2	289
10083	0	3	289
10084	0	4	289
10085	0	5	289
10086	0	6	289
10087	0	7	289
10088	0	8	289
10089	0	9	289
10090	0	10	289
10091	50	11	289
10092	92	12	289
10093	75	13	289
10094	0	14	289
10095	67	15	289
10096	0	16	289
10097	0	17	289
10098	0	18	289
10099	100	19	289
10100	0	20	289
10101	0	21	289
10102	0	22	289
10103	0	23	289
10104	0	24	289
10105	0	25	289
10106	25	26	289
10107	0	27	289
10108	94	28	289
10109	0	29	289
10110	6	30	289
10111	0	31	289
10112	0	32	289
10113	0	33	289
10114	0	34	289
10115	0	35	289
10116	0	1	290
10117	0	2	290
10118	0	3	290
10119	0	4	290
10120	0	5	290
10121	0	6	290
10122	0	7	290
10123	50	8	290
10124	0	9	290
10125	0	10	290
10126	0	11	290
10127	0	12	290
10128	31	13	290
10129	0	14	290
10130	0	15	290
10131	0	16	290
10132	0	17	290
10133	0	18	290
10134	0	19	290
10135	21	20	290
10136	0	21	290
10137	0	22	290
10138	0	23	290
10139	0	24	290
10140	0	25	290
10141	0	26	290
10142	0	27	290
10143	84	28	290
10144	0	29	290
10145	0	30	290
10146	84	31	290
10147	0	32	290
10148	23	33	290
10149	0	34	290
10150	0	35	290
10151	0	1	291
10152	0	2	291
10153	0	3	291
10154	0	4	291
10155	0	5	291
10156	0	6	291
10157	81	7	291
10158	0	8	291
10159	0	9	291
10160	0	10	291
10161	66	11	291
10162	0	12	291
10163	0	13	291
10164	0	14	291
10165	67	15	291
10166	0	16	291
10167	0	17	291
10168	0	18	291
10169	0	19	291
10170	0	20	291
10171	0	21	291
10172	0	22	291
10173	0	23	291
10174	0	24	291
10175	63	25	291
10176	0	26	291
10177	0	27	291
10178	0	28	291
10179	0	29	291
10180	0	30	291
10181	0	31	291
10182	0	32	291
10183	62	33	291
10184	0	34	291
10185	0	35	291
10186	0	1	292
10187	0	2	292
10188	0	3	292
10189	0	4	292
10190	74	5	292
10191	0	6	292
10192	68	7	292
10193	0	8	292
10194	0	9	292
10195	41	10	292
10196	0	11	292
10197	0	12	292
10198	0	13	292
10199	0	14	292
10200	48	15	292
10201	0	16	292
10202	32	17	292
10203	99	18	292
10204	0	19	292
10205	0	20	292
10206	0	21	292
10207	0	22	292
10208	0	23	292
10209	0	24	292
10210	0	25	292
10211	0	26	292
10212	0	27	292
10213	0	28	292
10214	0	29	292
10215	67	30	292
10216	0	31	292
10217	0	32	292
10218	0	33	292
10219	0	34	292
10220	0	35	292
10221	0	1	293
10222	34	2	293
10223	0	3	293
10224	0	4	293
10225	0	5	293
10226	0	6	293
10227	0	7	293
10228	0	8	293
10229	0	9	293
10230	21	10	293
10231	0	11	293
10232	0	12	293
10233	0	13	293
10234	0	14	293
10235	0	15	293
10236	0	16	293
10237	0	17	293
10238	0	18	293
10239	0	19	293
10240	0	20	293
10241	0	21	293
10242	0	22	293
10243	45	23	293
10244	0	24	293
10245	0	25	293
10246	0	26	293
10247	0	27	293
10248	0	28	293
10249	0	29	293
10250	0	30	293
10251	0	31	293
10252	0	32	293
10253	0	33	293
10254	0	34	293
10255	0	35	293
10256	97	1	294
10257	0	2	294
10258	0	3	294
10259	0	4	294
10260	0	5	294
10261	0	6	294
10262	92	7	294
10263	0	8	294
10264	0	9	294
10265	0	10	294
10266	0	11	294
10267	0	12	294
10268	10	13	294
10269	0	14	294
10270	0	15	294
10271	58	16	294
10272	0	17	294
10273	0	18	294
10274	0	19	294
10275	0	20	294
10276	0	21	294
10277	0	22	294
10278	0	23	294
10279	0	24	294
10280	0	25	294
10281	0	26	294
10282	0	27	294
10283	0	28	294
10284	0	29	294
10285	0	30	294
10286	0	31	294
10287	0	32	294
10288	0	33	294
10289	59	34	294
10290	0	35	294
10291	0	1	295
10292	0	2	295
10293	37	3	295
10294	0	4	295
10295	0	5	295
10296	0	6	295
10297	6	7	295
10298	0	8	295
10299	0	9	295
10300	0	10	295
10301	0	11	295
10302	0	12	295
10303	0	13	295
10304	0	14	295
10305	0	15	295
10306	0	16	295
10307	0	17	295
10308	93	18	295
10309	100	19	295
10310	36	20	295
10311	0	21	295
10312	40	22	295
10313	0	23	295
10314	64	24	295
10315	46	25	295
10316	0	26	295
10317	0	27	295
10318	99	28	295
10319	55	29	295
10320	0	30	295
10321	0	31	295
10322	0	32	295
10323	0	33	295
10324	0	34	295
10325	0	35	295
10326	0	1	296
10327	0	2	296
10328	0	3	296
10329	0	4	296
10330	0	5	296
10331	0	6	296
10332	0	7	296
10333	0	8	296
10334	0	9	296
10335	36	10	296
10336	0	11	296
10337	0	12	296
10338	0	13	296
10339	0	14	296
10340	0	15	296
10341	0	16	296
10342	0	17	296
10343	44	18	296
10344	14	19	296
10345	0	20	296
10346	0	21	296
10347	0	22	296
10348	14	23	296
10349	0	24	296
10350	0	25	296
10351	42	26	296
10352	0	27	296
10353	0	28	296
10354	0	29	296
10355	0	30	296
10356	0	31	296
10357	0	32	296
10358	0	33	296
10359	0	34	296
10360	0	35	296
10361	0	1	297
10362	0	2	297
10363	0	3	297
10364	0	4	297
10365	0	5	297
10366	0	6	297
10367	8	7	297
10368	0	8	297
10369	0	9	297
10370	0	10	297
10371	0	11	297
10372	0	12	297
10373	0	13	297
10374	1	14	297
10375	0	15	297
10376	0	16	297
10377	0	17	297
10378	0	18	297
10379	0	19	297
10380	0	20	297
10381	0	21	297
10382	0	22	297
10383	0	23	297
10384	0	24	297
10385	0	25	297
10386	0	26	297
10387	0	27	297
10388	35	28	297
10389	0	29	297
10390	90	30	297
10391	41	31	297
10392	0	32	297
10393	0	33	297
10394	0	34	297
10395	0	35	297
10396	0	1	298
10397	0	2	298
10398	0	3	298
10399	0	4	298
10400	48	5	298
10401	25	6	298
10402	53	7	298
10403	0	8	298
10404	0	9	298
10405	0	10	298
10406	0	11	298
10407	99	12	298
10408	0	13	298
10409	0	14	298
10410	0	15	298
10411	0	16	298
10412	0	17	298
10413	48	18	298
10414	0	19	298
10415	0	20	298
10416	0	21	298
10417	0	22	298
10418	0	23	298
10419	0	24	298
10420	0	25	298
10421	0	26	298
10422	0	27	298
10423	0	28	298
10424	0	29	298
10425	0	30	298
10426	12	31	298
10427	0	32	298
10428	0	33	298
10429	0	34	298
10430	0	35	298
10431	0	1	299
10432	0	2	299
10433	0	3	299
10434	0	4	299
10435	8	5	299
10436	61	6	299
10437	0	7	299
10438	83	8	299
10439	1	9	299
10440	0	10	299
10441	75	11	299
10442	0	12	299
10443	0	13	299
10444	0	14	299
10445	0	15	299
10446	0	16	299
10447	0	17	299
10448	0	18	299
10449	0	19	299
10450	0	20	299
10451	0	21	299
10452	0	22	299
10453	0	23	299
10454	88	24	299
10455	0	25	299
10456	0	26	299
10457	0	27	299
10458	0	28	299
10459	0	29	299
10460	0	30	299
10461	0	31	299
10462	0	32	299
10463	0	33	299
10464	40	34	299
10465	55	35	299
10466	0	1	300
10467	0	2	300
10468	0	3	300
10469	35	4	300
10470	0	5	300
10471	77	6	300
10472	0	7	300
10473	62	8	300
10474	10	9	300
10475	72	10	300
10476	17	11	300
10477	99	12	300
10478	0	13	300
10479	0	14	300
10480	0	15	300
10481	35	16	300
10482	0	17	300
10483	0	18	300
10484	0	19	300
10485	0	20	300
10486	0	21	300
10487	0	22	300
10488	0	23	300
10489	86	24	300
10490	0	25	300
10491	0	26	300
10492	0	27	300
10493	0	28	300
10494	0	29	300
10495	78	30	300
10496	0	31	300
10497	71	32	300
10498	0	33	300
10499	0	34	300
10500	0	35	300
10501	0	1	301
10502	0	2	301
10503	0	3	301
10504	0	4	301
10505	0	5	301
10506	0	6	301
10507	0	7	301
10508	0	8	301
10509	0	9	301
10510	0	10	301
10511	0	11	301
10512	0	12	301
10513	0	13	301
10514	0	14	301
10515	0	15	301
10516	0	16	301
10517	0	17	301
10518	0	18	301
10519	0	19	301
10520	0	20	301
10521	0	21	301
10522	0	22	301
10523	0	23	301
10524	0	24	301
10525	0	25	301
10526	0	26	301
10527	0	27	301
10528	0	28	301
10529	0	29	301
10530	0	30	301
10531	0	31	301
10532	0	32	301
10533	0	33	301
10534	0	34	301
10535	0	35	301
\.


--
-- Data for Name: user_student; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_student (user_id, netid, email, "firstName", "lastName", standing) FROM stdin;
1	Beck	Beck@illinois.edu	Marquis	Beck	Undergrad
2	Brady	Brady@illinois.edu	Chace	Brady	Undergrad
3	Avery	Avery@illinois.edu	Tobias	Avery	Undergrad
4	Fitzpatrick	Fitzpatrick@illinois.edu	Kane	Fitzpatrick	Undergrad
5	Gibbs	Gibbs@illinois.edu	Bronson	Gibbs	Undergrad
6	White	White@illinois.edu	Calvin	White	Undergrad
7	Becker	Becker@illinois.edu	Luke	Becker	Undergrad
8	Watson	Watson@illinois.edu	Jaden	Watson	Undergrad
9	Villarreal	Villarreal@illinois.edu	Alfred	Villarreal	Undergrad
10	Beard	Beard@illinois.edu	Kylan	Beard	Undergrad
11	Mckinney	Mckinney@illinois.edu	Greyson	Mckinney	Undergrad
12	Russell	Russell@illinois.edu	Leland	Russell	Undergrad
13	Dawson	Dawson@illinois.edu	Justin	Dawson	Undergrad
14	Hayes	Hayes@illinois.edu	Avery	Hayes	Undergrad
15	Herring	Herring@illinois.edu	Kristopher	Herring	Undergrad
16	Riggs	Riggs@illinois.edu	Jacob	Riggs	Undergrad
17	Ali	Ali@illinois.edu	Deshawn	Ali	Undergrad
18	Sullivan	Sullivan@illinois.edu	Abel	Sullivan	Undergrad
19	Strong	Strong@illinois.edu	Johnny	Strong	Undergrad
20	Merritt	Merritt@illinois.edu	Zander	Merritt	Undergrad
21	Ferrell	Ferrell@illinois.edu	Jayvion	Ferrell	Undergrad
22	Glass	Glass@illinois.edu	Maverick	Glass	Undergrad
23	Holder	Holder@illinois.edu	Lewis	Holder	Undergrad
24	Peters	Peters@illinois.edu	Tyrone	Peters	Undergrad
25	Dudley	Dudley@illinois.edu	Lawson	Dudley	Undergrad
26	Mclean	Mclean@illinois.edu	Steven	Mclean	Undergrad
27	Gonzalez	Gonzalez@illinois.edu	Jaquan	Gonzalez	Undergrad
28	Alexander	Alexander@illinois.edu	Louis	Alexander	Undergrad
29	Townsend	Townsend@illinois.edu	Dereon	Townsend	Undergrad
30	Moody	Moody@illinois.edu	Rory	Moody	Undergrad
31	Levy	Levy@illinois.edu	Kadin	Levy	Undergrad
32	Medina	Medina@illinois.edu	Zachariah	Medina	Undergrad
33	Bonilla	Bonilla@illinois.edu	Ayaan	Bonilla	Undergrad
34	Potts	Potts@illinois.edu	Clinton	Potts	Undergrad
35	Ramirez	Ramirez@illinois.edu	Atticus	Ramirez	Undergrad
36	Hancock	Hancock@illinois.edu	Dante	Hancock	Undergrad
37	Reed	Reed@illinois.edu	Darrell	Reed	Undergrad
38	Woods	Woods@illinois.edu	Jamal	Woods	Undergrad
39	Ellison	Ellison@illinois.edu	Rodrigo	Ellison	Undergrad
40	Mccoy	Mccoy@illinois.edu	Julius	Mccoy	Undergrad
41	Patrick	Patrick@illinois.edu	Ramiro	Patrick	Undergrad
42	Johns	Johns@illinois.edu	Maxwell	Johns	Undergrad
43	Stewart	Stewart@illinois.edu	Nathan	Stewart	Undergrad
44	Brown	Brown@illinois.edu	Isiah	Brown	Undergrad
45	Luna	Luna@illinois.edu	Aiden	Luna	Undergrad
46	Short	Short@illinois.edu	Cyrus	Short	Undergrad
47	Walter	Walter@illinois.edu	Kason	Walter	Undergrad
48	Roy	Roy@illinois.edu	Isaac	Roy	Undergrad
49	Sharp	Sharp@illinois.edu	Ari	Sharp	Undergrad
50	Campbell	Campbell@illinois.edu	Tony	Campbell	Undergrad
51	Cameron	Cameron@illinois.edu	Dax	Cameron	Undergrad
52	Cochran	Cochran@illinois.edu	Jude	Cochran	Undergrad
53	Preston	Preston@illinois.edu	Silas	Preston	Undergrad
54	Rosales	Rosales@illinois.edu	Tyson	Rosales	Undergrad
55	Glenn	Glenn@illinois.edu	Seth	Glenn	Undergrad
56	Lynch	Lynch@illinois.edu	Rodney	Lynch	Undergrad
57	Cox	Cox@illinois.edu	Sonny	Cox	Undergrad
58	Stanton	Stanton@illinois.edu	Trace	Stanton	Undergrad
59	Cobb	Cobb@illinois.edu	Jordan	Cobb	Undergrad
60	Bean	Bean@illinois.edu	Harry	Bean	Undergrad
61	Fry	Fry@illinois.edu	Tyree	Fry	Undergrad
62	Larsen	Larsen@illinois.edu	Drake	Larsen	Undergrad
63	Santiago	Santiago@illinois.edu	Steve	Santiago	Undergrad
64	Small	Small@illinois.edu	Hugh	Small	Undergrad
65	Russo	Russo@illinois.edu	Alijah	Russo	Undergrad
66	Diaz	Diaz@illinois.edu	Brodie	Diaz	Undergrad
67	Norman	Norman@illinois.edu	Nico	Norman	Undergrad
68	Webb	Webb@illinois.edu	Damari	Webb	Undergrad
69	Jennings	Jennings@illinois.edu	Dillan	Jennings	Undergrad
70	Rasmussen	Rasmussen@illinois.edu	Santiago	Rasmussen	Undergrad
71	Fischer	Fischer@illinois.edu	Brooks	Fischer	Undergrad
72	Ryan	Ryan@illinois.edu	Nathaniel	Ryan	Undergrad
73	Conley	Conley@illinois.edu	Brody	Conley	Undergrad
74	Allison	Allison@illinois.edu	Conner	Allison	Undergrad
75	Hale	Hale@illinois.edu	Terrell	Hale	Undergrad
76	Serrano	Serrano@illinois.edu	Mike	Serrano	Undergrad
77	Ballard	Ballard@illinois.edu	Korbin	Ballard	Undergrad
78	Clayton	Clayton@illinois.edu	Peter	Clayton	Undergrad
79	Coffey	Coffey@illinois.edu	Jaxon	Coffey	Undergrad
80	Fitzgerald	Fitzgerald@illinois.edu	Carter	Fitzgerald	Undergrad
81	Norris	Norris@illinois.edu	Layton	Norris	Undergrad
82	Mosley	Mosley@illinois.edu	Brenden	Mosley	Undergrad
83	Choi	Choi@illinois.edu	Dean	Choi	Undergrad
84	Carroll	Carroll@illinois.edu	Rayan	Carroll	Undergrad
85	Gentry	Gentry@illinois.edu	Francisco	Gentry	Undergrad
86	Hull	Hull@illinois.edu	Yandel	Hull	Undergrad
87	Andersen	Andersen@illinois.edu	Jacoby	Andersen	Undergrad
88	Shea	Shea@illinois.edu	Aydin	Shea	Undergrad
89	Bennett	Bennett@illinois.edu	Mohammad	Bennett	Undergrad
90	Velasquez	Velasquez@illinois.edu	Vicente	Velasquez	Undergrad
91	Clements	Clements@illinois.edu	Martin	Clements	Undergrad
92	Hooper	Hooper@illinois.edu	Callum	Hooper	Undergrad
93	Schultz	Schultz@illinois.edu	Landyn	Schultz	Undergrad
94	Stein	Stein@illinois.edu	Ruben	Stein	Undergrad
95	Lester	Lester@illinois.edu	Skyler	Lester	Undergrad
96	Wolfe	Wolfe@illinois.edu	Tomas	Wolfe	Undergrad
97	Harmon	Harmon@illinois.edu	Jaxson	Harmon	Undergrad
98	Lara	Lara@illinois.edu	Nickolas	Lara	Undergrad
99	Moon	Moon@illinois.edu	Jessie	Moon	Undergrad
100	Powers	Powers@illinois.edu	Paul	Powers	Undergrad
101	Barrett	Barrett@illinois.edu	Elvis	Barrett	Undergrad
102	Grimes	Grimes@illinois.edu	Uriel	Grimes	Undergrad
103	Rogers	Rogers@illinois.edu	Jean	Rogers	Undergrad
104	Kaiser	Kaiser@illinois.edu	Chaz	Kaiser	Undergrad
105	Stephenson	Stephenson@illinois.edu	Sterling	Stephenson	Undergrad
106	Mccarty	Mccarty@illinois.edu	Roland	Mccarty	Undergrad
107	Raymond	Raymond@illinois.edu	Tyrese	Raymond	Undergrad
108	Bentley	Bentley@illinois.edu	Beau	Bentley	Undergrad
109	Crawford	Crawford@illinois.edu	Maddox	Crawford	Undergrad
110	Richmond	Richmond@illinois.edu	Koen	Richmond	Undergrad
111	Gaines	Gaines@illinois.edu	Henry	Gaines	Undergrad
112	Hess	Hess@illinois.edu	Aden	Hess	Undergrad
113	Murray	Murray@illinois.edu	Asher	Murray	Undergrad
114	Foster	Foster@illinois.edu	Colin	Foster	Undergrad
115	Andrews	Andrews@illinois.edu	Richard	Andrews	Undergrad
116	Davila	Davila@illinois.edu	Ernest	Davila	Undergrad
117	Conner	Conner@illinois.edu	Romeo	Conner	Undergrad
118	Le	Le@illinois.edu	Jace	Le	Undergrad
119	Warren	Warren@illinois.edu	Mohamed	Warren	Undergrad
120	Fuller	Fuller@illinois.edu	Cody	Fuller	Undergrad
121	Bush	Bush@illinois.edu	Simeon	Bush	Undergrad
122	Blevins	Blevins@illinois.edu	Blake	Blevins	Undergrad
123	Sutton	Sutton@illinois.edu	Jovanny	Sutton	Undergrad
124	Nelson	Nelson@illinois.edu	Vance	Nelson	Undergrad
125	Everett	Everett@illinois.edu	Johan	Everett	Undergrad
126	Walters	Walters@illinois.edu	Keegan	Walters	Undergrad
127	Skinner	Skinner@illinois.edu	Demetrius	Skinner	Undergrad
128	Jacobs	Jacobs@illinois.edu	Troy	Jacobs	Undergrad
129	Malone	Malone@illinois.edu	Mitchell	Malone	Undergrad
130	Pitts	Pitts@illinois.edu	Wade	Pitts	Undergrad
131	Long	Long@illinois.edu	Immanuel	Long	Undergrad
132	Finley	Finley@illinois.edu	Braxton	Finley	Undergrad
133	Krause	Krause@illinois.edu	Dangelo	Krause	Undergrad
134	Shepard	Shepard@illinois.edu	London	Shepard	Undergrad
135	Bowman	Bowman@illinois.edu	Peyton	Bowman	Undergrad
136	Neal	Neal@illinois.edu	Darryl	Neal	Undergrad
137	Grant	Grant@illinois.edu	Terry	Grant	Undergrad
138	George	George@illinois.edu	Tripp	George	Undergrad
139	Harrell	Harrell@illinois.edu	Shane	Harrell	Undergrad
140	Weiss	Weiss@illinois.edu	Bruce	Weiss	Undergrad
141	Bird	Bird@illinois.edu	Lee	Bird	Undergrad
142	Gardner	Gardner@illinois.edu	Graham	Gardner	Undergrad
143	Hendricks	Hendricks@illinois.edu	Ayden	Hendricks	Undergrad
144	Montoya	Montoya@illinois.edu	Asa	Montoya	Undergrad
145	Yang	Yang@illinois.edu	Jadon	Yang	Undergrad
146	Sexton	Sexton@illinois.edu	Marshall	Sexton	Undergrad
147	Shaw	Shaw@illinois.edu	Tommy	Shaw	Undergrad
148	Bass	Bass@illinois.edu	Zackary	Bass	Undergrad
149	Delacruz	Delacruz@illinois.edu	Ezra	Delacruz	Undergrad
150	Tran	Tran@illinois.edu	Devin	Tran	Undergrad
151	Melendez	Melendez@illinois.edu	Ryann	Melendez	Undergrad
152	Rivers	Rivers@illinois.edu	Leilani	Rivers	Undergrad
153	Brooks	Brooks@illinois.edu	Ruth	Brooks	Undergrad
154	Ochoa	Ochoa@illinois.edu	Jaylen	Ochoa	Undergrad
155	Shepherd	Shepherd@illinois.edu	Piper	Shepherd	Undergrad
156	Gregory	Gregory@illinois.edu	Violet	Gregory	Undergrad
157	Jones	Jones@illinois.edu	Macie	Jones	Undergrad
158	Hurst	Hurst@illinois.edu	Haley	Hurst	Undergrad
159	Boyd	Boyd@illinois.edu	Jazlynn	Boyd	Undergrad
160	Solis	Solis@illinois.edu	Carlee	Solis	Undergrad
161	Matthews	Matthews@illinois.edu	Andrea	Matthews	Undergrad
162	Cordova	Cordova@illinois.edu	Saniyah	Cordova	Undergrad
163	James	James@illinois.edu	Sophie	James	Undergrad
164	Mckee	Mckee@illinois.edu	Caitlin	Mckee	Undergrad
165	Reilly	Reilly@illinois.edu	Daisy	Reilly	Undergrad
166	Reese	Reese@illinois.edu	Kara	Reese	Undergrad
167	Abbott	Abbott@illinois.edu	Salma	Abbott	Undergrad
168	Huff	Huff@illinois.edu	Addison	Huff	Undergrad
169	Manning	Manning@illinois.edu	Taliyah	Manning	Undergrad
170	Patton	Patton@illinois.edu	Laci	Patton	Undergrad
171	Nicholson	Nicholson@illinois.edu	Jacquelyn	Nicholson	Undergrad
172	Kelley	Kelley@illinois.edu	Brittany	Kelley	Undergrad
173	Figueroa	Figueroa@illinois.edu	Alicia	Figueroa	Undergrad
174	Thompson	Thompson@illinois.edu	Scarlett	Thompson	Undergrad
175	Guerrero	Guerrero@illinois.edu	Julia	Guerrero	Undergrad
176	Thornton	Thornton@illinois.edu	Mylie	Thornton	Undergrad
177	Frazier	Frazier@illinois.edu	Abril	Frazier	Undergrad
178	Dougherty	Dougherty@illinois.edu	Cassidy	Dougherty	Undergrad
179	Monroe	Monroe@illinois.edu	Alivia	Monroe	Undergrad
180	Welch	Welch@illinois.edu	Maya	Welch	Undergrad
181	Montgomery	Montgomery@illinois.edu	Marisol	Montgomery	Undergrad
182	Brandt	Brandt@illinois.edu	Kiley	Brandt	Undergrad
183	Vaughn	Vaughn@illinois.edu	Mollie	Vaughn	Undergrad
184	Cowan	Cowan@illinois.edu	Bria	Cowan	Undergrad
185	Potter	Potter@illinois.edu	Allyson	Potter	Undergrad
186	Callahan	Callahan@illinois.edu	Yasmine	Callahan	Undergrad
187	Irwin	Irwin@illinois.edu	Lauren	Irwin	Undergrad
188	Dodson	Dodson@illinois.edu	Mercedes	Dodson	Undergrad
189	Carson	Carson@illinois.edu	Litzy	Carson	Undergrad
190	Mason	Mason@illinois.edu	Anabella	Mason	Undergrad
191	Murillo	Murillo@illinois.edu	Kaelyn	Murillo	Undergrad
192	Burch	Burch@illinois.edu	Mary	Burch	Undergrad
193	Donaldson	Donaldson@illinois.edu	Lizbeth	Donaldson	Undergrad
194	Henderson	Henderson@illinois.edu	Brooke	Henderson	Undergrad
195	Wall	Wall@illinois.edu	Jayla	Wall	Undergrad
196	Tyler	Tyler@illinois.edu	Ada	Tyler	Undergrad
197	Kemp	Kemp@illinois.edu	Dayami	Kemp	Undergrad
198	Dennis	Dennis@illinois.edu	Carly	Dennis	Undergrad
199	Krueger	Krueger@illinois.edu	Jasmin	Krueger	Undergrad
200	Baldwin	Baldwin@illinois.edu	Skylar	Baldwin	Undergrad
201	Arroyo	Arroyo@illinois.edu	Kiara	Arroyo	Undergrad
202	Jensen	Jensen@illinois.edu	Bailee	Jensen	Undergrad
203	Austin	Austin@illinois.edu	Olive	Austin	Undergrad
204	Lin	Lin@illinois.edu	Annabelle	Lin	Undergrad
205	Holland	Holland@illinois.edu	Annika	Holland	Undergrad
206	Roach	Roach@illinois.edu	Ayana	Roach	Undergrad
207	Terry	Terry@illinois.edu	Virginia	Terry	Undergrad
208	Rosario	Rosario@illinois.edu	Madilynn	Rosario	Undergrad
209	Khan	Khan@illinois.edu	Reyna	Khan	Undergrad
210	Hawkins	Hawkins@illinois.edu	Claudia	Hawkins	Undergrad
211	Boyle	Boyle@illinois.edu	Layla	Boyle	Undergrad
212	Oneal	Oneal@illinois.edu	Kaley	Oneal	Undergrad
213	Morris	Morris@illinois.edu	Joslyn	Morris	Undergrad
214	Summers	Summers@illinois.edu	Kamora	Summers	Undergrad
215	Dominguez	Dominguez@illinois.edu	Luciana	Dominguez	Undergrad
216	Ross	Ross@illinois.edu	Brooklynn	Ross	Undergrad
217	Howe	Howe@illinois.edu	Roselyn	Howe	Undergrad
218	Mann	Mann@illinois.edu	Ariana	Mann	Undergrad
219	Powell	Powell@illinois.edu	Avery	Powell	Undergrad
220	Vaughan	Vaughan@illinois.edu	Bridget	Vaughan	Undergrad
221	Best	Best@illinois.edu	Jayda	Best	Undergrad
222	Cooley	Cooley@illinois.edu	Isabelle	Cooley	Undergrad
223	Rice	Rice@illinois.edu	Jasmine	Rice	Undergrad
224	Goodman	Goodman@illinois.edu	Nia	Goodman	Undergrad
225	Velez	Velez@illinois.edu	Genesis	Velez	Undergrad
226	Gates	Gates@illinois.edu	Amber	Gates	Undergrad
227	Madden	Madden@illinois.edu	Maritza	Madden	Undergrad
228	Haynes	Haynes@illinois.edu	Jazlene	Haynes	Undergrad
229	Sanders	Sanders@illinois.edu	Kiera	Sanders	Undergrad
230	Dixon	Dixon@illinois.edu	Kaylah	Dixon	Undergrad
231	Briggs	Briggs@illinois.edu	Itzel	Briggs	Undergrad
232	Wilkerson	Wilkerson@illinois.edu	Charity	Wilkerson	Undergrad
233	Brock	Brock@illinois.edu	Monserrat	Brock	Undergrad
234	Key	Key@illinois.edu	Dayana	Key	Undergrad
235	Barron	Barron@illinois.edu	Gabrielle	Barron	Undergrad
236	Whitaker	Whitaker@illinois.edu	Lena	Whitaker	Undergrad
237	Harrison	Harrison@illinois.edu	Helen	Harrison	Undergrad
238	Carpenter	Carpenter@illinois.edu	Damaris	Carpenter	Undergrad
239	Espinoza	Espinoza@illinois.edu	Lacey	Espinoza	Undergrad
240	Fernandez	Fernandez@illinois.edu	Daniella	Fernandez	Undergrad
241	Vargas	Vargas@illinois.edu	Giovanna	Vargas	Undergrad
242	Perez	Perez@illinois.edu	Ann	Perez	Undergrad
243	Lawson	Lawson@illinois.edu	Marissa	Lawson	Undergrad
244	David	David@illinois.edu	Camryn	David	Undergrad
245	Williamson	Williamson@illinois.edu	Jimena	Williamson	Undergrad
246	Blankenship	Blankenship@illinois.edu	Areli	Blankenship	Undergrad
247	Burnett	Burnett@illinois.edu	Mckayla	Burnett	Undergrad
248	Gill	Gill@illinois.edu	Mattie	Gill	Undergrad
249	Marsh	Marsh@illinois.edu	Paityn	Marsh	Undergrad
250	Wolf	Wolf@illinois.edu	Alana	Wolf	Undergrad
251	Massey	Massey@illinois.edu	Kaylen	Massey	Undergrad
252	Horne	Horne@illinois.edu	Jillian	Horne	Undergrad
253	Kelly	Kelly@illinois.edu	Patience	Kelly	Undergrad
254	Oconnell	Oconnell@illinois.edu	Taniyah	Oconnell	Undergrad
255	Lane	Lane@illinois.edu	Annabel	Lane	Undergrad
256	Villa	Villa@illinois.edu	Kamari	Villa	Undergrad
257	Schneider	Schneider@illinois.edu	Rubi	Schneider	Undergrad
258	Watts	Watts@illinois.edu	Kaleigh	Watts	Undergrad
259	Duffy	Duffy@illinois.edu	Evelyn	Duffy	Undergrad
260	Joyce	Joyce@illinois.edu	Milagros	Joyce	Undergrad
261	Gilmore	Gilmore@illinois.edu	Janiyah	Gilmore	Undergrad
262	Ruiz	Ruiz@illinois.edu	Yadira	Ruiz	Undergrad
263	Ibarra	Ibarra@illinois.edu	Jaslyn	Ibarra	Undergrad
264	Wagner	Wagner@illinois.edu	Taylor	Wagner	Undergrad
265	Calderon	Calderon@illinois.edu	Hallie	Calderon	Undergrad
266	Galvan	Galvan@illinois.edu	Daphne	Galvan	Undergrad
267	Barton	Barton@illinois.edu	Sanai	Barton	Undergrad
268	Hahn	Hahn@illinois.edu	Jane	Hahn	Undergrad
269	Kramer	Kramer@illinois.edu	Annabella	Kramer	Undergrad
270	Peterson	Peterson@illinois.edu	Tessa	Peterson	Undergrad
271	Sellers	Sellers@illinois.edu	Margaret	Sellers	Undergrad
272	Carey	Carey@illinois.edu	Mya	Carey	Undergrad
273	Ponce	Ponce@illinois.edu	Shyla	Ponce	Undergrad
274	Waters	Waters@illinois.edu	Kelly	Waters	Undergrad
275	Gamble	Gamble@illinois.edu	Lia	Gamble	Undergrad
276	Higgins	Higgins@illinois.edu	Kaila	Higgins	Undergrad
277	Spears	Spears@illinois.edu	Alexa	Spears	Undergrad
278	Zimmerman	Zimmerman@illinois.edu	Christine	Zimmerman	Undergrad
279	Hoffman	Hoffman@illinois.edu	Nancy	Hoffman	Undergrad
280	Bridges	Bridges@illinois.edu	Leila	Bridges	Undergrad
281	Trujillo	Trujillo@illinois.edu	Lana	Trujillo	Undergrad
282	Holden	Holden@illinois.edu	Cierra	Holden	Undergrad
283	Friedman	Friedman@illinois.edu	Miracle	Friedman	Undergrad
284	Sanford	Sanford@illinois.edu	Charlee	Sanford	Undergrad
285	Murphy	Murphy@illinois.edu	Valeria	Murphy	Undergrad
286	Orozco	Orozco@illinois.edu	Reina	Orozco	Undergrad
287	Kidd	Kidd@illinois.edu	Lilyana	Kidd	Undergrad
288	Green	Green@illinois.edu	Annalise	Green	Undergrad
289	Stanley	Stanley@illinois.edu	Madilyn	Stanley	Undergrad
290	Conrad	Conrad@illinois.edu	Hayden	Conrad	Undergrad
291	Mccann	Mccann@illinois.edu	Kaylie	Mccann	Undergrad
292	Knight	Knight@illinois.edu	Laylah	Knight	Undergrad
293	Wong	Wong@illinois.edu	Tia	Wong	Undergrad
294	Cisneros	Cisneros@illinois.edu	Natalie	Cisneros	Undergrad
295	Miller	Miller@illinois.edu	Courtney	Miller	Undergrad
296	Mcintosh	Mcintosh@illinois.edu	Isabela	Mcintosh	Undergrad
297	Archer	Archer@illinois.edu	Kaya	Archer	Undergrad
298	Rios	Rios@illinois.edu	Jakayla	Rios	Undergrad
299	Walls	Walls@illinois.edu	Livia	Walls	Undergrad
300	Hodges	Hodges@illinois.edu	Evie	Hodges	Undergrad
301	char	char@gmail.com	Charlene	Zheng	\N
\.


--
-- Data for Name: user_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, is_student, is_instructor) FROM stdin;
1	pbkdf2_sha256$150000$gzHUAGJuUc0V$3elQjhybg6gKsLqiryXIKwM1GHZY7GTXMnV5/6uuyH0=	\N	f	Beck	Beck	Marquis	Beck@illinois.edu	f	t	2019-07-30 18:30:11.098158-05	t	f
2	pbkdf2_sha256$150000$ryenwyOFGKpz$9kdDVAjKoudPRSbcMKCEINe9i6yF8g4ODd+m/STPGG4=	\N	f	Brady	Brady	Chace	Brady@illinois.edu	f	t	2019-07-30 18:30:11.227493-05	t	f
3	pbkdf2_sha256$150000$oFO2iJHtehww$aIGDsYKQmnVh3dbYH3vjPQwmJvjSPRitSc9qeNoayXI=	\N	f	Avery	Avery	Tobias	Avery@illinois.edu	f	t	2019-07-30 18:30:11.29911-05	t	f
4	pbkdf2_sha256$150000$9GsBy4vJuY6F$5V9BCYYkoAIpcqYjK9HcOKvyef+PUFbfkTCCrxVR9j8=	\N	f	Fitzpatrick	Fitzpatrick	Kane	Fitzpatrick@illinois.edu	f	t	2019-07-30 18:30:11.369233-05	t	f
5	pbkdf2_sha256$150000$3kWZ4vKr81Ec$jGiwO81PSoGJGHS4CNuUXFTf0OS84/e/BMJAitGHlxY=	\N	f	Gibbs	Gibbs	Bronson	Gibbs@illinois.edu	f	t	2019-07-30 18:30:11.439164-05	t	f
6	pbkdf2_sha256$150000$Q8KGjfu5R6Sl$/wJNMKDqPTKYWPbTFXZXp2vgTN3iK/vegcea5YCbQsM=	\N	f	White	White	Calvin	White@illinois.edu	f	t	2019-07-30 18:30:11.508574-05	t	f
7	pbkdf2_sha256$150000$3HPidAJ36hQV$v0kOc2KCgWYKkFQ0tcqy9OZq3h4fpiHlwhRzqA8XD6o=	\N	f	Becker	Becker	Luke	Becker@illinois.edu	f	t	2019-07-30 18:30:11.578083-05	t	f
8	pbkdf2_sha256$150000$1PEMJsoRaVzS$6iWmsUHK4O+HtP9uv3c5KkEmxblDfd8rBXGwJ7ao2uw=	\N	f	Watson	Watson	Jaden	Watson@illinois.edu	f	t	2019-07-30 18:30:11.647914-05	t	f
9	pbkdf2_sha256$150000$jwv3Ofi6996c$chFu6AFxXFa+LCtxcQVNoeDvqPeuA4L7TAvHChNEdU8=	\N	f	Villarreal	Villarreal	Alfred	Villarreal@illinois.edu	f	t	2019-07-30 18:30:11.71724-05	t	f
10	pbkdf2_sha256$150000$CPlIpBiTaafo$eJU4DRYVG3tAq2cTzcRNAlcvZUoNvKpTHZYwk6uppwo=	\N	f	Beard	Beard	Kylan	Beard@illinois.edu	f	t	2019-07-30 18:30:11.786887-05	t	f
11	pbkdf2_sha256$150000$QuGzzjzk25Rh$dkqv0Zqb2ixLj3gowAsL3hs0Yra667OFIyJuJkt8iSk=	\N	f	Mckinney	Mckinney	Greyson	Mckinney@illinois.edu	f	t	2019-07-30 18:30:11.856095-05	t	f
12	pbkdf2_sha256$150000$ukuwNySmMwDG$TIQlvYq1UZxxzPaixBLYaUpCrS56T3HUiw807GBrb3s=	\N	f	Russell	Russell	Leland	Russell@illinois.edu	f	t	2019-07-30 18:30:11.926633-05	t	f
13	pbkdf2_sha256$150000$cC5uWmkn4FLs$ufGbiV1j0ISI/xk3n1KrHTdEujgOGIzy7ExN+fjhCXw=	\N	f	Dawson	Dawson	Justin	Dawson@illinois.edu	f	t	2019-07-30 18:30:11.996275-05	t	f
14	pbkdf2_sha256$150000$D0rTPsqkOhMa$k2rGl4pmORWZREv1STSV3WZ+V8zGmCL9sUwaiyNZ4IE=	\N	f	Hayes	Hayes	Avery	Hayes@illinois.edu	f	t	2019-07-30 18:30:12.065035-05	t	f
15	pbkdf2_sha256$150000$LyXG16I6Z2dF$kHnDeZ4bDQn5s3/9ujbk+GW4LrMmW5unNLZheXSxUpM=	\N	f	Herring	Herring	Kristopher	Herring@illinois.edu	f	t	2019-07-30 18:30:12.135246-05	t	f
16	pbkdf2_sha256$150000$dDWO5AZmJxt5$gykIE6CWmcN+PS7doYBzci8tLPHnDDjxPNLwMq0Kg5U=	\N	f	Riggs	Riggs	Jacob	Riggs@illinois.edu	f	t	2019-07-30 18:30:12.203929-05	t	f
17	pbkdf2_sha256$150000$bCQOF0gM6uwi$mBNIMXKJGmIU8IcZL1ODsciuBjrU3csSFqAjGSCiEkk=	\N	f	Ali	Ali	Deshawn	Ali@illinois.edu	f	t	2019-07-30 18:30:12.27316-05	t	f
18	pbkdf2_sha256$150000$YQj9sK3SIyXf$zEXyJiwzYWNWGyHgmjf6bG2EF4WWJR1/e/DR7vUXBPU=	\N	f	Sullivan	Sullivan	Abel	Sullivan@illinois.edu	f	t	2019-07-30 18:30:12.342737-05	t	f
19	pbkdf2_sha256$150000$orDahDIaUfUP$zJwJpWyp8KkD8TDPvcKdxMTFaSp1uHaInTLNNG8bQJw=	\N	f	Strong	Strong	Johnny	Strong@illinois.edu	f	t	2019-07-30 18:30:12.411107-05	t	f
20	pbkdf2_sha256$150000$jdjOPkgNluaq$f9SqiHQ8E/oDujkTfsz0ekqyQBehhUWJDOpnLUs3mTk=	\N	f	Merritt	Merritt	Zander	Merritt@illinois.edu	f	t	2019-07-30 18:30:12.479158-05	t	f
21	pbkdf2_sha256$150000$6DJk0zccSDsU$XQL6usrrC1Q77vI+MqjGSLrm3gyA/DQ1CWJffv7fSqU=	\N	f	Ferrell	Ferrell	Jayvion	Ferrell@illinois.edu	f	t	2019-07-30 18:30:12.548333-05	t	f
22	pbkdf2_sha256$150000$kcCh2SKlkr5T$qT9+s7WdZha5Rs0+6o7pIw1qYKVUupNtddxjsSgnTR8=	\N	f	Glass	Glass	Maverick	Glass@illinois.edu	f	t	2019-07-30 18:30:12.616976-05	t	f
23	pbkdf2_sha256$150000$aHiuLJMjeZfh$FKoHi2yR4tMuQnfJSrcYYEC8EhFiyR0zJnWOZ7vd88A=	\N	f	Holder	Holder	Lewis	Holder@illinois.edu	f	t	2019-07-30 18:30:12.685238-05	t	f
24	pbkdf2_sha256$150000$pJl1lLxNwXvk$OoBcKf4D0HLj48kq5L3zfjuRekm0lJKvYBdv5YW+Ouo=	\N	f	Peters	Peters	Tyrone	Peters@illinois.edu	f	t	2019-07-30 18:30:12.75326-05	t	f
25	pbkdf2_sha256$150000$JKI5fRX2Bat2$u2gmCFhDn+GbQkKbiV91zb7RuZheoggEhPMiqX2hezo=	\N	f	Dudley	Dudley	Lawson	Dudley@illinois.edu	f	t	2019-07-30 18:30:12.820855-05	t	f
26	pbkdf2_sha256$150000$EFoUyQQcetr6$G14rryRxhI/y27KGfwTJdCqPeooMrPOUGAqVmYyPOrQ=	\N	f	Mclean	Mclean	Steven	Mclean@illinois.edu	f	t	2019-07-30 18:30:12.889452-05	t	f
27	pbkdf2_sha256$150000$oPXiJGa7PgcD$VuveqQNj35gsY77XKEdI7URqKfNsoazvdVTLiP0CqEo=	\N	f	Gonzalez	Gonzalez	Jaquan	Gonzalez@illinois.edu	f	t	2019-07-30 18:30:12.959664-05	t	f
28	pbkdf2_sha256$150000$EZMMo1tSIhdm$jvPaxJqlOFwh8YdhAu4YrVuKvtmOMTSBBH/WVw3Ebvw=	\N	f	Alexander	Alexander	Louis	Alexander@illinois.edu	f	t	2019-07-30 18:30:13.028259-05	t	f
29	pbkdf2_sha256$150000$zBf5vpGUCOEd$a/C0VwCgRZ6D6QiSg9y2pwU6C9dQyBhjgxpidSk0/4k=	\N	f	Townsend	Townsend	Dereon	Townsend@illinois.edu	f	t	2019-07-30 18:30:13.097211-05	t	f
30	pbkdf2_sha256$150000$YNakaM1X4ISs$r3nKV7EMGZAaO5rG5iyjGhAS9rqjG9igH1d/GhMHSGc=	\N	f	Moody	Moody	Rory	Moody@illinois.edu	f	t	2019-07-30 18:30:13.166458-05	t	f
31	pbkdf2_sha256$150000$u5EO5479rfwB$ZyX4RYIdsYLdtEiPOkebTfZe5gKOkP9UnfyesznkaHA=	\N	f	Levy	Levy	Kadin	Levy@illinois.edu	f	t	2019-07-30 18:30:13.234481-05	t	f
32	pbkdf2_sha256$150000$3ewXQ6502yhs$2bl91pPR4/q9kPyD1QU936n3NS83/IMYXs5fpmfMCcg=	\N	f	Medina	Medina	Zachariah	Medina@illinois.edu	f	t	2019-07-30 18:30:13.302923-05	t	f
33	pbkdf2_sha256$150000$GTypXseJ3oWm$vH0H0P8ONjtVJeUxCa4SWUd6L765mv0xUF7OkkoCFDI=	\N	f	Bonilla	Bonilla	Ayaan	Bonilla@illinois.edu	f	t	2019-07-30 18:30:13.372622-05	t	f
34	pbkdf2_sha256$150000$BUMVucog8G4T$25NJf0pKZCfaUTQuK4ms+Vp0hpBWzEynEI24jaf/vRg=	\N	f	Potts	Potts	Clinton	Potts@illinois.edu	f	t	2019-07-30 18:30:13.441079-05	t	f
35	pbkdf2_sha256$150000$x9HPLnLZP77S$OlXTotjbHQfy+7tgv8P/DiT71tdbwtzgcjt/Vqs6L4I=	\N	f	Ramirez	Ramirez	Atticus	Ramirez@illinois.edu	f	t	2019-07-30 18:30:13.51012-05	t	f
36	pbkdf2_sha256$150000$LGZmSniWw2Dd$Oita2TLNrAlpKcAdA/xGj4r2QpokEgRb0/10kPKvvZY=	\N	f	Hancock	Hancock	Dante	Hancock@illinois.edu	f	t	2019-07-30 18:30:13.579264-05	t	f
37	pbkdf2_sha256$150000$33Vp1RfN1j04$cobyd9vt5QxFVA5nIhPtaKTQ3pHG3Vyg6jjXGbNYbjM=	\N	f	Reed	Reed	Darrell	Reed@illinois.edu	f	t	2019-07-30 18:30:13.647842-05	t	f
38	pbkdf2_sha256$150000$ig6MEch0SOEA$sh4SUm4c05yCHCMja/EpXuY8AKTBJUnSq3NhvqFlhJs=	\N	f	Woods	Woods	Jamal	Woods@illinois.edu	f	t	2019-07-30 18:30:13.716435-05	t	f
39	pbkdf2_sha256$150000$j9QkKvCduw6b$x8m7S/Qx86geUhBo0Fl95c5q58MgBqLPn5yN/VJzPUo=	\N	f	Ellison	Ellison	Rodrigo	Ellison@illinois.edu	f	t	2019-07-30 18:30:13.785019-05	t	f
40	pbkdf2_sha256$150000$qOFrM8uFKvoT$YZbwNgZsxKVxRTIluUPslhplJpnoXrMOjHKkyDrdYBI=	\N	f	Mccoy	Mccoy	Julius	Mccoy@illinois.edu	f	t	2019-07-30 18:30:13.853915-05	t	f
41	pbkdf2_sha256$150000$j4SH1aKABZoK$7k1yCTKjseR9ncukQ1fairUiSrLlbikfBJY5ftF1jYw=	\N	f	Patrick	Patrick	Ramiro	Patrick@illinois.edu	f	t	2019-07-30 18:30:13.923257-05	t	f
42	pbkdf2_sha256$150000$gDH77lIDyuIJ$ZQvpMiaDKKQ1SLOhKXi1BhdUWOF650MsOBYCkkH2cq0=	\N	f	Johns	Johns	Maxwell	Johns@illinois.edu	f	t	2019-07-30 18:30:13.992035-05	t	f
43	pbkdf2_sha256$150000$gAqc81yjMn3M$zjtRRH9g850Tqoypsacv3RGCiHOj6Ech6ljK9KFGJBg=	\N	f	Stewart	Stewart	Nathan	Stewart@illinois.edu	f	t	2019-07-30 18:30:14.060606-05	t	f
44	pbkdf2_sha256$150000$7d6mAas2toUD$iGn2fmo7pumWy2e0Upsph09PG9RP+9Twm3C9CUnBlkM=	\N	f	Brown	Brown	Isiah	Brown@illinois.edu	f	t	2019-07-30 18:30:14.129238-05	t	f
45	pbkdf2_sha256$150000$vEsEcUbYkN9p$rO0J9mglXd3TiE2Vl8bgMaibX7CgpUWhWHdsBXepe+8=	\N	f	Luna	Luna	Aiden	Luna@illinois.edu	f	t	2019-07-30 18:30:14.196258-05	t	f
46	pbkdf2_sha256$150000$uPNuFKgwGbeW$oGJHiCEdE1n/vT5g7+qbY4ctpgKcnUtva5oo9J+y7mg=	\N	f	Short	Short	Cyrus	Short@illinois.edu	f	t	2019-07-30 18:30:14.263713-05	t	f
47	pbkdf2_sha256$150000$Lz4Yvr3HnUpf$aCZ+zKCNzdVBtzJw2LZ54vyDh6+csLELstrf89SOqJI=	\N	f	Walter	Walter	Kason	Walter@illinois.edu	f	t	2019-07-30 18:30:14.332175-05	t	f
48	pbkdf2_sha256$150000$4QvUBgifP2VV$1agJ0OaaDFAm70tHDRpcj/CGZtflVWD6E6WmFeMkq08=	\N	f	Roy	Roy	Isaac	Roy@illinois.edu	f	t	2019-07-30 18:30:14.401077-05	t	f
49	pbkdf2_sha256$150000$TWNIecB4WkjY$zhaepf8cMKrILfu3vWltrUaJNRuGG0POZxJBTlb9zlo=	\N	f	Sharp	Sharp	Ari	Sharp@illinois.edu	f	t	2019-07-30 18:30:14.46971-05	t	f
50	pbkdf2_sha256$150000$PAsYp2PLzz16$RwluHVOm14UnvlX6Flkr6uGQof8AzcxPB5Cs+u4p7J8=	\N	f	Campbell	Campbell	Tony	Campbell@illinois.edu	f	t	2019-07-30 18:30:14.538873-05	t	f
51	pbkdf2_sha256$150000$0Zz5qc5GoixN$aZ/8AnS+Gyd60Zp9A6XvxQnbZA0CaM4WrlYnI1xUzwg=	\N	f	Cameron	Cameron	Dax	Cameron@illinois.edu	f	t	2019-07-30 18:30:14.607766-05	t	f
52	pbkdf2_sha256$150000$H5t2JS9gXLDU$QScYwB7wx93nnQ1pQdR2orEzhhwageRfGudOW+NP6xw=	\N	f	Cochran	Cochran	Jude	Cochran@illinois.edu	f	t	2019-07-30 18:30:14.676007-05	t	f
53	pbkdf2_sha256$150000$k0LIh43aIjPu$FcWt2ExMbc0kgDB1N90wixUzTBdTPdXgAiDxya3GckQ=	\N	f	Preston	Preston	Silas	Preston@illinois.edu	f	t	2019-07-30 18:30:14.744753-05	t	f
54	pbkdf2_sha256$150000$YSlmv6Q92531$ZoDF9ofgONy7Kmt2+TcNJ4650C4TZbgJH5CyEl6wSiQ=	\N	f	Rosales	Rosales	Tyson	Rosales@illinois.edu	f	t	2019-07-30 18:30:14.813199-05	t	f
55	pbkdf2_sha256$150000$gj2OHIxS436B$3SaliWOxopHMuq7W2Q2axLNYm0SCZ1tHDvyoZY0W6sg=	\N	f	Glenn	Glenn	Seth	Glenn@illinois.edu	f	t	2019-07-30 18:30:14.881708-05	t	f
56	pbkdf2_sha256$150000$03FnPXzEVgd0$86RfK7IVmzgbGOL29+jmATeLtxwvMgY6SPvyYgHbSn0=	\N	f	Lynch	Lynch	Rodney	Lynch@illinois.edu	f	t	2019-07-30 18:30:14.952319-05	t	f
57	pbkdf2_sha256$150000$sSNG6Uj19Zsv$gjWDILytPVEhjfeGxtA4vi/hlLehuA9ihkJWq+1KUho=	\N	f	Cox	Cox	Sonny	Cox@illinois.edu	f	t	2019-07-30 18:30:15.03481-05	t	f
58	pbkdf2_sha256$150000$wyVL2pYlQJdH$yuVL9cjEfuyfJ7i9VDwyROQ/b2uCJsoxOGUY46pkIJk=	\N	f	Stanton	Stanton	Trace	Stanton@illinois.edu	f	t	2019-07-30 18:30:15.104238-05	t	f
59	pbkdf2_sha256$150000$PXczQaXrTjiw$KY+4prusKZ4JSj5qfvlYiGtnaxG3w5nw+7x0i6917w8=	\N	f	Cobb	Cobb	Jordan	Cobb@illinois.edu	f	t	2019-07-30 18:30:15.1844-05	t	f
60	pbkdf2_sha256$150000$DMJwaRfFulyT$FZWNjip0hyjNBjCLPlMb1w3bnOtRZ2a8X9sKt+RrN3Q=	\N	f	Bean	Bean	Harry	Bean@illinois.edu	f	t	2019-07-30 18:30:15.253745-05	t	f
61	pbkdf2_sha256$150000$tHANk5WTQg1j$/E3lmOuh9ovS/O0d4jDb4edEyOuMumtBm5R01uK1lAc=	\N	f	Fry	Fry	Tyree	Fry@illinois.edu	f	t	2019-07-30 18:30:15.33318-05	t	f
62	pbkdf2_sha256$150000$Hh5HXgAvi0Bo$CTDDMNYqH1xxD2Vze69RpOtiprtx7pUvmsZDt4MPjmA=	\N	f	Larsen	Larsen	Drake	Larsen@illinois.edu	f	t	2019-07-30 18:30:15.401046-05	t	f
63	pbkdf2_sha256$150000$p3r21Y2RSSs2$s6UfoZB9UXh6+ZMJnmjL52XDPiFgMnG1AYPLDUN6Ubs=	\N	f	Santiago	Santiago	Steve	Santiago@illinois.edu	f	t	2019-07-30 18:30:15.468218-05	t	f
64	pbkdf2_sha256$150000$6uVADq66778i$oPpQG4XfqiJzcfSNs+heS8bvMsgmkKzKW+MzH/qP1NQ=	\N	f	Small	Small	Hugh	Small@illinois.edu	f	t	2019-07-30 18:30:15.535557-05	t	f
65	pbkdf2_sha256$150000$RPBd18jfH0DM$05yHVZscqpDZxAOf2s93PtZQlMPTULucAdttHjX7608=	\N	f	Russo	Russo	Alijah	Russo@illinois.edu	f	t	2019-07-30 18:30:15.602973-05	t	f
66	pbkdf2_sha256$150000$zbRVS1nMCGEj$1eBTZ/Ev0drFDt9SVx+nRdi5rA+Zett9FmQ0m8vqxmQ=	\N	f	Diaz	Diaz	Brodie	Diaz@illinois.edu	f	t	2019-07-30 18:30:15.671832-05	t	f
67	pbkdf2_sha256$150000$gdcWeipoSGIG$otmeivikT3B11lWwNf9wfvRbaNv1uw5PrhEGbsAZXgU=	\N	f	Norman	Norman	Nico	Norman@illinois.edu	f	t	2019-07-30 18:30:15.739889-05	t	f
68	pbkdf2_sha256$150000$CRj6OK5w45Vw$f/Wfk1bf50l1swacYtE6Dt8fINHxJ2Ncx/C5WfUgHaM=	\N	f	Webb	Webb	Damari	Webb@illinois.edu	f	t	2019-07-30 18:30:15.80786-05	t	f
69	pbkdf2_sha256$150000$arunDHYkARL2$miOtbAayBBafyWJxaeuDTW3pX7n5iAbAEQDnGO1fIBY=	\N	f	Jennings	Jennings	Dillan	Jennings@illinois.edu	f	t	2019-07-30 18:30:15.87899-05	t	f
70	pbkdf2_sha256$150000$vtlPunJsCwI3$8RlehGy0A8+cu+lcuJNaQeqJtds8K5+GZOvAvBThiXI=	\N	f	Rasmussen	Rasmussen	Santiago	Rasmussen@illinois.edu	f	t	2019-07-30 18:30:15.948687-05	t	f
71	pbkdf2_sha256$150000$DlKna4ruWLy1$rpK5ENBhaxzti92tB5tXRbtaUXel2kzbdU3L+4DGvoI=	\N	f	Fischer	Fischer	Brooks	Fischer@illinois.edu	f	t	2019-07-30 18:30:16.017197-05	t	f
72	pbkdf2_sha256$150000$W7slnjn6euWG$HpzKAif9uuZvSZyzm7MccWTcuwZOaLWh6d6ZQ9aqPTw=	\N	f	Ryan	Ryan	Nathaniel	Ryan@illinois.edu	f	t	2019-07-30 18:30:16.085341-05	t	f
73	pbkdf2_sha256$150000$UUam6EWMxF8u$wbg4lCJ3LIV5csjiQ7S2XHnmc5lS9dj3TpzP9Jph0mc=	\N	f	Conley	Conley	Brody	Conley@illinois.edu	f	t	2019-07-30 18:30:16.153772-05	t	f
74	pbkdf2_sha256$150000$xrGZ4aYaA0DX$mvdP6iINq3m5+d5FgbuB/+5heoD3uusz3aS4NoFhi8I=	\N	f	Allison	Allison	Conner	Allison@illinois.edu	f	t	2019-07-30 18:30:16.221837-05	t	f
75	pbkdf2_sha256$150000$Vizq46lunhb0$v3L0RObyTALtitCu4BchgPSgIPjVxouJpKAdpVpLwdA=	\N	f	Hale	Hale	Terrell	Hale@illinois.edu	f	t	2019-07-30 18:30:16.290456-05	t	f
76	pbkdf2_sha256$150000$qKPq5ZzZ48Aa$Hr1iRF4Ir7SyKEPPMLELklu/bFXt49DDP3HrfGjQ8Ak=	\N	f	Serrano	Serrano	Mike	Serrano@illinois.edu	f	t	2019-07-30 18:30:16.357951-05	t	f
77	pbkdf2_sha256$150000$lUEeif89xavh$NDsHiUupHKv11IwIravFly0Vq3ccslk1Nv1xwb+HicM=	\N	f	Ballard	Ballard	Korbin	Ballard@illinois.edu	f	t	2019-07-30 18:30:16.426511-05	t	f
78	pbkdf2_sha256$150000$PyX8URB0yYqG$Ob+Pf0tTZ4yYuqQujZ5d4lHQtKDEDAAoU6EW3+Mhib8=	\N	f	Clayton	Clayton	Peter	Clayton@illinois.edu	f	t	2019-07-30 18:30:16.494494-05	t	f
79	pbkdf2_sha256$150000$veAPnzt6EVpx$cS6BIowfQkvUGPq7yNOlUtMZQPa0SMDL+SGRI8Y2IU0=	\N	f	Coffey	Coffey	Jaxon	Coffey@illinois.edu	f	t	2019-07-30 18:30:16.562489-05	t	f
80	pbkdf2_sha256$150000$8GuehmcZ4sMj$qVCeGuqWNE1FRXjHMhne6mmPM1sDrzZEdkq+qLtPMF4=	\N	f	Fitzgerald	Fitzgerald	Carter	Fitzgerald@illinois.edu	f	t	2019-07-30 18:30:16.630493-05	t	f
81	pbkdf2_sha256$150000$2gzScgBAaJuh$bQgTERuw70+VopASOw/+NgXPCadJKZPSHRNkVdBTY0s=	\N	f	Norris	Norris	Layton	Norris@illinois.edu	f	t	2019-07-30 18:30:16.698979-05	t	f
82	pbkdf2_sha256$150000$yZkEAaRlJD8H$ZqP1bxLWFMxpDEwLySywdzM7OXjvGn7o97GWPj1LMRo=	\N	f	Mosley	Mosley	Brenden	Mosley@illinois.edu	f	t	2019-07-30 18:30:16.778386-05	t	f
83	pbkdf2_sha256$150000$CzHskHTwJ4KZ$uyMLG11ryhr03AXH6mxzHG462wnA1NrMCb8mdkE34KU=	\N	f	Choi	Choi	Dean	Choi@illinois.edu	f	t	2019-07-30 18:30:16.856506-05	t	f
84	pbkdf2_sha256$150000$udZ5LtcJFYls$8X2y3mtFQX/cPe+lfMZ6xiocPZpesuecyZJ95ah73lc=	\N	f	Carroll	Carroll	Rayan	Carroll@illinois.edu	f	t	2019-07-30 18:30:16.925088-05	t	f
85	pbkdf2_sha256$150000$ERijttlyGm25$uvoL5R6XSNKn8H7Lkld7m08AAe1UdHF+xrVBi1HfteI=	\N	f	Gentry	Gentry	Francisco	Gentry@illinois.edu	f	t	2019-07-30 18:30:16.992209-05	t	f
86	pbkdf2_sha256$150000$koOWNkpeoBln$N6HYiNBWSR1G/kURLB2SGQ6kf8GYvYzC1301vZjivfI=	\N	f	Hull	Hull	Yandel	Hull@illinois.edu	f	t	2019-07-30 18:30:17.059267-05	t	f
87	pbkdf2_sha256$150000$wnWZ0GJeEXd6$oKVovjCpWucjA3L+yDCrvMO59lGD00TP76S/Yv5C2wc=	\N	f	Andersen	Andersen	Jacoby	Andersen@illinois.edu	f	t	2019-07-30 18:30:17.12876-05	t	f
88	pbkdf2_sha256$150000$kk1Pm4fVRPfs$mtB0m/3AftN3rrMfpzJvy03tE+26EFSc52n0EnquAt8=	\N	f	Shea	Shea	Aydin	Shea@illinois.edu	f	t	2019-07-30 18:30:17.206235-05	t	f
89	pbkdf2_sha256$150000$0aAC0YPL5dFG$bfg+gwgRXyMMzTLDMdSF9utpjxN9Q7WdkyMhymV0NPM=	\N	f	Bennett	Bennett	Mohammad	Bennett@illinois.edu	f	t	2019-07-30 18:30:17.27362-05	t	f
90	pbkdf2_sha256$150000$KCaK32MPVBZU$3up6uGV6NCVIQtNbSPi8jmbAMlzNc8FI3uDOwYUGk3Y=	\N	f	Velasquez	Velasquez	Vicente	Velasquez@illinois.edu	f	t	2019-07-30 18:30:17.341193-05	t	f
91	pbkdf2_sha256$150000$2AZTH3TpHrWB$ezQhXbNSqk3b6x1tap12IrRp95Pp57eP0h0M9pbemGs=	\N	f	Clements	Clements	Martin	Clements@illinois.edu	f	t	2019-07-30 18:30:17.408167-05	t	f
92	pbkdf2_sha256$150000$1uZy6NZJ7wHX$335dqsEpUmL0xfVFXFA5upHNTEHKsfNiN0OcbbehNXQ=	\N	f	Hooper	Hooper	Callum	Hooper@illinois.edu	f	t	2019-07-30 18:30:17.47507-05	t	f
93	pbkdf2_sha256$150000$0vFgWpObRNrg$j2VQX+4ZgcESb2XA/wWFpnQVCvKYv8byp81vaCWBOxg=	\N	f	Schultz	Schultz	Landyn	Schultz@illinois.edu	f	t	2019-07-30 18:30:17.542547-05	t	f
94	pbkdf2_sha256$150000$vTjds6ss4kI5$0R4LNhzuLomuqt35GkmxcEKw+QmqNSQS50PZn58+Bdw=	\N	f	Stein	Stein	Ruben	Stein@illinois.edu	f	t	2019-07-30 18:30:17.609831-05	t	f
95	pbkdf2_sha256$150000$CllTa547EfGB$xAl9kUPwA/2BCcW5AuLvV9MT3vLAWKqvP0XVtLUjo8k=	\N	f	Lester	Lester	Skyler	Lester@illinois.edu	f	t	2019-07-30 18:30:17.677376-05	t	f
96	pbkdf2_sha256$150000$BPItG3uEAvgZ$7U8W4yueM6GvkJW2bcx7wq9odsL+RNFoHSEwCHvy47Q=	\N	f	Wolfe	Wolfe	Tomas	Wolfe@illinois.edu	f	t	2019-07-30 18:30:17.744733-05	t	f
97	pbkdf2_sha256$150000$d5BKcgBsGLlW$aR4+IOAU2rCKdspErQGRQTbYFmSM0ir1/7V984RuYJI=	\N	f	Harmon	Harmon	Jaxson	Harmon@illinois.edu	f	t	2019-07-30 18:30:17.812455-05	t	f
98	pbkdf2_sha256$150000$JZ8q2WFAH57i$PyJd5j4L1MfzaTYPnl5pLcsQRd1RQ+cpavoYtgcxPcI=	\N	f	Lara	Lara	Nickolas	Lara@illinois.edu	f	t	2019-07-30 18:30:17.880447-05	t	f
99	pbkdf2_sha256$150000$ifKjvKahp12n$zowtqP+5vbdJJ5uftHudoU2rqU36BjZLUJBzbACUPoM=	\N	f	Moon	Moon	Jessie	Moon@illinois.edu	f	t	2019-07-30 18:30:17.952707-05	t	f
100	pbkdf2_sha256$150000$kR8RWPQOh2ol$DkNlu3jTpEK3JaXgCWSX2DMsK5eUxcQwvV5+JczOAP0=	\N	f	Powers	Powers	Paul	Powers@illinois.edu	f	t	2019-07-30 18:30:18.023103-05	t	f
101	pbkdf2_sha256$150000$z5pyzeEMxHCB$Q1Xj+0aRKBRhWNhHbySKoCUtRokaujGPBDlW7O+eP8I=	\N	f	Barrett	Barrett	Elvis	Barrett@illinois.edu	f	t	2019-07-30 18:30:18.092768-05	t	f
102	pbkdf2_sha256$150000$FrqFESJFXtSR$PpF3Fa81gm8k+n6m6tmNxKAETLefw6sXsZ7i50N6HuA=	\N	f	Grimes	Grimes	Uriel	Grimes@illinois.edu	f	t	2019-07-30 18:30:18.162204-05	t	f
103	pbkdf2_sha256$150000$m4wQAWW8aoPk$i6oQJpOdcM8UpBpvQVJwv2JhHaA2zJf6C5wZOl/+cIk=	\N	f	Rogers	Rogers	Jean	Rogers@illinois.edu	f	t	2019-07-30 18:30:18.230804-05	t	f
104	pbkdf2_sha256$150000$RKMOmhvN6nzD$ha/KOTw7obOnDgLig4tAzr19kYQXG0mtBxFQaNtoWMA=	\N	f	Kaiser	Kaiser	Chaz	Kaiser@illinois.edu	f	t	2019-07-30 18:30:18.298884-05	t	f
105	pbkdf2_sha256$150000$DBQlPFfv8AT5$Z9G058V7/BG7fMMo96cXkKMj4wPixDvB0c7FqL+Q+b4=	\N	f	Stephenson	Stephenson	Sterling	Stephenson@illinois.edu	f	t	2019-07-30 18:30:18.368294-05	t	f
106	pbkdf2_sha256$150000$nWhSEeMzHuYy$0+MSe9MT3znke0bwr3+GQi2AveHRUaZbsNCTCqgYIjs=	\N	f	Mccarty	Mccarty	Roland	Mccarty@illinois.edu	f	t	2019-07-30 18:30:18.43725-05	t	f
107	pbkdf2_sha256$150000$aUDsnd0jEN9x$sJZqKFhDmhFKhnfwtMMu842RwH5R/Qd2L5CXbwh+IU4=	\N	f	Raymond	Raymond	Tyrese	Raymond@illinois.edu	f	t	2019-07-30 18:30:18.506255-05	t	f
108	pbkdf2_sha256$150000$j0Oc0ugl1Rf3$AjqAVGDfO0iBwhqdJ140Ms3Tl/ml8WMiryrshuBNceg=	\N	f	Bentley	Bentley	Beau	Bentley@illinois.edu	f	t	2019-07-30 18:30:18.575654-05	t	f
109	pbkdf2_sha256$150000$hSf1SCfi4u2A$JQoHM4rJ7dcGblmw4oERBFGcu2BZx8d7AYT1Dszv4n4=	\N	f	Crawford	Crawford	Maddox	Crawford@illinois.edu	f	t	2019-07-30 18:30:18.644337-05	t	f
110	pbkdf2_sha256$150000$2JDyk0wW8LKI$5jVIA9luu5pFeIAtm2iAQtTd8FaR/yiyFyLPZtWyYH8=	\N	f	Richmond	Richmond	Koen	Richmond@illinois.edu	f	t	2019-07-30 18:30:18.713054-05	t	f
111	pbkdf2_sha256$150000$ywN3jrOZU3j8$eiAHmr9tjzQZyeHSGxI0eq8uPYlp4kWMpkzA0t+YaxI=	\N	f	Gaines	Gaines	Henry	Gaines@illinois.edu	f	t	2019-07-30 18:30:18.782089-05	t	f
112	pbkdf2_sha256$150000$KXx1TEKplbNI$+qRbg8M68NIFX55W6mcYPDJxGmUa3i5OSFDLmRkPDZA=	\N	f	Hess	Hess	Aden	Hess@illinois.edu	f	t	2019-07-30 18:30:18.851633-05	t	f
113	pbkdf2_sha256$150000$M9E7UHvU3KFl$hJ1u/fMGqSuj5NeW+Z9uB16INEns6XO+Ow2EoJtfbfI=	\N	f	Murray	Murray	Asher	Murray@illinois.edu	f	t	2019-07-30 18:30:18.920948-05	t	f
114	pbkdf2_sha256$150000$UcMdgOZNUVi6$tODV5htFGwFAlEM6fwby1Kei+lNGEccTImKwOsbCvEE=	\N	f	Foster	Foster	Colin	Foster@illinois.edu	f	t	2019-07-30 18:30:18.989819-05	t	f
115	pbkdf2_sha256$150000$FnHznw06Rdq1$W+Zs5WKTYpcsEl+Jr5s1kGAwxQSbiuVSUmN9IpJmtCE=	\N	f	Andrews	Andrews	Richard	Andrews@illinois.edu	f	t	2019-07-30 18:30:19.057599-05	t	f
116	pbkdf2_sha256$150000$ylifRqKjSXBj$wLqEYE8/334YAT0e5dvXycpu0NQQlu9oN8F2y/dVrlI=	\N	f	Davila	Davila	Ernest	Davila@illinois.edu	f	t	2019-07-30 18:30:19.126623-05	t	f
117	pbkdf2_sha256$150000$2ul0I80OLL4Q$oG3tKeykh4n3wixaptxJvYogjdJr5PbqFZE46KviHvs=	\N	f	Conner	Conner	Romeo	Conner@illinois.edu	f	t	2019-07-30 18:30:19.196109-05	t	f
118	pbkdf2_sha256$150000$sDohHyR0Hwpd$6hLJ2KuZEAxHlrpxKFr9p0+b6h6BfB2szaI9oeBvKho=	\N	f	Le	Le	Jace	Le@illinois.edu	f	t	2019-07-30 18:30:19.264477-05	t	f
119	pbkdf2_sha256$150000$UWmPFEyJfFAP$kRln4RXoIEyUX1Q8BARoCwmCdo+vfd6Vt3VxpT7M2Fg=	\N	f	Warren	Warren	Mohamed	Warren@illinois.edu	f	t	2019-07-30 18:30:19.333764-05	t	f
120	pbkdf2_sha256$150000$bg2QBgdZuALw$umOEFcMEhkBAoS/jhqkYn5O5xzVXCcdMDwUY+I54m8w=	\N	f	Fuller	Fuller	Cody	Fuller@illinois.edu	f	t	2019-07-30 18:30:19.40275-05	t	f
121	pbkdf2_sha256$150000$fjvjzBOsr5dg$fA8FJsSHAQoEeaHqNdOc2JNhnv3DzdKEg0ph9TZ6Q6k=	\N	f	Bush	Bush	Simeon	Bush@illinois.edu	f	t	2019-07-30 18:30:19.472596-05	t	f
122	pbkdf2_sha256$150000$bqtDan7B6bT2$w8n7gilPjGUIPDlGCIDnA6nfcB8Nbx/5knoxM1ZvA6A=	\N	f	Blevins	Blevins	Blake	Blevins@illinois.edu	f	t	2019-07-30 18:30:19.541788-05	t	f
123	pbkdf2_sha256$150000$XzuYKcmgaDia$066sgB/h2mTj38ZUnH3zTar5IoqM5K1wVjPk+N0UbB4=	\N	f	Sutton	Sutton	Jovanny	Sutton@illinois.edu	f	t	2019-07-30 18:30:19.611857-05	t	f
124	pbkdf2_sha256$150000$oNSR08U8XRtU$NtZkPCtaxKO1r1rTlXqy8S8k+zvmUqDHE3qd84kbb5A=	\N	f	Nelson	Nelson	Vance	Nelson@illinois.edu	f	t	2019-07-30 18:30:19.681034-05	t	f
125	pbkdf2_sha256$150000$Vg7cOcRGq29T$l9e1ZxJfoB/MeU7z/lrf1sLSfnM3U4xE0JxKxheBpK0=	\N	f	Everett	Everett	Johan	Everett@illinois.edu	f	t	2019-07-30 18:30:19.750959-05	t	f
126	pbkdf2_sha256$150000$Rse8TiI4BEoT$4mZqyHLHKYAlFJPsuaUmwSDXf3jDwClaJR5BkdHMswc=	\N	f	Walters	Walters	Keegan	Walters@illinois.edu	f	t	2019-07-30 18:30:19.818805-05	t	f
127	pbkdf2_sha256$150000$A3a8fN6pzVNw$MqD9JW1Gs/0TzB95KTxrbKsB/KXBGnQ/0FyEKpQP81E=	\N	f	Skinner	Skinner	Demetrius	Skinner@illinois.edu	f	t	2019-07-30 18:30:19.888369-05	t	f
128	pbkdf2_sha256$150000$1M9D2KaGw3SH$X1lVPqkXCvU6AEcwkzrE49cMreAJcBoOT89Tx/ClaQM=	\N	f	Jacobs	Jacobs	Troy	Jacobs@illinois.edu	f	t	2019-07-30 18:30:19.957755-05	t	f
129	pbkdf2_sha256$150000$9uSTDf8sJM0I$ATEz99sj2Gs4S3o4qPdSNGnOBUn/ST3vKQDQB8oWIZc=	\N	f	Malone	Malone	Mitchell	Malone@illinois.edu	f	t	2019-07-30 18:30:20.030548-05	t	f
130	pbkdf2_sha256$150000$X8EEdXRapRqr$/heQeB6AIB4ZSz6ozI7DwyYyFKCn7lDyIVSFAQ4ME0U=	\N	f	Pitts	Pitts	Wade	Pitts@illinois.edu	f	t	2019-07-30 18:30:20.0985-05	t	f
131	pbkdf2_sha256$150000$ZdjfpBveCUds$Jn/8ogN8GRn+K5RwbB3ZOuja6bbNYrDB+MW8BiqHxQ4=	\N	f	Long	Long	Immanuel	Long@illinois.edu	f	t	2019-07-30 18:30:20.16747-05	t	f
132	pbkdf2_sha256$150000$m0rPL2aiKzUz$cZP5hdvZ+I4NiN8U5BJ/MmTWkrLUsBj7+jyGVts47Qo=	\N	f	Finley	Finley	Braxton	Finley@illinois.edu	f	t	2019-07-30 18:30:20.235357-05	t	f
133	pbkdf2_sha256$150000$nTNyhSeZfQMk$1QZ9YD8S7hcyjf8IJVPqjdVqXeGW6vLhtxBfn/xZqHY=	\N	f	Krause	Krause	Dangelo	Krause@illinois.edu	f	t	2019-07-30 18:30:20.304958-05	t	f
134	pbkdf2_sha256$150000$fYc8kYY0fGDM$7jWSV86Da7Gw2dOp8/4r9GFYOVbaRZNx67XYVDGPhcs=	\N	f	Shepard	Shepard	London	Shepard@illinois.edu	f	t	2019-07-30 18:30:20.380926-05	t	f
135	pbkdf2_sha256$150000$E5nXFKdW321L$FVbg2zuZdjyEWrFp+DA11ekP7OmC3hYxwQ2XCbrsJiU=	\N	f	Bowman	Bowman	Peyton	Bowman@illinois.edu	f	t	2019-07-30 18:30:20.450735-05	t	f
136	pbkdf2_sha256$150000$Bb9MslxhH1AQ$mSNJ+zmJlAsHz/qeEv6sB8ZxPB+dlV2ONVpJGPFD9nE=	\N	f	Neal	Neal	Darryl	Neal@illinois.edu	f	t	2019-07-30 18:30:20.518667-05	t	f
137	pbkdf2_sha256$150000$cEDuDeuqfuod$+MUzu10emHuDEbn5Dkp4pSaGDcsk2naVdiE4Uk5GxNc=	\N	f	Grant	Grant	Terry	Grant@illinois.edu	f	t	2019-07-30 18:30:20.587522-05	t	f
138	pbkdf2_sha256$150000$DPnjSHkTHXNH$TM74Y9vqoCeaDHIA0QYpSJIrHElrbiDcHezbjJEC6WA=	\N	f	George	George	Tripp	George@illinois.edu	f	t	2019-07-30 18:30:20.65663-05	t	f
139	pbkdf2_sha256$150000$IVEivgLtltAO$1wZlM3qW/4tUimv0K4n5MN+krlRH/bdGi5WFMZu8P1g=	\N	f	Harrell	Harrell	Shane	Harrell@illinois.edu	f	t	2019-07-30 18:30:20.725036-05	t	f
140	pbkdf2_sha256$150000$MDkHMcUzlQdF$E/u8aHdZErAYhNkDTKRCR5KEdpzZufLKEswg8GgGHDo=	\N	f	Weiss	Weiss	Bruce	Weiss@illinois.edu	f	t	2019-07-30 18:30:20.793212-05	t	f
141	pbkdf2_sha256$150000$zR3Y4UwndKOE$MTUEG1foEQ9Zf0hor9hGpvGHXy9WCt0BJE02FeAjvBs=	\N	f	Bird	Bird	Lee	Bird@illinois.edu	f	t	2019-07-30 18:30:20.862368-05	t	f
142	pbkdf2_sha256$150000$aabRyViXpjvp$/3HWBUNEjl/J+3KW4OrmGXrwgJGAU0C0pFf3IT3UcPM=	\N	f	Gardner	Gardner	Graham	Gardner@illinois.edu	f	t	2019-07-30 18:30:20.931177-05	t	f
143	pbkdf2_sha256$150000$QLNjvdEr52XV$LWbcpcgZkvYKMJQNn7bPBelFt69Z+K0Wl9M2/mEG5JA=	\N	f	Hendricks	Hendricks	Ayden	Hendricks@illinois.edu	f	t	2019-07-30 18:30:20.999721-05	t	f
144	pbkdf2_sha256$150000$JQz9HSbD7zwO$ZHKgm+M6EQ8m/89D2FSokywv91GEJZy7MOpwPAn3Ers=	\N	f	Montoya	Montoya	Asa	Montoya@illinois.edu	f	t	2019-07-30 18:30:21.06741-05	t	f
145	pbkdf2_sha256$150000$MaZlSrKqdbpW$XwCrDsaDbgJpGgeC7FVNV+GVns2mtWkNIniD60TdHj8=	\N	f	Yang	Yang	Jadon	Yang@illinois.edu	f	t	2019-07-30 18:30:21.135903-05	t	f
146	pbkdf2_sha256$150000$vxnRDr0WRpeM$baeYdiI1LhrP4+3sROQFuG0EuPCfhG2q4Db5ZXo63rg=	\N	f	Sexton	Sexton	Marshall	Sexton@illinois.edu	f	t	2019-07-30 18:30:21.202942-05	t	f
147	pbkdf2_sha256$150000$kG4CEaz5JOjo$8TXwEAqe1bb/evU0UhqMIPzUj/eJGetKzWAWPXKeXAY=	\N	f	Shaw	Shaw	Tommy	Shaw@illinois.edu	f	t	2019-07-30 18:30:21.272162-05	t	f
148	pbkdf2_sha256$150000$g06w7Z7boFwd$PboMTtg7RYleylURwXKjtQThxNojFYuGshhAYaKDoY8=	\N	f	Bass	Bass	Zackary	Bass@illinois.edu	f	t	2019-07-30 18:30:21.339785-05	t	f
149	pbkdf2_sha256$150000$pcbPjDrmchvn$3FFGfekLLy1ta7VeVaRyiN89s1DisJLA7orP8l5ORfY=	\N	f	Delacruz	Delacruz	Ezra	Delacruz@illinois.edu	f	t	2019-07-30 18:30:21.409039-05	t	f
150	pbkdf2_sha256$150000$anQuoztqc3l3$rJOcJ8H4W1xEV5LUJwXCxcHrQphIUcgFhGDO2LYmGCU=	\N	f	Tran	Tran	Devin	Tran@illinois.edu	f	t	2019-07-30 18:30:21.477896-05	t	f
151	pbkdf2_sha256$150000$eRGrfXXYVcaa$8EJk7Y6+ZgtEnHYzjSqoofGJsBtMWE2nwVWRo1/mVSo=	\N	f	Melendez	Melendez	Ryann	Melendez@illinois.edu	f	t	2019-07-30 18:30:21.558014-05	t	f
152	pbkdf2_sha256$150000$qHPrdVuvITdy$rHIATeiZbwXecKRLoUocvbhQ6qRZeZhzeg2qLINHH9U=	\N	f	Rivers	Rivers	Leilani	Rivers@illinois.edu	f	t	2019-07-30 18:30:21.626746-05	t	f
153	pbkdf2_sha256$150000$2P7V23axlye1$zPFVy27R3PFNQVaYP5eJXmNPKFqvTC+3Uk7maohttqY=	\N	f	Brooks	Brooks	Ruth	Brooks@illinois.edu	f	t	2019-07-30 18:30:21.695996-05	t	f
154	pbkdf2_sha256$150000$6dME0pZVoRtY$B948tdPsAcCNTCT6IMlOvDTjv1JJzoFpqaNi38Brl9k=	\N	f	Ochoa	Ochoa	Jaylen	Ochoa@illinois.edu	f	t	2019-07-30 18:30:21.764172-05	t	f
155	pbkdf2_sha256$150000$zYLqNHqKnfj8$mWO5UgZYetvDFqRR4d/WlrV6b0BtZtKPc7bCSSXys5k=	\N	f	Shepherd	Shepherd	Piper	Shepherd@illinois.edu	f	t	2019-07-30 18:30:21.833138-05	t	f
156	pbkdf2_sha256$150000$snYCxIUeALfG$66FOk+C/KEu/Xy6RdDpAtKwCVWT6vem8HOq5ymH7MGw=	\N	f	Gregory	Gregory	Violet	Gregory@illinois.edu	f	t	2019-07-30 18:30:21.900947-05	t	f
157	pbkdf2_sha256$150000$2SBDGVPyjBdy$V0Fc9v75thT5U8BpPIlcQtaLUPN2ozGyAseZW3hDgo0=	\N	f	Jones	Jones	Macie	Jones@illinois.edu	f	t	2019-07-30 18:30:21.969905-05	t	f
158	pbkdf2_sha256$150000$aq9o9bODInL3$Rya6lkv6L0VZIqNoyjjEM0zXpMKHJ0oOUE47I5Aqf5w=	\N	f	Hurst	Hurst	Haley	Hurst@illinois.edu	f	t	2019-07-30 18:30:22.037473-05	t	f
159	pbkdf2_sha256$150000$5NoJ1N9SD9hQ$xMP1ULsMRswXoe0r8HsT/HILK1kb1PTbrrX1UBAND9M=	\N	f	Boyd	Boyd	Jazlynn	Boyd@illinois.edu	f	t	2019-07-30 18:30:22.106056-05	t	f
160	pbkdf2_sha256$150000$RMmepunHOWlo$NTAuj2bA1M/Pra4rbpnPAo9AS07sOuLMPq0AOjF+RoY=	\N	f	Solis	Solis	Carlee	Solis@illinois.edu	f	t	2019-07-30 18:30:22.174399-05	t	f
161	pbkdf2_sha256$150000$tO7uQ6o1NL6F$mM0qwIkVMRlf6yFRwlfd9SGSJEWmmSMuHgQLzdKVxUs=	\N	f	Matthews	Matthews	Andrea	Matthews@illinois.edu	f	t	2019-07-30 18:30:22.242954-05	t	f
162	pbkdf2_sha256$150000$BqC0mLPNGLjU$1u9S9o4EXjgdqryhSJ4n/J9vp5i9GQC+Ispg8OyGHB4=	\N	f	Cordova	Cordova	Saniyah	Cordova@illinois.edu	f	t	2019-07-30 18:30:22.311035-05	t	f
163	pbkdf2_sha256$150000$77Hiy9KxSfGo$NLOXInd9yT5C6rtDNnVSx9Ao9ATVQOL9f6qGthXFhyw=	\N	f	James	James	Sophie	James@illinois.edu	f	t	2019-07-30 18:30:22.380521-05	t	f
164	pbkdf2_sha256$150000$T2lzi31CX39C$pl3gefS7YxBihJafqI39mZ27zAFtUb3963jSZJFM+6M=	\N	f	Mckee	Mckee	Caitlin	Mckee@illinois.edu	f	t	2019-07-30 18:30:22.448388-05	t	f
165	pbkdf2_sha256$150000$KF2A9FOQRNjS$lL5sutuuTqMjdSEfRvQrUw1Zo952yJkG8af7SwyWJ2E=	\N	f	Reilly	Reilly	Daisy	Reilly@illinois.edu	f	t	2019-07-30 18:30:22.517629-05	t	f
166	pbkdf2_sha256$150000$xT1wR67yxnwN$pX9q3jDmRWoCsxt5npJXnD6m+X0d67ugx1xtNqGzEIo=	\N	f	Reese	Reese	Kara	Reese@illinois.edu	f	t	2019-07-30 18:30:22.585893-05	t	f
167	pbkdf2_sha256$150000$sHRMEZBULc1J$+oxhiaIPOcQB4mvCDMaom5PhspIc2KCzkB6gxZ3bXt4=	\N	f	Abbott	Abbott	Salma	Abbott@illinois.edu	f	t	2019-07-30 18:30:22.655505-05	t	f
168	pbkdf2_sha256$150000$Bc87BQwZu3gR$s5GHQMuVRSmQ9KFj0cWfmTx+z1vZf/vhzv7Oo7Gfdog=	\N	f	Huff	Huff	Addison	Huff@illinois.edu	f	t	2019-07-30 18:30:22.723169-05	t	f
169	pbkdf2_sha256$150000$iTqbdsWg76e6$C3rzR0n4fuvpUGJv2P0uavlk/EIOmONpuycA7IY+SzI=	\N	f	Manning	Manning	Taliyah	Manning@illinois.edu	f	t	2019-07-30 18:30:22.792325-05	t	f
170	pbkdf2_sha256$150000$DRLHo4fs3Mol$3/IgEb1/B7T644SySjq37uTwwrwOCNchd+XoMCNeQcU=	\N	f	Patton	Patton	Laci	Patton@illinois.edu	f	t	2019-07-30 18:30:22.859917-05	t	f
171	pbkdf2_sha256$150000$xJ45UAhU99JO$SQ1/TjzGF3bONPY6/aTgSV/PRHG82nI53bO1u9vCtqM=	\N	f	Nicholson	Nicholson	Jacquelyn	Nicholson@illinois.edu	f	t	2019-07-30 18:30:22.930267-05	t	f
172	pbkdf2_sha256$150000$Ub1HA6hhjrbj$ISJd0U9hVDruKYdh+WICeV9eaowaIlDeeNhL/dCa3uY=	\N	f	Kelley	Kelley	Brittany	Kelley@illinois.edu	f	t	2019-07-30 18:30:22.998518-05	t	f
173	pbkdf2_sha256$150000$JMJb4kFfidN1$yQNCIf8YZJ8SG0jsSOz8i94nc8LVF/HuUFDNOj/yCz8=	\N	f	Figueroa	Figueroa	Alicia	Figueroa@illinois.edu	f	t	2019-07-30 18:30:23.067358-05	t	f
174	pbkdf2_sha256$150000$0GOfMsIvfbJF$+0akqaJvJzPjWxFjMfoQASGjeFDizncmq/t5+Nae4fY=	\N	f	Thompson	Thompson	Scarlett	Thompson@illinois.edu	f	t	2019-07-30 18:30:23.135193-05	t	f
175	pbkdf2_sha256$150000$tziotx8dMySR$BZ8tmRO8RWsBszJVstThwTFWGqWQOSrBIhECFKy2Qs4=	\N	f	Guerrero	Guerrero	Julia	Guerrero@illinois.edu	f	t	2019-07-30 18:30:23.204008-05	t	f
176	pbkdf2_sha256$150000$Fa8PRfBxzvSQ$Rq92iLPgzlzQbiJv7BjDLV311sxu2ORIN5uYNZIV3gE=	\N	f	Thornton	Thornton	Mylie	Thornton@illinois.edu	f	t	2019-07-30 18:30:23.272444-05	t	f
177	pbkdf2_sha256$150000$Thcpf1XxzyXh$YGpBxtKaAvEVVXl/FGEvvspS6e1rL7tqfVl41/Mw+KU=	\N	f	Frazier	Frazier	Abril	Frazier@illinois.edu	f	t	2019-07-30 18:30:23.340854-05	t	f
178	pbkdf2_sha256$150000$yptTgOnHDvti$BECkuuzMyBSrmr6Ept7uxJZNyYvInzPjsSxzblNqAAI=	\N	f	Dougherty	Dougherty	Cassidy	Dougherty@illinois.edu	f	t	2019-07-30 18:30:23.409538-05	t	f
179	pbkdf2_sha256$150000$PjM33n5MQXKt$ItgAmrUDgtKqgztcSC1NyyPcshpv6wrL/8c4y5umwCg=	\N	f	Monroe	Monroe	Alivia	Monroe@illinois.edu	f	t	2019-07-30 18:30:23.478518-05	t	f
180	pbkdf2_sha256$150000$lyLFTi6Nc78L$SQFn3Nif8K4Vyy4GJcUwCkaHGocTAo2AQG5/LRVAlnE=	\N	f	Welch	Welch	Maya	Welch@illinois.edu	f	t	2019-07-30 18:30:23.54909-05	t	f
181	pbkdf2_sha256$150000$jqENDn5CtRlD$yBixYLub65qTCvLjrfsBZ+gZBqHh2DoKpp9o5l/qL9Q=	\N	f	Montgomery	Montgomery	Marisol	Montgomery@illinois.edu	f	t	2019-07-30 18:30:23.619145-05	t	f
182	pbkdf2_sha256$150000$bC0JYSfrEDKj$GK76YdLHVTaQ4Bf2aW0bClk9d7wQcxBkPs7SxeBJ1pg=	\N	f	Brandt	Brandt	Kiley	Brandt@illinois.edu	f	t	2019-07-30 18:30:23.688108-05	t	f
183	pbkdf2_sha256$150000$yriYqkXjTlpZ$kv5WGZHj+igRb4MBPjPv86NxGI9XAD9xoxtaJoowxZQ=	\N	f	Vaughn	Vaughn	Mollie	Vaughn@illinois.edu	f	t	2019-07-30 18:30:23.756578-05	t	f
184	pbkdf2_sha256$150000$vTFYQD6CNiNI$K7RhgK09wEgMdN1VAaDRpFB7Pi2Ty3t1OdYnEAru7TY=	\N	f	Cowan	Cowan	Bria	Cowan@illinois.edu	f	t	2019-07-30 18:30:23.824294-05	t	f
185	pbkdf2_sha256$150000$DFYS1zdgErkt$wML40rPOHFR5rc6+TKE3kEVWdG2MTloUkGPrOnsNOKg=	\N	f	Potter	Potter	Allyson	Potter@illinois.edu	f	t	2019-07-30 18:30:23.894936-05	t	f
186	pbkdf2_sha256$150000$wOCP1HeIg1tA$0zXGayfCvWLXR39oXUVIKiwu1v/c4yZIM5lfMxpZOJ8=	\N	f	Callahan	Callahan	Yasmine	Callahan@illinois.edu	f	t	2019-07-30 18:30:23.965482-05	t	f
187	pbkdf2_sha256$150000$JKKX4psWTMfH$+xb/L2THUM+LVndh8YhumOvBXtuCIkPdtmyWik7oOZk=	\N	f	Irwin	Irwin	Lauren	Irwin@illinois.edu	f	t	2019-07-30 18:30:24.035039-05	t	f
188	pbkdf2_sha256$150000$Un4MVYKh1Tzc$ZlNkOYEaz/XZw4dVWfPdviwQZvtkd8ICbEjFlohuaLQ=	\N	f	Dodson	Dodson	Mercedes	Dodson@illinois.edu	f	t	2019-07-30 18:30:24.10239-05	t	f
189	pbkdf2_sha256$150000$RSiwvqzq0gGM$DSXDr8FSsLQ07SgLrNnKjc6+VTrCXPO7BEvM+wecv/Q=	\N	f	Carson	Carson	Litzy	Carson@illinois.edu	f	t	2019-07-30 18:30:24.17176-05	t	f
190	pbkdf2_sha256$150000$MaMoy0YIPxaG$vOspdlQXXcR80rYm0m3skKwAV1Ajr44PkKE2Z4PjeXQ=	\N	f	Mason	Mason	Anabella	Mason@illinois.edu	f	t	2019-07-30 18:30:24.240362-05	t	f
191	pbkdf2_sha256$150000$E3kCvo6EtMkR$NfF899016GAjLvIIvhAA8cT9mPs5gDT6ztzwFJTbKdw=	\N	f	Murillo	Murillo	Kaelyn	Murillo@illinois.edu	f	t	2019-07-30 18:30:24.309559-05	t	f
192	pbkdf2_sha256$150000$1PsnSw7ghAmB$qGnNjJIi9mAZ9negitT/3lwFCYsFcBo4w9umjiFVLD8=	\N	f	Burch	Burch	Mary	Burch@illinois.edu	f	t	2019-07-30 18:30:24.377709-05	t	f
193	pbkdf2_sha256$150000$TpdPuiT4K3MR$mrEoaA9//qoEceOeE+x/irz9w3k/Ymeyog9OkjKjoog=	\N	f	Donaldson	Donaldson	Lizbeth	Donaldson@illinois.edu	f	t	2019-07-30 18:30:24.446285-05	t	f
194	pbkdf2_sha256$150000$dlarR0BOpKmo$oLl20T28UAE/FTciVMTZpfKnk+wvTpuoKa1IrviYZUk=	\N	f	Henderson	Henderson	Brooke	Henderson@illinois.edu	f	t	2019-07-30 18:30:24.514124-05	t	f
195	pbkdf2_sha256$150000$bPKHDGsQdaW4$zduqlr4YMn5RHXq+KGZQDZztNrkgGZfYWOG7BNNrS+k=	\N	f	Wall	Wall	Jayla	Wall@illinois.edu	f	t	2019-07-30 18:30:24.583416-05	t	f
196	pbkdf2_sha256$150000$YPq5UlhpmSXk$MIMvhXPhrWn96VzUjuAZ5m6zkWJOwiSQwKwiKS7hlPE=	\N	f	Tyler	Tyler	Ada	Tyler@illinois.edu	f	t	2019-07-30 18:30:24.650916-05	t	f
197	pbkdf2_sha256$150000$jPoDE2UOWfb9$tHHPWlsSxl+tXr07Veavu3H3O3NEyiNnodr3u4t/u/s=	\N	f	Kemp	Kemp	Dayami	Kemp@illinois.edu	f	t	2019-07-30 18:30:24.719912-05	t	f
198	pbkdf2_sha256$150000$MYWMRPFTgqM4$Jw97UATwRyTH2tIFJSDKBwgth23DPw0+3bj5G8LHstA=	\N	f	Dennis	Dennis	Carly	Dennis@illinois.edu	f	t	2019-07-30 18:30:24.787524-05	t	f
199	pbkdf2_sha256$150000$2v8c075ue9D9$zr3Ljk2NhiijhtTrUkx1Bcc1BgZ3hI1eR5+XdmLdQNg=	\N	f	Krueger	Krueger	Jasmin	Krueger@illinois.edu	f	t	2019-07-30 18:30:24.855959-05	t	f
200	pbkdf2_sha256$150000$b34reEYFG6Yh$eBo9OctdhdzN1mH4HADOwCFCh5ND8nztYMTpRYxd4Do=	\N	f	Baldwin	Baldwin	Skylar	Baldwin@illinois.edu	f	t	2019-07-30 18:30:24.92492-05	t	f
201	pbkdf2_sha256$150000$2l7y4B2tsVuj$dYI/fZRGMvIRzbJ3tmX7OY9nUG1OdiP23pRoJY8JSCs=	\N	f	Arroyo	Arroyo	Kiara	Arroyo@illinois.edu	f	t	2019-07-30 18:30:24.994636-05	t	f
202	pbkdf2_sha256$150000$fZGZy0HclatI$EQW+l4aWaHnuHo6zn0TJL/ZyTha0U4cOx/Q/7K2DSJE=	\N	f	Jensen	Jensen	Bailee	Jensen@illinois.edu	f	t	2019-07-30 18:30:25.065656-05	t	f
203	pbkdf2_sha256$150000$DpL826jL4vsU$faGOQJKcmLKrW4nsBVt7TiNLS0NuI6nVO4LbgeBQOo0=	\N	f	Austin	Austin	Olive	Austin@illinois.edu	f	t	2019-07-30 18:30:25.135504-05	t	f
204	pbkdf2_sha256$150000$HnUlUOtqfy8p$ICq7VozMZerR2XxHKxurBqLKZCfdJjckGWMrykaUqJc=	\N	f	Lin	Lin	Annabelle	Lin@illinois.edu	f	t	2019-07-30 18:30:25.203437-05	t	f
205	pbkdf2_sha256$150000$Kx0rnsdASlnS$V+3FmG74BBpeBSBCaTTKn9VA2qZVXGJi59oRFZAL9v8=	\N	f	Holland	Holland	Annika	Holland@illinois.edu	f	t	2019-07-30 18:30:25.272345-05	t	f
206	pbkdf2_sha256$150000$vDh1dAj542d3$iGIdFPF7HaChJoZXwQ94rv4E8WvwtzuZTgwwazX0soc=	\N	f	Roach	Roach	Ayana	Roach@illinois.edu	f	t	2019-07-30 18:30:25.339892-05	t	f
207	pbkdf2_sha256$150000$ptTGudhRIVza$/wuCa2+3amY0kHphRaadLerMvJ1yKyJ+h2jsIAmZp8E=	\N	f	Terry	Terry	Virginia	Terry@illinois.edu	f	t	2019-07-30 18:30:25.409086-05	t	f
208	pbkdf2_sha256$150000$WJI1nCCQahYh$0FxDnKs2YWL+iFCR0SQ0EarDHwe17Mel8ZVdNn+V7d0=	\N	f	Rosario	Rosario	Madilynn	Rosario@illinois.edu	f	t	2019-07-30 18:30:25.477657-05	t	f
209	pbkdf2_sha256$150000$xvlGzD68XEYd$Mbzl2YUUnSGgPg0qZd2wGxTf0FAPyQwGxNJ9dWjFETs=	\N	f	Khan	Khan	Reyna	Khan@illinois.edu	f	t	2019-07-30 18:30:25.546672-05	t	f
210	pbkdf2_sha256$150000$ssBPCvsVztEJ$xuTooz1rv4kYljk4nNg6SRJt5CBO4zWM5ppmkpxoTqI=	\N	f	Hawkins	Hawkins	Claudia	Hawkins@illinois.edu	f	t	2019-07-30 18:30:25.615063-05	t	f
211	pbkdf2_sha256$150000$7xEeiP5D911M$tYHB5hvV2z++B/RcSB72Ce9fmL1vxeggYswIfbaZjzA=	\N	f	Boyle	Boyle	Layla	Boyle@illinois.edu	f	t	2019-07-30 18:30:25.684595-05	t	f
212	pbkdf2_sha256$150000$QG9qB3FhOHdL$jUBN/DYWGsfT3pxaxsmd4um0l8DtFY3S8nT+jFpRSO8=	\N	f	Oneal	Oneal	Kaley	Oneal@illinois.edu	f	t	2019-07-30 18:30:25.75246-05	t	f
213	pbkdf2_sha256$150000$IJRigGtK9yJm$lq0445KeCdlvLP39QhmAblsNuXT7I3ji3PJEQX+K34c=	\N	f	Morris	Morris	Joslyn	Morris@illinois.edu	f	t	2019-07-30 18:30:25.821074-05	t	f
214	pbkdf2_sha256$150000$y6CYNWeqlft1$uI7k5rXF5OSXdwGO9FWKyvQOOwg9iSl7tpQOuPNnfzg=	\N	f	Summers	Summers	Kamora	Summers@illinois.edu	f	t	2019-07-30 18:30:25.889296-05	t	f
215	pbkdf2_sha256$150000$HEnaIrUye3TD$r5PINPbTzAscym+3/qRRNs+Oxv0ydh3plQg+1V9HdQM=	\N	f	Dominguez	Dominguez	Luciana	Dominguez@illinois.edu	f	t	2019-07-30 18:30:25.959867-05	t	f
216	pbkdf2_sha256$150000$wLI0mFREUIMb$W4U9K9/u5pgxY2zPTLkpDfr2tTnyGsdojF0CbzbW8k8=	\N	f	Ross	Ross	Brooklynn	Ross@illinois.edu	f	t	2019-07-30 18:30:26.029642-05	t	f
217	pbkdf2_sha256$150000$mPhd2oQToXYe$EK6x/wNdL59dN5+iu7+txqGRqtZShi2DoEExQ69SFXM=	\N	f	Howe	Howe	Roselyn	Howe@illinois.edu	f	t	2019-07-30 18:30:26.099374-05	t	f
218	pbkdf2_sha256$150000$mhYaVLSXktV7$jhukkbFD9/OskHNj3wTiZ4H+pfrgah7JfjY442Eqf0E=	\N	f	Mann	Mann	Ariana	Mann@illinois.edu	f	t	2019-07-30 18:30:26.169229-05	t	f
219	pbkdf2_sha256$150000$VObc26V3gSKE$HCjFfTVAOnOwue3qJ9CpjYdFqliYx5uxfIlH5zeTCDs=	\N	f	Powell	Powell	Avery	Powell@illinois.edu	f	t	2019-07-30 18:30:26.24991-05	t	f
220	pbkdf2_sha256$150000$gWyLEMrTmxt0$vLOqpedB/28ZkdRXNb7GM7YBba7NEyghF+k9LGG6jQA=	\N	f	Vaughan	Vaughan	Bridget	Vaughan@illinois.edu	f	t	2019-07-30 18:30:26.319549-05	t	f
221	pbkdf2_sha256$150000$w4ijjy2LSdqr$0d2W2ZHA6RlvS+LuMDGN4gyJqzramSfv5KQF4OeBDIs=	\N	f	Best	Best	Jayda	Best@illinois.edu	f	t	2019-07-30 18:30:26.401055-05	t	f
222	pbkdf2_sha256$150000$BFvcw8k1kyUZ$2EMnAtTE75NBrqRnT/lMXL3xITcH3HCT5lvfTQcCWmY=	\N	f	Cooley	Cooley	Isabelle	Cooley@illinois.edu	f	t	2019-07-30 18:30:26.469711-05	t	f
223	pbkdf2_sha256$150000$mmvywBnNMfOT$437/pqpW6J446unjhIyqdYGpsfDgwGErthXI7QrsKZg=	\N	f	Rice	Rice	Jasmine	Rice@illinois.edu	f	t	2019-07-30 18:30:26.549308-05	t	f
224	pbkdf2_sha256$150000$MKx52dmvEZKY$TfXWDSVbJHuD7gHV2m4eSLbcmxCCqIDXJqo7UzAx65A=	\N	f	Goodman	Goodman	Nia	Goodman@illinois.edu	f	t	2019-07-30 18:30:26.618172-05	t	f
225	pbkdf2_sha256$150000$9JfWhDAYf3r7$0iIpnAycTyhn3fwbDZgGyXIC1BE2h20AmGOdF3ncQX8=	\N	f	Velez	Velez	Genesis	Velez@illinois.edu	f	t	2019-07-30 18:30:26.689785-05	t	f
226	pbkdf2_sha256$150000$xt15itqVpbMC$yl3Pv1xfc/vIOcQM8c58I0fXMHEUp3uMzB6h592dBF4=	\N	f	Gates	Gates	Amber	Gates@illinois.edu	f	t	2019-07-30 18:30:26.757955-05	t	f
227	pbkdf2_sha256$150000$DoTIjqVP4hyZ$Hj3lkWPKlcMFgroxtWhOfWdpsi3TxlcKRJEn7oXe1S0=	\N	f	Madden	Madden	Maritza	Madden@illinois.edu	f	t	2019-07-30 18:30:26.826595-05	t	f
228	pbkdf2_sha256$150000$dsF1mKYmYwev$dm/qYmbargItYxWjQ1yP1/+r1JUip0WoEIYMzGPZlPw=	\N	f	Haynes	Haynes	Jazlene	Haynes@illinois.edu	f	t	2019-07-30 18:30:26.89499-05	t	f
229	pbkdf2_sha256$150000$mX2ovZ8QK5bc$Vv+n9FxyKGzzmZjPIVID+hZ9VP44eojfxtvqrLS0Ohs=	\N	f	Sanders	Sanders	Kiera	Sanders@illinois.edu	f	t	2019-07-30 18:30:26.966144-05	t	f
230	pbkdf2_sha256$150000$2zTmCiXhtvZ5$5l95KAEoEN5Yx+tJBuRQ2oiW++DXTrYKGX8mlC8B2eo=	\N	f	Dixon	Dixon	Kaylah	Dixon@illinois.edu	f	t	2019-07-30 18:30:27.035201-05	t	f
231	pbkdf2_sha256$150000$gOSZbppCFLIP$sNEFe5HnbnlPiRLmeuv0itZno38iu+swprKZRtjqh0Q=	\N	f	Briggs	Briggs	Itzel	Briggs@illinois.edu	f	t	2019-07-30 18:30:27.104823-05	t	f
232	pbkdf2_sha256$150000$kcZvWzWLaJE9$c2FhBUWAV1QZqffVmXC66Eyc0CZAebKzW+nkLnUW4nI=	\N	f	Wilkerson	Wilkerson	Charity	Wilkerson@illinois.edu	f	t	2019-07-30 18:30:27.173275-05	t	f
233	pbkdf2_sha256$150000$H6nDQNqcpbTP$TtHkzpTxUa2DHRo/8YvLYVj+zlqb9lKY2clZ9ka9tvI=	\N	f	Brock	Brock	Monserrat	Brock@illinois.edu	f	t	2019-07-30 18:30:27.242788-05	t	f
234	pbkdf2_sha256$150000$6zd4IKNXRkaK$XAnFbOcM9tk4Po+Xpqws0EXkwiWDYFRizCoSkKyL5Gs=	\N	f	Key	Key	Dayana	Key@illinois.edu	f	t	2019-07-30 18:30:27.31118-05	t	f
235	pbkdf2_sha256$150000$8PU9X60bhJ8M$OwEqIBSEP6Fq8Nr9KCUJSSoz1QMOd+6wC3QCe5ymlc4=	\N	f	Barron	Barron	Gabrielle	Barron@illinois.edu	f	t	2019-07-30 18:30:27.380942-05	t	f
236	pbkdf2_sha256$150000$yUWF08Ct5xY0$fuR6BdybP+Ai7IRkczzwd2s1ru02XIjUm7xdR8up4o0=	\N	f	Whitaker	Whitaker	Lena	Whitaker@illinois.edu	f	t	2019-07-30 18:30:27.449587-05	t	f
237	pbkdf2_sha256$150000$6Hp3tDLQPQPd$0+kbcytEoo5KvjmC01uAXu8BwCnBZqRuVJMT7KnbnlQ=	\N	f	Harrison	Harrison	Helen	Harrison@illinois.edu	f	t	2019-07-30 18:30:27.51888-05	t	f
238	pbkdf2_sha256$150000$RIx6coRmtgdh$E/VXb8Suduw5b7cf91YdNA5LjvNHXxQQGKQmKk7MMZU=	\N	f	Carpenter	Carpenter	Damaris	Carpenter@illinois.edu	f	t	2019-07-30 18:30:27.588771-05	t	f
239	pbkdf2_sha256$150000$ouvbMInqOWXW$IkFM71ZD7wIi+/XI4bTP9pryRWUO46kv6+AjoX3cxbQ=	\N	f	Espinoza	Espinoza	Lacey	Espinoza@illinois.edu	f	t	2019-07-30 18:30:27.659289-05	t	f
240	pbkdf2_sha256$150000$gmSBhR1Uko6e$mNfndkQCg2EuKMuUMFN644XdPQAD8+1XRsVAdbtihSc=	\N	f	Fernandez	Fernandez	Daniella	Fernandez@illinois.edu	f	t	2019-07-30 18:30:27.727315-05	t	f
241	pbkdf2_sha256$150000$dunvE9NkNkT9$pjkdGi8Fdd8nlKF3HhYrZF3zgNQZJnpGdFFhmahdfkg=	\N	f	Vargas	Vargas	Giovanna	Vargas@illinois.edu	f	t	2019-07-30 18:30:27.795801-05	t	f
242	pbkdf2_sha256$150000$0D4RR5eaQLop$obppvneQFRUQI0w2h91AV8f2O3XG3k3aiihuWu8MPXA=	\N	f	Perez	Perez	Ann	Perez@illinois.edu	f	t	2019-07-30 18:30:27.864157-05	t	f
243	pbkdf2_sha256$150000$omzZiG9hI1Bm$knyKFHo/kl306eQIU10Z143hlZkEKUOfzXLJxvKyXSo=	\N	f	Lawson	Lawson	Marissa	Lawson@illinois.edu	f	t	2019-07-30 18:30:27.934789-05	t	f
244	pbkdf2_sha256$150000$9Xr5MbBlbo5V$DA+qqajuJKe54qbbFa4/UjP0M8KfwhuI0tzbS9AaE4s=	\N	f	David	David	Camryn	David@illinois.edu	f	t	2019-07-30 18:30:28.00262-05	t	f
245	pbkdf2_sha256$150000$Q4M3Q0ig2jLs$IgmOWvf8QbKCXLx7TDGKU68900xDMtD9pXaBpl0rvAg=	\N	f	Williamson	Williamson	Jimena	Williamson@illinois.edu	f	t	2019-07-30 18:30:28.071637-05	t	f
246	pbkdf2_sha256$150000$QuP2iWwiWeKI$T05lR5SiNkkumm3LBcVO7Te4bQtDM7oLCXttiwNCxbg=	\N	f	Blankenship	Blankenship	Areli	Blankenship@illinois.edu	f	t	2019-07-30 18:30:28.14094-05	t	f
247	pbkdf2_sha256$150000$fgPGsFNyQ0X6$M8t918IUFJRYMtP4I4WUWNELPsr77vErzpYAZal+rSQ=	\N	f	Burnett	Burnett	Mckayla	Burnett@illinois.edu	f	t	2019-07-30 18:30:28.210006-05	t	f
248	pbkdf2_sha256$150000$PAa4NyArVmkj$cTgCMXelxKGE4EfS5OFJRWQxiLjfVlsODi9fwCau41Y=	\N	f	Gill	Gill	Mattie	Gill@illinois.edu	f	t	2019-07-30 18:30:28.278442-05	t	f
249	pbkdf2_sha256$150000$fSd2LxfVAua5$3r+SPjrgaL8u/h2CiHF8z18gtWo7SjlKgHvOFFX7suA=	\N	f	Marsh	Marsh	Paityn	Marsh@illinois.edu	f	t	2019-07-30 18:30:28.347514-05	t	f
250	pbkdf2_sha256$150000$SONstSIdxu7e$JHGUygXPcuro6MBURB3UNPctJf10XcoBLgijC+dMRUA=	\N	f	Wolf	Wolf	Alana	Wolf@illinois.edu	f	t	2019-07-30 18:30:28.415679-05	t	f
251	pbkdf2_sha256$150000$NHeh7xDmtiao$NdoDQgOv8MWc+FWbOi/Sajr/zN6epAa+qyyLbJzA07E=	\N	f	Massey	Massey	Kaylen	Massey@illinois.edu	f	t	2019-07-30 18:30:28.485031-05	t	f
252	pbkdf2_sha256$150000$haFUNpHABalR$6raUjLvcYnnAx+Xy8SRk2ToX/40irazBkvNkSM+dx3I=	\N	f	Horne	Horne	Jillian	Horne@illinois.edu	f	t	2019-07-30 18:30:28.553334-05	t	f
253	pbkdf2_sha256$150000$Qu3ot1de0sMd$dhKZgbZtCusMvshwidyVylT1YFd26/z/sj3W08UpPO4=	\N	f	Kelly	Kelly	Patience	Kelly@illinois.edu	f	t	2019-07-30 18:30:28.622807-05	t	f
254	pbkdf2_sha256$150000$XdZdPX5c1Ain$OV7h8tQTcQk3Ze65ds642mK2VUKfKmlS4N1e8sIRS1M=	\N	f	Oconnell	Oconnell	Taniyah	Oconnell@illinois.edu	f	t	2019-07-30 18:30:28.691431-05	t	f
255	pbkdf2_sha256$150000$ZXiiA0nDMydc$S1CNPW+bpm8q5xd7aoU2ecI+oB0rxozmkBMJsRHwHGo=	\N	f	Lane	Lane	Annabel	Lane@illinois.edu	f	t	2019-07-30 18:30:28.760756-05	t	f
256	pbkdf2_sha256$150000$Ufr0fpv4fRjv$JaxxODjH+nueFLYqgDlRmR5yJRqvpYAkoD7X3OqDPn8=	\N	f	Villa	Villa	Kamari	Villa@illinois.edu	f	t	2019-07-30 18:30:28.82919-05	t	f
257	pbkdf2_sha256$150000$LVn3BTb76s1Q$neCRUGeQDqK7hu1pvthtCBK1IhnBUIRphPcek82T9RE=	\N	f	Schneider	Schneider	Rubi	Schneider@illinois.edu	f	t	2019-07-30 18:30:28.898749-05	t	f
258	pbkdf2_sha256$150000$fHCwnQfbwSuD$qmkvCO1wCKT3LcN6ie50W/UuEpuA5C+3jv9Spy/kVQU=	\N	f	Watts	Watts	Kaleigh	Watts@illinois.edu	f	t	2019-07-30 18:30:28.968344-05	t	f
259	pbkdf2_sha256$150000$ZUOy4iwafD4J$OPwaCehxYFEQxTdccM1CMM8/sUlgARD49IBbK/PrdQk=	\N	f	Duffy	Duffy	Evelyn	Duffy@illinois.edu	f	t	2019-07-30 18:30:29.037332-05	t	f
260	pbkdf2_sha256$150000$kisxMfCUeH2y$jPGJ9MJMTFoX1uy1vKMmM8wC/BgowMgEkjOkO3aszC4=	\N	f	Joyce	Joyce	Milagros	Joyce@illinois.edu	f	t	2019-07-30 18:30:29.10552-05	t	f
261	pbkdf2_sha256$150000$EpDbUewXgatY$xfZGPgUA13D9IMRqnT0/fXD+UAOMnllbr7SFxzS00rQ=	\N	f	Gilmore	Gilmore	Janiyah	Gilmore@illinois.edu	f	t	2019-07-30 18:30:29.174957-05	t	f
262	pbkdf2_sha256$150000$8lPegX5PIeT6$e7ffTeDuUYLSg0Kk26ZFBwwW/0ftQjvyD79Lb+9YaYY=	\N	f	Ruiz	Ruiz	Yadira	Ruiz@illinois.edu	f	t	2019-07-30 18:30:29.242899-05	t	f
263	pbkdf2_sha256$150000$IpUyjxcs6WS9$HEHVIxk66yNmVtcQHUQF6aQp8ML5n8zMdUiWGZsv2po=	\N	f	Ibarra	Ibarra	Jaslyn	Ibarra@illinois.edu	f	t	2019-07-30 18:30:29.311383-05	t	f
264	pbkdf2_sha256$150000$jdBZFSImOQaf$n22LN2wiZ+Rzxj6KPP5WiZB1s8oeH4pO9H+YRpG4T+M=	\N	f	Wagner	Wagner	Taylor	Wagner@illinois.edu	f	t	2019-07-30 18:30:29.379645-05	t	f
265	pbkdf2_sha256$150000$gmH9XFhEENOu$6DlLZjkjt5/YRMIAGhWsHQRnreX2n10FwzGYSFQ7CYs=	\N	f	Calderon	Calderon	Hallie	Calderon@illinois.edu	f	t	2019-07-30 18:30:29.447581-05	t	f
266	pbkdf2_sha256$150000$zCJ1eUzL27UB$5ssIs0mNzrgUVBYSti6JWZdbmz0UJ1fD2jUIcz6SKTQ=	\N	f	Galvan	Galvan	Daphne	Galvan@illinois.edu	f	t	2019-07-30 18:30:29.515262-05	t	f
267	pbkdf2_sha256$150000$M8s0UaYeKVtl$x+MtygqUGpJZ1GxVHX2SQaqh8KBaNpc+iyYokhbZjms=	\N	f	Barton	Barton	Sanai	Barton@illinois.edu	f	t	2019-07-30 18:30:29.584472-05	t	f
268	pbkdf2_sha256$150000$jS9ZrWyB7yod$Rp8dcAqIUpENxnTvP2lQmjf6PD45L0wbU+D03wivGWQ=	\N	f	Hahn	Hahn	Jane	Hahn@illinois.edu	f	t	2019-07-30 18:30:29.652815-05	t	f
269	pbkdf2_sha256$150000$EwC21BJqThYK$YaDx08A+l479XPKEkLSsTiS4Oz0FYtRFEo+nZCf5C+A=	\N	f	Kramer	Kramer	Annabella	Kramer@illinois.edu	f	t	2019-07-30 18:30:29.721131-05	t	f
270	pbkdf2_sha256$150000$7haCu8ZiUlM1$pctBDWWU1Gag9jk8aBKKOOI9pj7WbwPFcAMmPCW/msA=	\N	f	Peterson	Peterson	Tessa	Peterson@illinois.edu	f	t	2019-07-30 18:30:29.788884-05	t	f
271	pbkdf2_sha256$150000$ryo1vdD88E6Q$c1ST3jo7mPWtI8JCWHp0MbUPX8QTA9+0uZt3AhRHmYk=	\N	f	Sellers	Sellers	Margaret	Sellers@illinois.edu	f	t	2019-07-30 18:30:29.857216-05	t	f
272	pbkdf2_sha256$150000$Ufi1WXB6gjnp$y9KgVe19VHD4Ot/Qpa7kqVbrtnCAK1WbTN4bxEG0Nyc=	\N	f	Carey	Carey	Mya	Carey@illinois.edu	f	t	2019-07-30 18:30:29.926092-05	t	f
273	pbkdf2_sha256$150000$BLWRbJLkwqJc$ZtDBLulMd0oHnKznxogquUwQRYHlW/BGyikw9VPa9dg=	\N	f	Ponce	Ponce	Shyla	Ponce@illinois.edu	f	t	2019-07-30 18:30:29.995574-05	t	f
274	pbkdf2_sha256$150000$qsYQEgxTTUDd$dNM5nu9So7r+aGkOxHLD8LwGTEfU0dETi+xkJq0KGLI=	\N	f	Waters	Waters	Kelly	Waters@illinois.edu	f	t	2019-07-30 18:30:30.064296-05	t	f
275	pbkdf2_sha256$150000$zK8TNIapSExx$0eo4dgZZT/QC45Me+FzruI1zFcqmPu/HqsMJ1ieCe6k=	\N	f	Gamble	Gamble	Lia	Gamble@illinois.edu	f	t	2019-07-30 18:30:30.132947-05	t	f
276	pbkdf2_sha256$150000$eDhyPSEogUQ3$gQ3mlDrQxprPMK73Sc3WfRxcSbXdp4jJ6V0rSHJEKbs=	\N	f	Higgins	Higgins	Kaila	Higgins@illinois.edu	f	t	2019-07-30 18:30:30.200753-05	t	f
277	pbkdf2_sha256$150000$QIbJDjQxITuX$pIzl45apEStz7p+7zRKsGh1iYszIOET8kTwnhKTzTlk=	\N	f	Spears	Spears	Alexa	Spears@illinois.edu	f	t	2019-07-30 18:30:30.269684-05	t	f
278	pbkdf2_sha256$150000$YSmmx32GJtIF$Td0GsBjpnjSsq3sP8tgbBrRIqu1bJYMDYUUL8N0891I=	\N	f	Zimmerman	Zimmerman	Christine	Zimmerman@illinois.edu	f	t	2019-07-30 18:30:30.337867-05	t	f
279	pbkdf2_sha256$150000$qMnAczjPgYol$OVCblg5whCAtCihH1Hf92sHs9nPE3fddHNdU7ESjZ6o=	\N	f	Hoffman	Hoffman	Nancy	Hoffman@illinois.edu	f	t	2019-07-30 18:30:30.406508-05	t	f
280	pbkdf2_sha256$150000$65QtJv2LgfPL$wQRF2OYLd4lZ9TOMkydw8JTSWQuJNvMXtMVAgPEry8g=	\N	f	Bridges	Bridges	Leila	Bridges@illinois.edu	f	t	2019-07-30 18:30:30.473799-05	t	f
281	pbkdf2_sha256$150000$nbD6JJmcMdDD$WxukUx+tab6en0nPCiNFidQr+gy9OfFgK8UldGfEnbg=	\N	f	Trujillo	Trujillo	Lana	Trujillo@illinois.edu	f	t	2019-07-30 18:30:30.54305-05	t	f
282	pbkdf2_sha256$150000$qUfOV9hvJcGM$dohAgbIuImrx7W5XQvU59urYDPjLm0v88AMQoaYiwwk=	\N	f	Holden	Holden	Cierra	Holden@illinois.edu	f	t	2019-07-30 18:30:30.61101-05	t	f
283	pbkdf2_sha256$150000$n4Vsnnxwfk6I$e9oQLR9ATd6aW9JrRUg6PqL0u0l31J/y1IhE5feayMw=	\N	f	Friedman	Friedman	Miracle	Friedman@illinois.edu	f	t	2019-07-30 18:30:30.679626-05	t	f
284	pbkdf2_sha256$150000$pJoaxKJq6kWc$u01rRPIZyKHiRcz2E7jEDPhlE0dG580GIX9wjeaBdmk=	\N	f	Sanford	Sanford	Charlee	Sanford@illinois.edu	f	t	2019-07-30 18:30:30.748063-05	t	f
285	pbkdf2_sha256$150000$Dbrj7sFf1YXU$YufgR7dgh/Q10fYXUmOeBigEL8O/n96u6jI+VUv1Omo=	\N	f	Murphy	Murphy	Valeria	Murphy@illinois.edu	f	t	2019-07-30 18:30:30.816657-05	t	f
286	pbkdf2_sha256$150000$LY29NYMsuWga$+bKBhsbp4SN4ssjcV6WnCUxaXT+/4PVGhBet+jCH14E=	\N	f	Orozco	Orozco	Reina	Orozco@illinois.edu	f	t	2019-07-30 18:30:30.884869-05	t	f
287	pbkdf2_sha256$150000$0dm9npi0yImp$J0/InN5F17cHsqEGY11X5ZYbJINzojm/jYy2bWkWpxk=	\N	f	Kidd	Kidd	Lilyana	Kidd@illinois.edu	f	t	2019-07-30 18:30:30.955029-05	t	f
288	pbkdf2_sha256$150000$MVz9UlWG9efK$D4CrcSjKY55GIR0R2l0Oym8D8eT7QOl5J4qJVzt19xI=	\N	f	Green	Green	Annalise	Green@illinois.edu	f	t	2019-07-30 18:30:31.023146-05	t	f
289	pbkdf2_sha256$150000$Anry5KGg7jQW$wQ6C4b46wPz0s3yrQ1BlXzj6YnMzj2QZYk28+9MCiDg=	\N	f	Stanley	Stanley	Madilyn	Stanley@illinois.edu	f	t	2019-07-30 18:30:31.091164-05	t	f
290	pbkdf2_sha256$150000$xQBx0eTQ8yrH$4XPmiAU12PLMWA3ExLCF2+pNtnGe/4mR80wDQte2zD8=	\N	f	Conrad	Conrad	Hayden	Conrad@illinois.edu	f	t	2019-07-30 18:30:31.162203-05	t	f
291	pbkdf2_sha256$150000$tayKIkjXpul8$COjXiZc6Rk42tQs3k9UJdyaB9SKRZkre3sKdzO8IiR4=	\N	f	Mccann	Mccann	Kaylie	Mccann@illinois.edu	f	t	2019-07-30 18:30:31.23223-05	t	f
292	pbkdf2_sha256$150000$XS1tbC1wvn4x$ocxru6iTruviFOiJt5lFDU/cpWjNyE1s8AiFSslWzhc=	\N	f	Knight	Knight	Laylah	Knight@illinois.edu	f	t	2019-07-30 18:30:31.299663-05	t	f
293	pbkdf2_sha256$150000$hwB0Bu4wJmxL$Gou/j04Pf49K7UH0VmG/XruuhPx0yxvq5u927lXRZD8=	\N	f	Wong	Wong	Tia	Wong@illinois.edu	f	t	2019-07-30 18:30:31.367713-05	t	f
294	pbkdf2_sha256$150000$hlDCIAwY9mq2$5BAoizi82F4T3R74msMDNwNTA70s6qFzZTphCWW72zw=	\N	f	Cisneros	Cisneros	Natalie	Cisneros@illinois.edu	f	t	2019-07-30 18:30:31.435013-05	t	f
295	pbkdf2_sha256$150000$kBbnqqwq6CzI$YQUlXKVyzjvhRhc0N4xeXw1vz86AOfjIrr0ZNbji5pU=	\N	f	Miller	Miller	Courtney	Miller@illinois.edu	f	t	2019-07-30 18:30:31.504783-05	t	f
296	pbkdf2_sha256$150000$MmRjAB230FNU$QPxNKJ1Dq5ZQPX6wsdhWrwrO6bTeoybgRfLOFg4Qvio=	\N	f	Mcintosh	Mcintosh	Isabela	Mcintosh@illinois.edu	f	t	2019-07-30 18:30:31.584781-05	t	f
297	pbkdf2_sha256$150000$0slfT1EYrKur$+zLZzpg2z70H85q9UNXrPqHiAbDUN6v4eCXKL2DiVBc=	\N	f	Archer	Archer	Kaya	Archer@illinois.edu	f	t	2019-07-30 18:30:31.654741-05	t	f
298	pbkdf2_sha256$150000$l6dms7ssFfho$kWbJ2GO9qB6ppk9WWhhhOzsKEpK+dYCw/wBg4/XkCaw=	\N	f	Rios	Rios	Jakayla	Rios@illinois.edu	f	t	2019-07-30 18:30:31.734131-05	t	f
299	pbkdf2_sha256$150000$2Y5NMCP4NNYK$RBSqjUki6ZenieLCzNTfbZfvPuPk+rC1z0+plhxoThg=	\N	f	Walls	Walls	Livia	Walls@illinois.edu	f	t	2019-07-30 18:30:31.80405-05	t	f
300	pbkdf2_sha256$150000$uFX3RTJq2bVm$17bQGtYp95/fCujDX6czj3japDlK6uJDCvm1E/ji7MA=	\N	f	Hodges	Hodges	Evie	Hodges@illinois.edu	f	t	2019-07-30 18:30:31.883947-05	t	f
301	pbkdf2_sha256$150000$XpxGpn3Ha4dd$aIXiESUcs0AiHd4yw7indKONeWEUQCqwNy1xX4rp7rc=	2019-07-30 18:32:16.993388-05	f	charlene	Charlene	Zheng	char@gmail.com	f	t	2019-07-30 18:32:11.453358-05	t	f
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);


--
-- Name: course_coursemember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_coursemember_id_seq', 1, false);


--
-- Name: course_coursestaff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_coursestaff_id_seq', 1, false);


--
-- Name: course_semester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_semester_id_seq', 1, false);


--
-- Name: course_skillstaught_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_skillstaught_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: project_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.project_project_id_seq', 1, false);


--
-- Name: project_skillrequired_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.project_skillrequired_id_seq', 1, false);


--
-- Name: stage_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stage_feedback_id_seq', 1, false);


--
-- Name: stage_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stage_task_id_seq', 1, false);


--
-- Name: team_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.team_membership_id_seq', 1, true);


--
-- Name: team_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.team_team_id_seq', 3, true);


--
-- Name: user_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_skill_id_seq', 1, false);


--
-- Name: user_skillset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_skillset_id_seq', 1, false);


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_user_groups_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_user_id_seq', 301, true);


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: course_course course_course_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_course
    ADD CONSTRAINT course_course_pkey PRIMARY KEY (crn);


--
-- Name: course_coursemember course_coursemember_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_coursemember
    ADD CONSTRAINT course_coursemember_pkey PRIMARY KEY (id);


--
-- Name: course_coursestaff course_coursestaff_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_coursestaff
    ADD CONSTRAINT course_coursestaff_pkey PRIMARY KEY (id);


--
-- Name: course_semester course_semester_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_semester
    ADD CONSTRAINT course_semester_pkey PRIMARY KEY (id);


--
-- Name: course_semester course_semester_year_semester_504014d9_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_semester
    ADD CONSTRAINT course_semester_year_semester_504014d9_uniq UNIQUE (year, semester);


--
-- Name: course_skillstaught course_skillstaught_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_skillstaught
    ADD CONSTRAINT course_skillstaught_pkey PRIMARY KEY (id);


--
-- Name: course_skillstaught course_skillstaught_skill_id_course_id_01450bdb_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_skillstaught
    ADD CONSTRAINT course_skillstaught_skill_id_course_id_01450bdb_uniq UNIQUE (skill_id, course_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: project_project project_project_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_project
    ADD CONSTRAINT project_project_pkey PRIMARY KEY (id);


--
-- Name: project_skillrequired project_skillrequired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_skillrequired
    ADD CONSTRAINT project_skillrequired_pkey PRIMARY KEY (id);


--
-- Name: project_skillrequired project_skillrequired_project_id_skill_id_65f1f184_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_skillrequired
    ADD CONSTRAINT project_skillrequired_project_id_skill_id_65f1f184_uniq UNIQUE (project_id, skill_id);


--
-- Name: stage_feedback stage_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stage_feedback
    ADD CONSTRAINT stage_feedback_pkey PRIMARY KEY (id);


--
-- Name: stage_task stage_task_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stage_task
    ADD CONSTRAINT stage_task_pkey PRIMARY KEY (id);


--
-- Name: team_membership team_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_membership
    ADD CONSTRAINT team_membership_pkey PRIMARY KEY (id);


--
-- Name: team_membership team_membership_student_id_project_id_course_id_765f375b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_membership
    ADD CONSTRAINT team_membership_student_id_project_id_course_id_765f375b_uniq UNIQUE (student_id, project_id, course_id);


--
-- Name: team_team team_team_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_team
    ADD CONSTRAINT team_team_pkey PRIMARY KEY (id);


--
-- Name: team_team team_team_project_id_captain_id_4c157a48_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_team
    ADD CONSTRAINT team_team_project_id_captain_id_4c157a48_uniq UNIQUE (project_id, captain_id);


--
-- Name: user_instructor user_instructor_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_instructor
    ADD CONSTRAINT user_instructor_email_key UNIQUE (email);


--
-- Name: user_instructor user_instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_instructor
    ADD CONSTRAINT user_instructor_pkey PRIMARY KEY (user_id);


--
-- Name: user_skill user_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_skill
    ADD CONSTRAINT user_skill_pkey PRIMARY KEY (id);


--
-- Name: user_skillset user_skillset_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_skillset
    ADD CONSTRAINT user_skillset_pkey PRIMARY KEY (id);


--
-- Name: user_skillset user_skillset_student_id_skill_id_3123578c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_skillset
    ADD CONSTRAINT user_skillset_student_id_skill_id_3123578c_uniq UNIQUE (student_id, skill_id);


--
-- Name: user_student user_student_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_student
    ADD CONSTRAINT user_student_email_key UNIQUE (email);


--
-- Name: user_student user_student_netid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_student
    ADD CONSTRAINT user_student_netid_key UNIQUE (netid);


--
-- Name: user_student user_student_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_student
    ADD CONSTRAINT user_student_pkey PRIMARY KEY (user_id);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_user_groups user_user_groups_user_id_group_id_bb60391f_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_group_id_bb60391f_uniq UNIQUE (user_id, group_id);


--
-- Name: user_user user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq UNIQUE (user_id, permission_id);


--
-- Name: user_user user_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: course_course_crn_ace7f6eb_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_course_crn_ace7f6eb_like ON public.course_course USING btree (crn varchar_pattern_ops);


--
-- Name: course_course_semester_id_8e985cbb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_course_semester_id_8e985cbb ON public.course_course USING btree (semester_id);


--
-- Name: course_coursemember_course_id_9b8acf20; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_coursemember_course_id_9b8acf20 ON public.course_coursemember USING btree (course_id);


--
-- Name: course_coursemember_course_id_9b8acf20_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_coursemember_course_id_9b8acf20_like ON public.course_coursemember USING btree (course_id varchar_pattern_ops);


--
-- Name: course_coursemember_student_id_043d0a71; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_coursemember_student_id_043d0a71 ON public.course_coursemember USING btree (student_id);


--
-- Name: course_coursestaff_course_id_66a406aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_coursestaff_course_id_66a406aa ON public.course_coursestaff USING btree (course_id);


--
-- Name: course_coursestaff_course_id_66a406aa_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_coursestaff_course_id_66a406aa_like ON public.course_coursestaff USING btree (course_id varchar_pattern_ops);


--
-- Name: course_coursestaff_instructor_id_4ad9ad9e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_coursestaff_instructor_id_4ad9ad9e ON public.course_coursestaff USING btree (instructor_id);


--
-- Name: course_skillstaught_course_id_d311002e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_skillstaught_course_id_d311002e ON public.course_skillstaught USING btree (course_id);


--
-- Name: course_skillstaught_course_id_d311002e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_skillstaught_course_id_d311002e_like ON public.course_skillstaught USING btree (course_id varchar_pattern_ops);


--
-- Name: course_skillstaught_skill_id_51844ebc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_skillstaught_skill_id_51844ebc ON public.course_skillstaught USING btree (skill_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: project_project_course_id_f987dcc7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX project_project_course_id_f987dcc7 ON public.project_project USING btree (course_id);


--
-- Name: project_project_course_id_f987dcc7_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX project_project_course_id_f987dcc7_like ON public.project_project USING btree (course_id varchar_pattern_ops);


--
-- Name: project_skillrequired_project_id_35cea8ed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX project_skillrequired_project_id_35cea8ed ON public.project_skillrequired USING btree (project_id);


--
-- Name: project_skillrequired_skill_id_eeb119c4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX project_skillrequired_skill_id_eeb119c4 ON public.project_skillrequired USING btree (skill_id);


--
-- Name: stage_feedback_grader_id_ccc6b818; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stage_feedback_grader_id_ccc6b818 ON public.stage_feedback USING btree (grader_id);


--
-- Name: stage_feedback_receiver_id_8eecdbca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stage_feedback_receiver_id_8eecdbca ON public.stage_feedback USING btree (receiver_id);


--
-- Name: stage_feedback_team_id_ed66c6a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stage_feedback_team_id_ed66c6a8 ON public.stage_feedback USING btree (team_id);


--
-- Name: stage_task_student_id_59707c81; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stage_task_student_id_59707c81 ON public.stage_task USING btree (student_id);


--
-- Name: stage_task_team_id_1e4ca675; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stage_task_team_id_1e4ca675 ON public.stage_task USING btree (team_id);


--
-- Name: team_membership_captain_id_800880b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_membership_captain_id_800880b1 ON public.team_membership USING btree (captain_id);


--
-- Name: team_membership_course_id_f0842a39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_membership_course_id_f0842a39 ON public.team_membership USING btree (course_id);


--
-- Name: team_membership_course_id_f0842a39_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_membership_course_id_f0842a39_like ON public.team_membership USING btree (course_id varchar_pattern_ops);


--
-- Name: team_membership_project_id_11c985b6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_membership_project_id_11c985b6 ON public.team_membership USING btree (project_id);


--
-- Name: team_membership_student_id_8dcf81c9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_membership_student_id_8dcf81c9 ON public.team_membership USING btree (student_id);


--
-- Name: team_membership_team_id_288dd2d1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_membership_team_id_288dd2d1 ON public.team_membership USING btree (team_id);


--
-- Name: team_team_captain_id_0b42c227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_team_captain_id_0b42c227 ON public.team_team USING btree (captain_id);


--
-- Name: team_team_course_id_78a5e67c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_team_course_id_78a5e67c ON public.team_team USING btree (course_id);


--
-- Name: team_team_course_id_78a5e67c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_team_course_id_78a5e67c_like ON public.team_team USING btree (course_id varchar_pattern_ops);


--
-- Name: team_team_project_id_ae0641e5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX team_team_project_id_ae0641e5 ON public.team_team USING btree (project_id);


--
-- Name: user_instructor_email_045a3d80_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_instructor_email_045a3d80_like ON public.user_instructor USING btree (email varchar_pattern_ops);


--
-- Name: user_skillset_skill_id_23dd2bda; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_skillset_skill_id_23dd2bda ON public.user_skillset USING btree (skill_id);


--
-- Name: user_skillset_student_id_120dbee5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_skillset_student_id_120dbee5 ON public.user_skillset USING btree (student_id);


--
-- Name: user_student_email_a6a25ec3_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_student_email_a6a25ec3_like ON public.user_student USING btree (email varchar_pattern_ops);


--
-- Name: user_student_netid_70f32bd9_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_student_netid_70f32bd9_like ON public.user_student USING btree (netid varchar_pattern_ops);


--
-- Name: user_user_groups_group_id_c57f13c0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_user_groups_group_id_c57f13c0 ON public.user_user_groups USING btree (group_id);


--
-- Name: user_user_groups_user_id_13f9a20d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_user_groups_user_id_13f9a20d ON public.user_user_groups USING btree (user_id);


--
-- Name: user_user_user_permissions_permission_id_ce49d4de; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_user_user_permissions_permission_id_ce49d4de ON public.user_user_user_permissions USING btree (permission_id);


--
-- Name: user_user_user_permissions_user_id_31782f58; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_user_user_permissions_user_id_31782f58 ON public.user_user_user_permissions USING btree (user_id);


--
-- Name: user_user_username_e2bdfe0c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_user_username_e2bdfe0c_like ON public.user_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_course course_course_semester_id_8e985cbb_fk_course_semester_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_course
    ADD CONSTRAINT course_course_semester_id_8e985cbb_fk_course_semester_id FOREIGN KEY (semester_id) REFERENCES public.course_semester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_coursemember course_coursemember_course_id_9b8acf20_fk_course_course_crn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_coursemember
    ADD CONSTRAINT course_coursemember_course_id_9b8acf20_fk_course_course_crn FOREIGN KEY (course_id) REFERENCES public.course_course(crn) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_coursemember course_coursemember_student_id_043d0a71_fk_user_student_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_coursemember
    ADD CONSTRAINT course_coursemember_student_id_043d0a71_fk_user_student_user_id FOREIGN KEY (student_id) REFERENCES public.user_student(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_coursestaff course_coursestaff_course_id_66a406aa_fk_course_course_crn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_coursestaff
    ADD CONSTRAINT course_coursestaff_course_id_66a406aa_fk_course_course_crn FOREIGN KEY (course_id) REFERENCES public.course_course(crn) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_coursestaff course_coursestaff_instructor_id_4ad9ad9e_fk_user_inst; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_coursestaff
    ADD CONSTRAINT course_coursestaff_instructor_id_4ad9ad9e_fk_user_inst FOREIGN KEY (instructor_id) REFERENCES public.user_instructor(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_skillstaught course_skillstaught_course_id_d311002e_fk_course_course_crn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_skillstaught
    ADD CONSTRAINT course_skillstaught_course_id_d311002e_fk_course_course_crn FOREIGN KEY (course_id) REFERENCES public.course_course(crn) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_skillstaught course_skillstaught_skill_id_51844ebc_fk_user_skill_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_skillstaught
    ADD CONSTRAINT course_skillstaught_skill_id_51844ebc_fk_user_skill_id FOREIGN KEY (skill_id) REFERENCES public.user_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project_project project_project_course_id_f987dcc7_fk_course_course_crn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_project
    ADD CONSTRAINT project_project_course_id_f987dcc7_fk_course_course_crn FOREIGN KEY (course_id) REFERENCES public.course_course(crn) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project_skillrequired project_skillrequired_project_id_35cea8ed_fk_project_project_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_skillrequired
    ADD CONSTRAINT project_skillrequired_project_id_35cea8ed_fk_project_project_id FOREIGN KEY (project_id) REFERENCES public.project_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project_skillrequired project_skillrequired_skill_id_eeb119c4_fk_user_skill_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_skillrequired
    ADD CONSTRAINT project_skillrequired_skill_id_eeb119c4_fk_user_skill_id FOREIGN KEY (skill_id) REFERENCES public.user_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stage_feedback stage_feedback_grader_id_ccc6b818_fk_user_student_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stage_feedback
    ADD CONSTRAINT stage_feedback_grader_id_ccc6b818_fk_user_student_user_id FOREIGN KEY (grader_id) REFERENCES public.user_student(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stage_feedback stage_feedback_receiver_id_8eecdbca_fk_user_student_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stage_feedback
    ADD CONSTRAINT stage_feedback_receiver_id_8eecdbca_fk_user_student_user_id FOREIGN KEY (receiver_id) REFERENCES public.user_student(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stage_feedback stage_feedback_team_id_ed66c6a8_fk_team_team_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stage_feedback
    ADD CONSTRAINT stage_feedback_team_id_ed66c6a8_fk_team_team_id FOREIGN KEY (team_id) REFERENCES public.team_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stage_task stage_task_student_id_59707c81_fk_user_student_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stage_task
    ADD CONSTRAINT stage_task_student_id_59707c81_fk_user_student_user_id FOREIGN KEY (student_id) REFERENCES public.user_student(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stage_task stage_task_team_id_1e4ca675_fk_team_team_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stage_task
    ADD CONSTRAINT stage_task_team_id_1e4ca675_fk_team_team_id FOREIGN KEY (team_id) REFERENCES public.team_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_membership team_membership_captain_id_800880b1_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_membership
    ADD CONSTRAINT team_membership_captain_id_800880b1_fk_user_user_id FOREIGN KEY (captain_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_membership team_membership_course_id_f0842a39_fk_course_course_crn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_membership
    ADD CONSTRAINT team_membership_course_id_f0842a39_fk_course_course_crn FOREIGN KEY (course_id) REFERENCES public.course_course(crn) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_membership team_membership_project_id_11c985b6_fk_project_project_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_membership
    ADD CONSTRAINT team_membership_project_id_11c985b6_fk_project_project_id FOREIGN KEY (project_id) REFERENCES public.project_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_membership team_membership_student_id_8dcf81c9_fk_user_student_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_membership
    ADD CONSTRAINT team_membership_student_id_8dcf81c9_fk_user_student_user_id FOREIGN KEY (student_id) REFERENCES public.user_student(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_membership team_membership_team_id_288dd2d1_fk_team_team_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_membership
    ADD CONSTRAINT team_membership_team_id_288dd2d1_fk_team_team_id FOREIGN KEY (team_id) REFERENCES public.team_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_team team_team_captain_id_0b42c227_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_team
    ADD CONSTRAINT team_team_captain_id_0b42c227_fk_user_user_id FOREIGN KEY (captain_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_team team_team_course_id_78a5e67c_fk_course_course_crn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_team
    ADD CONSTRAINT team_team_course_id_78a5e67c_fk_course_course_crn FOREIGN KEY (course_id) REFERENCES public.course_course(crn) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: team_team team_team_project_id_ae0641e5_fk_project_project_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_team
    ADD CONSTRAINT team_team_project_id_ae0641e5_fk_project_project_id FOREIGN KEY (project_id) REFERENCES public.project_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_instructor user_instructor_user_id_a568cbeb_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_instructor
    ADD CONSTRAINT user_instructor_user_id_a568cbeb_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_skillset user_skillset_skill_id_23dd2bda_fk_user_skill_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_skillset
    ADD CONSTRAINT user_skillset_skill_id_23dd2bda_fk_user_skill_id FOREIGN KEY (skill_id) REFERENCES public.user_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_skillset user_skillset_student_id_120dbee5_fk_user_student_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_skillset
    ADD CONSTRAINT user_skillset_student_id_120dbee5_fk_user_student_user_id FOREIGN KEY (student_id) REFERENCES public.user_student(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_student user_student_user_id_bf9c240f_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_student
    ADD CONSTRAINT user_student_user_id_bf9c240f_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_group_id_c57f13c0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_group_id_c57f13c0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_user_id_13f9a20d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_13f9a20d_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permi_permission_id_ce49d4de_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permi_permission_id_ce49d4de_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_31782f58_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_31782f58_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

