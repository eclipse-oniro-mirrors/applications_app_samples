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
import { PhoneNumberValidator } from '../../../main/ets/utils/PhoneNumberValidator';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function phoneVolume04Test() {
  describe('PhoneVolume04Test', () => {

    /**
     * @tc.name   testPhoneVolume04Anchor01
     * @tc.number SUB_Contact_PHONEV_0229
     * @tc.desc   16212345678 命中 16[2567]；161 前缀与 10 位短号均拒绝
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume04Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume04Anchor01 begin');
      const actual: boolean = PhoneNumberValidator.isValid('16212345678');
      const negative: boolean = PhoneNumberValidator.isValid('12' + '212345678');
      const boundary: boolean = PhoneNumberValidator.isValid('1621234567');
      expect(actual).assertTrue();
      expect(negative).assertFalse();
      expect(boundary).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume04Anchor01 end');
    });
    /**
     * @tc.name   testPhoneVolume040230
     * @tc.number SUB_Contact_PHONEV_0230
     * @tc.desc   16x 段合法：前缀 162 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040230 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16100000000');
      const result: boolean = PhoneNumberValidator.isValid('16200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040230 end');
    });

    /**
     * @tc.name   testPhoneVolume040231
     * @tc.number SUB_Contact_PHONEV_0231
     * @tc.desc   16x 段合法：前缀 162 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040231 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16111111111');
      const result: boolean = PhoneNumberValidator.isValid('16211111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040231 end');
    });

    /**
     * @tc.name   testPhoneVolume040232
     * @tc.number SUB_Contact_PHONEV_0232
     * @tc.desc   16x 段合法：前缀 162 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040232 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16122222222');
      const result: boolean = PhoneNumberValidator.isValid('16222222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040232 end');
    });

    /**
     * @tc.name   testPhoneVolume040233
     * @tc.number SUB_Contact_PHONEV_0233
     * @tc.desc   16x 段合法：前缀 162 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040233 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16133333333');
      const result: boolean = PhoneNumberValidator.isValid('16233333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040233 end');
    });

    /**
     * @tc.name   testPhoneVolume040234
     * @tc.number SUB_Contact_PHONEV_0234
     * @tc.desc   16x 段合法：前缀 162 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040234 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16144444444');
      const result: boolean = PhoneNumberValidator.isValid('16244444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040234 end');
    });

    /**
     * @tc.name   testPhoneVolume040235
     * @tc.number SUB_Contact_PHONEV_0235
     * @tc.desc   16x 段合法：前缀 162 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040235 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16155555555');
      const result: boolean = PhoneNumberValidator.isValid('16255555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040235 end');
    });

    /**
     * @tc.name   testPhoneVolume040236
     * @tc.number SUB_Contact_PHONEV_0236
     * @tc.desc   16x 段合法：前缀 162 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040236 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16166666666');
      const result: boolean = PhoneNumberValidator.isValid('16266666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040236 end');
    });

    /**
     * @tc.name   testPhoneVolume040237
     * @tc.number SUB_Contact_PHONEV_0237
     * @tc.desc   16x 段合法：前缀 165 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040237 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16100000000');
      const result: boolean = PhoneNumberValidator.isValid('16500000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040237 end');
    });

    /**
     * @tc.name   testPhoneVolume040238
     * @tc.number SUB_Contact_PHONEV_0238
     * @tc.desc   16x 段合法：前缀 165 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040238 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16111111111');
      const result: boolean = PhoneNumberValidator.isValid('16511111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040238 end');
    });

    /**
     * @tc.name   testPhoneVolume040239
     * @tc.number SUB_Contact_PHONEV_0239
     * @tc.desc   16x 段合法：前缀 165 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040239 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16122222222');
      const result: boolean = PhoneNumberValidator.isValid('16522222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040239 end');
    });

    /**
     * @tc.name   testPhoneVolume040240
     * @tc.number SUB_Contact_PHONEV_0240
     * @tc.desc   16x 段合法：前缀 165 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040240 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16133333333');
      const result: boolean = PhoneNumberValidator.isValid('16533333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040240 end');
    });

    /**
     * @tc.name   testPhoneVolume040241
     * @tc.number SUB_Contact_PHONEV_0241
     * @tc.desc   16x 段合法：前缀 165 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040241 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16144444444');
      const result: boolean = PhoneNumberValidator.isValid('16544444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040241 end');
    });

    /**
     * @tc.name   testPhoneVolume040242
     * @tc.number SUB_Contact_PHONEV_0242
     * @tc.desc   16x 段合法：前缀 165 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040242 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16155555555');
      const result: boolean = PhoneNumberValidator.isValid('16555555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040242 end');
    });

    /**
     * @tc.name   testPhoneVolume040243
     * @tc.number SUB_Contact_PHONEV_0243
     * @tc.desc   16x 段合法：前缀 165 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040243 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16166666666');
      const result: boolean = PhoneNumberValidator.isValid('16566666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040243 end');
    });

    /**
     * @tc.name   testPhoneVolume040244
     * @tc.number SUB_Contact_PHONEV_0244
     * @tc.desc   16x 段合法：前缀 166 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040244 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16100000000');
      const result: boolean = PhoneNumberValidator.isValid('16600000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040244 end');
    });

    /**
     * @tc.name   testPhoneVolume040245
     * @tc.number SUB_Contact_PHONEV_0245
     * @tc.desc   16x 段合法：前缀 166 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040245 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16111111111');
      const result: boolean = PhoneNumberValidator.isValid('16611111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040245 end');
    });

    /**
     * @tc.name   testPhoneVolume040246
     * @tc.number SUB_Contact_PHONEV_0246
     * @tc.desc   16x 段合法：前缀 166 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040246 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16122222222');
      const result: boolean = PhoneNumberValidator.isValid('16622222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040246 end');
    });

    /**
     * @tc.name   testPhoneVolume040247
     * @tc.number SUB_Contact_PHONEV_0247
     * @tc.desc   16x 段合法：前缀 166 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040247 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16133333333');
      const result: boolean = PhoneNumberValidator.isValid('16633333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040247 end');
    });

    /**
     * @tc.name   testPhoneVolume040248
     * @tc.number SUB_Contact_PHONEV_0248
     * @tc.desc   16x 段合法：前缀 166 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040248 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16144444444');
      const result: boolean = PhoneNumberValidator.isValid('16644444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040248 end');
    });

    /**
     * @tc.name   testPhoneVolume040249
     * @tc.number SUB_Contact_PHONEV_0249
     * @tc.desc   16x 段合法：前缀 166 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040249 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16155555555');
      const result: boolean = PhoneNumberValidator.isValid('16655555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040249 end');
    });

    /**
     * @tc.name   testPhoneVolume040250
     * @tc.number SUB_Contact_PHONEV_0250
     * @tc.desc   16x 段合法：前缀 166 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040250 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16166666666');
      const result: boolean = PhoneNumberValidator.isValid('16666666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040250 end');
    });

    /**
     * @tc.name   testPhoneVolume040251
     * @tc.number SUB_Contact_PHONEV_0251
     * @tc.desc   16x 段合法：前缀 167 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040251 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16100000000');
      const result: boolean = PhoneNumberValidator.isValid('16700000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040251 end');
    });

    /**
     * @tc.name   testPhoneVolume040252
     * @tc.number SUB_Contact_PHONEV_0252
     * @tc.desc   16x 段合法：前缀 167 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040252 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16111111111');
      const result: boolean = PhoneNumberValidator.isValid('16711111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040252 end');
    });

    /**
     * @tc.name   testPhoneVolume040253
     * @tc.number SUB_Contact_PHONEV_0253
     * @tc.desc   16x 段合法：前缀 167 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040253 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16122222222');
      const result: boolean = PhoneNumberValidator.isValid('16722222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040253 end');
    });

    /**
     * @tc.name   testPhoneVolume040254
     * @tc.number SUB_Contact_PHONEV_0254
     * @tc.desc   16x 段合法：前缀 167 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040254 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16133333333');
      const result: boolean = PhoneNumberValidator.isValid('16733333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040254 end');
    });

    /**
     * @tc.name   testPhoneVolume040255
     * @tc.number SUB_Contact_PHONEV_0255
     * @tc.desc   16x 段合法：前缀 167 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040255 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16144444444');
      const result: boolean = PhoneNumberValidator.isValid('16744444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040255 end');
    });

    /**
     * @tc.name   testPhoneVolume040256
     * @tc.number SUB_Contact_PHONEV_0256
     * @tc.desc   16x 段合法：前缀 167 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040256 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16155555555');
      const result: boolean = PhoneNumberValidator.isValid('16755555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040256 end');
    });

    /**
     * @tc.name   testPhoneVolume040257
     * @tc.number SUB_Contact_PHONEV_0257
     * @tc.desc   16x 段合法：前缀 167 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040257 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16166666666');
      const result: boolean = PhoneNumberValidator.isValid('16766666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040257 end');
    });

    /**
     * @tc.name   testPhoneVolume040258
     * @tc.number SUB_Contact_PHONEV_0258
     * @tc.desc   边界：161 不在 16[2567] 号段，判定非法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040258 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16200000000');
      const result: boolean = PhoneNumberValidator.isValid('16100000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040258 end');
    });

    /**
     * @tc.name   testPhoneVolume040259
     * @tc.number SUB_Contact_PHONEV_0259
     * @tc.desc   边界：160 不在 16[2567] 号段，判定非法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040259 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16200000000');
      const result: boolean = PhoneNumberValidator.isValid('16000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040259 end');
    });

    /**
     * @tc.name   testPhoneVolume040260
     * @tc.number SUB_Contact_PHONEV_0260
     * @tc.desc   边界：163 不在 16[2567] 号段，判定非法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040260 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16200000000');
      const result: boolean = PhoneNumberValidator.isValid('16300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040260 end');
    });

    /**
     * @tc.name   testPhoneVolume040261
     * @tc.number SUB_Contact_PHONEV_0261
     * @tc.desc   边界：164 不在 16[2567] 号段，判定非法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040261 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16200000000');
      const result: boolean = PhoneNumberValidator.isValid('16400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040261 end');
    });

    /**
     * @tc.name   testPhoneVolume040262
     * @tc.number SUB_Contact_PHONEV_0262
     * @tc.desc   边界：168 不在 16[2567] 号段，判定非法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040262 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16200000000');
      const result: boolean = PhoneNumberValidator.isValid('16800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040262 end');
    });

    /**
     * @tc.name   testPhoneVolume040263
     * @tc.number SUB_Contact_PHONEV_0263
     * @tc.desc   边界：169 不在 16[2567] 号段，判定非法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040263 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16200000000');
      const result: boolean = PhoneNumberValidator.isValid('16900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040263 end');
    });

    /**
     * @tc.name   testPhoneVolume040264
     * @tc.number SUB_Contact_PHONEV_0264
     * @tc.desc   边界：162 前缀 + 7 位尾号（10 位）低于尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040264 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16200000000');
      const result: boolean = PhoneNumberValidator.isValid('1620000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040264 end');
    });

    /**
     * @tc.name   testPhoneVolume040265
     * @tc.number SUB_Contact_PHONEV_0265
     * @tc.desc   极值：162 前缀 + 20 位尾号，前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040265 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16100000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('16200000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040265 end');
    });

    /**
     * @tc.name   testPhoneVolume040266
     * @tc.number SUB_Contact_PHONEV_0266
     * @tc.desc   非法：前缀后混入字母 a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040266 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16200000000');
      const result: boolean = PhoneNumberValidator.isValid('16a00000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040266 end');
    });

    /**
     * @tc.name   testPhoneVolume040267
     * @tc.number SUB_Contact_PHONEV_0267
     * @tc.desc   非法：尾号末位为符号 !
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040267 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('16200000000');
      const result: boolean = PhoneNumberValidator.isValid('1620000000!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040267 end');
    });

    /**
     * @tc.name   testPhoneVolume040268
     * @tc.number SUB_Contact_PHONEV_0268
     * @tc.desc   补齐：前缀 162 + 尾号 20000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040268 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000000');
      const result: boolean = PhoneNumberValidator.isValid('16220000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040268 end');
    });

    /**
     * @tc.name   testPhoneVolume040269
     * @tc.number SUB_Contact_PHONEV_0269
     * @tc.desc   补齐：前缀 162 + 尾号 20000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040269 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000001');
      const result: boolean = PhoneNumberValidator.isValid('16220000001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040269 end');
    });

    /**
     * @tc.name   testPhoneVolume040270
     * @tc.number SUB_Contact_PHONEV_0270
     * @tc.desc   补齐：前缀 162 + 尾号 20000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040270 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000002');
      const result: boolean = PhoneNumberValidator.isValid('16220000002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040270 end');
    });

    /**
     * @tc.name   testPhoneVolume040271
     * @tc.number SUB_Contact_PHONEV_0271
     * @tc.desc   补齐：前缀 162 + 尾号 20000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040271 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000003');
      const result: boolean = PhoneNumberValidator.isValid('16220000003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040271 end');
    });

    /**
     * @tc.name   testPhoneVolume040272
     * @tc.number SUB_Contact_PHONEV_0272
     * @tc.desc   补齐：前缀 162 + 尾号 20000004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040272 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000004');
      const result: boolean = PhoneNumberValidator.isValid('16220000004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040272 end');
    });

    /**
     * @tc.name   testPhoneVolume040273
     * @tc.number SUB_Contact_PHONEV_0273
     * @tc.desc   补齐：前缀 162 + 尾号 20000005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040273 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000005');
      const result: boolean = PhoneNumberValidator.isValid('16220000005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040273 end');
    });

    /**
     * @tc.name   testPhoneVolume040274
     * @tc.number SUB_Contact_PHONEV_0274
     * @tc.desc   补齐：前缀 162 + 尾号 20000006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040274 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000006');
      const result: boolean = PhoneNumberValidator.isValid('16220000006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040274 end');
    });

    /**
     * @tc.name   testPhoneVolume040275
     * @tc.number SUB_Contact_PHONEV_0275
     * @tc.desc   补齐：前缀 162 + 尾号 20000007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040275 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000007');
      const result: boolean = PhoneNumberValidator.isValid('16220000007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040275 end');
    });

    /**
     * @tc.name   testPhoneVolume040276
     * @tc.number SUB_Contact_PHONEV_0276
     * @tc.desc   补齐：前缀 162 + 尾号 20000008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040276 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000008');
      const result: boolean = PhoneNumberValidator.isValid('16220000008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040276 end');
    });

    /**
     * @tc.name   testPhoneVolume040277
     * @tc.number SUB_Contact_PHONEV_0277
     * @tc.desc   补齐：前缀 162 + 尾号 20000009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040277 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000009');
      const result: boolean = PhoneNumberValidator.isValid('16220000009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040277 end');
    });

    /**
     * @tc.name   testPhoneVolume040278
     * @tc.number SUB_Contact_PHONEV_0278
     * @tc.desc   补齐：前缀 162 + 尾号 20000010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040278 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000010');
      const result: boolean = PhoneNumberValidator.isValid('16220000010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040278 end');
    });

    /**
     * @tc.name   testPhoneVolume040279
     * @tc.number SUB_Contact_PHONEV_0279
     * @tc.desc   补齐：前缀 162 + 尾号 20000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040279 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000011');
      const result: boolean = PhoneNumberValidator.isValid('16220000011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040279 end');
    });

    /**
     * @tc.name   testPhoneVolume040280
     * @tc.number SUB_Contact_PHONEV_0280
     * @tc.desc   补齐：前缀 162 + 尾号 20000012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040280 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000012');
      const result: boolean = PhoneNumberValidator.isValid('16220000012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040280 end');
    });

    /**
     * @tc.name   testPhoneVolume040281
     * @tc.number SUB_Contact_PHONEV_0281
     * @tc.desc   补齐：前缀 162 + 尾号 20000013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040281 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000013');
      const result: boolean = PhoneNumberValidator.isValid('16220000013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040281 end');
    });

    /**
     * @tc.name   testPhoneVolume040282
     * @tc.number SUB_Contact_PHONEV_0282
     * @tc.desc   补齐：前缀 162 + 尾号 20000014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040282 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000014');
      const result: boolean = PhoneNumberValidator.isValid('16220000014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040282 end');
    });

    /**
     * @tc.name   testPhoneVolume040283
     * @tc.number SUB_Contact_PHONEV_0283
     * @tc.desc   补齐：前缀 162 + 尾号 20000015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040283 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000015');
      const result: boolean = PhoneNumberValidator.isValid('16220000015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040283 end');
    });

    /**
     * @tc.name   testPhoneVolume040284
     * @tc.number SUB_Contact_PHONEV_0284
     * @tc.desc   补齐：前缀 162 + 尾号 20000016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040284 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000016');
      const result: boolean = PhoneNumberValidator.isValid('16220000016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040284 end');
    });

    /**
     * @tc.name   testPhoneVolume040285
     * @tc.number SUB_Contact_PHONEV_0285
     * @tc.desc   补齐：前缀 162 + 尾号 20000017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040285 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000017');
      const result: boolean = PhoneNumberValidator.isValid('16220000017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040285 end');
    });

    /**
     * @tc.name   testPhoneVolume040286
     * @tc.number SUB_Contact_PHONEV_0286
     * @tc.desc   补齐：前缀 162 + 尾号 20000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040286 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000018');
      const result: boolean = PhoneNumberValidator.isValid('16220000018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040286 end');
    });

    /**
     * @tc.name   testPhoneVolume040287
     * @tc.number SUB_Contact_PHONEV_0287
     * @tc.desc   补齐：前缀 162 + 尾号 20000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040287 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000019');
      const result: boolean = PhoneNumberValidator.isValid('16220000019');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040287 end');
    });

    /**
     * @tc.name   testPhoneVolume040288
     * @tc.number SUB_Contact_PHONEV_0288
     * @tc.desc   补齐：前缀 162 + 尾号 20000020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040288 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000020');
      const result: boolean = PhoneNumberValidator.isValid('16220000020');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040288 end');
    });

    /**
     * @tc.name   testPhoneVolume040289
     * @tc.number SUB_Contact_PHONEV_0289
     * @tc.desc   补齐：前缀 162 + 尾号 20000021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040289 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000021');
      const result: boolean = PhoneNumberValidator.isValid('16220000021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040289 end');
    });

    /**
     * @tc.name   testPhoneVolume040290
     * @tc.number SUB_Contact_PHONEV_0290
     * @tc.desc   补齐：前缀 162 + 尾号 20000022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040290 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000022');
      const result: boolean = PhoneNumberValidator.isValid('16220000022');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040290 end');
    });

    /**
     * @tc.name   testPhoneVolume040291
     * @tc.number SUB_Contact_PHONEV_0291
     * @tc.desc   补齐：前缀 162 + 尾号 20000023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040291 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000023');
      const result: boolean = PhoneNumberValidator.isValid('16220000023');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040291 end');
    });

    /**
     * @tc.name   testPhoneVolume040292
     * @tc.number SUB_Contact_PHONEV_0292
     * @tc.desc   补齐：前缀 162 + 尾号 20000024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040292 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000024');
      const result: boolean = PhoneNumberValidator.isValid('16220000024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040292 end');
    });

    /**
     * @tc.name   testPhoneVolume040293
     * @tc.number SUB_Contact_PHONEV_0293
     * @tc.desc   补齐：前缀 162 + 尾号 20000025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040293 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000025');
      const result: boolean = PhoneNumberValidator.isValid('16220000025');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040293 end');
    });

    /**
     * @tc.name   testPhoneVolume040294
     * @tc.number SUB_Contact_PHONEV_0294
     * @tc.desc   补齐：前缀 162 + 尾号 20000026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040294 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000026');
      const result: boolean = PhoneNumberValidator.isValid('16220000026');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040294 end');
    });

    /**
     * @tc.name   testPhoneVolume040295
     * @tc.number SUB_Contact_PHONEV_0295
     * @tc.desc   补齐：前缀 162 + 尾号 20000027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040295 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000027');
      const result: boolean = PhoneNumberValidator.isValid('16220000027');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040295 end');
    });

    /**
     * @tc.name   testPhoneVolume040296
     * @tc.number SUB_Contact_PHONEV_0296
     * @tc.desc   补齐：前缀 162 + 尾号 20000028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040296 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000028');
      const result: boolean = PhoneNumberValidator.isValid('16220000028');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040296 end');
    });

    /**
     * @tc.name   testPhoneVolume040297
     * @tc.number SUB_Contact_PHONEV_0297
     * @tc.desc   补齐：前缀 162 + 尾号 20000029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040297 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000029');
      const result: boolean = PhoneNumberValidator.isValid('16220000029');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040297 end');
    });

    /**
     * @tc.name   testPhoneVolume040298
     * @tc.number SUB_Contact_PHONEV_0298
     * @tc.desc   补齐：前缀 162 + 尾号 20000030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040298 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000030');
      const result: boolean = PhoneNumberValidator.isValid('16220000030');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040298 end');
    });

    /**
     * @tc.name   testPhoneVolume040299
     * @tc.number SUB_Contact_PHONEV_0299
     * @tc.desc   补齐：前缀 162 + 尾号 20000031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040299 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000031');
      const result: boolean = PhoneNumberValidator.isValid('16220000031');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040299 end');
    });

    /**
     * @tc.name   testPhoneVolume040300
     * @tc.number SUB_Contact_PHONEV_0300
     * @tc.desc   补齐：前缀 162 + 尾号 20000032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040300 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000032');
      const result: boolean = PhoneNumberValidator.isValid('16220000032');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040300 end');
    });

    /**
     * @tc.name   testPhoneVolume040301
     * @tc.number SUB_Contact_PHONEV_0301
     * @tc.desc   补齐：前缀 162 + 尾号 20000033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040301 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000033');
      const result: boolean = PhoneNumberValidator.isValid('16220000033');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040301 end');
    });

    /**
     * @tc.name   testPhoneVolume040302
     * @tc.number SUB_Contact_PHONEV_0302
     * @tc.desc   补齐：前缀 162 + 尾号 20000034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040302 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000034');
      const result: boolean = PhoneNumberValidator.isValid('16220000034');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040302 end');
    });

    /**
     * @tc.name   testPhoneVolume040303
     * @tc.number SUB_Contact_PHONEV_0303
     * @tc.desc   补齐：前缀 162 + 尾号 20000035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040303 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000035');
      const result: boolean = PhoneNumberValidator.isValid('16220000035');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040303 end');
    });

    /**
     * @tc.name   testPhoneVolume040304
     * @tc.number SUB_Contact_PHONEV_0304
     * @tc.desc   补齐：前缀 162 + 尾号 20000036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume040304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040304 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1220000036');
      const result: boolean = PhoneNumberValidator.isValid('16220000036');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume040304 end');
    });

  });
}
