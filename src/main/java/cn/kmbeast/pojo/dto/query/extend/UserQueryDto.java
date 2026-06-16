package cn.kmbeast.pojo.dto.query.extend;

import cn.kmbeast.pojo.dto.query.base.QueryDto;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserQueryDto extends QueryDto {
    private String username;

    private String phone;

    private String role;

    private Integer status;

    private Integer isVolunteerApproved;
}
