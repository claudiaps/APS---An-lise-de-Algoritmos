{Algoritmo do subvetor maximo em Pascal
Versao 2 - Iterativa melhorada}

program max_subarray;
Uses sysutils;

var
  n, i, soma, maxSoma, inicio, fim, j: integer;
  vet : array of Longint;
begin
  if paramcount <> 1 then
    begin
      writeln('Uso: ./algoritmo tam_vetor');
      exit;
    end;

  n := StrToInt(paramstr(1)); {Tamanho de vetor}
  SetLength(vet, n); {Seta o tamanho entre [0..n-1]}
  Randomize; {P/ nao ficar gerando o mesmo numero sempre}

  for i := 0 to n-1 do {Laco que inicia o vetor com numeros pseudoaleatorios}
    vet[i] := Random(200) - 100;

  i := 0;
  maxSoma := vet[0];

  {Encontrar o subvetor maximo.}
  for i := 0 to n-1 do
    begin
      soma := 0;
      for j := i to n-1 do
        begin
          soma  := soma + vet[j];
          if (soma > maxSoma) then {Testa todas as somas de i ate n e encontra a maior}
           begin
            maxSoma := soma;
            inicio  := i;
            fim     := j;
           end;
        end;
    end;

  i:= 0;
  for i := 0 to n-1 do
    writeln('Vet[', i, ']: ', vet[i]);

  writeln('Soma maxima: ', maxSoma);
  writeln('Inicio: ', inicio);
  writeln('Fim: ', fim);

  exit;
end.