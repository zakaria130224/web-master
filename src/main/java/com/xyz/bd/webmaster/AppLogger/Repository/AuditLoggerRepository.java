package com.xyz.bd.webmaster.AppLogger.Repository;

import com.xyz.bd.webmaster.AppLogger.Model.Entities.AuditLogger;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuditLoggerRepository extends CrudRepository<AuditLogger, Long> {

}