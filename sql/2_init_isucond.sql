ALTER TABLE `isu_condition`
ADD COLUMN `is_dirty` TINYINT(1) NOT NULL,
ADD COLUMN `is_overweight` TINYINT(1) NOT NULL,
ADD COLUMN `is_broken` TINYINT(1) NOT NULL,
ADD COLUMN `cond_score` TINYINT(1) NOT NULL;

UPDATE `isu_condition`
SET
  `is_dirty` = CASE WHEN `condition` LIKE '%is_dirty=true%' THEN 1 ELSE `is_dirty` END,
  `is_broken` = CASE WHEN `condition` LIKE '%is_broken=true%' THEN 1 ELSE `is_broken` END,
  `is_overweight` = CASE WHEN `condition` LIKE '%is_overweight=true%' THEN 1 ELSE `is_overweight` END,
  `cond_score` = 
    (CASE WHEN `condition` LIKE '%is_dirty=true%' THEN 1 ELSE 0 END) +
    (CASE WHEN `condition` LIKE '%is_broken=true%' THEN 1 ELSE 0 END) +
    (CASE WHEN `condition` LIKE '%is_overweight=true%' THEN 1 ELSE 0 END);
