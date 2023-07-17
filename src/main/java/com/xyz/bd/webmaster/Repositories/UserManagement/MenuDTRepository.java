package com.xyz.bd.webmaster.Repositories.UserManagement;


import com.xyz.bd.webmaster.Models.UserManagement.Entities.Menu;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuDTRepository extends DataTablesRepository<Menu, Long> {


    DataTablesOutput<Menu> findAll(DataTablesInput input, Specification<Menu> spec);

    DataTablesOutput<Menu> findAll(DataTablesInput input);

}