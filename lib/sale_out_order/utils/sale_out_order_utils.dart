part of nice_hooks;

class SaleOutOrderUtils {
  static double saleOutOrdersCreated(
      {required List<SellOutOrderModel> saleOutData,
      required DateTime isAfterDate}) {
    double total = 0.0;

    var filteredSaleOutData = saleOutData.where((element) {
      return (element.date as DateTime).isAfter(isAfterDate);
    });

    for (var i in filteredSaleOutData) {
      total += i.amount;
    }

    return total;
  }

  static double saleOutOrdersClosed(
      {required List<SellOutOrderModel> saleOutData,
      required DateTime isAfterDate}) {
    double total = 0.0;

    var filteredSaleOutData = saleOutData.where((element) {
      return (element.date as DateTime).isAfter(isAfterDate);
    });

    for (var i in filteredSaleOutData) {
      if (i.status == "CLOSED") {
        total += i.amount;
      }
    }

    return total;
  }

  static List<ChartDataModel> computeTopCustomersChartData(
      {required List<SellOutOrderModel> sales}) {
    List<ChartDataModel> chartData = [];
    Set customerNames = <String>{};
    Map<String, double> customerSales = <String, double>{};

    for (var r in sales) {
      customerNames.add(r.customerName);
    }

    for (var p in customerNames) {
      var tt = 0.0;
      for (var r in sales) {
        if (p == r.customerName) {
          tt += r.amount;
        }
      }
      customerSales.addAll({p: tt});
    }

    var sortedEntries = customerSales.entries.toList()
      ..sort((e1, e2) {
        var diff = e2.value.compareTo(e1.value);
        if (diff == 0) diff = e2.key.compareTo(e1.key);
        return diff;
      });

    if (sortedEntries.length > 10) {
      sortedEntries = sortedEntries.sublist(0, 10);
    }
    for (var r in sortedEntries) {
      chartData.add(ChartDataModel(r.key, r.value.toInt()));
    }
    return chartData;
  }

  static List<ChartDataModel> computeTopProductsChartData(
      {required List<SellOutOrderModel> sales}) {
    List<ChartDataModel> chartData = [];
    Set productNames = <String>{};
    Map<String, double> productSales = <String, double>{};

    for (var r in sales) {
      for (var p in r.cartItems) {
        productNames.add(p["title"]);
      }
    }

    for (var p in productNames) {
      var tt = 0.0;
      for (var r in sales) {
        for (var pd in r.cartItems) {
          if (p == pd["title"]) {
            double amount = pd["price"].toDouble();
            double quantity = pd["quantity"].toDouble();
            tt += (amount * quantity);
          }
        }
      }
      productSales.addAll({p: tt});
    }
    var sortedEntries = productSales.entries.toList()
      ..sort((e1, e2) {
        var diff = e2.value.compareTo(e1.value);
        if (diff == 0) diff = e2.key.compareTo(e1.key);
        return diff;
      });

    if (sortedEntries.length > 10) {
      sortedEntries = sortedEntries.sublist(0, 10);
    }

    for (var r in sortedEntries) {
      chartData.add(ChartDataModel(r.key, r.value.toInt()));
    }
    return chartData;
  }

  static double computeClosedOrdersTotals(
      {required List<SellOutOrderModel> saleOutData,
      required DateTime isAfterDate}) {
    double total = 0.0;

    var filteredSaleOutData = saleOutData.where((element) {
      return (element.date as DateTime).isAfter(isAfterDate);
    });

    for (var i in filteredSaleOutData) {
      if (i.status == "CLOSED") {
        total += i.amount;
      }
    }

    return total;
  }

  static double computeActualCallProdTotal({
    required List<SellOutOrderModel> saleOutData,
    // required DateTime isAfterDate,
  }) {
    double total = 0.0;

    // var filteredSaleOutData = saleOutData.where((element) {
    //   return (element.date as DateTime).isAfter(isAfterDate);
    // });

    for (var i in saleOutData) {
      total += i.amount;
    }

    return total;
  }

  static List<ChartDataModel> computePerDayChartData(
      {required List<SellOutOrderModel> sales}) {
    List<ChartDataModel> dayOfWeekSalesChartData = [];
    List daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    final dayFormat = DateFormat("EE");

    for (var day in daysOfWeek) {
      double ttSales = 0.0;
      for (var r in sales) {
        var rr = dayFormat.format((r.date as DateTime));
        if (day == rr) {
          ttSales += r.amount;
        }
      }
      dayOfWeekSalesChartData.add(ChartDataModel(day, ttSales.toInt()));
    }

    return dayOfWeekSalesChartData;
  }

