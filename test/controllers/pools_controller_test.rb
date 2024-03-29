require 'test_helper'

class PoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pool = pools(:one)
  end

  test "should get index" do
    get pools_url
    assert_response :success
  end

  test "should get new" do
    get new_pool_url
    assert_response :success
  end

  test "should create pool" do
    assert_difference('Pool.count') do
      post pools_url, params: { pool: { admin_id: @pool.admin_id, baby_id: @pool.baby_id, birth_date: @pool.birth_date, birth_time: @pool.birth_time, email: @pool.email, gender: @pool.gender, length: @pool.length, name: @pool.name, weight: @pool.weight } }
    end

    assert_redirected_to pool_url(Pool.last)
  end

  test "should show pool" do
    get pool_url(@pool)
    assert_response :success
  end

  test "should get edit" do
    get edit_pool_url(@pool)
    assert_response :success
  end

  test "should update pool" do
    patch pool_url(@pool), params: { pool: { admin_id: @pool.admin_id, baby_id: @pool.baby_id, birth_date: @pool.birth_date, birth_time: @pool.birth_time, email: @pool.email, gender: @pool.gender, length: @pool.length, name: @pool.name, weight: @pool.weight } }
    assert_redirected_to pool_url(@pool)
  end

  test "should destroy pool" do
    assert_difference('Pool.count', -1) do
      delete pool_url(@pool)
    end

    assert_redirected_to pools_url
  end
end
