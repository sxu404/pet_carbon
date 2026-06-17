package cn.kmbeast.controller;

import cn.kmbeast.pojo.api.ApiResult;
import cn.kmbeast.pojo.api.Result;
import cn.kmbeast.pojo.dto.query.extend.CommunityPostQueryDto;
import cn.kmbeast.pojo.entity.CommunityComment;
import cn.kmbeast.pojo.entity.CommunityPost;
import cn.kmbeast.service.CommunityCommentService;
import cn.kmbeast.service.CommunityPostService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/community")
public class CommunityController {

    @Resource
    private CommunityPostService communityPostService;

    @Resource
    private CommunityCommentService communityCommentService;

    @PostMapping("/query")
    public Result<List<CommunityPost>> queryPosts(@RequestBody CommunityPostQueryDto params) {
        List<CommunityPost> list = communityPostService.query(params);
        Integer total = communityPostService.queryCount(params);
        return ApiResult.success(list, total);
    }

    @GetMapping("/detail/{id}")
    public Result<CommunityPost> getPostDetail(@PathVariable Long id) {
        CommunityPost post = communityPostService.getById(id);
        return ApiResult.success(post);
    }

    @PostMapping("/add")
    public Result<String> addPost(@RequestBody CommunityPost data) {
        communityPostService.insert(data);
        return ApiResult.success();
    }

    @PostMapping("/update")
    public Result<String> updatePost(@RequestBody CommunityPost data) {
        communityPostService.update(data);
        return ApiResult.success();
    }

    @PostMapping("/delete/{id}")
    public Result<String> deletePost(@PathVariable Long id) {
        communityPostService.deleteById(id);
        communityCommentService.deleteByPostId(id);
        return ApiResult.success();
    }

    @PostMapping("/audit")
    public Result<String> auditPost(@RequestBody Map<String, Object> data) {
        CommunityPost post = new CommunityPost();
        post.setId(Long.valueOf(data.get("id").toString()));
        post.setStatus(data.get("status").toString());
        post.setAuditOpinion(data.get("auditOpinion") != null ? data.get("auditOpinion").toString() : null);
        post.setAuditorId(data.get("auditorId") != null ? Long.valueOf(data.get("auditorId").toString()) : null);
        communityPostService.audit(post);
        return ApiResult.success();
    }

    @PostMapping("/batchAudit")
    public Result<String> batchAudit(@RequestBody Map<String, Object> data) {
        @SuppressWarnings("unchecked")
        List<Long> ids = ((List<Integer>) data.get("ids")).stream()
                .map(Long::valueOf)
                .collect(Collectors.toList());
        String status = data.get("status").toString();
        String auditOpinion = data.get("auditOpinion") != null ? data.get("auditOpinion").toString() : null;
        Long auditorId = data.get("auditorId") != null ? Long.valueOf(data.get("auditorId").toString()) : null;
        communityPostService.batchAudit(ids, status, auditOpinion, auditorId);
        return ApiResult.success();
    }

    @GetMapping("/stats")
    public Result<Map<String, Object>> getCommunityStats() {
        Map<String, Object> stats = communityPostService.getStats();
        return ApiResult.success(stats);
    }

    @GetMapping("/categoryStats")
    public Result<List<Map<String, Object>>> getCategoryStats() {
        List<Map<String, Object>> stats = communityPostService.getCategoryStats();
        return ApiResult.success(stats);
    }

    @GetMapping("/trend")
    public Result<List<Map<String, Object>>> getTrendData(
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime,
            @RequestParam(required = false, defaultValue = "day") String period) {
        List<Map<String, Object>> trend = communityPostService.getTrendData(startTime, endTime, period);
        return ApiResult.success(trend);
    }

    @GetMapping("/comments/{postId}")
    public Result<List<Map<String, Object>>> getComments(@PathVariable Long postId) {
        List<CommunityComment> commentList = communityCommentService.queryByPostId(postId);
        List<Map<String, Object>> comments = new ArrayList<>();
        for (CommunityComment c : commentList) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", c.getId());
            map.put("postId", c.getPostId());
            map.put("publisherId", c.getPublisherId());
            map.put("publisherUsername", c.getPublisherUsername());
            map.put("content", c.getContent());
            map.put("likeCount", c.getLikeCount());
            map.put("createTime", c.getCreateTime());
            map.put("updateTime", c.getUpdateTime());
            comments.add(map);
        }
        return ApiResult.success(comments);
    }

    @PostMapping("/comment/delete/{commentId}")
    public Result<String> deleteComment(@PathVariable Long commentId) {
        communityCommentService.deleteById(commentId);
        return ApiResult.success();
    }
}