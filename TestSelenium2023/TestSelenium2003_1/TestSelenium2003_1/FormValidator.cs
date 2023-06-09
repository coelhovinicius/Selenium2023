using System;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace FormValidator
{
    public class FormValidator
    {
        private IWebDriver driver;

        public FormValidator()
        {
            // Configurar o driver do Selenium (neste exemplo, usaremos o ChromeDriver)
            driver = new ChromeDriver();
        }

        public void ValidateForm()
        {
            // Navegar até o formulário
            driver.Navigate().GoToUrl("caminho/para/o/seu/formulario.html");

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
