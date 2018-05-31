package com.sust.controller;

import com.sust.domain.Product;
import com.sust.validator.ProductValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sound.midi.Soundbank;
import javax.validation.Valid;


@Controller

public class ProductController {

	
	@RequestMapping(value="/add-product")
	public String inputProduct(Model model) {
		model.addAttribute("product", new Product());
		return "ProductForm";
	}

	@RequestMapping(value="/save-product")
	public String saveProduct(@Valid @ModelAttribute Product product, BindingResult bindingResult,
							  Model model) {
        ProductValidator productValidator = new ProductValidator();
        productValidator.validate(product, bindingResult);

        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
			System.out.println(("Code:" + fieldError.getCode() + ", field:"
                    + fieldError.getField()));
            return "ProductForm";
        }
		
		// save product here
		
	    model.addAttribute("product", product);
		return "ProductDetails";
	}
	
}
