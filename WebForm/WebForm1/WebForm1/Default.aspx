﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebForm1._Default" %>

<!DOCTYPE html>
<html>
<head>
    <title>Formulário de Contato</title>
    <style>
        /* Estilos CSS para o formulário */
        body {
            font-family: Arial, sans-serif;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 5px;
            margin-top: 5px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
        }
    </style>
</head>
<body>
    <form runat="server">
        <label for="txtNome">Nome:</label>
        <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome"
            ErrorMessage="Campo obrigatório" Text="*" CssClass="error-message"></asp:RequiredFieldValidator>

        <label for="txtEmail">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="Campo obrigatório" Text="*" CssClass="error-message"></asp:RequiredFieldValidator>

        <label for="txtTelefone">Telefone:</label>
        <asp:TextBox ID="txtTelefone" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTelefone" runat="server" ControlToValidate="txtTelefone"
            ErrorMessage="Campo obrigatório" Text="*" CssClass="error-message"></asp:RequiredFieldValidator>

        <label for="txtMensagem">Mensagem:</label>
        <asp:TextBox ID="txtMensagem" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvMensagem" runat="server" ControlToValidate="txtMensagem"
            ErrorMessage="Campo obrigatório" Text="*" CssClass="error-message"></asp:RequiredFieldValidator>

        <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />

        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error-message" />
        </div>
    </form>

    <script>
        // Adiciona estilos e comportamento interativo ao formulário

        // Estiliza os campos de entrada ao receberem foco
        var inputs = document.querySelectorAll("input, textarea");
        inputs.forEach(function (input) {
            input.addEventListener("focus", function () {
                this.style.border = "2px solid #4CAF50";
            });
            input.addEventListener("blur", function () {
                this.style.border = "1px solid #ccc";
            });
        });

        // Exibe uma mensagem de sucesso após o envio do formulário
        var form = document.querySelector("form");
        form.addEventListener("submit", function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
            }

            // Simula um carregamento antes de exibir a mensagem de sucesso
            var loader = document.createElement("div");
            loader.innerText = "Enviando...";
            loader.style.color = "#4CAF50";
            form.appendChild(loader);

            setTimeout(function () {
                form.reset(); // Limpa o formulário
                form.removeChild(loader);
                alert("O formulário foi enviado com sucesso!");
            }, 2000);
        });
    </script>
</body>
</html>
