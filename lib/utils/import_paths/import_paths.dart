// import

import 'dart:ui';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_app/utils/app_regex.dart';
import 'package:pizza_app/utils/controller/auth_controller/singup_controller.dart';
import 'package:pizza_app/utils/controller/home_controller/home_constroller.dart';
import 'package:pizza_app/utils/controller/lang/app_lang.dart';
import 'package:pizza_app/utils/model/pizza_model.dart';
import 'package:pizza_app/widgets/lang_ui.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/utils/colors/app_colors.dart';

//* part Pages
part '../../start_app.dart';
part '../../views/auth/welcome_view.dart';
part '../../views/auth/log_in_view.dart';
part '../../views/auth/sign_up_view.dart';
part '../../views/home/Home_screen.dart';
part '../../views/details-screen/details_screen.dart';
part '../../views/auth/wrapper.dart';

//* widgets
part '../../widgets/custom_text_form_field.dart';
part '../../views/details-screen/widgets/card_details.dart';
part '../widgets/custom_text_button.dart';

//* controllers
part '../controller/auth_controller/login_controller.dart';
part '../controller/lang/c_languages.dart';
