package com.xyz.bd.webmaster.modules.commonPackages.company;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CompanyRepository extends JpaRepository<CompanyModelEntity, Long> {

    // Add custom query method to find a company by name and bs code
    CompanyModelEntity findByCompanyNameAndBsCode(String companyName, String bsCode);
}
