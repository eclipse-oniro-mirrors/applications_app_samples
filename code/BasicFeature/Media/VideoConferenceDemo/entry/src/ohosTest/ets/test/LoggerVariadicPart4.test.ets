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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Logger } from '../../../main/ets/common/utils/Logger';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VideoConferenceDemo]';

export default function LoggerVariadicPart4Test(): void {
  describe('LoggerVariadicPart4', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_0100
     * @tc.name      testLoggerVariadic0241
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0241 begin');
      let threw: boolean = false;
      try {
        Logger.error('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0241 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_0200
     * @tc.name      testLoggerVariadic0242
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0242 begin');
      let threw: boolean = false;
      try {
        Logger.error('a');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0242 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_0300
     * @tc.name      testLoggerVariadic0243
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0243 begin');
      let threw: boolean = false;
      try {
        Logger.error('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0243 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_0400
     * @tc.name      testLoggerVariadic0244
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0244 begin');
      let threw: boolean = false;
      try {
        Logger.error('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0244 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_0500
     * @tc.name      testLoggerVariadic0245
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0245 begin');
      let threw: boolean = false;
      try {
        Logger.error('😀 emoji');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0245 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_0600
     * @tc.name      testLoggerVariadic0246
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0246 begin');
      let threw: boolean = false;
      try {
        Logger.error('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0246 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_0700
     * @tc.name      testLoggerVariadic0247
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0247 begin');
      let threw: boolean = false;
      try {
        Logger.error('a,b');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0247 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_0800
     * @tc.name      testLoggerVariadic0248
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0248 begin');
      let threw: boolean = false;
      try {
        Logger.error('line1\nline2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0248 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_0900
     * @tc.name      testLoggerVariadic0249
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0249 begin');
      let threw: boolean = false;
      try {
        Logger.error('tab\tchar');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0249 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_1000
     * @tc.name      testLoggerVariadic0250
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0250 begin');
      let threw: boolean = false;
      try {
        Logger.error('quote\'s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0250 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_1100
     * @tc.name      testLoggerVariadic0251
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0251 begin');
      let threw: boolean = false;
      try {
        Logger.error('back\\slash');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0251 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_1200
     * @tc.name      testLoggerVariadic0252
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0252 begin');
      let threw: boolean = false;
      try {
        Logger.error('null');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0252 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_1300
     * @tc.name      testLoggerVariadic0253
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0253 begin');
      let threw: boolean = false;
      try {
        Logger.error('0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0253 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_1400
     * @tc.name      testLoggerVariadic0254
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0254 begin');
      let threw: boolean = false;
      try {
        Logger.error('true');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0254 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_1500
     * @tc.name      testLoggerVariadic0255
     * @tc.desc      Verify Logger.error accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0255 begin');
      let threw: boolean = false;
      try {
        Logger.error('false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0255 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_1600
     * @tc.name      testLoggerVariadic0256
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0256 begin');
      let threw: boolean = false;
      try {
        Logger.error('TAG', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0256 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_1700
     * @tc.name      testLoggerVariadic0257
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0257 begin');
      let threw: boolean = false;
      try {
        Logger.error('TAG', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0257 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_1800
     * @tc.name      testLoggerVariadic0258
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0258 begin');
      let threw: boolean = false;
      try {
        Logger.error('', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0258 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_1900
     * @tc.name      testLoggerVariadic0259
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0259 begin');
      let threw: boolean = false;
      try {
        Logger.error('TAG', '中文');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0259 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_2000
     * @tc.name      testLoggerVariadic0260
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0260 begin');
      let threw: boolean = false;
      try {
        Logger.error('TAG', '😀');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0260 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_2100
     * @tc.name      testLoggerVariadic0261
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0261 begin');
      let threw: boolean = false;
      try {
        Logger.error('TAG', 'long');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0261 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_2200
     * @tc.name      testLoggerVariadic0262
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0262 begin');
      let threw: boolean = false;
      try {
        Logger.error('A', 'B');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0262 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_2300
     * @tc.name      testLoggerVariadic0263
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0263 begin');
      let threw: boolean = false;
      try {
        Logger.error('0', '1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0263 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_2400
     * @tc.name      testLoggerVariadic0264
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0264 begin');
      let threw: boolean = false;
      try {
        Logger.error('true', 'false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0264 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_2500
     * @tc.name      testLoggerVariadic0265
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0265 begin');
      let threw: boolean = false;
      try {
        Logger.error('left', 'right');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0265 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_2600
     * @tc.name      testLoggerVariadic0266
     * @tc.desc      Verify Logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0266 begin');
      let threw: boolean = false;
      try {
        Logger.error('A', 'B', 'C');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0266 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_2700
     * @tc.name      testLoggerVariadic0267
     * @tc.desc      Verify Logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0267 begin');
      let threw: boolean = false;
      try {
        Logger.error('TAG', 'stage', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0267 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_2800
     * @tc.name      testLoggerVariadic0268
     * @tc.desc      Verify Logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0268 begin');
      let threw: boolean = false;
      try {
        Logger.error('', '', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0268 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_2900
     * @tc.name      testLoggerVariadic0269
     * @tc.desc      Verify Logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0269 begin');
      let threw: boolean = false;
      try {
        Logger.error('中文', '消息', '内容');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0269 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_3000
     * @tc.name      testLoggerVariadic0270
     * @tc.desc      Verify Logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0270 begin');
      let threw: boolean = false;
      try {
        Logger.error('1', '2', '3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0270 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_3100
     * @tc.name      testLoggerVariadic0271
     * @tc.desc      Verify Logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0271 begin');
      let threw: boolean = false;
      try {
        Logger.error('a', 'b', 'c');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0271 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_3200
     * @tc.name      testLoggerVariadic0272
     * @tc.desc      Verify Logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0272 begin');
      let threw: boolean = false;
      try {
        Logger.error('x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0272 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_3300
     * @tc.name      testLoggerVariadic0273
     * @tc.desc      Verify Logger.error accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0273 begin');
      let threw: boolean = false;
      try {
        Logger.error('%s', '%d', '%f');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0273 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_3400
     * @tc.name      testLoggerVariadic0274
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0274 begin');
      let threw: boolean = false;
      try {
        Logger.error('A', 'B', 'C', 'D');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0274 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_3500
     * @tc.name      testLoggerVariadic0275
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0275 begin');
      let threw: boolean = false;
      try {
        Logger.error('TAG', 'a', 'b', 'c');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0275 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_3600
     * @tc.name      testLoggerVariadic0276
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0276 begin');
      let threw: boolean = false;
      try {
        Logger.error('1', '2', '3', '4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0276 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_3700
     * @tc.name      testLoggerVariadic0277
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0277 begin');
      let threw: boolean = false;
      try {
        Logger.error('w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0277 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_3800
     * @tc.name      testLoggerVariadic0278
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0278 begin');
      let threw: boolean = false;
      try {
        Logger.error('中文', '标签', '消息', '内容');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0278 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_3900
     * @tc.name      testLoggerVariadic0279
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0279 begin');
      let threw: boolean = false;
      try {
        Logger.error('p', 'q', 'r', 's');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0279 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_4000
     * @tc.name      testLoggerVariadic0280
     * @tc.desc      Verify Logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0280 begin');
      let threw: boolean = false;
      try {
        Logger.error('A', 'B', 'C', 'D', 'E');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0280 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_4100
     * @tc.name      testLoggerVariadic0281
     * @tc.desc      Verify Logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0281 begin');
      let threw: boolean = false;
      try {
        Logger.error('a', 'b', 'c', 'd', 'e');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0281 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_4200
     * @tc.name      testLoggerVariadic0282
     * @tc.desc      Verify Logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0282 begin');
      let threw: boolean = false;
      try {
        Logger.error('1', '2', '3', '4', '5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0282 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_4300
     * @tc.name      testLoggerVariadic0283
     * @tc.desc      Verify Logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0283 begin');
      let threw: boolean = false;
      try {
        Logger.error('TAG', 'm1', 'm2', 'm3', 'm4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0283 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_4400
     * @tc.name      testLoggerVariadic0284
     * @tc.desc      Verify Logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0284 begin');
      let threw: boolean = false;
      try {
        Logger.error('中文', '一', '二', '三', '四');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0284 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_4500
     * @tc.name      testLoggerVariadic0285
     * @tc.desc      Verify Logger.error accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0285 begin');
      let threw: boolean = false;
      try {
        Logger.error('v', 'w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0285 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_4600
     * @tc.name      testLoggerVariadic0286
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0286 begin');
      let threw: boolean = false;
      try {
        Logger.error('x', 'y');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0286 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_4700
     * @tc.name      testLoggerVariadic0287
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0287 begin');
      let threw: boolean = false;
      try {
        Logger.error('yes', 'no');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0287 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_4800
     * @tc.name      testLoggerVariadic0288
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0288 begin');
      let threw: boolean = false;
      try {
        Logger.error('on', 'off');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0288 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_4900
     * @tc.name      testLoggerVariadic0289
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0289 begin');
      let threw: boolean = false;
      try {
        Logger.error('start', 'end');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0289 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_5000
     * @tc.name      testLoggerVariadic0290
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0290 begin');
      let threw: boolean = false;
      try {
        Logger.error('tag', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0290 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_5100
     * @tc.name      testLoggerVariadic0291
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0291 begin');
      let threw: boolean = false;
      try {
        Logger.error('k', 'v');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0291 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_5200
     * @tc.name      testLoggerVariadic0292
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0292 begin');
      let threw: boolean = false;
      try {
        Logger.error('key', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0292 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_5300
     * @tc.name      testLoggerVariadic0293
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0293 begin');
      let threw: boolean = false;
      try {
        Logger.error('name', 'age');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0293 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_5400
     * @tc.name      testLoggerVariadic0294
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0294 begin');
      let threw: boolean = false;
      try {
        Logger.error('a', 'b', 'c', 'd');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0294 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_5500
     * @tc.name      testLoggerVariadic0295
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0295 begin');
      let threw: boolean = false;
      try {
        Logger.error('e', 'f', 'g', 'h');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0295 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_5600
     * @tc.name      testLoggerVariadic0296
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0296 begin');
      let threw: boolean = false;
      try {
        Logger.error('i', 'j', 'k', 'l');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0296 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_5700
     * @tc.name      testLoggerVariadic0297
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0297 begin');
      let threw: boolean = false;
      try {
        Logger.error('m', 'n', 'o', 'p');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0297 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_5800
     * @tc.name      testLoggerVariadic0298
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0298 begin');
      let threw: boolean = false;
      try {
        Logger.error('q', 'r', 's', 't');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0298 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_5900
     * @tc.name      testLoggerVariadic0299
     * @tc.desc      Verify Logger.error accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0299 begin');
      let threw: boolean = false;
      try {
        Logger.error('u', 'v', 'w', 'x');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0299 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_6000
     * @tc.name      testLoggerVariadic0300
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0300 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg0', 'value0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0300 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_6100
     * @tc.name      testLoggerVariadic0301
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0301 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg1', 'value1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0301 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_6200
     * @tc.name      testLoggerVariadic0302
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0302 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg2', 'value2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0302 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_6300
     * @tc.name      testLoggerVariadic0303
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0303 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg3', 'value3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0303 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_6400
     * @tc.name      testLoggerVariadic0304
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0304 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg4', 'value4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0304 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_6500
     * @tc.name      testLoggerVariadic0305
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0305 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg5', 'value5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0305 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_6600
     * @tc.name      testLoggerVariadic0306
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0306 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg6', 'value6');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0306 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_6700
     * @tc.name      testLoggerVariadic0307
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0307 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg7', 'value7');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0307 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_6800
     * @tc.name      testLoggerVariadic0308
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0308 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg8', 'value8');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0308 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_6900
     * @tc.name      testLoggerVariadic0309
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0309 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg9', 'value9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0309 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_7000
     * @tc.name      testLoggerVariadic0310
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0310 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg10', 'value10');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0310 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_7100
     * @tc.name      testLoggerVariadic0311
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0311 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg11', 'value11');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0311 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_7200
     * @tc.name      testLoggerVariadic0312
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0312 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg12', 'value12');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0312 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_7300
     * @tc.name      testLoggerVariadic0313
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0313 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg13', 'value13');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0313 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_7400
     * @tc.name      testLoggerVariadic0314
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0314 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg14', 'value14');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0314 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_7500
     * @tc.name      testLoggerVariadic0315
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0315 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg15', 'value15');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0315 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_7600
     * @tc.name      testLoggerVariadic0316
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0316 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg16', 'value16');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0316 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_7700
     * @tc.name      testLoggerVariadic0317
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0317 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg17', 'value17');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0317 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_7800
     * @tc.name      testLoggerVariadic0318
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0318 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg18', 'value18');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0318 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_7900
     * @tc.name      testLoggerVariadic0319
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0319 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg19', 'value19');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0319 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP4_ONE_8000
     * @tc.name      testLoggerVariadic0320
     * @tc.desc      Verify Logger.error accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0320 begin');
      let threw: boolean = false;
      try {
        Logger.error('arg20', 'value20');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0320 end');
    })

  })
}
