package cn.kmbeast.service.impl;

import cn.kmbeast.mapper.CommunityCommentMapper;
import cn.kmbeast.pojo.entity.CommunityComment;
import cn.kmbeast.service.CommunityCommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CommunityCommentServiceImpl implements CommunityCommentService {

    @Resource
    private CommunityCommentMapper communityCommentMapper;

    @Override
    public void insert(CommunityComment comment) {
        if (comment.getLikeCount() == null) {
            comment.setLikeCount(0);
        }
        communityCommentMapper.insert(comment);
    }

    @Override
    public void deleteById(Long id) {
        communityCommentMapper.deleteById(id);
    }

    @Override
    public void deleteByPostId(Long postId) {
        communityCommentMapper.deleteByPostId(postId);
    }

    @Override
    public CommunityComment getById(Long id) {
        return communityCommentMapper.getById(id);
    }

    @Override
    public List<CommunityComment> queryByPostId(Long postId) {
        return communityCommentMapper.queryByPostId(postId);
    }

    @Override
    public Integer queryCountByPostId(Long postId) {
        return communityCommentMapper.queryCountByPostId(postId);
    }
}