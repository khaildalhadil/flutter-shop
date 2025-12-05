import 'package:flutter/material.dart';

class Alert {
  static Future<void> showErrorOrWarning({
    required BuildContext context,
    required Function fct,
    required String mst,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset(
                  isError
                      ? "assets/images/error.png"
                      : "assets/images/warning.png",

                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(height: 16.0),
              Text(mst),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !isError,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      fct();
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
