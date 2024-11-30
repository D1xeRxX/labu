import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'container_config_provider.dart';
import 'section_slider.dart';
import 'configurable_container.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = context.watch<ContainerConfigProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo Home Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Повзунки для налаштування
            SectionSlider(
              label: 'Width',
              value: config.width,
              onChanged: (value) => config.setWidth(value),
            ),
            SectionSlider(
              label: 'Height',
              value: config.height,
              onChanged: (value) => config.setHeight(value),
            ),
            SectionSlider(
              label: 'Radius',
              value: config.borderRadius,
              onChanged: (value) => config.setBorderRadius(value),
            ),

            // Піднімаємо контейнер
            SizedBox(height: 20), // Додаємо відступ між секціями
            ConfigurableContainer(),
            Spacer(), // Штовхаємо контейнер вгору
          ],
        ),
      ),
    );
  }
}