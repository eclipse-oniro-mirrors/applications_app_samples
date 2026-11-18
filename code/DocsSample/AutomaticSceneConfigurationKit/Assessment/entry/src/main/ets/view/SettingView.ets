import SettingModel from '../model/SettingModel';

@ComponentV2
export default struct SettingView {
  @Param setting: SettingModel = new SettingModel();

  build() {
    Column({ space: 12 }) {
      Text('加固配置')
        .fontSize($r('app.float.font_size_section'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Row() {
        Text('进入考试后清空剪贴板')
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.setting.clearClipboard })
          .onChange((isOn: boolean) => {
            this.setting.clearClipboard = isOn;
          })
      }
      .width('100%')

      Row() {
        Text('进入考试后开启隐私模式')
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.setting.privacyMode })
          .onChange((isOn: boolean) => {
            this.setting.privacyMode = isOn;
          })
      }
      .width('100%')

      Row() {
        Text('进入考试后使用简单键盘')
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.setting.simpleKeyboard })
          .onChange((isOn: boolean) => {
            this.setting.simpleKeyboard = isOn;
          })
      }
      .width('100%')

      Divider()
        .color($r('app.color.divider'))

      // Row() {
      //   Text('开发者模式允许进入考试')
      //     .fontSize($r('app.float.font_size_body'))
      //     .fontColor($r('app.color.body_font'))
      //     .layoutWeight(1)
      //   Toggle({ type: ToggleType.Switch, isOn: this.setting.allowDeveloperMode })
      //     .onChange((isOn: boolean) => {
      //       this.setting.allowDeveloperMode = isOn;
      //     })
      // }
      // .width('100%')

      Row() {
        Text('模拟器允许进入考试')
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.setting.allowEmulator })
          .onChange((isOn: boolean) => {
            this.setting.allowEmulator = isOn;
          })
      }
      .width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding($r('app.float.card_padding'))
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
  }
}
