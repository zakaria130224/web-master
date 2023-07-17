package com.xyz.bd.webmaster.Repositories.UserManagement;


import com.xyz.bd.webmaster.Models.UserManagement.DTOs.DTOUserSession;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUser;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppUserRepository extends CrudRepository<AppUser, Long> {
    AppUser findFirstById(long id);

    DTOUserSession findFirstDTOUserSessionByLoginName(String loginName);

    AppUser findFirstByLoginName(String loginName);

    AppUser findFirstByLoginNameAndPassword(String loginName, String password);

    AppUser findFirstByLoginNameAndPasswordAndActiveIsTrue(String loginName, String password);

    AppUser findFirstByLoginNameOrEmail(String loginName, String email);

    List<AppUser> findAll(Specification<AppUser> spec);

//    DataTablesOutput<AppUser> findAllDtData(DataTablesInput input, Specification<AppUser> spec);


//    @Query("SELECT NEW com.robi.bd.dscms.AppUser.Model.DTOs.DTOUserView(id, name, loginName , email, userGroupName, active, isLock) from AppUser")
//    List<DTOUserView> findallDTOUser();

//    @Query("SELECT new com.robi.bd.dscmschatbot.Model.DTOs.ChatBotUser.DTOChatBotUser(msisdn,applicationName,active,isLock) from ChatBotUser where msisdn=:msisdn")
//    DTOChatBotUser findFirstDTOChatBotUserByMsisdn(@Param("msisdn") String msisdn);
}