package com.example.shop.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.shop.dto.OrderProductDto;
import com.example.shop.entity.OrderProduct;

@Repository
public interface OrderProductRepository extends JpaRepository<OrderProduct, Long>{
	
	@Query(value = "SELECT op.ono, op.orderquantity, p.pno, p.pname, p.price FROM order_product op JOIN product p ON op.pno = p.pno WHERE p.username = :username", nativeQuery = true)
    List<Object[]> findAllWithCartAsArray(@Param("username") String username);

    default List<OrderProductDto> findOrderByUsername(String username) {
        List<Object[]> results = findAllWithCartAsArray(username);
        List<OrderProductDto> dtos = new ArrayList<>();
        for (Object[] result : results) {
        	OrderProductDto dto = new OrderProductDto();
            dto.setOno((Long) result[0]);
            dto.setOrderquantity((Integer)result[1]);
            dto.setPno((Long) result[2]);
            dto.setPname((String) result[3]);
            dto.setPrice((Integer)result[4]);
            dtos.add(dto);
        }
        return dtos;
    }
}
