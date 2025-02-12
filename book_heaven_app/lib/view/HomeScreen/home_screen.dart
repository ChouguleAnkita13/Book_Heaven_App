import 'package:book_heaven_app/controller/HomeBloc/home_bloc.dart';
import 'package:book_heaven_app/controller/HomeBloc/home_event.dart';
import 'package:book_heaven_app/controller/HomeBloc/home_state.dart';
import 'package:book_heaven_app/view/HomeScreen/Widgets/author_Container.dart';
import 'package:book_heaven_app/view/HomeScreen/Widgets/book_container.dart';
import 'package:book_heaven_app/view/HomeScreen/Widgets/book_detail.dart';
import 'package:book_heaven_app/view/HomeScreen/Widgets/custom_toprow.dart';
import 'package:book_heaven_app/view/HomeScreen/Widgets/special_offer.dart';
import 'package:book_heaven_app/view/HomeScreen/Widgets/top_appbar_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          listener: (context, state) {
            if (state is HomeNavigateToBookDetailsActionState) {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  builder: (context) => BookDetail(
                        book: state.book,
                      ));
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (HomeLoadingState):
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case const (HomeLoadedSuccessState):
                final successState = state as HomeLoadedSuccessState;
                return SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 1.14,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, bottom: 12, left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TopAppbarRow(),
                          const SpecialOffer(),
                          const CustomToprow(
                              title: "Top Of Week", content: "See all"),
                          SizedBox(
                            height: 225,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: successState.bookList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    homeBloc.add(HomeBookDetailsClickedEvent(
                                        clickedBook:
                                            successState.bookList[index]));
                                  },
                                  child: BookContainer(
                                      book: successState.bookList[index]),
                                );
                              },
                            ),
                          ),
                          const CustomToprow(
                              title: "Best Vendors", content: "See all"),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: successState.vendorsList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            250, 250, 250, 1),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Image.asset(
                                      successState.vendorsList[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const CustomToprow(
                              title: "Authors", content: "See all"),
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: successState.authorList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: AuthorContainer(
                                      author: successState.authorList[index]),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              default:
                return const SizedBox();
            }
          }),
    );
  }
}

// Container(
//                         color: Colors.white,
//                         child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 homeBloc.add(DecrementProductCountEvent(
//                                     book: state.book));
//                               },
//                               child: const Icon(Icons.remove),
//                             ),
//                             Text("${state.book.quantity}"),
//                             GestureDetector(
//                               onTap: () {
//                                 homeBloc.add(IncrementProductCountEvent(
//                                     book: state.book));
//                               },
//                               child: const Icon(Icons.add),
//                             )
//                           ],
//                         ),
//                       ));
