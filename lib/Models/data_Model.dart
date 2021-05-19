import 'package:flutter/foundation.dart';

class DataModel {
  final String CURR_Acc_Rain_15_M;
  final String CURR_Water_D_Level_MSL;
  final String CURR_Water_U_Level_MSL;
  final String CURR_FLOW;
  final String RF;
  final String WL;
  final String WF;
  final String LAST_UPDATE;

  DataModel({
    this.CURR_Acc_Rain_15_M,
    this.CURR_Water_D_Level_MSL,
    this.CURR_Water_U_Level_MSL,
    this.CURR_FLOW,
    this.RF,
    this.WL,
    this.WF,
    this.LAST_UPDATE,
  });

  factory DataModel.fromJson(final json) {
    return DataModel(
        CURR_Acc_Rain_15_M: json['CURR_Acc_Rain_15_M'],
        CURR_Water_D_Level_MSL: json['CURR_Water_D_Level_MSL'],
        CURR_Water_U_Level_MSL: json['CURR_Water_U_Level_MSL'],
        CURR_FLOW: json['CURR_FLOW'],
        RF: json['RF'],
        WL: json['WL'],
        WF: json['WF'],
        LAST_UPDATE: json['LAST_UPDATE']);
  }
}

class DataModelGet {
  final String Label;
  final String Rain_15_M;
  final String Water_D;
  final String Water_F;

  DataModelGet({
    this.Label,
    this.Rain_15_M,
    this.Water_D,
    this.Water_F,
  });

  factory DataModelGet.fromJson(final json) {
    return DataModelGet(
      Label: json['Label'],
      Rain_15_M: json['Rain'],
      Water_D: json['Water'],
      Water_F: json['FLOW'],
    );
  }
}
