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
import { Logger } from '../../../main/ets/common/utils/Logger';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VideoConferenceDemo]';

export default function LoggerVariadicPart3Test(): void {
  describe('LoggerVariadicPart3', () => {

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_16100
     * @tc.name      testLoggerVariadic0161
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0161 begin');
      let threw: boolean = false;
      try {
        Logger.warn('');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0161 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_16200
     * @tc.name      testLoggerVariadic0162
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0162 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0162 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_16300
     * @tc.name      testLoggerVariadic0163
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0163 begin');
      let threw: boolean = false;
      try {
        Logger.warn('message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0163 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_16400
     * @tc.name      testLoggerVariadic0164
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0164 begin');
      let threw: boolean = false;
      try {
        Logger.warn('中文消息');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0164 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_16500
     * @tc.name      testLoggerVariadic0165
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0165 begin');
      let threw: boolean = false;
      try {
        Logger.warn('😀 emoji');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0165 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_16600
     * @tc.name      testLoggerVariadic0166
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0166 begin');
      let threw: boolean = false;
      try {
        Logger.warn('%{public}s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0166 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_16700
     * @tc.name      testLoggerVariadic0167
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0167 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a,b');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0167 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_16800
     * @tc.name      testLoggerVariadic0168
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0168 begin');
      let threw: boolean = false;
      try {
        Logger.warn('line1\nline2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0168 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_16900
     * @tc.name      testLoggerVariadic0169
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0169 begin');
      let threw: boolean = false;
      try {
        Logger.warn('tab\tchar');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0169 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_17000
     * @tc.name      testLoggerVariadic0170
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0170 begin');
      let threw: boolean = false;
      try {
        Logger.warn('quote\'s');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0170 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_17100
     * @tc.name      testLoggerVariadic0171
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0171 begin');
      let threw: boolean = false;
      try {
        Logger.warn('back\\slash');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0171 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_17200
     * @tc.name      testLoggerVariadic0172
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0172 begin');
      let threw: boolean = false;
      try {
        Logger.warn('null');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0172 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_17300
     * @tc.name      testLoggerVariadic0173
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0173 begin');
      let threw: boolean = false;
      try {
        Logger.warn('0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0173 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_17400
     * @tc.name      testLoggerVariadic0174
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0174 begin');
      let threw: boolean = false;
      try {
        Logger.warn('true');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0174 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_17500
     * @tc.name      testLoggerVariadic0175
     * @tc.desc      Verify Logger.warn accepts 1 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0175 begin');
      let threw: boolean = false;
      try {
        Logger.warn('false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0175 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_17600
     * @tc.name      testLoggerVariadic0176
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0176 begin');
      let threw: boolean = false;
      try {
        Logger.warn('TAG', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0176 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_17700
     * @tc.name      testLoggerVariadic0177
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0177 begin');
      let threw: boolean = false;
      try {
        Logger.warn('TAG', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0177 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_17800
     * @tc.name      testLoggerVariadic0178
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0178 begin');
      let threw: boolean = false;
      try {
        Logger.warn('', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0178 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_17900
     * @tc.name      testLoggerVariadic0179
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0179 begin');
      let threw: boolean = false;
      try {
        Logger.warn('TAG', '中文');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0179 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_18000
     * @tc.name      testLoggerVariadic0180
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0180 begin');
      let threw: boolean = false;
      try {
        Logger.warn('TAG', '😀');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0180 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_18100
     * @tc.name      testLoggerVariadic0181
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0181 begin');
      let threw: boolean = false;
      try {
        Logger.warn('TAG', 'long');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0181 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_18200
     * @tc.name      testLoggerVariadic0182
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0182 begin');
      let threw: boolean = false;
      try {
        Logger.warn('A', 'B');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0182 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_18300
     * @tc.name      testLoggerVariadic0183
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0183 begin');
      let threw: boolean = false;
      try {
        Logger.warn('0', '1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0183 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_18400
     * @tc.name      testLoggerVariadic0184
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0184 begin');
      let threw: boolean = false;
      try {
        Logger.warn('true', 'false');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0184 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_18500
     * @tc.name      testLoggerVariadic0185
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0185 begin');
      let threw: boolean = false;
      try {
        Logger.warn('left', 'right');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0185 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_18600
     * @tc.name      testLoggerVariadic0186
     * @tc.desc      Verify Logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0186 begin');
      let threw: boolean = false;
      try {
        Logger.warn('A', 'B', 'C');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0186 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_18700
     * @tc.name      testLoggerVariadic0187
     * @tc.desc      Verify Logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0187 begin');
      let threw: boolean = false;
      try {
        Logger.warn('TAG', 'stage', 'message');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0187 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_18800
     * @tc.name      testLoggerVariadic0188
     * @tc.desc      Verify Logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0188 begin');
      let threw: boolean = false;
      try {
        Logger.warn('', '', '');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0188 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_18900
     * @tc.name      testLoggerVariadic0189
     * @tc.desc      Verify Logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0189 begin');
      let threw: boolean = false;
      try {
        Logger.warn('中文', '消息', '内容');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0189 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_19000
     * @tc.name      testLoggerVariadic0190
     * @tc.desc      Verify Logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0190 begin');
      let threw: boolean = false;
      try {
        Logger.warn('1', '2', '3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0190 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_19100
     * @tc.name      testLoggerVariadic0191
     * @tc.desc      Verify Logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0191 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a', 'b', 'c');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0191 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_19200
     * @tc.name      testLoggerVariadic0192
     * @tc.desc      Verify Logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0192 begin');
      let threw: boolean = false;
      try {
        Logger.warn('x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0192 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_19300
     * @tc.name      testLoggerVariadic0193
     * @tc.desc      Verify Logger.warn accepts 3 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0193 begin');
      let threw: boolean = false;
      try {
        Logger.warn('%s', '%d', '%f');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0193 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_19400
     * @tc.name      testLoggerVariadic0194
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0194 begin');
      let threw: boolean = false;
      try {
        Logger.warn('A', 'B', 'C', 'D');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0194 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_19500
     * @tc.name      testLoggerVariadic0195
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0195 begin');
      let threw: boolean = false;
      try {
        Logger.warn('TAG', 'a', 'b', 'c');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0195 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_19600
     * @tc.name      testLoggerVariadic0196
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0196 begin');
      let threw: boolean = false;
      try {
        Logger.warn('1', '2', '3', '4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0196 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_19700
     * @tc.name      testLoggerVariadic0197
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0197 begin');
      let threw: boolean = false;
      try {
        Logger.warn('w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0197 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_19800
     * @tc.name      testLoggerVariadic0198
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0198 begin');
      let threw: boolean = false;
      try {
        Logger.warn('中文', '标签', '消息', '内容');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0198 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_19900
     * @tc.name      testLoggerVariadic0199
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0199 begin');
      let threw: boolean = false;
      try {
        Logger.warn('p', 'q', 'r', 's');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0199 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_20000
     * @tc.name      testLoggerVariadic0200
     * @tc.desc      Verify Logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0200 begin');
      let threw: boolean = false;
      try {
        Logger.warn('A', 'B', 'C', 'D', 'E');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0200 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_20100
     * @tc.name      testLoggerVariadic0201
     * @tc.desc      Verify Logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0201 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a', 'b', 'c', 'd', 'e');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0201 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_20200
     * @tc.name      testLoggerVariadic0202
     * @tc.desc      Verify Logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0202 begin');
      let threw: boolean = false;
      try {
        Logger.warn('1', '2', '3', '4', '5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0202 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_20300
     * @tc.name      testLoggerVariadic0203
     * @tc.desc      Verify Logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0203 begin');
      let threw: boolean = false;
      try {
        Logger.warn('TAG', 'm1', 'm2', 'm3', 'm4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0203 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_20400
     * @tc.name      testLoggerVariadic0204
     * @tc.desc      Verify Logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0204 begin');
      let threw: boolean = false;
      try {
        Logger.warn('中文', '一', '二', '三', '四');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0204 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_20500
     * @tc.name      testLoggerVariadic0205
     * @tc.desc      Verify Logger.warn accepts 5 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0205 begin');
      let threw: boolean = false;
      try {
        Logger.warn('v', 'w', 'x', 'y', 'z');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0205 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_20600
     * @tc.name      testLoggerVariadic0206
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0206 begin');
      let threw: boolean = false;
      try {
        Logger.warn('x', 'y');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0206 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_20700
     * @tc.name      testLoggerVariadic0207
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0207 begin');
      let threw: boolean = false;
      try {
        Logger.warn('yes', 'no');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0207 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_20800
     * @tc.name      testLoggerVariadic0208
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0208 begin');
      let threw: boolean = false;
      try {
        Logger.warn('on', 'off');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0208 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_20900
     * @tc.name      testLoggerVariadic0209
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0209 begin');
      let threw: boolean = false;
      try {
        Logger.warn('start', 'end');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0209 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_21000
     * @tc.name      testLoggerVariadic0210
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0210 begin');
      let threw: boolean = false;
      try {
        Logger.warn('tag', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0210 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_21100
     * @tc.name      testLoggerVariadic0211
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0211 begin');
      let threw: boolean = false;
      try {
        Logger.warn('k', 'v');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0211 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_21200
     * @tc.name      testLoggerVariadic0212
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0212 begin');
      let threw: boolean = false;
      try {
        Logger.warn('key', 'value');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0212 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_21300
     * @tc.name      testLoggerVariadic0213
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0213 begin');
      let threw: boolean = false;
      try {
        Logger.warn('name', 'age');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0213 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_21400
     * @tc.name      testLoggerVariadic0214
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0214 begin');
      let threw: boolean = false;
      try {
        Logger.warn('a', 'b', 'c', 'd');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0214 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_21500
     * @tc.name      testLoggerVariadic0215
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0215 begin');
      let threw: boolean = false;
      try {
        Logger.warn('e', 'f', 'g', 'h');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0215 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_21600
     * @tc.name      testLoggerVariadic0216
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0216 begin');
      let threw: boolean = false;
      try {
        Logger.warn('i', 'j', 'k', 'l');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0216 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_21700
     * @tc.name      testLoggerVariadic0217
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0217 begin');
      let threw: boolean = false;
      try {
        Logger.warn('m', 'n', 'o', 'p');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0217 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_21800
     * @tc.name      testLoggerVariadic0218
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0218 begin');
      let threw: boolean = false;
      try {
        Logger.warn('q', 'r', 's', 't');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0218 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_21900
     * @tc.name      testLoggerVariadic0219
     * @tc.desc      Verify Logger.warn accepts 4 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0219 begin');
      let threw: boolean = false;
      try {
        Logger.warn('u', 'v', 'w', 'x');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0219 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_22000
     * @tc.name      testLoggerVariadic0220
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0220 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg0', 'value0');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0220 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_22100
     * @tc.name      testLoggerVariadic0221
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0221 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg1', 'value1');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0221 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_22200
     * @tc.name      testLoggerVariadic0222
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0222 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg2', 'value2');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0222 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_22300
     * @tc.name      testLoggerVariadic0223
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0223 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg3', 'value3');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0223 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_22400
     * @tc.name      testLoggerVariadic0224
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0224 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg4', 'value4');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0224 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_22500
     * @tc.name      testLoggerVariadic0225
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0225 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg5', 'value5');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0225 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_22600
     * @tc.name      testLoggerVariadic0226
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0226 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg6', 'value6');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0226 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_22700
     * @tc.name      testLoggerVariadic0227
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0227 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg7', 'value7');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0227 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_22800
     * @tc.name      testLoggerVariadic0228
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0228 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg8', 'value8');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0228 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_22900
     * @tc.name      testLoggerVariadic0229
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0229 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg9', 'value9');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0229 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_23000
     * @tc.name      testLoggerVariadic0230
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0230 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg10', 'value10');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0230 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_23100
     * @tc.name      testLoggerVariadic0231
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0231 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg11', 'value11');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0231 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_23200
     * @tc.name      testLoggerVariadic0232
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0232 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg12', 'value12');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0232 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_23300
     * @tc.name      testLoggerVariadic0233
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0233 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg13', 'value13');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0233 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_23400
     * @tc.name      testLoggerVariadic0234
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0234 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg14', 'value14');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0234 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_23500
     * @tc.name      testLoggerVariadic0235
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0235 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg15', 'value15');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0235 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_23600
     * @tc.name      testLoggerVariadic0236
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0236 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg16', 'value16');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0236 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_23700
     * @tc.name      testLoggerVariadic0237
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0237 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg17', 'value17');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0237 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_23800
     * @tc.name      testLoggerVariadic0238
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0238 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg18', 'value18');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0238 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_23900
     * @tc.name      testLoggerVariadic0239
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0239 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg19', 'value19');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0239 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOGVARP3_24000
     * @tc.name      testLoggerVariadic0240
     * @tc.desc      Verify Logger.warn accepts 2 argument(s).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLoggerVariadic0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0240 begin');
      let threw: boolean = false;
      try {
        Logger.warn('arg20', 'value20');
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLoggerVariadic0240 end');
    })

  })
}
