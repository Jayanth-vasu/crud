package com.niit.shopping.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.shopping.model.ProductDetails;

@Repository
@Transactional
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SessionFactory session;
	
	@Override
	public void addProduct(ProductDetails productDetails) {
		 session.getCurrentSession().save(productDetails);

	}

	@Override
	public void updateProduct(ProductDetails productDetails) {
		 session.getCurrentSession().update(productDetails);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductDetails> listProducts() {
		 
		return(List<ProductDetails>)
		session.getCurrentSession().createCriteria(ProductDetails.class).list();
	
	}

	@Override
	public ProductDetails getProductById(int product_id) {
		
		return (ProductDetails)session.getCurrentSession().get(ProductDetails.class, product_id);
	}

	@Override
	public void removeProduct(int product_id) {
		session.getCurrentSession().delete(getProductById(product_id));
		

	}

}
