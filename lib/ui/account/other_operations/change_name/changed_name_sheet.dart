import 'package:auto_size_text/auto_size_text.dart';
import 'package:blaise_wallet_flutter/appstate_container.dart';
import 'package:blaise_wallet_flutter/ui/util/app_icons.dart';
import 'package:blaise_wallet_flutter/ui/util/text_styles.dart';
import 'package:blaise_wallet_flutter/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:pascaldart/pascaldart.dart';

class ChangedNameSheet extends StatefulWidget {
  final AccountName newName;
  final Currency fee;

  ChangedNameSheet({@required this.newName, @required this.fee});

  _ChangedNameSheetState createState() => _ChangedNameSheetState();
}

class _ChangedNameSheetState extends State<ChangedNameSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: StateContainer.of(context).curTheme.backgroundPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              children: <Widget>[
                // Sheet header
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.0,
                          0.7,
                          0.7,
                          1.0
                        ],
                        colors: [
                          StateContainer.of(context).curTheme.success,
                          StateContainer.of(context).curTheme.success,
                          StateContainer.of(context).curTheme.backgroundPrimary,
                          StateContainer.of(context).curTheme.backgroundPrimary,
                        ]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // Sized Box
                            SizedBox(
                              height: 50,
                              width: 65,
                            ),
                            // Header
                            Container(
                              width: MediaQuery.of(context).size.width - 130,
                              alignment: Alignment(0, 0),
                              child: AutoSizeText(
                                "CHANGED",
                                style: AppStyles.header(context),
                                maxLines: 1,
                                stepGranularity: 0.1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // Sized Box
                            SizedBox(
                              height: 50,
                              width: 65,
                            ),
                          ],
                        ),
                        // Tick
                        Container(
                          margin: EdgeInsetsDirectional.only(top: 8),
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: StateContainer.of(context).curTheme.success,
                            boxShadow: [
                              StateContainer.of(context)
                                  .curTheme
                                  .shadowTextDarkTwo
                            ],
                          ),
                          child: Icon(
                            AppIcons.tick,
                            size: 40,
                            color: StateContainer.of(context)
                                .curTheme
                                .backgroundPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Paragraph
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsetsDirectional.fromSTEB(30, 40, 30, 0),
                          child: AutoSizeText(
                            "Your account name has been changed successfully.",
                            style: AppStyles.paragraph(context),
                            stepGranularity: 0.1,
                            maxLines: 3,
                            minFontSize: 8,
                          ),
                        ),
                        // "Address" header
                        Container(
                          margin: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 0),
                          child: AutoSizeText(
                            "New Account Name",
                            style: AppStyles.textFieldLabelSuccess(context),
                            maxLines: 1,
                            stepGranularity: 0.1,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        // Container for the name
                        Container(
                          margin: EdgeInsetsDirectional.fromSTEB(30, 12, 30, 0),
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1,
                                color: StateContainer.of(context)
                                    .curTheme
                                    .textDark15),
                            color:
                                StateContainer.of(context).curTheme.textDark10,
                          ),
                          child: AutoSizeText(
                            widget.newName.toString(),
                            maxLines: 6,
                            stepGranularity: 0.1,
                            minFontSize: 8,
                            textAlign: TextAlign.center,
                            style: AppStyles.paragraphMedium(context),
                          ),
                        ),
                        // "Fee" header
                        widget.fee != Currency("0")
                            ? Container(
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    30, 30, 30, 0),
                                child: AutoSizeText(
                                  "Fee",
                                  style:
                                      AppStyles.textFieldLabelSuccess(context),
                                  maxLines: 1,
                                  stepGranularity: 0.1,
                                  textAlign: TextAlign.start,
                                ),
                              )
                            : SizedBox(),
                        // Container for the fee
                        widget.fee != Currency("0")
                            ? Container(
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    30, 12, 30, 0),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 8, 12, 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      width: 1,
                                      color: StateContainer.of(context)
                                          .curTheme
                                          .success15),
                                  color: StateContainer.of(context)
                                      .curTheme
                                      .success10,
                                ),
                                child: AutoSizeText.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "",
                                        style: AppStyles
                                            .iconFontSuccessBalanceSmallPascal(
                                                context),
                                      ),
                                      TextSpan(
                                          text: " ",
                                          style: TextStyle(fontSize: 8)),
                                      TextSpan(
                                          text: widget.fee.toStringOpt(),
                                          style: AppStyles.balanceSmallSuccess(
                                              context)),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  minFontSize: 8,
                                  stepGranularity: 1,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ),
                // "CANCEL" button
                Row(
                  children: <Widget>[
                    AppButton(
                      type: AppButtonType.SuccessOutline,
                      text: "Close",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
