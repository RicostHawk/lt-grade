package com.windsoft.lt.grade.web.api.web.controller.v1;

import com.windsoft.lt.grade.commons.dto.BaseResult;
import com.windsoft.lt.grade.commons.utils.MapperUtils;
import com.windsoft.lt.grade.domain.LinkOrgUser;
import com.windsoft.lt.grade.domain.Organization;
import com.windsoft.lt.grade.domain.User;
import com.windsoft.lt.grade.web.api.service.OrgUserLinkService;
import com.windsoft.lt.grade.web.api.web.dto.MemberDTO;
import com.windsoft.lt.grade.web.api.web.dto.OrganizationDTO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName OrganizationController
 * @Description
 * @Author Ricost
 * @Date 2019/12/16 10:38
 * @Version V1.0
 **/
@RestController
@RequestMapping(value = "${api.path.v1}/organizations")
public class OrganizationController {
    @Autowired
    private OrgUserLinkService linkService;

    @RequestMapping(value = "getAll/{uid}", method = RequestMethod.GET)
    public BaseResult getOrg2User(@PathVariable(value = "uid")
                                              Long uid){
        BaseResult result = linkService.getOrgList(uid);

        transform(result);

        return result;
    }

    @RequestMapping(value = "search/{keyword}", method = RequestMethod.GET)
    public BaseResult search(@PathVariable(value = "keyword")
                                         String keyword){
        BaseResult result = linkService.getKeyWordList(keyword);

        transform(result);

        return result;
    }

    @RequestMapping(value = "getMember/{id}", method = RequestMethod.GET)
    private BaseResult getMember(@PathVariable(value = "id")
                                             Long id){
        BaseResult result = linkService.getMember(id);
        List<MemberDTO> memberDTOS = new ArrayList<MemberDTO>();

        if(result.getStatus() == BaseResult.STATUS_SUCCESS){
            List<LinkOrgUser> linkOrgUsers = (List<LinkOrgUser>) result.getData();

            for(LinkOrgUser item : linkOrgUsers){
                MemberDTO memberDTO = new MemberDTO();
                BeanUtils.copyProperties(item.getUser(),memberDTO);
                BeanUtils.copyProperties(item.getController(),memberDTO);
                memberDTOS.add(memberDTO);
            }

            result.setData(memberDTOS);
            return result;
        }
        return BaseResult.fail("请求失败");
    }
    @RequestMapping(value = "created", method = RequestMethod.POST)
    private BaseResult created(String json) throws Exception {
        OrganizationDTO organizationDTO = MapperUtils.json2pojo(json, OrganizationDTO.class);
        LinkOrgUser linkOrgUser = new LinkOrgUser();
        linkOrgUser.setUser(new User());
        linkOrgUser.setOrganization(new Organization());
        BeanUtils.copyProperties(organizationDTO,linkOrgUser);
        BeanUtils.copyProperties(organizationDTO,linkOrgUser.getUser());
        BeanUtils.copyProperties(organizationDTO,linkOrgUser.getOrganization());
        BaseResult result = linkService.create(linkOrgUser);

        return result;
    }

    private void transform(BaseResult result){
        List<OrganizationDTO> organizationDTOS = new ArrayList<OrganizationDTO>();

        if(result.getStatus() == BaseResult.STATUS_SUCCESS){
            List<LinkOrgUser> linkOrgUsers = (List<LinkOrgUser>) result.getData();

            //转换为传输流媒体对象
            for(LinkOrgUser item : linkOrgUsers){
                OrganizationDTO organizationDTO = new OrganizationDTO();
                BeanUtils.copyProperties(item.getUser(),organizationDTO);
                BeanUtils.copyProperties(item.getOrganization(),organizationDTO);
                organizationDTOS.add(organizationDTO);
            }
            result.setData(organizationDTOS);
        }
    }
}