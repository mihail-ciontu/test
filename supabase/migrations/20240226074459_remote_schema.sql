
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

CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";

CREATE SCHEMA IF NOT EXISTS "supabase_migrations";

ALTER SCHEMA "supabase_migrations" OWNER TO "postgres";

CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";

CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";

CREATE TYPE "public"."ApplicationRole" AS ENUM (
    'admin',
    'user'
);

ALTER TYPE "public"."ApplicationRole" OWNER TO "postgres";

CREATE TYPE "public"."Language" AS ENUM (
    'en',
    'ru',
    'kaz'
);

ALTER TYPE "public"."Language" OWNER TO "postgres";

CREATE TYPE "public"."LoginMethod" AS ENUM (
    'email',
    'mobileNumber',
    'none'
);

ALTER TYPE "public"."LoginMethod" OWNER TO "postgres";

CREATE TYPE "public"."NotificationType" AS ENUM (
    'report',
    'news',
    'notification'
);

ALTER TYPE "public"."NotificationType" OWNER TO "postgres";

CREATE TYPE "public"."ReportStatus" AS ENUM (
    'open',
    'resolved',
    'cancelled'
);

ALTER TYPE "public"."ReportStatus" OWNER TO "postgres";

CREATE TYPE "public"."UserStatus" AS ENUM (
    'created',
    'invited',
    'active',
    'blocked',
    'nonEmployee'
);

ALTER TYPE "public"."UserStatus" OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."delete_oldest_notification"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
IF (SELECT COUNT(*) FROM "notificationReads" WHERE "notificationReads".user = NEW.user) > 49 THEN
    DELETE FROM "notificationReads"
    WHERE ("notificationReads".user, "createdAt") IN (
            SELECT "notificationReads".user, "notificationReads"."createdAt"
            FROM "notificationReads"
            WHERE "notificationReads".user = NEW.user
            ORDER BY "createdAt"
            LIMIT (SELECT COUNT(*) - 49 FROM "notificationReads" WHERE "notificationReads".user = NEW.user)
        );

    END IF;

    RETURN NEW;
END;
$$;

ALTER FUNCTION "public"."delete_oldest_notification"() OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."get_report_analytics_table_data"("organisation_id" character varying, "start_date" timestamp without time zone, "end_date" timestamp without time zone) RETURNS TABLE("id" bigint, "reportId" integer, "createdAt" timestamp without time zone, "description" "text", "image" "text", "isDangerousSituation" boolean, "issueResolved" boolean, "operationsStopped" boolean, "organisation" "text", "placeOfObservation" "text", "reportCategories" "text"[], "reportStatus" "public"."ReportStatus", "reportedToName" "text", "reportedToPosition" "text", "reporter" "uuid", "title" "text", "type" "text", "updatedAt" timestamp with time zone, "updatedUsersIds" "uuid"[], "whatWeDid" "text", "whatWeLearned" "text", "yourActions" "text", "yourSuggestion" "text", "user" "jsonb")
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        "reports".id,
        "reports"."reportId",
        "reports"."createdAt",
        "reports"."description",
        "reports".image,
        "reports"."isDangerousSituation",
        "reports"."issueResolved",
        "reports"."operationsStopped",
        "reports".organisation,
        "reports"."placeOfObservation",
        "reports"."reportCategories",
        "reports"."reportStatus",
        "reports"."reportedToName",
        "reports"."reportedToPosition",
        "reports".reporter,
        "reports".title,
        "reports".type,
        "reports"."updatedAt",
        "reports"."updatedUsersIds",
        "reports"."whatWeDid",
        "reports"."whatWeLearned",
        "reports"."yourActions",
        "reports"."yourSuggestion",
        jsonb_build_object(
            'id', u.id,
            'userStructure', us.*,
            'userProfile', up.*
        ) AS "user"
    FROM 
       "reports" 
    INNER JOIN 
        "users" AS u ON "reports".reporter = u.id
    INNER JOIN 
        "userStructures" AS us ON u.id = us.id
    INNER JOIN 
        "userProfiles" AS up ON u.id = up.id
    WHERE 
        "reports"."organisation" = organisation_id
        AND "reports"."createdAt" > start_date
        AND "reports"."createdAt" < end_date
        AND "reports"."reportStatus" <> 'cancelled';
END;
$$;

ALTER FUNCTION "public"."get_report_analytics_table_data"("organisation_id" character varying, "start_date" timestamp without time zone, "end_date" timestamp without time zone) OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."getorgbynewsid"("_newsid" bigint, OUT "org_id" "text") RETURNS "text"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $$
 begin
  select organisation from news where id = _newsId
  into org_id;
  end
$$;

ALTER FUNCTION "public"."getorgbynewsid"("_newsid" bigint, OUT "org_id" "text") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."getorgbyreportid"("_reportid" bigint, OUT "org_id" "text") RETURNS "text"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $$
 begin
  select organisation from reports where id = _reportId
  into org_id;
  end
$$;

ALTER FUNCTION "public"."getorgbyreportid"("_reportid" bigint, OUT "org_id" "text") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."getorgbyuserid"("_userid" "uuid", OUT "org_id" "text") RETURNS "text"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $$
 begin
  select organisation from users where id = _userId
  into org_id;
  end
$$;

