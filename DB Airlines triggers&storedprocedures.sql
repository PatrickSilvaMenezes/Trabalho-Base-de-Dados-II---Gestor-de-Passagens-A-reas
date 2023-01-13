---------------------------------------------------------------------STORED PROCEDURES----------------------------------------------------------------------------

----------------------------------------------STORED PROCEDURES PARA INSERÇÃO DE DADOS------------------------------------------
-- stored procedure para inserir rapidamente uma Pessoa --
create procedure insere_pessoa @nome varchar(50), @morada varchar(50), @data_nascimento date,
@telemovel int, @email varchar(50), @tipo_pessoa int as
insert into Pessoa(nome, morada, data_nascimento, telemóvel, email, tipo_pessoa)
values(@nome, @morada, @data_nascimento, @telemovel, @email, @tipo_pessoa)

exec insere_pessoa -- passar parametros aqui --

-- stored procedure para inserir rapidamente uma Reserva --
create procedure insere_reserva @ref_voo int, @porta_embarque varchar(3), @nome_aeroporto varchar(50),
@terminal varchar(1), @tipo_reserva int, @quantidade_reservas int, @data_criacao date as
insert into Reserva (ref_voo, porta_embarque, nome_aeroporto, terminal, tipo_reserva, quantidade_reservas, data_criação)
values (@ref_voo, @porta_embarque, @nome_aeroporto, @terminal, @tipo_reserva, @quantidade_reservas, @data_criacao)

exec insere_reserva -- passar parametros aqui --

-- stored procedure para inserir rapidamente uma Voo --
create procedure insere_voo @ida date, @volta date, @horario time(7), @classe varchar(50),
@origem varchar(20), @destino varchar(20), @passagens_disponiveis int as
insert into Voo(data_ida_voo, data_volta_voo, horário_voo, classe_voo, origem, destino, passagens_disponiveis)
values (@ida, @volta, @horario, @classe, @origem, @destino, @passagens_disponiveis)

exec insere_voo -- passar parametros aqui --

-- stored procedure para inserir rapidamente uma Companhia Aerea --
create procedure insere_companhiaAerea @nome varchar(50), @morada varchar(50), @telemovel int, @email varchar(50) as
insert into CompanhiaAerea(nome_companhia, morada, telemóvel, email)
values (@nome, @morada, @telemovel, @email)

exec insere_companhiaAerea -- passar parametros aqui --

-- stored procedure para inserir rapidamente uma Passageiro --
create procedure insere_passageiro @passaporte varchar(8), @cod_passageiro int as
if exists (select ref_pessoa from Passageiro where ref_pessoa=@cod_passageiro) and @passaporte not in (select passaporte from Passageiro)
begin
	update Passageiro set passaporte = @passaporte where ref_pessoa = @cod_passageiro
end
else
begin
	print 'passageiro inexistente no sistema ou com passaporte ja existente no sistema'
end

exec insere_passageiro -- passar parametros aqui --

-- stored procedure para inserir rapidamente uma Gestao --
create procedure insere_gestao @ref_voo int, @nova_data_ida_voo date, @nova_data_volta_voo date, @nova_classe_voo varchar(50) as
if exists (select id_voo from Voo where id_voo =@ref_voo)
begin
	insert into Gestao(ref_voo, nova_data_ida_voo, nova_data_volta_voo, nova_classe_voo)
	values (@ref_voo, @nova_data_ida_voo, @nova_data_volta_voo, @nova_classe_voo)
end
else
begin
	print 'voo inexistente no sistema para ser gerido'
end

exec insere_gestao -- passar parametros aqui --

-- stored procedure para inserir rapidamente um registro de reserva de um Passageiro --
create procedure insere_reservaPassageiro @cod_passageiro int, @cod_reserva int, @tipo_checkin_p bit, @tipo_checkin_f bit, @poltrona varchar(3) as
if (exists (select ref_pessoa from Passageiro where ref_pessoa=@cod_passageiro) and 
exists (select id_reserva from Reserva where id_reserva=@cod_reserva))
begin
	if @tipo_checkin_f = 1 and @tipo_checkin_p = 1
	print 'check-in inválido'
	else
	begin
	insert into Passageiro_Reserva (ref_reserva, ref_passageiro, tipo_checkin_p, tipo_checkin_f, numero_poltrona)
	values (@cod_reserva, @cod_passageiro, @tipo_checkin_p, @tipo_checkin_f, @poltrona)
	end
end
else
begin
	print 'passageiro ou reserva inexistente no sistema'
end
 
exec insere_reservaPassageiro -- passar parametros aqui -- 


