package com.xyz.bd.webmaster.Modules.VTS.ExpenseLogs;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExpenseLogRepository extends CrudRepository<ExpenseModelEntity, Long> {

    @Query(value = "select m from ExpenseModelEntity m where m.id=:id")
    ExpenseModelEntity findByExpenseId(Long id);
}
