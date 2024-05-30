package com.example.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
	private Long cno;
	private int quantity; //장바구니 수량 
	private Long pno;
	private String pname;
	private int price;

}
