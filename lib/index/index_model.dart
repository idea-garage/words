import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flip_card/flip_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class IndexModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String coverPhoto =
      'https://images.unsplash.com/photo-1528114039593-4366cc08227d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aXRhbHl8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60';

  dynamic word;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getUnsplashPhoto] action in Index widget.
  String? photo1;
  // Stores action output result for [Custom Action - getRandomWord] action in Index widget.
  dynamic? word1;
  // Stores action output result for [Custom Action - getUnsplashPhoto] action in IconButton widget.
  String? photo1Copy;
  // Stores action output result for [Custom Action - getRandomWord] action in IconButton widget.
  dynamic? word1Copy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
