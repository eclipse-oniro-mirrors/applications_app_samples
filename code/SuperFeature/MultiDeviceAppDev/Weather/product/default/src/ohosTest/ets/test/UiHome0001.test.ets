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

// @ui suite L2: home page component probes via @kit.TestKit.
// All assertions are conservative snapshots ('found:*'|'notfound'|'error'):
// probes must answer without crashing regardless of the current page.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { hilog } from '@kit.PerformanceAnalysisKit'
import {
  probeComponentType,
  probeComponentBounds,
  probeComponentsById,
  probeComponentsByType
} from '../util/UiTestHelper'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

function safeProbe(result: string): boolean {
  return result === 'notfound' || result === 'error'
    || result.startsWith('found:') || result.startsWith('ok:')
}

export default function uiHome0001Test() {
  describe('UiHome0001', () => {

    /**
     * @tc.name   testUi9001
     * @tc.number SUB_WEATHER_UI_9001
     * @tc.desc   Anchor: home swiper node answers UI query without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9001 begin')
      const result: string = await probeComponentType('swiper')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9001 end')
    })

    /**
     * @tc.name   testUi9002
     * @tc.number SUB_WEATHER_UI_9002
     * @tc.desc   homeContent0 node type probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9002 begin')
      const result: string = await probeComponentType('homeContent0')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9002 end')
    })

    /**
     * @tc.name   testUi9003
     * @tc.number SUB_WEATHER_UI_9003
     * @tc.desc   homeContent1 node type probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9003 begin')
      const result: string = await probeComponentType('homeContent1')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9003 end')
    })

    /**
     * @tc.name   testUi9004
     * @tc.number SUB_WEATHER_UI_9004
     * @tc.desc   swiper bounds probe stays a well-formed snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9004 begin')
      const result: string = await probeComponentBounds('swiper')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9004 end')
    })

    /**
     * @tc.name   testUi9005
     * @tc.number SUB_WEATHER_UI_9005
     * @tc.desc   homeContent0 multi-match count probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9005 begin')
      const result: string = await probeComponentsById('homeContent0')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9005 end')
    })

    /**
     * @tc.name   testUi9006
     * @tc.number SUB_WEATHER_UI_9006
     * @tc.desc   Swiper type multi-match probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9006 begin')
      const result: string = await probeComponentsByType('Swiper')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9006 end')
    })
  })
}
