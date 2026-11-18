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

// [Start carAwareness_import]
import { carAwareness } from '@kit.MultimodalAwarenessKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
// [End carAwareness_import]

const TAG = 'CarAwareness';
const DOMAIN = 0x0000;

// [Start spatialMotion_parameter]
function getSpatialMotionEventType(event: number): string {
  switch (event) {
    case -1: return 'Invalid';
    case 0: return 'Ready';
    case 1: return 'Move';
    case 2: return 'Click';
    default: return 'Unknown';
  }
}
// [End spatialMotion_parameter]

// [Start realTimeWeather_parameter]
function getWeatherType(weather: number): string {
  switch (weather) {
    case -1: return 'Invalid';
    case 0: return 'Sunny/Cloudy';
    case 1: return 'Light Fog';
    case 2: return 'Heavy Fog';
    case 3: return 'Light Snow';
    case 4: return 'Heavy Snow';
    case 5: return 'Light Rain';
    case 6: return 'Heavy Rain';
    default: return 'Unknown';
  }
}
// [End realTimeWeather_parameter]

// [Start refueling_parameter]
function getRefuelingStatusType(status: number): string {
  switch (status) {
    case -1: return 'Invalid';
    case 0: return 'Idle';
    case 1: return 'Started';
    case 2: return 'Finished';
    default: return 'Unknown';
  }
}
// [End refueling_parameter]

// [Start spatialMotion_query]
async function querySpatialMotionCapability(): Promise<boolean> {
  try {
    const capabilityList = await carAwareness.getAllCapabilityList();
    const isSupported = capabilityList.includes(carAwareness.Capability.SPATIAL_MOTION);
    hilog.info(DOMAIN, TAG, 'Spatial motion supported: %{public}s', isSupported);
    return isSupported;
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'Failed to get capability list, error code: %{public}d', err.code);
    return false;
  }
}
// [End spatialMotion_query]

// [Start spatialMotion_subscribe]
function subscribeSpatialMotion(onUpdate: (data: string) => void): void {
  try {
    carAwareness.onSpatialMotion((motionInfo: carAwareness.SpatialMotionInfo) => {
      const eventType: string = getSpatialMotionEventType(motionInfo.event);
      const dataStr: string = `Event: ${eventType}, Position: (${motionInfo.pointX}, ${motionInfo.pointY})`;
      hilog.info(DOMAIN, TAG, 'Spatial motion event: %{public}d', motionInfo.event);
      hilog.info(DOMAIN, TAG, 'Hand coordinate: (%{public}d, %{public}d)', motionInfo.pointX, motionInfo.pointY);
      onUpdate(dataStr);
    });
    hilog.info(DOMAIN, TAG, 'Succeeded in subscribing spatial motion.');
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'Failed to subscribe spatial motion, error code: %{public}d', err.code);
  }
}
// [End spatialMotion_subscribe]

// [Start spatialMotion_unsubscribe]
function unsubscribeSpatialMotion(): void {
  try {
    carAwareness.offSpatialMotion();
    hilog.info(DOMAIN, TAG, 'Succeeded in unsubscribing spatial motion.');
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'Failed to unsubscribe spatial motion, error code: %{public}d', err.code);
  }
}
// [End spatialMotion_unsubscribe]

// [Start realTimeWeather_subscribe]
function subscribeWeather(onUpdate: (data: string) => void): void {
  try {
    carAwareness.onRealTimeWeather((weatherInfo: carAwareness.RealTimeWeatherInfo) => {
      const weatherType: string = getWeatherType(weatherInfo.weather);
      hilog.info(DOMAIN, TAG, 'Weather code: %{public}d', weatherInfo.weather);
      onUpdate(weatherType);
    });
    hilog.info(DOMAIN, TAG, 'Succeeded in subscribing realtime weather.');
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'Failed to subscribe realtime weather, error code: %{public}d', err.code);
  }
}
// [End realTimeWeather_subscribe]

