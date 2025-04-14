#!/bin/bash

echo "🚀 Instalando Gmail-MCP-Server..."

if ! command -v node &> /dev/null; then
  echo "❌ Node.js não está instalado. Instale antes de continuar: https://nodejs.org/"
  exit 1
fi

git clone https://github.com/quanthumai/gmail-mcp.git Gmail-MCP-Server
cd Gmail-MCP-Server || exit

echo "📦 Instalando dependências com npm..."
npm install

if [ ! -f "./gcp-oauth.keys.json" ]; then
  echo ""
  echo "⚠️ Falta o arquivo 'gcp-oauth.keys.json'!"
  echo "↪️ Vá até o Google Cloud Console, ative a API do Gmail, gere o JSON e coloque-o nesta pasta."
  echo ""
  echo "🔄 Depois rode manualmente:"
  echo "   cd Gmail-MCP-Server"
  echo "   npx @gongrzhe/server-gmail-autoauth-mcp auth"
  exit 0
fi

echo "🔐 Autenticando com o Google..."
npx @gongrzhe/server-gmail-autoauth-mcp auth

echo ""
echo "✅ Pronto! Para iniciar o servidor, digite:"
echo "   npx @gongrzhe/server-gmail-autoauth-mcp"

