import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'container_config_provider.dart';

class ConfigurableContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = context.watch<ContainerConfigProvider>();
    return Container(
      width: config.width,
      height: config.height,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(config.borderRadius),
        ),
      ),
    );
  }
}