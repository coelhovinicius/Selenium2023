// Função para validar o formulário
function validarFormulario() {
  // Obter os valores dos campos
  var nome = document.getElementById('nome').value;
  var email = document.getElementById('email').value;
  var telefone = document.getElementById('telefone').value;
  var comentarios = document.getElementById('comentarios').value;

  // Verificar o campo Nome
  if (nome === '' || /^\d/.test(nome)|| nome.length < 3) {
    exibirErro('nome', 'Nome inválido');
    return false;
  }

  // Verificar o campo E-mail
  if (email === '' || !validarEmail(email)) {
    exibirErro('email', 'E-mail inválido');
    return false;
  }

  // Verificar o campo Telefone
  if (telefone !== '' && !validarTelefone(telefone)) {
    exibirErro('telefone', 'Telefone inválido');
    return false;
  }

  // Verificar o campo Comentários
  if (comentarios.length > 1000) {
    exibirErro('comentarios', 'O limite é de 1000 caracteres');
    return false;
  }

  // Se todos os campos estiverem válidos, enviar o formulário
  alert('Formulário enviado com sucesso!');
  return true;
}

// Função para validar o formato de e-mail
function validarEmail(email) {
  var padraoEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})+$/;
  return padraoEmail.test(email);
}

// Função para validar o formato de telefone
function validarTelefone(telefone) {
  var padraoTelefone = /^\+?\d{1,3}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,5}[-.\s]?\d{1,5}$/;
  return padraoTelefone.test(telefone);
}

// Função para exibir mensagens de erro
function exibirErro(campo, mensagem) {
  var elementoErro = document.getElementById(campo + '-erro');
  elementoErro.innerHTML = mensagem;
  elementoErro.style.display = 'block';
}

// Event listener para o envio do formulário
var formulario = document.getElementById('meu-formulario');
formulario.addEventListener('submit', function(event) {
  event.preventDefault(); // Impede o envio padrão do formulário
  validarFormulario();
});