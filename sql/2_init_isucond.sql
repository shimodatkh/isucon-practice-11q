UPDATE `isu_condition`
SET
  `is_dirty` = CASE WHEN `condition` LIKE '%is_dirty=true%' THEN 1 ELSE `is_dirty` END,
  `is_broken` = CASE WHEN `condition` LIKE '%is_broken=true%' THEN 1 ELSE `is_broken` END,
  `is_overweight` = CASE WHEN `condition` LIKE '%is_overweight=true%' THEN 1 ELSE `is_overweight` END,
  `cond_score` = 
    (CASE WHEN `condition` LIKE '%is_dirty=true%' THEN 1 ELSE 0 END) +
    (CASE WHEN `condition` LIKE '%is_broken=true%' THEN 1 ELSE 0 END) +
    (CASE WHEN `condition` LIKE '%is_overweight=true%' THEN 1 ELSE 0 END);
