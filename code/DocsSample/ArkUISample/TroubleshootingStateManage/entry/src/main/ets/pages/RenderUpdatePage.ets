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

// [Start RenderUpdateCorrect]
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;
const TAG: string = '[Sample_TroubleshootingStateManage]';
const INIT_WIDTH: number = 100; // Image initial width value
const CHANGED_WIDTH: number = 200; // Image width value after change
const IMAGE_HEIGHT: number = 500; // Image fixed height value

@Entry
@Component
struct RenderUpdatePage {
  @State widthValue: number = INIT_WIDTH;
  @State resourceFlag: boolean = true;

  getHeightValue(): number {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Image render');
    return IMAGE_HEIGHT;
  }

  build() {
    Column() {
      Image(this.resourceFlag ? $r('app.media.startIcon') : $r('app.media.background'))
        .width(this.widthValue)
        .height(this.getHeightValue())
        .backgroundColor(Color.Pink)
        .onComplete((event) => {
          setTimeout(() =>{
            this.widthValue = CHANGED_WIDTH;
            hilog.info(DOMAIN, TAG, '%{public}s', `Image onComplete ${this.widthValue} load status: ${event?.loadingStatus}`);
          });
        })

      Button('change resource')
        .onClick(() => {
        // 第一步：改变resourceFlag，使得两个Resource变量都进入Image组件的缓存
        // 第三步：再次改变Image的Resource，此时onComplete为同步回调
        // onComplete的回调中异步修改widthValue为200
        // Image宽度刷新为200
        this.resourceFlag = !this.resourceFlag;
      })

      Button('change widthValue')
        .onClick(() => {
        // 第二步：改变image宽度为100
        this.widthValue = INIT_WIDTH;
      })
    }
    .height('100%')
    .width('100%')
  }
}
// [End RenderUpdateCorrect]
