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

@Component
struct VolumeIndicator {
  @State volumePercent: number = 0.5;

  aboutToAppear(): void {
    // 监听输入音量变化
  }

  aboutToDisappear(): void {
    // 取消监听
  }

  build() {
    Progress({
      value: this.volumePercent,
      total: 1,
      type: ProgressType.Capsule
    })
      .value(this.volumePercent)
      .width(7.2)
      .height(13.5)
      .rotate({ angle: 180 })
      .color('#6ECE7F')
  }
}

@Builder
export function VolumeIndicatorBuilder(shouldShow: boolean) {
  if (shouldShow) {
    VolumeIndicator();
  }
}