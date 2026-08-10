import testNapi from 'libentry.so';

@Builder
export function CApiTestBuilder() {
  CApiTest();
}

@Entry
@Component
struct CApiTest {
  pageInfos: NavPathStack = new NavPathStack();
  @State message: string = '点击按钮开始测试';

  @Builder
  buttonBuilder() {
    Button('GetDlpPermissionInfo')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.GetDlpPermissionInfo();
        this.message = result.toString();
      })

    Button('GetOriginalFileName')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.GetOriginalFileName();
        this.message = result.toString();
      })

    Button('IsInSandbox')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.IsInSandbox();
        this.message = result.toString();
      })

    Button('SetSandboxAppConfig')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.SetSandboxAppConfig();
        this.message = result.toString();
      })

    Button('GetSandboxAppConfig')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.GetSandboxAppConfig();
        this.message = result.toString();
      })

    Button('CleanSandboxAppConfig')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.CleanSandboxAppConfig();
        this.message = result.toString();
      })
  }

  build() {
    NavDestination() {
      Column() {
        Button('clear').onClick(() => {
          this.message = '';
        })
        Scroll() {
          Text(this.message)
            .margin(20)
        }
        .height(100)

        Scroll() {
          Flex({
            direction: FlexDirection.Column,
            justifyContent: FlexAlign.Start
          }) {
            this.buttonBuilder()
          }
        }.layoutWeight(1)
      }
      .width('100%')
      .height('100%')
    }
    .title('C Api Test')
    .onBackPressed(() => {
      this.pageInfos.pop();
      return true;
    })
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}