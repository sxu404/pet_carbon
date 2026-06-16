package cn.kmbeast.mapper;

import cn.kmbeast.pojo.dto.query.extend.AdoptionQueryDto;
import cn.kmbeast.pojo.entity.Adoption;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdoptionMapper {

    void insert(Adoption adoption);

    void update(Adoption adoption);

    void batchDelete(@Param("ids") List<Integer> ids);

    Adoption getById(Integer id);

    List<Adoption> query(@Param("queryDto") AdoptionQueryDto queryDto);

    Integer queryCount(@Param("queryDto") AdoptionQueryDto queryDto);

    List<Adoption> queryByUserId(@Param("userId") Integer userId);

    List<Adoption> queryAvailableAnimals();

    List<Adoption> queryAdoptedAnimals();

    Adoption queryByAnimalIdAndUserId(@Param("animalId") Integer animalId, @Param("userId") Integer userId);
}