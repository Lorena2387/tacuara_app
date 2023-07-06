import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Política de privacidad',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'La aplicación móvil del Alojamiento Tacuara se ha creado para proporcionar una mejor experiencia de usuarios a nuestros huespedes. Esta Política de privacida explica cómo utilizamos la información personal que recopilamos de los usuarios de la aplicación. Al utilizar la aplicación, aceptas esta política de privacidad y aceptas la recopilación, el uso y la divulgación de de tu información personal como se describe en está política.',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '1. Información que recopilamos\n Podemos recopilar información personal sobre ti cuando utilizas la aplicación, como tu dirección de correo electrónico y detalles de la reserva de la cabaña.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  '2. Uso de la información\n Utilizamos la información recopilada para proporcionar y mejorar nuestros servicios, procesar tus reservas y proporcionarte información del Hotel. También podemos utilizar la información para comunicarnos contigo sobre nuestros servicios y promociones.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  '3. Divulgación de la información\n No compartimos información personal con terceros, excepto cuando sea necesario para proporcionar los servicios que ha solicitado o cuando la Ley lo requiera.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  '4. Seguridad de la información\n Tomamos medidas razonables para proteger la información personal que recopilamos de la aplicación. Sin embargo, no podemos garantizar la seguridad completa de la información transmitida a travez de internet. La información se almacenará en un servidor en la nube.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  '5. Derechos del usuario\n El usuario puede ejercer sus derechos de privacidad, incluido el acceso y eliminación de sus datos personales.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  '6. Cambios en la política de privacidad\n Podemos actualizar esta política en cualquier momento y sin previo aviso. Cualquier cambio en la Política de privacidad, se publicará en la aplicación.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
