-- TurtleSys local policy override.
-- Sonarr treats the ordered quality profile list as the upgrade ladder.
-- Profilarr renders higher position values earlier in that list, so the
-- enabled UHD group must have the lowest position to remain the upgrade target.

UPDATE quality_profile_qualities
SET enabled = 1,
    position = 0,
    upgrade_until = 1
WHERE quality_profile_name = '2160p Efficient'
  AND quality_group_name = '2160p Efficient'
  AND quality_name IS NULL;
