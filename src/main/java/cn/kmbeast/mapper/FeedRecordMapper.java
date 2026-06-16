package cn.kmbeast.mapper;

import cn.kmbeast.pojo.dto.query.extend.FeedRecordQueryDto;
import cn.kmbeast.pojo.entity.FeedRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FeedRecordMapper {

    void insert(FeedRecord feedRecord);

    void update(FeedRecord feedRecord);

    void batchDelete(@Param("ids") List<Integer> ids);

    FeedRecord getById(Integer id);

    List<FeedRecord> query(@Param("queryDto") FeedRecordQueryDto queryDto);

    Integer queryCount(@Param("queryDto") FeedRecordQueryDto queryDto);

    List<FeedRecord> queryByUserId(@Param("userId") Integer userId);
}