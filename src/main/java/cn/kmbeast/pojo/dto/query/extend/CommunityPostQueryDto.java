package cn.kmbeast.pojo.dto.query.extend;

import cn.kmbeast.pojo.dto.query.base.QueryDto;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class CommunityPostQueryDto extends QueryDto {

    private String title;

    private String publisherUsername;

    private Long publisherId;

    private String category;

    private String status;

    private String startTimeStr;

    private String endTimeStr;
}