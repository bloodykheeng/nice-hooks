library nice_hooks;

// Imports Should be here
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:io';
import 'dart:ui' as dart_ui;
import 'package:flutter/services.dart';
import 'package:nice_hooks/models/chart_data_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nice_hooks/utils/my_date_utils.dart';

/// CUSTOMERS MODULE
part 'customers/models/customer_model.dart';
part 'customers/providers/customers_provider.dart';
part 'customers/utils/customer_utils.dart';

// CALL ADHERENCE MODULE
part 'call_adherence/models/call_adhrence_model.dart';
part 'call_adherence/providers/call_adherence_provider.dart';

// DEFECTS MODULE
part 'defects/models/defect_model.dart';
part 'defects/providers/defects_provider.dart';

// SALE OUT
part 'sale_out/models/sale_out_model.dart';
part 'sale_out/providers/sale_out_provider.dart';
part 'sale_out/utils/sale_out_utils.dart';

// SALE OUT ORDER
part 'sale_out_order/models/sell_out_order_model.dart';
part 'sale_out_order/providers/sell_out_orders_provider.dart';
part 'sale_out_order/utils/sale_out_order_utils.dart';

// SELL IN
part 'sale_in/models/sell_in_order_model.dart';
part 'sale_in/providers/sell_in_orders_provider.dart';

//! This will get Deprecated in the Coming Versions of the App
//! Package Funtionality will be in separate folders
part 'get_routes.dart';
part 'get_regions.dart';
part 'get_agents_list.dart';
part 'widgets/sf_bar_chart.dart';
part 'widgets/sf_donut_chart.dart';
part 'widgets/sf_line_chart.dart';
part 'widgets/sf_pie_chart.dart';
part 'app_utils.dart';
