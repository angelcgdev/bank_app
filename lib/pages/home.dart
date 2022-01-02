import 'dart:ui';

import 'package:bank_app/data/cards.dart';
import 'package:bank_app/helpers/no_glow.dart';
import 'package:bank_app/pages/add_card.dart';
import 'package:bank_app/style/consts.dart';
import 'package:bank_app/widgets/background.dart';
import 'package:bank_app/widgets/bank_card.dart';
import 'package:bank_app/widgets/hole.dart';
import 'package:bank_app/widgets/indicator.dart';
// import 'package:bank_app/widgets/info_user.dart';
import 'package:bank_app/widgets/info_user_on_bacground.dart';
import 'package:bank_app/widgets/transactions.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin{
  late AnimationController _animationController;


  late PageController _pageController;
  double _percenCard =  0.85;

  double _percentPaddingCard = 1.0;

  // get the visibility percentage of fixed items
  final _limitVisible = 0.7;
  final _limitVisibleRange = 1.0;
  double _visibleRangeSideRigthPercent = 1.0;

  // offset background card position
  final _limitTraslate = 1.0;
  final _initPositionTraslate = 2.0;
  double _firstCardSideLeftClamp = 1.0;

  double _percentProgressRightSide = 0;

  // top widget
  final double _percentWidgetInfoUser = 0.25;
  final double _percentWidgetIndicator = 0.05;
  late double _initialTopPositionWidgetInfoUser;
  late double _intialHeightWidgetInfoUser; 

  // bottom widget
  final double _percentWidgetBottom = 0.18;

  // padding firstCard
  final double _paddingFirstCard = defaultPadding/2;

  double _page = 1;
  double _pageClamp = 1;
  late Size _size;
  /// indicates the height of the screen minus the status bar
  late double _availableHeight;
  late ThemeData _theme;
  late double _visiblePercent = 1.0;
  double _addCardPositionDx = 0;
  late double _sizeStatusBar;


  // indicator
  late double _topPositionIndicator;

  // cards
  late double _topPositionCards;
  late double _buttomPositionCards;

  // card in background
  late double _topPositionCardInBackground;
  late double _buttomPositionInBackground;

  // geture detector
  double _fisrtLocalPosition = 0;


  double _percentVisibleAddCardChild = 0;

  // late TextStyle _styleTextHello;
  
  // test
  // OverlayEntry? sticky;
  // GlobalKey stickyKey = GlobalKey();
  // late double _heightText;



  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sizeStatusBar = MediaQuery.of(context).padding.top;
    _size = MediaQuery.of(context).size;
    _availableHeight = _size.height - _sizeStatusBar;
    _initialTopPositionWidgetInfoUser = _sizeStatusBar + defaultPadding/2;

    _intialHeightWidgetInfoUser = (_availableHeight * _percentWidgetInfoUser)-_initialTopPositionWidgetInfoUser;
    _theme = Theme.of(context);
    _percenCard = (_size.width - (defaultPadding*2))/_size.width;
    _pageController = PageController(
      viewportFraction: _percenCard,
      initialPage: 1
    );
    _pageController.addListener(_pageListener);
    _topPositionCards = _page == 0 ? 0 : (_availableHeight * (_percentWidgetInfoUser+_percentWidgetIndicator));
    _buttomPositionCards = _page == 0 ? 0 : _availableHeight * _percentWidgetBottom;
    _topPositionIndicator = _intialHeightWidgetInfoUser + _initialTopPositionWidgetInfoUser;
    _topPositionCardInBackground = _pageClamp * (_availableHeight * (_percentWidgetInfoUser+_percentWidgetIndicator)+15);
    _buttomPositionInBackground = _pageClamp * (_availableHeight * _percentWidgetBottom+15);
    // _styleTextHello = TextStyle( fontSize: 30, fontFamily: 'Poppins', fontWeight: FontWeight.w500, color: _theme.colorScheme.primary);
    
    // _heightText = _renderParagraph.getMaxIntrinsicHeight(30).ceilToDouble();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }


  void _pageListener (){
    setState(() {
      _page = _pageController.page!;
      _pageClamp = _page.clamp(0, 1);
      _percentProgressRightSide = _getPercent(_pageClamp, 0, 1);
      _percentVisibleAddCardChild = _getPercent(_pageClamp, 0, .1);
      _visibleRangeSideRigthPercent = _page.clamp(_limitVisible, _limitVisibleRange);
      _visiblePercent = _getPercent(_visibleRangeSideRigthPercent, _limitVisibleRange,  _limitVisible);
      _firstCardSideLeftClamp = _page.clamp(_limitTraslate, _initPositionTraslate);
      _addCardPositionDx = _getPercent(_firstCardSideLeftClamp, _initPositionTraslate, _limitTraslate);
      _percentPaddingCard = _getPercent(_firstCardSideLeftClamp, _limitTraslate, _initPositionTraslate);
      _topPositionCards = _page == 0 ? 0 : (_availableHeight * (_percentWidgetInfoUser+_percentWidgetIndicator));
      _buttomPositionCards = _page == 0 ? 0 : _availableHeight * _percentWidgetBottom;
      _topPositionCardInBackground = _pageClamp * (_availableHeight * (_percentWidgetInfoUser+_percentWidgetIndicator)+15);
      _buttomPositionInBackground = _pageClamp * (_availableHeight * _percentWidgetBottom+15);
    });
  }

  double _getPercent (double n,double max, double min){
    return (n- min) / (max - min);
  }

  double _inverValur(double val){
    return 1.0-val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, child){
        return Stack(     
          alignment: Alignment.center,   
          children: [
            Background(
              animationValue: _visiblePercent,
            ),
            InfoUserOnBackground(
              animationController: _animationController,
              initialHeight: _intialHeightWidgetInfoUser,
              topPosition: _initialTopPositionWidgetInfoUser,
              opacity: _visiblePercent,
            ),
            Positioned(
              width: _animationController.value==1.0?0:_size.width,
              height: _animationController.value==1.0?0:_size.height,
              child: CustomPaint(
                painter: Hole(
                  initalHeight: _intialHeightWidgetInfoUser,
                  animationValue:_animationController.value,
                  topPosition: _initialTopPositionWidgetInfoUser
                ),
                size: _size,
              ),
            ),
            Positioned(
              top: lerpDouble(_topPositionIndicator, _size.height+10, _animationController.value),
              left: 0,
              right: 0,
              height: (_availableHeight*_percentWidgetIndicator),
              child: Opacity(
                opacity: _visiblePercent,
                child: const Center(child:Indicator())),
            ),
            Positioned(
              top: lerpDouble(_topPositionCardInBackground, _size.height-defaultPadding+15, _animationController.value),
              bottom: lerpDouble(_buttomPositionInBackground, -(_buttomPositionInBackground+_topPositionCardInBackground), _animationController.value),
              left: _pageClamp*defaultPadding,
              right: _pageClamp * (defaultPadding),
              child: Transform.translate(
                offset: Offset(
                  _page< 1? 0: -(_addCardPositionDx*_size.width),
                  0
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: _theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(_pageClamp * defaultRadius)
                  ),
                  child: _pageClamp<.1?Opacity(
                    opacity: _percentVisibleAddCardChild,
                    child: GestureDetector(
                      onTap: (){
                        debugPrint('TEST===>>>>');
                      },
                      child: const AddCard()),
                  ):const SizedBox.shrink(),
                ),
              ),
            ),
            Positioned(
              top: lerpDouble(_topPositionCards, _size.height-defaultPadding, _animationController.value),
              bottom: lerpDouble(_buttomPositionCards, -(_buttomPositionCards+_topPositionCards), _animationController.value),
              left: 0,
              right: 0,
              child: LayoutBuilder(
                builder: (_, layourBuilder){
                    return ScrollConfiguration(
                      behavior: NoGlow(),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: cards.length,
                        itemBuilder: (context, i){
                          if (i == 0){
                            return const SizedBox.shrink();
                          }else{
                            return GestureDetector(
                              onVerticalDragUpdate: (d){
                                if(_fisrtLocalPosition==0){
                                  _fisrtLocalPosition = d.localPosition.dy;
                                }else{
                                  final _maxHeight = layourBuilder.maxHeight;
                                  final _progresLocalPosition = d.localPosition.dy;
                                  final range = (_progresLocalPosition - _fisrtLocalPosition) / _maxHeight;
                                  _animationController.value = range;
                                }
                              },
                              onVerticalDragEnd: (d){
                                _fisrtLocalPosition = 0;
                                final _velocity = d.velocity.pixelsPerSecond;
                                if(_animationController.value>.5 ||_animationController.value>.2 && _velocity.dy>1200){
                                  _animationController.forward();
                                }else{
                                  _animationController.reverse();
                                }
                              },
                              child: Transform.translate(
                                offset: Offset(
                                  _firstCardSideLeftClamp>1? i==1?(_addCardPositionDx*-defaultPadding):0:_paddingFirstCard*_percentProgressRightSide,
                                  0),
                                child: Padding(
                                  padding: EdgeInsets.only(left: _percentPaddingCard* _paddingFirstCard),                  
                                  child: BankCard(data: cards[i]!)
                                ),
                              ),
                            );
                          }
                        },
                                      ),
                    );
                }
              )
            ),
            Transactions(height: _availableHeight, percentWidgetBottom: _percentWidgetBottom, visiblePercent: _visiblePercent, animationValue: _animationController.value,),
          ],
        );
      }
    );
  }
  Size getSizeText (String text, TextStyle textStyle) {
  return (TextPainter(
        text: TextSpan(text: text, style: textStyle),
        maxLines: 1,
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
        textDirection: TextDirection.ltr)
      ..layout())
    .size;
  }

}

