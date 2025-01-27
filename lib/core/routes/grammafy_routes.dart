import 'package:auto_route/auto_route.dart';
import 'package:grammafy/core/routes/grammafy_routes.gr.dart';

@AutoRouterConfig()
class GrammafyRoutes extends $GrammafyRoutes {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, initial: true),
  ];
}
