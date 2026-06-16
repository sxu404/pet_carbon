package cn.kmbeast.controller;

import cn.kmbeast.context.LocalThreadHolder;
import cn.kmbeast.pojo.api.ApiResult;
import cn.kmbeast.pojo.api.Result;
import cn.kmbeast.pojo.dto.query.extend.FeedRecordQueryDto;
import cn.kmbeast.pojo.entity.FeedRecord;
import cn.kmbeast.service.FeedRecordService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/feedRecord")
public class FeedRecordController {

    @Resource
    private FeedRecordService feedRecordService;

    @PostMapping
    public Result<String> add(@RequestBody FeedRecord feedRecord) {
        feedRecordService.insert(feedRecord);
        return ApiResult.success();
    }

    @PutMapping
    public Result<String> update(@RequestBody FeedRecord feedRecord) {
        feedRecordService.update(feedRecord);
        return ApiResult.success();
    }

    @DeleteMapping
    public Result<String> delete(@RequestBody List<Integer> ids) {
        feedRecordService.batchDelete(ids);
        return ApiResult.success();
    }

    @GetMapping("/{id}")
    public Result<FeedRecord> getById(@PathVariable Integer id) {
        FeedRecord feedRecord = feedRecordService.getById(id);
        return ApiResult.success(feedRecord);
    }

    @PostMapping("/query")
    public Result<List<FeedRecord>> query(@RequestBody FeedRecordQueryDto queryDto) {
        List<FeedRecord> list = feedRecordService.query(queryDto);
        Integer total = feedRecordService.queryCount(queryDto);
        return ApiResult.success(list, total);
    }

    @GetMapping("/my")
    public Result<List<FeedRecord>> getMyFeedRecords() {
        Integer userId = LocalThreadHolder.getUserId();
        if (userId == null) {
            return ApiResult.error("用户未登录");
        }
        List<FeedRecord> list = feedRecordService.queryByUserId(userId);
        return ApiResult.success(list);
    }

    @PostMapping("/my")
    public Result<List<FeedRecord>> getMyFeedRecordsPost() {
        Integer userId = LocalThreadHolder.getUserId();
        if (userId == null) {
            return ApiResult.error("用户未登录");
        }
        List<FeedRecord> list = feedRecordService.queryByUserId(userId);
        return ApiResult.success(list);
    }
}