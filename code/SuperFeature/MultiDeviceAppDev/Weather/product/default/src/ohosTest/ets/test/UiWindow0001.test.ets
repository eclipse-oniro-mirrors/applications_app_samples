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

// @ui suite L2: driver/window level probes via @kit.TestKit.
// Display size and active window snapshots must stay stable across calls.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { hilog } from '@kit.PerformanceAnalysisKit'
import {
  probeDisplaySize,
  probeActiveWindowMode,
  probeActiveWindowBounds
} from '../util/UiTestHelper'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

function safeProbe(result: string): boolean {
  return result === 'notfound' || result === 'error'
    || result.startsWith('found:') || result.startsWith('ok:')
}

export default function uiWindow0001Test() {
  describe('UiWindow0001', () => {

    /**
     * @tc.name   testUi9023
     * @tc.number SUB_WEATHER_UI_9023
     * @tc.desc   Anchor: display size snapshot is stable across two queries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9023 begin')
      const first: string = await probeDisplaySize()
      const second: string = await probeDisplaySize()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s,%{public}s', first, second)
      expect(typeof first).assertEqual('string')
      expect(first).assertEqual(second)
      expect(safeProbe(first)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9023 end')
    })

    /**
     * @tc.name   testUi9024
     * @tc.number SUB_WEATHER_UI_9024
     * @tc.desc   display size probe answers without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9024 begin')
      const result: string = await probeDisplaySize()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9024 end')
    })

    /**
     * @tc.name   testUi9025
     * @tc.number SUB_WEATHER_UI_9025
     * @tc.desc   active window mode probe answers without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9025 begin')
      const result: string = await probeActiveWindowMode()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9025 end')
    })

    /**
     * @tc.name   testUi9026
     * @tc.number SUB_WEATHER_UI_9026
     * @tc.desc   active window mode snapshot is stable across two queries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9026 begin')
      const first: string = await probeActiveWindowMode()
      const second: string = await probeActiveWindowMode()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s,%{public}s', first, second)
      expect(typeof first).assertEqual('string')
      expect(first).assertEqual(second)
      expect(safeProbe(first)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9026 end')
    })

    /**
     * @tc.name   testUi9027
     * @tc.number SUB_WEATHER_UI_9027
     * @tc.desc   active window bounds probe answers without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9027 begin')
      const result: string = await probeActiveWindowBounds()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9027 end')
    })

    /**
     * @tc.name   testUi9028
     * @tc.number SUB_WEATHER_UI_9028
     * @tc.desc   active window bounds snapshot is stable across two queries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9028 begin')
      const first: string = await probeActiveWindowBounds()
      const second: string = await probeActiveWindowBounds()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s,%{public}s', first, second)
      expect(typeof first).assertEqual('string')
      expect(first).assertEqual(second)
      expect(safeProbe(first)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9028 end')
    })
  })
}
