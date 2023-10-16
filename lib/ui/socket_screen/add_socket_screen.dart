import 'package:flutter/material.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';

class AddSocketScreen extends StatelessWidget {
  const AddSocketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringConst.socket,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                margin: const EdgeInsets.all(16),
                elevation: 1,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Icon(
                      Icons.south_america,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      StringConst.primary,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(StringConst.keys),
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.designColor,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.65, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: MediaQuery.of(context).size.width * 0.3,
                                    ),
                                    height: 2,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      StringConst.news,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            color: context.designColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Divider(
                                    color: context.grey,
                                    thickness: 1,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      StringConst.activate,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            color: context.designColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),

                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        StringConst.addSocketButton,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: context.white,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        const Spacer(),
                        const Icon(
                          Icons.home_rounded,
                          size: 60,
                        ),
                        Text(
                          StringConst.home,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(color: context.designColor, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.edit,
                                    size: 18.0,
                                    color: context.designColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(color: context.designColor, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ), //<-- SEE HERE
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.info_outline_rounded,
                                    size: 18.0,
                                    color: context.designColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
