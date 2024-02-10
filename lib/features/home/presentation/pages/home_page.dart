import 'package:chat_app_firebase/features/chat/presentation/pages/chat_page.dart';
import 'package:chat_app_firebase/features/contact/presentation/pages/contact_page.dart';
import 'package:chat_app_firebase/features/home/presentation/widgets/container_plus.dart';
import 'package:chat_app_firebase/features/profile/presentation/pages/profile_page.dart';
import 'package:chat_app_firebase/features/search/presentation/pages/search_page.dart';
import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? bottomnavbarindex;

  PageController pagecontrol = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    bottomnavbarindex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pinkabu,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: LayoutBuilder(
          builder: (context, p1) => Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: p1.maxWidth * 0.05,
                    left: p1.maxWidth * 0.03,
                    right: p1.maxWidth * 0.03),
                child: Column(
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: p1.maxWidth,
                        height: p1.maxHeight,
                        child: PageView(
                          controller: pagecontrol,
                          onPageChanged: (value) {
                            setState(() {
                              bottomnavbarindex = value;
                            });
                          },
                          children: const [
                            Chatpage(),
                            SearchPage(),
                            ContactPage(),
                            ProfilePage()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(),
                  child: Container(
                      color: abuabu,
                      width: p1.maxWidth,
                      height: p1.maxHeight * 0.1,
                      child: LayoutBuilder(
                        builder: (p0, btm) => BottomNavigationBar(
                            backgroundColor: abuabu,
                            type: BottomNavigationBarType.fixed,
                            onTap: (value) {
                              setState(() {
                                bottomnavbarindex = value;
                                pagecontrol.jumpToPage(value);
                              });
                            },
                            currentIndex: bottomnavbarindex!,
                            selectedLabelStyle: textpress.copyWith(
                                fontSize: btm.maxHeight * 0.1),
                            unselectedLabelStyle: textpress.copyWith(
                                fontSize: btm.maxHeight * 0.1),
                            selectedItemColor: colorbiru,
                            unselectedItemColor: pinkabu,
                            items: [
                              BottomNavigationBarItem(
                                  label: "",
                                  icon: SizedBox(
                                      height: btm.maxHeight * 0.43,
                                      width: btm.maxWidth * 0.2,
                                      child: const Icon(Icons.chat_bubble))),
                              BottomNavigationBarItem(
                                  label: "",
                                  icon: Padding(
                                    padding: EdgeInsets.only(
                                        right: p1.maxWidth * 0.12),
                                    child: SizedBox(
                                        height: btm.maxHeight * 0.43,
                                        child: const Icon(Icons.search)),
                                  )),
                              BottomNavigationBarItem(
                                  label: "",
                                  icon: Padding(
                                    padding: EdgeInsets.only(
                                        left: p1.maxWidth * 0.12),
                                    child: SizedBox(
                                        height: btm.maxHeight * 0.43,
                                        child: const Icon(Icons.phone)),
                                  )),
                              BottomNavigationBarItem(
                                  label: "",
                                  icon: SizedBox(
                                      height: btm.maxHeight * 0.43,
                                      child: const Icon(Icons.person))),
                            ]),
                      )),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: p1.maxHeight * 0.02),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ContainerPlus(
                        width: p1.maxWidth * 0.3, height: p1.maxHeight * 0.12),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
