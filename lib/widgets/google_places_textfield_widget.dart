import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:demo/configs/constants.dart';

class GooglePlacesTextFieldWidget extends StatelessWidget {
  const GooglePlacesTextFieldWidget({
    super.key,
    required this.placeHolderText,
    required this.controller,
    this.disableButtonHandler,
    this.getPlaceDetailHandler,
    this.boxDecoration,
    required this.focusNode,
  });

  final String placeHolderText;
  final TextEditingController controller;
  final VoidCallback? disableButtonHandler;
  final BoxDecoration? boxDecoration;
  final Function(Prediction)? getPlaceDetailHandler;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      boxDecoration: boxDecoration ?? const BoxDecoration(),
      textEditingController: controller,
      googleAPIKey: apiKey,

      focusNode: focusNode,
      inputDecoration: InputDecoration(
          border: InputBorder.none,
          hintText: placeHolderText,
          contentPadding: const EdgeInsets.only(left: 0),
          hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 20,
              fontWeight: FontWeight.w400)),
      debounceTime: 300, // default 600 ms,
      countries: const ["SA"], // optional by default null is set
      isLatLngRequired: true, // if you required coordinates from place detail
      getPlaceDetailWithLatLng:
          getPlaceDetailHandler, // this callback is called when isLatLngRequired is true
      itemClick: (Prediction prediction) {
        controller.text = prediction.description ?? "";
        controller.selection = TextSelection.fromPosition(
            TextPosition(offset: prediction.description!.length));
      },
      // if we want to make custom list item builder
      itemBuilder: (context, index, Prediction prediction) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [Expanded(child: Text(prediction.description ?? ""))],
          ),
        );
      },
      // if you want to add seperator between list items
      seperatedBuilder: const Divider(),
      // want to show close icon
      isCrossBtnShown: true,
      // optional container padding
      containerHorizontalPadding: 10,
      // place type
      placeType: PlaceType.geocode,
    );
  }
}
