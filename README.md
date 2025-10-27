# 🚀 Docker Installation Guide: Ubuntu 25.04 (Plucky)

**Bem-vindo ao futuro da conteinerização\!** Siga este guia rápido e direto para implantar o **Docker Engine** na sua máquina com Ubuntu 25.04, garantindo que seu ambiente esteja pronto para rodar qualquer aplicação em contêineres leves.

> **Atenção:** Todos os comandos a seguir devem ser executados com privilégios de administrador (`sudo`).

-----

## Fase 1: Preparação do Sistema e Chaves de Segurança

É crucial garantir que seu sistema esteja atualizado e configurado para lidar com repositórios seguros via HTTPS.

### 1.1. Sincronização e Dependências

Atualizamos o índice de pacotes e instalamos as ferramentas necessárias para conexões seguras.

```bash
# Atualiza o índice de pacotes do sistema
sudo apt update

# Instala pacotes essenciais para HTTPS e CURL
sudo apt install -y ca-certificates curl
```

### 1.2. Configuração da Chave GPG do Docker

Adicionamos a chave de autenticação oficial do Docker para garantir que os pacotes que baixaremos sejam legítimos.

```bash
# Cria o diretório para as chaves, se necessário
sudo install -m 0755 -d /etc/apt/keyrings

# Baixa e salva a chave GPG oficial do Docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Define permissões de leitura para a chave
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

-----

## Fase 2: Adição do Repositório Docker

Agora, configuramos o sistema para buscar os pacotes do Docker diretamente do repositório oficial.

### 2.1. Adicionando o Repositório

Usamos o codinome do sistema (`plucky` para Ubuntu 25.04) para adicionar a linha correta ao `sources.list.d`.

```bash
# Adiciona o repositório oficial do Docker
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Se o comando acima falhar ou o codinome não for detectado, force 'plucky':
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu plucky stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 2.2. Atualização Final

Atualizamos o índice novamente para que o sistema reconheça o novo repositório.

```bash
# Atualiza o índice de pacotes pela última vez
sudo apt update
```

-----

## Fase 3: Instalação e Verificação

Chegou a hora de instalar o *core* do Docker e seus componentes essenciais.

### 3.1. Instalação dos Pacotes

```bash
# Instala o Docker Engine, CLI, containerd e plugins de build/compose
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### 3.2. Gerenciamento do Serviço

Garantimos que o Docker inicie com o sistema e o iniciamos imediatamente.

```bash
# Inicia o serviço Docker imediatamente
sudo systemctl start docker

# Habilita o Docker para iniciar automaticamente no boot
sudo systemctl enable docker
```

### 3.3. Teste de Validação (Hello World\!)

Vamos rodar um contêiner de teste para confirmar que tudo está funcionando perfeitamente.

```bash
# Roda o contêiner de teste. Se a mensagem aparecer, SUCESSO!
sudo docker run hello-world
```

-----

## Fase 4: Configurações Opcionais (Melhoria de Fluxo)

### 4.1. Uso sem `sudo` (Recomendado para o dia a dia)

Para evitar digitar `sudo` a cada comando `docker`, adicione seu usuário ao grupo `docker`.

```bash
# Adiciona o usuário atual ao grupo 'docker'
sudo usermod -aG docker $USER

echo "✅ Grupo 'docker' adicionado ao usuário. **SAIA E ENTRE NOVAMENTE NO TERMINAL** para aplicar a alteração."
```

### 4.2. Desativando a Confiança de Conteúdo (Content Trust)

Este passo ajusta uma variável de ambiente para desativar a verificação de assinatura de imagens, o que pode acelerar alguns processos se você não estiver em um ambiente corporativo restrito.

```bash
# Adiciona a variável ao arquivo de perfil do seu usuário
echo 'export DOCKER_CONTENT_TRUST=0' >> ~/.profile

# Se você estiver usando Bash, também adicione ao .bashrc
echo 'export DOCKER_CONTENT_TRUST=0' >> ~/.bashrc
```

-----

## ✨ FIM DA INSTALAÇÃO\!

Se você seguiu todos os passos, seu ambiente Docker está **otimizado e pronto** para rodar suas aplicações conteinerizadas\!
