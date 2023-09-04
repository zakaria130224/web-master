package com.xyz.bd.webmaster.modules.commonPackages.responsibleTeam;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResponsibleTeamRepository extends JpaRepository<ResponsibleTeamModel, Long> {

}
