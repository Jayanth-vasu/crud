package com.niit.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.niit.shopping.model.ProductDetails;


public interface ProductService {
	public void addProduct(ProductDetails productDetails);
	public void updateProduct(ProductDetails productDetails);
	public List<ProductDetails> listProducts();
	public ProductDetails getProductById(int product_id);
	public void removeProduct(int product_id);
}
