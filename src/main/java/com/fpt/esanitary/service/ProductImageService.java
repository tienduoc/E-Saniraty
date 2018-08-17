package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.ProductImage;

import java.util.List;

public interface ProductImageService {

  List<ProductImage> findAll();

  List<ProductImage> findByProduct(String id);

  ProductImage find(int id);

  ProductImage findByUrl(String url);

  List<ProductImage> search(String keyword);

  void add(ProductImage productImage);

  void delete(String url);

  void update(ProductImage productImage);
}