ALTER FUNCTION "public"."getorgbyuserid"("_userid" "uuid", OUT "org_id" "text") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."getreporterbyreportid"("_reportid" bigint, OUT "user_id" "uuid") RETURNS "uuid"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $$
 begin
  select reporter from reports where id = _reportId
  into user_id;
  end
$$;

ALTER FUNCTION "public"."getreporterbyreportid"("_reportid" bigint, OUT "user_id" "uuid") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."getrolebyuser"("_userid" "uuid", OUT "roleid" bigint) RETURNS bigint
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
  BEGIN
    EXECUTE 'SELECT role from users WHERE id = $1;'
    INTO roleId
    USING _userId;
  END 
$_$;

ALTER FUNCTION "public"."getrolebyuser"("_userid" "uuid", OUT "roleid" bigint) OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."getuserpermissionsobject"("_userid" "uuid", "_column" "text", OUT "permissions" "jsonb") RETURNS "jsonb"
    LANGUAGE "plpgsql" IMMUTABLE STRICT SECURITY DEFINER
    AS $$ 
declare roleId int;
 begin
  select public.getrolebyuser(_userId) into roleId;
  select public.getuserrolepermissions(roleId, _column) into permissions;
  end
$$;

ALTER FUNCTION "public"."getuserpermissionsobject"("_userid" "uuid", "_column" "text", OUT "permissions" "jsonb") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."getuserrolepermissions"("_roleid" bigint, "_permission_path" character varying, OUT "result" "jsonb") RETURNS "jsonb"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$ 
 BEGIN 
 EXECUTE 'SELECT '|| quote_ident(_permission_path) ||' FROM roles WHERE id = $1'
  INTO result
  USING _roleId;
END $_$;

ALTER FUNCTION "public"."getuserrolepermissions"("_roleid" bigint, "_permission_path" character varying, OUT "result" "jsonb") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."isuseradmin"("_userid" "uuid", OUT "isadmin" boolean) RETURNS boolean
    LANGUAGE "plpgsql" IMMUTABLE STRICT SECURITY DEFINER
    AS $_$
    DECLARE role text;
  BEGIN
    EXECUTE 'SELECT "applicationRole" from users WHERE id = $1;'
    INTO role
    USING _userId;
    isAdmin := role = 'admin';
  END 
$_$;

ALTER FUNCTION "public"."isuseradmin"("_userid" "uuid", OUT "isadmin" boolean) OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."isuserinorg"("_orgid" "text", "_userid" "uuid") RETURNS boolean
    LANGUAGE "plpgsql" IMMUTABLE STRICT SECURITY DEFINER
    AS $$
declare userOrgId text;
begin
  select organisation from users INTO userOrgId where id = _userId;
  if (_orgId = userOrgId) then 
  return true;
  end if;
  return false;
end
$$;

ALTER FUNCTION "public"."isuserinorg"("_orgid" "text", "_userid" "uuid") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."notificationrecordexistsforuser"("_notificationid" bigint, "_userid" "uuid", OUT "_exists" boolean) RETURNS boolean
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $$
 begin
  select exists (select 1 from "notificationReads" where notification = _notificationId and "notificationReads".user = _userId limit 1)
  into _exists;
  end
$$;

ALTER FUNCTION "public"."notificationrecordexistsforuser"("_notificationid" bigint, "_userid" "uuid", OUT "_exists" boolean) OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."org_row_update"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$BEGIN
  IF NEW.id <> OLD.id THEN
    RAISE EXCEPTION 'changing "ID" is not allowed';
  END IF;
  IF NEW."createdAt" <> OLD."createdAt" THEN
    RAISE EXCEPTION 'changing "createdAt" is not allowed';
  END IF;
  IF NEW."isActive" <> OLD."isActive" THEN
    RAISE EXCEPTION 'changing "isActive" is not allowed';
  END IF;
  RETURN NEW;
END;$$;

ALTER FUNCTION "public"."org_row_update"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";

CREATE TABLE IF NOT EXISTS "public"."organisations" (
    "id" "text" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "isActive" boolean NOT NULL,
    "primaryColor" "text" NOT NULL,
    "applicationName" "text" NOT NULL,
    "iconUrl" "text" DEFAULT ''::"text",
    "logoUrl" "text" DEFAULT ''::"text",
    "termsUrl" "text" NOT NULL,
    "privacyUrl" "text" NOT NULL,
    "supportEmail" "text" NOT NULL,
    "manifestIcons" "text"[] DEFAULT '{}'::"text"[]
);

ALTER TABLE "public"."organisations" OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."org_update_rls"("userid" "uuid", "newobject" "public"."organisations") RETURNS boolean
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
declare userSettings jsonb;
declare brandingUpdatePermissions boolean := false;
declare brandingLoginpagePermissions boolean := false;
declare oldObject organisations;
begin
  IF (SELECT public.isuseradmin(auth.uid()) AS isAdmin) = true THEN return TRUE;
  END IF;
  oldObject := (SELECT * FROM organisations as o WHERE o.id = newObject.id);
  userSettings := (SELECT public.getuserpermissionsobject(auth.uid(), 'settings'));
  brandingUpdatePermissions := userSettings::json#>'{branding, update}';
  IF (
    (newObject."primaryColor" <> oldObject."primaryColor") OR
    (newObject."applicationName" <> oldObject."applicationName") OR
    (newObject."iconUrl" <> oldObject."iconUrl") OR
    (newObject."logoUrl" <> oldObject."logoUrl") OR
    (newObject."manifestIcons" <> oldObject."manifestIcons") AND
    brandingUpdatePermissions = true) then return true;
    END IF;
  brandingLoginpagePermissions := userSettings::json#>'{loginPage, update}';
  IF (
    (newObject."termsUrl" <> oldObject."termsUrl") or
    (newObject."privacyUrl" <> oldObject."privacyUrl") or 
    (newObject."supportEmail" <> oldObject."supportEmail") and
    brandingLoginpagePermissions = true) then return true;
  END IF;
  return false;
