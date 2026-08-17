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

@Component
struct QuerySection {
  @Link capabilityList: string[];

  aboutToAppear(): void {
  }

  async queryCapability(): Promise<void> {
    try {
      this.capabilityList = await carAwareness.getAllCapabilityList();
      hilog.info(DOMAIN, TAG, 'Capability list: %{public}s', JSON.stringify(this.capabilityList));
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Failed to query capability, error code: %{public}d', err.code);
    }
  }

  build() {
    Column() {
      Text('设备能力查询')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 12 });

      Button('查询能力列表')
        .height(40)
        .fontSize(13)
        .borderRadius(20)
        .backgroundColor('#2196F3')
        .width('100%')
        .onClick(() => this.queryCapability());

      if (this.capabilityList.length > 0) {
        Text('支持的能力: ' + this.capabilityList.length)
          .fontSize(12)
          .fontColor('#666666')
          .margin({ top: 8 });
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#FAFAFA')
    .borderRadius(12);
  }
}

@Component
struct SubscribeSection {
  @Link spatialMotionSubscribed: boolean;
  @Link weatherSubscribed: boolean;
  @Link refuelingSubscribed: boolean;

  build() {
    Column() {
      Text('感知功能订阅')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 12 });

      List() {
        ListItem() {
          Row() {
            Text('隔空手势')
              .fontSize(14);
            Blank();
            Text(this.spatialMotionSubscribed ? '已订阅' : '未订阅')
              .id('spatialMotionStatus')
              .fontSize(12)
              .fontColor(this.spatialMotionSubscribed ? '#4CAF50' : '#9E9E9E');
          }
          .padding(12);
        }

        ListItem() {
          Row() {
            Text('实时天气')
              .fontSize(14);
            Blank();
            Text(this.weatherSubscribed ? '已订阅' : '未订阅')
              .id('weatherStatus')
              .fontSize(12)
              .fontColor(this.weatherSubscribed ? '#4CAF50' : '#9E9E9E');
          }
          .padding(12);
        }

        ListItem() {
          Row() {
            Text('补能状态')
              .fontSize(14);
            Blank();
            Text(this.refuelingSubscribed ? '已订阅' : '未订阅')
              .id('refuelingStatus')
              .fontSize(12)
              .fontColor(this.refuelingSubscribed ? '#4CAF50' : '#9E9E9E');
          }
          .padding(12);
        }
      }
      .borderRadius(12)
      .backgroundColor('#F5F5F5');
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#FFFFFF')
    .borderRadius(12);
  }
}

@Component
struct ControlSection {
  onSubscribeSpatialMotion?: () => void;
  onUnsubscribeSpatialMotion?: () => void;
  onSubscribeWeather?: () => void;
  onUnsubscribeWeather?: () => void;
  onSubscribeRefueling?: () => void;
  onUnsubscribeRefueling?: () => void;

  build() {
    Column() {
      Text('控制')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 12 });

      Column() {
        Row() {
          Text('隔空手势')
            .fontSize(14)
            .fontColor('#666666');
          Blank();
        }
        .margin({ bottom: 8 });

        Row() {
          Button('订阅')
            .id('button1')
            .height(36)
            .fontSize(12)
            .borderRadius(18)
            .backgroundColor('#FF9800')
            .onClick(() => this.onSubscribeSpatialMotion?.());

          Blank().width(12);

          Button('取消订阅')
            .id('button2')
            .height(36)
            .fontSize(12)
            .borderRadius(18)
            .backgroundColor('#9C27B0')
            .onClick(() => this.onUnsubscribeSpatialMotion?.());
        }
      }
      .padding(12)
      .backgroundColor('#F5F5F5')
      .borderRadius(12)
      .margin({ bottom: 12 });

      Column() {
        Row() {
          Text('实时天气')
            .fontSize(14)
            .fontColor('#666666');
          Blank();
        }
        .margin({ bottom: 8 });

        Row() {
          Button('订阅')
            .id('button3')
            .height(36)
            .fontSize(12)
            .borderRadius(18)
            .backgroundColor('#FF9800')
            .onClick(() => this.onSubscribeWeather?.());

          Blank().width(12);

          Button('取消订阅')
            .id('button4')
            .height(36)
            .fontSize(12)
            .borderRadius(18)
            .backgroundColor('#9C27B0')
            .onClick(() => this.onUnsubscribeWeather?.());
        }
      }
      .padding(12)
      .backgroundColor('#F5F5F5')
      .borderRadius(12)
      .margin({ bottom: 12 });

