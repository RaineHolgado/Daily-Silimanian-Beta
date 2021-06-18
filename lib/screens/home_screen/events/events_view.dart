import 'package:daily_sillimanian_beta/app/router.gr.dart';
import 'package:daily_sillimanian_beta/common/main_filters.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventsView extends StatefulWidget {
  const EventsView({Key? key}) : super(key: key);

  @override
  _EventsViewState createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  late PageController pageController = PageController(initialPage: 0);

  // @override
  // void initState() {
  //   pageController = PageController(
  //     initialPage: 0,
  //   );
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    EventsProvider _eventsProvider = context.read(eventsProvider);
    WidgetsBinding.instance?.addPersistentFrameCallback((_) {
      if (_eventsProvider.selectedPageIndex != pageController.page?.floor()) {
        pageController.jumpToPage(_eventsProvider.selectedPageIndex);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          "EVENTS",
          style: Theme.of(context)
              .appBarTheme
              .titleTextStyle!
              .copyWith(fontSize: 25.0),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Consumer(
              builder: (context, watch, _) {
                EventsProvider _events = watch(eventsProvider);
                return MainFilters(
                  selectedIndex: _events.selectedPageIndex,
                  onUpcomingPressed: () => _events.setSelectedPageIndex(0),
                  onTodayPressed: () => _events.setSelectedPageIndex(1),
                );
              },
            ),
            Expanded(
              child: Container(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final eventsProvider = ChangeNotifierProvider((ref) => EventsProvider());

class EventsProvider extends ChangeNotifier {
  int selectedPageIndex = 0;
  void setSelectedPageIndex(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }
}
