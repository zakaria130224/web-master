package com.xyz.bd.webmaster.appLogger.Repository;

import com.xyz.bd.webmaster.appLogger.Model.Entities.AuditLogger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuditLoggerRepository extends CrudRepository<AuditLogger, Long> {

}