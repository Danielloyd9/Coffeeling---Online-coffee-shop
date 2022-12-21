import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    Key? key,
    this.productSelection,
  }) : super(key: key);

  final ProductCategoriesRecord? productSelection;

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  List<String>? checkboxGroupValues1;
  List<String>? checkboxGroupValues2;
  List<String>? checkboxGroupValues3;
  int? countControllerValue;
  ProductDetailsRecord? productinCart;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartRecord>>(
      stream: queryCartRecord(
        queryBuilder: (cartRecord) =>
            cartRecord.where('userRef', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<CartRecord> productDetailsCartRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final productDetailsCartRecord = productDetailsCartRecordList.isNotEmpty
            ? productDetailsCartRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30,
              ),
              onPressed: () async {
                context.pushNamed('ShopMenu');
              },
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                widget.productSelection!.productPhoto!,
                                width: double.infinity,
                                height: 230,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget.productSelection!.name!,
                                  style: FlutterFlowTheme.of(context).title2,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget.productSelection!.price!.toString(),
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 20,
                            thickness: 2,
                            indent: 16,
                            endIndent: 16,
                            color: Color(0xFF331F0D),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Description',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.productSelection!.description!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFA97443),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Text(
                                      'Type of Milk',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFD9D9D9),
                                          ),
                                    ),
                                  ),
                                ),
                                FlutterFlowCheckboxGroup(
                                  options: [
                                    'Organic Whole milk',
                                    'Almond Milk',
                                    'Oat Milk'
                                  ],
                                  onChanged: (val) => setState(
                                      () => checkboxGroupValues1 = val),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  checkboxBorderRadius:
                                      BorderRadius.circular(4),
                                  initialized: checkboxGroupValues1 != null,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFA97443),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Text(
                                      'Size',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFD9D9D9),
                                          ),
                                    ),
                                  ),
                                ),
                                FlutterFlowCheckboxGroup(
                                  options: ['12oz', '16oz'],
                                  onChanged: (val) => setState(
                                      () => checkboxGroupValues2 = val),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  checkboxBorderRadius:
                                      BorderRadius.circular(4),
                                  initialized: checkboxGroupValues2 != null,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFA97443),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Text(
                                      'Ice / Hot',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFD9D9D9),
                                          ),
                                    ),
                                  ),
                                ),
                                FlutterFlowCheckboxGroup(
                                  options: ['Iced', 'Hot'],
                                  onChanged: (val) => setState(
                                      () => checkboxGroupValues3 = val),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  checkColor: Colors.white,
                                  checkboxBorderColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  checkboxBorderRadius:
                                      BorderRadius.circular(4),
                                  initialized: checkboxGroupValues3 != null,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFA97443),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Text(
                                      'Quanity',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFD9D9D9),
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 24),
                                  child: Container(
                                    width: 160,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(25),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 1,
                                      ),
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => Icon(
                                        Icons.remove_rounded,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : FlutterFlowTheme.of(context)
                                                .lineColor,
                                        size: 20,
                                      ),
                                      incrementIconBuilder: (enabled) => Icon(
                                        Icons.add_rounded,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .primaryColor
                                            : FlutterFlowTheme.of(context)
                                                .lineColor,
                                        size: 20,
                                      ),
                                      countBuilder: (count) => Text(
                                        count.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1,
                                      ),
                                      count: countControllerValue ??= 1,
                                      updateCount: (count) => setState(
                                          () => countControllerValue = count),
                                      stepSize: 1,
                                      minimum: 1,
                                      maximum: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final productDetailsCreateData = {
                          ...createProductDetailsRecordData(
                            name: widget.productSelection!.name,
                            description: widget.productSelection!.description,
                            price: widget.productSelection!.price,
                            quantity: countControllerValue,
                            cartRef: productDetailsCartRecord!.reference,
                            productCategoriesRef:
                                widget.productSelection!.reference,
                            productCategoriesPhoto:
                                widget.productSelection!.productPhoto,
                          ),
                          'modifiers': checkboxGroupValues1,
                          'modifiers_1': checkboxGroupValues2,
                        };
                        var productDetailsRecordReference =
                            ProductDetailsRecord.collection.doc();
                        await productDetailsRecordReference
                            .set(productDetailsCreateData);
                        productinCart =
                            ProductDetailsRecord.getDocumentFromData(
                                productDetailsCreateData,
                                productDetailsRecordReference);

                        final cartUpdateData = {
                          ...createCartRecordData(
                            cartActive: true,
                          ),
                          'productCount':
                              FieldValue.increment(countControllerValue!),
                          'subtotal': FieldValue.increment(functions.subtotal(
                              countControllerValue!,
                              widget.productSelection!.price!)),
                          'cartProducts':
                              FieldValue.arrayUnion([productinCart!.reference]),
                        };
                        await productDetailsCartRecord!.reference
                            .update(cartUpdateData);

                        context.pushNamed('Checkout');

                        setState(() {});
                      },
                      text: 'Add To Cart',
                      options: FFButtonOptions(
                        width: 270,
                        height: 50,
                        color: Color(0xFF775030),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
