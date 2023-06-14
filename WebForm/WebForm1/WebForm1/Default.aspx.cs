using System;
using System.Web.UI;

namespace WebForms
{
    public partial class FormularioWeb : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void EnviarButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Processar os dados enviados
                string nome = NomeTextBox.Text;
                string email = EmailTextBox.Text;
                string telefone = TelefoneTextBox.Text;
                string comentarios = ComentariosTextBox.Text;

                // Exemplo: exibir os dados em uma mensagem de sucesso
                string mensagem = "Formulário enviado com sucesso! Dados informados:<br>";
                mensagem += "Nome: " + nome + "<br>";
                mensagem += "E-mail: " + email + "<br>";
                mensagem += "Telefone: " + telefone + "<br>";
                mensagem += "Comentários: " + comentarios + "<br>";

                ResultadoLabel.Text = mensagem;
            }
        }

        protected void LimparButton_Click(object sender, EventArgs e)
        {
            NomeTextBox.Text = string.Empty;
            EmailTextBox.Text = string.Empty;
            TelefoneTextBox.Text = string.Empty;
            ComentariosTextBox.Text = string.Empty;
            ResultadoLabel.Text = string.Empty;
        }
    }
}