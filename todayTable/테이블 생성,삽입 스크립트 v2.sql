-- 테이블 삭제
DROP TABLE "TB_REPORT";
DROP TABLE "TB_INQUIRY";
DROP TABLE "TB_NOTICE";
DROP TABLE "TB_EVENT_COMMENT";
DROP TABLE "TB_EVENT";


-- 시퀀스 삭제
DROP SEQUENCE "EVENT_NO";
DROP SEQUENCE "INQ_NO";
DROP SEQUENCE "NOTICE_NO";
DROP SEQUENCE "REP_NO";
DROP SEQUENCE "EVENT_COM_NO";

-- 시퀀스 생성
CREATE SEQUENCE "REP_NO";
CREATE SEQUENCE "INQ_NO";
CREATE SEQUENCE "NOTICE_NO";
CREATE SEQUENCE "EVENT_NO";
CREATE SEQUENCE "EVENT_COM_NO";

-- TB_REPORT 생성
CREATE TABLE "TB_REPORT" (
	"REP_NO"	NUMBER		NOT NULL,
	"MEM_NO"	NUMBER		NOT NULL,
	"REP_CONTENTS"	VARCHAR2(2000)		NOT NULL,
	"REP_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REP_CLSFC"	VARCHAR2(20)		NOT NULL,
	"REP_PROCESSING"	CHAR(1)	DEFAULT 'N' CHECK(REP_PROCESSING IN('Y','N')) NOT NULL,
	"REP_STATUS"	CHAR(1)	DEFAULT 'Y'	NOT NULL
);

COMMENT ON COLUMN "TB_REPORT"."REP_NO" IS '신고번호';

COMMENT ON COLUMN "TB_REPORT"."MEM_NO" IS '회원번호';

COMMENT ON COLUMN "TB_REPORT"."REP_CONTENTS" IS '내용';

COMMENT ON COLUMN "TB_REPORT"."REP_DATE" IS '작성일';

COMMENT ON COLUMN "TB_REPORT"."REP_CLSFC" IS '분류';

COMMENT ON COLUMN "TB_REPORT"."REP_PROCESSING" IS '처리여부';

COMMENT ON COLUMN "TB_REPORT"."REP_STATUS" IS '상태';

ALTER TABLE "TB_REPORT" ADD CONSTRAINT "PK_TB_REPORT" PRIMARY KEY (
	"REP_NO"
);

ALTER TABLE "TB_REPORT" ADD CONSTRAINT "FK_REPORT_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "TB_MEMBER" (
	"MEM_NO"
)
ON DELETE CASCADE;

-- TB_INQUIRY

CREATE TABLE "TB_INQUIRY" (
	"INQ_NO"	NUMBER		NOT NULL,
	"MEM_NO"	NUMBER		NOT NULL,
	"INQ_NAME"	VARCHAR2(2000)		NOT NULL,
	"INQ_QUESTION"	VARCHAR2(2000)		NOT NULL,
	"INQ_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"INQ_ANSWER"	VARCHAR2(2000)		NULL,
	"INQ_PROCESSING"	CHAR(1)	DEFAULT 'N' CHECK(INQ_PROCESSING IN('Y','N'))	NOT NULL,
	"INQ_PRIVATE"	CHAR(1)	DEFAULT 'Y' CHECK(INQ_PRIVATE IN('Y','N'))	NOT NULL,
	"INQ_STATUS"	CHAR(1)	DEFAULT 'Y'	CHECK(INQ_STATUS IN('Y','N')) NOT NULL
);

COMMENT ON COLUMN "TB_INQUIRY"."INQ_NO" IS '문의번호';

COMMENT ON COLUMN "TB_INQUIRY"."MEM_NO" IS '회원번호';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_NAME" IS '제목';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_QUESTION" IS '질문내용';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_DATE" IS '작성일';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_ANSWER" IS '답변내용';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_PROCESSING" IS '답변여부';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_PRIVATE" IS '공개여부';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_STATUS" IS '상태';

ALTER TABLE "TB_INQUIRY" ADD CONSTRAINT "PK_TB_INQUIRY" PRIMARY KEY (
	"INQ_NO"
);

ALTER TABLE "TB_INQUIRY" ADD CONSTRAINT "FK_INQUIRY_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "TB_MEMBER" (
	"MEM_NO"
)
ON DELETE CASCADE;

-- TB_NOTICE

