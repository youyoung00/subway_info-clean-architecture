import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway/presentation/home/home_view_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();

  @override
  void initState() {
    Future.microtask(() {
      context.read<HomeViewModel>().fetch(_controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("지하철 실시간 정보"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    viewModel.fetch(_controller.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          const Text('도착정보', style: TextStyle(fontSize: 28)),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: viewModel.subwayInfos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 9,
                              ),
                            ],
                            image: const DecorationImage(
                              opacity: 0.2,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2016/03/05/23/02/blur-1239439__340.jpg',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(viewModel.subwayInfos[index].arvlMsg2),
                            Text(viewModel.subwayInfos[index].trainLineNm),
                            Text(viewModel.subwayInfos[index].arvlMsg3),
                            Text(
                                '약 ${_timeCounter(viewModel.subwayInfos[index].barvlDt)}분 후 도착예정'),
                            Text(viewModel.subwayInfos[index].arvlCd),
                            Text(viewModel.subwayInfos[index].bstatnNm),
                            Text(viewModel.subwayInfos[index].subwayHeading),
                            Text(viewModel.subwayInfos[index].updnLine),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _timeCounter(String millisecond) {
    double intMillisecond = double.parse(millisecond) / 60;
    return intMillisecond.toInt().toString();
  }
}
