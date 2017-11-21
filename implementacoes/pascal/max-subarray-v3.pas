{Algoritmo do subvetor maximo em Pascal
Versao 3 - Divisao e Conquista}

program max_subarray;
Uses sysutils;

type
  sub_max = record
    inicio : integer;
    fim    : integer;
    soma   : integer;
  end;
var
  subvetor : sub_max;

type
  pInt = ^integer; {Cria ponteiro p/ inteiro}

{Verifica se o subvetor maximo esta no meio do vetor}
function max_cross(vet : array of Longint; inicio, meio, fim : integer) : sub_max;
var
  e_soma, d_soma, soma, e_max, d_max, i : integer;
  maxSubVetor : sub_max;
begin
  soma   := 0;
  e_soma := vet[0];
  d_soma := vet[0];
  for i := meio downto inicio do {Vai do meio p/ o lado esquerdo}
    begin
      soma := soma + vet[i];
      if(e_soma < soma) then {Encontra a maior soma do meio indo p/ o lado esquerdo}
        begin
          e_soma := soma;
          e_max  := i;
        end;
    end;

    soma := 0;
    i    := 0;
    for i := meio+1 to fim do {Vai do meio p/ o lado direito}
      begin
        soma := soma + vet[i];
        if(soma > d_soma) then {Encontra a maior soma do meio indo p/ o lado direito}
          begin
            d_soma := soma;
            d_max  := i;
          end;
      end;

      {Cria o subvetor de retorno}
      maxSubVetor.inicio := e_max;
      maxSubVetor.fim    := d_max;
      maxSubVetor.soma   := (e_soma + d_soma);

      max_cross := maxSubVetor; {Retorna o subvetor}
end;

function subvetor_maximo(vet : array of Longint; inicio: integer; fim: integer) : sub_max;
var
  maxSubVetor, e_maxSubVetor, m_maxSubVetor, d_maxSubVetor : sub_max;
  m : real;
  meio : integer;
begin
  if(inicio = fim) then {Caso base}
    begin   {Cria o subvetor de retorno}
      maxSubVetor.inicio := inicio;
      maxSubVetor.fim    := fim;
      maxSubVetor.soma   := vet[inicio];
      subvetor_maximo    := maxSubVetor; {Retorno o subvetor}
      exit;
    end
  else
    begin
        m := (inicio + fim) / 2;
        meio := Trunc(m);

        writeln('Inicio: ', inicio, ' Fim: ', fim, ' Meio: ', meio);
        e_maxSubVetor := subvetor_maximo(vet, inicio, meio); {Testa se o subvetor esta a esquerda}
        d_maxSubVetor := subvetor_maximo(vet, meio+1, fim);  {Testa se o subvetor esta a direta}
        m_maxSubVetor := max_cross(vet, inicio, meio, fim);  {Testa se o subvetor esta no meio}

        if(e_maxSubVetor.soma >= d_maxSubVetor.soma) and (e_maxSubVetor.soma >= m_maxSubVetor.soma) then {Testa se o maior subvetor e o da esquerda}
                subvetor_maximo := e_maxSubVetor
        else if(d_maxSubVetor.soma >= e_maxSubVetor.soma) and (d_maxSubVetor.soma >= m_maxSubVetor.soma) then {Testa se o maior subvetor e o da direita}
                subvetor_maximo := d_maxSubVetor
        else  {Do contrario, o maior subvetor e o do meio}
                subvetor_maximo := m_maxSubVetor;
    end;
end;


var
  n, j: integer;
  maxSubVetor : sub_max;
  vet : array of Longint;
begin
  if paramcount <> 1 then
    begin
      writeln('Uso: ./algoritmo tam_vetor');
      exit;
    end;

  n := StrToInt(paramstr(1)); {Tamanho do vetor}
  SetLength(vet, n); {Seta o tamanho entre [0..n-1]}
  Randomize; {P/ nao ficar gerando o mesmo numero sempre}

  for j := 0 to n-1 do {Inicia o vetor com numeros pseudoaleatorios}
    vet[j] := Random(200) - 100;

  j := 0;
  maxSubVetor := subvetor_maximo(vet, 0, n-1); {Encontra o subvetor maximo}

  for j := 0 to n-1 do {Mostra os resultados}
    writeln('Vet[', j, ']: ', vet[j]);

  writeln('Soma maxima: ', maxSubVetor.soma);
  writeln('Inicio: ', maxSubVetor.inicio);
  writeln('Fim: ', maxSubVetor.fim);

  exit;
end.