// [Start realTimeWeather_unsubscribe]
function unsubscribeWeather(): void {
  try {
    carAwareness.offRealTimeWeather();
    hilog.info(DOMAIN, TAG, 'Succeeded in unsubscribing realtime weather.');
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'Failed to unsubscribe realtime weather, error code: %{public}d', err.code);
  }
}
// [End realTimeWeather_unsubscribe]

// [Start refueling_subscribe]
function subscribeRefueling(onUpdate: (data: string) => void): void {
  try {
    carAwareness.onRefueling((refuelingInfo: carAwareness.RefuelingInfo) => {
      const statusType: string = getRefuelingStatusType(refuelingInfo.status);
      hilog.info(DOMAIN, TAG, 'Refueling status: %{public}d', refuelingInfo.status);
      onUpdate(statusType);
    });
    hilog.info(DOMAIN, TAG, 'Succeeded in subscribing refueling status.');
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'Failed to subscribe refueling status, error code: %{public}d', err.code);
  }
}
// [End refueling_subscribe]

// [Start refueling_unsubscribe]
function unsubscribeRefueling(): void {
  try {
    carAwareness.offRefueling();
    hilog.info(DOMAIN, TAG, 'Succeeded in unsubscribing refueling status.');
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'Failed to unsubscribe refueling status, error code: %{public}d', err.code);
  }
}
// [End refueling_unsubscribe]

@Entry
@Component
export struct CarAwareness {
  @State capabilityList: string[] = [];
  @State spatialMotionSubscribed: boolean = false;
  @State weatherSubscribed: boolean = false;
  @State refuelingSubscribed: boolean = false;
  @State spatialMotionData: string = 'N/A';
  @State weatherData: string = 'N/A';
  @State refuelingData: string = 'N/A';
  @State logs: string[] = [];
  @State subscribedTypes: string[] = [];
  private logScroller: Scroller = new Scroller();

  log(msg: string): void {
    let logMsg: string = `${new Date().toLocaleTimeString()}: ${msg}`;
    this.logs.push(logMsg);
    if (this.logs.length > 100) {
      this.logs.shift();
    }
    hilog.info(DOMAIN, TAG, '%{public}s', msg);
    setTimeout((): void => {
      this.logScroller.scrollEdge(Edge.Bottom);
    }, 10);
  }

  addSubscription(type: string): void {
    if (!this.subscribedTypes.includes(type)) {
      this.subscribedTypes.push(type);
    }
  }

  removeSubscription(type: string): void {
    let index: number = this.subscribedTypes.indexOf(type);
    if (index > -1) {
      this.subscribedTypes.splice(index, 1);
    }
  }

  handleSubscribeSpatialMotion(): void {
    if (!this.spatialMotionSubscribed) {
      subscribeSpatialMotion((data: string) => {
        this.spatialMotionData = data;
        this.log(`[隔空手势] ${data}`);
      });
      this.spatialMotionSubscribed = true;
      this.addSubscription('SpatialMotion');
    }
  }

  handleUnsubscribeSpatialMotion(): void {
    if (this.spatialMotionSubscribed) {
      unsubscribeSpatialMotion();
      this.spatialMotionSubscribed = false;
      this.spatialMotionData = 'N/A';
      this.removeSubscription('SpatialMotion');
    }
  }

  handleSubscribeWeather(): void {
    if (!this.weatherSubscribed) {
      subscribeWeather((data: string) => {
        this.weatherData = data;
        this.log(`[实时天气] ${data}`);
      });
      this.weatherSubscribed = true;
      this.addSubscription('RealTimeWeather');
    }
  }

  handleUnsubscribeWeather(): void {
    if (this.weatherSubscribed) {
      unsubscribeWeather();
      this.weatherSubscribed = false;
      this.weatherData = 'N/A';
      this.removeSubscription('RealTimeWeather');
    }
  }

  handleSubscribeRefueling(): void {
    if (!this.refuelingSubscribed) {
      subscribeRefueling((data: string) => {
        this.refuelingData = data;
        this.log(`[补能状态] ${data}`);
      });
      this.refuelingSubscribed = true;
      this.addSubscription('Refueling');
    }
  }

