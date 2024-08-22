import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:mobcidade_flutter/info_carro.dart';

class Explorar extends StatefulWidget {
  @override
  _ExplorarState createState() => _ExplorarState();
}

class _ExplorarState extends State<Explorar> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/meuvideo.mp4')
      ..initialize().then((_) {
        setState(() {}); // Atualiza a UI após a inicialização do vídeo
        _controller.play(); // Inicia a reprodução automática do vídeo
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xFF5CA170),
              padding: const EdgeInsets.only(top: 60), // Padding no topo da página
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                      const Spacer(flex: 2),
                      const Text(
                        'MobCidade',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    height: 180,
                    child: Stack(
                      children: [
                        VideoPlayer(_controller),
                        if (!_controller.value.isInitialized)
                          const Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Principais transportes',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildTransportCard('Ônibus', 'assets/onibus.jpeg'),
                        _buildTransportCard('Metrô', 'assets/metro.jpeg'),
                        _buildTransportCard('Táxi e Carro de aplicativo', 'assets/carro.png', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InfoCarro()),
                          );
                        }),
                        _buildTransportCard('Bicicleta', 'assets/bicicleta.png'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Novidades',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildTransportCard('Moto Táxi', 'assets/moto.webp'),
                        _buildTransportCard('Localize seu veículo', 'assets/localizacao.png'),
                        _buildTransportCard('Tempo de espera', 'assets/relogio.png'),
                        _buildTransportCard('Envie uma mensagem', 'assets/msg.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransportCard(String title, String imagePath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120, // Aumentar a largura do container para melhor quebrar o texto
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