  static List<SellOutOrderModel> filterSaleOutOrdersFromDate(
      {required List<SellOutOrderModel> data,
      required DateTime startDate,
      DateTime? endDate}) {
    // log("ORDERS DATA 2: ${data.length.toString()}");
    final dateToday = DateTime.now();
    if (endDate == null) {
      return data
          .where((element) => (element.date as DateTime)
              .isAfter(startDate.subtract(Duration(hours: dateToday.hour))))
          .toList();
    } else {
      return data
          .where((element) => (element.date as DateTime)
              .isAfter(startDate.subtract(Duration(hours: dateToday.hour))))
          .where((element) => (element.date as DateTime)

              /// This is to make sure that the end date is exactly the date that was selected
              .isBefore(endDate.add(const Duration(days: 1))))
          .toList();
    }
  }

  static double computeTotalSaleOutByAgent(
      {required List<SellOutOrderModel> data, required String agent}) {
    double total = 0;
    for (var element in data) {
      if (element.agent == agent) {
        total += element.amount;
      }
    }
    return total;
  }

  static double computeTotalSaleOutOrders(
      {required List<SellOutOrderModel> data}) {
    double total = 0.0;
    for (var i in data) {
      total += i.amount;
    }
    return total;
  }

  static double computeTotalSaleOutOrdersClosed(
      {required List<SellOutOrderModel> data}) {
    double total = 0.0;
    for (var i in data) {
      if (i.status == "CLOSED") {
        total += i.amount;
      }
    }
    return total;
  }

  static double computeTotalAgentSaleOutOrders(
      {required List<SellOutOrderModel> data}) {
    double total = 0.0;
    for (var element in data) {
      total += element.amount;
    }
    return total;
  }

  static List<ChartDataModel> computeSalesPerAgentSaleOutOrders(
      {required List<SellOutOrderModel> sales, required String region}) {
    List agentList = getAgentList(region)!;
    Map<String, double> agentSales = {};
    List<ChartDataModel> agentChartData = [];
    for (var agent in agentList) {
      double ttt = 0.0;
      for (var r in sales) {
        if (r.agent == agent) {
          ttt += r.amount;
        }
      }
      agentSales.addAll({agent: ttt});
      agentChartData.add(ChartDataModel(agent, ttt.toInt()));
    }

    return agentChartData;
  }

  static List<ChartDataModel> computeDaysOfWeekSalesSaleOutOrders(
      {required List<SellOutOrderModel> sales}) {
    // double totalSales = 0;
    List<ChartDataModel> dayOfWeekSalesChartData = [];
    List daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    final dayFormat = DateFormat("EE");

    for (var day in daysOfWeek) {
      double ttSales = 0.0;
      for (var r in sales) {
        var rr = dayFormat.format((r.date as DateTime));
        if (day == rr) {
          ttSales += r.amount;
        }
      }
      dayOfWeekSalesChartData.add(ChartDataModel(day, ttSales.toInt()));
    }

    return dayOfWeekSalesChartData;
  }

  static List<ChartDataModel> computeTopProductsSaleOutOrders(
      {required List<SellOutOrderModel> sales}) {
    List<ChartDataModel> chartData = [];
    Set productNames = <String>{};
    Map<String, double> productSales = <String, double>{};

    for (var r in sales) {
      for (var p in r.cartItems) {
        productNames.add(p["title"]);
      }
    }

    for (var p in productNames) {
      var tt = 0.0;
      for (var r in sales) {
        for (var pd in r.cartItems) {
          if (p == pd["title"]) {
            double amount = pd["price"].toDouble();
            double quantity = pd["quantity"].toDouble();
            tt += (amount * quantity);
          }
        }
      }
      productSales.addAll({p: tt});
    }
    var sortedEntries = productSales.entries.toList()
      ..sort((e1, e2) {
        var diff = e2.value.compareTo(e1.value);
        if (diff == 0) diff = e2.key.compareTo(e1.key);
        return diff;
      });

    if (sortedEntries.length > 10) {
      sortedEntries = sortedEntries.sublist(0, 10);
    }

    for (var r in sortedEntries) {
      chartData.add(ChartDataModel(r.key, r.value.toInt()));
    }
    return chartData;
  }

  static List<ChartDataModel> computeTopCustomersSaleOutOrders(
      {required List<SellOutOrderModel> sales}) {
    List<ChartDataModel> chartData = [];
    Set customerNames = <String>{};
    Map<String, double> customerSales = <String, double>{};

    for (var r in sales) {
      customerNames.add(r.customerName);
    }

    for (var p in customerNames) {
      var tt = 0.0;
      for (var r in sales) {
        if (p == r.customerName) {
          tt += r.amount;
        }
      }
      customerSales.addAll({p: tt});
    }

    var sortedEntries = customerSales.entries.toList()
      ..sort((e1, e2) {
        var diff = e2.value.compareTo(e1.value);
        if (diff == 0) diff = e2.key.compareTo(e1.key);
        return diff;
      });

    if (sortedEntries.length > 10) {
      sortedEntries = sortedEntries.sublist(0, 10);
    }
    for (var r in sortedEntries) {
      chartData.add(ChartDataModel(r.key, r.value.toInt()));
    }
    return chartData;
  }
}
