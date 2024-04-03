create or replace view "public"."reportsCategories" as  SELECT DISTINCT unnest(reports."reportCategories") AS "reportCategory",
    reports."createdAt",
    reports.reporter,
    reports."reportStatus",
    reports.organisation
   FROM reports;