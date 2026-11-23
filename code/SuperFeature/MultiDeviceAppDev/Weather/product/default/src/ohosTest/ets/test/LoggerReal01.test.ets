/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { Logger } from '@ohos/common'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

export default function loggerReal01Test() {
  describe('LoggerReal01', () => {

    /**
     * @tc.name   testLogger0001
     * @tc.number SUB_WEATHER_LOGGER_0001
     * @tc.desc   Logger prefix equals the frozen sample tag
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLogger0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0001 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', Logger.PREFIX, '[Sample_Weather]')
      expect(Logger.PREFIX).assertEqual('[Sample_Weather]')
      expect(Logger.PREFIX.startsWith('[')).assertTrue()
      expect(Logger.PREFIX.endsWith(']')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0001 end')
    })

    /**
     * @tc.name   testLogger0002
     * @tc.number SUB_WEATHER_LOGGER_0002
     * @tc.desc   Logger prefix length is stable at sixteen characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLogger0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0002 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual len=%{public}d', Logger.PREFIX.length)
      expect(Logger.PREFIX.length).assertEqual(16)
      expect(Logger.PREFIX.includes('Weather')).assertTrue()
      expect(typeof Logger.PREFIX).assertEqual('string')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0002 end')
    })

    /**
     * @tc.name   testLogger0003
     * @tc.number SUB_WEATHER_LOGGER_0003
     * @tc.desc   Logger prefix keeps the sample namespace marker
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLogger0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0003 begin')
      const parts = Logger.PREFIX.split('_')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual parts=%{public}d', parts.length)
      expect(parts.length).assertEqual(2)
      expect(parts[0]).assertEqual('[Sample')
      expect(parts[1]).assertEqual('Weather]')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0003 end')
    })

    /**
     * @tc.name   testLogger0004
     * @tc.number SUB_WEATHER_LOGGER_0004
     * @tc.desc   Logger domain equals the frozen 0xFF00 numeric value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLogger0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0004 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Logger.DOMAIN, 65280)
      expect(Logger.DOMAIN).assertEqual(0xFF00)
      expect(Logger.DOMAIN).assertEqual(65280)
      expect(Logger.DOMAIN > 0).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0004 end')
    })

    /**
     * @tc.name   testLogger0005
     * @tc.number SUB_WEATHER_LOGGER_0005
     * @tc.desc   Logger domain stays inside the hilog 16-bit range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLogger0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0005 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d', Logger.DOMAIN)
      expect(Logger.DOMAIN < 65536).assertTrue()
      expect(Logger.DOMAIN >= 0xFF00).assertTrue()
      expect(typeof Logger.DOMAIN).assertEqual('number')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0005 end')
    })

    /**
     * @tc.name   testLogger0006
     * @tc.number SUB_WEATHER_LOGGER_0006
     * @tc.desc   Logger domain low byte is zero as designed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLogger0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0006 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual tail=%{public}d', Logger.DOMAIN % 256)
      expect(Logger.DOMAIN % 256).assertEqual(0)
      expect(Logger.DOMAIN / 256).assertEqual(255)
      expect(Logger.DOMAIN !== LOG_DOMAIN).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0006 end')
    })

    /**
     * @tc.name   testLogger0007
     * @tc.number SUB_WEATHER_LOGGER_0007
     * @tc.desc   Logger format equals the frozen public placeholder pair
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLogger0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0007 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', Logger.FORMAT)
      expect(Logger.FORMAT).assertEqual('%{public}s, %{public}s')
      expect(Logger.FORMAT.length).assertEqual(22)
      expect(Logger.FORMAT.includes('%{public}s')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0007 end')
    })

    /**
     * @tc.name   testLogger0008
     * @tc.number SUB_WEATHER_LOGGER_0008
     * @tc.desc   Logger format splits into exactly two placeholders
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLogger0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0008 begin')
      const parts = Logger.FORMAT.split(', ')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual parts=%{public}d', parts.length)
      expect(parts.length).assertEqual(2)
      expect(parts[0]).assertEqual('%{public}s')
      expect(parts[1]).assertEqual('%{public}s')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0008 end')
    })

    /**
     * @tc.name   testLogger0009
     * @tc.number SUB_WEATHER_LOGGER_0009
     * @tc.desc   Logger format carries no private markers keeping logs readable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLogger0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0009 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', Logger.FORMAT)
      expect(Logger.FORMAT.includes('private')).assertFalse()
      expect(Logger.FORMAT.startsWith('%')).assertTrue()
      expect(Logger.FORMAT.endsWith('s')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0009 end')
    })

    /**
     * @tc.name   testLogger0010
     * @tc.number SUB_WEATHER_LOGGER_0010
     * @tc.desc   Logger info takes var-args without throwing and logs through the single placeholder sink
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLogger0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0010 begin')
      let thrown = ''
      try {
        Logger.info('action', 'testLogger0010')
      } catch (e) {
        thrown = 'error'
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual thrown=%{public}s singleFormat=%{public}s', thrown, Logger.SINGLE_FORMAT)
      expect(thrown).assertEqual('')
      expect(Logger.PREFIX).assertEqual('[Sample_Weather]')
      expect(Logger.DOMAIN).assertEqual(65280)
      expect(Logger.SINGLE_FORMAT).assertEqual('%{public}s')
      expect(Logger.SINGLE_FORMAT.split('%{public}s').length).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0010 end')
    })

    /**
     * @tc.name   testLogger0011
     * @tc.number SUB_WEATHER_LOGGER_0011
     * @tc.desc   Logger warn and error run without mutating constants
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLogger0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0011 begin')
      const before = Logger.FORMAT
      Logger.warn('w', '1')
      Logger.error('e', '2')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual stable=%{public}s', String(Logger.FORMAT === before))
      expect(Logger.FORMAT === before).assertTrue()
      expect(Logger.PREFIX.length).assertEqual(16)
      expect(Logger.DOMAIN).assertEqual(0xFF00)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0011 end')
    })

    /**
     * @tc.name   testLogger0012
     * @tc.number SUB_WEATHER_LOGGER_0012
     * @tc.desc   Logger debug with empty arguments is a safe no-throw call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLogger0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0012 begin')
      let thrown = ''
      try {
        Logger.debug()
      } catch (e) {
        thrown = 'error'
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual thrown=%{public}s', thrown)
      expect(thrown).assertEqual('')
      expect(Logger.FORMAT.split(', ').length).assertEqual(2)
      expect(Logger.PREFIX.includes('Sample')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLogger0012 end')
    })
  })
}
