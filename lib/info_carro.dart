import 'package:flutter/material.dart';

class InfoCarro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0), // Padding no topo da página
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: const Color(0xFF5CA170),
                ),
              ),
              Image.asset(
                'assets/carroinfo.jpeg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 15),
              const Text(
                'Táxis e Carros de Aplicativo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Em São Paulo, os táxis e carros de aplicativo representam uma parte fundamental do sistema de mobilidade urbana, oferecendo uma alternativa conveniente e acessível ao transporte público. Com a crescente demanda por serviços que oferecem flexibilidade e conforto, esses modais se tornaram indispensáveis para residentes e visitantes.\n\nOs táxis na cidade estão disponíveis 24 horas por dia e podem ser facilmente acessados em pontos estratégicos, como aeroportos, estações ferroviárias, hotéis e centros comerciais. Além disso, muitas cooperativas e empresas de táxi agora oferecem aplicativos próprios, que permitem aos usuários solicitar corridas, escolher rotas e até mesmo realizar o pagamento de maneira digital, tornando a experiência mais prática e segura.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Ação do botão
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5CA170),
                  foregroundColor: Colors.white, // Cor da fonte do botão
                ),
                child: const Text('Escolher uma corrida'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
