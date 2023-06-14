<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioWeb.aspx.cs" Inherits="WebForms.FormularioWeb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Formulário Web</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto;
        }

        .form-container h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-control.invalid {
            border: 2px solid red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h1>Formulário Web</h1>
            <asp:Label ID="ResultadoLabel" runat="server" EnableViewState="false"></asp:Label>
            <!-- <br /> -->
            <div class="form-group">
                <asp:Label ID="NomeLabel" runat="server" Text="Nome:" AssociatedControlID="NomeTextBox"></asp:Label>
                <asp:TextBox ID="NomeTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="NomeValidator" runat="server" ControlToValidate="NomeTextBox" ErrorMessage="O campo Nome é obrigatório." Text="*" ValidationGroup="formValidation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="NomeRegexValidator" runat="server" ControlToValidate="NomeTextBox" ErrorMessage="O campo Nome deve iniciar com letra e conter entre 2 e 100 caracteres." ValidationExpression="^[A-Za-z][A-Za-z\s]{1,99}$" Text="*" ValidationGroup="formValidation"></asp:RegularExpressionValidator>
            </div>
           <!-- <br /> -->
            <div class="form-group">
                <asp:Label ID="EmailLabel" runat="server" Text="E-mail:" AssociatedControlID="EmailTextBox"></asp:Label>
                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="O campo E-mail é obrigatório." Text="*" ValidationGroup="formValidation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailRegexValidator" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Digite um e-mail válido." ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Text="*" ValidationGroup="formValidation"></asp:RegularExpressionValidator>
            </div>
           <!-- <br /> -->
            <div class="form-group">
                <asp:Label ID="TelefoneLabel" runat="server" Text="Telefone:" AssociatedControlID="TelefoneTextBox"></asp:Label>
                <asp:TextBox ID="TelefoneTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="TelefoneValidator" runat="server" ControlToValidate="TelefoneTextBox" ErrorMessage="O campo Telefone é obrigatório." Text="*" ValidationGroup="formValidation"></asp:RequiredFieldValidator>
            </div>
           <!-- <br /> -->
            <div class="form-group">
                <asp:Label ID="ComentariosLabel" runat="server" Text="Comentários:" AssociatedControlID="ComentariosTextBox"></asp:Label>
                <asp:TextBox ID="ComentariosTextBox" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" style="resize: none"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ComentariosValidator" runat="server" ControlToValidate="ComentariosTextBox" ErrorMessage="O campo Comentários é obrigatório." Text="*" ValidationGroup="formValidation"></asp:RequiredFieldValidator>
            </div>
           <!-- <br /> -->
            <div class="text-center">
                <asp:Button ID="EnviarButton" runat="server" Text="Enviar" OnClick="EnviarButton_Click" ValidationGroup="formValidation" CssClass="btn btn-primary" />
                <asp:Button ID="LimparButton" runat="server" Text="Limpar" OnClick="LimparButton_Click" CssClass="btn btn-secondary" />
            </div>
        </div>
    </form>
</body>
</html>