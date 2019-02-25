<%@ Language=VBScript %>
<%
	Set XmlDoc = Server.CreateObject("Microsoft.xmlDom")
	
	XmlDoc.load server.MapPath("test.xml")
	
	Set root     = XmlDoc.documentElement '최상위 엘리먼트

	Set SelectList = root.childNodes.item(0)'최상의엘리먼트의 자식노드의 첫번째 엘리먼트
	
	'root.childNodes.item(0).lastChild

	Set copyNode = SelectList.lastChild.cloneNode(true) '하위 엘리먼트까지 복사

	copyNode.setAttribute "value" , root.childNodes.item(0).lastChild.attributes.getNamedItem("value").nodeValue+1 '속성 추가
	copyNode.text = "이춘삼" '텍스트 추가

	SelectList.appendChild(copyNode) '위의 카피된 노드에 적용된 엘리먼트를 추가
	XmlDoc.save server.MapPath("test.xml")'저장
%>