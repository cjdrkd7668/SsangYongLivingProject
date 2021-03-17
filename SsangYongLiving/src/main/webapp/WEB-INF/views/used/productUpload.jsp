<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="content" id="content">
        <h3 style="text-align: center;">물건 올리기</h3>
        <hr>
        <form method="POST" action="/living/used/productUploadok.action" enctype="multipart/form-data">


            <table class="table table-bordered">
                <tr>
                    <th style="width: 50px; text-align: center;">카테고리</th>
                    <td style="width: 300px;" >
                        <div class="form-group">
                            <label for="sel1"></label>
                            <select class="form-control" name="categorySeq" id="sel1" style="margin: -24px 2px; width: 150px; height: 30px; padding:0;" required>
                                <option>선택하세요.</option>
                                <option value="1">패션의류</option>
                                <option value="2">패션잡화</option>
                                <option value="3">뷰티</option>
                                <option value="4">출산/유아동</option>
                                <option value="5">모바일/태블릿</option>
                                <option value="6">가전제품</option>
                                <option value="7">노트북/데스크탑</option>
                                <option value="8">카메라/캠코더</option>
                                <option value="9">가구/인테리어</option>
                                <option value="10">리빙/생활</option>
                                <option value="11">게임</option>
                                <option value="12">반려동물/취미</option>
                                <option value="13">도서/음반/문구</option>
                                <option value="14">티켓/쿠폰</option>
                                <option value="15">스포츠</option>
                                <option value="16">레저/여행</option>
                                <option value="17">오토바이</option>
                                <option value="18">공구/산업용품</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 50px; text-align: center;">제목</th>
                    <td><input type="text" name="subject" class="form-control" style="width: 100%; height: 30px; padding:0;"></td>
                </tr>
                <tr>
                    <th style="width: 50px; text-align: center;">제품</th>
                    <td><input type="text" name="name" class="form-control" style="width: 100%; height: 30px; padding:0;"></td>
                </tr>
                <tr>
                    <th style="width: 50px; text-align: center;">가격</th>
                    <td><input type="text" name="price" class="form-control" style="width: 100px; height: 30px; padding:0; display: inline;"><span>&nbsp;원</span></td>
                </tr>
                
               
                
                <tr>
                    <th style="width: 50px; text-align: center;">제품 상태</th>
                    <td style="width: 300px;">
                        <div class="form-group">
                        <label for="sel2"></label>
                        <select class="form-control" id="sel2" style="margin: -24px 2px; width: 150px; height: 30px; padding:0;" name="productStatus" required>
                            <option>선택하세요.</option>
                            <option value="거의 새 것">거의 새것</option>
                            <option value="미 개봉">미개봉</option>
                            <option value="중고">중고</option>
                        </select>
                    </div>
                </td>
            </tr>
            
            <tr>
                <th style="width: 50px; text-align: center;">거래 방법</th>
                <td style="width: 300px;">
                    <div class="form-group">
                    <label for="sel2"></label>
                    <select class="form-control" id="sel2" style="margin: -24px 2px; width: 150px; height: 30px; padding:0;" name="trade" required>
                        <option>선택하세요.</option>
                        <option value="직거래">직거래</option>
                        <option value="택배">택배</option>
                        <option value="직거래/택배">직거래/택배</option>
                    </select>
                </div>
            </td>
            </tr>
            <tr>
                <th style="width: 50px; text-align: center;">상세설명</th>
                
                <td>
                    <textarea class="form-control" rows="5" style="resize: none; font-size: 1em;" name="content" required></textarea>
                </td>
            </tr>
            <tr>
                <th style="width: 50px; text-align: center;">사진</th>
                 <td>
                    <input type="file" class="form-control" name="uploadFile" required>
                   <!--  <input type="file" class="form-control" name="url2" required> -->
                </td> 
            </tr>

            
        </table>

        <div class="btns btn-group" style="position: relative; left: 41%;">

            <button type="submit" class="btn btn-info" style="background-color: #486BB8;">
                <span class="glyphicon glyphicon-ok"></span> 등록하기
            </button>
            <button type="button" class="btn btn-default" onclick="location.href='/living/used/main.action'">
                <span class="glyphicon glyphicon-remove"></span> 취소하기
            </button>
            
        </div>
        <input type="hidden" name="seq" value="seq" value="${seq}"> 
    </form>
        
        
        
        


        

  



 </div> <!-- content 끝-->