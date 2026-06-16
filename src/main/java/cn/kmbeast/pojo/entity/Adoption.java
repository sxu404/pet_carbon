package cn.kmbeast.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Adoption {

    private Integer id;

    private Integer animalId;

    private String animalName;

    private String animalType;

    private String animalAvatar;

    private Integer userId;

    private String userName;

    private String userPhone;

    private String userAddress;

    private String reason;

    private String status;

    private String rejectReason;

    private Integer reviewerId;

    private String reviewerName;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;
}