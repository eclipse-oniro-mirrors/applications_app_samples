/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// [Start syncmonitor_component_destruction]
import { hilog } from '@kit.PerformanceAnalysisKit';

@ObservedV2
class InfoWrapper {
  public info?: Info;

  constructor(info: Info) {
    this.info = info;
  }
}

@ObservedV2
class Info {
  @Trace public age: number;

  constructor(age: number) {
    this.age = age;
  }
}

@ComponentV2
struct Child {
  @Param @Require infoWrapper: InfoWrapper;

  @SyncMonitor('infoWrapper.info.age')
  onInfoAgeChange(monitor: IMonitor) {
    hilog.info(0xFF00, 'testTag', '%{public}s',
      `age change from ${monitor.value()?.before} to ${monitor.value()?.now}`);
  }

  aboutToDisappear(): void {
    hilog.info(0xFF00, 'testTag', '%{public}s', 'Child aboutToDisappear');
  }

  build() {
    Column() {
      Text(`${this.infoWrapper.info?.age}`)
    }
  }
}

@Entry
@ComponentV2
struct Index {
  dataArray: Info[] = [];
  @Local showFlag: boolean = true;

  aboutToAppear(): void {
    for (let i = 0; i < 5; i++) {
      this.dataArray.push(new Info(i));
    }
  }

  build() {
    Column() {
      Button('change showFlag')
        .onClick(() => {
          this.showFlag = !this.showFlag;
        })
      Button('change number')
        .onClick(() => {
          hilog.info(0xFF00, 'testTag', '%{public}s', 'click to change age');
          this.dataArray.forEach((info: Info) => {
            info.age += 100;
          });
        })
      if (this.showFlag) {
        Column() {
          Text('Children')
          ForEach(this.dataArray, (info: Info) => {
            Child({ infoWrapper: new InfoWrapper(info) })
          })
        }
        .borderColor(Color.Red)
        .borderWidth(2)
      }
    }
  }
}
// [End syncmonitor_component_destruction]

@Builder
export function syncMonitorComponentDestruction() {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.syncmonitor_component_destruction'))
}
