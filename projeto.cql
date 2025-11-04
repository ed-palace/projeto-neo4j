merge (u:User {id: 1 , nome: 'Ana', idade: '18', email: 'ana2020@gmail.com', sexo: 'F', cidade: 'Sao Paulo'});

merge (m:Movie {id: 1 , titulo: 'Matrix', dataLancamento: date("1999-05-21") , idadeRecomendada: 16} );

merge (s:Serie {id: 1 , titulo: 'Breaking bad', dataLancamento: date ('2008-01-20'), idadeRecomendada: 18});

merge (g:Genre {id: 1 , genero: 'acao/ficccao cientifica'});
merge (g:Genre {id: 2 , genero: 'acao'})

merge (a:Actor {id: 1, nome: 'Bryan Cranston', dataNascimento: date('1956-03-7'), sexo: 'M'});
merge (a:Actor {id: 2, nome: 'Keanu Reeves', dataNascimento: date('1964-09-2'), sexo: 'M'});

merge (d:Director {id: 1, nome: 'Vince Gilligan', dataNascimento: date('1968-05-2'), sexo: 'M'});
merge (d:Director {id: 2, nome: 'Lilly Wachowski', dataNascimento: date('1965-09-20'), sexo: 'f'});

match (u:User)
match (m:Movie)
merge (u)-[:WATCHED]->(m);

match (u:User)
match (s:Serie)
merge (u)-[:WATCHED]->(s);

match (m:Movie)
match (g:Genre {id: 1})
merge (m)-[:BELONGS_TO]->(g);

match (s:Serie)
match (g:Genre {id: 2})
merge (s)-[:BELONGS_TO]->(g);

match (a:Actor{nome: "Bryan Cranston"})
match (s:Serie)
merge (a )-[:ACTS_IN]->(s);

match (a:Actor{nome: "Keanu Reeves"})
match (m:Movie)
merge (a)-[:ACTS_IN]->(m);

match (a:Director{nome: "Vince Gilligan"})
match (s:Serie)
merge (d)-[:DIRECTED]->(s);

match (a:Director{nome: "Lilly Wachowski"})
match (m:Movie)
merge (d)-[:DIRECTED]->(m);
