-- �̸�, �¾ �ظ� �Է� �޾Ƽ� print output�� �ϸ� 'ȫ�浿�� �¾�� 2021��
-- ��� xx��'�� ����ϴ� pl/sql�� �ۼ��ϼ���.
create or replace procedure proc_zodiac (name varchar2, birth number,
										output_msg out varchar2)
is

	type zodiac_tab is table of varchar2(9) index by binary_integer;

	zodiac_text zodiac_tab;

begin

	zodiac_text(0) :='������';
	zodiac_text(1) :='��';
	zodiac_text(2) :='��';
	zodiac_text(3) :='����';
	zodiac_text(4) :='��';
	zodiac_text(5) :='��';
	zodiac_text(6) :='ȣ����';
	zodiac_text(7) :='�䳢';
	zodiac_text(8) :='��';
	zodiac_text(9) :='��';
	zodiac_text(10) :='��';
	zodiac_text(11) :='��';

	output_msg := name||'�� �¾ �ش� '||birth||'��, ��� '||zodiac_text( mod(birth,12))||'�� �Դϴ�.';

end;
/

-- 2. ������
-- 3. ���ε� ���� ����
-- var msg varchar2(1000)
-- 4. ����⸦ ����Ͽ� ����
-- exec proc_zodiac('�̸�', �¾��, :msg)
-- 5. bind ������ �Ҵ�� ���� ����Ѵ�.
--	print msg

