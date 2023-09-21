package com.model2.mvc.service.purchase.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.purchase.dao.PurchaseDao;
import com.model2.mvc.service.domain.Cart;
import com.model2.mvc.service.domain.Purchase;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(":: "+getClass()+".setSqlSession() Call.....");
		this.sqlSession = sqlSession;
	}

	public PurchaseDaoImpl() {
		System.out.println(":: "+getClass()+" default Constructor Call.....");
	}

	public int addPurchase(Purchase purchase) throws Exception {
		return sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}
	
	public int getSeq_transaction_tran_no() throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getSeq_transaction_tran_no");
	}

	public Purchase getPurchase(int tranNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}
	
	@Override
	public int updatePurchase(Purchase purchase) throws Exception {
		return sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}
	
	@Override
	public int removePurchase(int tranNo) throws Exception {
		return sqlSession.delete("PurchaseMapper.removePurchase", tranNo);
	}

	public List<Purchase> getPurchaseList(Map map) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
	}

	public int updateTranCode(Purchase purchase) throws Exception{
		return sqlSession.update("PurchaseMapper.updateTranCode", purchase);
	}

	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(Map map) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", map);
	}

	@Override
	public int addCart(Cart cart) throws Exception {
		return sqlSession.insert("PurchaseMapper.addCart", cart);
	}

	@Override
	public int getSeq_cart_cart_id() throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getSeq_cart_cart_id");
	}

	@Override
	public List<Cart> getCartList(Map map) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getCartList", map);
	}

	@Override
	public int updateCartAmount(Cart cart) throws Exception {
		return sqlSession.update("PurchaseMapper.updateCartAmount", cart);
	}

	@Override
	public int updateCartCheckActive(int cartId) throws Exception {
		return sqlSession.update("PurchaseMapper.updateCartCheckActive", cartId);
	}

	@Override
	public int getCartTotalCount(String userId) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getCartTotalCount", userId);
	}
	
}
