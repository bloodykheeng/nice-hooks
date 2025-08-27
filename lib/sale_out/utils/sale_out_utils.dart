part of nice_hooks;

class SaleOutUtils {
  static double computeSaleOutTotalAfterDate({
    required List<SaleOutModel> data,
    required DateTime isAfterDate,
  }) {
    var total = 0.0;
    var filteredData = data.where((element) {
      return (element.date as DateTime).isAfter(isAfterDate) ||
          (element.date as DateTime) == isAfterDate;
    }).toList();

    for (var s in filteredData) {
      total += s.amount;
    }
    return total;
  }

  static int numOfRoutesInSaleOutsAfterDate({
    required List<SaleOutModel> data,
    required DateTime isAfterDate,
  }) {
    Set<String> uniqueRoutesSet = {};

    var filteredData = data.where((element) {
      return (element.date as DateTime).isAfter(isAfterDate)  ||
          (element.date as DateTime) == isAfterDate;
    }).toList();

    for (var r in filteredData) {
      uniqueRoutesSet.add(r.route);
    }
    return uniqueRoutesSet.length;
  }

  static List<ChartDataModel> computeTopCustomersChartData(
      {required List<SaleOutModel> sales}) {
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

  static List<ChartDataModel> computeRouteSalesChartData(
      {required List<SaleOutModel> sales}) {
    List<ChartDataModel> chartData = [];
    Set routes = <String>{};
    Map<String, double> routeSales = <String, double>{};
    for (var r in sales) {
      routes.add(r.route);
    }

    for (var r in routes) {
      var tt = 0.0;
      for (var s in sales) {
        if (r == s.route) {
          tt += s.amount;
        }
        routeSales.addAll({r: tt});
      }
    }

    var sortedEntries = routeSales.entries.toList()
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

    // for (var r in routeSales.entries) {
    //   chartData.add(ChartDataModel(r.key, r.value.toInt()));
    // }
    return chartData;
  }

  static List<ChartDataModel> computeDaysOfWeekSalesChartData(
      {required List<SaleOutModel> sales}) {
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

  static List<ChartDataModel> computeTopProductsChartData(
      {required List<SaleOutModel> sales}) {
    List<ChartDataModel> chartData = [];
    Set productNames = <String>{};
    Map<String, double> productSales = <String, double>{};

    for (var r in sales) {
      for (var p in r.cartItems) {
        // print(p);
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

  static double computeSaleOutCreatedTotal(
      {required List<SaleOutModel> data, required DateTime isAfterDate}) {
    var total = 0.0;
    var filteredData = data.where((element) {
      return (element.date as DateTime).isAfter(isAfterDate);
    }).toList();
    for (var s in filteredData) {
      total += s.amount;
    }
    return total;
  }

  /// This Method will Filter SaleOut By Date
  static List<SaleOutModel> filterSaleOutByDate(
      {required List<SaleOutModel> data,
      required DateTime startDate,
      DateTime? endDate}) {
    // log("SALEOUT TO 2: ${data.length.toString()}");
    final dateToday = DateTime.now();
    if (endDate != null) {
      return data
          .where((element) => (element.date as DateTime).isAfter(startDate))
          .toList();
    }
    return data
        .where((element) => (element.date as DateTime).isAfter(
            startDate.subtract(
                Duration(hours: dateToday.hour, minutes: dateToday.minute))))
        .toList();
  }

  static double computeTotalAgentSaleOut({required List<SaleOutModel> data}) {
    double total = 0.0;
    for (var element in data) {
      total += element.amount;
    }
    return total;
  }

  /// This will compute the unique weekly routes per agent
  static int weeklyUniqueRoutesOnSaleOutPerAgent(
      {required List<SaleOutModel> data, required String agent}) {
    Set<String> uniqueRoutesSet = {};
    for (var r in data) {
      if (r.agent == agent) {
        uniqueRoutesSet.add(r.route);
      }
    }

    /// The warehouse route is not included
    return uniqueRoutesSet.length;
  }

  /// This will Compute the unique month routes per agent
  /// The route might more than once a month
  /// But it cant appear more than once a week
  static int monthlyUniqueRoutesOnSaleOutPerAgent(
      {required List<SaleOutModel> data, required String agent}) {
    Set<String> uniqueWeekSet = {};
    int total = 0;

    for (var r in data) {
      if (r.agent == agent) {
        uniqueWeekSet.add(weekNumber(r.date as DateTime).toString());
      }
    }

    for (var week in uniqueWeekSet) {
      Set<String> uniqueRoutesSet = {};
      for (var sale in data) {
        if (sale.agent == agent) {
          var dd = weekNumber(sale.date as DateTime).toString();
          if (dd == week) {
            uniqueRoutesSet.add(sale.route);
          }
        }
      }
      total += uniqueRoutesSet.length;
    }
    return total;
  }

  static double computeTotalSaleOut({required List<SaleOutModel> data}) {
    double total = 0;
    for (var element in data) {
      total += element.amount;
    }

    return total;
  }

  static double computeTotalSaleOutByAgent(
      {required List<SaleOutModel> data, required String agent}) {
    double total = 0;
    for (var element in data) {
      if (element.agent == agent) {
        total += element.amount;
      }
    }
    return total;
  }
}

int weekNumber(DateTime date) {
  int dayOfYear = int.parse(DateFormat("D").format(date));
  return ((dayOfYear - date.weekday + 10) / 7).floor();
}
