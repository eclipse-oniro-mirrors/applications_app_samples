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

// [Start V1ObserveCorrect]
import { UIUtils } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;
const TAG: string = '[Sample_TroubleshootingStateManage]';

class Outer {
  public value: string = 'outer';
  public inner: Inner = new Inner();
}

@Observed
class Inner {
  public value: string = 'inner';
}

@Entry
@Component
struct ObservabilityPage {
  @State outer: Outer = new Outer();

  build() {
    Column() {
      Text(`Index: outer value: ${this.outer.value}`)
      InnerDisplay({ inner: this.outer.inner })
    }
  }
}

@Component
struct InnerDisplay {
  @ObjectLink @Watch('onChange') inner: Inner;

  aboutToAppear(): void {
    // 日志输出：inner is observed object
    hilog.info(DOMAIN, TAG, '%{public}s', `inner is ${UIUtils.getTarget(this.inner) === this.inner ? 'not observed object' :
      'observed object'}`);
  }

  onChange() {
    hilog.info(DOMAIN, TAG, '%{public}s', `inner property has been changed ${this.inner.value}`)
  }

  build() {
    Column() {
      Text(`Child: inner value: ${this.inner.value}`)
        .onClick(() => {
          this.inner.value += '!';
        })
    }
  }
}
// [End V1ObserveCorrect]
