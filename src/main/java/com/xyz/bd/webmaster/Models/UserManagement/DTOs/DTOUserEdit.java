package com.xyz.bd.webmaster.Models.UserManagement.DTOs;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class DTOUserEdit {

    @JsonProperty("Id")
    private Long id;

    @JsonProperty("Name")
    private String name;

    public DTOUserEdit(Long id, String name) {
        this.id = id;
        this.name = name;
    }
}
