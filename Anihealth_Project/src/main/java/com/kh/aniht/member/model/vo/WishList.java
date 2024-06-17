package com.kh.aniht.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class WishList {

	private int productNo;
	private int userNo;
	
	// 추가
	private String productName;
	private String category;
	private String productThumbnailPath;
	private int price;
	
}
