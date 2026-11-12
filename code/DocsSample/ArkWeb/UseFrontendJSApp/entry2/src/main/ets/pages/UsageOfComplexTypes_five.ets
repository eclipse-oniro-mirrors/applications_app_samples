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

// [Start the_front_end_page_calls_the_function_in_the_object_on_the_application_side]
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';

// 定义返回给前端页面的对象类型，其中的方法可供前端页面调用
class ObjOther {
  public methodNameListForJsProxy: string[];

  constructor(list: string[]) {
    this.methodNameListForJsProxy = list;
  }

  testOther(json: string): void {
    console.info(json);
  }
}

class TestClass {
public objReturn: ObjOther

  constructor() {
    this.objReturn = new ObjOther(['testOther']);
  }

  // 返回包含方法的对象，前端页面可调用该对象内的方法
  test(): ESObject {
    return this.objReturn
  }

  toString(param: string): void {
    console.info('Web Component toString' + param);
  }
}

@Entry
@Component
struct Index {
  webviewController: webview.WebviewController = new webview.WebviewController();
  @State testObj: TestClass = new TestClass();

  build() {
    Column() {
      Button('refresh')
        .onClick(() => {
          try {
            this.webviewController.refresh();
          } catch (error) {
            console.error(
              `ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
          }
        })
      // 使用registerJavaScriptProxy注册对象到window上
      Button('Register JavaScript To Window')
        .onClick(() => {
          try {
            this.webviewController.registerJavaScriptProxy(this.testObj, 'testObjName', ['test', 'toString']);
          } catch (error) {
            console.error(
              `ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
          }
        })
      // 解除已注册的对象
      Button('deleteJavaScriptRegister')
        .onClick(() => {
          try {
            this.webviewController.deleteJavaScriptRegister('testObjName');
          } catch (error) {
            console.error(
              `ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: $rawfile('index5.html'), controller: this.webviewController })
    }
  }
}
// [End the_front_end_page_calls_the_function_in_the_object_on_the_application_side]