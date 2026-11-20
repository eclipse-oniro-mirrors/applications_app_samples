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

import { hilog } from '@kit.PerformanceAnalysisKit';
import entryDemo from 'libentry.so';
import { NavBar, SectionCard, LabelRow, LogArea, MAX_LOG_MESSAGES } from '../components/CommonComponents';

// Shape of the JSON string reported by the native side.
interface NativeLocation {
  latitude: number;
  longitude: number;
  altitude: number;
  accuracy: number;
  speed: number;
  direction: number;
  timeSinceBoot: number;
  additionalInfo: string;
}

@Component
export struct LocationCapiPage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State nativeSwitchEnabled: boolean = false;
  @State nativeSwitchQueried: boolean = false;
  @State nativeLocation: NativeLocation | null = null;
  @State nativeCount: number = 0;
  @State isNativeOn: boolean = false;
  @State logMessages: string[] = [];

  aboutToAppear() {
    hilog.info(0x0000, '[Sample_LocationKit]', 'LocationCapiPage aboutToAppear');
  }

  aboutToDisappear() {
    hilog.info(0x0000, '[Sample_LocationKit]', 'LocationCapiPage aboutToDisappear');
    this.stopNativeLocating();
  }

  addLog(msg: string) {
    this.logMessages = [`[${new Date().toLocaleTimeString()}] ${msg}`, ...this.logMessages].slice(0, MAX_LOG_MESSAGES);
  }

  // Query the location switch state through the Location C API
  checkNativeSwitch() {
    let enabled: boolean = entryDemo.ohLocationIsEnabled();
    this.nativeSwitchEnabled = enabled;
    this.nativeSwitchQueried = true;
    this.addLog(`ohLocationIsEnabled: ${enabled}`);
  }

  // Apply a native location report to the UI state. Called from the native
  // callback so that @State assignments run inside a component method and the
  // UI refresh notification is triggered reliably.
  applyNativeUpdate(data: string): void {
    hilog.info(0x0000, '[Sample_LocationKit]', `native location: ${data}`);
    try {
      let location: NativeLocation = JSON.parse(data) as NativeLocation;
      this.nativeLocation = location;
      this.nativeCount++;
      this.addLog(`native report: (${location.latitude}, ${location.longitude})`);
    } catch (err) {
      hilog.error(0x0000, '[Sample_LocationKit]', `parse native location failed: ${JSON.stringify(err)}`);
    }
  }

  // Register the report callback, then start native continuous locating
  startNativeLocating() {
    entryDemo.setNativeCallback((data: string) => {
      this.applyNativeUpdate(data);
    });
    let ret: number = entryDemo.ohLocationStartLocating();
    this.isNativeOn = ret === 0;
    this.addLog(`ohLocationStartLocating ret: ${ret}`);
  }

  // Stop native continuous locating
  stopNativeLocating() {
    if (!this.isNativeOn) {
      return;
    }
    let ret: number = entryDemo.ohLocationStopLocating();
    this.isNativeOn = false;
    this.addLog(`ohLocationStopLocating ret: ${ret}`);
  }

  build() {
    Column() {
      NavBar({ title: $r('app.string.nav_location_capi'), onBack: () => { this.pageInfos.pop(); } })

      Scroll() {
        Column() {
          SectionCard({}) {
            Text($r('app.string.location_capi_description'))
              .fontSize(13)
              .fontColor($r('app.color.text_hint'))
              .width('100%')
          }

          SectionCard({ title: $r('app.string.section_native_switch'), testId: 'section_native_switch' }) {
            LabelRow({ label: $r('app.string.label_native_switch_state'),
              value: this.nativeSwitchQueried ?
                (this.nativeSwitchEnabled ? $r('app.string.status_enabled') : $r('app.string.status_disabled')) :
                $r('app.string.label_unknown') })
            Button($r('app.string.btn_native_check_switch'))
              .id('btn_native_check_switch')
              .width('100%')
              .margin({ top: 4 })
              .onClick(() => { this.checkNativeSwitch(); })
          }

          SectionCard({ title: $r('app.string.section_native_locating'), testId: 'section_native_locating' }) {
            if (this.nativeLocation === null) {
              Text($r('app.string.no_location_result'))
                .fontSize(14)
                .fontColor($r('app.color.text_disabled'))
                .margin({ bottom: 12 })
            } else {
              LabelRow({ label: $r('app.string.label_latitude'), value: `${this.nativeLocation.latitude}` })
              LabelRow({ label: $r('app.string.label_longitude'), value: `${this.nativeLocation.longitude}` })
              LabelRow({ label: $r('app.string.label_accuracy'), value: `${this.nativeLocation.accuracy}` })
              LabelRow({ label: $r('app.string.label_time_since_boot'),
                value: `${this.nativeLocation.timeSinceBoot}` })
              LabelRow({ label: $r('app.string.label_native_report_count'), value: `${this.nativeCount}` })
            }
            Button($r('app.string.btn_native_start'))
              .id('btn_native_start')
              .width('100%')
              .margin({ top: 8 })
              .enabled(!this.isNativeOn)
              .onClick(() => { this.startNativeLocating(); })
            Button($r('app.string.btn_native_stop'))
              .id('btn_native_stop')
              .width('100%')
              .margin({ top: 8 })
              .enabled(this.isNativeOn)
              .backgroundColor($r('app.color.color_danger'))
              .onClick(() => { this.stopNativeLocating(); })
          }

          LogArea({ logMessages: this.logMessages })
        }
        .width('100%')
        .padding({ top: 12, left: 16, right: 16, bottom: 24 })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
