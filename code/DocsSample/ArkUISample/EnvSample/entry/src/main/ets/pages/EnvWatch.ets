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

// [Start EnvWatch]
import { WithEnv } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct Index {
  @State fontScaleNum: number = 1;

  build() {
    Column() {
      Button('update').onClick(() => {
        this.fontScaleNum++;
      })

      WithEnv() {
        ChildV1()
      }
      .env(WritableEnvKey.FONT_SCALE, this.fontScaleNum)
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct ChildV1 {
  @Env(WritableEnvKey.FONT_SCALE) @Watch('onEnvUpdate') fontScaleVal: number;

  onEnvUpdate(){
    hilog.info(0x0000, 'testTag',`Env value has changed Watched`);
  }

  build() {
    Column() {
      Text('FontScale val is:'  + this.fontScaleVal)
    }
    .height('100%')
    .width('100%')
  }
}
// [End EnvWatch]