-- stored procedure para inserir rapidamente uma Funcionario --
create procedure insere_funcionario @cod_companhiaAerea int, @nacionalidade varchar(15), @cod_funcionario int as
if  exists ((select ref_pessoa from Funcionario where ref_pessoa=@cod_funcionario)) and 
	exists ((select @cod_companhiaAerea from CompanhiaAerea where id_companhia = @cod_companhiaAerea))
	begin
	update Funcionario set 
	cod_companhia = @cod_companhiaAerea, nacionalidade = @nacionalidade
	where ref_pessoa = @cod_funcionario
	end
else
begin
	print 'funcionário inexistente no sistema ou companhia aérea inexistente no sistema'
end

exec insere_funcionario -- passar parametros aqui --
----------------------------------------------STORED PROCEDURES PARA DELETAR DADOS------------------------------------------

-- stored procedure para deletar passageiro
create procedure delete_passageiro @ref_passageiro int as
delete from Passageiro where @ref_passageiro = ref_pessoa

exec delete_passageiro --passar parametro aqui--

-- stored procedure para deletar funcionario
create procedure delete_funcionario @ref_funcionario int as
delete from Funcionario where @ref_funcionario = ref_pessoa

exec delete_funcionario --passar parametro aqui--

------ stored procedure para deletar Voo
create procedure deleteVoo @id_voo int as 
delete from Voo where @id_voo= id_voo

exec deleteVoo --passar parametro aqui--

------ stored procedure para deletar reserva 
create procedure deleteReserva @id_reserva int as
delete from Reserva where @id_reserva= id_reserva

exec deleteReserva	--passar parametro aqui--

-- stored procedures para deletar um registro de passageiro reserva
create procedure deletePassageiroReserva @ref_reserva int, @ref_passageiro int as
delete from Passageiro_Reserva where @ref_reserva = ref_reserva and @ref_passageiro = ref_passageiro

exec deletePassageiroReserva -- passar parametro aqui --
----------------------------------------------STORED PROCEDURES PARA VERIFICAÇÃO DE DADOS------------------------------------------
-- stored procedure para verificar se existe o funcionario 
Create procedure VerificaFuncionarios @ref_pessoa int as
if not exists(select *from Funcionario where ref_pessoa= @ref_pessoa)
print 'Funcionario inexistente'
else
print 'Funcionario existente'

exec VerificaFuncionarios --passar parametro aqui--
--------------------------------------------------------------------------
-- stored procedure para verificar se existe os Passageiros 
Create procedure VerificaPassageiro @ref_pessoa int as
if not exists(select *from Passageiro where ref_pessoa= @ref_pessoa)
print 'Passageiro inexistente'
else
print 'Passageiro existente'

exec VerificaPassageiro -- passar parametro aqui --
--------------------------------------------------------------------------
-- stored procedure para verificar se existe a Companhia Aerea 
Create procedure VerificaCompanhiaAerea @id_companhia int as
if not exists(select *from CompanhiaAerea where id_companhia= @id_companhia)
print 'Companhia Aerea inexistente'
else
print 'Companhia Aerea existente'

exec VerificaCompanhiaAerea --passar parametro aqui--
--------------------------------------------------------------------------
-- stored procedure para verificar se existe a Voo 
Create procedure VerificaVoo @id_voo int as
if not exists(select *from Voo where id_voo= @id_voo)
print 'Voo inexistente'
else
print 'Voo existente'

exec VerificaVoo --passar parametro aqui--
--------------------------------------------------------------------------
-- stored procedure para verificar se existe a Reservas 
Create procedure VerificaReservas @id_reserva int as
if not exists(select *from Reserva where id_reserva= @id_reserva)
print 'Reserva inexistente'
else
print 'Reserva existente'

exec VerificaReservas --passar parametro aqui--

----------------------------------------------STORED PROCEDURES PARA LISTAGEM DE DADOS------------------------------------------
-- stored procedure para listar reservas realizadas naquele dia
create procedure listarReservasDataDesejada @data_criação date as
select data_criação, sum(quantidade_reservas) as total
from Reserva as r
where  
DAY(r.data_criação) = DAY(@data_criação) and
MONTH(r.data_criação) = MONTH(@data_criação) and
YEAR(r.data_criação) = YEAR(@data_criação) 
group by data_criação


exec listarReservasDataDesejada -- passar parametro aqui --

-- Store procedure para listar dados das pessoas -- 
create procedure listarPessoas AS
SELECT * FROM Pessoa 

exec listarPessoas

-- Store procedure para listar dados da Reserva --
create procedure listarReservas AS
SELECT *  FROM Reserva

exec listarReservas

