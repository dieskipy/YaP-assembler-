program labydabdab;

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

const
  k=9;

var
  A,Z: array [1..k] of Integer;
 i, number: Integer;

begin
  Randomize;
  for i := 1 to k do
  begin
    A[i]:= Random(500);
  end;



  asm
        mov       ecx,9
        lea      edi, A
        mov [number], 0
        lea      eax, Z

        @oper1:
         mov ebx,[edi]
         push ebx
         shr ebx,1
         pop ebx
         jnc @metka

         mov [eax],ebx
         add eax,4
         inc [number]
        @metka:
         add edi,4
         loop @oper1

  end;

  Writeln ('�������� ������:');
  for i := 1 to k do
    write (A[i],' ');
  Writeln(#13,#10,'�������� ������ �� ', number, ' ���������');
  for i := 1 to number do
     write(Z[i],' ');
  Readln;
end.
