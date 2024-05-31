package com.example.shop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderProductDto {
	private Long ono;
	private int orderquantity;
	private Long pno;
	private String pname;
	private int price;
}
