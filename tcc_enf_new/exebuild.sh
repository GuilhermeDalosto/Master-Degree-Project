
#!/bin/bash

# Limpa e gera build web atualizado
flutter clean
flutter pub get
flutter build web

# Serve a pasta build/web na porta 8000
cd build/web
python3 -m http.server 8000
