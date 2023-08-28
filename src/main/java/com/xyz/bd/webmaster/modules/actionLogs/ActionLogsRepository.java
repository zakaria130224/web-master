package com.xyz.bd.webmaster.modules.actionLogs;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ActionLogsRepository extends CrudRepository<ActionLogsModel, Long> {
}
