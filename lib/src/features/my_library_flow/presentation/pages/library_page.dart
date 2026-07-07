import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/home/presentation/models/book_options.dart';
import 'package:third_exam/src/features/my_library_flow/presentation/widgets/tab_pages.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;
  List<BookOptions> options = [
    BookOptions(image: 'assets/images/fire.png', title: 'Saved Books'),
    BookOptions(image: 'assets/images/book.png', title: 'In Progress'),
    BookOptions(image: 'assets/images/book.png', title: 'Completed'),
    BookOptions(image: 'assets/images/book.png', title: 'Completed'),
    BookOptions(image: 'assets/images/book.png', title: 'Completed'),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final orentation = MediaQuery.of(context).orientation;
    final isLandscape = orentation == Orientation.landscape;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Library',
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: AppColors.accentGreen,
              endIndent: 300,
              thickness: 2,
            ),
            SizedBox(height: 15),
            TabBar(
              tabAlignment: .start,
              controller: _tabController,
              isScrollable: true,
              indicatorSize: .tab,
              labelPadding: .symmetric(
                horizontal: isLandscape ? 20 : 20,
                vertical: isLandscape ? 10 : 10,
              ),
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: AppColors.accentGreen,
                borderRadius: .circular(20),
              ),
              labelColor: AppColors.grey4,
              unselectedLabelColor: AppColors.grey1,
              padding: .only(bottom: 18),
              tabs: [
                Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      Image.asset('assets/images/library_icon.png'),
                      SizedBox(width: 4),
                      Text('Saved Books'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/headphone.png',
                        color: AppColors.grey4,
                      ),
                      SizedBox(width: 4),
                      Text('In Progress'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/library_icon2.png',
                        color: AppColors.grey4,
                      ),
                      SizedBox(width: 4),
                      Text('Completed'),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [TabPages(), TabPages2(), TabPages3()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
