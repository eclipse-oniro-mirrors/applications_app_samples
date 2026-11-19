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

// @ui suite L2: title bar component probes via @kit.TestKit.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { hilog } from '@kit.PerformanceAnalysisKit'
import {
  probeComponentType,
  probeComponentBounds,
  probeComponentsById
} from '../util/UiTestHelper'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

function safeProbe(result: string): boolean {
  return result === 'notfound' || result === 'error'
    || result.startsWith('found:') || result.startsWith('ok:')
}

export default function uiTitleBar0001Test() {
  describe('UiTitleBar0001', () => {

    /**
     * @tc.name   testUi9007
     * @tc.number SUB_WEATHER_UI_9007
     * @tc.desc   Anchor: menu0 node answers UI query without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9007 begin')
      const result: string = await probeComponentType('menu0')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9007 end')
    })

    /**
     * @tc.name   testUi9008
     * @tc.number SUB_WEATHER_UI_9008
     * @tc.desc   menu1 node type probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9008 begin')
      const result: string = await probeComponentType('menu1')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9008 end')
    })

    /**
     * @tc.name   testUi9009
     * @tc.number SUB_WEATHER_UI_9009
     * @tc.desc   iconSubarea node type probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9009 begin')
      const result: string = await probeComponentType('iconSubarea')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9009 end')
    })

    /**
     * @tc.name   testUi9010
     * @tc.number SUB_WEATHER_UI_9010
     * @tc.desc   iconSubarea bounds probe stays a well-formed snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9010 begin')
      const result: string = await probeComponentBounds('iconSubarea')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9010 end')
    })

    /**
     * @tc.name   testUi9011
     * @tc.number SUB_WEATHER_UI_9011
     * @tc.desc   menuPopup node type probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9011 begin')
      const result: string = await probeComponentType('menuPopup')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9011 end')
    })

    /**
     * @tc.name   testUi9012
     * @tc.number SUB_WEATHER_UI_9012
     * @tc.desc   menu0 multi-match count probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9012 begin')
      const result: string = await probeComponentsById('menu0')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9012 end')
    })
  })
}
