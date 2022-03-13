import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Tasks.dart';
import 'package:flutter_app/utils/color_utils.dart';
import 'package:flutter_app/utils/date_util.dart';
import 'package:flutter_app/utils/app_constant.dart';

class TaskRow extends StatelessWidget {
  final Tasks tasks;
  static final date_label = "Date";
  final List<String> labelNames = new List();

  TaskRow(this.tasks);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        //TODO to click something
      },
      child: Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(PADDING_SMALL),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: priorityColor[tasks.priority.index],
                    ),
                  ),
                  height: 25.0,
                  width: 25.0,
                  child: ClipOval(
                    child: Container(
                      color: priorityColor[tasks.priority.index].withAlpha(75),
                    ),
                  ),
                ),
                SizedBox(width: 4.0),
                Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Padding(
                        padding: const EdgeInsets.only(
                            left: PADDING_SMALL, bottom: PADDING_VERY_SMALL),
                        child: new Text(
                          tasks.title,
                          style: new TextStyle(
                            fontSize: FONT_SIZE_TITLE,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      getLabels(tasks.labelList),
                      new Padding(
                        padding: const EdgeInsets.only(
                          left: PADDING_SMALL,
                          bottom: PADDING_VERY_SMALL,
                        ),
                        child: new Row(
                          children: <Widget>[
                            new Text(
                              getFormattedDate(tasks.dueDate),
                              style: new TextStyle(
                                color: Colors.grey,
                                fontSize: FONT_SIZE_DATE,
                              ),
                              key: new Key(date_label),
                            ),
                            new Expanded(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      new Text(
                                        tasks.projectName,
                                        style: new TextStyle(
                                          color: Colors.grey,
                                          fontSize: FONT_SIZE_LABEL,
                                        ),
                                      ),
                                      new Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        width: 8.0,
                                        height: 8.0,
                                        child: new CircleAvatar(
                                          backgroundColor:
                                              new Color(tasks.projectColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Container(
              decoration: new BoxDecoration(
            border: new Border(
              bottom: new BorderSide(
                width: 0.5,
                color: Colors.grey,
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget getLabels(List<String> labelList) {
    if (labelList.isEmpty) {
      return new Container();
    } else {
      return new Padding(
        padding: const EdgeInsets.only(
            left: PADDING_SMALL, bottom: PADDING_VERY_SMALL),
        child: new Text(tasks.labelList.join("  "),
            style: new TextStyle(fontSize: FONT_SIZE_LABEL)),
      );
    }
  }
}
