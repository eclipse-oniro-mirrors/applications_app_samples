import { apiResultLabel } from './QueryPresentation';

@Component
export struct ApiCallDetails {
  @Prop supportResult: string = '未调用';
  @Prop statusResult: string = '未调用';
  @Prop errorCode: string = '';
  @Prop errorMessage: string = '';

  build() {
    Column({ space: 12 }) {
      Column({ space: 4 }) {
        Text('isAutoStartupSupported()')
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
          .wordBreak(WordBreak.BREAK_ALL)
          .width('100%')
        Text(apiResultLabel(this.supportResult))
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .wordBreak(WordBreak.BREAK_ALL)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      Column({ space: 4 }) {
        Text('getAutoStartupStatusForSelf()')
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
          .wordBreak(WordBreak.BREAK_ALL)
          .width('100%')
        Text(apiResultLabel(this.statusResult))
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .wordBreak(WordBreak.BREAK_ALL)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      Text(`错误码：${this.errorCode.length > 0 ? this.errorCode : '无'}`)
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .wordBreak(WordBreak.BREAK_ALL)
        .width('100%')
      if (this.errorMessage.length > 0) {
        Text(`错误信息：${this.errorMessage}`)
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
          .wordBreak(WordBreak.BREAK_ALL)
          .width('100%')
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}
