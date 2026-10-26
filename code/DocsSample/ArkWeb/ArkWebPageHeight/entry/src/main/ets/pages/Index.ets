/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// xxx.ets
import { webview } from '@kit.ArkWeb';

// 场景2：复杂动态网页使用 JSBridge 传递特定回调
class TestClass {
  private testController: webview.WebviewController;
  public onGetHeight: (height: string) => void = () => {};

  constructor(controller: webview.WebviewController) {
    this.testController = controller;
  }

  notifyToGet(): void {
    setTimeout(() => {
      try {
        const h: number = this.testController.getPageHeight();
        console.info(`page height: ${h}`);
        this.onGetHeight(String(h));
      } catch (err) {
        console.error(`page height: notifyToGet error: ${JSON.stringify(err)}`);
      }
    }, 300)
  }
}

// 场景1：普通静态展示页面
// [Start ordinary_static_display_page]
@Component
struct Scene1Static {
  controller: webview.WebviewController = new webview.WebviewController();
  @State heightText: ResourceStr = $r('app.string.waiting_for_height');

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
          this.heightText = $r('app.string.scene1_on_page_end');
          setTimeout(() => {
            try {
<<<<<<< HEAD
              const h = this.controller.getPageHeight();
              console.info('page height: onPageEnd: ' + h);
              this.heightText = String(h) + ' px';
            } catch (err) {
              console.error('page height: onPageEnd error: ' + JSON.stringify(err));
=======
              const h: number = this.controller.getPageHeight();
              console.info(`page height: onPageEnd: ${h}`);
              this.heightText = String(h) + ' px';
            } catch (err) {
              console.error(`page height: onPageEnd error: ${JSON.stringify(err)}`);
>>>>>>> ff01f308b3... replenish s  empty code
              this.heightText = $r('app.string.get_height_failed');
            }
          }, 300)
        })
    }
    .width('100%')
    .height('100%')
  }
}
// [End ordinary_static_display_page]

// 场景2：复杂动态网页使用 JSBridge 传递特定回调
// [Start complex_dynamic_web_pages]
@Component
struct Scene2JsBridge {
  controller: webview.WebviewController = new webview.WebviewController();
  @State heightText: ResourceStr = $r('app.string.waiting_for_height');
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
// [End complex_dynamic_web_pages]

// 场景3：无法使用 JSBridge 场景
// [Start jsb_cannot_be_used]
@Component
struct Scene3SetTimeout {
  controller: webview.WebviewController = new webview.WebviewController();
  @State heightText: ResourceStr = $r('app.string.waiting_for_height');

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
          this.heightText = $r('app.string.scene3_on_page_end');
          setTimeout(() => {
            try {
<<<<<<< HEAD
              const h = this.controller.getPageHeight();
              console.info('page height: onPageEnd: setTimeout: ' + h);
              this.heightText = String(h) + ' px';
            } catch (err) {
              console.error('page height: onPageEnd setTimeout error: ' + JSON.stringify(err));
=======
              const h: number = this.controller.getPageHeight();
              console.info(`page height: onPageEnd: setTimeout: ${h}`);
              this.heightText = String(h) + ' px';
            } catch (err) {
              console.error(`page height: onPageEnd setTimeout error: ${JSON.stringify(err)}`);
>>>>>>> ff01f308b3... replenish s  empty code
              this.heightText = $r('app.string.get_height_failed');
            }
          }, 2000)
        })
    }
    .width('100%')
    .height('100%')
  }
}
// [End jsb_cannot_be_used]

@Entry
@Component
struct Index {
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Scene1Static()
        }
        .tabBar($r('app.string.tab_scene1'))

        TabContent() {
          Scene2JsBridge()
        }
        .tabBar($r('app.string.tab_scene2'))

        TabContent() {
          Scene3SetTimeout()
        }
        .tabBar($r('app.string.tab_scene3'))
      }
    }
    .height('100%')
    .width('100%')
  }
}