import 'dart:ui';

import 'package:bank_app/style/consts.dart';
import 'package:bank_app/widgets/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoUserOnBackground extends StatefulWidget {
  const InfoUserOnBackground({Key? key,
  required double topPosition,
  required double initialHeight,
  required AnimationController  animationController,
  required double opacity}):
   _topPosition = topPosition,
   _initalHeight = initialHeight,
   _animationController = animationController,
   _opacity = opacity,
   super(key: key);

  final double _topPosition;
  final double _initalHeight;
  final AnimationController _animationController;
  final double _opacity;

  @override
  State<InfoUserOnBackground> createState() => _InfoUserOnBackgroundState();
}

class _InfoUserOnBackgroundState extends State<InfoUserOnBackground> {
  double _fisrtLocalPosition = 0;
  late Size _size;
  late ThemeData _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _size = MediaQuery.of(context).size;
    _fisrtLocalPosition = _size.height;
    _theme = Theme.of(context);

  }

  @override
  void didUpdateWidget(covariant InfoUserOnBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
  final double _animationValue = widget._animationController.value;
    final _styleTextHello = TextStyle( fontSize: 30, fontFamily: 'Poppins', fontWeight: FontWeight.w500, color: _theme.colorScheme.primary);
    final _finalTopPositionBody = (widget._topPosition+(widget._initalHeight/2))-(sizeCircleAvatar/2)+sizeCircleAvatar;
    return Positioned.fill(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: (widget._topPosition+(widget._initalHeight/2))-(sizeCircleAvatar/2),
            left: lerpDouble(defaultPadding*2, defaultPadding, _animationValue),
            height: sizeCircleAvatar,
            right: lerpDouble(defaultPadding*2, defaultPadding, _animationValue),
            child: Opacity(
              opacity: widget._opacity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                  mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Hello', style: _styleTextHello),
                      const SizedBox(width: 5),
                      Text('Jane', style: _styleTextHello.copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      const SizedBox(
                        height: sizeCircleAvatar,
                        width: sizeCircleAvatar,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/friends/profile4.jpg')
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),          
          Positioned.fill(
            top: lerpDouble(_finalTopPositionBody+defaultPadding, _finalTopPositionBody, _animationValue),
            // left: defaultPadding,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GestureDetector(
                  onVerticalDragUpdate: (d){
                    if(_fisrtLocalPosition==0){
                      _fisrtLocalPosition = d.localPosition.dy;
                    }else{
                      final _progresLocalPosition = d.localPosition.dy;
                      final _progresAnimation = 1.0-((_fisrtLocalPosition - _progresLocalPosition) / constraints.maxHeight);
                      widget._animationController.value = _progresAnimation;
                    }
                  },
                  onVerticalDragEnd: (d){
                    _fisrtLocalPosition = 0;
                    final _velocity = d.velocity.pixelsPerSecond;
                    if(widget._animationController.value<.5 ||widget._animationController.value<.8 && _velocity.dy<-1200){
                      widget._animationController.reverse();
                    }else{
                      widget._animationController.forward();
                    }
                  },
                  child: Opacity(
                    opacity: _animationValue,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          const SizedBox(height: defaultPadding*1.5),
                          const Friends(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                            child: Column(
                              children: [
                                const SizedBox(height: defaultPadding,),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(defaultRadius*.8),
                                    color: const Color.fromRGBO(165, 203, 255, 1)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(defaultPadding),
                                    child: Row(
                                      children: [                                      
                                        Container(
                                          height: sizeCircleAvatar,                                        
                                          width: sizeCircleAvatar,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(defaultRadius*.55),
                                            color: Colors.white
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        SizedBox(
                                          height: sizeCircleAvatar,
                                          child: Column(
                                            children: [                                   
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(defaultRadius*.8),
                                                  color: Colors.white
                                                ),
                                                child: Text('Holiday goal', style: _theme.textTheme.headline5),
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  Text('\$ 100', style: _theme.textTheme.headline4?.copyWith(fontWeight: FontWeight.bold)),
                                                  const SizedBox(width: 10),
                                                  Text('\$ 5000', style: _theme.textTheme.headline4?.copyWith(fontWeight: FontWeight.bold, color: const Color.fromRGBO(86, 125, 245, 1)))
                                                ],
                                              )
                                        
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultPadding,),
                                Container(
                                  padding: const EdgeInsets.all(defaultPadding),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(defaultRadius),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset('assets/card3.svg', width: 25),
                                          const SizedBox(width: 20),
                                          Text('Pay for services', style: _theme.textTheme.headline4?.copyWith(color: _theme.colorScheme.primary)),
                                        ],
                                      ),
                                      const SizedBox(height: defaultPadding*1.5),
                                      Row(
                                        children: [
                                          SvgPicture.asset('assets/card4.svg', width: 25),
                                          const SizedBox(width: 20),
                                          Text('Take a loan', style: _theme.textTheme.headline4?.copyWith(color: _theme.colorScheme.primary)),                              
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(defaultRadius*.8),
                                              color: _theme.colorScheme.primary.withOpacity(.1)
                                            ),
                                            child: Text('4%', style: _theme.textTheme.headline5?.copyWith(color: _theme.colorScheme.primary)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: defaultPadding*1.5),
                                      const Icon(Icons.more_horiz)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            )
          )
        ],
      ),
    );
  }
}