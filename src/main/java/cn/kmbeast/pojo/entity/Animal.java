package cn.kmbeast.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Animal {
    private Integer id;                  // 档案编号
    private String name;                 // 动物名称/昵称
    private String type;                 // 类型（猫咪/狗狗）
    private String avatar;               // 头像图片URL
    private String location;             // 常驻位置/发现地点
    private String age;                  // 预估年龄
    private String gender;               // 性别（公/母/未知）
    private String color;                // 毛色/颜色特征
    private String personality;          // 性格特征
    private String description;          // 详细描述
    private Integer healthStatus;        // 健康状态（0-健康 1-生病 2-治疗中）
    private String lifeStatus;           // 生命周期状态
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime foundTime;     // 发现时间
    private Integer submitterId;         // 提交人ID
    private String submitterName;        // 提交人姓名
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;    // 建档时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;    // 更新时间
    private Integer isDeleted;           // 是否删除（0-否 1-是）
}