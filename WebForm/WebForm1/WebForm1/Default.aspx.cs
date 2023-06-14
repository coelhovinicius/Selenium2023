using System;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace WebForm1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                // Se o formulário foi enviado, não é necessário fazer nada aqui
                return;
            }

            // Limpar campos do formulário
            txtNome.Text = "";
            txtEmail.Text = "";
            txtTelefone.Text = "";
            txtMensagem.Text = "";
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string nome = SanitizeInput(txtNome.Text);
            string email = SanitizeInput(txtEmail.Text);
            string telefone = SanitizeInput(txtTelefone.Text);
            string mensagem = SanitizeInput(txtMensagem.Text);

            if (string.IsNullOrEmpty(nome) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(telefone) || string.IsNullOrEmpty(mensagem))
            {
                Response.Write("<script>alert('Por favor, preencha todos os campos do formulário.');</script>");
                return;
            }

            if (!IsValidEmail(email))
            {
                Response.Write("<script>alert('Por favor, insira um endereço de email válido.');</script>");
                return;
            }

            string server = "localhost";
            string database = "webform1";
            string userid = "developer";
            string password = "VinI1304/CoelhO2759";
            string connectionString = $"server={server};database={database};userid={userid};password={password};";

            using (MySqlConnection mySqlConnection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand())
                {
                    try
                    {
                        mySqlConnection.Open();
                        command.Connection = mySqlConnection;

                        string query = "INSERT INTO comentarios (nome, email, telefone, mensagem) VALUES (@nome, @email, @telefone, @mensagem)";
                        command.CommandText = query;
                        command.Parameters.Add("@nome", MySqlDbType.VarChar).Value = nome;
                        command.Parameters.Add("@email", MySqlDbType.VarChar).Value = email;
                        command.Parameters.Add("@telefone", MySqlDbType.VarChar).Value = telefone;
                        command.Parameters.Add("@mensagem", MySqlDbType.Text).Value = mensagem;

                        command.ExecuteNonQuery();

                        // Limpar campos do formulário após o envio
                        txtNome.Text = "";
                        txtEmail.Text = "";
                        txtTelefone.Text = "";
                        txtMensagem.Text = "";

                        Response.Write("<script>alert('O formulário foi enviado com sucesso!');</script>");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Ocorreu um erro ao processar o formulário. Por favor, tente novamente.');</script>");
                        // Aqui você pode lidar com a exceção de acordo com a sua necessidade
                    }
                }
            }
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private string SanitizeInput(string input)
        {
            // Remover caracteres especiais que podem ser utilizados para injeção de SQL
            input = input.Replace("'", "");
            input = input.Replace(";", "");
            input = input.Replace("--", "");

            // Outras sanitizações necessárias, se aplicável

            return input;
        }
    }
}
