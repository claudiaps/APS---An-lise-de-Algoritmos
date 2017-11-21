{Biblioteca para padronizar a geracao de numeros aleatorios
nas 4 linguagens}

Unit myBib;
Interface

  Uses sysutils;

  function myRand() : Cardinal;

Implementation
  var
    nSeed : Cardinal;

  function myRand() : Cardinal;
  begin
    nSeed := 2048; {seed vale 2048}

    {Usa a seed para gerar um novo valor. Como e uma constante muito grande e com overflow, fica dificil prever o proximo numero}
    nSeed := (8253729 * nSeed + 2396403); {Nao aceita}

    myRand := (nSeed mod 32767);
  end;

begin

end.
