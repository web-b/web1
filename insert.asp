<%@ Language=VBScript %>
<%
	Set XmlDoc = Server.CreateObject("Microsoft.xmlDom")
	
	XmlDoc.load server.MapPath("test.xml")
	
	Set root     = XmlDoc.documentElement '�ֻ��� ������Ʈ

	Set SelectList = root.childNodes.item(0)'�ֻ��ǿ�����Ʈ�� �ڽĳ���� ù��° ������Ʈ
	
	'root.childNodes.item(0).lastChild

	Set copyNode = SelectList.lastChild.cloneNode(true) '���� ������Ʈ���� ����

	copyNode.setAttribute "value" , root.childNodes.item(0).lastChild.attributes.getNamedItem("value").nodeValue+1 '�Ӽ� �߰�
	copyNode.text = "�����" '�ؽ�Ʈ �߰�

	SelectList.appendChild(copyNode) '���� ī�ǵ� ��忡 ����� ������Ʈ�� �߰�
	XmlDoc.save server.MapPath("test.xml")'����
%>