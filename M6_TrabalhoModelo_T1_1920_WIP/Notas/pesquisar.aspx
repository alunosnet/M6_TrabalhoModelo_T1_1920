﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pesquisar.aspx.cs" Inherits="M6_TrabalhoModelo_T1_1920_WIP.Notas.pesquisar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="/CSS/css.css" rel="stylesheet" />
</head>
<body>
     <!--Menu-->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="/index.aspx">SI - Módulo 6</a>
        <!--Botão hamburguer-->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!--Botão hamburguer-->
        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <!--Alunos-->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Alunos</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="/Alunos/adicionar.aspx">Adicionar</a>
                        <a class="dropdown-item" href="/Alunos/gerir.aspx">Gerir</a>
                        <a class="dropdown-item" href="/Alunos/pesquisar.aspx">Pesquisar</a>
                    </div>
                </li>
                <!--Alunos-->
                <!--Disciplinas-->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Disciplinas</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown02">
                        <a class="dropdown-item" href="/Disciplinas/adicionar.aspx">Adicionar</a>
                        <a class="dropdown-item" href="/Disciplinas/gerir.aspx">Gerir</a>
                        <a class="dropdown-item" href="/Disciplinas/pesquisar.aspx">Pesquisar</a>
                    </div>
                </li>
                <!--Disciplinas-->
                <!--Notas-->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Notas</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown03">
                        <a class="dropdown-item" href="/Notas/adicionar.aspx">Adicionar</a>
                        <a class="dropdown-item" href="/Notas/gerir.aspx">Gerir</a>
                        <a class="dropdown-item" href="/Notas/pesquisar.aspx">Pesquisar</a>
                    </div>
                </li>
                <!--Notas-->
                <!--Estatísticas-->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Estatísticas</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item"  href="/Consultas/media_aluno.aspx">Média por aluno</a>
                        <a class="dropdown-item"  href="/Consultas/melhor_aluno.aspx">Melhor aluno</a>
                        <a class="dropdown-item"  href="/Consultas/nr_notas_disciplina.aspx">Nr de Notas Por Disciplina</a>
                    </div>
                </li>
                <!--Estatísticas-->
            </ul>
        </div>
    </nav>
    <!--Menu-->
    <form id="form1" runat="server">
        <div class="container">
            Aluno:<asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="SqlAlunos" DataTextField="nome" DataValueField="nprocesso" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionStringTrabalhoModelo %>' SelectCommand="SELECT [nome], [nprocesso] FROM [alunos] ORDER BY [nome]"></asp:SqlDataSource>
            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="nr_nota" DataSourceID="SqlNotas">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                    <asp:BoundField DataField="nr_nota" HeaderText="nr_nota" ReadOnly="True" InsertVisible="False" SortExpression="nr_nota"></asp:BoundField>
                    <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" SortExpression="nprocesso" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="codigo_disciplina" HeaderText="codigo_disciplina" SortExpression="codigo_disciplina" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataFormatString="{0:dd-MM-yyyy}" DataField="data_nota" HeaderText="data_nota" SortExpression="data_nota"></asp:BoundField>
                    <asp:BoundField DataField="nr_modulo" HeaderText="nr_modulo" SortExpression="nr_modulo"></asp:BoundField>
                    <asp:BoundField DataField="nota" HeaderText="nota" SortExpression="nota"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionStringTrabalhoModelo %>' DeleteCommand="delete from notas where nr_nota=@nr_nota" SelectCommand="SELECT nr_nota, nprocesso, codigo_disciplina, data_nota, nr_modulo, nota FROM notas WHERE (nprocesso = @nprocesso)" UpdateCommand="UPDATE notas SET data_nota = @data_nota, nr_modulo = @nr_modulo, nota = @nota WHERE (nr_nota = @nr_nota)">
                <DeleteParameters>
                    <asp:Parameter Name="nr_nota"></asp:Parameter>
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="nprocesso"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="data_nota" DbType="Date"></asp:Parameter>
                    <asp:Parameter Name="nr_modulo"></asp:Parameter>
                    <asp:Parameter Name="nota"></asp:Parameter>
                    <asp:Parameter Name="nr_nota"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
    <script src="/Js/jquery-3.3.1.slim.min.js"></script>
    <script src="/Js/popper.min.js"></script>
    <script src="/Js/bootstrap.min.js"></script>
</body>
</html>