end
$$;

ALTER FUNCTION "public"."org_update_rls"("userid" "uuid", "newobject" "public"."organisations") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."reports_by_day"("start_date" "date", "end_date" "date") RETURNS TABLE("report_day" "date", "count" integer)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
  RETURN QUERY
  SELECT date_trunc('day', "createdAt")::DATE as report_day, COUNT(*)
  FROM reports
  WHERE "createdAt" >= start_date AND "createdAt" <= end_date
  GROUP BY 1
  ORDER BY 1;
END;
$$;

ALTER FUNCTION "public"."reports_by_day"("start_date" "date", "end_date" "date") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."reports_by_day2"("start_date" "date", "end_date" "date") RETURNS TABLE("report_day" "date", "count" integer)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
  RETURN QUERY
  SELECT date_trunc('day', "createdAt")::DATE as report_day, COUNT(*)::INT as count
  FROM reports
  WHERE "createdAt" >= start_date AND "createdAt" <= end_date
  GROUP BY 1
  ORDER BY 1;
END;
$$;

ALTER FUNCTION "public"."reports_by_day2"("start_date" "date", "end_date" "date") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."reports_by_day3"("start_date" "date", "end_date" "date") RETURNS TABLE("report_day" "date", "count" integer)
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  RETURN QUERY
  SELECT date_trunc('day', "createdAt")::DATE as report_day, COUNT(*)::INT as count
  FROM reports
  WHERE "createdAt" >= start_date AND "createdAt" <= end_date
  GROUP BY 1
  ORDER BY 1;
END;
$$;

ALTER FUNCTION "public"."reports_by_day3"("start_date" "date", "end_date" "date") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."testing"("start_date" timestamp with time zone, "end_date" timestamp with time zone) RETURNS "void"
    LANGUAGE "sql"
    AS $_$CREATE OR REPLACE FUNCTION reports_by_day(start_date DATE, end_date DATE)
RETURNS TABLE(report_day DATE, count INTEGER) AS $$
BEGIN
  RETURN QUERY
  SELECT date_trunc('day', "createdAt")::DATE as report_day, COUNT(*)
  FROM reports
  WHERE "createdAt" >= start_date AND "createdAt" <= end_date
  GROUP BY 1
  ORDER BY 1;
END;
$$ LANGUAGE plpgsql;$_$;

ALTER FUNCTION "public"."testing"("start_date" timestamp with time zone, "end_date" timestamp with time zone) OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."challenges" (
    "id" bigint NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL,
    "organisation" "text" NOT NULL,
    "views" integer NOT NULL,
    "image" "text",
    "title" "jsonb" NOT NULL,
    "leaderText" "jsonb" NOT NULL,
    "bodyText" "jsonb" NOT NULL,
    "isCarouselElement" boolean NOT NULL,
    "hasLeaderboardButton" boolean NOT NULL,
    "endDate" timestamp with time zone NOT NULL
);

ALTER TABLE "public"."challenges" OWNER TO "postgres";

ALTER TABLE "public"."challenges" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."challenges_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."leaderboards" (
    "id" bigint NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"(),
    "organisation" "text" NOT NULL,
    "unit" "text" NOT NULL,
    "incidentDate" timestamp with time zone NOT NULL
);

ALTER TABLE "public"."leaderboards" OWNER TO "postgres";

ALTER TABLE "public"."leaderboards" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."leaderboards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."news" (
    "id" bigint NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL,
    "organisation" "text" NOT NULL,
    "creator" "uuid",
    "image" "text",
    "views" integer NOT NULL,
    "title" "jsonb" NOT NULL,
    "bodyText" "jsonb" NOT NULL,
    "leaderText" "jsonb" NOT NULL
);

ALTER TABLE "public"."news" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."newsLikes" (
    "id" bigint NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL,
    "user" "uuid",
    "news" bigint NOT NULL
);

ALTER TABLE "public"."newsLikes" OWNER TO "postgres";

ALTER TABLE "public"."newsLikes" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."newsLikes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE "public"."news" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."news_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."notificationReads" (
    "id" bigint NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL,
    "user" "uuid" NOT NULL,
    "notification" bigint NOT NULL,
    "isRead" boolean NOT NULL
);

ALTER TABLE "public"."notificationReads" OWNER TO "postgres";

ALTER TABLE "public"."notificationReads" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."notificationReads_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."notifications" (
    "id" bigint NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL,
    "type" "public"."NotificationType" NOT NULL,
    "organisation" "text" NOT NULL,
    "sender" "uuid",
    "details" "jsonb"
);

ALTER TABLE "public"."notifications" OWNER TO "postgres";

ALTER TABLE "public"."notifications" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."notifications_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."organisationStructures" (
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL,
    "group" "text"[] NOT NULL,
    "company" "text"[] NOT NULL,
    "department" "text"[] NOT NULL,
    "division" "text"[] NOT NULL,
    "branch" "text"[] NOT NULL,
    "subBranch" "text"[] NOT NULL,
    "organisation" "text" NOT NULL
);

