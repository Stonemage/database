-- TurtleSys local policy override.
-- The 2160p Efficient profile is used as a deliberate UHD uplift lane.
-- Keep existing 1080p files, but prevent automatic searches from accepting
-- non-UHD releases as replacements for UHD-targeted series.

DELETE FROM quality_group_members
WHERE quality_profile_name = '2160p Efficient'
  AND quality_group_name = '2160p Efficient'
  AND quality_name NOT IN ('WEBDL-2160p', 'Bluray-2160p');

UPDATE quality_group_members
SET position = CASE quality_name
  WHEN 'WEBDL-2160p' THEN 0
  WHEN 'Bluray-2160p' THEN 1
  ELSE position
END
WHERE quality_profile_name = '2160p Efficient'
  AND quality_group_name = '2160p Efficient'
  AND quality_name IN ('WEBDL-2160p', 'Bluray-2160p');