  handleUnsubscribeRefueling(): void {
    if (this.refuelingSubscribed) {
      unsubscribeRefueling();
      this.refuelingSubscribed = false;
      this.refuelingData = 'N/A';
      this.removeSubscription('Refueling');
    }
  }

  build() {
    Column() {
      this.HeaderSection()
      Column() {
        this.LogSection()
      }
      .width('100%')
      .layoutWeight(40)

      Scroll() {
        Column({ space: 12 }) {
          this.ControlSection()
          this.QuerySection()
        }
        .width('100%')
        .padding(12)
      }
      .width('100%')
      .layoutWeight(60)
      .backgroundColor($r('sys.color.background_secondary'))
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('sys.color.background_primary'))
  }

  @Builder
  HeaderSection(): void {
    Column() {
      Row() {
        Text('Car Awareness 测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 12, bottom: 8 })
    }
    .width('100%')
    .backgroundColor($r('sys.color.background_primary'))
  }

  @Builder
  LogSection(): void {
    Column() {
      Scroll(this.logScroller) {
        Column() {
          ForEach(this.logs, (log: string, index: number) => {
            Text(log)
              .fontSize(10)
              .fontColor('#E0E0E0')
              .fontFamily('monospace')
              .width('100%')
              .wordBreak(WordBreak.BREAK_ALL)
              .maxLines(10)

          })
        }
        .width('95%')
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#1E1E1E')
      .margin(12)
      .borderRadius(8)
    }
    .width('100%')
    .backgroundColor('#2D2D2D')
  }

  @Builder
  QuerySection(): void {
    Column() {
      Text('设备能力查询')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .padding({ bottom: 8 })
      Button('查询能力列表')
        .width('100%')
        .onClick((): void => {
          carAwareness.getAllCapabilityList()
            .then((list) => {
              this.capabilityList = list;
              this.log(`查询能力列表`);
              hilog.info(DOMAIN, TAG, '能力列表:%{public}s', JSON.stringify(list));
            })
            .catch((err: BusinessError) => {
              this.log(`查询异常: ${err.code} - ${err.message}`);
            });
        })
    }
    .width('100%')
    .padding(12)
    .backgroundColor($r('sys.color.background_primary'))
    .borderRadius(12)
  }

  @Builder
  ControlSection(): void {
    Column() {
      Text('控制')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .padding({ bottom: 8 })

      Row() {
        Text('隔空手势')
          .fontSize(12)
          .layoutWeight(1)
        Button('订阅')
          .onClick((): void => {
            this.log('订阅隔空手势');
            this.handleSubscribeSpatialMotion();
          })
          .fontSize(10)
          .width(90)
        Blank().width(8)
        Button('取消订阅')
          .onClick((): void => {
            this.log('取消订阅隔空手势');
            this.handleUnsubscribeSpatialMotion();
          })
          .fontSize(10)
          .width(90)
      }
      .width('100%')
      .padding({ top: 6, bottom: 6 })

      Row() {
        Text('实时天气')
          .fontSize(12)
          .layoutWeight(1)
        Button('订阅')
          .onClick((): void => {
            this.log('订阅实时天气');
            this.handleSubscribeWeather();
          })
          .fontSize(10)
          .width(90)
        Blank().width(8)
        Button('取消订阅')
          .onClick((): void => {
            this.log('取消订阅实时天气');
            this.handleUnsubscribeWeather();
          })
          .fontSize(10)
          .width(90)
      }
      .width('100%')
      .padding({ top: 6, bottom: 6 })

      Row() {
        Text('补能状态')
          .fontSize(12)
          .layoutWeight(1)
        Button('订阅')
          .onClick((): void => {
            this.log('订阅补能状态');
            this.handleSubscribeRefueling();
          })
          .fontSize(10)
          .width(90)
        Blank().width(8)
        Button('取消订阅')
          .onClick((): void => {
            this.log('取消订阅补能状态');
            this.handleUnsubscribeRefueling();
          })
          .fontSize(10)
          .width(90)
      }
      .width('100%')
      .padding({ top: 6, bottom: 6 })
    }
    .width('100%')
    .padding(12)
    .backgroundColor($r('sys.color.background_primary'))
    .borderRadius(12)
  }
}