ALTER TABLE "public"."organisationStructures" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."reportUpdates" (
    "id" bigint NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL,
    "report" bigint NOT NULL,
    "user" "uuid",
    "isSystemMessage" boolean NOT NULL,
    "message" "text" NOT NULL
);

ALTER TABLE "public"."reportUpdates" OWNER TO "postgres";

ALTER TABLE "public"."reportUpdates" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."reportUpdates_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."reports" (
    "id" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "type" "text" NOT NULL,
    "organisation" "text" NOT NULL,
    "title" "text" NOT NULL,
    "description" "text" NOT NULL,
    "placeOfObservation" "text" NOT NULL,
    "operationsStopped" boolean NOT NULL,
    "issueResolved" boolean NOT NULL,
    "yourActions" "text" NOT NULL,
    "yourSuggestion" "text" NOT NULL,
    "reportCategories" "text"[] NOT NULL,
    "image" "text",
    "reportedToName" "text",
    "reportedToPosition" "text",
    "isDangerousSituation" boolean,
    "whatWeDid" "text",
    "whatWeLearned" "text",
    "reportStatus" "public"."ReportStatus" NOT NULL,
    "updatedUsersIds" "uuid"[] NOT NULL,
    "reporter" "uuid",
    "reportId" integer NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);

ALTER TABLE "public"."reports" OWNER TO "postgres";

ALTER TABLE "public"."reports" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."reports_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."roles" (
    "id" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "organisation" "text",
    "accountSettings" "jsonb" NOT NULL,
    "challenges" "jsonb" NOT NULL,
    "leaderboard" "jsonb" NOT NULL,
    "myReports" "jsonb" NOT NULL,
    "news" "jsonb" NOT NULL,
    "organisationReports" "jsonb" NOT NULL,
    "profile" "jsonb" NOT NULL,
    "report" "jsonb" NOT NULL,
    "settings" "jsonb" NOT NULL,
    "userManagement" "jsonb" NOT NULL,
    "userProfile" "jsonb" NOT NULL,
    "name" "text",
    "homeDashboard" "jsonb"
);

ALTER TABLE "public"."roles" OWNER TO "postgres";

ALTER TABLE "public"."roles" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."roles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."userImportHistory" (
    "id" bigint NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL,
    "organisation" "text",
    "importer" "uuid",
    "fileName" "text" NOT NULL,
    "newUsersCount" bigint NOT NULL,
    "updatedUsersCount" bigint NOT NULL,
    "errorUsersCount" bigint NOT NULL,
    "nonEmployeeUsersCount" bigint NOT NULL
);

ALTER TABLE "public"."userImportHistory" OWNER TO "postgres";

ALTER TABLE "public"."userImportHistory" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."userImportHistory_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."userProfiles" (
    "id" "uuid" NOT NULL,
    "name" "text" NOT NULL,
    "jobTitle" "text" NOT NULL,
    "profileRating" smallint DEFAULT '0'::smallint NOT NULL,
    "birthDay" "date",
    "bloodType" "text",
    "employmentType" "text",
    "sex" "text",
    "employmentDate" "date",
    "introduction" "text",
    "photoUrl" "text",
    "smallPhotoUrl" "text",
    "country" "text",
    "city" "text",
    "homeAddress" "text",
    "email" "text",
    "mobileNumber" "text",
    "idNumber" "text" NOT NULL,
    "anthropometryHeight" "text",
    "anthropometryClothesSize" "text",
    "anthropometryShoeSize" "text",
    "anthropometryHeadSize" "text",
    "organisation" "text",
    "workingEmail" "text",
    "workingMobileNumber" "text"
);

ALTER TABLE "public"."userProfiles" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."userStructures" (
    "id" "uuid" NOT NULL,
    "group" "text",
    "company" "text" NOT NULL,
    "department" "text",
    "division" "text",
    "branch" "text",
    "subBranch" "text"
);

ALTER TABLE "public"."userStructures" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."users" (
    "id" "uuid" NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL,
    "organisation" "text",
    "language" "text" DEFAULT 'en'::"text" NOT NULL,
    "role" bigint,
    "status" "text" DEFAULT 'created'::"text" NOT NULL,
    "loginMethod" "text" DEFAULT 'none'::"text" NOT NULL,
    "beforeBlockStatus" "text",
    "isPushNotificationAllowed" boolean,
    "pushNotificationTokenId" "text",
    "resetPasswordKey" "text",
    "isPasswordChanged" boolean,
    "applicationRole" "public"."ApplicationRole" DEFAULT 'user'::"public"."ApplicationRole" NOT NULL,
    "lastLogin" timestamp with time zone
);

ALTER TABLE "public"."users" OWNER TO "postgres";

