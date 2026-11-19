/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { router } from '@kit.ArkUI';
import {
  CASE_BUTTON_WIDTH,
  RADIUS_BADGE,
  ROUTE_MAILBOX,
  ROUTE_PHOTO_ALBUM,
  ROUTE_SETTINGS
} from '../common/Constants';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Column() {
        Button($r('app.string.caseOne')).onClick(() => {
          router.pushUrl({ url: ROUTE_MAILBOX });
        }).type(ButtonType.Normal).borderRadius(RADIUS_BADGE).width(CASE_BUTTON_WIDTH).id('caseOne')

        Button($r('app.string.caseTwo')).onClick(() => {
          router.pushUrl({ url: ROUTE_PHOTO_ALBUM });
        }).type(ButtonType.Normal).borderRadius(RADIUS_BADGE).width(CASE_BUTTON_WIDTH).id('caseTwo')

        Button($r('app.string.caseThree')).onClick(() => {
          router.pushUrl({ url: ROUTE_SETTINGS });
        }).type(ButtonType.Normal).borderRadius(RADIUS_BADGE).width(CASE_BUTTON_WIDTH).id('caseThree')
      }.width('100%').height('50%').justifyContent(FlexAlign.SpaceAround)
    }.width('100%').height('100%')
  }
}
