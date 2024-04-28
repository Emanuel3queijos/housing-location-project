PGDMP  7    -                |            hlp_db    16.2    16.2 !               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    hlp_db    DATABASE     }   CREATE DATABASE hlp_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE hlp_db;
                postgres    false            �            1259    24647    ad    TABLE     <  CREATE TABLE public.ad (
    ad_id integer NOT NULL,
    title character varying(255) NOT NULL,
    locality character varying(255) NOT NULL,
    avaliable_units integer,
    have_wifi boolean NOT NULL,
    have_laundry boolean NOT NULL,
    images bytea[] NOT NULL,
    poster_cpf character varying(11) NOT NULL
);
    DROP TABLE public.ad;
       public         heap    postgres    false            �            1259    24661    admin    TABLE       CREATE TABLE public.admin (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    cpf character varying(11) NOT NULL,
    email character varying(255) NOT NULL,
    birthdate date NOT NULL,
    phone_number character varying(15) NOT NULL
);
    DROP TABLE public.admin;
       public         heap    postgres    false            �            1259    24660    admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.admins_id_seq;
       public          postgres    false    220            	           0    0    admins_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.admins_id_seq OWNED BY public.admin.id;
          public          postgres    false    219            �            1259    24646    ads_ad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ads_ad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ads_ad_id_seq;
       public          postgres    false    218            
           0    0    ads_ad_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.ads_ad_id_seq OWNED BY public.ad.ad_id;
          public          postgres    false    217            �            1259    24631    real_estate_agents    TABLE       CREATE TABLE public.real_estate_agents (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    poster_cpf character varying(11) NOT NULL,
    phone_number character varying(15) NOT NULL,
    birth_date date NOT NULL,
    email character varying(100)
);
 &   DROP TABLE public.real_estate_agents;
       public         heap    postgres    false            �            1259    24630    poster_tb_poster_id_seq    SEQUENCE     �   CREATE SEQUENCE public.poster_tb_poster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.poster_tb_poster_id_seq;
       public          postgres    false    216                       0    0    poster_tb_poster_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.poster_tb_poster_id_seq OWNED BY public.real_estate_agents.id;
          public          postgres    false    215            �            1259    24668    renter    TABLE     �   CREATE TABLE public.renter (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    phone_number character varying(15) NOT NULL,
    cpf character varying(11) NOT NULL
);
    DROP TABLE public.renter;
       public         heap    postgres    false            �            1259    24667    renters_id_seq    SEQUENCE     �   CREATE SEQUENCE public.renters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.renters_id_seq;
       public          postgres    false    222                       0    0    renters_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.renters_id_seq OWNED BY public.renter.id;
          public          postgres    false    221            `           2604    24650    ad ad_id    DEFAULT     e   ALTER TABLE ONLY public.ad ALTER COLUMN ad_id SET DEFAULT nextval('public.ads_ad_id_seq'::regclass);
 7   ALTER TABLE public.ad ALTER COLUMN ad_id DROP DEFAULT;
       public          postgres    false    218    217    218            a           2604    24664    admin id    DEFAULT     e   ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);
 7   ALTER TABLE public.admin ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            _           2604    24634    real_estate_agents id    DEFAULT     |   ALTER TABLE ONLY public.real_estate_agents ALTER COLUMN id SET DEFAULT nextval('public.poster_tb_poster_id_seq'::regclass);
 D   ALTER TABLE public.real_estate_agents ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            b           2604    24671 	   renter id    DEFAULT     g   ALTER TABLE ONLY public.renter ALTER COLUMN id SET DEFAULT nextval('public.renters_id_seq'::regclass);
 8   ALTER TABLE public.renter ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �          0    24647    ad 
   TABLE DATA           r   COPY public.ad (ad_id, title, locality, avaliable_units, have_wifi, have_laundry, images, poster_cpf) FROM stdin;
    public          postgres    false    218   �$                  0    24661    admin 
   TABLE DATA           N   COPY public.admin (id, name, cpf, email, birthdate, phone_number) FROM stdin;
    public          postgres    false    220   �$       �          0    24631    real_estate_agents 
   TABLE DATA           c   COPY public.real_estate_agents (id, name, poster_cpf, phone_number, birth_date, email) FROM stdin;
    public          postgres    false    216   �$                 0    24668    renter 
   TABLE DATA           D   COPY public.renter (id, name, email, phone_number, cpf) FROM stdin;
    public          postgres    false    222   �$                  0    0    admins_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.admins_id_seq', 1, false);
          public          postgres    false    219                       0    0    ads_ad_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ads_ad_id_seq', 1, false);
          public          postgres    false    217                       0    0    poster_tb_poster_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.poster_tb_poster_id_seq', 1, false);
          public          postgres    false    215                       0    0    renters_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.renters_id_seq', 1, false);
          public          postgres    false    221            h           2606    24666    admin admins_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admins_pkey PRIMARY KEY (cpf);
 ;   ALTER TABLE ONLY public.admin DROP CONSTRAINT admins_pkey;
       public            postgres    false    220            f           2606    24654    ad ads_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.ad
    ADD CONSTRAINT ads_pkey PRIMARY KEY (ad_id);
 5   ALTER TABLE ONLY public.ad DROP CONSTRAINT ads_pkey;
       public            postgres    false    218            j           2606    24692    renter pk_renter 
   CONSTRAINT     O   ALTER TABLE ONLY public.renter
    ADD CONSTRAINT pk_renter PRIMARY KEY (cpf);
 :   ALTER TABLE ONLY public.renter DROP CONSTRAINT pk_renter;
       public            postgres    false    222            d           2606    24636 !   real_estate_agents poster_tb_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.real_estate_agents
    ADD CONSTRAINT poster_tb_pkey PRIMARY KEY (poster_cpf);
 K   ALTER TABLE ONLY public.real_estate_agents DROP CONSTRAINT poster_tb_pkey;
       public            postgres    false    216            k           2606    24655    ad fk_poster_cpf    FK CONSTRAINT     �   ALTER TABLE ONLY public.ad
    ADD CONSTRAINT fk_poster_cpf FOREIGN KEY (poster_cpf) REFERENCES public.real_estate_agents(poster_cpf) ON UPDATE CASCADE;
 :   ALTER TABLE ONLY public.ad DROP CONSTRAINT fk_poster_cpf;
       public          postgres    false    218    216    4708            �      x������ � �             x������ � �      �      x������ � �            x������ � �     