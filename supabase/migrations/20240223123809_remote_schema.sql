drop view if exists "public"."usersManagement";

alter table "public"."users" drop column "test";

create or replace view "public"."usersManagement" as  SELECT u.id,
    u."lastLogin",
    u."applicationRole",
    u.organisation,
    u.status,
    u."loginMethod",
    up.name,
    up."idNumber",
    up."jobTitle",
    up."smallPhotoUrl",
    up.email,
    up."mobileNumber",
    r.name AS role,
    us.company,
    lower(up.name) AS "orderName",
    lower(up."jobTitle") AS "orderJobTitle",
    lower(us.company) AS "orderCompany",
    lower(r.name) AS "orderRole",
    lower(((((((((up.name || ' '::text) || up."idNumber") || ' '::text) || up."jobTitle") || ' '::text) || up.email) || ' '::text) || up."mobileNumber")) AS search,
    up."profileRating",
    up."photoUrl",
    up."employmentType"
   FROM (((users u
     JOIN "userProfiles" up ON ((u.id = up.id)))
     JOIN roles r ON ((u.role = r.id)))
     JOIN "userStructures" us ON ((u.id = us.id)));



