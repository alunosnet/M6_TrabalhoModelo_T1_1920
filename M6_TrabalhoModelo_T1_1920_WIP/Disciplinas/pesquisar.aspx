<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pesquisar.aspx.cs" Inherits="M6_TrabalhoModelo_T1_1920_WIP.Disciplinas.pesquisar" %>

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
            Nome da disciplina a pesquisar:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Pesquisar" />
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="codigo">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label Text='<%# Eval("codigo") %>' runat="server" ID="codigoLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("nr_modulos") %>' runat="server" ID="nr_modulosLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("ano_escolaridade") %>' runat="server" ID="ano_escolaridadeLabel" /></td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                        </td>
                        <td>
                            <asp:Label Text='<%# Eval("codigo") %>' runat="server" ID="codigoLabel1" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("nr_modulos") %>' runat="server" ID="nr_modulosTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("ano_escolaridade") %>' runat="server" ID="ano_escolaridadeTextBox" /></td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>Não foram encontrados dados.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                            <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("nr_modulos") %>' runat="server" ID="nr_modulosTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("ano_escolaridade") %>' runat="server" ID="ano_escolaridadeTextBox" /></td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label Text='<%# Eval("codigo") %>' runat="server" ID="codigoLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("nr_modulos") %>' runat="server" ID="nr_modulosLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("ano_escolaridade") %>' runat="server" ID="ano_escolaridadeLabel" /></td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" style="" border="0">
                                    <tr runat="server" style="">
                                        <th runat="server">codigo</th>
                                        <th runat="server">nome</th>
                                        <th runat="server">nr_modulos</th>
                                        <th runat="server">ano_escolaridade</th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label Text='<%# Eval("codigo") %>' runat="server" ID="codigoLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("nr_modulos") %>' runat="server" ID="nr_modulosLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("ano_escolaridade") %>' runat="server" ID="ano_escolaridadeLabel" /></td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionStringTrabalhoModelo %>' SelectCommand="SELECT * FROM [disciplinas] WHERE ([nome] LIKE '%' + @nome + '%')">
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
