-- TurtleSys local policy override.
-- Dictionarry Efficient profiles intentionally allow low-resolution fallback.
-- TurtleSys wants managed Sonarr profiles to refuse SD/DVD/480p/576p/720p releases.
UPDATE quality_profile_custom_formats
SET score = -999999
WHERE arr_type = 'sonarr'
  AND quality_profile_name IN ('1080p Efficient', '2160p Efficient')
  AND custom_format_name IN (
    '480p Bluray',
    '480p Quality Tier 1',
    '480p Quality Tier 2',
    '480p Quality Tier 3',
    '480p Quality Tier 4',
    '480p WEB-DL',
    '576p Bluray',
    '576p Quality Tier 1',
    '576p Quality Tier 2',
    '576p Quality Tier 3',
    '576p Quality Tier 4',
    '576p WEB-DL',
    '720p Balanced Tier 1',
    '720p Bluray',
    '720p HDTV',
    '720p HDTV Tier 1',
    '720p HDTV Tier 2',
    '720p HDTV Tier 3',
    '720p Quality Tier 1',
    '720p Quality Tier 2',
    '720p Quality Tier 3',
    '720p Quality Tier 4',
    '720p Quality Tier 5',
    '720p Quality Tier 6',
    '720p WEB-DL',
    'DVD',
    'DVD Quality Tier 1',
    'DVD Quality Tier 2',
    'DVD Remux',
    'SDTV',
    'SDTV Tier 1'
  );