CREATE OR REPLACE VIEW "public"."usersManagement" WITH ("security_invoker"='true') AS
 SELECT "u"."id",
    "u"."lastLogin",
    "u"."applicationRole",
    "u"."organisation",
    "u"."status",
    "u"."loginMethod",
    "up"."name",
    "up"."idNumber",
    "up"."jobTitle",
    "up"."smallPhotoUrl",
    "up"."email",
    "up"."mobileNumber",
    "r"."name" AS "role",
    "us"."company",
    "lower"("up"."name") AS "orderName",
    "lower"("up"."jobTitle") AS "orderJobTitle",
    "lower"("us"."company") AS "orderCompany",
    "lower"("r"."name") AS "orderRole",
    "lower"((((((((("up"."name" || ' '::"text") || "up"."idNumber") || ' '::"text") || "up"."jobTitle") || ' '::"text") || "up"."email") || ' '::"text") || "up"."mobileNumber")) AS "search",
    "up"."profileRating",
    "up"."photoUrl",
    "up"."employmentType"
   FROM ((("public"."users" "u"
     JOIN "public"."userProfiles" "up" ON (("u"."id" = "up"."id")))
     JOIN "public"."roles" "r" ON (("u"."role" = "r"."id")))
     JOIN "public"."userStructures" "us" ON (("u"."id" = "us"."id")));

ALTER TABLE "public"."usersManagement" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "supabase_migrations"."schema_migrations" (
    "version" "text" NOT NULL,
    "statements" "text"[],
    "name" "text"
);

ALTER TABLE "supabase_migrations"."schema_migrations" OWNER TO "postgres";

ALTER TABLE ONLY "public"."challenges"
    ADD CONSTRAINT "challenges_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."leaderboards"
    ADD CONSTRAINT "leaderboards_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."newsLikes"
    ADD CONSTRAINT "newsLikes_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."news"
    ADD CONSTRAINT "news_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."notificationReads"
    ADD CONSTRAINT "notificationReads_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."organisations"
    ADD CONSTRAINT "organisations_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."reportUpdates"
    ADD CONSTRAINT "reportUpdates_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."reports"
    ADD CONSTRAINT "reports_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."roles"
    ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."organisationStructures"
    ADD CONSTRAINT "structure_pkey" PRIMARY KEY ("organisation");

ALTER TABLE ONLY "public"."organisationStructures"
    ADD CONSTRAINT "structures_organisation_key" UNIQUE ("organisation");

ALTER TABLE ONLY "public"."userImportHistory"
    ADD CONSTRAINT "userImportHistory_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."userProfiles"
    ADD CONSTRAINT "userInfo_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."userStructures"
    ADD CONSTRAINT "userStructures_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_id_key" UNIQUE ("id");

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "supabase_migrations"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");

CREATE OR REPLACE TRIGGER "before_insert_notification" BEFORE INSERT ON "public"."notificationReads" FOR EACH ROW EXECUTE FUNCTION "public"."delete_oldest_notification"();

CREATE OR REPLACE TRIGGER "org_update_trigger" BEFORE UPDATE ON "public"."organisations" FOR EACH ROW EXECUTE FUNCTION "public"."org_row_update"();

ALTER TABLE ONLY "public"."challenges"
    ADD CONSTRAINT "challenges_organisation_fkey" FOREIGN KEY ("organisation") REFERENCES "public"."organisations"("id") ON UPDATE CASCADE;

ALTER TABLE ONLY "public"."leaderboards"
    ADD CONSTRAINT "leaderboards_organisation_fkey" FOREIGN KEY ("organisation") REFERENCES "public"."organisations"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."newsLikes"
    ADD CONSTRAINT "newsLikes_news_fkey" FOREIGN KEY ("news") REFERENCES "public"."news"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."newsLikes"
    ADD CONSTRAINT "newsLikes_user_fkey" FOREIGN KEY ("user") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY "public"."news"
    ADD CONSTRAINT "news_creator_fkey" FOREIGN KEY ("creator") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY "public"."news"
    ADD CONSTRAINT "news_organisation_fkey" FOREIGN KEY ("organisation") REFERENCES "public"."organisations"("id") ON UPDATE CASCADE;

ALTER TABLE ONLY "public"."notificationReads"
    ADD CONSTRAINT "notificationReads_notification_fkey" FOREIGN KEY ("notification") REFERENCES "public"."notifications"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."notificationReads"
    ADD CONSTRAINT "notificationReads_user_fkey" FOREIGN KEY ("user") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_organisation_fkey" FOREIGN KEY ("organisation") REFERENCES "public"."organisations"("id") ON UPDATE CASCADE;

ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "notifications_sender_fkey" FOREIGN KEY ("sender") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY "public"."organisationStructures"
    ADD CONSTRAINT "organisationStructures_organisation_fkey" FOREIGN KEY ("organisation") REFERENCES "public"."organisations"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."reportUpdates"
    ADD CONSTRAINT "reportUpdates_report_fkey" FOREIGN KEY ("report") REFERENCES "public"."reports"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."reportUpdates"
    ADD CONSTRAINT "reportUpdates_user_fkey" FOREIGN KEY ("user") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY "public"."reports"
    ADD CONSTRAINT "reports_organisation_fkey" FOREIGN KEY ("organisation") REFERENCES "public"."organisations"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."reports"
    ADD CONSTRAINT "reports_reporter_fkey" FOREIGN KEY ("reporter") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY "public"."roles"
    ADD CONSTRAINT "roles_organisation_fkey" FOREIGN KEY ("organisation") REFERENCES "public"."organisations"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."userImportHistory"
    ADD CONSTRAINT "userImportHistory_importer_fkey" FOREIGN KEY ("importer") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY "public"."userImportHistory"
    ADD CONSTRAINT "userImportHistory_organisation_fkey" FOREIGN KEY ("organisation") REFERENCES "public"."organisations"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."userProfiles"
    ADD CONSTRAINT "userProfiles_id_fkey" FOREIGN KEY ("id") REFERENCES "public"."users"("id");

