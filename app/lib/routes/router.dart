import 'package:flutter/material.dart';

import '../screens/glossary.dart';
import '../screens/settings.dart';
import '../styles/styles_preview.dart';
import 'routes.dart';

Map<String, WidgetBuilder> router = {
  kGlossaryRoute: (context) => Glossary(),
  kSettingsRoute: (context) => Settings(),
  kStylesPreviewRoute: (context) => StylesPreview(),
};
