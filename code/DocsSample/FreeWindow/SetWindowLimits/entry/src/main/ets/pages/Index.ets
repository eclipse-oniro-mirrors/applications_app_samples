@Entry
@Component
struct Index {
  @State message: string = 'setWindowLimits.';

  build() {
    RelativeContainer() {
      Row() {
        Row() {
          Text(this.message)
        }.height('50%')
        .width('100%')
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
    .width('100%')
  }
}
