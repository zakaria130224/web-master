package com.xyz.bd.webmaster.Repositories.UserManagement;


import com.xyz.bd.webmaster.Models.UserManagement.Entities.Responsibility;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

@Repository
public interface ResponsibilityDTRepository extends DataTablesRepository<Responsibility, Long> {


    DataTablesOutput<Responsibility> findAll(DataTablesInput input, Specification<Responsibility> spec);

    DataTablesOutput<Responsibility> findAll(DataTablesInput input);

}