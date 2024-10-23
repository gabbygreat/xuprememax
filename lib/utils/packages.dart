///this file is where we run all package exports
///this is to reduce the repetition of import statements in our code
library;

export 'package:dio/dio.dart';
export 'package:flutter/material.dart'
    hide
        MenuController,
        RefreshIndicator,
        RefreshIndicatorState,
        SearchController;
export 'package:flutter/services.dart';
export 'package:go_router/go_router.dart';
export 'package:signals/signals_flutter.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
