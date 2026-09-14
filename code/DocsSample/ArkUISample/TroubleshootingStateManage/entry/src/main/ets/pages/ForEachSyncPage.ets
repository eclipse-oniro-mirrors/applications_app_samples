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

// [Start ForEachSyncCorrect]
import { UIUtils } from '@kit.ArkUI';
import { util } from '@kit.ArkTS';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;
const TAG: string = '[Sample_TroubleshootingStateManage]';

@Observed
class Info {
  public value: string = 'info';
}

@Entry
@Component
struct ForEachSyncPage {
  @State infos: Info[] = [new Info()];

  build() {
    Column() {
      // 第一步：点击该Button
      // 触发ForEach的刷新，ForEach对比前后key值改变，触发Child的重建，@ObjectLink info指向新的Info的实例
      Button('change first item value')
        .onClick(() => {
        this.infos[0] = new Info();
      })

      // 第二步：点击该Button，@ObjectLink info的@Watch的函数被触发
      // 日志打印：this.infos[0] hashcode: 358024053
      Button('change first item value')
        .onClick(() => {
        this.infos[0].value += '1';
        hilog.info(DOMAIN, TAG, '%{public}s', `this.infos[0] hashcode: ${util.getHash(this.infos[0])}`);
      })

      ForEach(this.infos, (item: Info) => {
        InfoItemDisplay({ info: item })
      }, (item: Info) => {
        // 随机数key值
        return item.value + Math.random().toString();
      })
    }
  }
}

@Component
struct InfoItemDisplay {
  @ObjectLink @Watch('onChange') info: Info;

  aboutToAppear(): void {
    // 日志输出:
    // 首次创建： info is observed object, hashcode: 2026693567
    // 点击Button('change first item value')，触发Child重建：info is observed object, hashcode: 358024053
    hilog.info(DOMAIN, TAG, '%{public}s', `info is ${UIUtils.getTarget(this.info) === this.info ? 'not observed object' :
      'observed object'}, hashcode: ${util.getHash(this.info)}`);
  }

  onChange() {
    hilog.info(DOMAIN, TAG, '%{public}s', `info property has been changed ${this.info.value}`);
  }

  build() {
    Column() {
      Text(`Child: info value: ${this.info.value}`)
        .onClick(() => {
          this.info.value += '2';
        })
    }
  }
}
// [End ForEachSyncCorrect]
