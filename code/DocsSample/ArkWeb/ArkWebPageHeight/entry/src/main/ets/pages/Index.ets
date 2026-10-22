// xxx.ets
import { webview } from '@kit.ArkWeb';

// 场景2：复杂动态网页使用 JSBridge 传递特定回调
class TestClass {
  testController: webview.WebviewController;
  onGetHeight: (height: string) => void = () => {};

  constructor(controller: webview.WebviewController) {
    this.testController = controller;
  }

  notifyToGet(): void {
    setTimeout(() => {
      try {
        const h = this.testController.getPageHeight();
        console.info("page height: " + h);
        this.onGetHeight(String(h));
      } catch (err) {
        console.error("page height: notifyToGet error: " + JSON.stringify(err));
      }
    }, 300)
  }
}

// 场景1：普通静态展示页面
@Component
struct Scene1Static {
  controller: webview.WebviewController = new webview.WebviewController();
  @State heightText: string = '等待获取...';

  build() {
    Column() {
      Text('getPageHeight: ' + this.heightText)
        .width('100%')
        .padding(12)
        .fontSize(16)
        .backgroundColor('#f5f5f5')
        .textAlign(TextAlign.Center)

      Web({ src: $rawfile('scene1_index.html'), controller: this.controller })
        .layoutWeight(1)
        .onPageEnd(() => {
          this.heightText = 'onPageEnd 已触发，等待布局完成...';
          setTimeout(() => {
            try {
              const h = this.controller.getPageHeight();
              console.info("page height: onPageEnd: " + h);
              this.heightText = String(h) + ' px';
            } catch (err) {
              console.error("page height: onPageEnd error: " + JSON.stringify(err));
              this.heightText = '获取失败';
            }
          }, 300)
        })
    }
    .width('100%')
    .height('100%')
  }
}

// 场景2：复杂动态网页使用 JSBridge 传递特定回调
@Component
struct Scene2JsBridge {
  controller: webview.WebviewController = new webview.WebviewController();
  @State heightText: string = '等待获取...';
  @State jsbObj: TestClass = new TestClass(this.controller);

  aboutToAppear(): void {
    this.jsbObj.onGetHeight = (h: string) => {
      this.heightText = h + ' px';
    };
  }

  build() {
    Column() {
      Text('getPageHeight: ' + this.heightText)
        .width('100%')
        .padding(12)
        .fontSize(16)
        .backgroundColor('#f5f5f5')
        .textAlign(TextAlign.Center)

      Web({ src: $rawfile('scene2_index.html'), controller: this.controller })
        .layoutWeight(1)
        .javaScriptAccess(true)
        .javaScriptProxy({
          object: this.jsbObj,
          name: "jsbObj",
          methodList: ["notifyToGet"],
          controller: this.controller
        })
    }
    .width('100%')
    .height('100%')
  }
}

// 场景3：无法使用 JSBridge 场景
@Component
struct Scene3SetTimeout {
  controller: webview.WebviewController = new webview.WebviewController();
  @State heightText: string = '等待获取...';

  build() {
    Column() {
      Text('getPageHeight: ' + this.heightText)
        .width('100%')
        .padding(12)
        .fontSize(16)
        .backgroundColor('#f5f5f5')
        .textAlign(TextAlign.Center)

      Web({ src: $rawfile('scene3_index.html'), controller: this.controller })
        .layoutWeight(1)
        .onPageEnd(() => {
          this.heightText = 'onPageEnd 已触发，2s 后获取...';
          setTimeout(() => {
            try {
              const h = this.controller.getPageHeight();
              console.info("page height: onPageEnd: setTimeout: " + h);
              this.heightText = String(h) + ' px';
            } catch (err) {
              console.error("page height: onPageEnd setTimeout error: " + JSON.stringify(err));
              this.heightText = '获取失败';
            }
          }, 2000)
        })
    }
    .width('100%')
    .height('100%')
  }
}

@Entry
@Component
struct Index {
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Scene1Static()
        }
        .tabBar('场景1')

        TabContent() {
          Scene2JsBridge()
        }
        .tabBar('场景2')

        TabContent() {
          Scene3SetTimeout()
        }
        .tabBar('场景3')
      }
    }
    .height('100%')
    .width('100%')
  }
}