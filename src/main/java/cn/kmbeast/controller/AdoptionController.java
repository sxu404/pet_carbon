package cn.kmbeast.controller;

import cn.kmbeast.context.LocalThreadHolder;
import cn.kmbeast.pojo.api.ApiResult;
import cn.kmbeast.pojo.api.Result;
import cn.kmbeast.pojo.dto.query.extend.AdoptionQueryDto;
import cn.kmbeast.pojo.entity.Adoption;
import cn.kmbeast.service.AdoptionService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/adoption")
public class AdoptionController {

    @Resource
    private AdoptionService adoptionService;

    @PostMapping
    public Result<String> apply(@RequestBody Adoption adoption) {
        Integer userId = LocalThreadHolder.getUserId();
        if (userId == null) {
            return ApiResult.error("用户未登录");
        }
        // 检查是否已申请
        if (adoptionService.checkUserApplied(adoption.getAnimalId(), userId)) {
            return ApiResult.error("您已申请过该动物的领养");
        }
        adoption.setUserId(userId);
        adoptionService.insert(adoption);
        return ApiResult.success();
    }

    @PutMapping
    public Result<String> update(@RequestBody Adoption adoption) {
        adoptionService.update(adoption);
        return ApiResult.success();
    }

    @DeleteMapping
    public Result<String> delete(@RequestBody List<Integer> ids) {
        adoptionService.batchDelete(ids);
        return ApiResult.success();
    }

    @GetMapping("/{id}")
    public Result<Adoption> getById(@PathVariable Integer id) {
        Adoption adoption = adoptionService.getById(id);
        return ApiResult.success(adoption);
    }

    @PostMapping("/query")
    public Result<List<Adoption>> query(@RequestBody AdoptionQueryDto queryDto) {
        List<Adoption> list = adoptionService.query(queryDto);
        Integer total = adoptionService.queryCount(queryDto);
        return ApiResult.success(list, total);
    }

    @PostMapping("/available")
    public Result<List<Adoption>> getAvailableAnimals() {
        List<Adoption> list = adoptionService.queryAvailableAnimals();
        return ApiResult.success(list);
    }

    @GetMapping("/adopted")
    public Result<List<Adoption>> getAdoptedAnimals() {
        List<Adoption> list = adoptionService.queryAdoptedAnimals();
        return ApiResult.success(list);
    }

    @PostMapping("/adopted")
    public Result<List<Adoption>> getAdoptedAnimalsPost() {
        List<Adoption> list = adoptionService.queryAdoptedAnimals();
        return ApiResult.success(list);
    }

    @GetMapping("/my")
    public Result<List<Adoption>> getMyAdoptions() {
        Integer userId = LocalThreadHolder.getUserId();
        if (userId == null) {
            return ApiResult.error("用户未登录");
        }
        List<Adoption> list = adoptionService.queryByUserId(userId);
        return ApiResult.success(list);
    }

    @PostMapping("/my")
    public Result<List<Adoption>> getMyAdoptionsPost() {
        Integer userId = LocalThreadHolder.getUserId();
        if (userId == null) {
            return ApiResult.error("用户未登录");
        }
        List<Adoption> list = adoptionService.queryByUserId(userId);
        return ApiResult.success(list);
    }

    @PutMapping("/approve/{id}")
    public Result<String> approve(@PathVariable Integer id) {
        Adoption adoption = adoptionService.getById(id);
        if (adoption == null) {
            return ApiResult.error("申请不存在");
        }
        adoption.setStatus("approved");
        Integer reviewerId = LocalThreadHolder.getUserId();
        adoption.setReviewerId(reviewerId);
        adoptionService.update(adoption);
        return ApiResult.success();
    }

    @PutMapping("/reject/{id}")
    public Result<String> reject(@PathVariable Integer id, @RequestBody Adoption adoptionRequest) {
        Adoption adoption = adoptionService.getById(id);
        if (adoption == null) {
            return ApiResult.error("申请不存在");
        }
        adoption.setStatus("rejected");
        adoption.setRejectReason(adoptionRequest.getRejectReason());
        Integer reviewerId = LocalThreadHolder.getUserId();
        adoption.setReviewerId(reviewerId);
        adoptionService.update(adoption);
        return ApiResult.success();
    }
}