CREATE TABLE "TB_NOTICE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"NOTICE_NAME"	VARCHAR2(100)		NOT NULL,
	"NOTICE_CONTENTS"	VARCHAR2(2000)		NOT NULL,
	"NOTICE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"NOTICE_CLSFC"	VARCHAR2(20)		NOT NULL,
	"NOTICE_STATUS"	CHAR(1)	DEFAULT 'Y' CHECK(NOTICE_STATUS IN('Y','N'))	NOT NULL
);

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_NO" IS '공지번호';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_NAME" IS '글제목';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_CONTENTS" IS '내용';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_DATE" IS '작성일';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_CLSFC" IS '분류';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_STATUS" IS '상태';

ALTER TABLE "TB_NOTICE" ADD CONSTRAINT "PK_TB_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

-- TB_EVENT 생성

CREATE TABLE "TB_EVENT" (
	"EVENT_NO"	NUMBER		NOT NULL,
	"EVENT_NAME"	VARCHAR2(100)		NOT NULL,
	"EVENT_CONTENTS"	VARCHAR2(2000)		NOT NULL,
	"EVENT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"EVENT_PROCESSING"	CHAR(1)	DEFAULT 'Y' CHECK(EVENT_PROCESSING IN('Y','N'))	NOT NULL,
	"EVENT_STATUS"	CHAR(1)	DEFAULT 'Y' CHECK(EVENT_STATUS IN('Y','N'))	NOT NULL
);

COMMENT ON COLUMN "TB_EVENT"."EVENT_NO" IS '이벤트번호';

COMMENT ON COLUMN "TB_EVENT"."EVENT_NAME" IS '이벤트 제목';

COMMENT ON COLUMN "TB_EVENT"."EVENT_CONTENTS" IS '이벤트 내용';

COMMENT ON COLUMN "TB_EVENT"."EVENT_DATE" IS '작성일';

COMMENT ON COLUMN "TB_EVENT"."EVENT_PROCESSING" IS '진행여부';

COMMENT ON COLUMN "TB_EVENT"."EVENT_STATUS" IS '상태';

ALTER TABLE "TB_EVENT" ADD CONSTRAINT "PK_TB_EVENT" PRIMARY KEY (
	"EVENT_NO"
);

-- TB_EVENT_COMMENT

CREATE TABLE "TB_EVENT_COMMENT" (
	"EVENT_COM_NO"	NUMBER		NOT NULL,
	"EVENT_NO"	NUMBER		NOT NULL,
	"MEM_NO"	NUMBER		NOT NULL,
	"EVENT_COM_CONTENTS"	VARCHAR2(300)		NOT NULL,
	"EVENT_COM_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"EVENT_COM_STATUS"	CHAR(1)	DEFAULT 'Y' CHECK(EVENT_COM_STATUS IN('Y','N'))	NOT NULL
);

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_NO" IS '이벤트댓글번호';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_NO" IS '이벤트번호';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."MEM_NO" IS '회원번호';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_CONTENTS" IS '이벤트댓글내용';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_DATE" IS '이벤트댓글작성일';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_STATUS" IS '상태';

ALTER TABLE "TB_EVENT_COMMENT" ADD CONSTRAINT "PK_EVENT_COMMENT_1" PRIMARY KEY (
	"EVENT_COM_NO"
);

ALTER TABLE "TB_EVENT_COMMENT" ADD CONSTRAINT "FK_EVENT_COMMENT_2" FOREIGN KEY (
	"EVENT_NO"
)
REFERENCES "TB_EVENT" (
	"EVENT_NO"
)
ON DELETE CASCADE;

ALTER TABLE "TB_EVENT_COMMENT" ADD CONSTRAINT "FK_EVENT_COMMENT_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "TB_MEMBER" (
	"MEM_NO"
)
ON DELETE CASCADE;


-- INSERT문
-- TB_REPORT

INSERT INTO TB_REPORT(
REP_NO,
MEM_NO,
REP_CONTENTS,
REP_DATE,
REP_CLSFC,
REP_PROCESSING,
REP_STATUS
)
VALUES (
REP_NO.NEXTVAL,
1,
'의미없는 게시글 신고합니다 www.todaytable.com/~~~',
SYSDATE,
'게시글신고',
DEFAULT,
DEFAULT
);

INSERT INTO TB_REPORT(
REP_NO,
MEM_NO,
REP_CONTENTS,
REP_DATE,
REP_CLSFC,
REP_PROCESSING,
REP_STATUS
)
VALUES (
REP_NO.NEXTVAL,
1,
'비매너 댓글 신고합니다 www.todaytable.com/~~~',
SYSDATE,
'댓글신고',
'Y',
DEFAULT
);

