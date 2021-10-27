import 'package:bitcoin_viewer/dtos/BlockchainDto/BlockDto.dart';
import 'package:flutter/cupertino.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';


class BlockchainBlockComponent extends StatefulWidget {

  final BlockDto blockDto;

  BlockchainBlockComponent(this.blockDto);

  @override
  _BlockchainBlockComponentState createState() => _BlockchainBlockComponentState(this.blockDto);
}

class _BlockchainBlockComponentState extends State<BlockchainBlockComponent> {

  BlockDto blockDto;

  _BlockchainBlockComponentState(this.blockDto);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: FloatingActionButton(
        onPressed: () {
          showModal(
            configuration: FadeScaleTransitionConfiguration(),
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Constants.padding),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: detailedBlockTile(context),
              );
            }
          );
        },
      )
    );
  }

  Widget detailedBlockTile(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(color: Colors.black38,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "TITEL",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600)
              ),
              SizedBox(height: 15,),
              Text(
                "BESCHREIBUNG",
                style: TextStyle(
                    fontSize: 14
                ),
                textAlign: TextAlign.center
              ),
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                // ignore: deprecated_member_use
                child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("TEXT",style: TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding + 30,
          right: Constants.padding + 30,
          child: Container(
            child: Container(
              alignment: Alignment.center,
              child:(
                Text(
                  "${blockDto.height}",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600)
                )
              )
            ),
            height: 80,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black38,offset: Offset(0,1),
                    blurRadius: 10
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
          ),
        )
      ],
    );
  }
}
