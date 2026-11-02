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

// [Start location_import_module]
import { geoLocationManager } from '@kit.LocationKit';
// [End location_import_module]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { NavBar, SectionCard, LabelRow, LogArea, MAX_LOG_MESSAGES } from '../components/CommonComponents';

@Component
export struct LocationPage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State switchEnabled: boolean = false;
  @State switchQueried: boolean = false;
  @State singleLocation: geoLocationManager.Location | null = null;
  @State singleLocationSource: string = '';
  @State continuousLocation: geoLocationManager.Location | null = null;
  @State continuousCount: number = 0;
  @State isContinuousOn: boolean = false;
  @State logMessages: string[] = [];
  // The same callback reference must be passed to on and off.
  locationCallback: (location: geoLocationManager.Location) => void =
    (location: geoLocationManager.Location): void => {
      hilog.info(0x0000, '[Sample_LocationKit]', 'locationCallback invoked');
    };

  // Update continuous-location UI state. Called from the location callback so
  // that all @State assignments happen inside a component method and the UI
  // refresh notification is triggered reliably.
  applyContinuousUpdate(location: geoLocationManager.Location): void {
    this.continuousLocation = location;
    this.continuousCount++;
    this.addLog(`on locationChange: ${this.formatLocation(location)}`);
  }

  aboutToAppear() {
    hilog.info(0x0000, '[Sample_LocationKit]', 'LocationPage aboutToAppear');
  }

  aboutToDisappear() {
    hilog.info(0x0000, '[Sample_LocationKit]', 'LocationPage aboutToDisappear');
    this.stopContinuousLocation();
  }

  addLog(msg: string) {
    this.logMessages = [`[${new Date().toLocaleTimeString()}] ${msg}`, ...this.logMessages].slice(0, MAX_LOG_MESSAGES);
  }

  formatLocation(location: geoLocationManager.Location): string {
    return `(${location.latitude}, ${location.longitude})`;
  }

  // Query whether the system location switch is enabled
  checkSwitchState() {
    // [Start location_is_enabled]
    try {
      let locationEnabled = geoLocationManager.isLocationEnabled();
      // [StartExclude location_is_enabled]
      this.switchEnabled = locationEnabled;
      this.switchQueried = true;
      this.addLog(`isLocationEnabled: ${locationEnabled}`);
      // [EndExclude location_is_enabled]
    } catch (err) {
      console.error('errCode:' + err.code + ', message:' + err.message);
    }
    // [End location_is_enabled]
  }

  // Obtain the last cached location
  getLastLocation() {
    // [Start location_get_last_location]
    try {
      let location = geoLocationManager.getLastLocation();
      // [StartExclude location_get_last_location]
      this.singleLocation = location;
      this.singleLocationSource = 'getLastLocation';
      this.addLog(`getLastLocation: ${this.formatLocation(location)}`);
      // [EndExclude location_get_last_location]
    } catch (err) {
      console.error('errCode:' + JSON.stringify(err));
      // [StartExclude location_get_last_location]
      this.addLog(`getLastLocation failed: ${JSON.stringify(err)}`);
      // [EndExclude location_get_last_location]
    }
    // [End location_get_last_location]
  }

  // Obtain the current location once with the fast locating strategy
  getCurrentLocation() {
    // [Start location_get_current_location]
    let request: geoLocationManager.SingleLocationRequest = {
      'locatingPriority': geoLocationManager.LocatingPriority.PRIORITY_LOCATING_SPEED,
      'locatingTimeoutMs': 10000
    }
    try {
      geoLocationManager.getCurrentLocation(request).then((result) => { // 调用getCurrentLocation获取当前设备位置，通过promise接收上报的位置
        console.info('current location: ' + JSON.stringify(result));
        // [StartExclude location_get_current_location]
        this.singleLocation = result;
        this.singleLocationSource = 'getCurrentLocation';
        this.addLog(`getCurrentLocation: ${this.formatLocation(result)}`);
        // [EndExclude location_get_current_location]
      })
      .catch((error: BusinessError) => { // 接收上报的错误码
        console.error('promise, getCurrentLocation: error=' + JSON.stringify(error));
        // [StartExclude location_get_current_location]
        this.addLog(`getCurrentLocation failed: ${JSON.stringify(error)}`);
        // [EndExclude location_get_current_location]
      });
    } catch (err) {
      console.error('errCode:' + JSON.stringify(err));
      // [StartExclude location_get_current_location]
      this.addLog(`getCurrentLocation failed: ${JSON.stringify(err)}`);
      // [EndExclude location_get_current_location]
    }
    // [End location_get_current_location]
  }

  // Start continuous locating in the navigation scenario
  startContinuousLocation() {
    // [Start location_on_location_change]
    let request: geoLocationManager.ContinuousLocationRequest = {
      'interval': 1,
      'locationScenario': geoLocationManager.UserActivityScenario.NAVIGATION
    }
    this.locationCallback = (location: geoLocationManager.Location): void => {
      console.info('locationCallback: data: ' + JSON.stringify(location));
      // [StartExclude location_on_location_change]
      this.applyContinuousUpdate(location);
      // [EndExclude location_on_location_change]
    };
    try {
      geoLocationManager.on('locationChange', request, this.locationCallback);
      // [StartExclude location_on_location_change]
      this.isContinuousOn = true;
      this.addLog('on locationChange started');
      // [EndExclude location_on_location_change]
    } catch (err) {
      console.error('errCode:' + JSON.stringify(err));
      // [StartExclude location_on_location_change]
      this.addLog(`on locationChange failed: ${JSON.stringify(err)}`);
      // [EndExclude location_on_location_change]
    }
    // [End location_on_location_change]
  }

  // Stop continuous locating
  stopContinuousLocation() {
    if (!this.isContinuousOn) {
      return;
    }
    // [Start location_off_location_change]
    // 该回调函数需要与on接口传入的回调函数保持一致。
    geoLocationManager.off('locationChange', this.locationCallback);
    // [StartExclude location_off_location_change]
    this.isContinuousOn = false;
    this.addLog('off locationChange done');
    // [EndExclude location_off_location_change]
    // [End location_off_location_change]
  }

  build() {
    Column() {
      NavBar({ title: $r('app.string.nav_location'), onBack: () => { this.pageInfos.pop(); } })

      Scroll() {
        Column() {
          SectionCard({}) {
            Text($r('app.string.location_description'))
              .fontSize(13)
              .fontColor($r('app.color.text_hint'))
              .width('100%')
          }

          SectionCard({ title: $r('app.string.section_location_switch'), testId: 'section_location_switch' }) {
            LabelRow({ label: $r('app.string.label_switch_state'),
              value: this.switchQueried ?
                (this.switchEnabled ? $r('app.string.status_enabled') : $r('app.string.status_disabled')) :
                $r('app.string.label_unknown') })
            Button($r('app.string.btn_check_switch'))
              .id('btn_check_switch')
              .width('100%')
              .margin({ top: 4 })
              .onClick(() => { this.checkSwitchState(); })
          }

          SectionCard({ title: $r('app.string.section_single_location'), testId: 'section_single_location' }) {
            if (this.singleLocation === null) {
              Text($r('app.string.no_location_result'))
                .fontSize(14)
                .fontColor($r('app.color.text_disabled'))
                .margin({ bottom: 12 })
            } else {
              LabelRow({ label: $r('app.string.label_latitude'), value: `${this.singleLocation.latitude}` })
              LabelRow({ label: $r('app.string.label_longitude'), value: `${this.singleLocation.longitude}` })
              LabelRow({ label: $r('app.string.label_accuracy'), value: `${this.singleLocation.accuracy}` })
              LabelRow({ label: $r('app.string.label_time'),
                value: `${new Date(this.singleLocation.timeStamp).toLocaleTimeString()} (${this.singleLocationSource})` })
            }
            Row({ space: 8 }) {
              Button($r('app.string.btn_get_last_location'))
                .id('btn_get_last_location')
                .layoutWeight(1)
                .fontSize(14)
                .onClick(() => { this.getLastLocation(); })
              Button($r('app.string.btn_get_current_location'))
                .id('btn_get_current_location')
                .layoutWeight(1)
                .fontSize(14)
                .onClick(() => { this.getCurrentLocation(); })
            }
            .width('100%')
            .margin({ top: 8 })
          }

          SectionCard({ title: $r('app.string.section_continuous_location'), testId: 'section_continuous_location' }) {
            if (this.continuousLocation === null) {
              Text($r('app.string.no_location_result'))
                .fontSize(14)
                .fontColor($r('app.color.text_disabled'))
                .margin({ bottom: 12 })
            } else {
              LabelRow({ label: $r('app.string.label_latitude'), value: `${this.continuousLocation.latitude}` })
              LabelRow({ label: $r('app.string.label_longitude'), value: `${this.continuousLocation.longitude}` })
              LabelRow({ label: $r('app.string.label_accuracy'), value: `${this.continuousLocation.accuracy}` })
              LabelRow({ label: $r('app.string.label_location_count'),
                value: `${this.continuousCount}` })
            }
            Button($r('app.string.btn_start_continuous'))
              .id('btn_start_continuous')
              .width('100%')
              .margin({ top: 8 })
              .enabled(!this.isContinuousOn)
              .onClick(() => { this.startContinuousLocation(); })
            Button($r('app.string.btn_stop_continuous'))
              .id('btn_stop_continuous')
              .width('100%')
              .margin({ top: 8 })
              .enabled(this.isContinuousOn)
              .backgroundColor($r('app.color.color_danger'))
              .onClick(() => { this.stopContinuousLocation(); })
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
