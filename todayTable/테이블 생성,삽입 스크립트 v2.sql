-- ���̺� ����
DROP TABLE "TB_REPORT";
DROP TABLE "TB_INQUIRY";
DROP TABLE "TB_NOTICE";
DROP TABLE "TB_EVENT_COMMENT";
DROP TABLE "TB_EVENT";


-- ������ ����
DROP SEQUENCE "EVENT_NO";
DROP SEQUENCE "INQ_NO";
DROP SEQUENCE "NOTICE_NO";
DROP SEQUENCE "REP_NO";
DROP SEQUENCE "EVENT_COM_NO";

-- ������ ����
CREATE SEQUENCE "REP_NO";
CREATE SEQUENCE "INQ_NO";
CREATE SEQUENCE "NOTICE_NO";
CREATE SEQUENCE "EVENT_NO";
CREATE SEQUENCE "EVENT_COM_NO";

-- TB_REPORT ����
CREATE TABLE "TB_REPORT" (
	"REP_NO"	NUMBER		NOT NULL,
	"MEM_NO"	NUMBER		NOT NULL,
	"REP_CONTENTS"	VARCHAR2(2000)		NOT NULL,
	"REP_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REP_CLSFC"	VARCHAR2(20)		NOT NULL,
	"REP_PROCESSING"	CHAR(1)	DEFAULT 'N' CHECK(REP_PROCESSING IN('Y','N')) NOT NULL,
	"REP_STATUS"	CHAR(1)	DEFAULT 'Y'	NOT NULL
);

COMMENT ON COLUMN "TB_REPORT"."REP_NO" IS '�Ű��ȣ';

COMMENT ON COLUMN "TB_REPORT"."MEM_NO" IS 'ȸ����ȣ';

COMMENT ON COLUMN "TB_REPORT"."REP_CONTENTS" IS '����';

COMMENT ON COLUMN "TB_REPORT"."REP_DATE" IS '�ۼ���';

COMMENT ON COLUMN "TB_REPORT"."REP_CLSFC" IS '�з�';

COMMENT ON COLUMN "TB_REPORT"."REP_PROCESSING" IS 'ó������';

COMMENT ON COLUMN "TB_REPORT"."REP_STATUS" IS '����';

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

COMMENT ON COLUMN "TB_INQUIRY"."INQ_NO" IS '���ǹ�ȣ';

COMMENT ON COLUMN "TB_INQUIRY"."MEM_NO" IS 'ȸ����ȣ';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_NAME" IS '����';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_QUESTION" IS '��������';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_DATE" IS '�ۼ���';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_ANSWER" IS '�亯����';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_PROCESSING" IS '�亯����';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_PRIVATE" IS '��������';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_STATUS" IS '����';

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

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_NO" IS '������ȣ';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_NAME" IS '������';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_CONTENTS" IS '����';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_DATE" IS '�ۼ���';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_CLSFC" IS '�з�';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_STATUS" IS '����';

ALTER TABLE "TB_NOTICE" ADD CONSTRAINT "PK_TB_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

-- TB_EVENT ����

CREATE TABLE "TB_EVENT" (
	"EVENT_NO"	NUMBER		NOT NULL,
	"EVENT_NAME"	VARCHAR2(100)		NOT NULL,
	"EVENT_CONTENTS"	VARCHAR2(2000)		NOT NULL,
	"EVENT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"EVENT_PROCESSING"	CHAR(1)	DEFAULT 'Y' CHECK(EVENT_PROCESSING IN('Y','N'))	NOT NULL,
	"EVENT_STATUS"	CHAR(1)	DEFAULT 'Y' CHECK(EVENT_STATUS IN('Y','N'))	NOT NULL
);

COMMENT ON COLUMN "TB_EVENT"."EVENT_NO" IS '�̺�Ʈ��ȣ';

COMMENT ON COLUMN "TB_EVENT"."EVENT_NAME" IS '�̺�Ʈ ����';

COMMENT ON COLUMN "TB_EVENT"."EVENT_CONTENTS" IS '�̺�Ʈ ����';

COMMENT ON COLUMN "TB_EVENT"."EVENT_DATE" IS '�ۼ���';

COMMENT ON COLUMN "TB_EVENT"."EVENT_PROCESSING" IS '���࿩��';

