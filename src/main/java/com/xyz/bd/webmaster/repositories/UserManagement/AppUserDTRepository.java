package com.xyz.bd.webmaster.repositories.UserManagement;


import com.xyz.bd.webmaster.models.UserManagement.Entities.AppUser;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

@Repository
public interface AppUserDTRepository extends DataTablesRepository<AppUser, Long> {


    DataTablesOutput<AppUser> findAll(DataTablesInput input, Specification<AppUser> spec);

}