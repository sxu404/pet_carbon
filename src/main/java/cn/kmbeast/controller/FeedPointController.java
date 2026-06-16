package cn.kmbeast.controller;

import cn.kmbeast.pojo.api.ApiResult;
import cn.kmbeast.pojo.api.Result;
import cn.kmbeast.pojo.dto.query.extend.FeedPointQueryDto;
import cn.kmbeast.pojo.entity.FeedPoint;
import cn.kmbeast.service.FeedPointService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/feedPoint")
public class FeedPointController {

    @Resource
    private FeedPointService feedPointService;

    @PostMapping
    public Result<String> add(@RequestBody FeedPoint feedPoint) {
        if (feedPoint.getFeedStatus() == null) {
            feedPoint.setFeedStatus("正常");
        }
        feedPointService.insert(feedPoint);
        return ApiResult.success();
    }

    @PutMapping
    public Result<String> update(@RequestBody FeedPoint feedPoint) {
        feedPointService.update(feedPoint);
        return ApiResult.success();
    }

    @DeleteMapping
    public Result<String> delete(@RequestBody List<Integer> ids) {
        feedPointService.batchDelete(ids);
        return ApiResult.success();
    }

    @GetMapping("/{feedId}")
    public Result<FeedPoint> getById(@PathVariable Integer feedId) {
        FeedPoint feedPoint = feedPointService.getById(feedId);
        return ApiResult.success(feedPoint);
    }

    @PostMapping("/query")
    public Result<List<FeedPoint>> query(@RequestBody FeedPointQueryDto queryDto) {
        List<FeedPoint> list = feedPointService.query(queryDto);
        Integer total = feedPointService.queryCount(queryDto);
        return ApiResult.success(list, total);
    }
}
