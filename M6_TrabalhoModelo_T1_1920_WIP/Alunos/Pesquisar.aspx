<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pesquisar.aspx.cs" Inherits="M6_TrabalhoModelo_T1_1920_WIP.Alunos.Pesquisar" %>

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
            <h1>Pesquisar</h1>
            Nome a pesquisar:<asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox><asp:Button CssClass="btn btn-lg btn-info" ID="Button1" runat="server" Text="Pesquisar" />
            <asp:GridView EmptyDataText="Não foram encontrados alunos" CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="nprocesso" DataSourceID="SqlAlunos">
                <Columns>
                    <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" ReadOnly="True" InsertVisible="False" SortExpression="nprocesso"></asp:BoundField>
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
                    <asp:BoundField DataField="data_nascimento" HeaderText="data_nascimento" SortExpression="data_nascimento"></asp:BoundField>
                    <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero"></asp:BoundField>
                    <asp:BoundField DataField="morada" HeaderText="morada" SortExpression="morada"></asp:BoundField>
                    <asp:BoundField DataField="cp" HeaderText="cp" SortExpression="cp"></asp:BoundField>
                    <asp:BoundField DataField="localidade" HeaderText="localidade" SortExpression="localidade"></asp:BoundField>
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionStringTrabalhoModelo %>' SelectCommand="SELECT [nprocesso], [nome], [data_nascimento], [genero], [morada], [cp], [localidade], [email] FROM [alunos] WHERE ([nome] LIKE '%' + @nome + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
    <script src="/Js/jquery-3.3.1.slim.min.js"></script>
    <script src="/Js/popper.min.js"></script>
    <script src="/Js/bootstrap.min.js"></script>
</body>
</html>
