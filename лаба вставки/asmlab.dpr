program asmlab;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
  var
  somearr:array[0..8] of integer;
  number,i:integer;
  count:integer;

begin
  writeln('введите массив из 9 чисел');
  for i := 0 to 8 do
    readln(somearr[i]);

   asm
        lea di, somearr
        mov cx,0
        mov [number], 0
        mov [count],0

        @oper1:
         mov bx,di
         push cx
         mov cx,[count]
         add bx,cx
         pop cx
         mov dx,0
         mov dl,[bx]

         push dx
         shr dx,1
         pop dx
         jnc @metka

         mov ah,02
         inc [number]
         int 21h
        @metka:
         inc cx
         add [count],4
         cmp cx,9
         jne @oper1


        add [number],48

   end;
   writeln('number of elements is: ', number);
   readln;
   readln;
end.
