module ProductsHelper
  def find_product product_id
    Product.find(product_id).product_name
  end
end
