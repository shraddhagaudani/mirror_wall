import 'dart:async';

import 'package:flutter/material.dart';

class Connectivity_Model  {

  String connectivitystatus;
  StreamSubscription? connectivitystream;

  Connectivity_Model({
    required this.connectivitystatus,this.connectivitystream,
});
}

class RadioButtonAccess_Model{

  String radiobuttonacess;

  RadioButtonAccess_Model({
    required this.radiobuttonacess
});
}