ALTER TABLE ONLY "public"."userProfiles"
    ADD CONSTRAINT "userProfiles_organisation_fkey" FOREIGN KEY ("organisation") REFERENCES "public"."organisations"("id");

ALTER TABLE ONLY "public"."userStructures"
    ADD CONSTRAINT "userStructures_id_fkey" FOREIGN KEY ("id") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_organisation_fkey" FOREIGN KEY ("organisation") REFERENCES "public"."organisations"("id") ON UPDATE CASCADE;

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_role_fkey" FOREIGN KEY ("role") REFERENCES "public"."roles"("id") ON UPDATE CASCADE;

ALTER TABLE "public"."challenges" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "challenges_read" ON "public"."challenges" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ("public"."isuserinorg"("organisation", "auth"."uid"()) AND (((("public"."getuserpermissionsobject"("auth"."uid"(), 'challenges'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean)));

CREATE POLICY "leaderboard_read" ON "public"."leaderboards" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ("public"."isuserinorg"("organisation", "auth"."uid"()) AND (((("public"."getuserpermissionsobject"("auth"."uid"(), 'leaderboard'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean)));

ALTER TABLE "public"."leaderboards" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."news" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."newsLikes" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "news_read" ON "public"."news" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ("public"."isuserinorg"("organisation", "auth"."uid"()) AND (((("public"."getuserpermissionsobject"("auth"."uid"(), 'news'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean)));

CREATE POLICY "newslikes_read" ON "public"."newsLikes" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ((((("public"."getuserpermissionsobject"("auth"."uid"(), 'news'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean AND "public"."isuserinorg"("public"."getorgbynewsid"("news"), "auth"."uid"()))));

ALTER TABLE "public"."notificationReads" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "notification_read" ON "public"."notifications" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ("public"."isuserinorg"("organisation", "auth"."uid"()) AND "public"."notificationrecordexistsforuser"("id", "auth"."uid"()) AND ((("type" = 'news'::"public"."NotificationType") AND (((("public"."getuserpermissionsobject"("auth"."uid"(), 'news'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean) OR (("type" = 'report'::"public"."NotificationType") AND (((("public"."getuserpermissionsobject"("auth"."uid"(), 'organisationReports'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean) OR ("type" = 'notification'::"public"."NotificationType")))));

CREATE POLICY "notificationreads_read" ON "public"."notificationReads" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ("user" = "auth"."uid"())));

ALTER TABLE "public"."notifications" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "org_read" ON "public"."organisations" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR "public"."isuserinorg"("id", "auth"."uid"())));

ALTER TABLE "public"."organisationStructures" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."organisations" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "orgstructure_read" ON "public"."organisationStructures" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR "public"."isuserinorg"("organisation", "auth"."uid"())));

ALTER TABLE "public"."reportUpdates" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."reports" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "reports_read" ON "public"."reports" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ((("reporter" = "auth"."uid"()) AND (((("public"."getuserpermissionsobject"("auth"."uid"(), 'myReports'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean) OR ("public"."isuserinorg"("organisation", "auth"."uid"()) AND (((("public"."getuserpermissionsobject"("auth"."uid"(), 'organisationReports'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean))));

CREATE POLICY "reportupdates_read" ON "public"."reportUpdates" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR (((((("public"."getuserpermissionsobject"("auth"."uid"(), 'myReports'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean AND (("auth"."uid"() = "user") OR ("public"."getreporterbyreportid"("report") = "auth"."uid"()))) OR ((((("public"."getuserpermissionsobject"("auth"."uid"(), 'organisationReports'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean AND "public"."isuserinorg"("public"."getorgbyreportid"("report"), "auth"."uid"())))));

ALTER TABLE "public"."roles" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "roles_read" ON "public"."roles" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR "public"."isuserinorg"("organisation", "auth"."uid"())));

ALTER TABLE "public"."userImportHistory" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."userProfiles" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."userStructures" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "userimporthistory_read" ON "public"."userImportHistory" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ("public"."isuserinorg"("organisation", "auth"."uid"()) AND (((("public"."getuserpermissionsobject"("auth"."uid"(), 'userManagement'::"text"))::"json" #> '{import}'::"text"[]) ->> 'read'::"text"))::boolean)));

CREATE POLICY "userprofiles_read" ON "public"."userProfiles" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ("public"."isuserinorg"("organisation", "auth"."uid"()) AND (("id" = "auth"."uid"()) OR (((("public"."getuserpermissionsobject"("auth"."uid"(), 'userProfile'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean OR (((("public"."getuserpermissionsobject"("auth"."uid"(), 'userManagement'::"text"))::"json" #> '{users}'::"text"[]) ->> 'read'::"text"))::boolean))));

ALTER TABLE "public"."users" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "users_read" ON "public"."users" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ("public"."isuserinorg"("organisation", "auth"."uid"()) AND (("id" = "auth"."uid"()) OR (((("public"."getuserpermissionsobject"("auth"."uid"(), 'userProfile'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean OR (((("public"."getuserpermissionsobject"("auth"."uid"(), 'userManagement'::"text"))::"json" #> '{users}'::"text"[]) ->> 'read'::"text"))::boolean))));

CREATE POLICY "userstructures_read" ON "public"."userStructures" FOR SELECT TO "authenticated" USING (("public"."isuseradmin"("auth"."uid"()) OR ("public"."isuserinorg"("public"."getorgbyuserid"("id"), "auth"."uid"()) AND (("id" = "auth"."uid"()) OR (((("public"."getuserpermissionsobject"("auth"."uid"(), 'userProfile'::"text"))::"json" #> '{default}'::"text"[]) ->> 'read'::"text"))::boolean OR (((("public"."getuserpermissionsobject"("auth"."uid"(), 'userManagement'::"text"))::"json" #> '{users}'::"text"[]) ->> 'read'::"text"))::boolean))));

REVOKE USAGE ON SCHEMA "public" FROM PUBLIC;
GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";
GRANT ALL ON SCHEMA "public" TO "supabase_admin";

GRANT ALL ON FUNCTION "public"."delete_oldest_notification"() TO "anon";
GRANT ALL ON FUNCTION "public"."delete_oldest_notification"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."delete_oldest_notification"() TO "service_role";

GRANT ALL ON FUNCTION "public"."get_report_analytics_table_data"("organisation_id" character varying, "start_date" timestamp without time zone, "end_date" timestamp without time zone) TO "anon";
GRANT ALL ON FUNCTION "public"."get_report_analytics_table_data"("organisation_id" character varying, "start_date" timestamp without time zone, "end_date" timestamp without time zone) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_report_analytics_table_data"("organisation_id" character varying, "start_date" timestamp without time zone, "end_date" timestamp without time zone) TO "service_role";

GRANT ALL ON FUNCTION "public"."getorgbynewsid"("_newsid" bigint, OUT "org_id" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."getorgbynewsid"("_newsid" bigint, OUT "org_id" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."getorgbynewsid"("_newsid" bigint, OUT "org_id" "text") TO "service_role";

GRANT ALL ON FUNCTION "public"."getorgbyreportid"("_reportid" bigint, OUT "org_id" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."getorgbyreportid"("_reportid" bigint, OUT "org_id" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."getorgbyreportid"("_reportid" bigint, OUT "org_id" "text") TO "service_role";

GRANT ALL ON FUNCTION "public"."getorgbyuserid"("_userid" "uuid", OUT "org_id" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."getorgbyuserid"("_userid" "uuid", OUT "org_id" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."getorgbyuserid"("_userid" "uuid", OUT "org_id" "text") TO "service_role";

GRANT ALL ON FUNCTION "public"."getreporterbyreportid"("_reportid" bigint, OUT "user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."getreporterbyreportid"("_reportid" bigint, OUT "user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."getreporterbyreportid"("_reportid" bigint, OUT "user_id" "uuid") TO "service_role";

GRANT ALL ON FUNCTION "public"."getrolebyuser"("_userid" "uuid", OUT "roleid" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."getrolebyuser"("_userid" "uuid", OUT "roleid" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."getrolebyuser"("_userid" "uuid", OUT "roleid" bigint) TO "service_role";

GRANT ALL ON FUNCTION "public"."getuserpermissionsobject"("_userid" "uuid", "_column" "text", OUT "permissions" "jsonb") TO "anon";
GRANT ALL ON FUNCTION "public"."getuserpermissionsobject"("_userid" "uuid", "_column" "text", OUT "permissions" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."getuserpermissionsobject"("_userid" "uuid", "_column" "text", OUT "permissions" "jsonb") TO "service_role";

GRANT ALL ON FUNCTION "public"."getuserrolepermissions"("_roleid" bigint, "_permission_path" character varying, OUT "result" "jsonb") TO "anon";
GRANT ALL ON FUNCTION "public"."getuserrolepermissions"("_roleid" bigint, "_permission_path" character varying, OUT "result" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."getuserrolepermissions"("_roleid" bigint, "_permission_path" character varying, OUT "result" "jsonb") TO "service_role";

GRANT ALL ON FUNCTION "public"."isuseradmin"("_userid" "uuid", OUT "isadmin" boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."isuseradmin"("_userid" "uuid", OUT "isadmin" boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."isuseradmin"("_userid" "uuid", OUT "isadmin" boolean) TO "service_role";

GRANT ALL ON FUNCTION "public"."isuserinorg"("_orgid" "text", "_userid" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."isuserinorg"("_orgid" "text", "_userid" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."isuserinorg"("_orgid" "text", "_userid" "uuid") TO "service_role";

GRANT ALL ON FUNCTION "public"."notificationrecordexistsforuser"("_notificationid" bigint, "_userid" "uuid", OUT "_exists" boolean) TO "anon";
GRANT ALL ON FUNCTION "public"."notificationrecordexistsforuser"("_notificationid" bigint, "_userid" "uuid", OUT "_exists" boolean) TO "authenticated";
GRANT ALL ON FUNCTION "public"."notificationrecordexistsforuser"("_notificationid" bigint, "_userid" "uuid", OUT "_exists" boolean) TO "service_role";

GRANT ALL ON FUNCTION "public"."org_row_update"() TO "anon";
GRANT ALL ON FUNCTION "public"."org_row_update"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."org_row_update"() TO "service_role";

GRANT ALL ON TABLE "public"."organisations" TO "anon";
GRANT ALL ON TABLE "public"."organisations" TO "authenticated";
GRANT ALL ON TABLE "public"."organisations" TO "service_role";

GRANT ALL ON FUNCTION "public"."org_update_rls"("userid" "uuid", "newobject" "public"."organisations") TO "anon";
GRANT ALL ON FUNCTION "public"."org_update_rls"("userid" "uuid", "newobject" "public"."organisations") TO "authenticated";
GRANT ALL ON FUNCTION "public"."org_update_rls"("userid" "uuid", "newobject" "public"."organisations") TO "service_role";

GRANT ALL ON FUNCTION "public"."reports_by_day"("start_date" "date", "end_date" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."reports_by_day"("start_date" "date", "end_date" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."reports_by_day"("start_date" "date", "end_date" "date") TO "service_role";

GRANT ALL ON FUNCTION "public"."reports_by_day2"("start_date" "date", "end_date" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."reports_by_day2"("start_date" "date", "end_date" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."reports_by_day2"("start_date" "date", "end_date" "date") TO "service_role";

GRANT ALL ON FUNCTION "public"."reports_by_day3"("start_date" "date", "end_date" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."reports_by_day3"("start_date" "date", "end_date" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."reports_by_day3"("start_date" "date", "end_date" "date") TO "service_role";

GRANT ALL ON FUNCTION "public"."testing"("start_date" timestamp with time zone, "end_date" timestamp with time zone) TO "anon";
GRANT ALL ON FUNCTION "public"."testing"("start_date" timestamp with time zone, "end_date" timestamp with time zone) TO "authenticated";
GRANT ALL ON FUNCTION "public"."testing"("start_date" timestamp with time zone, "end_date" timestamp with time zone) TO "service_role";

GRANT ALL ON TABLE "public"."challenges" TO "anon";
GRANT ALL ON TABLE "public"."challenges" TO "authenticated";
GRANT ALL ON TABLE "public"."challenges" TO "service_role";

GRANT ALL ON SEQUENCE "public"."challenges_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."challenges_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."challenges_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."leaderboards" TO "anon";
GRANT ALL ON TABLE "public"."leaderboards" TO "authenticated";
GRANT ALL ON TABLE "public"."leaderboards" TO "service_role";

GRANT ALL ON SEQUENCE "public"."leaderboards_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."leaderboards_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."leaderboards_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."news" TO "anon";
GRANT ALL ON TABLE "public"."news" TO "authenticated";
GRANT ALL ON TABLE "public"."news" TO "service_role";

GRANT ALL ON TABLE "public"."newsLikes" TO "anon";
GRANT ALL ON TABLE "public"."newsLikes" TO "authenticated";
GRANT ALL ON TABLE "public"."newsLikes" TO "service_role";

GRANT ALL ON SEQUENCE "public"."newsLikes_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."newsLikes_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."newsLikes_id_seq" TO "service_role";

GRANT ALL ON SEQUENCE "public"."news_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."news_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."news_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."notificationReads" TO "anon";
GRANT ALL ON TABLE "public"."notificationReads" TO "authenticated";
GRANT ALL ON TABLE "public"."notificationReads" TO "service_role";

GRANT ALL ON SEQUENCE "public"."notificationReads_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."notificationReads_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."notificationReads_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."notifications" TO "anon";
GRANT ALL ON TABLE "public"."notifications" TO "authenticated";
GRANT ALL ON TABLE "public"."notifications" TO "service_role";

GRANT ALL ON SEQUENCE "public"."notifications_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."notifications_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."notifications_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."organisationStructures" TO "anon";
GRANT ALL ON TABLE "public"."organisationStructures" TO "authenticated";
GRANT ALL ON TABLE "public"."organisationStructures" TO "service_role";

GRANT ALL ON TABLE "public"."reportUpdates" TO "anon";
GRANT ALL ON TABLE "public"."reportUpdates" TO "authenticated";
GRANT ALL ON TABLE "public"."reportUpdates" TO "service_role";

GRANT ALL ON SEQUENCE "public"."reportUpdates_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."reportUpdates_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."reportUpdates_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."reports" TO "anon";
GRANT ALL ON TABLE "public"."reports" TO "authenticated";
GRANT ALL ON TABLE "public"."reports" TO "service_role";

GRANT ALL ON SEQUENCE "public"."reports_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."reports_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."reports_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."roles" TO "anon";
GRANT ALL ON TABLE "public"."roles" TO "authenticated";
GRANT ALL ON TABLE "public"."roles" TO "service_role";

GRANT ALL ON SEQUENCE "public"."roles_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."roles_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."roles_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."userImportHistory" TO "anon";
GRANT ALL ON TABLE "public"."userImportHistory" TO "authenticated";
GRANT ALL ON TABLE "public"."userImportHistory" TO "service_role";

GRANT ALL ON SEQUENCE "public"."userImportHistory_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."userImportHistory_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."userImportHistory_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."userProfiles" TO "anon";
GRANT ALL ON TABLE "public"."userProfiles" TO "authenticated";
GRANT ALL ON TABLE "public"."userProfiles" TO "service_role";

GRANT ALL ON TABLE "public"."userStructures" TO "anon";
GRANT ALL ON TABLE "public"."userStructures" TO "authenticated";
GRANT ALL ON TABLE "public"."userStructures" TO "service_role";

GRANT ALL ON TABLE "public"."users" TO "anon";
GRANT ALL ON TABLE "public"."users" TO "authenticated";
GRANT ALL ON TABLE "public"."users" TO "service_role";

GRANT ALL ON TABLE "public"."usersManagement" TO "anon";
GRANT ALL ON TABLE "public"."usersManagement" TO "authenticated";
GRANT ALL ON TABLE "public"."usersManagement" TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";

RESET ALL;
