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

// [Start geofence_import_module]
import { geoLocationManager } from '@kit.LocationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { notificationManager } from '@kit.NotificationKit';
// [End geofence_import_module]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NavBar, SectionCard, LabelRow, LogArea, MAX_LOG_MESSAGES } from '../components/CommonComponents';

@Component
export struct GeofencePage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State fenceLatitude: string = '34.12';
  @State fenceLongitude: string = '124.11';
  @State fenceRadius: string = '10000';
  @State fenceId: number = -1;
  @State fenceEvents: string[] = [];
  @State logMessages: string[] = [];

  aboutToAppear() {
    hilog.info(0x0000, '[Sample_LocationKit]', 'GeofencePage aboutToAppear');
  }

  aboutToDisappear() {
    hilog.info(0x0000, '[Sample_LocationKit]', 'GeofencePage aboutToDisappear');
    this.removeFence();
  }

  addLog(msg: string) {
    this.logMessages = [`[${new Date().toLocaleTimeString()}] ${msg}`, ...this.logMessages].slice(0, MAX_LOG_MESSAGES);
  }

  // Describe a transition event in a readable way
  describeTransition(transition: geoLocationManager.GeofenceTransition): string {
    let action: string = `${transition.transitionEvent}`;
    if (transition.transitionEvent === geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER) {
      action = 'ENTER';
    } else if (transition.transitionEvent ===
      geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT) {
      action = 'EXIT';
    }
    return `fence ${transition.geofenceId}: ${action}`;
  }

  // Create the fence, subscribe to enter/exit transitions, and add the fence
  addFence() {
    let latitude: number = Number(this.fenceLatitude);
    let longitude: number = Number(this.fenceLongitude);
    let radius: number = Number(this.fenceRadius);
    if (Number.isNaN(latitude) || Number.isNaN(longitude) || Number.isNaN(radius) || radius <= 0) {
      this.addLog('Invalid fence parameters');
      return;
    }

    // [Start geofence_create_fence]
    // 通过WantAgentInfo的operationType设置动作类型
    let geofence: geoLocationManager.Geofence = {
      'latitude': latitude, 'longitude': longitude, 'radius': radius, 'expiration': 10000.0
    }
    // [End geofence_create_fence]

    // [Start geofence_transition_events]
    let transitionStatusList: geoLocationManager.GeofenceTransitionEvent[] = [
      geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER,
      geoLocationManager.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT,
    ];
    // [End geofence_transition_events]

    // [Start geofence_notifications]
    // GEOFENCE_TRANSITION_EVENT_ENTER事件
    let notificationRequest1: notificationManager.NotificationRequest = {
      id: 1,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: 'Geofence notification',
          text: 'Entered the geofence',
          additionalText: ''
        }
      }
    };
    // 创建GEOFENCE_TRANSITION_EVENT_EXIT事件对应的通知对象
    let notificationRequest2: notificationManager.NotificationRequest = {
      id: 2,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: 'Geofence notification',
          text: 'Exited the geofence',
          additionalText: ''
        }
      }
    };
    // [End geofence_notifications]

    this.addLog('addGnssGeofence requested');
    // [Start geofence_add_fence]
    // 把创建的通知对象存入Array中，存入顺序与transitionStatusList一致
    let notificationRequestList: notificationManager.NotificationRequest[] =
      [notificationRequest1, notificationRequest2];
    // 构造GNSS地理围栏请求对象gnssGeofenceRequest
    let gnssGeofenceRequest: geoLocationManager.GnssGeofenceRequest = {
      // 围栏属性，包含圆心和半径等信息
      geofence: geofence,
      // 指定APP需要监听的地理围栏事件类型
      monitorTransitionEvents: transitionStatusList,
      // 地理围栏事件对应的通知对象，该参数为可选
      notifications: notificationRequestList,
      // 用于监听围栏事件的callback
      geofenceTransitionCallback: (err: BusinessError, transition: geoLocationManager.GeofenceTransition) => {
        if (err) {
          console.error('geofenceTransitionCallback: err=' + JSON.stringify(err));
        }
        if (transition) {
          console.info('GeofenceTransition: %{public}s', JSON.stringify(transition));
        }
        // [StartExclude geofence_add_fence]
        if (err) {
          this.addLog(`geofenceTransitionCallback err: ${JSON.stringify(err)}`);
        }
        if (transition) {
          let eventText = this.describeTransition(transition);
          this.fenceEvents = [`[${new Date().toLocaleTimeString()}] ${eventText}`, ...this.fenceEvents];
          this.addLog(`GeofenceTransition: ${eventText}`);
        }
        // [EndExclude geofence_add_fence]
      }
    }
    try {
      // 添加围栏
      geoLocationManager.addGnssGeofence(gnssGeofenceRequest).then((id) => {
        // 围栏添加成功后返回围栏ID
        console.info('addGnssGeofence success, fence id: ' + id);
        let fenceId = id;
        // [StartExclude geofence_add_fence]
        this.fenceId = fenceId;
        this.addLog(`addGnssGeofence success, fence id: ${fenceId}`);
        // [EndExclude geofence_add_fence]
      }).catch((err: BusinessError) => {
        console.error('addGnssGeofence failed, promise errCode:' + (err as BusinessError).code +
          ',errMessage:' + (err as BusinessError).message);
        // [StartExclude geofence_add_fence]
        this.addLog(`addGnssGeofence failed: ${err.code}`);
        // [EndExclude geofence_add_fence]
      });
    } catch (error) {
      console.error('addGnssGeofence failed, err:' + JSON.stringify(error));
      // [StartExclude geofence_add_fence]
      this.addLog(`addGnssGeofence failed: ${JSON.stringify(error)}`);
      // [EndExclude geofence_add_fence]
    }
    // [End geofence_add_fence]
  }

  // Remove the fence added before
  removeFence() {
    if (this.fenceId < 0) {
      return;
    }
    // [Start geofence_remove_fence]
    // fenceId是在geoLocationManager.addGnssGeofence执行成功后获取的
    let fenceId = this.fenceId;
    try {
      geoLocationManager.removeGnssGeofence(fenceId).then(() => {
        console.info('removeGnssGeofence success fenceId:' + fenceId);
        // [StartExclude geofence_remove_fence]
        this.addLog(`removeGnssGeofence success fenceId: ${fenceId}`);
        // [EndExclude geofence_remove_fence]
      }).catch((error: BusinessError) => {
        console.error('removeGnssGeofence: error=' + JSON.stringify(error));
        // [StartExclude geofence_remove_fence]
        this.addLog(`removeGnssGeofence failed: ${JSON.stringify(error)}`);
        // [EndExclude geofence_remove_fence]
      });
    } catch (error) {
      console.error('removeGnssGeofence: error=' + JSON.stringify(error));
      // [StartExclude geofence_remove_fence]
      this.addLog(`removeGnssGeofence failed: ${JSON.stringify(error)}`);
      // [EndExclude geofence_remove_fence]
    }
    // [StartExclude geofence_remove_fence]
    this.fenceId = -1;
    // [EndExclude geofence_remove_fence]
    // [End geofence_remove_fence]
  }

  build() {
    Column() {
      NavBar({ title: $r('app.string.nav_geofence'), onBack: () => { this.pageInfos.pop(); } })

      Scroll() {
        Column() {
          SectionCard({}) {
            Text($r('app.string.geofence_description'))
              .fontSize(13)
              .fontColor($r('app.color.text_hint'))
              .width('100%')
          }

          SectionCard({ title: $r('app.string.section_fence_params'), testId: 'section_fence_params' }) {
            Row() {
              Text($r('app.string.label_fence_latitude'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              TextInput({ text: this.fenceLatitude })
                .id('input_fence_latitude')
                .type(InputType.NUMBER_DECIMAL)
                .height(40)
                .fontSize(13)
                .width(150)
                .onChange((value: string) => { this.fenceLatitude = value; })
            }
            .width('100%')
            Row() {
              Text($r('app.string.label_fence_longitude'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              TextInput({ text: this.fenceLongitude })
                .id('input_fence_longitude')
                .type(InputType.NUMBER_DECIMAL)
                .height(40)
                .fontSize(13)
                .width(150)
                .onChange((value: string) => { this.fenceLongitude = value; })
            }
            .width('100%')
            Row() {
              Text($r('app.string.label_fence_radius'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              TextInput({ text: this.fenceRadius })
                .id('input_fence_radius')
                .type(InputType.NUMBER_DECIMAL)
                .height(40)
                .fontSize(13)
                .width(150)
                .onChange((value: string) => { this.fenceRadius = value; })
            }
            .width('100%')

            LabelRow({ label: $r('app.string.label_fence_id'),
              value: this.fenceId < 0 ? $r('app.string.no_fence_added') : `${this.fenceId}` })

            Button($r('app.string.btn_add_fence'))
              .id('btn_add_fence')
              .width('100%')
              .margin({ top: 8 })
              .enabled(this.fenceId < 0)
              .onClick(() => { this.addFence(); })
            Button($r('app.string.btn_remove_fence'))
              .id('btn_remove_fence')
              .width('100%')
              .margin({ top: 8 })
              .enabled(this.fenceId >= 0)
              .backgroundColor($r('app.color.color_danger'))
              .onClick(() => { this.removeFence(); })
          }

          SectionCard({ title: $r('app.string.section_fence_events'), testId: 'section_fence_events' }) {
            if (this.fenceEvents.length === 0) {
              Text($r('app.string.no_fence_events'))
                .fontSize(14)
                .fontColor($r('app.color.text_disabled'))
            } else {
              ForEach(this.fenceEvents, (event: string) => {
                Text(event)
                  .fontSize(12)
                  .fontColor($r('app.color.text_secondary'))
                  .width('100%')
                  .padding({ top: 4, bottom: 4 })
              })
            }
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
