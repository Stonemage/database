-- TurtleSys local policy override.
-- Profilarr renders lower quality_profile_qualities.position values earlier in
-- Sonarr's quality list. Sonarr treats later entries as higher upgrade targets,
-- so the enabled UHD group must sort after disabled lower/non-target qualities.

UPDATE quality_profile_qualities
SET enabled = 1,
    position = 1001,
    upgrade_until = 1
WHERE quality_profile_name = '2160p Efficient'
  AND quality_group_name = '2160p Efficient'
  AND quality_name IS NULL;
