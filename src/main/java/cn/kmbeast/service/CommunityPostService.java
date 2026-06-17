package cn.kmbeast.service;

import cn.kmbeast.pojo.dto.query.extend.CommunityPostQueryDto;
import cn.kmbeast.pojo.entity.CommunityPost;

import java.util.List;
import java.util.Map;

public interface CommunityPostService {

    void insert(CommunityPost post);

    void update(CommunityPost post);

    void deleteById(Long id);

    void batchDelete(List<Long> ids);

    void audit(CommunityPost post);

    void batchAudit(List<Long> ids, String status, String auditOpinion, Long auditorId);

    CommunityPost getById(Long id);

    List<CommunityPost> query(CommunityPostQueryDto queryDto);

    Integer queryCount(CommunityPostQueryDto queryDto);

    Map<String, Object> getStats();

    List<Map<String, Object>> getCategoryStats();

    List<Map<String, Object>> getTrendData(String startTime, String endTime, String period);
}