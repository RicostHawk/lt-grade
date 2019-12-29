package com.windsoft.lt.grade.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * @ClassName Organization
 * @Description
 * @Author Ricost
 * @Date 2019/12/12 11:12
 * @Version V1.0
 **/

@Data
@EqualsAndHashCode(callSuper = false)
public class Organization {
    private Long orgId;
    private String orgName;
    private int orgType;
    private String intro;
    private Date created;
}