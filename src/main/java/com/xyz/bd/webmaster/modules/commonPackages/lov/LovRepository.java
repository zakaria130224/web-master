package com.xyz.bd.webmaster.modules.commonPackages.lov;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LovRepository extends JpaRepository<LovModel, Long> {
    @Query("SELECT l FROM LovModel as l WHERE l.typeName = :type AND l.isActive = true")
    List<LovModel> findByType(String type);

    @Query("SELECT l FROM LovModel as l WHERE l.parentId = :id AND l.isActive = true")
    List<LovModel> findAllByParentId(Long id);
}
