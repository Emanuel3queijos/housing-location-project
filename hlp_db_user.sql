PGDMP      6                |            hlp_db    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    hlp_db    DATABASE     }   CREATE DATABASE hlp_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE hlp_db;
                postgres    false            �            1259    24647    ad    TABLE     w  CREATE TABLE public.ad (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    avaliable_units integer,
    have_wifi boolean NOT NULL,
    have_laundry boolean NOT NULL,
    caminho_imagem character varying(255) NOT NULL,
    poster_cpf character varying(11) NOT NULL,
    description character varying(255)
);
    DROP TABLE public.ad;
       public         heap    postgres    false            �            1259    24739    ad_seq    SEQUENCE     p   CREATE SEQUENCE public.ad_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.ad_seq;
       public          postgres    false            �            1259    24646    ads_ad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ads_ad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ads_ad_id_seq;
       public          postgres    false    218                       0    0    ads_ad_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.ads_ad_id_seq OWNED BY public.ad.id;
          public          postgres    false    217            �            1259    24631    user    TABLE     H  CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    cpf character varying(11) NOT NULL,
    phone_number character varying(15) NOT NULL,
    birth_date date NOT NULL,
    email character varying(100),
    password character varying(60),
    role character varying(30) NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    24630    poster_tb_poster_id_seq    SEQUENCE     �   CREATE SEQUENCE public.poster_tb_poster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.poster_tb_poster_id_seq;
       public          postgres    false    216                       0    0    poster_tb_poster_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.poster_tb_poster_id_seq OWNED BY public."user".id;
          public          postgres    false    215            �            1259    24668    renter    TABLE     �  CREATE TABLE public.renter (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    phone_number character varying(15) NOT NULL,
    dtype character varying(31) NOT NULL,
    phone character varying(255),
    cpf character varying(255),
    date_of_birth timestamp(6) without time zone,
    password character varying(255),
    role smallint,
    CONSTRAINT renter_role_check CHECK (((role >= 0) AND (role <= 1)))
);
    DROP TABLE public.renter;
       public         heap    postgres    false            �            1259    24737 
   renter_seq    SEQUENCE     t   CREATE SEQUENCE public.renter_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.renter_seq;
       public          postgres    false            �            1259    24667    renters_id_seq    SEQUENCE     �   CREATE SEQUENCE public.renters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.renters_id_seq;
       public          postgres    false    220                       0    0    renters_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.renters_id_seq OWNED BY public.renter.id;
          public          postgres    false    219            \           2604    24634    user id    DEFAULT     p   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.poster_tb_poster_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    24647    ad 
   TABLE DATA           �   COPY public.ad (id, title, location, avaliable_units, have_wifi, have_laundry, caminho_imagem, poster_cpf, description) FROM stdin;
    public          postgres    false    218          �          0    24668    renter 
   TABLE DATA           q   COPY public.renter (id, name, email, phone_number, dtype, phone, cpf, date_of_birth, password, role) FROM stdin;
    public          postgres    false    220   r       �          0    24631    user 
   TABLE DATA           `   COPY public."user" (id, name, cpf, phone_number, birth_date, email, password, role) FROM stdin;
    public          postgres    false    216   �                  0    0    ad_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('public.ad_seq', 51, true);
          public          postgres    false    222                       0    0    ads_ad_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ads_ad_id_seq', 1, false);
          public          postgres    false    217                       0    0    poster_tb_poster_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.poster_tb_poster_id_seq', 1, false);
          public          postgres    false    215                       0    0 
   renter_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.renter_seq', 1, false);
          public          postgres    false    221            	           0    0    renters_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.renters_id_seq', 1, false);
          public          postgres    false    219            a           2606    24721    ad pk_ad 
   CONSTRAINT     I   ALTER TABLE ONLY public.ad
    ADD CONSTRAINT pk_ad PRIMARY KEY (title);
 2   ALTER TABLE ONLY public.ad DROP CONSTRAINT pk_ad;
       public            postgres    false    218            c           2606    24713    renter pk_renter 
   CONSTRAINT     Q   ALTER TABLE ONLY public.renter
    ADD CONSTRAINT pk_renter PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.renter DROP CONSTRAINT pk_renter;
       public            postgres    false    220            _           2606    24636    user poster_tb_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT poster_tb_pkey PRIMARY KEY (cpf);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT poster_tb_pkey;
       public            postgres    false    216            d           2606    24655    ad fk_poster_cpf    FK CONSTRAINT     �   ALTER TABLE ONLY public.ad
    ADD CONSTRAINT fk_poster_cpf FOREIGN KEY (poster_cpf) REFERENCES public."user"(cpf) ON UPDATE CASCADE;
 :   ALTER TABLE ONLY public.ad DROP CONSTRAINT fk_poster_cpf;
       public          postgres    false    4703    216    218            �   J   x�3���/-NU�OS�M�K/-�,�HU��ON,���S�,�	p� !�����������9gf	LZl
W� a�$      �      x������ � �      �   ^   x��;�  й����&.z�*&�������r��st6���%�b��:r4������U\j�O�z����:@O�W0/ۺ�C	!>��     