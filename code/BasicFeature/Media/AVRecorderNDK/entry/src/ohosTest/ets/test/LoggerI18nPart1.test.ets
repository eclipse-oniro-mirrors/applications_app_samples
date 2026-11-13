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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import Logger from '../../../main/ets/utils/Logger';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AVRecorder]';

export default function LoggerI18nPart1Test(): void {
  describe('LoggerI18nPart1', () => {

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_0100
     * @tc.name      testLoggerI18n0001
     * @tc.desc      Verify Logger.debug accepts message ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0001 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0001 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_0200
     * @tc.name      testLoggerI18n0002
     * @tc.desc      Verify Logger.debug accepts message 'plain text'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0002 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', 'plain text');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0002 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_0300
     * @tc.name      testLoggerI18n0003
     * @tc.desc      Verify Logger.debug accepts message '中文消息'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0003 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', '中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0003 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_0400
     * @tc.name      testLoggerI18n0004
     * @tc.desc      Verify Logger.debug accepts message '😀 emoji message'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0004 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', '😀 emoji message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0004 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_0500
     * @tc.name      testLoggerI18n0005
     * @tc.desc      Verify Logger.debug accepts message 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0005 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0005 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_0600
     * @tc.name      testLoggerI18n0006
     * @tc.desc      Verify Logger.debug accepts message 'line1\nline2'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0006 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', 'line1\nline2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0006 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_0700
     * @tc.name      testLoggerI18n0007
     * @tc.desc      Verify Logger.debug accepts message 'quote\' and "double"'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0007 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', 'quote\' and "double"');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0007 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_0800
     * @tc.name      testLoggerI18n0008
     * @tc.desc      Verify Logger.debug accepts message 'back\\slash'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0008 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', 'back\\slash');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0008 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_0900
     * @tc.name      testLoggerI18n0009
     * @tc.desc      Verify Logger.debug accepts message '%{public}s %{private}d'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0009 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', '%{public}s %{private}d');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0009 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_1000
     * @tc.name      testLoggerI18n0010
     * @tc.desc      Verify Logger.debug accepts message '   spaces   '.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0010 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', '   spaces   ');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0010 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_1100
     * @tc.name      testLoggerI18n0011
     * @tc.desc      Verify Logger.debug accepts message 'undefined'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0011 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', 'undefined');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0011 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_1200
     * @tc.name      testLoggerI18n0012
     * @tc.desc      Verify Logger.debug accepts message 'null'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0012 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', 'null');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0012 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_1300
     * @tc.name      testLoggerI18n0013
     * @tc.desc      Verify Logger.debug accepts message '0'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0013 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', '0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0013 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_1400
     * @tc.name      testLoggerI18n0014
     * @tc.desc      Verify Logger.debug accepts message 'true'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0014 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', 'true');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0014 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_1500
     * @tc.name      testLoggerI18n0015
     * @tc.desc      Verify Logger.debug accepts message 'false'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0015 begin');
      let threw: boolean = false;
      try {
        Logger.debug('I18N', 'false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0015 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_1600
     * @tc.name      testLoggerI18n0016
     * @tc.desc      Verify Logger.info accepts message ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0016 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0016 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_1700
     * @tc.name      testLoggerI18n0017
     * @tc.desc      Verify Logger.info accepts message 'plain text'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0017 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', 'plain text');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0017 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_1800
     * @tc.name      testLoggerI18n0018
     * @tc.desc      Verify Logger.info accepts message '中文消息'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0018 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', '中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0018 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_1900
     * @tc.name      testLoggerI18n0019
     * @tc.desc      Verify Logger.info accepts message '😀 emoji message'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0019 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', '😀 emoji message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0019 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_2000
     * @tc.name      testLoggerI18n0020
     * @tc.desc      Verify Logger.info accepts message 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0020 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0020 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_2100
     * @tc.name      testLoggerI18n0021
     * @tc.desc      Verify Logger.info accepts message 'line1\nline2'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0021 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', 'line1\nline2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0021 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_2200
     * @tc.name      testLoggerI18n0022
     * @tc.desc      Verify Logger.info accepts message 'quote\' and "double"'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0022 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', 'quote\' and "double"');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0022 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_2300
     * @tc.name      testLoggerI18n0023
     * @tc.desc      Verify Logger.info accepts message 'back\\slash'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0023 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', 'back\\slash');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0023 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_2400
     * @tc.name      testLoggerI18n0024
     * @tc.desc      Verify Logger.info accepts message '%{public}s %{private}d'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0024 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', '%{public}s %{private}d');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0024 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_2500
     * @tc.name      testLoggerI18n0025
     * @tc.desc      Verify Logger.info accepts message '   spaces   '.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0025 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', '   spaces   ');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0025 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_2600
     * @tc.name      testLoggerI18n0026
     * @tc.desc      Verify Logger.info accepts message 'undefined'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0026 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', 'undefined');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0026 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_2700
     * @tc.name      testLoggerI18n0027
     * @tc.desc      Verify Logger.info accepts message 'null'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0027 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', 'null');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0027 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_2800
     * @tc.name      testLoggerI18n0028
     * @tc.desc      Verify Logger.info accepts message '0'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0028 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', '0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0028 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_2900
     * @tc.name      testLoggerI18n0029
     * @tc.desc      Verify Logger.info accepts message 'true'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0029 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', 'true');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0029 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_3000
     * @tc.name      testLoggerI18n0030
     * @tc.desc      Verify Logger.info accepts message 'false'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0030 begin');
      let threw: boolean = false;
      try {
        Logger.info('I18N', 'false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0030 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_3100
     * @tc.name      testLoggerI18n0031
     * @tc.desc      Verify Logger.warn accepts message ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0031 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0031 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_3200
     * @tc.name      testLoggerI18n0032
     * @tc.desc      Verify Logger.warn accepts message 'plain text'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0032 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', 'plain text');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0032 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_3300
     * @tc.name      testLoggerI18n0033
     * @tc.desc      Verify Logger.warn accepts message '中文消息'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0033 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', '中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0033 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_3400
     * @tc.name      testLoggerI18n0034
     * @tc.desc      Verify Logger.warn accepts message '😀 emoji message'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0034 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', '😀 emoji message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0034 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_3500
     * @tc.name      testLoggerI18n0035
     * @tc.desc      Verify Logger.warn accepts message 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0035 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0035 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_3600
     * @tc.name      testLoggerI18n0036
     * @tc.desc      Verify Logger.warn accepts message 'line1\nline2'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0036 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', 'line1\nline2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0036 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_3700
     * @tc.name      testLoggerI18n0037
     * @tc.desc      Verify Logger.warn accepts message 'quote\' and "double"'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0037 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', 'quote\' and "double"');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0037 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_3800
     * @tc.name      testLoggerI18n0038
     * @tc.desc      Verify Logger.warn accepts message 'back\\slash'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0038 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', 'back\\slash');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0038 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_3900
     * @tc.name      testLoggerI18n0039
     * @tc.desc      Verify Logger.warn accepts message '%{public}s %{private}d'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0039 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', '%{public}s %{private}d');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0039 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_4000
     * @tc.name      testLoggerI18n0040
     * @tc.desc      Verify Logger.warn accepts message '   spaces   '.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0040 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', '   spaces   ');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0040 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_4100
     * @tc.name      testLoggerI18n0041
     * @tc.desc      Verify Logger.warn accepts message 'undefined'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0041 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', 'undefined');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0041 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_4200
     * @tc.name      testLoggerI18n0042
     * @tc.desc      Verify Logger.warn accepts message 'null'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0042 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', 'null');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0042 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_4300
     * @tc.name      testLoggerI18n0043
     * @tc.desc      Verify Logger.warn accepts message '0'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0043 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', '0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0043 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_4400
     * @tc.name      testLoggerI18n0044
     * @tc.desc      Verify Logger.warn accepts message 'true'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0044 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', 'true');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0044 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_4500
     * @tc.name      testLoggerI18n0045
     * @tc.desc      Verify Logger.warn accepts message 'false'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0045 begin');
      let threw: boolean = false;
      try {
        Logger.warn('I18N', 'false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0045 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_4600
     * @tc.name      testLoggerI18n0046
     * @tc.desc      Verify Logger.error accepts message ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0046 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0046 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_4700
     * @tc.name      testLoggerI18n0047
     * @tc.desc      Verify Logger.error accepts message 'plain text'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0047 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', 'plain text');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0047 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_4800
     * @tc.name      testLoggerI18n0048
     * @tc.desc      Verify Logger.error accepts message '中文消息'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0048 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', '中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0048 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_4900
     * @tc.name      testLoggerI18n0049
     * @tc.desc      Verify Logger.error accepts message '😀 emoji message'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0049 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', '😀 emoji message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0049 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_5000
     * @tc.name      testLoggerI18n0050
     * @tc.desc      Verify Logger.error accepts message 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0050 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0050 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_5100
     * @tc.name      testLoggerI18n0051
     * @tc.desc      Verify Logger.error accepts message 'line1\nline2'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0051 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', 'line1\nline2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0051 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_5200
     * @tc.name      testLoggerI18n0052
     * @tc.desc      Verify Logger.error accepts message 'quote\' and "double"'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0052 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', 'quote\' and "double"');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0052 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_5300
     * @tc.name      testLoggerI18n0053
     * @tc.desc      Verify Logger.error accepts message 'back\\slash'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0053 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', 'back\\slash');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0053 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_5400
     * @tc.name      testLoggerI18n0054
     * @tc.desc      Verify Logger.error accepts message '%{public}s %{private}d'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0054 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', '%{public}s %{private}d');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0054 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_5500
     * @tc.name      testLoggerI18n0055
     * @tc.desc      Verify Logger.error accepts message '   spaces   '.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0055 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', '   spaces   ');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0055 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_5600
     * @tc.name      testLoggerI18n0056
     * @tc.desc      Verify Logger.error accepts message 'undefined'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0056 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', 'undefined');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0056 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_5700
     * @tc.name      testLoggerI18n0057
     * @tc.desc      Verify Logger.error accepts message 'null'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0057 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', 'null');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0057 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_5800
     * @tc.name      testLoggerI18n0058
     * @tc.desc      Verify Logger.error accepts message '0'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0058 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', '0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0058 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_5900
     * @tc.name      testLoggerI18n0059
     * @tc.desc      Verify Logger.error accepts message 'true'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0059 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', 'true');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0059 end');
    })

    /**
     * @tc.number    SUB_AVREC_LOGI18NP1_6000
     * @tc.name      testLoggerI18n0060
     * @tc.desc      Verify Logger.error accepts message 'false'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerI18n0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0060 begin');
      let threw: boolean = false;
      try {
        Logger.error('I18N', 'false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerI18n0060 end');
    })

  })
}
