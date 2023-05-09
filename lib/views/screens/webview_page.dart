import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/cupertino.dart';
import 'package:mirror_wall/controllers/providers/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:mirror_wall/utills/utills.dart';

class Webview_page extends StatefulWidget {
  const Webview_page({Key? key}) : super(key: key);

  @override
  State<Webview_page> createState() => _Webview_pageState();
}

class _Webview_pageState extends State<Webview_page> {
  @override
  void initState() {
    Provider.of<ConnectivityProvider>(context, listen: false)
        .CheckInternetConnectivity();
    super.initState();
    pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(
          color: Colors.black,
        ),
        onRefresh: () async {
          await inAppWebViewController?.reload();
        });
  }

  late var url;

  // var initialurl = "https://www.google.com/";
  String? initialpopupmenuval;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "My Browser",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          PopupMenuButton(
              initialValue: initialpopupmenuval,
              onSelected: (val) {
                setState(() {
                  initialpopupmenuval = val;
                });
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    onTap: () {},
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  alignment: Alignment.center,
                                  height: 800,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            color: Colors.deepPurple,
                                            CupertinoIcons.clear,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "Dismiss",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      (Namelist.isNotEmpty)
                                          ? Container(
                                              height: 360,
                                              child: ListView.builder(
                                                itemCount: Namelist.length,
                                                itemBuilder: (context, i) =>
                                                    ListTile(
                                                  title: Text("${Namelist[i]}"),
                                                  subtitle:
                                                      Text("${Linklist[i]}"),
                                                  onTap: () {},
                                                  trailing: IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();

                                                      setState(() {
                                                        Namelist.removeAt(i);
                                                        Linklist.removeAt(i);
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      CupertinoIcons.clear,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    height: 200,
                                                  ),
                                                  const Text(
                                                    "No book Marks yet...",
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            CupertinoIcons.bookmark,
                          ),
                        ),
                        const Text(
                          "All Bookmarks",
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {},
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  StatefulBuilder(builder: (context, setState) {
                                return AlertDialog(
                                  shape: Border.all(
                                    style: BorderStyle.solid,
                                  ),
                                  actions: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            "Search engine",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RadioListTile(
                                              title: const Text(
                                                "Google",
                                              ),
                                              value: "https://www.google.com/",
                                              groupValue: Provider.of<
                                                          RadioButtonAccessProvider>(
                                                      context,
                                                      listen: false)
                                                  .radioButtonAccess_Model
                                                  .radiobuttonacess,
                                              onChanged: (val) {
                                                setState(() {
                                                  if (val != null) {
                                                    Provider.of<RadioButtonAccessProvider>(
                                                            context,
                                                            listen: false)
                                                        .radioButtonAccess_Model
                                                        .radiobuttonacess = val;

                                                    Provider.of<RadioButtonAccessProvider>(
                                                            context,
                                                            listen: false)
                                                        .engine(
                                                      Provider.of<RadioButtonAccessProvider>(
                                                              context,
                                                              listen: false)
                                                          .radioButtonAccess_Model
                                                          .radiobuttonacess,
                                                    );
                                                    Navigator.of(context).pop();
                                                  }
                                                });
                                              }),
                                          RadioListTile(
                                            title: const Text("Yahoo"),
                                            value:
                                                "https://in.search.yahoo.com/",
                                            groupValue: Provider.of<
                                                        RadioButtonAccessProvider>(
                                                    context,
                                                    listen: false)
                                                .radioButtonAccess_Model
                                                .radiobuttonacess,
                                            onChanged: (val) {
                                              setState(() {
                                                if (val != null) {
                                                  Provider.of<RadioButtonAccessProvider>(
                                                          context,
                                                          listen: false)
                                                      .radioButtonAccess_Model
                                                      .radiobuttonacess = val;

                                                  Provider.of<RadioButtonAccessProvider>(
                                                          context,
                                                          listen: false)
                                                      .engine(Provider.of<
                                                                  RadioButtonAccessProvider>(
                                                              context,
                                                              listen: false)
                                                          .radioButtonAccess_Model
                                                          .radiobuttonacess);
                                                }
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                          RadioListTile(
                                            title: const Text(
                                              "Bing",
                                            ),
                                            value: "https://www.bing.com/",
                                            groupValue: Provider.of<
                                                        RadioButtonAccessProvider>(
                                                    context,
                                                    listen: false)
                                                .radioButtonAccess_Model
                                                .radiobuttonacess,
                                            onChanged: (val) {
                                              setState(
                                                () {
                                                  if (val != null) {
                                                    Provider.of<RadioButtonAccessProvider>(
                                                            context,
                                                            listen: false)
                                                        .radioButtonAccess_Model
                                                        .radiobuttonacess = val;

                                                    Provider.of<RadioButtonAccessProvider>(
                                                            context,
                                                            listen: false)
                                                        .engine(Provider.of<
                                                                    RadioButtonAccessProvider>(
                                                                context,
                                                                listen: false)
                                                            .radioButtonAccess_Model
                                                            .radiobuttonacess);
                                                  }
                                                },
                                              );
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          RadioListTile(
                                            title: const Text(
                                              "Duck Duck Go",
                                            ),
                                            value: "https://duckduckgo.com/",
                                            groupValue: Provider.of<
                                                        RadioButtonAccessProvider>(
                                                    context,
                                                    listen: false)
                                                .radioButtonAccess_Model
                                                .radiobuttonacess,
                                            onChanged: (val) {
                                              setState(() {
                                                if (val != null) {
                                                  Provider.of<RadioButtonAccessProvider>(
                                                          context,
                                                          listen: false)
                                                      .radioButtonAccess_Model
                                                      .radiobuttonacess = val;

                                                  Provider.of<RadioButtonAccessProvider>(
                                                          context,
                                                          listen: false)
                                                      .engine(Provider.of<
                                                                  RadioButtonAccessProvider>(
                                                              context,
                                                              listen: false)
                                                          .radioButtonAccess_Model
                                                          .radiobuttonacess);
                                                }
                                              });
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            );
                          },
                          icon: const Icon(
                            CupertinoIcons.search,
                          ),
                        ),
                        const Text(
                          "Search Enegine",
                        ),
                      ],
                    ),
                  ),
                ];
              }),
        ],
      ),
      body: (Provider.of<ConnectivityProvider>(context)
                  .connectivity_model
                  .connectivitystatus !=
              "Waiting...")
          ? Column(
              children: [
                Expanded(
                  flex: 16,
                  child: InAppWebView(
                    onLoadStart: (controller, uri) {
                      setState(() {
                        inAppWebViewController = controller;
                        var v = url.toString();
                        // setState(() {
                        //   urlController.text = v;
                        // });
                      });
                    },
                    onLoadStop: (controller, uri) async {
                      await pullToRefreshController.endRefreshing();
                    },
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(
                        Provider.of<RadioButtonAccessProvider>(context)
                            .radioButtonAccess_Model
                            .radiobuttonacess,
                      ),
                    ),
                    pullToRefreshController: pullToRefreshController,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: urlController,
                          onSubmitted: (val) {
                            url = Uri.parse(val);
                            if (url.scheme.isEmpty) {
                              url = Uri.parse("${"https://www.google.com/"}search?q=$val");
                            }
                            inAppWebViewController!.loadUrl(
                              urlRequest: URLRequest(
                                url: url,
                              ),
                            );
                          },
                          decoration: const InputDecoration(
                            hintText: "Search or type of web address",
                            suffixIcon: const Icon(
                              CupertinoIcons.search,
                              color: Colors.black,
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () async {
                          // await inAppWebViewController?.loadUrl(
                          //   urlRequest: URLRequest(
                          //     url: Uri.parse(initialurl),
                          //   ),
                          Provider.of<RadioButtonAccessProvider>(context)
                              .engine(
                            Provider.of<RadioButtonAccessProvider>(context)
                                .radioButtonAccess_Model
                                .radiobuttonacess,
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.home,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          Namelist.add(
                              await inAppWebViewController?.getTitle());
                          Linklist.add(await inAppWebViewController?.getUrl());
                        },
                        icon: const Icon(
                          CupertinoIcons.bookmark,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (await inAppWebViewController!.canGoBack()) {
                            await inAppWebViewController?.goBack();
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.back,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await inAppWebViewController?.reload();
                        },
                        icon: const Icon(
                          CupertinoIcons.refresh,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (await inAppWebViewController!.canGoForward()) {
                            await inAppWebViewController?.goForward();
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.forward,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: const Text(
                "Offline",
              ),
            ),
    );
  }
}
