package com.xyz.bd.webmaster.Repositories.UserManagement;

import com.xyz.bd.webmaster.Models.UserManagement.Entities.Menu;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.Responsibility;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface MenuRepository extends JpaRepository<Menu, Long> {
    List<Menu> findAllByActiveTrue();

    Menu findFirstById(Long id);

    @Query(value = "SELECT m.*\n" +
            "FROM   md_responsibility_menu_map   mp\n" +
            "LEFT JOIN   md_menu   m\n" +
            "ON mp.MENU_ID = m.ID\n" +
            "WHERE mp.RESPONSIBILITY_ID IN (SELECT RESPONSIBILITY_ID FROM   md_user_responsibility_map   WHERE USER_ID =  ?1) AND m.ACTIVE=1 and m.IS_SIDEBAR_MENU=1\n" +
            "UNION\n" +
            "SELECT m.*\n" +
            "from MD_MENU m where m.ACTIVE=1 and  m.PARENT_ID in\n" +
            "(\n" +
            "SELECT maj.MENU_ID FROM MD_RESPONSIBILITY_MENU_MAP maj\n" +
            "LEFT JOIN MD_MENU ma ON maj.MENU_ID = ma.ID\n" +
            "WHERE maj.RESPONSIBILITY_ID IN (SELECT RESPONSIBILITY_ID FROM MD_USER_RESPONSIBILITY_MAP WHERE USER_ID =  ?1 ) AND ma.ACTIVE=1) and m.IS_SIDEBAR_MENU=1\n",
            nativeQuery = true)
    List<Menu> findAllPermittedSideMenuByUserId(Long usrId);

    @Query(value = "SELECT m.*\n" +
            "FROM   md_responsibility_menu_map   mp\n" +
            "LEFT JOIN   md_menu   m\n" +
            "ON mp.MENU_ID = m.ID\n" +
            "WHERE mp.RESPONSIBILITY_ID IN (SELECT RESPONSIBILITY_ID FROM   md_user_responsibility_map   WHERE USER_ID =  ?1) AND m.ACTIVE=1\n" +
            "UNION\n" +
            "SELECT m.*\n" +
            "from MD_MENU m where m.ACTIVE=1 and  m.PARENT_ID in\n" +
            "(\n" +
            "SELECT maj.MENU_ID FROM MD_RESPONSIBILITY_MENU_MAP maj\n" +
            "LEFT JOIN MD_MENU ma ON maj.MENU_ID = ma.ID\n" +
            "WHERE maj.RESPONSIBILITY_ID IN (SELECT RESPONSIBILITY_ID FROM MD_USER_RESPONSIBILITY_MAP WHERE USER_ID =  ?1 ) AND ma.ACTIVE=1)\n",
            nativeQuery = true)
    List<Menu> findAllMenuByUserId(Long usrId);
}
