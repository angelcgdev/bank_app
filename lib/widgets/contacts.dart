import 'package:bank_app/data/frinds.dart';
import 'package:bank_app/style/consts.dart';
import 'package:flutter/material.dart';

class Friends extends StatelessWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _theme = Theme.of(context);
    return SizedBox(
      height: sizeCircleAvatar*1.4,
      width: _size.width,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: friends.length+1,
              itemBuilder: (_, i ){
                switch (i) {
                  case 0:
                  return Row(
                    children: [
                      const SizedBox(width: defaultPadding,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: sizeCircleAvatar,
                            width: sizeCircleAvatar,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.search, size: sizeCircleAvatar*.6, color: _theme.colorScheme.primary,),
                            ),
                          ),
                          Text('Search', style: _theme.textTheme.headline4?.copyWith(color: _theme.colorScheme.primary))
                        ],
                      ),
                    ],
                  );
                  default:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: sizeCircleAvatar,
                        width: sizeCircleAvatar,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(friends[i-1].path),
                        ),
                      ),
                      Text(friends[i-1].name, style: _theme.textTheme.headline4?.copyWith(color: _theme.colorScheme.primary))
                    ],
                  );
                }
              },
              separatorBuilder: (_, i)=>const SizedBox(width: 25),
            ),
          )
        ],
      ),
    );
  }
}