package cn.kmbeast.mapper;

import cn.kmbeast.pojo.dto.query.extend.CommunityPostQueryDto;
import cn.kmbeast.pojo.entity.CommunityPost;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommunityPostMapper {

    void insert(CommunityPost post);

    void update(CommunityPost post);

    void deleteById(Long id);

    void batchDelete(List<Long> ids);

    void audit(CommunityPost post);

    void batchAudit(@Param("ids") List<Long> ids, @Param("status") String status,
                    @Param("auditOpinion") String auditOpinion, @Param("auditTime") java.time.LocalDateTime auditTime,
                    @Param("auditorId") Long auditorId);

    CommunityPost getById(Long id);

    List<CommunityPost> query(CommunityPostQueryDto queryDto);

    Integer queryCount(CommunityPostQueryDto queryDto);

    Map<String, Object> getStats();

    List<Map<String, Object>> getCategoryStats();

    List<Map<String, Object>> getTrendData(@Param("startTime") java.time.LocalDateTime startTime,
                                           @Param("endTime") java.time.LocalDateTime endTime,
                                           @Param("format") String format);
}