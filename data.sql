SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.5 (Ubuntu 15.5-1.pgdg20.04+1)

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

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") FROM stdin;
00000000-0000-0000-0000-000000000000	bd6f2cc0-170e-4792-bc97-6ac8b1fc79a8	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mihail.ciontu@saltandpepper.co","user_id":"b093bb41-d3f5-44a5-b673-109595369774","user_phone":""}}	2024-02-01 11:03:46.027747+00	
00000000-0000-0000-0000-000000000000	2441c8d3-b8ac-43e4-94ff-32781ec607a3	{"action":"login","actor_id":"b093bb41-d3f5-44a5-b673-109595369774","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 11:05:08.612112+00	
00000000-0000-0000-0000-000000000000	ec696cec-1ff2-48cf-9786-e35a92c7ba89	{"action":"logout","actor_id":"b093bb41-d3f5-44a5-b673-109595369774","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-01 11:05:09.452787+00	
00000000-0000-0000-0000-000000000000	903732c0-a4b7-4fb8-9df4-7cd51a41db33	{"action":"login","actor_id":"b093bb41-d3f5-44a5-b673-109595369774","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 11:05:12.961668+00	
00000000-0000-0000-0000-000000000000	917e7a6b-f583-4392-a948-993898913262	{"action":"logout","actor_id":"b093bb41-d3f5-44a5-b673-109595369774","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-01 11:05:13.419796+00	
00000000-0000-0000-0000-000000000000	5b439257-456a-424c-9c13-fa31337c1ccc	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ao@omir.group","user_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","user_phone":""}}	2024-02-01 13:10:51.565346+00	
00000000-0000-0000-0000-000000000000	cd99205e-54bc-4bd2-9cc0-f1327b6f0a1b	{"action":"login","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 13:13:23.717609+00	
00000000-0000-0000-0000-000000000000	d01af332-1189-42ff-9963-f16e54fbb011	{"action":"logout","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account"}	2024-02-01 13:13:24.330957+00	
00000000-0000-0000-0000-000000000000	55684721-f6a6-47f2-b927-4dbb51e65320	{"action":"login","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 13:15:26.88667+00	
00000000-0000-0000-0000-000000000000	4d12e923-b39f-4f38-a77e-29ce03b1d25c	{"action":"login","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 13:16:08.660766+00	
00000000-0000-0000-0000-000000000000	3f078657-e505-4f59-bdd7-8845f3a15118	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"aobetkal@gmail.com","user_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","user_phone":""}}	2024-02-01 13:23:57.04834+00	
00000000-0000-0000-0000-000000000000	69783fee-de76-45d9-89d6-62ae10fc33b5	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"aobetkal@gmail.com","user_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","user_phone":""}}	2024-02-01 13:24:05.064121+00	
00000000-0000-0000-0000-000000000000	a07b9117-d533-47d2-80f5-1cb1b338b83a	{"action":"logout","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account"}	2024-02-01 13:24:30.673415+00	
00000000-0000-0000-0000-000000000000	4d795e0b-50b9-4fbb-a736-cd1eb6f9029e	{"action":"login","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 13:24:39.223303+00	
00000000-0000-0000-0000-000000000000	8b12cdcf-b897-453a-9819-99d498ed30d7	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"aobetkal@gmail.com","user_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","user_phone":""}}	2024-02-01 13:24:58.993748+00	
00000000-0000-0000-0000-000000000000	34012665-cb03-48e0-a5fe-e4f3ebfeb60e	{"action":"login","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 13:25:52.188482+00	
00000000-0000-0000-0000-000000000000	04ddeee9-d20e-4d28-846e-b2a5f0d61eec	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mihail.ciontu@saltandpepper.co","user_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","user_phone":""}}	2024-02-01 13:30:10.698986+00	
00000000-0000-0000-0000-000000000000	40a16f0f-f983-4318-bbe3-dd0c6e1ed563	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"geo.apopei@saltandpepper.co","user_id":"66825634-2339-4c02-88b9-f55281874772","user_phone":""}}	2024-02-01 13:30:26.744674+00	
00000000-0000-0000-0000-000000000000	1f30387e-8b05-4615-a718-959cd4d13dc5	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 13:35:17.147193+00	
00000000-0000-0000-0000-000000000000	e0e09a45-e77f-4270-b559-c50d906d1dde	{"action":"login","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 13:56:55.575773+00	
00000000-0000-0000-0000-000000000000	01afd03c-a4fb-4bc9-864a-2448bcc7e320	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"riaboshlyk@etcetera.kiev.ua","user_id":"ae2ab750-1e89-432b-bfe1-085156a9789e","user_phone":""}}	2024-02-01 13:57:47.422575+00	
00000000-0000-0000-0000-000000000000	296a669d-773e-483b-a750-2571c7e94348	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dk@omir.group","user_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","user_phone":""}}	2024-02-01 13:58:10.325356+00	
00000000-0000-0000-0000-000000000000	b6bb8317-6847-4085-805c-97d4824f6b5a	{"action":"logout","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-01 14:18:11.586127+00	
00000000-0000-0000-0000-000000000000	f3857d92-52b0-4d95-b74c-071655fd0ef0	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 14:18:29.612912+00	
00000000-0000-0000-0000-000000000000	2a5727db-7fdf-4246-8462-42d2a1e7c5ae	{"action":"login","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 14:26:44.354741+00	
00000000-0000-0000-0000-000000000000	abaf069f-717f-44fa-8829-14646153a34e	{"action":"logout","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-02-01 14:32:54.647584+00	
00000000-0000-0000-0000-000000000000	b351265b-469e-4880-84b2-44697ad244ca	{"action":"login","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 14:33:05.529801+00	
00000000-0000-0000-0000-000000000000	7e0f2a21-b672-4699-9389-163efdbd3652	{"action":"login","actor_id":"ae2ab750-1e89-432b-bfe1-085156a9789e","actor_username":"riaboshlyk@etcetera.kiev.ua","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-01 15:12:21.912515+00	
00000000-0000-0000-0000-000000000000	ee7431e2-1098-4eac-83f4-e3540a2dc80e	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-01 15:43:24.775338+00	
00000000-0000-0000-0000-000000000000	06c1e07d-e4af-4646-9d41-15696d98d229	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-01 15:43:24.776106+00	
00000000-0000-0000-0000-000000000000	3aebc158-c386-4d8a-b46c-9fec0c60aaa5	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-02 06:44:29.310821+00	
00000000-0000-0000-0000-000000000000	ce6253b0-f705-4e73-85a9-eea22251a450	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-02 06:44:29.311432+00	
00000000-0000-0000-0000-000000000000	dc950600-93f9-44bc-9bf4-26d7b969d745	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mobile-+48600632550@omir-app-test-demon-slayer.com","user_id":"8d4645b4-2180-4ac5-bd59-20383e440919","user_phone":""}}	2024-02-02 06:45:21.955388+00	
00000000-0000-0000-0000-000000000000	c6738fef-dc49-46ac-a8bb-fbbf1dbf2414	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"mobile-+48600632550@omir-app-test-demon-slayer.com","user_id":"8d4645b4-2180-4ac5-bd59-20383e440919","user_phone":""}}	2024-02-02 06:45:28.172561+00	
00000000-0000-0000-0000-000000000000	dac49106-d4d2-48da-89ce-d39818fdd58a	{"action":"login","actor_id":"8d4645b4-2180-4ac5-bd59-20383e440919","actor_username":"mobile-+48600632550@omir-app-test-demon-slayer.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-02 06:45:53.818884+00	
00000000-0000-0000-0000-000000000000	99cedbdb-ccae-461d-9276-ca6b4860aab7	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"mobile-+48600632550@omir-app-test-demon-slayer.com","user_id":"8d4645b4-2180-4ac5-bd59-20383e440919","user_phone":""}}	2024-02-02 06:46:28.696607+00	
00000000-0000-0000-0000-000000000000	2f5bd70c-54e3-4f65-a0d1-6565221dd4d8	{"action":"login","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-03 10:15:53.573709+00	
00000000-0000-0000-0000-000000000000	24698289-7deb-4fc3-9583-51bc126a4483	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-03 13:13:48.942135+00	
00000000-0000-0000-0000-000000000000	e5c92d2e-79c7-4b84-b941-bee205956a2a	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-03 13:13:48.942758+00	
00000000-0000-0000-0000-000000000000	f01e5798-21b0-49b5-bc3f-7ec0753979f5	{"action":"login","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-02 07:21:55.187725+00	
00000000-0000-0000-0000-000000000000	cedeebec-73cf-4b22-af45-ef71e132dcb4	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-02 08:20:07.084972+00	
00000000-0000-0000-0000-000000000000	2e74a4e3-656d-409d-9966-80a9d28f89b7	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-02 08:20:07.085543+00	
00000000-0000-0000-0000-000000000000	a397f23c-daff-415f-b604-043c8995581a	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-02 08:46:12.177661+00	
00000000-0000-0000-0000-000000000000	745e6fe9-1a92-4f04-b5f5-e93024da5980	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-02 08:46:12.17813+00	
00000000-0000-0000-0000-000000000000	20b297db-361e-4111-b725-f0c72a7ccfca	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-03 14:15:52.549946+00	
00000000-0000-0000-0000-000000000000	3434baf1-421b-4685-9c00-8cf705bc76d7	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-03 14:15:52.550609+00	
00000000-0000-0000-0000-000000000000	db058dfa-b1bd-4bfd-a777-691977f11137	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-03 15:30:34.49266+00	
00000000-0000-0000-0000-000000000000	5d42381a-572a-4a48-ac5a-b4af8b739c56	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-03 15:30:34.493306+00	
00000000-0000-0000-0000-000000000000	356adffe-df87-4839-9c3e-a2ca104bcff4	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-03 16:35:34.56014+00	
00000000-0000-0000-0000-000000000000	7ae27060-5068-4914-b742-2f118839d0c7	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-03 16:35:34.560725+00	
00000000-0000-0000-0000-000000000000	d0d94ee9-74db-4f00-8d0a-ece3993b02b3	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-04 04:14:46.49873+00	
00000000-0000-0000-0000-000000000000	84fd90b8-1d59-4011-9e92-61b2af36fd30	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-04 04:14:46.499381+00	
00000000-0000-0000-0000-000000000000	3591e469-f641-4eda-979f-b0d432684d67	{"action":"token_refreshed","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-04 08:10:30.83732+00	
00000000-0000-0000-0000-000000000000	f3d9b923-65ab-4997-a46a-54bcb86f94e7	{"action":"token_revoked","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-04 08:10:30.838235+00	
00000000-0000-0000-0000-000000000000	9d8f7252-8e71-498f-bfd2-30387dc203d4	{"action":"logout","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-02-04 08:16:39.642303+00	
00000000-0000-0000-0000-000000000000	44feb0c7-e840-4b12-b389-951db389ed9d	{"action":"login","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-04 08:16:53.022783+00	
00000000-0000-0000-0000-000000000000	624b68e3-b1c1-4756-bee6-d0869a24b623	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-04 12:24:10.828835+00	
00000000-0000-0000-0000-000000000000	af71103e-54a2-49d3-9de8-afd286941fb8	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-04 12:24:10.829528+00	
00000000-0000-0000-0000-000000000000	14632c12-c30c-4dfc-8af3-22edd59afea6	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-04 13:25:05.507976+00	
00000000-0000-0000-0000-000000000000	54a30aaf-e0ae-4738-bf45-1f3238ee912e	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-04 13:25:05.508495+00	
00000000-0000-0000-0000-000000000000	ee237e1c-fe82-4fb9-b828-c8b7cc6d6cf7	{"action":"login","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-04 15:19:08.766324+00	
00000000-0000-0000-0000-000000000000	d525440b-9d72-4012-81ec-a5737873705c	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"dk@omir.group","user_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","user_phone":""}}	2024-02-04 15:19:38.142338+00	
00000000-0000-0000-0000-000000000000	cfd59df0-1940-4a24-928b-cb27b73a5b3a	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-04 21:16:34.921223+00	
00000000-0000-0000-0000-000000000000	d7326e54-a382-4051-8701-3323cd3e904d	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-04 21:16:34.922066+00	
00000000-0000-0000-0000-000000000000	493a3301-97d4-42da-8112-33c6634ff654	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 06:32:48.789943+00	
00000000-0000-0000-0000-000000000000	547f09e7-5bef-4dbc-aedd-256a2a7ee206	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 06:32:48.790675+00	
00000000-0000-0000-0000-000000000000	dac4177a-76cb-4423-8270-b6a648538b70	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 06:32:49.110621+00	
00000000-0000-0000-0000-000000000000	97eeeb26-12bb-4215-a3b5-524bed15276b	{"action":"login","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-06 08:13:16.750622+00	
00000000-0000-0000-0000-000000000000	6f7a0ff2-fddf-475b-811d-cd33cd4a4c3f	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 09:11:45.997649+00	
00000000-0000-0000-0000-000000000000	c735267f-a193-45fa-8991-81429a37a264	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 09:11:45.998272+00	
00000000-0000-0000-0000-000000000000	c3791de8-db18-417c-9f10-334d1a4462b2	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 09:11:47.291731+00	
00000000-0000-0000-0000-000000000000	6c039ae4-c8b1-4009-9252-d6571850ec4e	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 09:29:42.05254+00	
00000000-0000-0000-0000-000000000000	9de10f2a-107f-4088-8a11-c2a2572d91a8	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 09:29:42.05309+00	
00000000-0000-0000-0000-000000000000	5ef4fff2-a943-477f-a01e-428ba3df20d5	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 09:29:42.747627+00	
00000000-0000-0000-0000-000000000000	23a48021-deff-48a9-b5c7-305a360ad6ca	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 11:28:28.559901+00	
00000000-0000-0000-0000-000000000000	0c21a711-ae72-40ec-92af-653812c1388f	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 11:28:28.560685+00	
00000000-0000-0000-0000-000000000000	59158ab6-8d58-4148-8308-26044e7f1b59	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 11:28:29.090471+00	
00000000-0000-0000-0000-000000000000	48dddfee-aee2-4f92-af19-15aa40ee8922	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 12:56:49.557582+00	
00000000-0000-0000-0000-000000000000	f1fd523c-88af-4e73-9300-cdacb830a56e	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 12:56:49.5583+00	
00000000-0000-0000-0000-000000000000	444cdff4-fbb6-4d37-8ce7-bb065c95d5e3	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 12:56:49.875047+00	
00000000-0000-0000-0000-000000000000	9b5de1d9-3780-4a4e-811e-14f81b86fd2e	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 12:56:50.530059+00	
00000000-0000-0000-0000-000000000000	b5028e0f-d4cc-4e45-b5b1-048e18d61803	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 12:56:50.827635+00	
00000000-0000-0000-0000-000000000000	5bd092b0-d84a-4be0-83c2-749e83102b6f	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 13:38:42.36404+00	
00000000-0000-0000-0000-000000000000	ed475820-614c-40d5-8560-636bc8ef2966	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 13:38:42.364645+00	
00000000-0000-0000-0000-000000000000	6d2cd148-a59f-46c0-a670-55f477a728fe	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 13:38:43.406743+00	
00000000-0000-0000-0000-000000000000	9895b0fc-bdc6-48b1-b79e-e3b421a2e99b	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 13:38:43.419604+00	
00000000-0000-0000-0000-000000000000	7b6439b7-6d94-47c0-972d-965f2b1e01ff	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-06 13:38:43.426113+00	
00000000-0000-0000-0000-000000000000	48119077-1076-411a-8d57-976546eac519	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-06 13:44:09.698051+00	
00000000-0000-0000-0000-000000000000	2080f85e-d5a6-46fd-a188-d87faf385098	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-06 14:36:35.943255+00	
00000000-0000-0000-0000-000000000000	26a3eea0-c30f-4e66-a1c3-3e912d1e1fc2	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-06 14:54:42.539921+00	
00000000-0000-0000-0000-000000000000	d4f5fb17-2f72-4011-9b5d-eaf49d47c8e2	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 05:57:52.817989+00	
00000000-0000-0000-0000-000000000000	92fa684a-03ae-4102-8e73-2b1c2fa94f44	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 06:11:32.980002+00	
00000000-0000-0000-0000-000000000000	81c5cf6e-6d70-4c66-add1-11145a03dc17	{"action":"login","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:14:46.7349+00	
00000000-0000-0000-0000-000000000000	d76c773e-bb67-42bb-9518-b7c2ff616294	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mobile-+77019998999@omir-app-my-emg.com","user_id":"9efbe1c2-b12f-4ad3-829f-6f31c13898e9","user_phone":""}}	2024-02-07 07:36:45.252323+00	
00000000-0000-0000-0000-000000000000	c9f8b9ac-9a00-4616-88e9-ff751036153c	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"mobile-+77019998999@omir-app-my-emg.com","user_id":"9efbe1c2-b12f-4ad3-829f-6f31c13898e9","user_phone":""}}	2024-02-07 07:37:20.358747+00	
00000000-0000-0000-0000-000000000000	32111c90-3f57-4569-ad1a-46a6bb3b65d3	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"mobile-+77019998999@omir-app-my-emg.com","user_id":"9efbe1c2-b12f-4ad3-829f-6f31c13898e9","user_phone":""}}	2024-02-07 07:38:17.08475+00	
00000000-0000-0000-0000-000000000000	1202dec7-58f0-43a2-a410-dc0dd37fabf8	{"action":"login","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:41:08.365704+00	
00000000-0000-0000-0000-000000000000	694f2b2a-0047-43c5-a61f-acb8316e3090	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mobile-+48600632550@omir-app-test-demon-slayer.com","user_id":"8d4645b4-2180-4ac5-bd59-20383e440919","user_phone":""}}	2024-02-07 07:41:20.410376+00	
00000000-0000-0000-0000-000000000000	e20ead0c-0eab-4f0c-b722-9f0dd68782c3	{"action":"login","actor_id":"9efbe1c2-b12f-4ad3-829f-6f31c13898e9","actor_username":"mobile-+77019998999@omir-app-my-emg.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:42:18.80314+00	
00000000-0000-0000-0000-000000000000	538e3def-7d55-499c-a868-1b2367ba8952	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"mobile-+77019998999@omir-app-my-emg.com","user_id":"9efbe1c2-b12f-4ad3-829f-6f31c13898e9","user_phone":""}}	2024-02-07 07:43:11.57878+00	
00000000-0000-0000-0000-000000000000	a0a630f6-18ea-4d75-9cf7-36b196ada8bd	{"action":"token_refreshed","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"token"}	2024-02-07 07:44:54.587483+00	
00000000-0000-0000-0000-000000000000	7dc1b332-3853-4b8a-bdad-b69818a2770e	{"action":"token_revoked","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"token"}	2024-02-07 07:44:54.587927+00	
00000000-0000-0000-0000-000000000000	8e3686b6-4944-4456-be6b-d4f7963b0d2f	{"action":"logout","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-07 07:44:57.675106+00	
00000000-0000-0000-0000-000000000000	92343d93-7c12-40ed-a908-29f8168c7330	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:45:02.969498+00	
00000000-0000-0000-0000-000000000000	af8164f3-2143-4779-811b-27044731fee4	{"action":"logout","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-07 07:45:03.651572+00	
00000000-0000-0000-0000-000000000000	8080a440-1ce2-4ad4-8c89-0f8f2f2e55e7	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:45:11.523228+00	
00000000-0000-0000-0000-000000000000	9ba34c91-5f84-41fc-8b9b-3fc7f7612214	{"action":"logout","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-07 07:45:12.205512+00	
00000000-0000-0000-0000-000000000000	c9eb3508-39fd-4cc9-8ae9-9fd3b4690a2c	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:45:53.517277+00	
00000000-0000-0000-0000-000000000000	26f7a4dd-2170-4085-a58f-05ac908dca82	{"action":"logout","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-07 07:45:54.239335+00	
00000000-0000-0000-0000-000000000000	f4da4241-db9f-4677-8c30-584af064df7b	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:45:58.326533+00	
00000000-0000-0000-0000-000000000000	f1bbc62e-d544-4d45-bde8-c9c03daadf5b	{"action":"logout","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-07 07:45:59.086958+00	
00000000-0000-0000-0000-000000000000	46768ff3-b1f1-4e0b-8d32-40a691842906	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:46:41.8477+00	
00000000-0000-0000-0000-000000000000	42ee76c5-c865-4616-8c07-d865e7d2546b	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:47:14.63944+00	
00000000-0000-0000-0000-000000000000	0af993ff-8aad-4a58-8b00-1a5b062a815f	{"action":"logout","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-07 07:47:15.331586+00	
00000000-0000-0000-0000-000000000000	8c711f65-216e-4991-81fd-1a98c19c9ab8	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:47:21.838685+00	
00000000-0000-0000-0000-000000000000	429856c9-86d1-4b66-ac62-5b338ca84dc9	{"action":"logout","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-07 07:47:22.539264+00	
00000000-0000-0000-0000-000000000000	08fdf944-9012-45df-882f-eafd09bf5a4e	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:49:13.706828+00	
00000000-0000-0000-0000-000000000000	97298c30-81b4-4c33-a024-89e213743b6a	{"action":"logout","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-07 07:49:14.389028+00	
00000000-0000-0000-0000-000000000000	27d23be4-98ce-46c4-8060-414fb953af2e	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:49:38.251892+00	
00000000-0000-0000-0000-000000000000	c32536c2-6f70-4e12-b210-9a982a72a6a7	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:50:15.793491+00	
00000000-0000-0000-0000-000000000000	45ee3f65-4304-4b92-a4a6-ed90da0c2434	{"action":"logout","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account"}	2024-02-07 07:53:51.15881+00	
00000000-0000-0000-0000-000000000000	2aa7683c-280c-413e-8987-fe47a6922942	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:53:54.662074+00	
00000000-0000-0000-0000-000000000000	11bf4f7f-ea4c-4b10-8e8f-e900ec8f2b91	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:56:52.065381+00	
00000000-0000-0000-0000-000000000000	6fa8915c-6795-4474-98f5-998812bbae7d	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 07:57:38.729503+00	
00000000-0000-0000-0000-000000000000	f5b21b99-be3c-4a97-ac44-9868d2ed3ccf	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 08:32:18.049622+00	
00000000-0000-0000-0000-000000000000	4e846bc0-582a-47ff-8bab-3ec29041f84d	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 08:32:18.050215+00	
00000000-0000-0000-0000-000000000000	1b34003d-bda1-497d-b6c3-d9120020d58e	{"action":"login","actor_id":"9efbe1c2-b12f-4ad3-829f-6f31c13898e9","actor_username":"mobile-+77019998999@omir-app-my-emg.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 09:00:00.428646+00	
00000000-0000-0000-0000-000000000000	6179973a-d363-4c41-a831-9ed9bb868712	{"action":"login","actor_id":"9e9e58e2-2eb4-469b-999c-036d25a003d8","actor_username":"mihail.ciontu@saltandpepper.co","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 11:04:50.842184+00	
00000000-0000-0000-0000-000000000000	295076a3-9ef6-4274-85e5-7e0f59842886	{"action":"token_refreshed","actor_id":"9efbe1c2-b12f-4ad3-829f-6f31c13898e9","actor_username":"mobile-+77019998999@omir-app-my-emg.com","actor_via_sso":false,"log_type":"token"}	2024-02-07 11:09:07.088471+00	
00000000-0000-0000-0000-000000000000	5ea55a62-4068-4a64-93fb-d9cb777a6b6f	{"action":"token_revoked","actor_id":"9efbe1c2-b12f-4ad3-829f-6f31c13898e9","actor_username":"mobile-+77019998999@omir-app-my-emg.com","actor_via_sso":false,"log_type":"token"}	2024-02-07 11:09:07.089558+00	
00000000-0000-0000-0000-000000000000	ba092ab8-b49f-4143-9fa4-5adde660febc	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 12:00:24.91576+00	
00000000-0000-0000-0000-000000000000	cf2a28c2-0860-4b8c-9892-5dba049230fa	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 12:00:24.916383+00	
00000000-0000-0000-0000-000000000000	dc0f2697-0094-4987-b5b4-208b11c3f55e	{"action":"login","actor_id":"ae2ab750-1e89-432b-bfe1-085156a9789e","actor_username":"riaboshlyk@etcetera.kiev.ua","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 13:09:51.786784+00	
00000000-0000-0000-0000-000000000000	735e2b2f-5ae0-4f59-83e9-e673933a2c3d	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 13:28:30.916655+00	
00000000-0000-0000-0000-000000000000	45f829ca-5083-42fd-b459-e2da9b701586	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 13:28:30.917572+00	
00000000-0000-0000-0000-000000000000	4a133b79-07af-469f-8165-91a3a6893c6a	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 13:28:32.061862+00	
00000000-0000-0000-0000-000000000000	a77a9c68-dc18-4568-bbb8-29f40c2f1800	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 13:28:32.621624+00	
00000000-0000-0000-0000-000000000000	559496b4-97a5-4648-bd27-f306e688872c	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 13:28:33.114003+00	
00000000-0000-0000-0000-000000000000	0330c701-7be9-43f4-ac14-cf275c42ec0e	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 13:28:35.669587+00	
00000000-0000-0000-0000-000000000000	c7b0500e-78b6-4a0b-9ece-2a5f0e799a8b	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 14:02:41.379013+00	
00000000-0000-0000-0000-000000000000	bdff1aed-9d5f-4046-83a0-b6935dd105cb	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 14:02:41.379641+00	
00000000-0000-0000-0000-000000000000	83cc94b0-0287-4860-941f-9ad3cc421de5	{"action":"token_refreshed","actor_id":"ae2ab750-1e89-432b-bfe1-085156a9789e","actor_username":"riaboshlyk@etcetera.kiev.ua","actor_via_sso":false,"log_type":"token"}	2024-02-07 15:12:50.619978+00	
00000000-0000-0000-0000-000000000000	ef57eb67-c655-4147-bb96-7815b366e5fd	{"action":"token_revoked","actor_id":"ae2ab750-1e89-432b-bfe1-085156a9789e","actor_username":"riaboshlyk@etcetera.kiev.ua","actor_via_sso":false,"log_type":"token"}	2024-02-07 15:12:50.620539+00	
00000000-0000-0000-0000-000000000000	deff4259-ea63-4cc6-89b2-17ee2d212c94	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 15:35:46.602553+00	
00000000-0000-0000-0000-000000000000	d91cab48-7b43-4be8-8aff-39b1f7d15006	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 15:35:46.603113+00	
00000000-0000-0000-0000-000000000000	cf358bd6-010f-400b-90bf-3c3b9ae41d80	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 15:36:04.527027+00	
00000000-0000-0000-0000-000000000000	a743c081-2009-4698-8ad5-c8f71006987e	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 15:36:04.527656+00	
00000000-0000-0000-0000-000000000000	ee06400d-090d-48e5-8fa6-7ab2d9d05afd	{"action":"token_refreshed","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 17:46:54.010367+00	
00000000-0000-0000-0000-000000000000	ba8edd1e-b770-4e5d-90b4-2ac106fdfd74	{"action":"token_revoked","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 17:46:54.011074+00	
00000000-0000-0000-0000-000000000000	141bd49a-67a0-4461-a79a-fc3f76b49db3	{"action":"token_refreshed","actor_id":"ae2ab750-1e89-432b-bfe1-085156a9789e","actor_username":"riaboshlyk@etcetera.kiev.ua","actor_via_sso":false,"log_type":"token"}	2024-02-07 19:11:20.184037+00	
00000000-0000-0000-0000-000000000000	83cd3edc-d065-44f4-9497-958bef8f7e67	{"action":"token_revoked","actor_id":"ae2ab750-1e89-432b-bfe1-085156a9789e","actor_username":"riaboshlyk@etcetera.kiev.ua","actor_via_sso":false,"log_type":"token"}	2024-02-07 19:11:20.184644+00	
00000000-0000-0000-0000-000000000000	b7099372-920e-42f5-9bd0-b267cbd074d9	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"temporary-486844563@omir-app-test-auto-auto-app.com","user_id":"7e614c8d-c3c1-475b-ba45-518ee9b42dac","user_phone":""}}	2024-02-07 15:38:35.691158+00	
00000000-0000-0000-0000-000000000000	ff9bb71b-67a3-458e-9af3-f814ae01bd9e	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"temporary-45664456@omir-app-test-auto-auto-app.com","user_id":"0d4e0e3b-4933-4d4c-aa0a-4cc8748f3d5f","user_phone":""}}	2024-02-07 15:41:15.149006+00	
00000000-0000-0000-0000-000000000000	b827bd07-41ed-459c-aa75-d0ce46fa68d2	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"temporary-486844563@omir-app-test-auto-auto-app.com","user_id":"7e614c8d-c3c1-475b-ba45-518ee9b42dac","user_phone":""}}	2024-02-07 15:42:00.640552+00	
00000000-0000-0000-0000-000000000000	c727674f-e710-4603-ad5e-b0c0c7cda6dd	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"riaboshlyk+2@etcetera.kiev.ua","user_id":"d83e32eb-da46-475d-87d0-21a77d8bc969","user_phone":""}}	2024-02-07 15:42:46.122358+00	
00000000-0000-0000-0000-000000000000	e5cbfb8b-c251-4293-8774-5e31491d2eea	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"riaboshlyk+3@etcetera.kiev.ua","user_id":"3e82c125-b0e5-47bc-8c56-14cecd11eb19","user_phone":""}}	2024-02-07 15:44:33.349735+00	
00000000-0000-0000-0000-000000000000	874ad41d-4d97-48d2-ae14-1872a779bf58	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"temporary-345664444@omir-app-test-auto-auto-app.com","user_id":"33a617f5-783c-48d9-82a5-b240f42f3c33","user_phone":""}}	2024-02-07 15:45:33.369096+00	
00000000-0000-0000-0000-000000000000	0ac9654d-17ff-45d2-9973-6ab875fb0ee7	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"riaboshlyk+2@etcetera.kiev.ua","user_id":"d83e32eb-da46-475d-87d0-21a77d8bc969","user_phone":""}}	2024-02-07 15:50:53.109656+00	
00000000-0000-0000-0000-000000000000	974bdec1-e3fd-499f-8b28-4ac2b3b488a5	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"riaboshlyk+3@etcetera.kiev.ua","user_id":"3e82c125-b0e5-47bc-8c56-14cecd11eb19","user_phone":""}}	2024-02-07 15:54:57.038591+00	
00000000-0000-0000-0000-000000000000	883512ab-0c86-41c1-b3ec-ecb0bf4cb164	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"riaboshlyk+2@etcetera.kiev.ua","user_id":"d83e32eb-da46-475d-87d0-21a77d8bc969","user_phone":""}}	2024-02-07 15:55:02.731679+00	
00000000-0000-0000-0000-000000000000	975da0cf-4f1c-4549-a10c-cc1d84339374	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"riaboshlyk+2@etcetera.kiev.ua","user_id":"d83e32eb-da46-475d-87d0-21a77d8bc969","user_phone":""}}	2024-02-07 15:59:01.456698+00	
00000000-0000-0000-0000-000000000000	b523bf3a-abda-42e5-8d2e-ff77a568176e	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 16:39:18.214443+00	
00000000-0000-0000-0000-000000000000	4367554b-cd25-4fd1-b64c-09f6ee9cac2c	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 16:39:18.215035+00	
00000000-0000-0000-0000-000000000000	d7af9d9d-a16d-4ae4-9843-4c495b056432	{"action":"token_refreshed","actor_id":"9efbe1c2-b12f-4ad3-829f-6f31c13898e9","actor_username":"mobile-+77019998999@omir-app-my-emg.com","actor_via_sso":false,"log_type":"token"}	2024-02-07 17:24:07.410528+00	
00000000-0000-0000-0000-000000000000	4dbf6cee-3ee7-4b1c-91de-0a36886dfab6	{"action":"token_revoked","actor_id":"9efbe1c2-b12f-4ad3-829f-6f31c13898e9","actor_username":"mobile-+77019998999@omir-app-my-emg.com","actor_via_sso":false,"log_type":"token"}	2024-02-07 17:24:07.411199+00	
00000000-0000-0000-0000-000000000000	2f9f8012-db4c-4ffe-94dd-9bf491097743	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 17:53:28.992185+00	
00000000-0000-0000-0000-000000000000	c300f54f-2ce7-44e7-be19-ad0b78a95d6f	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 17:53:28.992978+00	
00000000-0000-0000-0000-000000000000	e0f71d3a-daf1-4a40-9c82-f49ec3d4d83c	{"action":"logout","actor_id":"63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f","actor_username":"ao@omir.group","actor_via_sso":false,"log_type":"account"}	2024-02-07 17:54:55.714204+00	
00000000-0000-0000-0000-000000000000	5d72d066-6023-4876-8329-289bf29f62cd	{"action":"login","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-07 17:55:16.590968+00	
00000000-0000-0000-0000-000000000000	049a27ce-f098-46ed-8d16-ae2ee42a1a2c	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"riaboshlyk+2@etcetera.kiev.ua","user_id":"d83e32eb-da46-475d-87d0-21a77d8bc969","user_phone":""}}	2024-02-07 19:26:36.931709+00	
00000000-0000-0000-0000-000000000000	508fc25d-489d-481b-8d12-c2ef97afbd41	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"riaboshlyk+3@etcetera.kiev.ua","user_id":"3e82c125-b0e5-47bc-8c56-14cecd11eb19","user_phone":""}}	2024-02-07 19:26:42.026139+00	
00000000-0000-0000-0000-000000000000	35afc702-46ba-44e4-b6d8-5e5dbcdaff28	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"temporary-445666544@omir-app-test-auto-auto-app.com","user_id":"6b8d262a-bdee-4060-afe7-333e7b9e011c","user_phone":""}}	2024-02-07 19:32:56.222911+00	
00000000-0000-0000-0000-000000000000	bb51b1fb-7509-4bfb-9c8a-6580539b70ee	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"12345@mail.com","user_id":"6b8d262a-bdee-4060-afe7-333e7b9e011c","user_phone":""}}	2024-02-07 19:40:04.963306+00	
00000000-0000-0000-0000-000000000000	ebe54b4e-6228-492b-8b3e-eada7fad10e6	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"mobile-+3800000000@omir-app-test-auto-auto-app.com","user_id":"6b8d262a-bdee-4060-afe7-333e7b9e011c","user_phone":""}}	2024-02-07 19:40:05.074026+00	
00000000-0000-0000-0000-000000000000	9c2bf8a1-47ef-407b-bed2-c6f2a371d6e6	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"riaboshlyk+6@etcetera.kiev.ua","user_id":"6b8d262a-bdee-4060-afe7-333e7b9e011c","user_phone":""}}	2024-02-07 19:40:55.907569+00	
00000000-0000-0000-0000-000000000000	853f3738-8faf-4d66-9d26-2b3eff4165f4	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"riaboshlyk+6@etcetera.kiev.ua","user_id":"6b8d262a-bdee-4060-afe7-333e7b9e011c","user_phone":""}}	2024-02-07 19:41:15.198486+00	
00000000-0000-0000-0000-000000000000	bb2cf046-580a-4d41-97ee-aae9dd25b039	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"riaboshlyk+2@etcetera.kiev.ua","user_id":"d83e32eb-da46-475d-87d0-21a77d8bc969","user_phone":""}}	2024-02-07 19:42:50.831129+00	
00000000-0000-0000-0000-000000000000	f431dfd7-b6d6-4dfd-9a13-f04e58684960	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"123@mail.com","user_id":"61794625-90a9-4345-89c6-aeab5175da77","user_phone":""}}	2024-02-07 19:48:50.882194+00	
00000000-0000-0000-0000-000000000000	011b0451-5413-4b64-acb5-9b891c8fc1a1	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"123@mail.com","user_id":"61794625-90a9-4345-89c6-aeab5175da77","user_phone":""}}	2024-02-07 19:48:59.869192+00	
00000000-0000-0000-0000-000000000000	0cf81e57-2a24-42f2-b86e-5b80cef7caf4	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"123@mail.com","user_id":"61794625-90a9-4345-89c6-aeab5175da77","user_phone":""}}	2024-02-07 19:49:31.581662+00	
00000000-0000-0000-0000-000000000000	03da2d93-efb9-4148-b1bb-b5521ea869fd	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"riaboshlyk+3@etcetera.kiev.ua","user_id":"3e82c125-b0e5-47bc-8c56-14cecd11eb19","user_phone":""}}	2024-02-07 19:43:22.110694+00	
00000000-0000-0000-0000-000000000000	28603b2f-c094-47ac-ab7d-fe2d7ebfbb81	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"temporary-345664444@omir-app-test-auto-auto-app.com","user_id":"33a617f5-783c-48d9-82a5-b240f42f3c33","user_phone":""}}	2024-02-07 19:45:12.265978+00	
00000000-0000-0000-0000-000000000000	af1c8da1-3b11-4a5d-b957-b9653156fe64	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mobile-+380634953548@omir-app-test-auto-auto-app.com","user_id":"09729d16-de1d-4232-b28e-7ae14a08da3d","user_phone":""}}	2024-02-07 19:46:28.341755+00	
00000000-0000-0000-0000-000000000000	6ccd0593-42b2-4077-b47b-be95f02b69e0	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"mobile-+380634953548@omir-app-test-auto-auto-app.com","user_id":"09729d16-de1d-4232-b28e-7ae14a08da3d","user_phone":""}}	2024-02-07 19:46:44.470762+00	
00000000-0000-0000-0000-000000000000	e51c161a-def0-4d7b-8218-b2ad206af146	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"123@mail.com","user_id":"61794625-90a9-4345-89c6-aeab5175da77","user_phone":""}}	2024-02-07 19:49:47.716844+00	
00000000-0000-0000-0000-000000000000	b7b0e936-f666-4af5-b759-a44dc3934b49	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mobile-+380990000000@omir-app-test-auto-auto-app.com","user_id":"f0ba6e9d-b70c-4208-b580-0faf2a1366b2","user_phone":""}}	2024-02-07 19:50:57.365865+00	
00000000-0000-0000-0000-000000000000	5906567a-970f-4f68-9d57-2fa19adbce65	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"testuser@mail.com","user_id":"1759fe0f-b701-438a-9dc5-bb9abf4949eb","user_phone":""}}	2024-02-07 19:52:52.309701+00	
00000000-0000-0000-0000-000000000000	4a53674f-11eb-409d-bccc-1d186e172d5c	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"testuser@mail.com","user_id":"1759fe0f-b701-438a-9dc5-bb9abf4949eb","user_phone":""}}	2024-02-07 19:53:09.197399+00	
00000000-0000-0000-0000-000000000000	4e097955-9146-4a02-8cc4-60943d4a6296	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"testuser@mail.com","user_id":"1759fe0f-b701-438a-9dc5-bb9abf4949eb","user_phone":""}}	2024-02-07 19:53:35.469836+00	
00000000-0000-0000-0000-000000000000	b32485f7-44ff-401b-b28f-aa1d582b3fba	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mobile-+380670000000@omir-app-test-auto-auto-app.com","user_id":"60eee909-cf0c-42b9-9268-e30e14eef01b","user_phone":""}}	2024-02-07 19:54:49.045508+00	
00000000-0000-0000-0000-000000000000	22649869-98c4-44bd-9fb0-8c3a6db0c06d	{"action":"user_modified","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"user","traits":{"user_email":"mobile-+380670000000@omir-app-test-auto-auto-app.com","user_id":"60eee909-cf0c-42b9-9268-e30e14eef01b","user_phone":""}}	2024-02-07 19:54:55.475222+00	
00000000-0000-0000-0000-000000000000	6c19d38d-5c17-42b0-ae40-965e1884f436	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"temporary-rtyy5r@omir-app-test-auto-auto-app.com","user_id":"17573621-47e1-4337-ae4d-c868ea94ce59","user_phone":""}}	2024-02-07 20:01:00.050069+00	
00000000-0000-0000-0000-000000000000	20e8f4b6-5242-4d15-b959-b63fc5cf7a95	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mobile-+340440000000@omir-app-test-auto-auto-app.com","user_id":"ce34eed7-1d2c-4336-8f3f-2735a25d5c5f","user_phone":""}}	2024-02-07 20:04:00.460762+00	
00000000-0000-0000-0000-000000000000	6afd9bc6-d062-4924-a4e6-8f08d6073bf0	{"action":"token_refreshed","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-07 20:23:41.751701+00	
00000000-0000-0000-0000-000000000000	0f553ea2-9fea-4543-baee-10fe60406ed3	{"action":"token_revoked","actor_id":"76ec272b-3e4d-4082-94a9-784a0b368a4e","actor_username":"aobetkal@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-07 20:23:41.752257+00	
00000000-0000-0000-0000-000000000000	8b6073a5-6841-4267-89b0-a011a0c704cc	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 21:07:10.471972+00	
00000000-0000-0000-0000-000000000000	b123fa3c-604b-4885-abd0-3ae1915f9e57	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-07 21:07:10.47276+00	
00000000-0000-0000-0000-000000000000	b0b659bf-3cfc-43fc-8f80-a6891ee77c4d	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-08 01:23:19.107161+00	
00000000-0000-0000-0000-000000000000	740389cc-a742-40d1-98d0-560f5d2916c5	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-08 01:23:19.107796+00	
00000000-0000-0000-0000-000000000000	dd04e31c-5f1c-4381-b394-9edabc77c6cc	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-08 03:38:14.101382+00	
00000000-0000-0000-0000-000000000000	5f38cbfa-3dc9-4493-bcd9-137b33babb48	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-08 03:38:14.102101+00	
00000000-0000-0000-0000-000000000000	de2fa0f9-90f5-4a8f-bb9b-e903efc064a7	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-08 04:44:30.144846+00	
00000000-0000-0000-0000-000000000000	63bf2181-824f-436b-b99b-1ab2914dfd27	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-08 04:44:30.145505+00	
00000000-0000-0000-0000-000000000000	8bae646c-b206-4b6b-b389-f9a49a4a4fdf	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-08 05:49:16.862972+00	
00000000-0000-0000-0000-000000000000	503c48ca-2021-4f70-9215-9f6cdf1bc524	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-08 05:49:16.863716+00	
00000000-0000-0000-0000-000000000000	dfd492a4-1e19-478e-9fd8-9af7e03d40fb	{"action":"login","actor_id":"09729d16-de1d-4232-b28e-7ae14a08da3d","actor_username":"mobile-+380634953548@omir-app-test-auto-auto-app.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-08 06:51:30.405536+00	
00000000-0000-0000-0000-000000000000	f7480898-c498-4ec0-add8-42fd8dfd3ce2	{"action":"token_refreshed","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-08 06:53:10.202081+00	
00000000-0000-0000-0000-000000000000	5e5e103e-c75f-440e-a2bf-54208fda559b	{"action":"token_revoked","actor_id":"d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99","actor_username":"dk@omir.group","actor_via_sso":false,"log_type":"token"}	2024-02-08 06:53:10.202638+00	
00000000-0000-0000-0000-000000000000	d82b8deb-779c-401d-9fea-594678c8c159	{"action":"token_refreshed","actor_id":"ae2ab750-1e89-432b-bfe1-085156a9789e","actor_username":"riaboshlyk@etcetera.kiev.ua","actor_via_sso":false,"log_type":"token"}	2024-02-08 07:02:11.173369+00	
00000000-0000-0000-0000-000000000000	83bb93a6-a302-4e29-9611-d665d7c46944	{"action":"token_revoked","actor_id":"ae2ab750-1e89-432b-bfe1-085156a9789e","actor_username":"riaboshlyk@etcetera.kiev.ua","actor_via_sso":false,"log_type":"token"}	2024-02-08 07:02:11.174043+00	
00000000-0000-0000-0000-000000000000	cb76ab46-13c2-4c79-957f-5d3bd11cc99f	{"action":"login","actor_id":"09729d16-de1d-4232-b28e-7ae14a08da3d","actor_username":"mobile-+380634953548@omir-app-test-auto-auto-app.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-08 07:40:16.099622+00	
00000000-0000-0000-0000-000000000000	47aa5189-63ba-4605-b1e3-c93980076ec7	{"action":"login","actor_id":"09729d16-de1d-4232-b28e-7ae14a08da3d","actor_username":"mobile-+380634953548@omir-app-test-auto-auto-app.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-08 07:49:21.122124+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at") FROM stdin;
00000000-0000-0000-0000-000000000000	66825634-2339-4c02-88b9-f55281874772	authenticated	authenticated	geo.apopei@saltandpepper.co	$2a$10$/yIORVcqtr15IzpJhWZ4f.wWra1jytaCJtL.62X7hBhaiTaXVVYFy	2024-02-01 13:30:26.746028+00	\N		\N		\N			\N	\N	{"role": "applicationAdmin", "provider": "email", "providers": ["email"]}	{"fullName": "Geo Apopei"}	\N	2024-02-01 13:30:26.742883+00	2024-02-01 13:30:26.746201+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	ae2ab750-1e89-432b-bfe1-085156a9789e	authenticated	authenticated	riaboshlyk@etcetera.kiev.ua	$2a$10$bwYXcJt9QPpW2qWuIYgvYeW2WzpFqddxLA4k3wPH3sPLUA5lNo.ou	2024-02-01 13:57:47.424012+00	\N		\N		\N			\N	2024-02-07 13:09:51.787637+00	{"role": "applicationAdmin", "provider": "email", "providers": ["email"]}	{"fullName": "Veronika Riaboshlyk"}	\N	2024-02-01 13:57:47.420819+00	2024-02-08 07:02:11.175619+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	3e82c125-b0e5-47bc-8c56-14cecd11eb19	authenticated	authenticated	riaboshlyk+3@etcetera.kiev.ua	$2a$10$Y25JBSmW00sVtznVOEzHK.1V3AkD8sPTrS8WjLHSOszGlmHHQbIUW	2024-02-07 15:44:33.35061+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 15:44:33.347931+00	2024-02-07 19:43:22.109948+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	60eee909-cf0c-42b9-9268-e30e14eef01b	authenticated	authenticated	mobile-+380670000000@omir-app-test-auto-auto-app.com	$2a$10$KfxCBMrVq8CVF3CNiSLT1OExLlHcBxHv6JVsMFd3UcrwYTjTiswFi	2024-02-07 19:54:49.046465+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 19:54:49.043706+00	2024-02-07 19:54:55.474492+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	f0ba6e9d-b70c-4208-b580-0faf2a1366b2	authenticated	authenticated	mobile-+380990000000@omir-app-test-auto-auto-app.com	$2a$10$QBb08p.QNPUeXWgl7noWJOy2ppx.RMjiCMecztWuiO3rcdOP1dsuy	2024-02-07 19:50:57.366717+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 19:50:57.363823+00	2024-02-07 19:50:57.36687+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	0d4e0e3b-4933-4d4c-aa0a-4cc8748f3d5f	authenticated	authenticated	temporary-45664456@omir-app-test-auto-auto-app.com	$2a$10$4DshmQEA0o18FfJ.gKilb.IEo5T7MuWwt5qePLWKKv.JlIrzEXzsC	2024-02-07 15:41:15.149983+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 15:41:15.147108+00	2024-02-07 15:41:15.15018+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	9e9e58e2-2eb4-469b-999c-036d25a003d8	authenticated	authenticated	mihail.ciontu@saltandpepper.co	$2a$10$nnVpHebjUpu2ZX6Zhnaoh.oA3yi4DCWWf7AY0XeBgCNLyMnD9RHRO	2024-02-01 13:30:10.700711+00	\N		\N		\N			\N	2024-02-07 11:04:50.843228+00	{"role": "applicationAdmin", "provider": "email", "providers": ["email"]}	{"fullName": "Mihail Ciontu"}	\N	2024-02-01 13:30:10.696839+00	2024-02-07 11:04:50.846762+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	76ec272b-3e4d-4082-94a9-784a0b368a4e	authenticated	authenticated	aobetkal@gmail.com	$2a$10$axYNdV2z6xJWWNw681qWYew4ZuZLTOY2x3gwi2N3VR2tMPlCnlu1G	2024-02-01 13:23:57.049213+00	\N		\N		\N			\N	2024-02-07 17:55:16.591568+00	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-01 13:23:57.045263+00	2024-02-07 20:23:41.754321+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	9efbe1c2-b12f-4ad3-829f-6f31c13898e9	authenticated	authenticated	mobile-+77019998999@omir-app-my-emg.com	$2a$10$retHPCcybz9GgIoZTwqmcOJ6Wfh2GwJhOX2NASf.C/kRNN14QBz06	2024-02-07 07:36:45.253595+00	\N		\N		\N			\N	2024-02-07 09:00:00.4294+00	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 07:36:45.249291+00	2024-02-07 17:24:07.412867+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f	authenticated	authenticated	ao@omir.group	$2a$10$ViWeNUzrMm7gVigLaDXr2O4pPFHc7bSdamQnNhYmpBXuYQEzyNLyC	2024-02-01 13:10:51.566787+00	\N		\N		\N			\N	2024-02-07 07:41:08.366433+00	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-01 13:10:51.563363+00	2024-02-07 17:46:54.012825+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	09729d16-de1d-4232-b28e-7ae14a08da3d	authenticated	authenticated	mobile-+380634953548@omir-app-test-auto-auto-app.com	$2a$10$koQngPN6ntNLGwRMkK58ludZoLncoaWKW5jX7oskZBJ8wkG.v7an2	2024-02-07 19:46:28.342599+00	\N		\N		\N			\N	2024-02-08 07:49:21.122891+00	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 19:46:28.340106+00	2024-02-08 07:49:21.124864+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	6b8d262a-bdee-4060-afe7-333e7b9e011c	authenticated	authenticated	riaboshlyk+6@etcetera.kiev.ua	$2a$10$ELAP91e10osbkrcAGAQC6O0OtRsQgSQLjS5jBmT7tGv4qNiAHvQym	2024-02-07 19:32:56.22384+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 19:32:56.220892+00	2024-02-07 19:41:15.197888+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	d83e32eb-da46-475d-87d0-21a77d8bc969	authenticated	authenticated	riaboshlyk+2@etcetera.kiev.ua	$2a$10$Bs1hNQ.Gb3zU.sP3dQaMrOvOlW0ax4mS/M9C5VARlGp2.V46YNiom	2024-02-07 15:42:46.123249+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 15:42:46.120704+00	2024-02-07 19:42:50.829832+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	17573621-47e1-4337-ae4d-c868ea94ce59	authenticated	authenticated	temporary-rtyy5r@omir-app-test-auto-auto-app.com	$2a$10$/oZ8KHMkwWdwOfj8pBYx3OKe3JMNtm6VunLDvsW30i4/hOtZxzD2i	2024-02-07 20:01:00.050945+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 20:01:00.047403+00	2024-02-07 20:01:00.05119+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	1759fe0f-b701-438a-9dc5-bb9abf4949eb	authenticated	authenticated	testuser@mail.com	$2a$10$UEJxhVsSdONOgfPz5Agoxe8rRYPtbsp8Kw/S7W3cjKa/1AJH9aDAO	2024-02-07 19:52:52.310651+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 19:52:52.307782+00	2024-02-07 19:53:35.469108+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	61794625-90a9-4345-89c6-aeab5175da77	authenticated	authenticated	123@mail.com	$2a$10$n3i6.13uM2/OBsA1jfJSN.avjW5RC2A9VAZ5LHm6haSvzSOXeK4sa	2024-02-07 19:48:50.883185+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 19:48:50.8799+00	2024-02-07 19:49:47.715649+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	authenticated	authenticated	dk@omir.group	$2a$10$vH4hhzuksQprly0rXQN0sOqQh0DWJO4gcygSdwLYnMNEhCM9B4ytq	2024-02-01 13:58:10.326874+00	\N		\N		\N			\N	2024-02-07 07:14:46.736007+00	{"role": "applicationAdmin", "provider": "email", "providers": ["email"]}	{"fullName": "Dimash Kunayev"}	\N	2024-02-01 13:58:10.32266+00	2024-02-08 06:53:10.204589+00	\N	\N			\N		0	\N		\N	f	\N
00000000-0000-0000-0000-000000000000	ce34eed7-1d2c-4336-8f3f-2735a25d5c5f	authenticated	authenticated	mobile-+340440000000@omir-app-test-auto-auto-app.com	$2a$10$DZGYk1wMmokcq9guHMS69ucToT9Uaq6l6UYnklg.Ji1VDCZxSccV.	2024-02-07 20:04:00.462023+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-02-07 20:04:00.458665+00	2024-02-07 20:04:00.462199+00	\N	\N			\N		0	\N		\N	f	\N
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") FROM stdin;
63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f	63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f	{"sub": "63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f", "email": "ao@omir.group", "email_verified": false, "phone_verified": false}	email	2024-02-01 13:10:51.564438+00	2024-02-01 13:10:51.56448+00	2024-02-01 13:10:51.56448+00	5ddb8c72-be04-4d56-9da8-dd7faba4745e
76ec272b-3e4d-4082-94a9-784a0b368a4e	76ec272b-3e4d-4082-94a9-784a0b368a4e	{"sub": "76ec272b-3e4d-4082-94a9-784a0b368a4e", "email": "aobetkal@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-02-01 13:23:57.046699+00	2024-02-01 13:23:57.046779+00	2024-02-01 13:23:57.046779+00	e339cde7-b6ab-476f-b244-58db387c46a5
9e9e58e2-2eb4-469b-999c-036d25a003d8	9e9e58e2-2eb4-469b-999c-036d25a003d8	{"sub": "9e9e58e2-2eb4-469b-999c-036d25a003d8", "email": "mihail.ciontu@saltandpepper.co", "email_verified": false, "phone_verified": false}	email	2024-02-01 13:30:10.698154+00	2024-02-01 13:30:10.698195+00	2024-02-01 13:30:10.698195+00	12fe06f3-74f8-4160-9698-22adba571e24
66825634-2339-4c02-88b9-f55281874772	66825634-2339-4c02-88b9-f55281874772	{"sub": "66825634-2339-4c02-88b9-f55281874772", "email": "geo.apopei@saltandpepper.co", "email_verified": false, "phone_verified": false}	email	2024-02-01 13:30:26.743948+00	2024-02-01 13:30:26.743988+00	2024-02-01 13:30:26.743988+00	2076fb89-285e-48ef-b802-e8a484071b4e
ae2ab750-1e89-432b-bfe1-085156a9789e	ae2ab750-1e89-432b-bfe1-085156a9789e	{"sub": "ae2ab750-1e89-432b-bfe1-085156a9789e", "email": "riaboshlyk@etcetera.kiev.ua", "email_verified": false, "phone_verified": false}	email	2024-02-01 13:57:47.421812+00	2024-02-01 13:57:47.421853+00	2024-02-01 13:57:47.421853+00	a2cd91ca-e77d-4e17-9588-59c5f97877c2
d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	{"sub": "d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99", "email": "dk@omir.group", "email_verified": false, "phone_verified": false}	email	2024-02-01 13:58:10.323578+00	2024-02-01 13:58:10.323893+00	2024-02-01 13:58:10.323893+00	e98ff630-8099-4864-b380-cf9a6041ee9f
9efbe1c2-b12f-4ad3-829f-6f31c13898e9	9efbe1c2-b12f-4ad3-829f-6f31c13898e9	{"sub": "9efbe1c2-b12f-4ad3-829f-6f31c13898e9", "email": "mobile-+77019998999@omir-app-my-emg.com", "email_verified": false, "phone_verified": false}	email	2024-02-07 07:36:45.251245+00	2024-02-07 07:36:45.251315+00	2024-02-07 07:36:45.251315+00	4d9d87c8-ec15-4b10-b5b0-2c62b60594af
0d4e0e3b-4933-4d4c-aa0a-4cc8748f3d5f	0d4e0e3b-4933-4d4c-aa0a-4cc8748f3d5f	{"sub": "0d4e0e3b-4933-4d4c-aa0a-4cc8748f3d5f", "email": "temporary-45664456@omir-app-test-auto-auto-app.com", "email_verified": false, "phone_verified": false}	email	2024-02-07 15:41:15.148223+00	2024-02-07 15:41:15.148289+00	2024-02-07 15:41:15.148289+00	7f8f97c1-c654-4f7d-8d34-3c12f192be9b
d83e32eb-da46-475d-87d0-21a77d8bc969	d83e32eb-da46-475d-87d0-21a77d8bc969	{"sub": "d83e32eb-da46-475d-87d0-21a77d8bc969", "email": "riaboshlyk+2@etcetera.kiev.ua", "email_verified": false, "phone_verified": false}	email	2024-02-07 15:42:46.121683+00	2024-02-07 15:42:46.121727+00	2024-02-07 15:42:46.121727+00	648d3e50-5c75-43c2-bb12-3d782378b2be
3e82c125-b0e5-47bc-8c56-14cecd11eb19	3e82c125-b0e5-47bc-8c56-14cecd11eb19	{"sub": "3e82c125-b0e5-47bc-8c56-14cecd11eb19", "email": "riaboshlyk+3@etcetera.kiev.ua", "email_verified": false, "phone_verified": false}	email	2024-02-07 15:44:33.34897+00	2024-02-07 15:44:33.349008+00	2024-02-07 15:44:33.349008+00	c2dff5c0-5689-4de8-aa34-4ffdc3498c0b
6b8d262a-bdee-4060-afe7-333e7b9e011c	6b8d262a-bdee-4060-afe7-333e7b9e011c	{"sub": "6b8d262a-bdee-4060-afe7-333e7b9e011c", "email": "riaboshlyk+6@etcetera.kiev.ua", "email_verified": false, "phone_verified": false}	email	2024-02-07 19:32:56.222128+00	2024-02-07 19:32:56.222169+00	2024-02-07 19:32:56.222169+00	1b1fabf3-de2c-4047-a5a0-86776a88b4a7
09729d16-de1d-4232-b28e-7ae14a08da3d	09729d16-de1d-4232-b28e-7ae14a08da3d	{"sub": "09729d16-de1d-4232-b28e-7ae14a08da3d", "email": "mobile-+380634953548@omir-app-test-auto-auto-app.com", "email_verified": false, "phone_verified": false}	email	2024-02-07 19:46:28.341122+00	2024-02-07 19:46:28.341162+00	2024-02-07 19:46:28.341162+00	56168702-9cc1-4675-b09d-49b2a7dfab34
61794625-90a9-4345-89c6-aeab5175da77	61794625-90a9-4345-89c6-aeab5175da77	{"sub": "61794625-90a9-4345-89c6-aeab5175da77", "email": "123@mail.com", "email_verified": false, "phone_verified": false}	email	2024-02-07 19:48:50.881307+00	2024-02-07 19:48:50.881353+00	2024-02-07 19:48:50.881353+00	82488768-95c0-4a1f-bc47-7bbd9952acf0
f0ba6e9d-b70c-4208-b580-0faf2a1366b2	f0ba6e9d-b70c-4208-b580-0faf2a1366b2	{"sub": "f0ba6e9d-b70c-4208-b580-0faf2a1366b2", "email": "mobile-+380990000000@omir-app-test-auto-auto-app.com", "email_verified": false, "phone_verified": false}	email	2024-02-07 19:50:57.365069+00	2024-02-07 19:50:57.365112+00	2024-02-07 19:50:57.365112+00	eecf9b55-d06b-46cc-b7ee-5a7d1839a871
1759fe0f-b701-438a-9dc5-bb9abf4949eb	1759fe0f-b701-438a-9dc5-bb9abf4949eb	{"sub": "1759fe0f-b701-438a-9dc5-bb9abf4949eb", "email": "testuser@mail.com", "email_verified": false, "phone_verified": false}	email	2024-02-07 19:52:52.308883+00	2024-02-07 19:52:52.308924+00	2024-02-07 19:52:52.308924+00	a38ca70f-5a3c-4ce6-9643-e3af115e562a
60eee909-cf0c-42b9-9268-e30e14eef01b	60eee909-cf0c-42b9-9268-e30e14eef01b	{"sub": "60eee909-cf0c-42b9-9268-e30e14eef01b", "email": "mobile-+380670000000@omir-app-test-auto-auto-app.com", "email_verified": false, "phone_verified": false}	email	2024-02-07 19:54:49.044759+00	2024-02-07 19:54:49.044819+00	2024-02-07 19:54:49.044819+00	c73ce1b7-a902-4d09-9276-f07b98e3ffb2
17573621-47e1-4337-ae4d-c868ea94ce59	17573621-47e1-4337-ae4d-c868ea94ce59	{"sub": "17573621-47e1-4337-ae4d-c868ea94ce59", "email": "temporary-rtyy5r@omir-app-test-auto-auto-app.com", "email_verified": false, "phone_verified": false}	email	2024-02-07 20:01:00.049173+00	2024-02-07 20:01:00.049235+00	2024-02-07 20:01:00.049235+00	0828cad1-36cf-4866-941e-bbbb58805b32
ce34eed7-1d2c-4336-8f3f-2735a25d5c5f	ce34eed7-1d2c-4336-8f3f-2735a25d5c5f	{"sub": "ce34eed7-1d2c-4336-8f3f-2735a25d5c5f", "email": "mobile-+340440000000@omir-app-test-auto-auto-app.com", "email_verified": false, "phone_verified": false}	email	2024-02-07 20:04:00.459907+00	2024-02-07 20:04:00.459974+00	2024-02-07 20:04:00.459974+00	f39ead2a-f858-47e0-8cf4-2cf515dfa420
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."instances" ("id", "uuid", "raw_base_config", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") FROM stdin;
fda6a988-79d7-4e74-8645-ecf712556687	09729d16-de1d-4232-b28e-7ae14a08da3d	2024-02-08 06:51:30.406409+00	2024-02-08 06:51:30.406409+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 17_2_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Mobile/15E148 Safari/604.1	212.90.63.254	\N
1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	2024-02-07 07:14:46.736115+00	2024-02-08 06:53:10.205445+00	\N	aal1	\N	2024-02-08 06:53:10.205389	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	145.249.199.160	\N
bdf026de-3a2e-4324-b201-be6fe5324d59	ae2ab750-1e89-432b-bfe1-085156a9789e	2024-02-07 13:09:51.787709+00	2024-02-08 07:02:11.176481+00	\N	aal1	\N	2024-02-08 07:02:11.176421	Vercel Edge Functions	2a06:98c0:3600::103	\N
0646c3c9-5402-46b0-88a8-26b7d5ce70ae	09729d16-de1d-4232-b28e-7ae14a08da3d	2024-02-08 07:40:16.100565+00	2024-02-08 07:40:16.100565+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36	212.90.63.254	\N
55e01828-d79f-4362-bd56-ee3503e1281a	09729d16-de1d-4232-b28e-7ae14a08da3d	2024-02-08 07:49:21.122959+00	2024-02-08 07:49:21.122959+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 17_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/121.0.6167.171 Mobile/15E148 Safari/604.1	212.90.63.254	\N
10f4094f-40c5-4d94-8aea-f5d180f47877	ae2ab750-1e89-432b-bfe1-085156a9789e	2024-02-01 15:12:21.913288+00	2024-02-01 15:12:21.913288+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.1.2 Safari/605.1.15	146.70.181.9	\N
785ad119-2c72-4804-8b85-9e561b56346f	9e9e58e2-2eb4-469b-999c-036d25a003d8	2024-02-07 07:53:54.662657+00	2024-02-07 07:53:54.662657+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	86.123.229.87	\N
a626efb0-e9ad-4371-b45e-790d6b3bf4ca	9e9e58e2-2eb4-469b-999c-036d25a003d8	2024-02-07 07:56:52.066127+00	2024-02-07 07:56:52.066127+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	86.123.229.87	\N
54f44c17-bd8d-4f91-b964-1ef57162ba39	9e9e58e2-2eb4-469b-999c-036d25a003d8	2024-02-07 07:57:38.730104+00	2024-02-07 07:57:38.730104+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	86.123.229.87	\N
e7d6a5d5-e175-4e62-8649-707a5ad2a7b0	9e9e58e2-2eb4-469b-999c-036d25a003d8	2024-02-07 11:04:50.843848+00	2024-02-07 11:04:50.843848+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36	86.123.229.87	\N
7ce0f949-22ee-4f9f-a741-0a349f984e73	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	2024-02-06 08:13:16.75164+00	2024-02-06 13:38:43.427002+00	\N	aal1	\N	2024-02-06 13:38:43.426946	Vercel Edge Functions	2a06:98c0:3600::103	\N
f9170f94-9474-4186-8c02-9ae6a9037bc2	9efbe1c2-b12f-4ad3-829f-6f31c13898e9	2024-02-07 09:00:00.429491+00	2024-02-07 17:24:07.413769+00	\N	aal1	\N	2024-02-07 17:24:07.413707	Vercel Edge Functions	2a06:98c0:3600::103	\N
d1478cc9-d781-4a69-8471-10d349e4238a	76ec272b-3e4d-4082-94a9-784a0b368a4e	2024-02-07 17:55:16.591654+00	2024-02-07 20:23:41.755249+00	\N	aal1	\N	2024-02-07 20:23:41.755177	Vercel Edge Functions	2a06:98c0:3600::103	\N
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") FROM stdin;
10f4094f-40c5-4d94-8aea-f5d180f47877	2024-02-01 15:12:21.91525+00	2024-02-01 15:12:21.91525+00	password	7a3d6934-2d7f-4805-871e-8b77c204dc0a
7ce0f949-22ee-4f9f-a741-0a349f984e73	2024-02-06 08:13:16.754004+00	2024-02-06 08:13:16.754004+00	password	47d1e141-7b03-439a-b50f-b0a45853e961
1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b	2024-02-07 07:14:46.739559+00	2024-02-07 07:14:46.739559+00	password	72344abd-a70a-400c-bee0-4158d904c2f9
785ad119-2c72-4804-8b85-9e561b56346f	2024-02-07 07:53:54.664289+00	2024-02-07 07:53:54.664289+00	password	226c91e9-28b6-4ab6-a9ff-d13e1df9d784
a626efb0-e9ad-4371-b45e-790d6b3bf4ca	2024-02-07 07:56:52.067848+00	2024-02-07 07:56:52.067848+00	password	61010a81-8f58-42b4-8481-bbfc11f63a2d
54f44c17-bd8d-4f91-b964-1ef57162ba39	2024-02-07 07:57:38.731591+00	2024-02-07 07:57:38.731591+00	password	4698d00a-4040-4f75-bedd-a582388d0b31
f9170f94-9474-4186-8c02-9ae6a9037bc2	2024-02-07 09:00:00.431303+00	2024-02-07 09:00:00.431303+00	password	5b21828f-de60-4b10-88b0-f09305a9366a
e7d6a5d5-e175-4e62-8649-707a5ad2a7b0	2024-02-07 11:04:50.8473+00	2024-02-07 11:04:50.8473+00	password	cec86c55-3d1c-429b-9055-c9f3435d9a7b
bdf026de-3a2e-4324-b201-be6fe5324d59	2024-02-07 13:09:51.790175+00	2024-02-07 13:09:51.790175+00	password	0cadff6c-7686-4cd3-b921-41c6ae842f89
d1478cc9-d781-4a69-8471-10d349e4238a	2024-02-07 17:55:16.593374+00	2024-02-07 17:55:16.593374+00	password	913fc850-e6c0-4ad3-b1eb-4ed3db75a8a9
fda6a988-79d7-4e74-8645-ecf712556687	2024-02-08 06:51:30.408831+00	2024-02-08 06:51:30.408831+00	password	3939428a-f179-4bf4-8e72-80f0d3f4e72a
0646c3c9-5402-46b0-88a8-26b7d5ce70ae	2024-02-08 07:40:16.103062+00	2024-02-08 07:40:16.103062+00	password	c95a8b1e-06e2-4578-b3eb-9aebcf3391f1
55e01828-d79f-4362-bd56-ee3503e1281a	2024-02-08 07:49:21.12512+00	2024-02-08 07:49:21.12512+00	password	199ea3df-abbe-4aec-9b78-a8dc6d0f8319
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_factors" ("id", "user_id", "friendly_name", "factor_type", "status", "created_at", "updated_at", "secret") FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_challenges" ("id", "factor_id", "created_at", "verified_at", "ip_address") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") FROM stdin;
00000000-0000-0000-0000-000000000000	66	uLRv09iiCEBvSq5aGogL5w	ae2ab750-1e89-432b-bfe1-085156a9789e	t	2024-02-07 13:09:51.788776+00	2024-02-07 15:12:50.620858+00	\N	bdf026de-3a2e-4324-b201-be6fe5324d59
00000000-0000-0000-0000-000000000000	68	u-HJ4VGCabu8wkZjk8CMuw	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-07 14:02:41.380551+00	2024-02-07 15:35:46.60358+00	cdoc50ql5XDtZxrXvZUw8w	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	70	n90QXz8XDjIXvvpCod1mHg	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-07 15:35:46.604047+00	2024-02-07 16:39:18.215436+00	u-HJ4VGCabu8wkZjk8CMuw	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	64	iNH1SONEf1e9MK78JU9oIA	9efbe1c2-b12f-4ad3-829f-6f31c13898e9	t	2024-02-07 11:09:07.091168+00	2024-02-07 17:24:07.411613+00	ojvjC3TFKzLjkAj-AUOGEQ	f9170f94-9474-4186-8c02-9ae6a9037bc2
00000000-0000-0000-0000-000000000000	73	2HxVL5EDGDB9sQLeVj71jw	9efbe1c2-b12f-4ad3-829f-6f31c13898e9	f	2024-02-07 17:24:07.412072+00	2024-02-07 17:24:07.412072+00	iNH1SONEf1e9MK78JU9oIA	f9170f94-9474-4186-8c02-9ae6a9037bc2
00000000-0000-0000-0000-000000000000	13	bDZMGFQPK3MTUBlm87abFQ	ae2ab750-1e89-432b-bfe1-085156a9789e	f	2024-02-01 15:12:21.914136+00	2024-02-01 15:12:21.914136+00	\N	10f4094f-40c5-4d94-8aea-f5d180f47877
00000000-0000-0000-0000-000000000000	72	ChEue4Ug4tewyDz1l85imA	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-07 16:39:18.215939+00	2024-02-07 17:53:28.993411+00	n90QXz8XDjIXvvpCod1mHg	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	69	_6w3BaMYm8CwMb6KlXsl7Q	ae2ab750-1e89-432b-bfe1-085156a9789e	t	2024-02-07 15:12:50.621322+00	2024-02-07 19:11:20.184997+00	uLRv09iiCEBvSq5aGogL5w	bdf026de-3a2e-4324-b201-be6fe5324d59
00000000-0000-0000-0000-000000000000	76	6vMrjLj3F7lHrDFNCbiypA	76ec272b-3e4d-4082-94a9-784a0b368a4e	t	2024-02-07 17:55:16.592346+00	2024-02-07 20:23:41.752572+00	\N	d1478cc9-d781-4a69-8471-10d349e4238a
00000000-0000-0000-0000-000000000000	78	mrMoAU-XuDWeLQSEjp-kXg	76ec272b-3e4d-4082-94a9-784a0b368a4e	f	2024-02-07 20:23:41.753341+00	2024-02-07 20:23:41.753341+00	6vMrjLj3F7lHrDFNCbiypA	d1478cc9-d781-4a69-8471-10d349e4238a
00000000-0000-0000-0000-000000000000	75	dwcp_a-IQlOd8AhTAZctxw	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-07 17:53:28.993935+00	2024-02-07 21:07:10.473235+00	ChEue4Ug4tewyDz1l85imA	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	79	pkOld4gHr1nBsRD4nMY6KQ	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-07 21:07:10.473831+00	2024-02-08 01:23:19.108144+00	dwcp_a-IQlOd8AhTAZctxw	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	80	A7luyeGMc4_HhWKfpJaYjA	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-08 01:23:19.108596+00	2024-02-08 03:38:14.102562+00	pkOld4gHr1nBsRD4nMY6KQ	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	81	JEzd20o6Gui1JfrQKUDdUQ	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-08 03:38:14.103069+00	2024-02-08 04:44:30.145877+00	A7luyeGMc4_HhWKfpJaYjA	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	82	gFCcxVuFUxSuo8ZBoAkGjw	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-08 04:44:30.146329+00	2024-02-08 05:49:16.864114+00	JEzd20o6Gui1JfrQKUDdUQ	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	84	1fbyfI2udhij-wJzZc2hSA	09729d16-de1d-4232-b28e-7ae14a08da3d	f	2024-02-08 06:51:30.407497+00	2024-02-08 06:51:30.407497+00	\N	fda6a988-79d7-4e74-8645-ecf712556687
00000000-0000-0000-0000-000000000000	83	KIZ73uRr0E7MJLiQ0fEt9Q	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-08 05:49:16.864551+00	2024-02-08 06:53:10.20325+00	gFCcxVuFUxSuo8ZBoAkGjw	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	33	QVsWCuno8dskpIVCZqe6LQ	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-06 08:13:16.752709+00	2024-02-06 09:29:42.053783+00	\N	7ce0f949-22ee-4f9f-a741-0a349f984e73
00000000-0000-0000-0000-000000000000	85	GN85Ytse79rqxpM3s1ac-Q	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	f	2024-02-08 06:53:10.203647+00	2024-02-08 06:53:10.203647+00	KIZ73uRr0E7MJLiQ0fEt9Q	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	35	QNuY38RHpF08NVEMhRaalw	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-06 09:29:42.054319+00	2024-02-06 11:28:28.56116+00	QVsWCuno8dskpIVCZqe6LQ	7ce0f949-22ee-4f9f-a741-0a349f984e73
00000000-0000-0000-0000-000000000000	77	7-FPxmbQ_eEOJRYliYSZvw	ae2ab750-1e89-432b-bfe1-085156a9789e	t	2024-02-07 19:11:20.185637+00	2024-02-08 07:02:11.174448+00	_6w3BaMYm8CwMb6KlXsl7Q	bdf026de-3a2e-4324-b201-be6fe5324d59
00000000-0000-0000-0000-000000000000	36	4GlWv1Sb8SguqND0Db5K1Q	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-06 11:28:28.561628+00	2024-02-06 13:38:42.365013+00	QNuY38RHpF08NVEMhRaalw	7ce0f949-22ee-4f9f-a741-0a349f984e73
00000000-0000-0000-0000-000000000000	38	QPjKOh2WfkmGaQpHsrETVw	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	f	2024-02-06 13:38:42.365419+00	2024-02-06 13:38:42.365419+00	4GlWv1Sb8SguqND0Db5K1Q	7ce0f949-22ee-4f9f-a741-0a349f984e73
00000000-0000-0000-0000-000000000000	86	dn9cGAC4US2vGmT0WSqSkg	ae2ab750-1e89-432b-bfe1-085156a9789e	f	2024-02-08 07:02:11.17487+00	2024-02-08 07:02:11.17487+00	7-FPxmbQ_eEOJRYliYSZvw	bdf026de-3a2e-4324-b201-be6fe5324d59
00000000-0000-0000-0000-000000000000	87	l9bdxsuZQ2ydfO42S-xabw	09729d16-de1d-4232-b28e-7ae14a08da3d	f	2024-02-08 07:40:16.101418+00	2024-02-08 07:40:16.101418+00	\N	0646c3c9-5402-46b0-88a8-26b7d5ce70ae
00000000-0000-0000-0000-000000000000	88	8m6WbLZyB_d51TGtOD7Gmw	09729d16-de1d-4232-b28e-7ae14a08da3d	f	2024-02-08 07:49:21.123836+00	2024-02-08 07:49:21.123836+00	\N	55e01828-d79f-4362-bd56-ee3503e1281a
00000000-0000-0000-0000-000000000000	58	aZzqakQ_3ndYr6EqQ8aPrQ	9e9e58e2-2eb4-469b-999c-036d25a003d8	f	2024-02-07 07:53:54.663308+00	2024-02-07 07:53:54.663308+00	\N	785ad119-2c72-4804-8b85-9e561b56346f
00000000-0000-0000-0000-000000000000	59	nFjmvI8249k9293sZo0Vpg	9e9e58e2-2eb4-469b-999c-036d25a003d8	f	2024-02-07 07:56:52.066738+00	2024-02-07 07:56:52.066738+00	\N	a626efb0-e9ad-4371-b45e-790d6b3bf4ca
00000000-0000-0000-0000-000000000000	60	KDgnqO2Bx3QIALZwi9MDzQ	9e9e58e2-2eb4-469b-999c-036d25a003d8	f	2024-02-07 07:57:38.730596+00	2024-02-07 07:57:38.730596+00	\N	54f44c17-bd8d-4f91-b964-1ef57162ba39
00000000-0000-0000-0000-000000000000	44	MOhtDKpnY0-AdFlBUwfppw	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-07 07:14:46.737318+00	2024-02-07 08:32:18.050586+00	\N	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	63	UEHpeovbDQEJBXBVinjBPw	9e9e58e2-2eb4-469b-999c-036d25a003d8	f	2024-02-07 11:04:50.845395+00	2024-02-07 11:04:50.845395+00	\N	e7d6a5d5-e175-4e62-8649-707a5ad2a7b0
00000000-0000-0000-0000-000000000000	62	ojvjC3TFKzLjkAj-AUOGEQ	9efbe1c2-b12f-4ad3-829f-6f31c13898e9	t	2024-02-07 09:00:00.43014+00	2024-02-07 11:09:07.090087+00	\N	f9170f94-9474-4186-8c02-9ae6a9037bc2
00000000-0000-0000-0000-000000000000	61	AkfaU5ugRJY-l8hCloZNsQ	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-07 08:32:18.051057+00	2024-02-07 12:00:24.916821+00	MOhtDKpnY0-AdFlBUwfppw	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
00000000-0000-0000-0000-000000000000	65	cdoc50ql5XDtZxrXvZUw8w	d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	t	2024-02-07 12:00:24.917275+00	2024-02-07 14:02:41.380063+00	AkfaU5ugRJY-l8hCloZNsQ	1d51fc4b-ef8b-4c61-a534-90a3ec3bfe0b
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_providers" ("id", "resource_id", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_providers" ("id", "sso_provider_id", "entity_id", "metadata_xml", "metadata_url", "attribute_mapping", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_relay_states" ("id", "sso_provider_id", "request_id", "for_email", "redirect_to", "from_ip_address", "created_at", "updated_at", "flow_state_id") FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_domains" ("id", "sso_provider_id", "domain", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY "pgsodium"."key" ("id", "status", "created", "expires", "key_type", "key_id", "key_context", "name", "associated_data", "raw_key", "raw_key_nonce", "parent_key", "comment", "user_data") FROM stdin;
\.


--
-- Data for Name: organisations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."organisations" ("id", "createdAt", "isActive", "primaryColor", "applicationName", "iconUrl", "logoUrl", "termsUrl", "privacyUrl", "supportEmail", "manifestIcons") FROM stdin;
test-auto-auto-app	2024-02-07 15:15:14+00	t	#6515bf	Auto App	https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/public/icon.webp?1707319472265	https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/public/logo.webp?1707319471524	https://drive.google.com/file/d/1i3RyLSLY-X5SDQ1GLwpF5LOh11IUi_Et/view?usp=sharing	https://drive.google.com/file/d/1i3RyLSLY-X5SDQ1GLwpF5LOh11IUi_Et/view?usp=sharing	support@omir.group	{https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/public/manifest/manifest-icon-16x16.webp?1707319473236,https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/public/manifest/manifest-icon-32x32.webp?1707319473433,https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/public/manifest/manifest-icon-128x128.webp?1707319473595,https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/public/manifest/manifest-icon-180x180.webp?1707319473759,https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/public/manifest/manifest-icon-192x192.webp?1707319473938,https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/public/manifest/manifest-icon-256x256.webp?1707319474100,https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/public/manifest/manifest-icon-384x384.webp?1707319474270,https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/public/manifest/manifest-icon-512x512.webp?1707319474482}
test-demon-slayer	2024-02-01 13:16:38+00	t	#ad5727	Omir App	https://api.omir.app/storage/v1/object/public/default/organisations/test-demon-slayer/public/icon.webp?1706798036930	https://api.omir.app/storage/v1/object/public/default/organisations/test-demon-slayer/public/logo.webp?1706793783574	https://drive.google.com/file/d/1i3RyLSLY-X5SDQ1GLwpF5LOh11IUi_Et/view?usp=sharing	https://drive.google.com/file/d/1i3RyLSLY-X5SDQ1GLwpF5LOh11IUi_Et/view?usp=sharing	support@omir.group	{}
my-emg	2024-02-07 07:15:30+00	t	#1565C0	My EMG	https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/public/icon.webp?1707290906269	https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/public/logo.webp?1707290905499	https://drive.google.com/file/d/1i3RyLSLY-X5SDQ1GLwpF5LOh11IUi_Et/view?usp=sharing	https://drive.google.com/file/d/1i3RyLSLY-X5SDQ1GLwpF5LOh11IUi_Et/view?usp=sharing	support@omir.group	{https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/public/manifest/manifest-icon-16x16.webp?1707290907257,https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/public/manifest/manifest-icon-32x32.webp?1707290907488,https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/public/manifest/manifest-icon-128x128.webp?1707290907649,https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/public/manifest/manifest-icon-180x180.webp?1707290907818,https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/public/manifest/manifest-icon-192x192.webp?1707290907983,https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/public/manifest/manifest-icon-256x256.webp?1707290908192,https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/public/manifest/manifest-icon-384x384.webp?1707290908380,https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/public/manifest/manifest-icon-512x512.webp?1707290908585}
\.


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."challenges" ("id", "createdAt", "organisation", "views", "image", "title", "leaderText", "bodyText", "isCarouselElement", "hasLeaderboardButton", "endDate") FROM stdin;
1	2024-02-01 13:17:07+00	test-demon-slayer	31	https://api.omir.app/storage/v1/object/public/default/organisations/test-demon-slayer/challenges/challenge-2.webp	{"en": "test5", "ru": "", "kaz": ""}	{"en": "test", "ru": "", "kaz": ""}	{"en": "test", "ru": "", "kaz": ""}	t	t	2024-02-21 22:59:59+00
2	2024-02-01 13:18:36+00	test-demon-slayer	19	https://api.omir.app/storage/v1/object/public/default/organisations/test-demon-slayer/challenges/challenge-2.webp	{"en": "test1Feb", "ru": "", "kaz": ""}	{"en": "test", "ru": "", "kaz": ""}	{"en": "test", "ru": "", "kaz": ""}	t	t	2024-02-23 22:59:59+00
3	2024-02-07 15:19:13+00	test-auto-auto-app	2	https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/challenges/challenge-3.webp	{"en": "eng", "ru": "rus", "kaz": "kaz"}	{"en": "end", "ru": "rus", "kaz": "kaz"}	{"en": "eng", "ru": "rus", "kaz": "kaz"}	f	f	2024-02-07 21:59:59+00
4	2024-02-07 15:39:27+00	test-auto-auto-app	0	\N	{"en": "123", "ru": "", "kaz": ""}	{"en": "123", "ru": "", "kaz": ""}	{"en": "123", "ru": "", "kaz": ""}	t	t	2024-02-07 21:59:59+00
\.


--
-- Data for Name: leaderboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."leaderboards" ("id", "createdAt", "organisation", "unit", "incidentDate") FROM stdin;
1	2024-02-07 15:22:27+00	test-auto-auto-app	test_0702_001	2024-02-06 22:00:00+00
2	2024-02-07 15:22:41+00	test-auto-auto-app	test_0702_002	2024-01-31 22:00:00+00
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."roles" ("id", "createdAt", "organisation", "accountSettings", "challenges", "leaderboard", "myReports", "news", "organisationReports", "profile", "report", "settings", "userManagement", "userProfile", "name", "homeDashboard") FROM stdin;
1	2024-02-01 14:16:38	test-demon-slayer	{"default": {"read": true, "update": true}}	{"default": {"read": true, "create": false, "delete": false}}	{"default": {"read": true, "update": false}}	{"default": {"read": true}}	{"default": {"read": true, "create": false, "delete": false}}	{"default": {"read": false, "update": false}}	{"default": {"read": true, "update": true}}	{"default": {"create": true}}	{"plan": {"read": false}, "billing": {"read": false}, "branding": {"read": false, "update": false}, "payments": {"read": false}, "loginPage": {"read": false, "update": false}, "structure": {"read": false, "update": false}}	{"users": {"read": false, "delete": false, "update": false}, "import": {"read": false}, "manualAdd": {"create": false}, "rolesAccess": {"read": false, "create": false, "update": false}}	{"default": {"read": true, "delete": false, "update": false}}	Worker	{"default": {"read": true}}
2	2024-02-07 07:15:30	my-emg	{"default": {"read": true, "update": true}}	{"default": {"read": true, "create": false, "delete": false}}	{"default": {"read": true, "update": false}}	{"default": {"read": true}}	{"default": {"read": true, "create": false, "delete": false}}	{"default": {"read": false, "update": false}}	{"default": {"read": true, "update": true}}	{"default": {"create": true}}	{"plan": {"read": false}, "billing": {"read": false}, "branding": {"read": false, "update": false}, "payments": {"read": false}, "loginPage": {"read": false, "update": false}, "structure": {"read": false, "update": false}}	{"users": {"read": false, "delete": false, "update": false}, "import": {"read": false}, "manualAdd": {"create": false}, "rolesAccess": {"read": false, "create": false, "update": false}}	{"default": {"read": true, "delete": false, "update": false}}	Worker	{"default": {"read": true}}
3	2024-02-07 07:34:02	my-emg	{"default": {"read": true, "update": true}}	{"default": {"read": true, "create": true, "delete": true}}	{"default": {"read": true, "update": true}}	{"default": {"read": true}}	{"default": {"read": true, "create": true, "delete": true}}	{"default": {"read": true, "update": true}}	{"default": {"read": true, "update": true}}	{"default": {"create": true}}	{"plan": {"read": true}, "billing": {"read": true}, "branding": {"read": true, "update": true}, "payments": {"read": true}, "loginPage": {"read": true, "update": true}, "structure": {"read": true, "update": true}}	{"users": {"read": true, "delete": true, "update": true}, "import": {"read": true}, "manualAdd": {"create": true}, "rolesAccess": {"read": true, "create": true, "update": true}}	{"default": {"read": true, "delete": true, "update": true}}	Admin	{"default": {"read": true}}
4	2024-02-07 15:15:14	test-auto-auto-app	{"default": {"read": true, "update": true}}	{"default": {"read": true, "create": false, "delete": false}}	{"default": {"read": true, "update": false}}	{"default": {"read": true}}	{"default": {"read": true, "create": false, "delete": false}}	{"default": {"read": false, "update": false}}	{"default": {"read": true, "update": true}}	{"default": {"create": true}}	{"plan": {"read": false}, "billing": {"read": false}, "branding": {"read": false, "update": false}, "payments": {"read": false}, "loginPage": {"read": false, "update": false}, "structure": {"read": false, "update": false}}	{"users": {"read": false, "delete": false, "update": false}, "import": {"read": false}, "manualAdd": {"create": false}, "rolesAccess": {"read": false, "create": false, "update": false}}	{"default": {"read": true, "delete": false, "update": false}}	Worker	{"default": {"read": true}}
5	2024-02-07 15:37:46	test-auto-auto-app	{"default": {"read": true, "update": true}}	{"default": {"read": true, "create": true, "delete": true}}	{"default": {"read": true, "update": true}}	{"default": {"read": true}}	{"default": {"read": true, "create": true, "delete": true}}	{"default": {"read": false, "update": false}}	{"default": {"read": true, "update": true}}	{"default": {"create": true}}	{"plan": {"read": false}, "billing": {"read": false}, "branding": {"read": false, "update": false}, "payments": {"read": false}, "loginPage": {"read": false, "update": false}, "structure": {"read": false, "update": false}}	{"users": {"read": false, "delete": false, "update": false}, "import": {"read": false}, "manualAdd": {"create": false}, "rolesAccess": {"read": false, "create": false, "update": false}}	{"default": {"read": true, "delete": true, "update": true}}	CEO	{"default": {"read": true}}
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."users" ("id", "createdAt", "organisation", "language", "role", "status", "loginMethod", "beforeBlockStatus", "isPushNotificationAllowed", "pushNotificationTokenId", "resetPasswordKey", "isPasswordChanged", "applicationRole", "lastLogin") FROM stdin;
6b8d262a-bdee-4060-afe7-333e7b9e011c	2024-02-07 19:32:56+00	test-auto-auto-app	en	5	invited	email	created	\N	\N	\N	f	user	\N
d83e32eb-da46-475d-87d0-21a77d8bc969	2024-02-07 15:42:46+00	test-auto-auto-app	en	4	invited	email	created	f		\N	f	user	\N
3e82c125-b0e5-47bc-8c56-14cecd11eb19	2024-02-07 15:44:33+00	test-auto-auto-app	en	4	invited	email	created	f		\N	f	user	\N
9e9e58e2-2eb4-469b-999c-036d25a003d8	2024-02-01 13:30:10+00	\N	en	\N	active	email	\N	\N	\N	\N	\N	admin	\N
66825634-2339-4c02-88b9-f55281874772	2024-02-01 13:30:26+00	\N	en	\N	active	email	\N	\N	\N	\N	\N	admin	\N
9efbe1c2-b12f-4ad3-829f-6f31c13898e9	2024-02-07 07:36:45+00	my-emg	ru	3	active	mobileNumber	created	t	cBCd5sfNt2H70BE3lU-CNX:APA91bGI5yqfIShZm0kTvG1ubAO7g2fnEyqK8buY59Z1NBwNlxrKKFZzBkdgjjdaa0Z0FCNvSr2qA4madMtrB5ZEtcz4e9fxfhTy39Y1ChVYj83dZ7LtkORssMuHv12fghm-yxqm-upp	\N	t	user	2024-02-07 09:00:07+00
09729d16-de1d-4232-b28e-7ae14a08da3d	2024-02-07 19:46:28+00	test-auto-auto-app	en	5	active	mobileNumber	created	f		\N	f	user	2024-02-08 07:49:25+00
76ec272b-3e4d-4082-94a9-784a0b368a4e	2024-02-01 13:23:57+00	test-demon-slayer	en	1	active	email	created	t	dqgTCUBX2SiAUC1axdtv6u:APA91bGvZcwxW97ZSOJ3N6mCoAVUqGd_CTf3TbGJu5F5TPJGlmV2TmpMBA1nLrYdPMqZLKeW3aoE34g2eExVyTabaPcOmbgsPDhZZC5bCHrC3BQbjV3EKWOVXBQvIBxUSyBILyxeVvMA	\N	t	user	2024-02-07 17:55:21+00
61794625-90a9-4345-89c6-aeab5175da77	2024-02-07 19:48:51+00	test-auto-auto-app	en	4	invited	email	created	f		\N	f	user	\N
1759fe0f-b701-438a-9dc5-bb9abf4949eb	2024-02-07 19:52:52+00	test-auto-auto-app	en	4	invited	email	created	f		\N	f	user	\N
60eee909-cf0c-42b9-9268-e30e14eef01b	2024-02-07 19:54:49+00	test-auto-auto-app	en	4	invited	mobileNumber	created	f		\N	f	user	\N
d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	2024-02-01 13:58:10+00	\N	en	\N	active	email	\N	\N	\N	\N	t	admin	2024-02-06 08:13:21+00
17573621-47e1-4337-ae4d-c868ea94ce59	2024-02-07 20:01:00+00	test-auto-auto-app	en	4	created	none	created	f		\N	f	user	\N
63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f	2024-02-01 13:12:32.833149+00	\N	en	\N	created	none	\N	\N	\N	\N	\N	admin	2024-02-07 07:41:10+00
0d4e0e3b-4933-4d4c-aa0a-4cc8748f3d5f	2024-02-07 15:41:15+00	test-auto-auto-app	en	4	nonEmployee	none	created	f		\N	f	user	\N
ce34eed7-1d2c-4336-8f3f-2735a25d5c5f	2024-02-07 20:04:00+00	test-auto-auto-app	en	4	created	mobileNumber	created	f		\N	f	user	\N
f0ba6e9d-b70c-4208-b580-0faf2a1366b2	2024-02-07 19:50:57+00	test-auto-auto-app	en	4	active	mobileNumber	created	f		\N	f	user	\N
ae2ab750-1e89-432b-bfe1-085156a9789e	2024-02-01 13:57:47+00	\N	en	\N	active	email	\N	\N	\N	\N	\N	admin	\N
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."news" ("id", "createdAt", "organisation", "creator", "image", "views", "title", "bodyText", "leaderText") FROM stdin;
1	2024-02-01 13:21:00+00	test-demon-slayer	63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f	https://api.omir.app/storage/v1/object/public/default/organisations/test-demon-slayer/news/news-1.webp	1	{"en": "test", "ru": "", "kaz": ""}	{"en": "test", "ru": "", "kaz": ""}	{"en": "test", "ru": "", "kaz": ""}
2	2024-02-07 15:21:25+00	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/news/news-2.webp	1	{"en": "0701_001", "ru": "0701_003", "kaz": "0701_002"}	{"en": "0701_001", "ru": "0701_003", "kaz": "0701_003"}	{"en": "0701_001", "ru": "0701_003", "kaz": "0701_002"}
3	2024-02-07 15:31:15+00	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	\N	0	{"en": "test", "ru": "", "kaz": ""}	{"en": "test", "ru": "", "kaz": ""}	{"en": "test", "ru": "", "kaz": ""}
4	2024-02-07 15:31:35+00	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	\N	0	{"en": "0702_002", "ru": "", "kaz": ""}	{"en": "0702_002", "ru": "", "kaz": ""}	{"en": "0702_002", "ru": "", "kaz": ""}
5	2024-02-07 15:32:05+00	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	\N	0	{"en": "0702_003", "ru": "", "kaz": ""}	{"en": "0702_003", "ru": "", "kaz": ""}	{"en": "0702_003", "ru": "", "kaz": ""}
7	2024-02-07 15:32:51+00	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	\N	0	{"en": "0702_005", "ru": "", "kaz": ""}	{"en": "0702_005", "ru": "", "kaz": ""}	{"en": "0702_005", "ru": "", "kaz": ""}
6	2024-02-07 15:32:20+00	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	\N	1	{"en": "0702_004", "ru": "", "kaz": ""}	{"en": "0702_004", "ru": "", "kaz": ""}	{"en": "0702_004", "ru": "", "kaz": ""}
\.


--
-- Data for Name: newsLikes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."newsLikes" ("id", "createdAt", "user", "news") FROM stdin;
1	2024-02-02 06:48:44+00	\N	1
4	2024-02-07 15:21:38+00	ae2ab750-1e89-432b-bfe1-085156a9789e	2
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."notifications" ("id", "createdAt", "type", "organisation", "sender", "details") FROM stdin;
1	2024-02-01 13:21:00+00	news	test-demon-slayer	63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f	{"title": {"en": "test", "ru": "", "kaz": ""}, "newsId": 1, "description": {"en": "test", "ru": "", "kaz": ""}}
2	2024-02-01 13:26:03+00	notification	test-demon-slayer	63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f	{"body": "test", "title": "test"}
3	2024-02-01 13:57:14+00	notification	test-demon-slayer	63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f	{"body": "test2", "title": "test2"}
4	2024-02-07 15:21:29+00	news	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	{"title": {"en": "0701_001", "ru": "0701_003", "kaz": "0701_002"}, "description": {"en": "0701_001", "ru": "0701_003", "kaz": "0701_002"}}
5	2024-02-07 15:26:35+00	report	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	{"type": "incident", "title": "test_0702_001", "reportId": 1, "description": "test", "reportNameId": 1, "issueResolved": true, "operationsStops": true, "placeOfObservation": "test"}
6	2024-02-07 15:29:44+00	report	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	{"type": "dangerousSituation", "title": "test_0702_002", "reportId": 2, "description": "test", "reportNameId": 2, "issueResolved": false, "operationsStops": false, "placeOfObservation": "test"}
7	2024-02-07 15:31:17+00	news	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	{"title": {"en": "test", "ru": "", "kaz": ""}, "newsId": 3, "description": {"en": "test", "ru": "", "kaz": ""}}
8	2024-02-07 15:31:36+00	news	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	{"title": {"en": "0702_002", "ru": "", "kaz": ""}, "newsId": 4, "description": {"en": "0702_002", "ru": "", "kaz": ""}}
9	2024-02-07 15:32:06+00	news	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	{"title": {"en": "0702_003", "ru": "", "kaz": ""}, "newsId": 5, "description": {"en": "0702_003", "ru": "", "kaz": ""}}
10	2024-02-07 15:32:21+00	news	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	{"title": {"en": "0702_004", "ru": "", "kaz": ""}, "newsId": 6, "description": {"en": "0702_004", "ru": "", "kaz": ""}}
11	2024-02-07 15:32:52+00	news	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	{"title": {"en": "0702_005", "ru": "", "kaz": ""}, "newsId": 7, "description": {"en": "0702_005", "ru": "", "kaz": ""}}
12	2024-02-08 06:57:48+00	report	test-auto-auto-app	09729d16-de1d-4232-b28e-7ae14a08da3d	{"type": "dangerousAction", "title": "1", "reportId": 3, "description": "1", "reportNameId": 3, "issueResolved": true, "operationsStops": true, "placeOfObservation": "1"}
13	2024-02-08 07:09:19+00	notification	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	{"body": "1", "title": "test"}
14	2024-02-08 07:09:51+00	notification	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	{"body": "1", "title": "test"}
\.


--
-- Data for Name: notificationReads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."notificationReads" ("id", "createdAt", "user", "notification", "isRead") FROM stdin;
1	2024-02-01 13:26:04+00	76ec272b-3e4d-4082-94a9-784a0b368a4e	2	f
2	2024-02-01 13:57:14+00	76ec272b-3e4d-4082-94a9-784a0b368a4e	3	f
3	2024-02-08 07:09:19+00	f0ba6e9d-b70c-4208-b580-0faf2a1366b2	13	f
4	2024-02-08 07:09:51+00	09729d16-de1d-4232-b28e-7ae14a08da3d	14	t
\.


--
-- Data for Name: organisationStructures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."organisationStructures" ("createdAt", "group", "company", "department", "division", "branch", "subBranch", "organisation") FROM stdin;
2024-02-01 13:16:38+00	{Test}	{Test}	{Test}	{Test}	{Test}	{Test}	test-demon-slayer
2024-02-07 07:15:30+00	{"АО \\"Казмунайгаз\\""}	{"АО \\"Эмбамунайгаз\\""}	{}	{}	{}	{}	my-emg
2024-02-07 15:15:14+00	{Group1}	{Group2}	{Group4}	{Group3}	{Group5}	{Group6}	test-auto-auto-app
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."reports" ("id", "createdAt", "type", "organisation", "title", "description", "placeOfObservation", "operationsStopped", "issueResolved", "yourActions", "yourSuggestion", "reportCategories", "image", "reportedToName", "reportedToPosition", "isDangerousSituation", "whatWeDid", "whatWeLearned", "reportStatus", "updatedUsersIds", "reporter", "reportId", "updatedAt") FROM stdin;
1	2024-02-07 15:26:33	incident	test-auto-auto-app	test_0702_001	test	test	t	t	test	test	{excavationWork,personalCollectiveProtectionEquipment}	https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/reports/report-1.webp	tes		t			open	{ae2ab750-1e89-432b-bfe1-085156a9789e}	ae2ab750-1e89-432b-bfe1-085156a9789e	1	2024-02-07 15:26:33+00
2	2024-02-07 15:29:42	dangerousSituation	test-auto-auto-app	test_0702_002	test	test	f	f	test	test	{weldingGrindingAnnealing,safetyWarningSigns}	https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/reports/report-2.webp		test	f			open	{ae2ab750-1e89-432b-bfe1-085156a9789e}	ae2ab750-1e89-432b-bfe1-085156a9789e	2	2024-02-07 15:29:42+00
3	2024-02-08 06:57:44	dangerousAction	test-auto-auto-app	1	1	1	t	t	1	1	{}	https://api.omir.app/storage/v1/object/public/default/organisations/test-auto-auto-app/reports/report-3.webp			\N			open	{09729d16-de1d-4232-b28e-7ae14a08da3d}	09729d16-de1d-4232-b28e-7ae14a08da3d	3	2024-02-08 06:57:44+00
\.


--
-- Data for Name: reportUpdates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."reportUpdates" ("id", "createdAt", "report", "user", "isSystemMessage", "message") FROM stdin;
1	2024-02-07 15:26:34+00	1	ae2ab750-1e89-432b-bfe1-085156a9789e	t	updatesHistory.reportCreated
2	2024-02-07 15:29:44+00	2	ae2ab750-1e89-432b-bfe1-085156a9789e	t	updatesHistory.reportCreated
3	2024-02-08 06:57:46+00	3	09729d16-de1d-4232-b28e-7ae14a08da3d	t	updatesHistory.reportCreated
\.


--
-- Data for Name: userImportHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."userImportHistory" ("id", "createdAt", "organisation", "importer", "fileName", "newUsersCount", "updatedUsersCount", "errorUsersCount", "nonEmployeeUsersCount") FROM stdin;
1	2024-02-07 19:33:01+00	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	Template (3).csv	1	0	0	4
2	2024-02-07 19:40:10+00	test-auto-auto-app	ae2ab750-1e89-432b-bfe1-085156a9789e	Template (3).csv	0	1	0	4
\.


--
-- Data for Name: userProfiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."userProfiles" ("id", "name", "jobTitle", "profileRating", "birthDay", "bloodType", "employmentType", "sex", "employmentDate", "introduction", "photoUrl", "smallPhotoUrl", "country", "city", "homeAddress", "email", "mobileNumber", "idNumber", "anthropometryHeight", "anthropometryClothesSize", "anthropometryShoeSize", "anthropometryHeadSize", "organisation", "workingEmail", "workingMobileNumber") FROM stdin;
63d4aae0-e180-4c33-bdb3-8bab4f1b3c8f	Adrian 水の呼吸	App Admin	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-	\N	\N	\N	\N	\N	\N	\N
66825634-2339-4c02-88b9-f55281874772	Geo Apopei	App Admin	100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-	\N	\N	\N	\N	\N	\N	\N
76ec272b-3e4d-4082-94a9-784a0b368a4e	Tanjiro Kamado	Exploding Blood	100	\N				\N	Me 🎂	https://api.omir.app/storage/v1/object/public/default/organisations/test-demon-slayer/users/76ec272b-3e4d-4082-94a9-784a0b368a4e/photoUrl.webp?1707328696918	https://api.omir.app/storage/v1/object/public/default/organisations/test-demon-slayer/users/76ec272b-3e4d-4082-94a9-784a0b368a4e/smallPhotoUrl.webp?1707328697184				aobetkal@gmail.com		3453					test-demon-slayer	\N	\N
9e9e58e2-2eb4-469b-999c-036d25a003d8	Mihail Ciontu	App Admin	100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-	\N	\N	\N	\N	\N	\N	\N
ae2ab750-1e89-432b-bfe1-085156a9789e	Veronika Riaboshlyk	App Admin	100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-	\N	\N	\N	\N	\N	\N	\N
d4bf8a1a-b6f3-4c84-a29f-a10994b3ad99	Dimash Kunayev	App Admin	100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-	\N	\N	\N	\N	\N	\N	\N
ce34eed7-1d2c-4336-8f3f-2735a25d5c5f	Testing	3465	0	\N				\N							380@mail.com		556644					test-auto-auto-app		
09729d16-de1d-4232-b28e-7ae14a08da3d	UserPhone	456	0	\N				\N							test345@mail.com		445644					test-auto-auto-app		
0d4e0e3b-4933-4d4c-aa0a-4cc8748f3d5f	User I	CEO	0	\N				\N							riaboshlyk+1@etcetera.kiev.ua	+3801112300	45664456					test-auto-auto-app		
d83e32eb-da46-475d-87d0-21a77d8bc969	User II	tech	0	\N				\N							riaboshlyk+2@etcetera.kiev.ua		34456754					test-auto-auto-app		
3e82c125-b0e5-47bc-8c56-14cecd11eb19	User III	QA	0	\N				\N							riaboshlyk+3@etcetera.kiev.ua		455654455					test-auto-auto-app		
6b8d262a-bdee-4060-afe7-333e7b9e011c	TESTNAMEWORK	usertest	0	\N				\N							riaboshlyk+6@etcetera.kiev.ua	+3800000000	445666544					test-auto-auto-app	v@mail.com	+3800000000
9efbe1c2-b12f-4ad3-829f-6f31c13898e9	Димаш Кунаев	Админ	100	\N		Админ	Мужской	\N	Димаш работает в организации Omir. Имеет степень магистра делового администрировалия.	https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/users/9efbe1c2-b12f-4ad3-829f-6f31c13898e9/photoUrl.webp?1707291992860	https://api.omir.app/storage/v1/object/public/default/organisations/my-emg/users/9efbe1c2-b12f-4ad3-829f-6f31c13898e9/smallPhotoUrl.webp?1707291993316					+77019998999	10000001					my-emg	\N	\N
61794625-90a9-4345-89c6-aeab5175da77	test	ert	0	\N				\N								+3800000001	4456675					test-auto-auto-app		
f0ba6e9d-b70c-4208-b580-0faf2a1366b2	Kyiv	3455	0	\N				\N							12345@mail.com		455654					test-auto-auto-app		
1759fe0f-b701-438a-9dc5-bb9abf4949eb	testingrrertrtyuy	4466	0	\N				\N								+380660000000	55665445					test-auto-auto-app		
60eee909-cf0c-42b9-9268-e30e14eef01b	testinv	56756655	0	\N				\N							testung@mail.com		677655					test-auto-auto-app		
17573621-47e1-4337-ae4d-c868ea94ce59	rtyytr	5yy	0	\N				\N							6567@mail.com		rtyy5r					test-auto-auto-app		
\.


--
-- Data for Name: userStructures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."userStructures" ("id", "group", "company", "department", "division", "branch", "subBranch") FROM stdin;
d83e32eb-da46-475d-87d0-21a77d8bc969		Group2				
3e82c125-b0e5-47bc-8c56-14cecd11eb19		Group2				
9efbe1c2-b12f-4ad3-829f-6f31c13898e9		АО "Эмбамунайгаз"				
76ec272b-3e4d-4082-94a9-784a0b368a4e		Test				
0d4e0e3b-4933-4d4c-aa0a-4cc8748f3d5f		Group2				
6b8d262a-bdee-4060-afe7-333e7b9e011c		Group2				
61794625-90a9-4345-89c6-aeab5175da77		Group2				
f0ba6e9d-b70c-4208-b580-0faf2a1366b2		Group2				
1759fe0f-b701-438a-9dc5-bb9abf4949eb		Group2				
60eee909-cf0c-42b9-9268-e30e14eef01b		Group2				
17573621-47e1-4337-ae4d-c868ea94ce59		Group2				
ce34eed7-1d2c-4336-8f3f-2735a25d5c5f		Group2				
09729d16-de1d-4232-b28e-7ae14a08da3d		Group2				
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") FROM stdin;
default	default	\N	2024-02-01 13:18:15.390442+00	2024-02-01 13:18:15.390442+00	t	f	\N	\N	\N
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id") FROM stdin;
77b1366f-241e-4bb4-9a80-aeaa9a0157d2	default	organisations/test-demon-slayer/challenges/challenge-2.webp	\N	2024-02-01 13:18:37.388623+00	2024-02-01 13:18:37.388623+00	2024-02-01 13:18:37.388623+00	{"eTag": "\\"ba18d18339b4e116d536102ebe17d853\\"", "size": 55818, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-01T13:18:37.000Z", "contentLength": 55818, "httpStatusCode": 200}	183dd49c-8ed7-4d5a-b3b2-ca1bda5f345a	\N
148ba05a-d415-49da-bb98-6e51ce248131	default	organisations/test-demon-slayer/news/news-1.webp	\N	2024-02-01 13:21:00.824243+00	2024-02-01 13:21:00.824243+00	2024-02-01 13:21:00.824243+00	{"eTag": "\\"2242029cd719fd15c7cf32eeffb05839\\"", "size": 25266, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-01T13:21:00.000Z", "contentLength": 25266, "httpStatusCode": 200}	63c10641-208c-4b5b-a19d-2b9c8a58e2e0	\N
526930eb-29ec-4cb7-bf93-d384ff88379d	default	organisations/test-demon-slayer/public/logo.webp	\N	2024-02-01 13:23:03.958049+00	2024-02-01 13:23:03.958049+00	2024-02-01 13:23:03.958049+00	{"eTag": "\\"bd81edac201a960580c36db2e9824259\\"", "size": 10012, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-01T13:23:03.000Z", "contentLength": 10012, "httpStatusCode": 200}	8f1105de-3b75-4afa-a66c-120ff1587319	\N
bdaa27b1-2a0a-4144-83f6-9ada3e72978a	default	organisations/test-demon-slayer/public/icon.webp	\N	2024-02-01 14:33:57.396011+00	2024-02-01 14:33:57.396011+00	2024-02-01 14:33:57.396011+00	{"eTag": "\\"3afe44638ac4d1b9801f6df1b06f473a\\"", "size": 27276, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-01T14:33:57.000Z", "contentLength": 27276, "httpStatusCode": 200}	adb6585e-97f2-430f-80ca-87f1b30eb010	\N
3dc35753-5fcf-4944-b183-6220fde5ea6a	default	organisations/my-emg/public/logo.webp	\N	2024-02-07 07:28:25.901767+00	2024-02-07 07:28:25.901767+00	2024-02-07 07:28:25.901767+00	{"eTag": "\\"57b5689c8623f6b2e45424db8b6b6493\\"", "size": 6170, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:28:25.000Z", "contentLength": 6170, "httpStatusCode": 200}	76384f1b-b5c5-4fca-bdbf-c6af6a60e945	\N
eb7af6fa-f349-472d-8560-69651664a084	default	organisations/my-emg/public/icon.webp	\N	2024-02-07 07:28:26.661237+00	2024-02-07 07:28:26.661237+00	2024-02-07 07:28:26.661237+00	{"eTag": "\\"8c48582b820f53ccc29026e18fb438eb\\"", "size": 4804, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:28:26.000Z", "contentLength": 4804, "httpStatusCode": 200}	596ef3fe-305d-4ec0-8aed-8b37fbb2a234	\N
7d9afce9-f5b1-406d-8905-b3d2d7eab3b6	default	organisations/my-emg/public/manifest/manifest-icon-16x16.webp	\N	2024-02-07 07:28:27.436399+00	2024-02-07 07:28:27.436399+00	2024-02-07 07:28:27.436399+00	{"eTag": "\\"9beee529b5a4172c08bd08386e54bf54\\"", "size": 348, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:28:27.000Z", "contentLength": 348, "httpStatusCode": 200}	afc70a02-24f8-4c53-8143-382e772f5dd2	\N
8fecc391-d875-44a1-8251-fa34c76da6da	default	organisations/my-emg/public/manifest/manifest-icon-32x32.webp	\N	2024-02-07 07:28:27.598237+00	2024-02-07 07:28:27.598237+00	2024-02-07 07:28:27.598237+00	{"eTag": "\\"16b13dddd72caeab8075b43c1d3b136d\\"", "size": 542, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:28:27.000Z", "contentLength": 542, "httpStatusCode": 200}	ba4b1e92-5603-4148-a8fb-6fe8695670c3	\N
11397a2c-3b9d-4d62-918e-eb3827803918	default	organisations/my-emg/public/manifest/manifest-icon-128x128.webp	\N	2024-02-07 07:28:27.766067+00	2024-02-07 07:28:27.766067+00	2024-02-07 07:28:27.766067+00	{"eTag": "\\"1d15c7670d64fac50f8ef8570ba92be8\\"", "size": 1814, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:28:27.000Z", "contentLength": 1814, "httpStatusCode": 200}	cf9626a3-4413-458a-8927-0266488dadba	\N
8a4df3e2-e00f-46a8-8834-d1626f258abd	default	organisations/my-emg/public/manifest/manifest-icon-180x180.webp	\N	2024-02-07 07:28:27.9336+00	2024-02-07 07:28:27.9336+00	2024-02-07 07:28:27.9336+00	{"eTag": "\\"95c2641f18adda08f449b6c0d8edc329\\"", "size": 2514, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:28:27.000Z", "contentLength": 2514, "httpStatusCode": 200}	730b407c-f272-48cf-bf0d-98219f360ccb	\N
1e59c80a-45fe-4f57-b2e2-df83004eb46c	default	organisations/my-emg/public/manifest/manifest-icon-192x192.webp	\N	2024-02-07 07:28:28.142065+00	2024-02-07 07:28:28.142065+00	2024-02-07 07:28:28.142065+00	{"eTag": "\\"9c7644706c1cec4ff4a40d0b04d81105\\"", "size": 2688, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:28:28.000Z", "contentLength": 2688, "httpStatusCode": 200}	4570d142-a663-4476-b4ae-8e70d803924c	\N
ae12ea3b-c934-43de-875a-5e960683c43f	default	organisations/test-demon-slayer/users/76ec272b-3e4d-4082-94a9-784a0b368a4e/photoUrl.webp	\N	2024-02-03 10:16:44.992345+00	2024-02-07 17:58:17.0083+00	2024-02-03 10:16:44.992345+00	{"eTag": "\\"38580e45601121357cd26a95d2099467\\"", "size": 6068, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T17:58:16.000Z", "contentLength": 6068, "httpStatusCode": 200}	2bd007cf-b539-4e9d-abad-f37adf023380	\N
e854f1cf-0235-4d37-b8d2-6c12e2ed49b8	default	organisations/test-demon-slayer/users/76ec272b-3e4d-4082-94a9-784a0b368a4e/smallPhotoUrl.webp	\N	2024-02-03 10:16:45.253117+00	2024-02-07 17:58:17.273002+00	2024-02-03 10:16:45.253117+00	{"eTag": "\\"62c19d0e99bfa7f8513117ec81a8e76c\\"", "size": 1924, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T17:58:17.000Z", "contentLength": 1924, "httpStatusCode": 200}	362ac711-e3de-41c7-9d6d-c4170c410819	\N
11190f17-4a15-4e7b-ba9c-2aa0b3b31d64	default	organisations/my-emg/public/manifest/manifest-icon-256x256.webp	\N	2024-02-07 07:28:28.327353+00	2024-02-07 07:28:28.327353+00	2024-02-07 07:28:28.327353+00	{"eTag": "\\"50d0ccf674d6f5264c37416cde3a4660\\"", "size": 3566, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:28:28.000Z", "contentLength": 3566, "httpStatusCode": 200}	ae949344-d79e-48d7-919f-ca3751951f11	\N
bc73e1de-0373-4980-9ac1-49ca4d8ae4ae	default	organisations/my-emg/public/manifest/manifest-icon-384x384.webp	\N	2024-02-07 07:28:28.534917+00	2024-02-07 07:28:28.534917+00	2024-02-07 07:28:28.534917+00	{"eTag": "\\"fa1d833adfa3f214f3eb7145f063eb6f\\"", "size": 5156, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:28:28.000Z", "contentLength": 5156, "httpStatusCode": 200}	436c40ea-6f53-490b-aaea-f40867e2359c	\N
47b06e13-eb84-459c-a076-f5da495ab658	default	organisations/my-emg/public/manifest/manifest-icon-512x512.webp	\N	2024-02-07 07:28:28.751005+00	2024-02-07 07:28:28.751005+00	2024-02-07 07:28:28.751005+00	{"eTag": "\\"dc99551a3d9202e408dae7f25f2acbaf\\"", "size": 6448, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:28:28.000Z", "contentLength": 6448, "httpStatusCode": 200}	44b8923a-f8ae-40ed-bbc6-e44603362635	\N
9162ad1d-5223-4636-90d9-b22bc3cf80c7	default	organisations/my-emg/users/9efbe1c2-b12f-4ad3-829f-6f31c13898e9/photoUrl.webp	\N	2024-02-07 07:46:33.15185+00	2024-02-07 07:46:33.15185+00	2024-02-07 07:46:33.15185+00	{"eTag": "\\"ddab52d7f50adadea1f08ce1905096a4\\"", "size": 21104, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:46:33.000Z", "contentLength": 21104, "httpStatusCode": 200}	e50a49ac-45b9-4b60-897f-05a9baff1b95	\N
e50a3155-1b5c-4e62-a315-ddfa41716836	default	organisations/my-emg/users/9efbe1c2-b12f-4ad3-829f-6f31c13898e9/smallPhotoUrl.webp	\N	2024-02-07 07:46:33.408759+00	2024-02-07 07:46:33.408759+00	2024-02-07 07:46:33.408759+00	{"eTag": "\\"7ca2e85628219e5f042955e933715518\\"", "size": 4088, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T07:46:33.000Z", "contentLength": 4088, "httpStatusCode": 200}	21d8b9ec-1553-480e-a09c-fbf77a877263	\N
9feb2c08-2c41-473e-bc9d-c21d7436e9bf	default	organisations/test-auto-auto-app/challenges/challenge-3.webp	\N	2024-02-07 15:19:14.095068+00	2024-02-07 15:19:14.095068+00	2024-02-07 15:19:14.095068+00	{"eTag": "\\"656e308ffe1ada39e468e4b1addac7a8\\"", "size": 35398, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:19:14.000Z", "contentLength": 35398, "httpStatusCode": 200}	3acad717-c59e-4ed6-a285-ff9130cc8779	\N
322e2f54-677f-4b8b-98be-48156687e1a6	default	organisations/test-auto-auto-app/news/news-2.webp	\N	2024-02-07 15:21:25.616954+00	2024-02-07 15:21:25.616954+00	2024-02-07 15:21:25.616954+00	{"eTag": "\\"a08dbf6f4c5eb983ad6c7ed3cc2ceab9\\"", "size": 35260, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:21:25.000Z", "contentLength": 35260, "httpStatusCode": 200}	73e09b30-251f-4b51-b8ce-08fdef736064	\N
5bd80621-271c-4e56-9c8e-54d021055188	default	organisations/test-auto-auto-app/public/logo.webp	\N	2024-02-07 15:24:31.900656+00	2024-02-07 15:24:31.900656+00	2024-02-07 15:24:31.900656+00	{"eTag": "\\"af64e1197f47e14e2a943f70ea9b3691\\"", "size": 3488, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:24:31.000Z", "contentLength": 3488, "httpStatusCode": 200}	ad89982e-5f2a-4ea4-9113-e366f26fb1cd	\N
2db0a35b-729b-48a1-b15b-be628532fdd6	default	organisations/test-auto-auto-app/public/icon.webp	\N	2024-02-07 15:24:32.656767+00	2024-02-07 15:24:32.656767+00	2024-02-07 15:24:32.656767+00	{"eTag": "\\"7ff8709f57a289344a1be1f387a53cb3\\"", "size": 3938, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:24:32.000Z", "contentLength": 3938, "httpStatusCode": 200}	8e8344db-4803-4035-b116-abe8cd272bb1	\N
e437d161-dec3-4476-a783-0b021e69f549	default	organisations/test-auto-auto-app/public/manifest/manifest-icon-16x16.webp	\N	2024-02-07 15:24:33.385338+00	2024-02-07 15:24:33.385338+00	2024-02-07 15:24:33.385338+00	{"eTag": "\\"ad9da2b2d50a71c4302c06671f0e0571\\"", "size": 208, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:24:33.000Z", "contentLength": 208, "httpStatusCode": 200}	878fb163-655d-4e9e-adad-cb0b2d2e2d0d	\N
7034aca8-a6b8-4e48-a42e-82aa5f9a9a02	default	organisations/test-auto-auto-app/public/manifest/manifest-icon-32x32.webp	\N	2024-02-07 15:24:33.547561+00	2024-02-07 15:24:33.547561+00	2024-02-07 15:24:33.547561+00	{"eTag": "\\"5c6a24af3a900dd206607409f4cd0581\\"", "size": 300, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:24:33.000Z", "contentLength": 300, "httpStatusCode": 200}	fa025ef8-e6c6-470c-b0b9-407a1c64bdd6	\N
9392b3eb-4b90-4c97-a7e5-7dad11b9785a	default	organisations/test-auto-auto-app/public/manifest/manifest-icon-128x128.webp	\N	2024-02-07 15:24:33.708874+00	2024-02-07 15:24:33.708874+00	2024-02-07 15:24:33.708874+00	{"eTag": "\\"e9eb1ba1e790c1c78e406e171d1b8af1\\"", "size": 766, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:24:33.000Z", "contentLength": 766, "httpStatusCode": 200}	1c1b11a1-6991-4148-b0cd-5b1df89dfd2c	\N
c545e104-7860-4773-9388-5755a9200ec3	default	organisations/test-auto-auto-app/public/manifest/manifest-icon-180x180.webp	\N	2024-02-07 15:24:33.889872+00	2024-02-07 15:24:33.889872+00	2024-02-07 15:24:33.889872+00	{"eTag": "\\"44d8119fa00d1422cecf6d038176ad0d\\"", "size": 1096, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:24:33.000Z", "contentLength": 1096, "httpStatusCode": 200}	c2ec5e31-0d78-4eec-afce-563a8a0245b2	\N
c412d7ec-2092-49c4-82e9-be32ca3861fa	default	organisations/test-auto-auto-app/public/manifest/manifest-icon-192x192.webp	\N	2024-02-07 15:24:34.05321+00	2024-02-07 15:24:34.05321+00	2024-02-07 15:24:34.05321+00	{"eTag": "\\"1d258db97e9e8c70a5672ebe4288c12c\\"", "size": 1128, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:24:34.000Z", "contentLength": 1128, "httpStatusCode": 200}	15f63b58-7c15-4bb2-900e-03f7b5ab8a2e	\N
9e079ad1-9f16-4044-b359-fc044527d1d1	default	organisations/test-auto-auto-app/public/manifest/manifest-icon-256x256.webp	\N	2024-02-07 15:24:34.220943+00	2024-02-07 15:24:34.220943+00	2024-02-07 15:24:34.220943+00	{"eTag": "\\"61509c650157297e4f9b56d276510b23\\"", "size": 1430, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:24:34.000Z", "contentLength": 1430, "httpStatusCode": 200}	270ce7a3-c753-4eba-8ce2-ff0a2cbc84e5	\N
70ceb955-9e0b-46d4-90f8-cdb4e39a24cc	default	organisations/test-auto-auto-app/public/manifest/manifest-icon-384x384.webp	\N	2024-02-07 15:24:34.433515+00	2024-02-07 15:24:34.433515+00	2024-02-07 15:24:34.433515+00	{"eTag": "\\"813dbbd970710ea1a3e5bdd1518acd86\\"", "size": 2196, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:24:34.000Z", "contentLength": 2196, "httpStatusCode": 200}	f2aa436e-fe31-4a3e-abd1-160cb6900f29	\N
73ed0f1a-f69f-430b-beb1-de9520683cf9	default	organisations/test-auto-auto-app/public/manifest/manifest-icon-512x512.webp	\N	2024-02-07 15:24:34.64489+00	2024-02-07 15:24:34.64489+00	2024-02-07 15:24:34.64489+00	{"eTag": "\\"88b9d09baeac0269150f97028ffd8f52\\"", "size": 3100, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:24:34.000Z", "contentLength": 3100, "httpStatusCode": 200}	c4133dcd-7ab7-4021-ad44-850cfde17913	\N
7e63505a-f090-4948-b450-4f8140e3fe82	default	organisations/test-auto-auto-app/reports/report-1.webp	\N	2024-02-07 15:26:33.695397+00	2024-02-07 15:26:33.695397+00	2024-02-07 15:26:33.695397+00	{"eTag": "\\"639a695201bad844f15ca77b720378df\\"", "size": 2544, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:26:33.000Z", "contentLength": 2544, "httpStatusCode": 200}	e5d61d57-5c02-4898-acab-a9f49ad77fff	\N
9a5d46e9-a578-4052-9901-7f871e19e488	default	organisations/test-auto-auto-app/reports/report-2.webp	\N	2024-02-07 15:29:42.767555+00	2024-02-07 15:29:42.767555+00	2024-02-07 15:29:42.767555+00	{"eTag": "\\"dfea3aea74b27d8093b9c564e8b719f1\\"", "size": 2864, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-07T15:29:42.000Z", "contentLength": 2864, "httpStatusCode": 200}	401c08a9-91f3-4106-b5b7-0935e93502cb	\N
0f1fda34-77c4-453b-b284-c43a1251fff4	default	organisations/test-auto-auto-app/reports/report-3.webp	\N	2024-02-08 06:57:45.316986+00	2024-02-08 06:57:45.316986+00	2024-02-08 06:57:45.316986+00	{"eTag": "\\"518c300364690d07808e78ceb2cad91d\\"", "size": 40168, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-02-08T06:57:45.000Z", "contentLength": 40168, "httpStatusCode": 200}	11c69d69-d5c3-4ce6-98da-32cf40790282	\N
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY "supabase_functions"."hooks" ("id", "hook_table_id", "hook_name", "created_at", "request_id") FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY "vault"."secrets" ("id", "name", "description", "secret", "key_id", "nonce", "created_at", "updated_at") FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 88, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."challenges_id_seq"', 4, true);


--
-- Name: leaderboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."leaderboards_id_seq"', 3, true);


--
-- Name: newsLikes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."newsLikes_id_seq"', 4, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."news_id_seq"', 7, true);


--
-- Name: notificationReads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."notificationReads_id_seq"', 4, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."notifications_id_seq"', 14, true);


--
-- Name: reportUpdates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."reportUpdates_id_seq"', 3, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."reports_id_seq"', 3, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."roles_id_seq"', 5, true);


--
-- Name: userImportHistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."userImportHistory_id_seq"', 2, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
