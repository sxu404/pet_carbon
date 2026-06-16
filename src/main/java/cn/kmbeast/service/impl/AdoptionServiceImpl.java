package cn.kmbeast.service.impl;

import cn.kmbeast.mapper.AdoptionMapper;
import cn.kmbeast.pojo.dto.query.extend.AdoptionQueryDto;
import cn.kmbeast.pojo.entity.Adoption;
import cn.kmbeast.service.AdoptionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class AdoptionServiceImpl implements AdoptionService {

    @Resource
    private AdoptionMapper adoptionMapper;

    @Override
    public void insert(Adoption adoption) {
        if (adoption.getCreateTime() == null) {
            adoption.setCreateTime(LocalDateTime.now());
        }
        if (adoption.getStatus() == null) {
            adoption.setStatus("pending");
        }
        adoptionMapper.insert(adoption);
    }

    @Override
    public void update(Adoption adoption) {
        adoption.setUpdateTime(LocalDateTime.now());
        adoptionMapper.update(adoption);
    }

    @Override
    public void batchDelete(List<Integer> ids) {
        adoptionMapper.batchDelete(ids);
    }

    @Override
    public Adoption getById(Integer id) {
        return adoptionMapper.getById(id);
    }

    @Override
    public List<Adoption> query(AdoptionQueryDto queryDto) {
        return adoptionMapper.query(queryDto);
    }

    @Override
    public Integer queryCount(AdoptionQueryDto queryDto) {
        return adoptionMapper.queryCount(queryDto);
    }

    @Override
    public List<Adoption> queryByUserId(Integer userId) {
        return adoptionMapper.queryByUserId(userId);
    }

    @Override
    public List<Adoption> queryAvailableAnimals() {
        return adoptionMapper.queryAvailableAnimals();
    }

    @Override
    public List<Adoption> queryAdoptedAnimals() {
        return adoptionMapper.queryAdoptedAnimals();
    }

    @Override
    public boolean checkUserApplied(Integer animalId, Integer userId) {
        Adoption adoption = adoptionMapper.queryByAnimalIdAndUserId(animalId, userId);
        return adoption != null;
    }
}