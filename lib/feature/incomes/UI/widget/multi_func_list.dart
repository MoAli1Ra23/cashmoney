import 'package:flutter/material.dart';

 ///MultiSelecting
///clickable
class MultiFuncList<T> extends StatefulWidget {
  final List items;
  final void Function(List<T>)? onDeleteAll;
  final void Function(int)? onDismiss;
  final Widget Function(BuildContext, int) builder;
  final ScrollPhysics? physics;
  final double? height;
  final double? width;
  final Color? color;

  const MultiFuncList(
      {super.key,
      required this.items,
      this.onDeleteAll,
      this.onDismiss,
      required this.builder,
      this.physics,
      this.height,
      this.width,
      this.color});

  @override
  State<MultiFuncList> createState() => _MultiFuncListState();
}

class _MultiFuncListState<T> extends State<MultiFuncList> {
  late List items;
  late List<bool> cheklist;
  late bool selectAll;
  late bool isSelection;
  late List selcted;
  ////
  @override
  void initState() {
    isSelection = false;
    selcted = [];
    selectAll = true;
    cheklist = [];

    super.initState();
    items = widget.items;
    for (var x in items) {
      cheklist.add(false);
    }
  }

  void _select(int index) {
    if (!isSelection) {
      isSelection = true;
      selcted.add(widget.items[index]);
      cheklist[index] = true;
      setState(() {});
    }
  }

  void _addOrRemove(T t, bool v) {
    if (!v) {
      selcted.add(t);
    } else {
      selcted.remove(t);
    }
  }

  void _onDisMiss(index) {
    setState(() {
      T t = items[index];
      if (selcted.contains(t)) {
        selcted.remove(t);
      }
      items.remove(t);
    });
  }

  void _deSelectAll() {
    selcted.clear();
    isSelection = false;
    cheklist.clear();
    for (var x in widget.items) {
      cheklist.add(false);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isSelection == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Checkbox(value: selectAll, onChanged: (val) {}),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.delete_sweep)),
              Text(selcted.length.toString()),
              IconButton(onPressed: _deSelectAll, icon: const Icon(Icons.close))
            ],
          ),
        SizedBox(
          height: widget.height?? MediaQuery.of(context).size.height * .88,
          width: widget.width?? MediaQuery.of(context).size.width,
          child: ListView.builder(
              physics: widget.physics ?? const ClampingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () => _select(index),
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              offset: const Offset(1, 5))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (isSelection)
                            Checkbox(
                                value: cheklist[index],
                                onChanged: (value) {
                                  _addOrRemove(
                                    widget.items[index],
                                    cheklist[index],
                                  );

                                  cheklist[index] =
                                      cheklist[index] ? false : true;

                                  setState(() {});
                                }),
                          // if (isSelection) Checkbox(value: false, onChanged: (v) {}),
                          Expanded(child: widget.builder(context, index))
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
