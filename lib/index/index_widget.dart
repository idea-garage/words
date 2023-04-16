import '/backend/supabase/supabase.dart';
import '/components/information_widget.dart';
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
import 'index_model.dart';
export 'index_model.dart';

class IndexWidget extends StatefulWidget {
  const IndexWidget({Key? key}) : super(key: key);

  @override
  _IndexWidgetState createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget>
    with TickerProviderStateMixin {
  late IndexModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1850.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndexModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.getCurrentUser();
      _model.photo1 = await actions.getUnsplashPhoto(
        FFAppState().UnsplashAccessKey,
        FFAppState().UnsplashAccessSecret,
        'sky',
      );
      setState(() {
        _model.coverPhoto = _model.photo1!;
      });
      _model.word1 = await actions.getRandomWord();
      setState(() {
        _model.word = _model.word1;
      });
      if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
        await animationsMap['containerOnActionTriggerAnimation1']!
            .controller
            .forward(from: 0.0);
      }
      if (FFAppState().mood != null && FFAppState().mood != '') {
        if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
          await animationsMap['containerOnActionTriggerAnimation2']!
              .controller
              .forward(from: 0.0);
        }
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                _model.coverPhoto,
              ),
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 1.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x00090F13), Color(0xCB1D2429)],
                    stops: [0.0, 0.5],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Lottie.asset(
                      'assets/lottie_animations/cherry01.json',
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      fit: BoxFit.cover,
                      frameRate: FrameRate(8.0),
                      animate: true,
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0x34FFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 500.0,
                        constraints: BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 800.0,
                                ),
                                decoration: BoxDecoration(),
                                child: FlipCard(
                                  fill: Fill.fillBack,
                                  direction: FlipDirection.HORIZONTAL,
                                  speed: 800,
                                  front: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Spacer(),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 32.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  _model.word,
                                                  r'''$.word''',
                                                ).toString(),
                                                '明鏡止水',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displayLarge
                                                  .override(
                                                    fontFamily: 'NotoSerifJP',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 5.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 32.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                _model.word,
                                                r'''$.word_en''',
                                              ).toString(),
                                              'meikyosisui',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'NotoSerifJP',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 18.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Spacer(),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  _model.word,
                                                  r'''$.summary_en''',
                                                ).toString(),
                                                'meikyosisui',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'NotoSerifJP',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 16.0,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  back: Container(
                                    width: double.infinity,
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 32.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  _model.word,
                                                  r'''$.word''',
                                                ).toString(),
                                                '明鏡止水',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displayLarge
                                                  .override(
                                                    fontFamily: 'NotoSerifJP',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 32.0,
                                                    letterSpacing: 5.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 32.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                _model.word,
                                                r'''$.pronunce_jp''',
                                              ).toString(),
                                              'Pure and calm',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'NotoSerifJP',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              _model.word,
                                              r'''$.pronunce_en''',
                                            ).toString(),
                                            'Pure and calm',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'NotoSerifJP',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 24.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .maximumBlueGreen,
                                            borderRadius: 30.0,
                                            borderWidth: 3.0,
                                            buttonSize: 60.0,
                                            icon: Icon(
                                              Icons.record_voice_over,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 30.0,
                                            ),
                                            onPressed: () async {
                                              await actions.textToSpeechJp(
                                                getJsonField(
                                                  _model.word,
                                                  r'''$.word''',
                                                ).toString(),
                                              );
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1000));
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500));
                                              await actions.textToSpeech(
                                                context,
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    _model.word,
                                                    r'''$.desc_en''',
                                                  ).toString(),
                                                  'Pure and calm',
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      getJsonField(
                                                        _model.word,
                                                        r'''$.desc_en''',
                                                      ).toString(),
                                                      '-',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'NotoSerifJP',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'containerOnActionTriggerAnimation1']!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FutureBuilder<List<WordsMoodRow>>(
                          future: WordsMoodTable().queryRows(
                            queryFn: (q) => q,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              );
                            }
                            List<WordsMoodRow> listViewWordsMoodRowList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listViewWordsMoodRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewWordsMoodRow =
                                    listViewWordsMoodRowList[listViewIndex];
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 4.0, 0.0),
                                    child: InkWell(
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().mood =
                                              listViewWordsMoodRow.mood!;
                                        });
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation2'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation2']!
                                              .controller
                                              .forward(from: 0.0);
                                        }

                                        context.pushNamed(
                                          'Index',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                            ),
                                          },
                                        );
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                        width: 100.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            if (FFAppState().mood ==
                                                listViewWordsMoodRow.mood)
                                              AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 600),
                                                curve: Curves.easeInOut,
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0x00FFFFFF),
                                                      Color(0x3BFFFFFF),
                                                      Color(0x00FFFFFF)
                                                    ],
                                                    stops: [0.0, 0.5, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, 0.64),
                                                    end: AlignmentDirectional(
                                                        -1.0, -0.64),
                                                  ),
                                                ),
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'containerOnActionTriggerAnimation2']!,
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  listViewWordsMoodRow.mood,
                                                  '-',
                                                ),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'NotoSerifJP',
                                                      color: FFAppState()
                                                                  .mood ==
                                                              listViewWordsMoodRow
                                                                  .mood
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (MediaQuery.of(context).size.width < 0.0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: Color(0x25384A57),
                          icon: Icon(
                            Icons.refresh,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            context.goNamed(
                              'Index',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );

                            FFAppState().reloaded = FFAppState().reloaded + 1;
                            if (FFAppState().reloaded >= 10) {
                              context.pushNamed(
                                'Login',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );
                            }
                            _model.photo1Copy = await actions.getUnsplashPhoto(
                              FFAppState().UnsplashAccessKey,
                              FFAppState().UnsplashAccessSecret,
                              'sky',
                            );
                            setState(() {
                              _model.coverPhoto = _model.photo1!;
                            });
                            _model.word1Copy = await actions.getRandomWord();
                            setState(() {
                              _model.word = _model.word1;
                            });
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation1'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation1']!
                                  .controller
                                  .forward(from: 0.0);
                            }

                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Color(0x25384A57),
                            icon: Icon(
                              Icons.info,
                              color: FlutterFlowTheme.of(context).lineColor,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (bottomSheetContext) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_unfocusNode),
                                    child: Padding(
                                      padding: MediaQuery.of(bottomSheetContext)
                                          .viewInsets,
                                      child: InformationWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Color(0x25384A57),
                            icon: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: FlutterFlowTheme.of(context).lineColor,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              await launchURL(
                                  'https://twitter.com/share?text=日本の四字熟語の意味をAIが英語で解説するミニアプリを見つけました。I found a mini app that AI explains the meaning of Japanese four-character idioms in English.&url=https://words.flutterflow.app/');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
