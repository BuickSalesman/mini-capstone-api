require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/images.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Image.count, data.length
  end

  test "show" do
    get "/images/#{Image.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "url", "product_id", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "Image.count", 1 do
      post "/images.json", params: { url: "test", product_id: Product.first.id }
      assert_response 200
    end

    assert_difference "Image.count", 0 do
      post "/images.json", params: {}
      assert_response 422
    end
  end

  test "update" do
    product = Image.first
    patch "/images/#{product.id}.json", params: { url: "Updated url" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated url", data["url"]
    assert_equal product.product_id, data["product_id"]

    patch "/images/#{product.id}.json", params: { url: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Image.count", -1 do
      delete "/images/#{Image.first.id}.json"
      assert_response 200
    end
  end
end