COMMENT ON COLUMN "TB_EVENT"."EVENT_STATUS" IS '����';

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

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_NO" IS '�̺�Ʈ��۹�ȣ';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_NO" IS '�̺�Ʈ��ȣ';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."MEM_NO" IS 'ȸ����ȣ';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_CONTENTS" IS '�̺�Ʈ��۳���';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_DATE" IS '�̺�Ʈ����ۼ���';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_STATUS" IS '����';

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


-- INSERT��
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
'�ǹ̾��� �Խñ� �Ű��մϴ� www.todaytable.com/~~~',
SYSDATE,
'�Խñ۽Ű�',
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
'��ų� ��� �Ű��մϴ� www.todaytable.com/~~~',
SYSDATE,
'��۽Ű�',
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
'�弳 ��� �Ű��մϴ� www.todaytable.com/~~~',
SYSDATE,
'��۽Ű�',
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
'��ų� �Խñ� �Ű��մϴ� www.todaytable.com/~~~',
SYSDATE,
'�Խñ۽Ű�',
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
'�Խñ� �Ű����� www.todaytable.com/~~~',
SYSDATE,
'�Խñ۽Ű�',
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
'������ ��ȸ ȭ���� �ȳ��Ϳ�',
'���� �� �ƴµ� ��ǻ�� �ٲٰ� ���� ������ ��ȸ�� �ȵǳ׿� �亯��Ź�帳�ϴ�.',
SYSDATE,
'�ȳ��ϼ��� ������ ��Ź�Դϴ�. �����ֽ� ���� �亯�帮�ڽ��ϴ�.
��ȸ�� �ȵȴٸ� chrome �������� ����غ�����',
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
'�����Ǹ� ���ϱ� ����Ŀ�',
'�����Ǹ� ���ϱ� ������׿� �Ѥ�;;',
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
'������ �ִ� �����Ǹ� �����Ϸ��մϴ�.',
'���� ������ �ִ� ��� �����Ǹ� �����Ϸ����մϴ�',
SYSDATE,
'�ȳ��ϼ��� ������ ��Ź�Դϴ�.
������ �ۼ��� �̿��� �������ּ���',
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
'������ ����� �ȵſ�',
'������ ����� �ȵǳ׿� ;;;;',
SYSDATE,
'�ȳ��ϼ��� ������ ��Ź�Դϴ�.
�ٽ��ѹ� �õ��غ�����',
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
'�з��� �����ǿ��� 404������ ����',
'�з��� �����ǿ��� ������ϴ� ��ġ���ּ���',
SYSDATE,
'�ȳ��ϼ��� ������ ��Ź�Դϴ�.
���� �� �˴ϴ�.',
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
'2020�� ���� �ͽ��÷ο����� �������� ������ �ʽ��ϴ�',
'2020�� ������ ���������� Adobe���� �÷��� �÷��̾� ������ �ߴܵʿ� ���� 
�÷��� �÷��̾ ���� ������ ����� �Ұ��մϴ�
�������� ������ �������� ���׷��̵� �Ͻñ� �ٶ��ϴ�',
SYSDATE,
'�Ϲ�',
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
'���� 8�� 16�� ������Ʈ�� �ֽ��ϴ�',
'���� ���� ������Ʈ�� �־� �������Ӱ� ��Ÿ ����� �۵����� �������� �ֽ��ϴϴ� ������ ��ġ���� �ϰڽ��ϴ�
���� �۾��� 8�� 16�� �����뿡 ���������Դϴ�
Ȥ�� �۵��� �ȵǴ� ����� ������ 1:1 ���� �Խ��ǿ� �ٷ� ��Ź�帳�ϴ�',
SYSDATE,
'���',
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
'���� ��� ���˾ȳ�',
'�����������ΰ� �־� �������Ӱ� ��Ÿ ����� �۵����� �������� �ֽ��ϴϴ� ������ ��ġ���� �ϰڽ��ϴ�
�����մϴ�.',
SYSDATE,
'���',
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
'��� ������ ���� �Ǿ����ϴ�',
'������ ��۷� �����Ͻø� ������ ������ ���� ������ ���� ���Ⱑ �����ϴٴ� �ǰ��� �־�
���� �ֽ� ��� ������ �ٷ� ��ܿ� ��ġ�ϰ� ���α׷� �Ͽ����ϴ�.',
SYSDATE,
'�Ϲ�',
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
'�����ǽ�Ź �������� ó����ħ ���� �ȳ�',
'�ȳ��ϼ���.

