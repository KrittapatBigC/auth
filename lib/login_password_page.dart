import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:core/ui/base_loading.dart';
//
//
// class LoginPasswordPage extends StatefulWidget {
//   const LoginPasswordPage({Key? key, required this.phoneNo}) : super(key: key);
//
//   final String? phoneNo;
//
//   @override
//   _LoginPasswordPageState createState() => _LoginPasswordPageState();
// }
//
// class _LoginPasswordPageState extends State<LoginPasswordPage> {
//   final TextEditingController _passwordController = TextEditingController();
//
//   final TextStyle textStyleInput = const TextStyle(fontSize: 16);
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: BaseAppBar(
//           isShowAppBar: true,
//           leftStatusBaseAppBar: LeftStatusBaseAppBar.back,
//           titleBaseAppBar: tr("account.title-login-password"),
//           onLeftPressCallback: () {
//             Navigator.pop(context);
//           }),
//       body: BaseContainerWidget(
//         onTap: () {},
//         child: SafeArea(
//           child: Consumer<LoginPasswordViewModel>(builder: (context, model, _) {
//             return SingleChildScrollView(
//               child: Stack(
//                 children: [
//                   Center(
//                       child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       constSpacing6,
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Row(
//                           children: [
//                             Text(
//                               tr("account.login-password-description1"),
//                               style: BaseTextStyle().bold(fontSize: 14),
//                             ),
//                             const SizedBox(width: 4),
//                             Text(
//                               tr("account.login-password-description2"),
//                               style: BaseTextStyle().regular(fontSize: 14),
//                             )
//                           ],
//                         ),
//                       ),
//                       constSpacing3,
//                       BaseTextField(
//                           semanticsLabel: "txtPassword",
//                           isPassword: true,
//                           label: tr("account.login-password-input-password"),
//                           enableSuggestions: true,
//                           controller: _passwordController,
//                           keyboardType: TextInputType.visiblePassword,
//                           textInputAction: TextInputAction.done),
//                       constSpacing4,
//                       Semantics(
//                         container: true,
//                         label: 'btnLogin',
//                         child: ButtonWidget(
//                           title: tr("account.login"),
//                           needLoading: false,
//                           onPressed: (btn) async {
//                             BaseLoading().startLoading();
//                             if (_passwordController.text.isNotEmpty)
//                               {
//                                 Resource<Login?> res = await model
//                                     .loginByPhone(context, widget.phoneNo ?? "",
//                                     _passwordController.text);
//                                 if(res.status == Status.SUCCESS){
//                                   _buildTrackVerifyPassword("success");
//                                   BaseLoading().stopLoading();
//                                   onHandleAfterLogin(model);
//                                 }else{
//                                   _buildTrackVerifyPassword("fail");
//                                   BaseLoading().stopLoading();
//                                   String errorMessage = res.message ?? "";
//                                   if(res.code == "authentication_failed"){
//                                     errorMessage = tr('account.alert-password-fail-desc');
//                                   }
//                                   // ignore: use_build_context_synchronously
//                                   Common.showErrorAlert(
//                                   context,
//                                   tr("common.noti-title"),
//                                       errorMessage,
//                                   tr("common.ok"),
//                                   onPressed: (modalContext) =>
//                                   Navigator.pop(
//                                   modalContext));
//                                 }
//                               }
//                             else
//                               {
//                                 BaseLoading().stopLoading();
//                                 Common.showErrorAlert(
//                                     context,
//                                     tr("common.noti-title"),
//                                     tr("account.alert-login-password-invalid"),
//                                     tr("common.ok"),
//                                     onPressed: (modalContext) =>
//                                         Navigator.pop(modalContext));
//                               }
//                           },
//                         ),
//                       ),
//                       constSpacing2,
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: Semantics(
//                           container: true,
//                           label: 'lblForgotPassword',
//                           child: GestureDetector(
//                             onTap: () {
//                               _buildTrackForgetPassword();
//                               context.router
//                                   .push(ForgotPasswordInputPhoneRoute())
//                                   .then((forgotPasswordValue) => {});
//                             },
//                             child: Text(
//                               tr("account.message-open-forgot-password"),
//                               style: BaseTextStyle().custom(
//                                 decoration: TextDecoration.underline,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//                 ],
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
//
//   void _buildTrackVerifyPassword(String status) {
//     AnalyticsParam param = AnalyticsParam(
//       ea: EventAction.verifyPassword.value(),
//       s:  Section.registerLogin.value(),
//       f: Feature.registerSpo.value(),
//       et: EventType.trackEvent.value(),
//       es: status,
//     );
//     AnalyticsManager().logEvent(param: param);
//   }
//
//   void _buildTrackForgetPassword() {
//     AnalyticsParam param = AnalyticsParam(
//       ea: EventAction.clickForgetPassword.value(),
//       s:  Section.registerLogin.value(),
//       f: Feature.registerSpo.value(),
//       et: EventType.trackEvent.value(),
//     );
//     AnalyticsManager().logEvent(param: param);
//   }
//
//   onHandleAfterLogin(LoginPasswordViewModel model) async {
//     InsiderFactoryManager().createInsider().login(model.login?.customer);
//     AppsFlyerManager().setCUID(model.login?.customer.id ?? 0);
//     model.saveUserToken(model.login?.auth.token ?? "");
//     model.saveUserId(model.login?.customer.id ?? 0);
//     model.logCustomerInfoFireBaseAnalytics(model.login?.customer);
//     model.logLoginEvent();
//     await context.read<ServiceGateViewModel>().getUserDefaultAddress(context,isFromLogin: true);
//     await context
//         .read<AccountViewModel>()
//         .setDefaultLanguage(context, model.login?.customer.language ?? "th");
//     context.read<CartViewModel>().loadCartAfterLogin();
//     context.read<NotificationViewModel>().getNotificationHistory();
//     context.read<AccountViewModel>().updateLoginStatus();
//     if ((context.read<AccountViewModel>().customer?.bigcard ?? "").isNotEmpty) {
//       context.read<BigPointViewModel>().getBigPoint(context);
//       context.read<BigPointViewModel>().getAllMyCouponList();
//       context.read<BigPointViewModel>().getBigPointProfile();
//       context.read<BigPointViewModel>().getPointExpire(context);
//       context.read<BigPointViewModel>().getBigCCouponsList();
//     }
//     BaseLoading().startLoading();
//     await context.read<AccountViewModel>().getUserFeature();
//     BaseLoading().stopLoading();
//     context.read<AccountViewModel>().userFeatureFromLogin = true;
//     Navigator.pop(context, true);
//   }
// }