INSERT INTO TB_REPORT(
REP_NO,
MEM_NO,
REP_CONTENTS,
REP_DATE,
REP_CLSFC,
REP_PROCESSING,
REP_STATUS
)
VALUES (
REP_NO.NEXTVAL,
3,
'욕설 댓글 신고합니다 www.todaytable.com/~~~',
SYSDATE,
'댓글신고',
DEFAULT,
DEFAULT
);

INSERT INTO TB_REPORT(
REP_NO,
MEM_NO,
REP_CONTENTS,
REP_DATE,
REP_CLSFC,
REP_PROCESSING,
REP_STATUS
)
VALUES (
REP_NO.NEXTVAL,
4,
'비매너 게시글 신고합니다 www.todaytable.com/~~~',
SYSDATE,
'게시글신고',
DEFAULT,
DEFAULT
);

INSERT INTO TB_REPORT(
REP_NO,
MEM_NO,
REP_CONTENTS,
REP_DATE,
REP_CLSFC,
REP_PROCESSING,
REP_STATUS
)
VALUES (
REP_NO.NEXTVAL,
1,
'게시글 신고접수 www.todaytable.com/~~~',
SYSDATE,
'게시글신고',
DEFAULT,
DEFAULT
);

-- TB_INQUIRY

INSERT INTO TB_INQUIRY(
INQ_NO,
MEM_NO,
INQ_NAME,
INQ_QUESTION,
INQ_DATE,
INQ_ANSWER,
INQ_PROCESSING,
INQ_PRIVATE,
INQ_STATUS
)
VALUES (
INQ_NO.NEXTVAL,
1,
'레시피 조회 화면이 안나와요',
'원래 잘 됐는데 컴퓨터 바꾸고 나서 레시피 조회가 안되네요 답변부탁드립니다.',
SYSDATE,
'안녕하세요 오늘의 식탁입니다. 문의주신 내용 답변드리겠습니다.
조회가 안된다면 chrome 브라우저를 사용해보세요',
'Y',
DEFAULT,
DEFAULT
);

INSERT INTO TB_INQUIRY(
INQ_NO,
MEM_NO,
INQ_NAME,
INQ_QUESTION,
INQ_DATE,
INQ_ANSWER,
INQ_PROCESSING,
INQ_PRIVATE,
INQ_STATUS
)
VALUES (
INQ_NO.NEXTVAL,
1,
'레시피를 보니까 배고파요',
'레시피를 보니까 배고프네요 ㅡㅡ;;',
SYSDATE,
NULL,
DEFAULT,
'Y',
DEFAULT
);

INSERT INTO TB_INQUIRY(
INQ_NO,
MEM_NO,
INQ_NAME,
INQ_QUESTION,
INQ_DATE,
INQ_ANSWER,
INQ_PROCESSING,
INQ_PRIVATE,
INQ_STATUS
)
VALUES (
INQ_NO.NEXTVAL,
1,
'가지고 있는 레시피를 공유하려합니다.',
'제가 가지고 있는 비밀 레시피를 공유하려고합니다',
SYSDATE,
'안녕하세요 오늘의 식탁입니다.
레시피 작성을 이용해 공유해주세요',
'Y',
'Y',
DEFAULT
);

INSERT INTO TB_INQUIRY(
INQ_NO,
MEM_NO,
INQ_NAME,
INQ_QUESTION,
INQ_DATE,
INQ_ANSWER,
INQ_PROCESSING,
INQ_PRIVATE,
INQ_STATUS
)
VALUES (
INQ_NO.NEXTVAL,
3,
'레시피 등록이 안돼요',
'레시피 등록이 안되네요 ;;;;',
SYSDATE,
'안녕하세요 오늘의 식탁입니다.
다시한번 시도해보세요',
'Y',
DEFAULT,
DEFAULT
);

INSERT INTO TB_INQUIRY(
INQ_NO,
MEM_NO,
INQ_NAME,
INQ_QUESTION,
INQ_DATE,
INQ_ANSWER,
INQ_PROCESSING,
INQ_PRIVATE,
INQ_STATUS
)
VALUES (
INQ_NO.NEXTVAL,
5,
'분류별 레시피에서 404에러가 떠요',
'분류별 레시피에서 에러뜹니다 조치해주세여',
SYSDATE,
'안녕하세요 오늘의 식탁입니다.
현재 잘 됩니다.',
'Y',
DEFAULT,
DEFAULT
);