�����ǽ�Ź�Դϴ�.

�����ǽ�Ź�� �̿����ֽô� ȸ�� �����е鲲 �������� ����帳�ϴ�.

�����ǽ�Ź �� �������� ó����ħ ���濡 ���� �ȳ� �����帳�ϴ�.

�� �������

�������� ó����ħ �� �� 2�� 2�� ���� �߰�

�� �����Ͻ�

2022�� 12�� 6��

�� ���� ����

��2�� 2�� ���� ����

���� ��

��. �̿��ڴ� ȸ���� ���񽺸� �̿��ϱ� ���ؼ� ȸ�� ���� �� ���������� �Է��ؾ� �մϴ�.
��) �ʼ��׸� : ���̵�(ID), ��й�ȣ, �г���, �̸����ּ�, ����, �������
��) �����׸� : ����, ��α� �ּ�

���� ��

2. �̿��ڴ� ȸ�� ���񽺸� �̿��ϱ� ���� ȸ�� ���� �� ���������� �Է��ؾ� �մϴ�.

��) �Ϲ� ȸ�� ����
- �ʼ��׸�: ���̵�, ��й�ȣ, �г���, �̸���, ����, �������
- �����׸�: ����, ��α� �ּ�

��) SNS ����
- īī�� ����: �̸���, �г���, ������ ����
- ���̽��� ����: �̸�, �̸���, �����ʻ���
- ���̹� ����: �̸���, ����, ������ ����,�̸�(����), ����(����), ����(����), ���ɴ�(����)
- ���� ����: �̸�, �̸���, ������ ����, ���
���� ����� ���뿡 ���� ���ǻ����� ������ ��� �����ͷ� �������ֽø� �ż��ϰ� ģ���ϰ� �ȳ��ص帮�ڽ��ϴ�.
�����մϴ�.',
SYSDATE,
'�Ϲ�',
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
'�츮�� ���� �߼� ���� �����Ǹ� �˷��ּ���.',
'�ȳ��ϼ���~������ ��Ź�Դϴ�.
ó���� ������ ������ �ÿ��� ���� �־��.
�� �߼��� �ٰ����µ���. ���� ģ������ ��� �� ���ִ� ���ĵ� �԰� ���� ���ε���.~
�߼� �� �츮 ���� �� ������ Ư���� �� �Ծ��.~�ϴ� �͵��� ��������?.

