package com.example.shop.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;
import lombok.ToString;

@Entity
@Data
public class OrderProduct {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ono; //주문번호
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "pno")
	@ToString.Exclude
	private Product pno; //상품 번호
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "username")
	@ToString.Exclude
	private Member username; //회원 아이디
	
	private int orderquantity; //주문 수량 
}
