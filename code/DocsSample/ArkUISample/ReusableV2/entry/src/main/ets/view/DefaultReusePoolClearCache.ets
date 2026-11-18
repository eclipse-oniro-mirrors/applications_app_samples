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
//[Start DefaultReusePoolClearCache]
import { UIUtils } from '@kit.ArkUI';

@ReusableV2
@ComponentV2
struct ReusableChild {
  @Param label: string = '';
  aboutToAppear() {
    console.info(`ReusableChild [${this.label}] aboutToAppear`);
  }
  aboutToDisappear() {
    console.info(`ReusableChild [${this.label}] aboutToDisappear`);
  }
  aboutToRecycle() {
    console.info(`ReusableChild [${this.label}] aboutToRecycle`);
  }
  aboutToReuse() {
    console.info(`ReusableChild [${this.label}] aboutToReuse`);
  }

  build() {
    Text(`ReusableChild: ${this.label}`)
  }
}

@Entry
@ComponentV2
struct Index {
  @Local showA: boolean = true;
  @Local showB: boolean = true;

  build() {
    Column() {
      if (this.showA) {
        ReusableChild({ label: 'A' })
          .reuse({ reuseId: () => 'A' })
      }
      if (this.showB) {
        ReusableChild({ label: 'B' })
          .reuse({ reuseId: () => 'B' })
      }
      Button('Recycle A')
        .onClick(() => {
          // 切换if分支，触发子组件回收
          this.showA = false;
        })
      Button('Recycle B')
        .onClick(() => {
          // 切换if分支，触发子组件回收
          this.showB = false;
        })
      Button('Clear All')
        .onClick(() => {
          // 清理默认复用池中的全部组件
          UIUtils.getCustomComponentContext(this).getDefaultReusePool()?.clearCache();
        })
      Button('Clear A')
        .onClick(() => {
          // 仅清理reuseId为'A'的组件
          UIUtils.getCustomComponentContext(this).getDefaultReusePool()?.clearCache('A');
        })
    }
  }
}

//[End DefaultReusePoolClearCache]
const defaultReusePoolClearCachePage = Index;

export default defaultReusePoolClearCachePage;
