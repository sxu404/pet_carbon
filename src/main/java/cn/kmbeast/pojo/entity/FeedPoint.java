package cn.kmbeast.pojo.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FeedPoint {

    private Integer feedId;

    private String feedName;

    private String feedLocation;

    private String feedStatus;

    private String feedRemark;
}