-- TB_NOTICE

INSERT INTO TB_NOTICE(
NOTICE_NO,
NOTICE_NAME,
NOTICE_CONTENTS,
NOTICE_DATE,
NOTICE_CLSFC,
NOTICE_STATUS)
VALUES (
NOTICE_NO.NEXTVAL,
'2020년 부터 익스플로에서는 동영상이 나오지 않습니다',
'2020년 말부터 공식적으로 Adobe사의 플래시 플레이어 지원이 중단됨에 따라 
플래시 플레이어를 통한 동영상 재생이 불가합니다
동영상이 나오는 브라우저로 업그레이드 하시기 바랍니다',
SYSDATE,
'일반',
DEFAULT
);

INSERT INTO TB_NOTICE(
NOTICE_NO,
NOTICE_NAME,
NOTICE_CONTENTS,
NOTICE_DATE,
NOTICE_CLSFC,
NOTICE_STATUS)
VALUES (
NOTICE_NO.NEXTVAL,
'금일 8월 16일 업데이트가 있습니다',
'금일 서버 업데이트가 있어 서버접속과 기타 기능이 작동하지 않을수가 있습니니다 조속히 마치도록 하겠습니다
금일 작업은 8월 16일 저녁쯤에 끝날예정입니다
혹시 작동이 안되는 기능이 있으면 1:1 문의 게시판에 바로 부탁드립니다',
SYSDATE,
'긴급',
DEFAULT
);

INSERT INTO TB_NOTICE(
NOTICE_NO,
NOTICE_NAME,
NOTICE_CONTENTS,
NOTICE_DATE,
NOTICE_CLSFC,
NOTICE_STATUS)
VALUES (
NOTICE_NO.NEXTVAL,
'서버 긴급 점검안내',
'서버점검으로가 있어 서버접속과 기타 기능이 작동하지 않을수가 있습니니다 조속히 마치도록 하겠습니다
감사합니다.',
SYSDATE,
'긴급',
DEFAULT
);

INSERT INTO TB_NOTICE(
NOTICE_NO,
NOTICE_NAME,
NOTICE_CONTENTS,
NOTICE_DATE,
NOTICE_CLSFC,
NOTICE_STATUS)
VALUES (
NOTICE_NO.NEXTVAL,
'댓글 순서가 변경 되었습니다',
'기존의 댓글로 질문하시면 마지막 질문이 가장 끝으로 가서 보기가 불편하다는 의견이 있어
가장 최신 댓글 질문을 바로 상단에 위치하게 프로그램 하였습니다.',
SYSDATE,
'일반',
DEFAULT
);

INSERT INTO TB_NOTICE(
NOTICE_NO,
NOTICE_NAME,
NOTICE_CONTENTS,
NOTICE_DATE,
NOTICE_CLSFC,
NOTICE_STATUS)
VALUES (
NOTICE_NO.NEXTVAL,
'오늘의식탁 개인정보 처리방침 변경 안내',
'안녕하세요.

오늘의식탁입니다.

오늘의식탁을 이용해주시는 회원 여러분들께 진심으로 감사드립니다.

오늘의식탁 내 개인정보 처리방침 변경에 관한 안내 말씀드립니다.

■ 변경사항

개인정보 처리방침 내 제 2조 2항 내용 추가

■ 적용일시

2022년 12월 6일

■ 변경 조항

제2조 2항 내용 변경

변경 전

２. 이용자는 회사의 서비스를 이용하기 위해서 회원 가입 시 개인정보를 입력해야 합니다.
가) 필수항목 : 아이디(ID), 비밀번호, 닉네임, 이메일주소, 성별, 생년월일
나) 선택항목 : 사진, 블로그 주소

변경 후

2. 이용자는 회사 서비스를 이용하기 위해 회원 가입 시 개인정보를 입력해야 합니다.

가) 일반 회원 가입
- 필수항목: 아이디, 비밀번호, 닉네임, 이메일, 성별, 생년월일
- 선택항목: 사진, 블로그 주소

나) SNS 가입
- 카카오 계정: 이메일, 닉네임, 프로필 사진
- 페이스북 계정: 이름, 이메일, 프로필사진
- 네이버 계정: 이메일, 별명, 프로필 사진,이름(선택), 성별(선택), 생일(선택), 연령대(선택)
- 구글 계정: 이름, 이메일, 프로필 사진, 언어
개정 약관의 내용에 대한 문의사항이 있으신 경우 고객센터로 접수해주시면 신속하고 친절하게 안내해드리겠습니다.
감사합니다.',
SYSDATE,
'일반',
DEFAULT
);

