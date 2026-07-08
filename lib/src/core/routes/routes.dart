import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:third_exam/src/core/routes/pages.dart';
import 'package:third_exam/src/features/account_flow/presentation/pages/account_page.dart';
import 'package:third_exam/src/features/account_flow/presentation/pages/add_payment_methos.dart';
import 'package:third_exam/src/features/account_flow/presentation/pages/congratulate_page.dart';
import 'package:third_exam/src/features/account_flow/presentation/pages/payment_page.dart';
import 'package:third_exam/src/features/account_flow/presentation/pages/premium_add_payment_method.dart';
import 'package:third_exam/src/features/account_flow/presentation/pages/premium_plan_details_page.dart';
import 'package:third_exam/src/features/account_flow/presentation/pages/premium_plans_overview.dart';
import 'package:third_exam/src/features/account_flow/presentation/pages/premium_plans_page.dart';
import 'package:third_exam/src/features/account_flow/presentation/pages/profile_details.dart';
import 'package:third_exam/src/features/account_flow/presentation/pages/select_card_methods_page.dart';
import 'package:third_exam/src/features/auth/presentation/session/user_session.dart';
import 'package:third_exam/src/features/auth/presentation/pages/code_page.dart';
import 'package:third_exam/src/features/auth/presentation/pages/code_verified_page.dart';
import 'package:third_exam/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:third_exam/src/features/auth/presentation/pages/genre_preferences_page.dart';
import 'package:third_exam/src/features/auth/presentation/pages/log_in_email_page.dart';
import 'package:third_exam/src/features/auth/presentation/pages/log_in_password_page.dart';
import 'package:third_exam/src/features/auth/presentation/pages/sign_up_page.dart';
import 'package:third_exam/src/features/book_details/presentation/pages/audio_player_page.dart';
import 'package:third_exam/src/features/book_details/presentation/pages/detail_page.dart';
import 'package:third_exam/src/features/explore/presentation/pages/explore_page.dart';
import 'package:third_exam/src/features/explore/presentation/pages/products_listing_pages.dart';
import 'package:third_exam/src/features/explore/presentation/pages/search_page.dart';
import 'package:third_exam/src/features/home/presentation/pages/home_page.dart';
import 'package:third_exam/src/features/home/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:third_exam/src/features/my_library_flow/presentation/pages/library_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

class Routes {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Pages.loginEmail,
    routes: [
      GoRoute(
        path: Pages.loginEmail,
        builder: (context, state) => const LogInEmailPage(),
      ),
      GoRoute(
        path: Pages.loginPassword,
        builder: (context, state) {
          final email = (state.extra as String?) ?? UserSession.email;
          if (email == null) {
            return const LogInEmailPage();
          }
          return LogInPasswordPage(email: email);
        },
      ),
      GoRoute(path: Pages.signUp, builder: (context, state) => SignUpPage()),
      GoRoute(path: Pages.search, builder: (context, state) => SearchPage()),
      GoRoute(
        path: Pages.forgotPassword,
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(path: Pages.code, builder: (context, state) => CodePage()),
      GoRoute(
        path: Pages.codeVerified,
        builder: (context, state) => CodeVerifiedPage(),
      ),
      GoRoute(
        path: Pages.genres,
        builder: (context, state) => GenrePreferencesPage(),
      ),
      GoRoute(
        path: Pages.audioPlayer,
        builder: (context, state) => AudioPlayerPage(),
      ),
      GoRoute(
        path: Pages.productsListing,
        builder: (context, state) {
          final title = state.extra as String? ?? 'Fiction';
          return ProductsListingPages(title: title);
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavBarWidget(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Pages.home,
                builder: (context, state) => HomePage(),
                routes: [
                  GoRoute(
                    path: Pages.detail,
                    builder: (context, state) => DetailPage(),
                  ),
                  GoRoute(
                    path: Pages.account,
                    builder: (context, state) {
                      final email =
                          (state.extra as String?) ?? UserSession.email;
                      if (email == null) {
                        return const AccountPage(email: "john.doe@example.com");
                      }
                      return AccountPage(email: email);
                    },
                  ),
                  GoRoute(
                    path: Pages.profile,
                    builder: (context, state) => ProfileDetails(),
                  ),
                  GoRoute(
                    path: Pages.payment,
                    builder: (context, state) => PaymentPage(),
                  ),
                  GoRoute(
                    path: Pages.addPayment,
                    builder: (context, state) => AddPaymentMethos(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Pages.explore,
                builder: (context, state) => ExplorePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Pages.library,
                builder: (context, state) => LibraryPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Pages.premiumAddpayment,
        builder: (context, state) => PremiumAddPaymentMethod(),
      ),

      GoRoute(
        path: Pages.premium,
        builder: (context, state) => PremiumPlansPage(),
      ),
      GoRoute(
        path: Pages.premiumDetails,
        builder: (context, state) => PremiumPlanDetailsPage(),
      ),
      GoRoute(
        path: Pages.premiumSelectCard,
        builder: (context, state) => SelectCardMethodsPage(),
      ),
      GoRoute(
        path: Pages.premiumConguratulate,
        builder: (context, state) => CongratulatePage(),
      ),
      GoRoute(
        path: Pages.premiumOverview,
        builder: (context, state) => PremiumPlansOverview(),
      ),
    ],
  );
}
