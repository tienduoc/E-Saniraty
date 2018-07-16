package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.ProductImageDAO;
import com.fpt.esanitary.entities.ProductImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductImageServiceImpl implements ProductImageService {

  @Autowired
  private ProductImageDAO productImageDAO;

  @Override
  public List<ProductImage> findAll() {
    return productImageDAO.findAll();
  }

  @Override
  public List<ProductImage> findByProduct(String id) {
    return productImageDAO.findByProduct(id);
  }

  @Override
  public ProductImage find(int id) {
    return productImageDAO.find(id);
  }

  @Override
  public ProductImage findByUrl(String url) {
    return productImageDAO.findByUrl(url);
  }

  @Override
  public List<ProductImage> search(String keyword) {
    return productImageDAO.search(keyword);
  }

  @Override
  public void add(ProductImage productImage) {
    productImageDAO.add(productImage);
  }

  @Override
  public void delete(ProductImage productImage) {

  }
}
