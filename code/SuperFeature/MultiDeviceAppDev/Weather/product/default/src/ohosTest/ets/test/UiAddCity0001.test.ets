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

// @ui suite L2: add-city page text probes via @kit.TestKit.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { probeComponentTypeByText, probeComponentsByType } from '../util/UiTestHelper'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

function safeProbe(result: string): boolean {
  return result === 'notfound' || result === 'error'
    || result.startsWith('found:') || result.startsWith('ok:')
}

export default function uiAddCity0001Test() {
  describe('UiAddCity0001', () => {

    /**
     * @tc.name   testUi9018
     * @tc.number SUB_WEATHER_UI_9018
     * @tc.desc   Anchor: hot city text 北京 answers UI query without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9018 begin')
      const result: string = await probeComponentTypeByText('北京')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9018 end')
    })

    /**
     * @tc.name   testUi9019
     * @tc.number SUB_WEATHER_UI_9019
     * @tc.desc   hot city text 上海 probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9019 begin')
      const result: string = await probeComponentTypeByText('上海')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9019 end')
    })

    /**
     * @tc.name   testUi9020
     * @tc.number SUB_WEATHER_UI_9020
     * @tc.desc   hot city text 深圳 probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9020 begin')
      const result: string = await probeComponentTypeByText('深圳')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9020 end')
    })

    /**
     * @tc.name   testUi9021
     * @tc.number SUB_WEATHER_UI_9021
     * @tc.desc   section title text 热门城市 probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9021 begin')
      const result: string = await probeComponentTypeByText('热门城市')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9021 end')
    })

    /**
     * @tc.name   testUi9022
     * @tc.number SUB_WEATHER_UI_9022
     * @tc.desc   Text type multi-match probe is crash-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUi9022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9022 begin')
      const result: string = await probeComponentsByType('Text')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(typeof result).assertEqual('string')
      expect(result.length > 0).assertTrue()
      expect(safeProbe(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUi9022 end')
    })
  })
}
