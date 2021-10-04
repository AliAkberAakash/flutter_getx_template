import 'package:flutter/material.dart';
import 'package:go_share/data/models/booking/my_booking_list_response.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';

import 'colors.dart';

String getType(Booking booking){
  if(booking.isApproved==0)
    return "Pending";
  else{
    if(booking.isFinished==0)
      return "On Going";
    else return "Finished";
  }
}

Color getColor(Booking booking){
  if(booking.isApproved==0)
    return GSColors.pending_Color;
  else{
    if(booking.isFinished==0)
      return GSColors.ongoing_Color;
    else return finishedChipColor;
  }
}