-- Store procedure para listar dados do voo --
create procedure listarVoos As
SELECT * FROM Voo

exec listarVoos

-- Store procedure para listar Passageiro --
create procedure listarPassageiros As
SELECT * FROM Passageiro

exec listarPassageiros

-- Store procedure para listar Gestão --
create procedure listarGestao As
SELECT * FROM Gestao

exec listarGestao

-- Store procedure para listar Status Reserva --
create procedure listarStatusReserva As
SELECT * FROM Status_Reserva 

exec listarStatusReserva

-- Store procedure para listar Passageiro Reserva --
create procedure listarPassageiroReserva As
SELECT * FROM Passageiro_Reserva 

exec listarPassageiroReserva

-------------------------------------------------------------------//-----------//-----------------------------------------------------------------------
-------------------------------------------------------------------//-----------//-----------------------------------------------------------------------

---------------------------------------------------------------------TRIGGERS----------------------------------------------------------------------------

-- trigger para inserir pessoa na tabela pessoa e na sua respectiva tabela segundo seu tipo_pessoa
create trigger inserePessoa on Pessoa 
for insert as
if ((select tipo_pessoa from Pessoa) = 1)
begin
	insert into Passageiro (ref_pessoa) values ((select id_pessoa from inserted))
end
else
begin
	insert into Funcionario (ref_pessoa) values ((select id_pessoa from inserted))
end
-- trigger para a cada nova alteração em algum campo de um determinado o mesmo é alterado na tabela voo 
create trigger gestaoReserva on Gestao
for insert as 
if (select nova_data_ida_voo from inserted) is not NULL
begin
	update Voo 
	set data_ida_voo = (select nova_data_ida_voo from inserted) 
end
if  (select nova_data_volta_voo from inserted) is not NULL
begin
	update Voo 
	set data_volta_voo = (select nova_data_volta_voo from inserted)
end
if (select nova_classe_voo from inserted) is not NULL
begin
	update Voo 
	set classe_voo = (select nova_classe_voo from inserted)
	where Voo.id_voo = (select ref_voo from inserted)
end

-- trigger para adicionar milhas a cada novo registro de reserva de um passageiro na tabela Passageiro_Reserva, quando é o 
create trigger adicionaMilhas on Passageiro_Reserva
for insert as 
if (select count(ref_passageiro) from inserted)  =  0
begin
	Update Passageiro
	set milha_passageiro =  500
	where ref_pessoa = (select ref_passageiro from inserted)
end
else if (select count(ref_passageiro) from inserted)  >=  1
begin
	update Passageiro
	set milha_passageiro = milha_passageiro * 1.2
	where ref_pessoa = (select ref_passageiro from inserted)
end

-- trigger para tirar o passageiro da tabela pessoa quando eliminado

create trigger deletePassageiroPessoa on Passageiro
for delete as
delete from Pessoa where id_pessoa = (select ref_pessoa from deleted)

-- trigger para tirar o funcionario da tabela pessoa quando eliminado

create trigger deleteFuncionarioPessoa on Funcionario
for delete as
delete from Pessoa where id_pessoa = (select ref_pessoa from deleted)


-- trigger para identificar o tipo de checkin realizado na tabela Passageiro_Reserva  
create trigger checkinPassageiro on Passageiro_Reserva
for insert as 
if (select tipo_checkin_p from inserted) = 1 
begin
	print 'check-in online realizado pelo passageiro'
end
else 
begin
	print 'check-in do passageiro realizado no balcão da companhia aérea'
end


-- trigger para atualizar o status da reserva para confirmada na tabela Gestao_Reserva ao inserir um novo registro de reserva
create trigger statusReservaConfirmada on Passageiro_Reserva
for insert as 
insert into Status_Reserva (ref_reserva, status_reserva) 
values((select ref_reserva from inserted), 'confirmada')
print 'reserva realizada com sucesso!' 

-- trigger para atualizar o status da reserva para cancelada na tabela Gestao_Reserva ao deletar um registro de reserva
create trigger statusReservaCancelada on Passageiro_Reserva
for delete as 
update Status_Reserva
set status_reserva = 'cancelada' where ref_reserva = (select ref_reserva from deleted)
print 'reserva cancelada com sucesso!'

-- trigger vender reserva, ao acrescentar a quantidade de reservas para determinado voo na tabela Reserva 
-- deverá ser decrementado do total de passagens disponiveis na tabela Voo
create trigger realizarReserva on Reserva
for insert as
update Voo
set passagens_disponiveis = passagens_disponiveis - (select quantidade_reservas from inserted)
where id_voo = (select ref_voo from inserted)
