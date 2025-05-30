/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { CommonButton } from '../util/CommonButton';
import resource from '../util/resource';

@Entry
@Component
struct Index {
  aboutToAppear() {
  }

  build() {
    Scroll() {
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
        Text(resource.resourceToString($r('app.string.Time_consuming_task_concurrency')))
          .padding('15vp')
          .width('100%')
          .fontSize('25fp')
          .textAlign(TextAlign.Center)
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.Cpu_intensive_task_development')),
          buttonUrl: 'managers/CpuIntensiveTaskDevelopment'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.Io_intensive_task_development')),
          buttonUrl: 'managers/IoIntensiveTaskDevelopment'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.Sync_task_development')),
          buttonUrl: 'managers/SyncTaskDevelopment'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.Long_time_task_guide')),
          buttonUrl: 'managers/LongTimeTaskGuide'
        });
        CommonButton({
          buttonName: resource.resourceToString($r('app.string.Resident_task_guide')),
          buttonUrl: 'managers/ResidentTaskGuide'
        });
      }
      .padding('20vp')
      .width('100%')
    }.margin({ bottom: 60 })
    .width('100%')
  }
}
