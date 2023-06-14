using System;
//using System.IO;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
//using OpenQA.Selenium.Edge;

namespace FormValidator
{
    public class FormValidator
    {
        private IWebDriver driver;

        public FormValidator()
        {
            // Configurar o driver do Selenium (neste exemplo, usaremos o ChromeDriver)
            driver = new ChromeDriver();
            //driver = new EdgeDriver();
        }

        public void ValidateForm()
        {
            // Navegar até o formulário

            /*// Obtenha o diretório atual do seu projeto
            string currentDirectory = Directory.GetCurrentDirectory();

            // Combine o diretório atual com o caminho relativo para o seu formulário
            string formPath = Path.Combine(currentDirectory, "FormTestSelenium2023_2.html");

            // Navegue até o formulário
            driver.Navigate().GoToUrl(formPath);*/

            driver.Navigate().GoToUrl("C:/Users/coelh/Pessoal/TI/CURSOS/Selenium/TestSelenium2023/TestSelenium2003_1/FormTestSelenium2023_2.html");
            //driver.Navigate().GoToUrl("caminho/para/o/seu/formulario.html");

            // Preencher o formulário
            IWebElement nomeInput = driver.FindElement(By.Id("nome"));
            nomeInput.SendKeys("John Doe");

            IWebElement emailInput = driver.FindElement(By.Id("email"));
            emailInput.SendKeys("john.doe@example.com");

            IWebElement telefoneInput = driver.FindElement(By.Id("telefone"));
            telefoneInput.SendKeys("1234567890");

            IWebElement comentariosInput = driver.FindElement(By.Id("comentarios"));
            comentariosInput.SendKeys("Este é um comentário de exemplo.");

            // Enviar o formulário
            IWebElement enviarButton = driver.FindElement(By.XPath("//button[@type='submit']"));
            enviarButton.Click();

            // Aguardar um tempo para visualizar os resultados
            System.Threading.Thread.Sleep(3000);
        }

        public void Close()
        {
            // Fechar o driver do Selenium
            driver.Quit();
        }
    }
}