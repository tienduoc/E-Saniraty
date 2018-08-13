package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.ProductImage;

import java.util.List;

public interface ProductImageDAO {

  List<ProductImage> findAll();

  List<ProductImage> findByProduct(String id);

  ProductImage find(int id);

  ProductImage findByUrl(String url);

  List<ProductImage> search(String keyword);

  void add(ProductImage productImage);

  void delete(ProductImage productImage);

  void update(ProductImage productImage);
}
