/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Logger from '../../../../main/ets/model/Logger';

@Entry
@Component
struct Index {
  aboutToAppear(): void {
    Logger.info('[Sample_CertManager]', 'TestAbility index aboutToAppear');
  }
  @State message: Resource = $r('app.string.hello_world_text');
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text($r('app.string.next_page_text'))
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor($r('app.color.button_blue'))
         .width('35%')
         .height('5%')
         .onClick(()=>{
         })
       }
       .width('100%')
     }
     .height('100%')
   }
 }
