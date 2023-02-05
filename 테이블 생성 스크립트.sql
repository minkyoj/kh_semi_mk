-- ���̺� ����
DROP TABLE "TB_REPORT";
DROP TABLE "TB_INQUIRY";
DROP TABLE "TB_NOTICE";
DROP TABLE "TB_EVENT";
DROP TABLE "TB_EVENT_COMMENT";

-- ���̺� ���� (TB_REPORT)
CREATE TABLE "TB_REPORT" (
	"REP_NO"	VARCHAR2(10)		NOT NULL,
	"REP_CONTENTS"	VARCHAR2(2000)		NOT NULL,
	"REP_AUTHOR"	VARCHAR2(60)		NOT NULL,
	"REP_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REP_CLSFC"	VARCHAR2(20)		NOT NULL,
	"REP_PROCESSING"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "TB_REPORT"."REP_NO" IS '�Ű��ȣ';

COMMENT ON COLUMN "TB_REPORT"."REP_CONTENTS" IS '����';

COMMENT ON COLUMN "TB_REPORT"."REP_AUTHOR" IS '�ۼ���';

COMMENT ON COLUMN "TB_REPORT"."REP_DATE" IS '�ۼ���';

COMMENT ON COLUMN "TB_REPORT"."REP_CLSFC" IS '�з�';

COMMENT ON COLUMN "TB_REPORT"."REP_PROCESSING" IS 'ó������';

ALTER TABLE "TB_REPORT" ADD CONSTRAINT "PK_TB_REPORT" PRIMARY KEY (
	"REP_NO"
);

-- ���̺� ���� (TB_INQUIRY)
CREATE TABLE "TB_INQUIRY" (
	"INQ_NO"	VARCHAR2(10)		NOT NULL,
	"INQ_NAME"	VARCHAR2(2000)		NOT NULL,
	"INQ_AUTHOR"	VARCHAR2(50)		NOT NULL,
	"INQ_QUESTION"	VARCHAR2(2000)		NOT NULL,
	"INQ_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"INQ_ANSWER"	VARCHAR2(2000)		NULL,
	"INQ_PROCESSING"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"INQ_PRIVATE"	CHAR(1)	DEFAULT 'Y'	NOT NULL
);

COMMENT ON COLUMN "TB_INQUIRY"."INQ_NO" IS '���ǹ�ȣ';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_NAME" IS '����';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_AUTHOR" IS '�ۼ���';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_QUESTION" IS '��������';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_DATE" IS '�ۼ���';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_ANSWER" IS '�亯����';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_PROCESSING" IS '�亯����';

COMMENT ON COLUMN "TB_INQUIRY"."INQ_PRIVATE" IS '��������';

ALTER TABLE "TB_INQUIRY" ADD CONSTRAINT "PK_TB_INQUIRY" PRIMARY KEY (
	"INQ_NO"
);

-- ���̺���� (TB_NOTICE)
CREATE TABLE "TB_NOTICE" (
	"NOTICE_NO"	VARCHAR2(10)		NOT NULL,
	"NOTICE_NAME"	VARCHAR2(100)		NOT NULL,
	"NOTICE_CONTENTS"	VARCHAR2(2000)		NOT NULL,
	"NOTICE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"NOTICE_CLSFC"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_NO" IS '������ȣ';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_NAME" IS '������';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_CONTENTS" IS '����';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_DATE" IS '�ۼ���';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_CLSFC" IS '�з�';

ALTER TABLE "TB_NOTICE" ADD CONSTRAINT "PK_TB_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

-- ���̺� ���� (TB_EVENT)
CREATE TABLE "TB_EVENT" (
	"EVENT_NO"	VARCHAR2(10)		NOT NULL,
	"EVENT_NAME"	VARCHAR2(100)		NOT NULL,
	"EVENT_CONTENTS"	VARCHAR2(2000)		NOT NULL,
	"EVENT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"EVENT_STATUS"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "TB_EVENT"."EVENT_NO" IS '�̺�Ʈ��ȣ';

COMMENT ON COLUMN "TB_EVENT"."EVENT_NAME" IS '�̺�Ʈ ����';

COMMENT ON COLUMN "TB_EVENT"."EVENT_CONTENTS" IS '�̺�Ʈ ����';

COMMENT ON COLUMN "TB_EVENT"."EVENT_DATE" IS '�ۼ���';

COMMENT ON COLUMN "TB_EVENT"."EVENT_STATUS" IS '����';

ALTER TABLE "TB_EVENT" ADD CONSTRAINT "PK_TB_EVENT" PRIMARY KEY (
	"EVENT_NO"
);

-- ���̺� ���� (TB_EVENT_COMMNET)
CREATE TABLE "TB_EVENT_COMMENT" (
	"EVENT_COM_NO"	VARCHAR2(10)		NOT NULL,
	"EVENT_NO"	VARCHAR2(10)		NOT NULL,
	"EVENT_COM_CONTENTS"	VARCHAR2(300)		NOT NULL,
	"EVENT_COM_AUTHOR"	VARCHAR2(60)		NOT NULL,
	"EVENT_COM_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_NO" IS '�̺�Ʈ��۹�ȣ';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_NO" IS '�̺�Ʈ��ȣ';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_CONTENTS" IS '�̺�Ʈ��۳���';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_AUTHOR" IS '�̺�Ʈ����ۼ���';

COMMENT ON COLUMN "TB_EVENT_COMMENT"."EVENT_COM_DATE" IS '�̺�Ʈ����ۼ���';

ALTER TABLE "TB_EVENT_COMMENT" ADD CONSTRAINT "PK_TB_EVENT_COMMENT" PRIMARY KEY (
	"EVENT_COM_NO"
);

ALTER TABLE "TB_EVENT_COMMENT" ADD CONSTRAINT "FK_EVENT_COMMENT" FOREIGN KEY (
	"EVENT_NO"
)
REFERENCES "TB_EVENT" (
	"EVENT_NO"
)
ON DELETE CASCADE;

-- ������ ����
CREATE SEQUENCE REP_NO
NOCACHE;
CREATE SEQUENCE INQ_NO
NOCACHE;
CREATE SEQUENCE NOTICE_NO
NOCACHE;
CREATE SEQUENCE EVENT_NO
NOCACHE;
CREATE SEQUENCE EVENT_COM_NO
NOCACHE;

-- INSERT�� (TB_REPORT)
INSERT INTO TB_REPORT(
REP_NO,
REP_CONTENTS,
REP_AUTHOR,
REP_DATE,
REP_CLSFC,
REP_PROCESSING
)
VALUES (
'RP'||REP_NO.NEXTVAL,
'�ǹ̾��� �Խñ� �Ű��մϴ� www.todaytable.com/~~~',
'�Ű��ҷ�',
SYSDATE,
'�Խñ۽Ű�',
DEFAULT
);

INSERT INTO TB_REPORT(
REP_NO,
REP_CONTENTS,
REP_AUTHOR,
REP_DATE,
REP_CLSFC,
REP_PROCESSING
)
VALUES (
'RP'||REP_NO.NEXTVAL,
'��ų� ��� �Ű��մϴ� www.todaytable.com/~~~',
'�Ű��',
SYSDATE,
'��۽Ű�',
DEFAULT
);

INSERT INTO TB_REPORT(
REP_NO,
REP_CONTENTS,
REP_AUTHOR,
REP_DATE,
REP_CLSFC,
REP_PROCESSING
)
VALUES (
'RP'||REP_NO.NEXTVAL,
'�弳 ��� �Ű��մϴ� www.todaytable.com/~~~',
'����',
SYSDATE,
'��۽Ű�',
'Y'
);

INSERT INTO TB_REPORT(
REP_NO,
REP_CONTENTS,
REP_AUTHOR,
REP_DATE,
REP_CLSFC,
REP_PROCESSING
)
VALUES (
'RP'||REP_NO.NEXTVAL,
'��ų� �Խñ� �Ű��մϴ� www.todaytable.com/~~~',
'���̿�',
SYSDATE,
'�Խñ۽Ű�',
'Y'
);

INSERT INTO TB_REPORT(
REP_NO,
REP_CONTENTS,
REP_AUTHOR,
REP_DATE,
REP_CLSFC,
REP_PROCESSING
)
VALUES (
'RP'||REP_NO.NEXTVAL,
'�Խñ� �Ű����� www.todaytable.com/~~~',
'��Ҹ�',
SYSDATE,
'�Խñ۽Ű�',
'Y'
);

-- INSERT�� (TB_INQUIRY)

INSERT INTO TB_INQUIRY(
INQ_NO,
INQ_NAME,
INQ_AUTHOR,
INQ_QUESTION,
INQ_DATE,
INQ_ANSWER,
INQ_PROCESSING,
INQ_PRIVATE
)
VALUES (
'IQ'||INQ_NO.NEXTVAL,
'������ ��ȸ ȭ���� �ȳ��Ϳ�',
'�������ƿ�',
'���� �� �ƴµ� ��ǻ�� �ٲٰ� ���� ������ ��ȸ�� �ȵǳ׿� �亯��Ź�帳�ϴ�.',
SYSDATE,
'�ȳ��ϼ��� ������ ��Ź�Դϴ�. �����ֽ� ���� �亯�帮�ڽ��ϴ�.
��ȸ�� �ȵȴٸ� chrome �������� ����غ�����',
DEFAULT,
DEFAULT
);

INSERT INTO TB_INQUIRY(
INQ_NO,
INQ_NAME,
INQ_AUTHOR,
INQ_QUESTION,
INQ_DATE,
INQ_ANSWER,
INQ_PROCESSING,
INQ_PRIVATE
)
VALUES (
'IQ'||INQ_NO.NEXTVAL,
'�����Ǹ� ���ϱ� ����Ŀ�',
'���',
'�����Ǹ� ���ϱ� ������׿� �Ѥ�;;',
SYSDATE,
NULL,
DEFAULT,
DEFAULT
);

INSERT INTO TB_INQUIRY(
INQ_NO,
INQ_NAME,
INQ_AUTHOR,
INQ_QUESTION,
INQ_DATE,
INQ_ANSWER,
INQ_PROCESSING,
INQ_PRIVATE
)
VALUES (
'IQ'||INQ_NO.NEXTVAL,
'������ �ִ� �����Ǹ� �����Ϸ��մϴ�.',
'�跹����',
'���� ������ �ִ� ��� �����Ǹ� �����Ϸ����մϴ�',
SYSDATE,
'�ȳ��ϼ��� ������ ��Ź�Դϴ�.
������ �ۼ��� �̿��� �������ּ���',
'Y',
'N'
);

INSERT INTO TB_INQUIRY(
INQ_NO,
INQ_NAME,
INQ_AUTHOR,
INQ_QUESTION,
INQ_DATE,
INQ_ANSWER,
INQ_PROCESSING,
INQ_PRIVATE
)
VALUES (
'IQ'||INQ_NO.NEXTVAL,
'������ ����� �ȵſ�',
'������',
'������ ����� �ȵǳ׿� ;;;;',
SYSDATE,
'�ȳ��ϼ��� ������ ��Ź�Դϴ�.
�ٽ��ѹ� �õ��غ�����',
'Y',
DEFAULT
);

INSERT INTO TB_INQUIRY(
INQ_NO,
INQ_NAME,
INQ_AUTHOR,
INQ_QUESTION,
INQ_DATE,
INQ_ANSWER,
INQ_PROCESSING,
INQ_PRIVATE
)
VALUES (
'IQ'||INQ_NO.NEXTVAL,
'�з��� �����ǿ��� 404������ ����',
'404�÷���',
'�з��� �����ǿ��� ������ϴ� ��ġ���ּ���',
SYSDATE,
'�ȳ��ϼ��� ������ ��Ź�Դϴ�.
���� �� �˴ϴ�.',
'N',
'N'
);

-- INSERT�� (TB_NOTICE)

INSERT INTO TB_NOTICE(
NOTICE_NO,
NOTICE_NAME,
NOTICE_CONTENTS,
NOTICE_DATE,
NOTICE_CLSFC)
VALUES (
'NT'||NOTICE_NO.NEXTVAL,
'2020�� ���� �ͽ��÷ο����� �������� ������ �ʽ��ϴ�',
'2020�� ������ ���������� Adobe���� �÷��� �÷��̾� ������ �ߴܵʿ� ���� 
�÷��� �÷��̾ ���� ������ ����� �Ұ��մϴ�
�������� ������ �������� ���׷��̵� �Ͻñ� �ٶ��ϴ�',
SYSDATE,
'�Ϲ�'
);

INSERT INTO TB_NOTICE(
NOTICE_NO,
NOTICE_NAME,
NOTICE_CONTENTS,
NOTICE_DATE,
NOTICE_CLSFC)
VALUES (
'NT'||NOTICE_NO.NEXTVAL,
'���� 8�� 16�� ������Ʈ�� �ֽ��ϴ�',
'���� ���� ������Ʈ�� �־� �������Ӱ� ��Ÿ ����� �۵����� �������� �ֽ��ϴϴ� ������ ��ġ���� �ϰڽ��ϴ�
���� �۾��� 8�� 16�� �����뿡 ���������Դϴ�
Ȥ�� �۵��� �ȵǴ� ����� ������ 1:1 ���� �Խ��ǿ� �ٷ� ��Ź�帳�ϴ�',
SYSDATE,
'���'
);

INSERT INTO TB_NOTICE(
NOTICE_NO,
NOTICE_NAME,
NOTICE_CONTENTS,
NOTICE_DATE,
NOTICE_CLSFC)
VALUES (
'NT'||NOTICE_NO.NEXTVAL,
'���� ��� ���˾ȳ�',
'�����������ΰ� �־� �������Ӱ� ��Ÿ ����� �۵����� �������� �ֽ��ϴϴ� ������ ��ġ���� �ϰڽ��ϴ�
�����մϴ�.',
SYSDATE,
'���'
);

INSERT INTO TB_NOTICE(
NOTICE_NO,
NOTICE_NAME,
NOTICE_CONTENTS,
NOTICE_DATE,
NOTICE_CLSFC)
VALUES (
'NT'||NOTICE_NO.NEXTVAL,
'��� ������ ���� �Ǿ����ϴ�',
'������ ��۷� �����Ͻø� ������ ������ ���� ������ ���� ���Ⱑ �����ϴٴ� �ǰ��� �־�
���� �ֽ� ��� ������ �ٷ� ��ܿ� ��ġ�ϰ� ���α׷� �Ͽ����ϴ�.',
SYSDATE,
'�Ϲ�'
);

INSERT INTO TB_NOTICE(
NOTICE_NO,
NOTICE_NAME,
NOTICE_CONTENTS,
NOTICE_DATE,
NOTICE_CLSFC)
VALUES (
'NT'||NOTICE_NO.NEXTVAL,
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
'�Ϲ�'
);

-- INSERT�� (TB_EVENT)

INSERT INTO TB_EVENT(
EVENT_NO,
EVENT_NAME,
EVENT_CONTENTS,
EVENT_DATE,
EVENT_STATUS)
VALUES (
'EV'||EVENT_NO.NEXTVAL,
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
'����');

INSERT INTO TB_EVENT(
EVENT_NO,
EVENT_NAME,
EVENT_CONTENTS,
EVENT_DATE,
EVENT_STATUS)
VALUES (
'EV'||EVENT_NO.NEXTVAL,
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
'����');

INSERT INTO TB_EVENT(
EVENT_NO,
EVENT_NAME,
EVENT_CONTENTS,
EVENT_DATE,
EVENT_STATUS)
VALUES (
'EV'||EVENT_NO.NEXTVAL,
'������ ������ �����Ǹ� �˷��ּ���.',
'"�ȳ��ϼ���~������ ��Ź�Դϴ�.
���� �������� ���� ���� �پ��� ��ǰ���� ���ƿ�.~
���� ����鿡 �ҽ��� ������ �����ϴµ���.
SNS�� ��Ʃ�� ���� ���� �پ��� �� ������ �����󱸿�.
������ ������ �� ���� �����Ǹ� �˷��ּ���.

�����е��� ���Ͽ찡 ��� Ư���� �������� ����մϴ�.
��ǰ�� ������ �����ǽ�Ź ������ �ֺ� �е鿡�� �Լҹ� ���� ���ֽñ� ��Ź����� :)"',
SYSDATE,
'����');

INSERT INTO TB_EVENT(
EVENT_NO,
EVENT_NAME,
EVENT_CONTENTS,
EVENT_DATE,
EVENT_STATUS)
VALUES (
'EV'||EVENT_NO.NEXTVAL,
'���ĸ� Ȱ���� �����Ǹ� �˷��ּ���.',
'�ȳ��ϼ���~������ ��Ź�Դϴ�.
���Ĵ� ����� �� ���ϱ� ���� ��ῡ��. ������ �޾��İ� ���� �����⵵ �ϰ��.
���ķ� �پ��� �丮�� ������ּ���.
���ķ� ������ �丮 �����Ǹ� �˷��ּ���.

�����е��� ���Ͽ찡 ��� Ư���� �����Ǹ� ����մϴ�.
��ǰ�� ������ �����ǽ�Ź ������ �ֺ� �е鿡�� �� �ҹ� ���� ���ֽñ� ��Ź ����� :)',
SYSDATE,
'����');

INSERT INTO TB_EVENT(
EVENT_NO,
EVENT_NAME,
EVENT_CONTENTS,
EVENT_DATE,
EVENT_STATUS)
VALUES (
'EV'||EVENT_NO.NEXTVAL,
'�츮�� ���� �߼� ���� �����Ǹ� �˷��ּ���.',
'�ȳ��ϼ���~������ ��Ź�Դϴ�.
ó���� ������ ������ �ÿ��� ���� �־��.
�� �߼��� �ٰ����µ���. ���� ģ������ ��� �� ���ִ� ���ĵ� �԰� ���� ���ε���.~
�߼� �� �츮 ���� �� ������ Ư���� �� �Ծ��.~�ϴ� �͵��� ��������?.

�츮 �� ���� Ư���� �߼� ���� �����Ǹ� �˷��ּ���!
�����е��� ���Ͽ찡 ��� Ư���� �����Ǹ� ����մϴ�.
��ǰ�� ������ �����ǽ�Ź ������ �ֺ� �е鿡�� �Լҹ� ���� ���ֽñ� ��Ź����� :)',
SYSDATE,
'����');

-- INSERT�� (TB_EVENT_COMMENT)

INSERT INTO TB_EVENT_COMMENT(
EVENT_COM_NO,
EVENT_NO,
EVENT_COM_CONTENTS,
EVENT_COM_AUTHOR,
EVENT_COM_DATE)
VALUES (
'EC'||EVENT_COM_NO.NEXTVAL,
'EV7',
'�������� �� �ý��ϴ�~~',
'�������ƿ�',
SYSDATE);

INSERT INTO TB_EVENT_COMMENT(
EVENT_COM_NO,
EVENT_NO,
EVENT_COM_CONTENTS,
EVENT_COM_AUTHOR,
EVENT_COM_DATE)
VALUES (
'EC'||EVENT_COM_NO.NEXTVAL,
'EV8',
'������ �����ؾ߰ھ��',
'AAA123',
SYSDATE);

INSERT INTO TB_EVENT_COMMENT(
EVENT_COM_NO,
EVENT_NO,
EVENT_COM_CONTENTS,
EVENT_COM_AUTHOR,
EVENT_COM_DATE)
VALUES (
'EC'||EVENT_COM_NO.NEXTVAL,
'EV10',
'���� �̺�Ʈ�׿�~~~~!!',
'����»��',
SYSDATE);

INSERT INTO TB_EVENT_COMMENT(
EVENT_COM_NO,
EVENT_NO,
EVENT_COM_CONTENTS,
EVENT_COM_AUTHOR,
EVENT_COM_DATE)
VALUES (
'EC'||EVENT_COM_NO.NEXTVAL,
'EV9',
'�̺�Ʈ �����մϴ� ��������',
'¥��',
SYSDATE);

INSERT INTO TB_EVENT_COMMENT(
EVENT_COM_NO,
EVENT_NO,
EVENT_COM_CONTENTS,
EVENT_COM_AUTHOR,
EVENT_COM_DATE)
VALUES (
'EC'||EVENT_COM_NO.NEXTVAL,
'EV11',
'�̺�Ʈ �����ҰԿ�!',
'���̹�',
SYSDATE);