package cn.kmbeast.service.impl;

import cn.kmbeast.mapper.CommunityPostMapper;
import cn.kmbeast.pojo.dto.query.extend.CommunityPostQueryDto;
import cn.kmbeast.pojo.entity.CommunityPost;
import cn.kmbeast.service.CommunityPostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Service
public class CommunityPostServiceImpl implements CommunityPostService {

    @Resource
    private CommunityPostMapper communityPostMapper;

    @Override
    public void insert(CommunityPost post) {
        if (post.getStatus() == null) {
            post.setStatus("待审核");
        }
        if (post.getViewCount() == null) {
            post.setViewCount(0);
        }
        if (post.getLikeCount() == null) {
            post.setLikeCount(0);
        }
        if (post.getCommentCount() == null) {
            post.setCommentCount(0);
        }
        communityPostMapper.insert(post);
    }

    @Override
    public void update(CommunityPost post) {
        communityPostMapper.update(post);
    }

    @Override
    public void deleteById(Long id) {
        communityPostMapper.deleteById(id);
    }

    @Override
    public void batchDelete(List<Long> ids) {
        communityPostMapper.batchDelete(ids);
    }

    @Override
    public void audit(CommunityPost post) {
        post.setAuditTime(LocalDateTime.now());
        communityPostMapper.audit(post);
    }

    @Override
    public void batchAudit(List<Long> ids, String status, String auditOpinion, Long auditorId) {
        communityPostMapper.batchAudit(ids, status, auditOpinion, LocalDateTime.now(), auditorId);
    }

    @Override
    public CommunityPost getById(Long id) {
        return communityPostMapper.getById(id);
    }

    @Override
    public List<CommunityPost> query(CommunityPostQueryDto queryDto) {
        return communityPostMapper.query(queryDto);
    }

    @Override
    public Integer queryCount(CommunityPostQueryDto queryDto) {
        return communityPostMapper.queryCount(queryDto);
    }

    @Override
    public Map<String, Object> getStats() {
        return communityPostMapper.getStats();
    }

    @Override
    public List<Map<String, Object>> getCategoryStats() {
        return communityPostMapper.getCategoryStats();
    }

    @Override
    public List<Map<String, Object>> getTrendData(String startTime, String endTime, String period) {
        String format;
        if ("week".equals(period)) {
            format = "%Y-%u";
        } else if ("month".equals(period)) {
            format = "%Y-%m";
        } else {
            format = "%Y-%m-%d";
        }

        LocalDateTime start = null;
        LocalDateTime end = null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        if (startTime != null && !startTime.isEmpty()) {
            start = LocalDateTime.parse(startTime, formatter);
        }
        if (endTime != null && !endTime.isEmpty()) {
            end = LocalDateTime.parse(endTime, formatter);
        }

        return communityPostMapper.getTrendData(start, end, format);
    }
}