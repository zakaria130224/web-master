package com.xyz.bd.webmaster.modules.complainManagenment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ComplainRepository extends JpaRepository<ComplainModel, Long> {
}
