import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

public class PublicTest {
	public static void main(String[] args) {
		try {
//			DOM(HTML 객체) Document 객체 생성
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
//			xml 파일을 파싱(해석)하는 객체
			DocumentBuilder parser = dbf.newDocumentBuilder();

//			Document : org.w3c.dom
//			Document 객체 : xml문서를 담는 객체
			Document xmlDoc = null;
			String url = "xml\\book.xml";
//			xml 파일을 파싱(Document 객체로 받음)
			xmlDoc = parser.parse(url);

//			Element : org.w3c.dom
//			root : booklist => <booklist> 루트 엘리먼트에 접근
			Element root = xmlDoc.getDocumentElement();

//			<book> : 하위 엘리먼트 접근
//			item : 여러개의 book 중에서 인덱스 번호에 해당하는 book에 접근
			Node bookNode = root.getElementsByTagName("book").item(0);
//			<author> : 하위 엘리먼트 접근
			Node authorNode = ((Element) bookNode).getElementsByTagName("author").item(0);
//			홍길동 값
			String author = authorNode.getTextContent();
//			@# author => 홍길동
			System.out.println("@# author => " + author);

//			book 태그의 전체 갯수(2)
			int length = root.getElementsByTagName("book").getLength();
			for (int i = 0; i < length; i++) {
//				책 반복
				Node bNode = root.getElementsByTagName("book").item(i);

//				getAttribute : 속성값을 가져올 수 있음
				String kind = ((Element) bNode).getAttribute("kind");
//				@# kind =>react
//				@# kind =>vue
				System.out.println("@# kind =>" + kind);

				Node tNode = ((Element) bNode).getElementsByTagName("title").item(i);
				Node aNode = ((Element) bNode).getElementsByTagName("author").item(i);
				Node pNode = ((Element) bNode).getElementsByTagName("price").item(i);
				System.out.println("@# tNode =>" + tNode);
				System.out.println("@# aNode =>" + aNode);
				System.out.println("@# pNode =>" + pNode);
			}

			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
