/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct Index {
  pathStack: NavPathStack = new NavPathStack();
  aboutToAppear(): void {
    this.getRouter();
  }
  build() {
    // 设置NavPathStack并传入Navigation
    Navigation(this.pathStack) {
      // ...

    }.width('100%').height('100%')
    .title('Navigation, get Router.')
    .mode(NavigationMode.Stack)
  }

  getRouter(){
    // [Start get_router]
    // 跳转页面
    this.getUIContext().getRouter().pushUrl({ url:'pages/PageOne', params: null });

    // 返回页面
    this.getUIContext().getRouter().back({ url: 'pages/PageOne' });

    // 替换当前页面
    this.getUIContext().getRouter().replaceUrl({ url: 'pages/PageOne' });

    // 清空所有页面
    this.getUIContext().getRouter().clear();

    // 获取页面栈大小
    let size = this.getUIContext().getRouter().getLength();

    // 获取页面状态
    let pageState = this.getUIContext().getRouter().getState();
    // [End get_router]
  }
}