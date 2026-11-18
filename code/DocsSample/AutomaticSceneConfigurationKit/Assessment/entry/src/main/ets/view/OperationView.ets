@ComponentV2
export default struct OperationView {
  @Param isActive: boolean = false;
  @Event onBegin: () => void = () => {};
  @Event onEnd: () => void = () => {};
  @Event onQueryState: () => void = () => {};
  @Event onQueryConfig: () => void = () => {};

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.operation_title'))
        .fontSize($r('app.float.font_size_section'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Row({ space: 12 }) {
        Button($r('app.string.begin_button'))
          .layoutWeight(1)
          .height(44)
          .fontSize($r('app.float.font_size_caption'))
          .enabled(!this.isActive)
          .id('assessment_begin_button')
          .onClick(() => {
            this.onBegin();
          })
        Button($r('app.string.end_button'))
          .layoutWeight(1)
          .height(44)
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.warning'))
          .enabled(this.isActive)
          .id('assessment_end_button')
          .onClick(() => {
            this.onEnd();
          })
      }
      .width('100%')

      Row({ space: 12 }) {
        Button($r('app.string.query_state_button'))
          .layoutWeight(1)
          .height(44)
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.page_background'))
          .fontColor($r('app.color.body_font'))
          .id('assessment_query_state_button')
          .onClick(() => {
            this.onQueryState();
          })
        Button($r('app.string.query_config_button'))
          .layoutWeight(1)
          .height(44)
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.page_background'))
          .fontColor($r('app.color.body_font'))
          .id('assessment_query_config_button')
          .onClick(() => {
            this.onQueryConfig();
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
