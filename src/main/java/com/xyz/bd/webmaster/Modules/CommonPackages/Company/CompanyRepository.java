package com.xyz.bd.webmaster.Modules.CommonPackages.Company;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CompanyRepository extends JpaRepository<CompanyModelEntity, Long> {

    // Add custom query method to find a company by name and bs code
    CompanyModelEntity findByCompanyNameAndBsCode(String companyName, String bsCode);
}
