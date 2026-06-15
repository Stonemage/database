-- TurtleSys local policy override.
-- The 2160p Efficient profile is used as a deliberate UHD uplift lane.
-- Keep existing 1080p files, but prevent automatic searches from accepting
-- non-UHD releases as replacements for UHD-targeted series.

DELETE FROM quality_group_members
WHERE quality_profile_name = '2160p Efficient'
  AND quality_group_name = '2160p Efficient'
  AND quality_name NOT IN ('WEBDL-2160p', 'Bluray-2160p');

INSERT INTO quality_profile_qualities (
  quality_profile_name,
  quality_name,
  quality_group_name,
  position,
  enabled,
  upgrade_until
)
SELECT '2160p Efficient', q.quality_name, NULL, q.position, 0, 0
FROM (
  SELECT 'SDTV' AS quality_name, 100 AS position UNION ALL
  SELECT 'DVD', 101 UNION ALL
  SELECT 'WEBDL-480p', 102 UNION ALL
  SELECT 'Bluray-480p', 103 UNION ALL
  SELECT 'Bluray-576p', 104 UNION ALL
  SELECT 'HDTV-720p', 105 UNION ALL
  SELECT 'WEBRip-720p', 106 UNION ALL
  SELECT 'WEBDL-720p', 107 UNION ALL
  SELECT 'Bluray-720p', 108 UNION ALL
  SELECT 'HDTV-1080p', 109 UNION ALL
  SELECT 'WEBRip-1080p', 110 UNION ALL
  SELECT 'WEBDL-1080p', 111 UNION ALL
  SELECT 'Bluray-1080p', 112
) q
WHERE NOT EXISTS (
  SELECT 1
  FROM quality_profile_qualities existing
  WHERE existing.quality_profile_name = '2160p Efficient'
    AND existing.quality_name = q.quality_name
    AND existing.quality_group_name IS NULL
);

UPDATE quality_profile_qualities
SET enabled = 0,
    position = CASE quality_name
      WHEN 'SDTV' THEN 100
      WHEN 'DVD' THEN 101
      WHEN 'WEBDL-480p' THEN 102
      WHEN 'Bluray-480p' THEN 103
      WHEN 'Bluray-576p' THEN 104
      WHEN 'HDTV-720p' THEN 105
      WHEN 'WEBRip-720p' THEN 106
      WHEN 'WEBDL-720p' THEN 107
      WHEN 'Bluray-720p' THEN 108
      WHEN 'HDTV-1080p' THEN 109
      WHEN 'WEBRip-1080p' THEN 110
      WHEN 'WEBDL-1080p' THEN 111
      WHEN 'Bluray-1080p' THEN 112
      ELSE position
    END
WHERE quality_profile_name = '2160p Efficient'
  AND quality_group_name IS NULL
  AND quality_name IN (
    'SDTV',
    'DVD',
    'WEBDL-480p',
    'Bluray-480p',
    'Bluray-576p',
    'HDTV-720p',
    'WEBRip-720p',
    'WEBDL-720p',
    'Bluray-720p',
    'HDTV-1080p',
    'WEBRip-1080p',
    'WEBDL-1080p',
    'Bluray-1080p'
  );

UPDATE quality_group_members
SET position = CASE quality_name
  WHEN 'WEBDL-2160p' THEN 0
  WHEN 'Bluray-2160p' THEN 1
  ELSE position
END
WHERE quality_profile_name = '2160p Efficient'
  AND quality_group_name = '2160p Efficient'
  AND quality_name IN ('WEBDL-2160p', 'Bluray-2160p');

UPDATE quality_profile_qualities
SET enabled = 1,
    position = 1001,
    upgrade_until = 1
WHERE quality_profile_name = '2160p Efficient'
  AND quality_group_name = '2160p Efficient'
  AND quality_name IS NULL;
