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

import { router } from '@kit.ArkUI';
import { deviceInfo } from '@kit.BasicServicesKit';

const TABLET_DEVICE: string = 'tablet';
const CONSOLE_PAGE: string = 'console/pages/ConsolePage';
const ORCHESTRATION_PAGE: string = 'orchestration/pages/OrchestrationHome';

/**
 * Index page of the MeetingScene sample.
 * Immediately redirects to the console page on phones or the orchestration home on tablets.
 */
@Entry
@ComponentV2
struct Index {
  /** Decide the landing page by device type before the first frame is drawn. */
  aboutToAppear(): void {
    /**
     * Routing strategy note (extension point for adaptive layout):
     * - The app branches once on deviceInfo.deviceType before the first frame:
     *   'tablet' -> orchestration/pages/* (wide-screen UI, two-column grids),
     *   other types (phone, ...) -> console/pages/* (single-column UI).
     * - The tablet pages already use GridRow/GridCol adaptive grids, so this
     *   decision only picks which page set to load; it does not size layout.
     * - Foldables and free-form windows change their effective width at
     *   runtime, so a one-shot deviceType check cannot serve them well. When
     *   such support is required, migrate this decision to a breakpoint-based
     *   scheme (mediaquery listener or GridRow/GridCol breakpoints) instead of
     *   adding more deviceType branches. Deliberately not implemented now to
     *   avoid over-engineering the entry flow.
     */
    const target: string = deviceInfo.deviceType === TABLET_DEVICE ? ORCHESTRATION_PAGE : CONSOLE_PAGE;
    router.replaceUrl({ url: target });
  }

  /** Simple centered placeholder shown while the redirect happens. */
  build() {
    RelativeContainer() {
      Text($r('app.string.phone_entering_console'))
        .id('id_entering_console')
        .fontSize($r('app.float.body_font'))
        .fontColor($r('app.color.text_secondary'))
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .id('id_index_root')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
