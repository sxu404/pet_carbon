package cn.kmbeast.service.impl;

import cn.kmbeast.mapper.FeedRecordMapper;
import cn.kmbeast.pojo.dto.query.extend.FeedRecordQueryDto;
import cn.kmbeast.pojo.entity.FeedRecord;
import cn.kmbeast.service.FeedRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class FeedRecordServiceImpl implements FeedRecordService {

    @Resource
    private FeedRecordMapper feedRecordMapper;

    @Override
    public void insert(FeedRecord feedRecord) {
        if (feedRecord.getCreateTime() == null) {
            feedRecord.setCreateTime(LocalDateTime.now());
        }
        feedRecordMapper.insert(feedRecord);
    }

    @Override
    public void update(FeedRecord feedRecord) {
        feedRecordMapper.update(feedRecord);
    }

    @Override
    public void batchDelete(List<Integer> ids) {
        feedRecordMapper.batchDelete(ids);
    }

    @Override
    public FeedRecord getById(Integer id) {
        return feedRecordMapper.getById(id);
    }

    @Override
    public List<FeedRecord> query(FeedRecordQueryDto queryDto) {
        return feedRecordMapper.query(queryDto);
    }

    @Override
    public Integer queryCount(FeedRecordQueryDto queryDto) {
        return feedRecordMapper.queryCount(queryDto);
    }

    @Override
    public List<FeedRecord> queryByUserId(Integer userId) {
        return feedRecordMapper.queryByUserId(userId);
    }
}