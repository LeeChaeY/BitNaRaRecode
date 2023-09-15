<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
		
		//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
		 $(function() {
			$( "td.ct_btn01:contains('Ȯ��')" ).on("click" , function() {
				self.location = "/product/listProduct?menu=manage";
			});
			
			$( "td.ct_btn01:contains('����')" ).on("click" , function() {
				if (${user == null}) {
					alert('�α����� ���ּ���.');
					self.location = "/user/login";
				} else {
					self.location = "/purchase/addPurchase?prodNo=${ product.prodNo }";
				}
			});
			 
			$( "td.ct_btn01:contains('����')" ).on("click" , function() {
				history.go(-1);
			});
		});
		
</script>

<title>��ǰ����ȸ</title>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${ product.prodNo }</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.prodName }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�̹��� <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table>
			<tr>
			<c:forEach var="image" items="${ product.imgList }">
				<td>
					<img width="300px" height="300px" src="/images/uploadFiles/${image.fileName}">
					<input type="hidden" name="imgId" value="${ image.imgId }">
				</td>
			</c:forEach>
			</tr>
			</table>
			
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.prodDetail }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.manuDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.price }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.regDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">

		<table border="0" cellspacing="0" cellpadding="0">
			<tr>			
					<c:choose>
						<c:when test="${ !empty menu && menu.equals('manage') }">
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
							</td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
								<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
								<a href="/product/listProduct?menu=manage">Ȯ��</a>
								////////////////////////////////////////////////////////////////////////////////////////////////// -->
								Ȯ��
							</td>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23">
							</td>
						</c:when>
						<c:when test="${empty user || !empty user && user.role.equals('user') && empty product.proTranCode}">
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
							</td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
								<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
								<a href="/purchase/addPurchase?prodNo=${ product.prodNo }">����</a>  <a href="/user/login" onClick="alert('�α����� ���ּ���.');">����</a>
								////////////////////////////////////////////////////////////////////////////////////////////////// -->
								����
							</td>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23">
							</td>
						</c:when>
					</c:choose>
				
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
					<a href="javascript:history.go(-1)">����</a>  
					////////////////////////////////////////////////////////////////////////////////////////////////// -->
					����
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<h3>
				<c:choose>
					<c:when test="${ empty product.proTranCode }">
						�ش� ��ǰ�� �Ǹ����Դϴ�.
					</c:when>
					<c:when test="${ !empty user && user.role.equals('admin') && menu.equals('manage') && !empty product.proTranCode }">
						�ش� ��ǰ�� �Ǹ� �Ϸ�Ǿ����ϴ�. ������ �Ұ����մϴ�.
					</c:when>
					<c:when test="${ !empty user && user.role.equals('admin') && !empty product.proTranCode && product.proTranCode.equals('2') }">
						�ش� ��ǰ�� �Ǹ� �Ϸ�Ǿ����ϴ�.
					</c:when>
					<c:when test="${!empty user && user.role.equals('admin') && !empty product.proTranCode && product.proTranCode.equals('3') }">
						�ش� ��ǰ�� ������Դϴ�.
					</c:when>
					<c:when test="${ !empty user && user.role.equals('admin') && !empty product.proTranCode && product.proTranCode.equals('4') }">
						�ش� ��ǰ�� ��� �Ϸ�Ǿ����ϴ�.
					</c:when>
					<c:when test="${ !empty product.proTranCode }">
						�ش� ��ǰ�� ǰ���Ǿ����ϴ�.
					</c:when>
				</c:choose>
			</h3>
		</td>
	</tr>
</table>
</form>

</body>
</html>