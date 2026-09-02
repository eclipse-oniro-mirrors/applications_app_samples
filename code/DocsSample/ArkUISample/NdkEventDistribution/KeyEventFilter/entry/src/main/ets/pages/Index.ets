/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import testNapi from 'libentry.so';
import window from '@ohos.window';

@Entry
@Component
struct Index {
  @State message: string = '';
  @State windowId: number|undefined = AppStorage.get<number>('windId');
  @State registerResult: string = 'NA';
  @State clearResult: string = 'NA';

  build() {
    Column({space: 20}) {
      Text('注册' + this.registerResult)
        .id('HelloWorld')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Text('取消注册' + this.clearResult)
        .id('HelloWorld2')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Button('注册过滤回调函数')
        .width('100%')
        .onClick(() => {
          let ret: number = testNapi.registerFilter(this.windowId!);
          this.registerResult = ret == 0? 'success' : 'fail';
          hilog.info(0x0000, 'testTag', 'registerFilter ret:', ret);
        })
      Button('取消过滤回调函数')
        .width('100%')
        .onClick(() => {
          let ret: number = testNapi.clearFilter(this.windowId!);
          this.clearResult = ret == 0? 'success' : 'fail';
          hilog.info(0x0000, 'testTag', 'clearFilter ret:', ret);
        })
      TextInput()

    }
    .width('100%').height('100%')
  }
}