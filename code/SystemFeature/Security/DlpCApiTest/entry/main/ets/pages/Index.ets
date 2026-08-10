@Entry
@Component
struct Index {
  @State message: string = 'DLP CAPI TEST';
  pageInfos: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Text(this.message)
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.message = 'Welcome';
          })


        Button('c api test')
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'c_api_test' })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
