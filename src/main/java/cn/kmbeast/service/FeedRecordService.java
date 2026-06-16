package cn.kmbeast.service;

import cn.kmbeast.pojo.dto.query.extend.FeedRecordQueryDto;
import cn.kmbeast.pojo.entity.FeedRecord;

import java.util.List;

public interface FeedRecordService {

    void insert(FeedRecord feedRecord);

    void update(FeedRecord feedRecord);

    void batchDelete(List<Integer> ids);

    FeedRecord getById(Integer id);

    List<FeedRecord> query(FeedRecordQueryDto queryDto);

    Integer queryCount(FeedRecordQueryDto queryDto);

    List<FeedRecord> queryByUserId(Integer userId);
}