package cn.kmbeast.pojo.dto.query.extend;

import cn.kmbeast.pojo.dto.query.base.QueryDto;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class AdoptionQueryDto extends QueryDto {

    private Integer animalId;

    private Integer userId;

    private String status;

    private String animalName;

    private String userName;
}