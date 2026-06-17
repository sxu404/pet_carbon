package cn.kmbeast.service;

import cn.kmbeast.pojo.entity.CommunityComment;

import java.util.List;

public interface CommunityCommentService {

    void insert(CommunityComment comment);

    void deleteById(Long id);

    void deleteByPostId(Long postId);

    CommunityComment getById(Long id);

    List<CommunityComment> queryByPostId(Long postId);

    Integer queryCountByPostId(Long postId);
}