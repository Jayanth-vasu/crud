package com.niit.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.shopping.model.ProductDetails;

import com.niit.shopping.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	@ModelAttribute("smartproducts")
	public ProductDetails getproduct() {
		return new ProductDetails();
	}

	@RequestMapping("/product")
	
		public String listPersons(Model model) {
			
			model.addAttribute("listProducts", productService.listProducts());
		return "product";
	}

	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("smartproducts") ProductDetails productDetails) {

		if (productDetails.getProduct_id() == 0) {

			productService.addProduct(productDetails);
		} else {

			productService.updateProduct(productDetails);
		}
		return "redirect:/product";
	}

	@RequestMapping("/remove/{product_id}")
	public String removeProduct(@PathVariable("product_id") int product_id) {

		productService.removeProduct(product_id);
		return "redirect:/product";
	}

	@RequestMapping("/edit/{product_id}")
	public String editProduct(@PathVariable("product_id") int id, Model model) {
		model.addAttribute("productDetails", productService.getProductById(id));
		model.addAttribute("listProducts", productService.listProducts());
		return "product";
	}

}