-- TB_EVENT

INSERT INTO TB_EVENT(
EVENT_NO,
EVENT_NAME,
EVENT_CONTENTS,
EVENT_DATE,
EVENT_PROCESSING,
EVENT_STATUS)
VALUES (
EVENT_NO.NEXTVAL,
'우리집 만의 추석 음식 레시피를 알려주세요.',
'안녕하세요~오늘의 식탁입니다.
처서가 지나고 날씨가 시원해 지고 있어요.
곧 추석이 다가오는데요. 가족 친지들이 모두 모여 맛있는 음식도 먹고 즐기는 때인데요.~
추석 때 우리 집은 이 음식은 특별히 꼭 먹어요.~하는 것들이 있지나요?.

우리 집 만의 특별한 추석 음식 레시피를 알려주세요!
여러분들의 노하우가 담긴 특별한 레시피를 기대합니다.
상품이 가득한 오늘의식탁 공모전 주변 분들에게 입소문 많이 내주시길 부탁드려요 :)',
SYSDATE,
DEFAULT,
DEFAULT);

INSERT INTO TB_EVENT(
EVENT_NO,
EVENT_NAME,
EVENT_CONTENTS,
EVENT_DATE,
EVENT_PROCESSING,
EVENT_STATUS)
VALUES (
EVENT_NO.NEXTVAL,
'2023 계묘년 당근 요리 레시피 이벤트',
'2023 계묘년 당근 요리 레시피를 알려주세요,
안녕하세요~오늘의 식탁입니다.
어느덧 2022년이 가고 2023년이 왔어요.~^^
올해는 토끼해라고 하네요. 올 한 해도 행복하고 건강한 2023년이 되셨으면 합니다.
귀여운 토끼가 좋아하고 건강에도 좋은 당근!!
당근으로 만든 특별한 레시피를 알려주세요.
여러분들의 노하우가 담긴 특별한 레시피를 기대합니다.
상품이 가득한 오늘의식탁 공모전 주변 분들에게 입소문 많이 내주시길 부탁드려요 :)
◎ 기간
- 응모 : 2022년 12월 31일~2023년 1월 31일 화요일 오후 5시
- 발표 : 2023년 2월 6일 월요일
◎ 선정기준
공모전 당첨자 총6명
- 주제에 맞는 레시피의 리뷰와 의견, 스크랩 수, 재료계량, 과정 설명, 과정 이미지가 잘 된 레시피와 아이디어가 돋보이는 레시피 대상으로 취합하여 선정 합니다.
※ 레시피 제목에 당근 또는 당근 연상 단어가 꼭 포함이 되어야 참여 인정.
※ 해당 월에 수상하신 경우, 해당 월에 진행하는 모든 공모전의 수상 대상에서 제외되며, 해당 월 다음 월에 진행하는 공모전부터 수상대상에 포함됩니다.
◎ 안내사항
- 공모전 요리 주제에 맞는 레시피를 등록해주세요.
- 전문레시피(직접등록/블로그 편집)만 응모 가능합니다
(※ 응모일 이전에 등록된 레시피는 제외)
- 주제와 맞지 않는 레시피는 수상 목록에서 제외될 수 있습니다.
- 공모전에 응모한 레시피는 재가공하여 오늘의식탁 영상 컨텐츠로 제작될 수 있습니다.
- 당첨자 발표는 따로 SMS를 전송하지 않습니다. 당첨자 발표일을 확인하시고 이벤트 페이지에서 확인하시기 바랍니다.
- 공모전 아이디어가 있으시면 [☞여기]를 통해 알려주세요.
- TV레시피는 수상대상에서 제외됩니다.',
SYSDATE,
'N',
DEFAULT);

INSERT INTO TB_EVENT(
EVENT_NO,
EVENT_NAME,
EVENT_CONTENTS,
EVENT_DATE,
EVENT_PROCESSING,
EVENT_STATUS)
VALUES (
EVENT_NO.NEXTVAL,
'[인스타그램 이벤트] 수고했어요 수험생 응원 메세지 이벤트',
'수험생 여러분 모두 수고하셨습니다 
오늘의식탁에서 수험생 여러분을 위한 수능이벤트를 준비했어요~
올 한해 수고한 친구, 가족, 그냥 좀 아는 사람을 포함한
주변의 수험생에게 응원메세지 남기고 함께 영화보러 갈 수 있는 기회!!
※ 참여방법
1) 인스타그램 계정(@10000recipe) 해당 게시물에 수능을 치룬 수험생 태그! (팔로우+게시물 하트 꾹~)
2) 올 한해 고생한 수험생을 힘나게 해줄 추천요리와 응원메세지를 댓글로 남긴다!
* 더 재치있고 더 감동적인 메세지를 남기면 당첨확률 up!
※ 해당 이벤트는 오늘의식탁 인스타그램 채널에서 진행되는 이벤트로
당첨자는 공식 계정을 통해 발표될 예정이니, 많은 참여 부탁드립니다 :)',
SYSDATE,
'N',
DEFAULT);