�츮 �� ���� Ư���� �߼� ���� �����Ǹ� �˷��ּ���!
�����е��� ���Ͽ찡 ��� Ư���� �����Ǹ� ����մϴ�.
��ǰ�� ������ �����ǽ�Ź ������ �ֺ� �е鿡�� �Լҹ� ���� ���ֽñ� ��Ź����� :)',
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
'2023 �蹦�� ��� �丮 ������ �̺�Ʈ',
'2023 �蹦�� ��� �丮 �����Ǹ� �˷��ּ���,
�ȳ��ϼ���~������ ��Ź�Դϴ�.
����� 2022���� ���� 2023���� �Ծ��.~^^
���ش� �䳢�ض�� �ϳ׿�. �� �� �ص� �ູ�ϰ� �ǰ��� 2023���� �Ǽ����� �մϴ�.
�Ϳ��� �䳢�� �����ϰ� �ǰ����� ���� ���!!
������� ���� Ư���� �����Ǹ� �˷��ּ���.
�����е��� ���Ͽ찡 ��� Ư���� �����Ǹ� ����մϴ�.
��ǰ�� ������ �����ǽ�Ź ������ �ֺ� �е鿡�� �Լҹ� ���� ���ֽñ� ��Ź����� :)
�� �Ⱓ
- ���� : 2022�� 12�� 31��~2023�� 1�� 31�� ȭ���� ���� 5��
- ��ǥ : 2023�� 2�� 6�� ������
�� ��������
������ ��÷�� ��6��
- ������ �´� �������� ����� �ǰ�, ��ũ�� ��, ���跮, ���� ����, ���� �̹����� �� �� �����ǿ� ���̵� �����̴� ������ ������� �����Ͽ� ���� �մϴ�.
�� ������ ���� ��� �Ǵ� ��� ���� �ܾ �� ������ �Ǿ�� ���� ����.
�� �ش� ���� �����Ͻ� ���, �ش� ���� �����ϴ� ��� �������� ���� ��󿡼� ���ܵǸ�, �ش� �� ���� ���� �����ϴ� ���������� ������ ���Ե˴ϴ�.
�� �ȳ�����
- ������ �丮 ������ �´� �����Ǹ� ������ּ���.
- ����������(�������/��α� ����)�� ���� �����մϴ�
(�� ������ ������ ��ϵ� �����Ǵ� ����)
- ������ ���� �ʴ� �����Ǵ� ���� ��Ͽ��� ���ܵ� �� �ֽ��ϴ�.
- �������� ������ �����Ǵ� �簡���Ͽ� �����ǽ�Ź ���� �������� ���۵� �� �ֽ��ϴ�.
- ��÷�� ��ǥ�� ���� SMS�� �������� �ʽ��ϴ�. ��÷�� ��ǥ���� Ȯ���Ͻð� �̺�Ʈ ���������� Ȯ���Ͻñ� �ٶ��ϴ�.
- ������ ���̵� �����ø� [�ѿ���]�� ���� �˷��ּ���.
- TV�����Ǵ� �����󿡼� ���ܵ˴ϴ�.',
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
'[�ν�Ÿ�׷� �̺�Ʈ] �����߾�� ����� ���� �޼��� �̺�Ʈ',
'����� ������ ��� �����ϼ̽��ϴ� 
�����ǽ�Ź���� ����� �������� ���� �����̺�Ʈ�� �غ��߾��~
�� ���� ������ ģ��, ����, �׳� �� �ƴ� ����� ������
�ֺ��� ��������� �����޼��� ����� �Բ� ��ȭ���� �� �� �ִ� ��ȸ!!
�� �������
1) �ν�Ÿ�׷� ����(@10000recipe) �ش� �Խù��� ������ ġ�� ����� �±�! (�ȷο�+�Խù� ��Ʈ ��~)
2) �� ���� ����� ������� ������ ���� ��õ�丮�� �����޼����� ��۷� �����!
* �� ��ġ�ְ� �� �������� �޼����� ����� ��÷Ȯ�� up!
�� �ش� �̺�Ʈ�� �����ǽ�Ź �ν�Ÿ�׷� ä�ο��� ����Ǵ� �̺�Ʈ��
��÷�ڴ� ���� ������ ���� ��ǥ�� �����̴�, ���� ���� ��Ź�帳�ϴ� :)',
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
'������ ������ �����Ǹ� �˷��ּ���.',
'"�ȳ��ϼ���~������ ��Ź�Դϴ�.
���� �������� ���� ���� �پ��� ��ǰ���� ���ƿ�.~
���� ����鿡 �ҽ��� ������ �����ϴµ���.
SNS�� ��Ʃ�� ���� ���� �پ��� �� ������ �����󱸿�.
������ ������ �� ���� �����Ǹ� �˷��ּ���.

�����е��� ���Ͽ찡 ��� Ư���� �������� ����մϴ�.
��ǰ�� ������ �����ǽ�Ź ������ �ֺ� �е鿡�� �Լҹ� ���� ���ֽñ� ��Ź����� :)"',
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
'���ĸ� Ȱ���� �����Ǹ� �˷��ּ���.',
'�ȳ��ϼ���~������ ��Ź�Դϴ�.
���Ĵ� ����� �� ���ϱ� ���� ��ῡ��. ������ �޾��İ� ���� �����⵵ �ϰ��.
���ķ� �پ��� �丮�� ������ּ���.
���ķ� ������ �丮 �����Ǹ� �˷��ּ���.

�����е��� ���Ͽ찡 ��� Ư���� �����Ǹ� ����մϴ�.
��ǰ�� ������ �����ǽ�Ź ������ �ֺ� �е鿡�� �� �ҹ� ���� ���ֽñ� ��Ź ����� :)',
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
'�̺�Ʈ �� �ý��ϴ�~~',
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
'������ �����ؾ߰ھ��',
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
'���� �̺�Ʈ�׿�~~~~!!',
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
'�̺�Ʈ �����մϴ� ��������',
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
'�̺�Ʈ �����ҰԿ�!',
SYSDATE,
DEFAULT);
