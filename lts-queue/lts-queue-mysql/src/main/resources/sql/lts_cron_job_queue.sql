CREATE TABLE IF NOT EXISTS `{tableName}` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID与业务无关的',
  `job_id` varchar(64) DEFAULT NULL COMMENT '记录ID,程序生成的',
  `priority` int(11) DEFAULT NULL COMMENT '优先级(数值越大，优先级越低)',
  `retry_times` int(11) DEFAULT '0' COMMENT '重试次数',
  `task_id` varchar(64) DEFAULT NULL COMMENT '客户端传过来的任务ID',
  `gmt_created` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` bigint(11) DEFAULT NULL COMMENT '修改时间',
  `submit_node_group` varchar(64) DEFAULT NULL COMMENT '提交客户端的节点组',
  `task_tracker_node_group` varchar(64) DEFAULT NULL COMMENT '执行job 的任务节点',
  `ext_params` text COMMENT '额外参数 JSON',
  `is_running` tinyint(11) DEFAULT NULL COMMENT '是否正在执行',
  `task_tracker_identity` varchar(64) DEFAULT NULL COMMENT '执行的taskTracker的唯一标识',
  `need_feedback` tinyint(4) DEFAULT NULL COMMENT '是否需要反馈给客户端',
  `cron_expression` varchar(32) DEFAULT NULL COMMENT '执行时间表达式 (和 quartz 表达式一样)',
  `trigger_time` bigint(20) DEFAULT NULL COMMENT '下一次执行时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_job_id` (`job_id`),
  UNIQUE KEY `idx_taskId_taskTrackerNodeGroup` (`task_id`, `task_tracker_node_group`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;