      Column() {
        Row() {
          Text('补能状态')
            .fontSize(14)
            .fontColor('#666666');
          Blank();
        }
        .margin({ bottom: 8 });

        Row() {
          Button('订阅')
            .id('button5')
            .height(36)
            .fontSize(12)
            .borderRadius(18)
            .backgroundColor('#FF9800')
            .onClick(() => this.onSubscribeRefueling?.());

          Blank().width(12);

          Button('取消订阅')
            .id('button6')
            .height(36)
            .fontSize(12)
            .borderRadius(18)
            .backgroundColor('#9C27B0')
            .onClick(() => this.onUnsubscribeRefueling?.());
        }
      }
      .padding(12)
      .backgroundColor('#F5F5F5')
      .borderRadius(12);
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#FFFFFF')
    .borderRadius(12);
  }
}

@Component
struct SimulateSection {
  @Link spatialMotionData: string;
  @Link weatherData: string;
  @Link refuelingData: string;

  @Builder
  DataRow(label: string, value: string, rowId: string) {
    Row() {
      Text(label)
        .fontSize(14)
        .fontColor('#666666');
      Blank();
      Text(value)
        .id(rowId)
        .fontSize(14)
        .fontWeight(FontWeight.Medium);
    }
    .padding({ top: 8, bottom: 8 });
  }

  build() {
    Column() {
      Text('感知数据')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 12 });

      Column() {
        this.DataRow('隔空手势', this.spatialMotionData, 'spatialMotionText');
        Divider().color('#E0E0E0');
        this.DataRow('实时天气', this.weatherData, 'weatherText');
        Divider().color('#E0E0E0');
        this.DataRow('补能状态', this.refuelingData, 'refuelingText');
      }
      .padding(12)
      .borderRadius(12)
      .backgroundColor('#FAFAFA');
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#FFFFFF')
    .borderRadius(12);
  }
}

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

  handleSubscribeSpatialMotion(): void {
    if (!this.spatialMotionSubscribed) {
      subscribeSpatialMotion((data: string) => {
        this.spatialMotionData = data;
      });
      this.spatialMotionSubscribed = true;
    }
  }

  handleUnsubscribeSpatialMotion(): void {
    if (this.spatialMotionSubscribed) {
      unsubscribeSpatialMotion();
      this.spatialMotionSubscribed = false;
      this.spatialMotionData = 'N/A';
    }
  }

  handleSubscribeWeather(): void {
    if (!this.weatherSubscribed) {
      subscribeWeather((data: string) => {
        this.weatherData = data;
      });
      this.weatherSubscribed = true;
    }
  }

  handleUnsubscribeWeather(): void {
    if (this.weatherSubscribed) {
      unsubscribeWeather();
      this.weatherSubscribed = false;
      this.weatherData = 'N/A';
    }
  }

  handleSubscribeRefueling(): void {
    if (!this.refuelingSubscribed) {
      subscribeRefueling((data: string) => {
        this.refuelingData = data;
      });
      this.refuelingSubscribed = true;
    }
  }

  handleUnsubscribeRefueling(): void {
    if (this.refuelingSubscribed) {
      unsubscribeRefueling();
      this.refuelingSubscribed = false;
      this.refuelingData = 'N/A';
    }
  }

  build() {
    Column() {
      Text('CarAwareness 示例')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      QuerySection({ capabilityList: $capabilityList })
        .margin({ bottom: 16 });

      SubscribeSection({
        spatialMotionSubscribed: $spatialMotionSubscribed,
        weatherSubscribed: $weatherSubscribed,
        refuelingSubscribed: $refuelingSubscribed
      })
        .margin({ bottom: 16 });

      ControlSection({
        onSubscribeSpatialMotion: () => this.handleSubscribeSpatialMotion(),
        onUnsubscribeSpatialMotion: () => this.handleUnsubscribeSpatialMotion(),
        onSubscribeWeather: () => this.handleSubscribeWeather(),
        onUnsubscribeWeather: () => this.handleUnsubscribeWeather(),
        onSubscribeRefueling: () => this.handleSubscribeRefueling(),
        onUnsubscribeRefueling: () => this.handleUnsubscribeRefueling()
      })
        .margin({ bottom: 16 });

      SimulateSection({
        spatialMotionData: $spatialMotionData,
        weatherData: $weatherData,
        refuelingData: $refuelingData
      });
    }
    .width('100%')
    .height('100%')
    .padding(16);
  }
}
