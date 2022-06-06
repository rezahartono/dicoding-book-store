// ignore_for_file: non_constant_identifier_names, unnecessary_new, prefer_interpolation_to_compose_strings
import 'package:intl/intl.dart';

class StringUtils {
  String PRICE_FORMAT(double price) {
    var format = NumberFormat("###,###,###,###", "id_ID");
    var priceFormat = 'Rp' + format.format(price);

    return priceFormat;
  }
}

StringUtils STRING_UTILS = new StringUtils();
