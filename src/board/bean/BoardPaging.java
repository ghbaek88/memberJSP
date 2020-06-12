package board.bean;

import lombok.Data;

@Data
public class BoardPaging {
	private int currentPage; // 현재페이지
	private int pageBlock; // [이전][1][2][3][다음]
	private int pageSize; // 1페이지의 총글수
	private int totalA; // 총글수
   private StringBuffer pagingHTML;
   
   public void makePagingHTML() {
      pagingHTML = new StringBuffer();
      int totalP = (totalA+pageSize-1)/pageSize;// 총페이지수
      int startPage = (currentPage -1)/pageBlock*pageBlock+1;
      int endPage = startPage+pageBlock-1;
      if(endPage > totalP) endPage = totalP; // endpage=9 이고 totalP=8일때 처리하기위한 공식
      
      if(startPage > pageBlock) {
         pagingHTML.append("[<a id='paging' href='boardList.jsp?pg="+(startPage-1)+"'>이전]</a>");
      }
      
      for(int i = startPage; i <= endPage; i++) {
         if(i == currentPage) {
            pagingHTML.append("[<a id='currentpaging' href='boardList.jsp?pg="+i+"'>"+i+"</a>]");
         }else {
            pagingHTML.append("[<a id='paging' href='boardList.jsp?pg="+i+"'>"+i+"</a>]");
         }
      }
      
      if(endPage < totalP) {
         pagingHTML.append("[<a id='paging' href='boardList.jsp?pg="+(endPage+1)+"'>다음</a>]");
      }
   }
}