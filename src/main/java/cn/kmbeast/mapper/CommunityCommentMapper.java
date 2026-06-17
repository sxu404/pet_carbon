package cn.kmbeast.mapper;

import cn.kmbeast.pojo.entity.CommunityComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommunityCommentMapper {

    void insert(CommunityComment comment);

    void deleteById(Long id);

    void deleteByPostId(Long postId);

    CommunityComment getById(Long id);

    List<CommunityComment> queryByPostId(Long postId);

    Integer queryCountByPostId(Long postId);
}