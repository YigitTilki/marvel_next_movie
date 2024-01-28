import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class ProjectSpacer extends SizedBox {
  //Vertical Space
  ProjectSpacer.vertical5({super.key}) : super(height: 5.h);
  ProjectSpacer.vertical10({super.key}) : super(height: 10.h);
  ProjectSpacer.vertical15({super.key}) : super(height: 15.h);
  ProjectSpacer.vertical20({super.key}) : super(height: 20.h);
  ProjectSpacer.vertical25({super.key}) : super(height: 25.h);
  ProjectSpacer.vertical30({super.key}) : super(height: 30.h);

  //Horizontal Space
  ProjectSpacer.horizontal5({super.key}) : super(width: 5.w);
  ProjectSpacer.horizontal10({super.key}) : super(width: 10.w);
  ProjectSpacer.horizontal15({super.key}) : super(width: 15.w);
  ProjectSpacer.horizontal20({super.key}) : super(width: 20.w);
  ProjectSpacer.horizontal25({super.key}) : super(width: 25.w);
  ProjectSpacer.horizontal30({super.key}) : super(width: 30.w);
}
