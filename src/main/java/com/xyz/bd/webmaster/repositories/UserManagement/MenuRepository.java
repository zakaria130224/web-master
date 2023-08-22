package com.xyz.bd.webmaster.repositories.UserManagement;

import com.xyz.bd.webmaster.models.UserManagement.Entities.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface MenuRepository extends JpaRepository<Menu, Long> {
    List<Menu> findAllByActiveTrue();

    Menu findFirstById(Long id);

    @Query(value = "SELECT m.*\n" +
            "FROM   sf_md_responsibility_menu_map   mp\n" +
            "LEFT JOIN   sf_md_menu   m\n" +
            "ON mp.MENU_ID = m.ID\n" +
            "WHERE mp.RESPONSIBILITY_ID IN (SELECT RESPONSIBILITY_ID FROM   sf_md_user_responsibility_map   WHERE USER_ID =  ?1) AND m.ACTIVE=1 and m.IS_SIDEBAR_MENU=1\n" +
            "UNION\n" +
            "SELECT m.*\n" +
            "from sf_md_menu m where m.ACTIVE=1 and  m.PARENT_ID in\n" +
            "(\n" +
            "SELECT maj.MENU_ID FROM sf_md_responsibility_menu_map maj\n" +
            "LEFT JOIN sf_md_menu ma ON maj.MENU_ID = ma.ID\n" +
            "WHERE maj.RESPONSIBILITY_ID IN (SELECT RESPONSIBILITY_ID FROM sf_md_user_responsibility_map WHERE USER_ID =  ?1 ) AND ma.ACTIVE=1) and m.IS_SIDEBAR_MENU=1\n",
            nativeQuery = true)
    List<Menu> findAllPermittedSideMenuByUserId(Long usrId);

    @Query(value = "SELECT m.*\n" +
            "FROM   sf_md_responsibility_menu_map   mp\n" +
            "LEFT JOIN   sf_md_menu   m\n" +
            "ON mp.MENU_ID = m.ID\n" +
            "WHERE mp.RESPONSIBILITY_ID IN (SELECT RESPONSIBILITY_ID FROM   sf_md_user_responsibility_map   WHERE USER_ID =  ?1) AND m.ACTIVE=1\n" +
            "UNION\n" +
            "SELECT m.*\n" +
            "from sf_md_menu m where m.ACTIVE=1 and  m.PARENT_ID in\n" +
            "(\n" +
            "SELECT maj.MENU_ID FROM sf_md_responsibility_menu_map maj\n" +
            "LEFT JOIN sf_md_menu ma ON maj.MENU_ID = ma.ID\n" +
            "WHERE maj.RESPONSIBILITY_ID IN (SELECT RESPONSIBILITY_ID FROM sf_md_user_responsibility_map WHERE USER_ID =  ?1 ) AND ma.ACTIVE=1)\n",
            nativeQuery = true)
    List<Menu> findAllMenuByUserId(Long usrId);
}
