import 'package:flutter/material.dart';
import 'package:go_share/ui/registration_request/widgets/status_chip.dart';
import 'package:go_share/ui/registration_request/widgets/vehicle_request_item.dart';

class RegistrationItemsList extends StatefulWidget {

  final ChipStatus status;

  const RegistrationItemsList({required this.status});

  @override
  _RegistrationItemsListState createState() => _RegistrationItemsListState();
}

class _RegistrationItemsListState extends State<RegistrationItemsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (ctx, idx){
        return VehicleRequestItem(status: widget.status);
      },
    );
  }
}
