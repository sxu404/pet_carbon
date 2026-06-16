package cn.kmbeast.service;

import cn.kmbeast.pojo.dto.query.extend.AdoptionQueryDto;
import cn.kmbeast.pojo.entity.Adoption;

import java.util.List;

public interface AdoptionService {

    void insert(Adoption adoption);

    void update(Adoption adoption);

    void batchDelete(List<Integer> ids);

    Adoption getById(Integer id);

    List<Adoption> query(AdoptionQueryDto queryDto);

    Integer queryCount(AdoptionQueryDto queryDto);

    List<Adoption> queryByUserId(Integer userId);

    List<Adoption> queryAvailableAnimals();

    List<Adoption> queryAdoptedAnimals();

    boolean checkUserApplied(Integer animalId, Integer userId);
}