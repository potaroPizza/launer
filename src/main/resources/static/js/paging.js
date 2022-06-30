/**
 * paging.js
 * page 처리 관련 함수
 */
let currentPage = 1;	//현재 페이지
let recordCountPerPage;  //한 페이지에 보여줄 레코드 개수
let blockSize;
let totalRecord; //전체 레코드 개수

let totalPage;  //총 페이지수
let firstPage;  //블럭당 시작 페이지, 1, 11, 21, 31, ...
let lastPage; //블럭당 마지막 페이지 10, 20, 30, 40, ...
let firstRecordIndex; //페이지당 시작 인덱스 0, 5, 10, 15 ...
let lastRecordIndex;  //페이지당 마지막 인덱스	5,10,15,20....

function pagination(p_currentPage, p_recordCountPerPage,
                    p_blockSize, p_totalRecord) {
    recordCountPerPage = p_recordCountPerPage;
    blockSize = p_blockSize;
    totalRecord = p_totalRecord;
    currentPage = p_currentPage;

    totalPage = Math.floor((totalRecord - 1) / recordCountPerPage) + 1;

    firstPage = p_currentPage - ((p_currentPage - 1) % blockSize);

    lastPage = firstPage + (blockSize - 1);
    if (lastPage > totalPage) {
        lastPage = totalPage;
    }

    firstRecordIndex = (p_currentPage - 1) * recordCountPerPage;
}
