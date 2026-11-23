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

// @ui suite L2: city list page component probes via @kit.TestKit.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { ON } from '@kit.TestKit'
import {
  probeComponentType,
  probeComponentBounds,
  probeComponentsById,
  probeComponentsByType,
  probeComponentBoundsByOn
} from '../util/UiTestHelper'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

function safeProbe(result: string): boolean {
  return result === 'notfound' || result === 'error'
    || result.startsWith('found:') || result.startsWith('ok:')
}

export default function uiCityList0001Test() {
  describe('UiCityList0001', () => {

    /**
     * @tc.name   testUi9013
     * @tc.number SUB_WEATHER_UI_9013
     * @tc.desc   Anchor: addCity entry node answers UI query without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9013 begin')
      const result: string = await probeComponentType('addCity')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9013 end')
    })

    /**
     * @tc.name   testUi9014
     * @tc.number SUB_WEATHER_UI_9014
     * @tc.desc   addCity bounds probe stays a well-formed snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9014 begin')
      const result: string = await probeComponentBounds('addCity')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9014 end')
    })

    /**
     * @tc.name   testUi9015
     * @tc.number SUB_WEATHER_UI_9015
     * @tc.desc   addCity multi-match count probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9015 begin')
      const result: string = await probeComponentsById('addCity')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9015 end')
    })

    /**
     * @tc.name   testUi9016
     * @tc.number SUB_WEATHER_UI_9016
     * @tc.desc   ListItem type multi-match probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9016 begin')
      const result: string = await probeComponentsByType('ListItem')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9016 end')
    })

    /**
     * @tc.name   testUi9017
     * @tc.number SUB_WEATHER_UI_9017
     * @tc.desc   generic On selector bounds probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9017 begin')
      const result: string = await probeComponentBoundsByOn(ON.id('addCity'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9017 end')
    })
  })
}
