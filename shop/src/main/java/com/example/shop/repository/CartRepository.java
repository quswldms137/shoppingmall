package com.example.shop.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.shop.dto.CartDto;
import com.example.shop.entity.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long>{
	
	//List<CartDto> findAllWithCart();
	@Query(value = "SELECT c.cno, c.quantity, p.pno, p.pname, p.price FROM cart c JOIN product p ON c.pno = p.pno", nativeQuery = true)
    List<Object[]> findAllWithCartAsArray();

    default List<CartDto> findAllWithCart() {
        List<Object[]> results = findAllWithCartAsArray();
        List<CartDto> dtos = new ArrayList<>();
        for (Object[] result : results) {
        	CartDto dto = new CartDto();
            dto.setCno((Long) result[0]);
            dto.setQuantity((Integer)result[1]);
            dto.setPno((Long) result[2]);
            dto.setPname((String) result[3]);
            dto.setPrice((Integer)result[4]);
            dtos.add(dto);
        }
        return dtos;
    }
}
