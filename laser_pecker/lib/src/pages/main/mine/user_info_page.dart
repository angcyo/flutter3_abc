part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/13
///

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage>
    with AbsScrollMixin, LpScrollPageMixin {
  late UserModel userModel;

  @override
  void initState() {
    userModel = context.getViewModel();
    super.initState();
  }

  WidgetList _buildUserInfoTile(BuildContext context, UserBean? userBean) {
    var globalConfig = GlobalConfig.of(context);
    var userBean = userModel.userBeanData.value;
    return [
      SingleLabelInfoTile(
        labelWidget: CircleNetworkImage(url: userBean?.avatar),
        onTap: () {
          //todo
        },
      ).rDecoration(
        fillColor: globalConfig.globalTheme.themeWhiteColor,
        sliverPadding:
            const EdgeInsets.symmetric(vertical: kXxh, horizontal: kXh),
        bottomLineColor: globalConfig.globalTheme.lineColor,
        bottomLineMargin: const EdgeInsets.only(left: kX, right: kX),
      ),
      SingleLabelInfoTile(
        label: "昵称",
        info: userBean?.nickname,
        onTap: () {
          //todo
        },
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "账号",
        info: userBean?.email ?? userBean?.mobile,
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "所在地区",
        info: join(
          " ",
          userBean?.region,
          userBean?.province,
          userBean?.city,
        ),
        onTap: () {
          //todo
        },
      ).rItemTile(),
    ];
  }

  @override
  String? getTitle(BuildContext context) => "个人信息";

  @override
  Widget build(BuildContext context) {
    return userModel.userBeanData.listener((context, liveData, error) {
      return buildScaffold(context, _buildUserInfoTile(context, liveData));
    });
  }
}
