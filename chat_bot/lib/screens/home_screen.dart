import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBot App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/photo.jpg',
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'Universidad XYZ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Ingeniería en Sistemas Computacionales',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                'Materia: Desarrollo de Aplicaciones Móviles',
                style: TextStyle(fontSize: 16),
              ),
              const Text('Grupo: XYZ123'),
              const SizedBox(height: 20),
              const Text(
                'Alumno: Nombre del Alumno',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                'Matrícula: 123456',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  const url = 'https://github.com/MariaJoseDominguezCosta/chat_bot';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: const Text(
                  'Ver repositorio en GitHub',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chat');
                },
                child: const Text('Iniciar Chat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}