ALTER TABLE `Monitors` MODIFY `OutputCodec` enum('h264','mjpeg','mpeg1','mpeg2')

SET @s = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema = DATABASE()
     AND table_name = 'Events'
     AND column_name = 'SaveJPEGs'
    ) > 0,
"SELECT 'Column SaveJPEGs already exists in Events'",
"ALTER TABLE `Eventss` ADD `SaveJPEGs` TINYINT AFTER `DefaultVideo`"
));

PREPARE stmt FROM @s;
EXECUTE stmt;