INSERT INTO TB_EVENT(
EVENT_NO,
EVENT_NAME,
EVENT_CONTENTS,
EVENT_DATE,
EVENT_PROCESSING,
EVENT_STATUS)
VALUES (
EVENT_NO.NEXTVAL,
'편의점 꿀조합 레시피를 알려주세요.',
'"안녕하세요~오늘의 식탁입니다.
요즘 편의점에 가면 정말 다양한 제품들이 많아요.~
저는 비빔면에 소시지 조합을 좋아하는데요.
SNS나 유튜브 보면 정말 다양한 꿀 조합이 많더라구요.
나만의 편의점 꿀 조합 레시피를 알려주세요.

여러분들의 노하우가 담긴 특별한 꿀조합을 기대합니다.
상품이 가득한 오늘의식탁 공모전 주변 분들에게 입소문 많이 내주시길 부탁드려요 :)"',
SYSDATE,
DEFAULT,
DEFAULT);

INSERT INTO TB_EVENT(
EVENT_NO,
EVENT_NAME,
EVENT_CONTENTS,
EVENT_DATE,
EVENT_PROCESSING,
EVENT_STATUS)
VALUES (
EVENT_NO.NEXTVAL,
'양파를 활용한 레시피를 알려주세요.',
'안녕하세요~오늘의 식탁입니다.
양파는 사계절 다 구하기 쉬운 재료에요. 지금은 햇양파가 많이 나오기도 하고요.
양파로 다양한 요리를 만들어주세요.
양파로 나만의 요리 레시피를 알려주세요.

여러분들의 노하우가 담긴 특별한 레시피를 기대합니다.
상품이 가득한 오늘의식탁 공모전 주변 분들에게 입 소문 많이 내주시길 부탁 드려요 :)',
SYSDATE,
'N',
DEFAULT);

-- TB_EVENT_COMMENT

INSERT INTO TB_EVENT_COMMENT(
EVENT_COM_NO,
EVENT_NO,
MEM_NO,
EVENT_COM_CONTENTS,
EVENT_COM_DATE,
EVENT_COM_STATUS)
VALUES (
EVENT_COM_NO.NEXTVAL,
1,
2,
'이벤트 잘 봤습니다~~',
SYSDATE,
DEFAULT);

INSERT INTO TB_EVENT_COMMENT(
EVENT_COM_NO,
EVENT_NO,
MEM_NO,
EVENT_COM_CONTENTS,
EVENT_COM_DATE,
EVENT_COM_STATUS)
VALUES (
EVENT_COM_NO.NEXTVAL,
3,
2,
'오오오 참여해야겠어요',
SYSDATE,
DEFAULT);

INSERT INTO TB_EVENT_COMMENT(
EVENT_COM_NO,
EVENT_NO,
MEM_NO,
EVENT_COM_CONTENTS,
EVENT_COM_DATE,
EVENT_COM_STATUS)
VALUES (
EVENT_COM_NO.NEXTVAL,
2,
4,
'좋은 이벤트네요~~~~!!',
SYSDATE,
DEFAULT);

INSERT INTO TB_EVENT_COMMENT(
EVENT_COM_NO,
EVENT_NO,
MEM_NO,
EVENT_COM_CONTENTS,
EVENT_COM_DATE,
EVENT_COM_STATUS)
VALUES (
EVENT_COM_NO.NEXTVAL,
5,
1,
'이벤트 참여합니다 ㅎㅎㅎㅎ',
SYSDATE,
DEFAULT);

INSERT INTO TB_EVENT_COMMENT(
EVENT_COM_NO,
EVENT_NO,
MEM_NO,
EVENT_COM_CONTENTS,
EVENT_COM_DATE,
EVENT_COM_STATUS)
VALUES (
EVENT_COM_NO.NEXTVAL,
4,
5,
'이벤트 참여할게요!',
SYSDATE,
DEFAULT);
