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

export default function phoneVolume06Test() {
  describe('PhoneVolume06Test', () => {

    /**
     * @tc.name   testPhoneVolume06Anchor01
     * @tc.number SUB_Contact_PHONEV_0381
     * @tc.desc   18812345678 命中 18[0-9]；10x 前缀与 10 位短号均拒绝
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume06Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume06Anchor01 begin');
      const actual: boolean = PhoneNumberValidator.isValid('18812345678');
      const negative: boolean = PhoneNumberValidator.isValid('12' + '812345678');
      const boundary: boolean = PhoneNumberValidator.isValid('1881234567');
      expect(actual).assertTrue();
      expect(negative).assertFalse();
      expect(boundary).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume06Anchor01 end');
    });
    /**
     * @tc.name   testPhoneVolume060382
     * @tc.number SUB_Contact_PHONEV_0382
     * @tc.desc   18x 段合法：前缀 180 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060382 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1000000000');
      const result: boolean = PhoneNumberValidator.isValid('18000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060382 end');
    });

    /**
     * @tc.name   testPhoneVolume060383
     * @tc.number SUB_Contact_PHONEV_0383
     * @tc.desc   18x 段合法：前缀 180 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060383 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1011111111');
      const result: boolean = PhoneNumberValidator.isValid('18011111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060383 end');
    });

    /**
     * @tc.name   testPhoneVolume060384
     * @tc.number SUB_Contact_PHONEV_0384
     * @tc.desc   18x 段合法：前缀 180 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060384 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1022222222');
      const result: boolean = PhoneNumberValidator.isValid('18022222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060384 end');
    });

    /**
     * @tc.name   testPhoneVolume060385
     * @tc.number SUB_Contact_PHONEV_0385
     * @tc.desc   18x 段合法：前缀 180 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060385 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1033333333');
      const result: boolean = PhoneNumberValidator.isValid('18033333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060385 end');
    });

    /**
     * @tc.name   testPhoneVolume060386
     * @tc.number SUB_Contact_PHONEV_0386
     * @tc.desc   18x 段合法：前缀 180 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060386 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1044444444');
      const result: boolean = PhoneNumberValidator.isValid('18044444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060386 end');
    });

    /**
     * @tc.name   testPhoneVolume060387
     * @tc.number SUB_Contact_PHONEV_0387
     * @tc.desc   18x 段合法：前缀 180 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060387 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1055555555');
      const result: boolean = PhoneNumberValidator.isValid('18055555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060387 end');
    });

    /**
     * @tc.name   testPhoneVolume060388
     * @tc.number SUB_Contact_PHONEV_0388
     * @tc.desc   18x 段合法：前缀 180 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060388 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1066666666');
      const result: boolean = PhoneNumberValidator.isValid('18066666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060388 end');
    });

    /**
     * @tc.name   testPhoneVolume060389
     * @tc.number SUB_Contact_PHONEV_0389
     * @tc.desc   18x 段合法：前缀 181 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060389 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1000000000');
      const result: boolean = PhoneNumberValidator.isValid('18100000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060389 end');
    });

    /**
     * @tc.name   testPhoneVolume060390
     * @tc.number SUB_Contact_PHONEV_0390
     * @tc.desc   18x 段合法：前缀 181 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060390 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1011111111');
      const result: boolean = PhoneNumberValidator.isValid('18111111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060390 end');
    });

    /**
     * @tc.name   testPhoneVolume060391
     * @tc.number SUB_Contact_PHONEV_0391
     * @tc.desc   18x 段合法：前缀 181 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060391 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1022222222');
      const result: boolean = PhoneNumberValidator.isValid('18122222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060391 end');
    });

    /**
     * @tc.name   testPhoneVolume060392
     * @tc.number SUB_Contact_PHONEV_0392
     * @tc.desc   18x 段合法：前缀 181 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060392 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1033333333');
      const result: boolean = PhoneNumberValidator.isValid('18133333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060392 end');
    });

    /**
     * @tc.name   testPhoneVolume060393
     * @tc.number SUB_Contact_PHONEV_0393
     * @tc.desc   18x 段合法：前缀 181 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060393 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1044444444');
      const result: boolean = PhoneNumberValidator.isValid('18144444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060393 end');
    });

    /**
     * @tc.name   testPhoneVolume060394
     * @tc.number SUB_Contact_PHONEV_0394
     * @tc.desc   18x 段合法：前缀 181 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060394 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1055555555');
      const result: boolean = PhoneNumberValidator.isValid('18155555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060394 end');
    });

    /**
     * @tc.name   testPhoneVolume060395
     * @tc.number SUB_Contact_PHONEV_0395
     * @tc.desc   18x 段合法：前缀 181 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060395 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1066666666');
      const result: boolean = PhoneNumberValidator.isValid('18166666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060395 end');
    });

    /**
     * @tc.name   testPhoneVolume060396
     * @tc.number SUB_Contact_PHONEV_0396
     * @tc.desc   18x 段合法：前缀 182 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060396 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1000000000');
      const result: boolean = PhoneNumberValidator.isValid('18200000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060396 end');
    });

    /**
     * @tc.name   testPhoneVolume060397
     * @tc.number SUB_Contact_PHONEV_0397
     * @tc.desc   18x 段合法：前缀 182 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060397 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1011111111');
      const result: boolean = PhoneNumberValidator.isValid('18211111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060397 end');
    });

    /**
     * @tc.name   testPhoneVolume060398
     * @tc.number SUB_Contact_PHONEV_0398
     * @tc.desc   18x 段合法：前缀 182 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060398 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1022222222');
      const result: boolean = PhoneNumberValidator.isValid('18222222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060398 end');
    });

    /**
     * @tc.name   testPhoneVolume060399
     * @tc.number SUB_Contact_PHONEV_0399
     * @tc.desc   18x 段合法：前缀 182 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060399 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1033333333');
      const result: boolean = PhoneNumberValidator.isValid('18233333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060399 end');
    });

    /**
     * @tc.name   testPhoneVolume060400
     * @tc.number SUB_Contact_PHONEV_0400
     * @tc.desc   18x 段合法：前缀 182 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060400 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1044444444');
      const result: boolean = PhoneNumberValidator.isValid('18244444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060400 end');
    });

    /**
     * @tc.name   testPhoneVolume060401
     * @tc.number SUB_Contact_PHONEV_0401
     * @tc.desc   18x 段合法：前缀 182 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060401 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1055555555');
      const result: boolean = PhoneNumberValidator.isValid('18255555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060401 end');
    });

    /**
     * @tc.name   testPhoneVolume060402
     * @tc.number SUB_Contact_PHONEV_0402
     * @tc.desc   18x 段合法：前缀 182 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060402 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1066666666');
      const result: boolean = PhoneNumberValidator.isValid('18266666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060402 end');
    });

    /**
     * @tc.name   testPhoneVolume060403
     * @tc.number SUB_Contact_PHONEV_0403
     * @tc.desc   18x 段合法：前缀 183 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060403 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1000000000');
      const result: boolean = PhoneNumberValidator.isValid('18300000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060403 end');
    });

    /**
     * @tc.name   testPhoneVolume060404
     * @tc.number SUB_Contact_PHONEV_0404
     * @tc.desc   18x 段合法：前缀 183 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060404 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1011111111');
      const result: boolean = PhoneNumberValidator.isValid('18311111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060404 end');
    });

    /**
     * @tc.name   testPhoneVolume060405
     * @tc.number SUB_Contact_PHONEV_0405
     * @tc.desc   18x 段合法：前缀 183 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060405 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1022222222');
      const result: boolean = PhoneNumberValidator.isValid('18322222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060405 end');
    });

    /**
     * @tc.name   testPhoneVolume060406
     * @tc.number SUB_Contact_PHONEV_0406
     * @tc.desc   18x 段合法：前缀 183 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060406 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1033333333');
      const result: boolean = PhoneNumberValidator.isValid('18333333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060406 end');
    });

    /**
     * @tc.name   testPhoneVolume060407
     * @tc.number SUB_Contact_PHONEV_0407
     * @tc.desc   18x 段合法：前缀 183 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060407 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1044444444');
      const result: boolean = PhoneNumberValidator.isValid('18344444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060407 end');
    });

    /**
     * @tc.name   testPhoneVolume060408
     * @tc.number SUB_Contact_PHONEV_0408
     * @tc.desc   18x 段合法：前缀 183 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060408 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1055555555');
      const result: boolean = PhoneNumberValidator.isValid('18355555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060408 end');
    });

    /**
     * @tc.name   testPhoneVolume060409
     * @tc.number SUB_Contact_PHONEV_0409
     * @tc.desc   18x 段合法：前缀 183 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060409 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1066666666');
      const result: boolean = PhoneNumberValidator.isValid('18366666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060409 end');
    });

    /**
     * @tc.name   testPhoneVolume060410
     * @tc.number SUB_Contact_PHONEV_0410
     * @tc.desc   18x 段合法：前缀 184 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060410 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1000000000');
      const result: boolean = PhoneNumberValidator.isValid('18400000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060410 end');
    });

    /**
     * @tc.name   testPhoneVolume060411
     * @tc.number SUB_Contact_PHONEV_0411
     * @tc.desc   18x 段合法：前缀 184 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060411 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1011111111');
      const result: boolean = PhoneNumberValidator.isValid('18411111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060411 end');
    });

    /**
     * @tc.name   testPhoneVolume060412
     * @tc.number SUB_Contact_PHONEV_0412
     * @tc.desc   18x 段合法：前缀 184 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060412 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1022222222');
      const result: boolean = PhoneNumberValidator.isValid('18422222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060412 end');
    });

    /**
     * @tc.name   testPhoneVolume060413
     * @tc.number SUB_Contact_PHONEV_0413
     * @tc.desc   18x 段合法：前缀 184 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060413 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1033333333');
      const result: boolean = PhoneNumberValidator.isValid('18433333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060413 end');
    });

    /**
     * @tc.name   testPhoneVolume060414
     * @tc.number SUB_Contact_PHONEV_0414
     * @tc.desc   18x 段合法：前缀 184 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060414 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1044444444');
      const result: boolean = PhoneNumberValidator.isValid('18444444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060414 end');
    });

    /**
     * @tc.name   testPhoneVolume060415
     * @tc.number SUB_Contact_PHONEV_0415
     * @tc.desc   18x 段合法：前缀 184 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060415 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1055555555');
      const result: boolean = PhoneNumberValidator.isValid('18455555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060415 end');
    });

    /**
     * @tc.name   testPhoneVolume060416
     * @tc.number SUB_Contact_PHONEV_0416
     * @tc.desc   18x 段合法：前缀 184 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060416 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1066666666');
      const result: boolean = PhoneNumberValidator.isValid('18466666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060416 end');
    });

    /**
     * @tc.name   testPhoneVolume060417
     * @tc.number SUB_Contact_PHONEV_0417
     * @tc.desc   18x 段合法：前缀 185 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060417 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1000000000');
      const result: boolean = PhoneNumberValidator.isValid('18500000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060417 end');
    });

    /**
     * @tc.name   testPhoneVolume060418
     * @tc.number SUB_Contact_PHONEV_0418
     * @tc.desc   18x 段合法：前缀 185 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060418 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1011111111');
      const result: boolean = PhoneNumberValidator.isValid('18511111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060418 end');
    });

    /**
     * @tc.name   testPhoneVolume060419
     * @tc.number SUB_Contact_PHONEV_0419
     * @tc.desc   18x 段合法：前缀 185 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060419 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1022222222');
      const result: boolean = PhoneNumberValidator.isValid('18522222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060419 end');
    });

    /**
     * @tc.name   testPhoneVolume060420
     * @tc.number SUB_Contact_PHONEV_0420
     * @tc.desc   18x 段合法：前缀 185 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060420 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1033333333');
      const result: boolean = PhoneNumberValidator.isValid('18533333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060420 end');
    });

    /**
     * @tc.name   testPhoneVolume060421
     * @tc.number SUB_Contact_PHONEV_0421
     * @tc.desc   18x 段合法：前缀 185 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060421 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1044444444');
      const result: boolean = PhoneNumberValidator.isValid('18544444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060421 end');
    });

    /**
     * @tc.name   testPhoneVolume060422
     * @tc.number SUB_Contact_PHONEV_0422
     * @tc.desc   18x 段合法：前缀 185 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060422 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1055555555');
      const result: boolean = PhoneNumberValidator.isValid('18555555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060422 end');
    });

    /**
     * @tc.name   testPhoneVolume060423
     * @tc.number SUB_Contact_PHONEV_0423
     * @tc.desc   18x 段合法：前缀 185 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060423 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1066666666');
      const result: boolean = PhoneNumberValidator.isValid('18566666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060423 end');
    });

    /**
     * @tc.name   testPhoneVolume060424
     * @tc.number SUB_Contact_PHONEV_0424
     * @tc.desc   18x 段合法：前缀 186 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060424 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1000000000');
      const result: boolean = PhoneNumberValidator.isValid('18600000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060424 end');
    });

    /**
     * @tc.name   testPhoneVolume060425
     * @tc.number SUB_Contact_PHONEV_0425
     * @tc.desc   18x 段合法：前缀 186 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060425 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1011111111');
      const result: boolean = PhoneNumberValidator.isValid('18611111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060425 end');
    });

    /**
     * @tc.name   testPhoneVolume060426
     * @tc.number SUB_Contact_PHONEV_0426
     * @tc.desc   18x 段合法：前缀 186 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060426 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1022222222');
      const result: boolean = PhoneNumberValidator.isValid('18622222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060426 end');
    });

    /**
     * @tc.name   testPhoneVolume060427
     * @tc.number SUB_Contact_PHONEV_0427
     * @tc.desc   18x 段合法：前缀 186 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060427 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1033333333');
      const result: boolean = PhoneNumberValidator.isValid('18633333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060427 end');
    });

    /**
     * @tc.name   testPhoneVolume060428
     * @tc.number SUB_Contact_PHONEV_0428
     * @tc.desc   18x 段合法：前缀 186 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060428 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1044444444');
      const result: boolean = PhoneNumberValidator.isValid('18644444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060428 end');
    });

    /**
     * @tc.name   testPhoneVolume060429
     * @tc.number SUB_Contact_PHONEV_0429
     * @tc.desc   18x 段合法：前缀 186 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060429 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1055555555');
      const result: boolean = PhoneNumberValidator.isValid('18655555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060429 end');
    });

    /**
     * @tc.name   testPhoneVolume060430
     * @tc.number SUB_Contact_PHONEV_0430
     * @tc.desc   18x 段合法：前缀 186 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060430 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1066666666');
      const result: boolean = PhoneNumberValidator.isValid('18666666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060430 end');
    });

    /**
     * @tc.name   testPhoneVolume060431
     * @tc.number SUB_Contact_PHONEV_0431
     * @tc.desc   18x 段合法：前缀 187 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060431 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1000000000');
      const result: boolean = PhoneNumberValidator.isValid('18700000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060431 end');
    });

    /**
     * @tc.name   testPhoneVolume060432
     * @tc.number SUB_Contact_PHONEV_0432
     * @tc.desc   18x 段合法：前缀 187 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060432 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1011111111');
      const result: boolean = PhoneNumberValidator.isValid('18711111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060432 end');
    });

    /**
     * @tc.name   testPhoneVolume060433
     * @tc.number SUB_Contact_PHONEV_0433
     * @tc.desc   18x 段合法：前缀 187 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060433 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1022222222');
      const result: boolean = PhoneNumberValidator.isValid('18722222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060433 end');
    });

    /**
     * @tc.name   testPhoneVolume060434
     * @tc.number SUB_Contact_PHONEV_0434
     * @tc.desc   18x 段合法：前缀 187 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060434 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1033333333');
      const result: boolean = PhoneNumberValidator.isValid('18733333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060434 end');
    });

    /**
     * @tc.name   testPhoneVolume060435
     * @tc.number SUB_Contact_PHONEV_0435
     * @tc.desc   18x 段合法：前缀 187 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060435 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1044444444');
      const result: boolean = PhoneNumberValidator.isValid('18744444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060435 end');
    });

    /**
     * @tc.name   testPhoneVolume060436
     * @tc.number SUB_Contact_PHONEV_0436
     * @tc.desc   18x 段合法：前缀 187 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060436 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1055555555');
      const result: boolean = PhoneNumberValidator.isValid('18755555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060436 end');
    });

    /**
     * @tc.name   testPhoneVolume060437
     * @tc.number SUB_Contact_PHONEV_0437
     * @tc.desc   18x 段合法：前缀 187 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060437 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1066666666');
      const result: boolean = PhoneNumberValidator.isValid('18766666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060437 end');
    });

    /**
     * @tc.name   testPhoneVolume060438
     * @tc.number SUB_Contact_PHONEV_0438
     * @tc.desc   18x 段合法：前缀 188 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060438 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1000000000');
      const result: boolean = PhoneNumberValidator.isValid('18800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060438 end');
    });

    /**
     * @tc.name   testPhoneVolume060439
     * @tc.number SUB_Contact_PHONEV_0439
     * @tc.desc   18x 段合法：前缀 188 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060439 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1011111111');
      const result: boolean = PhoneNumberValidator.isValid('18811111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060439 end');
    });

    /**
     * @tc.name   testPhoneVolume060440
     * @tc.number SUB_Contact_PHONEV_0440
     * @tc.desc   18x 段合法：前缀 188 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060440 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1022222222');
      const result: boolean = PhoneNumberValidator.isValid('18822222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060440 end');
    });

    /**
     * @tc.name   testPhoneVolume060441
     * @tc.number SUB_Contact_PHONEV_0441
     * @tc.desc   18x 段合法：前缀 188 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060441 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1033333333');
      const result: boolean = PhoneNumberValidator.isValid('18833333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060441 end');
    });

    /**
     * @tc.name   testPhoneVolume060442
     * @tc.number SUB_Contact_PHONEV_0442
     * @tc.desc   18x 段合法：前缀 188 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060442 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1044444444');
      const result: boolean = PhoneNumberValidator.isValid('18844444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060442 end');
    });

    /**
     * @tc.name   testPhoneVolume060443
     * @tc.number SUB_Contact_PHONEV_0443
     * @tc.desc   18x 段合法：前缀 188 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060443 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1055555555');
      const result: boolean = PhoneNumberValidator.isValid('18855555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060443 end');
    });

    /**
     * @tc.name   testPhoneVolume060444
     * @tc.number SUB_Contact_PHONEV_0444
     * @tc.desc   18x 段合法：前缀 188 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060444 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1066666666');
      const result: boolean = PhoneNumberValidator.isValid('18866666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060444 end');
    });

    /**
     * @tc.name   testPhoneVolume060445
     * @tc.number SUB_Contact_PHONEV_0445
     * @tc.desc   18x 段合法：前缀 189 命中规则，尾号 00000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060445 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1000000000');
      const result: boolean = PhoneNumberValidator.isValid('18900000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060445 end');
    });

    /**
     * @tc.name   testPhoneVolume060446
     * @tc.number SUB_Contact_PHONEV_0446
     * @tc.desc   18x 段合法：前缀 189 命中规则，尾号 11111111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060446 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1011111111');
      const result: boolean = PhoneNumberValidator.isValid('18911111111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060446 end');
    });

    /**
     * @tc.name   testPhoneVolume060447
     * @tc.number SUB_Contact_PHONEV_0447
     * @tc.desc   18x 段合法：前缀 189 命中规则，尾号 22222222
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060447 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1022222222');
      const result: boolean = PhoneNumberValidator.isValid('18922222222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060447 end');
    });

    /**
     * @tc.name   testPhoneVolume060448
     * @tc.number SUB_Contact_PHONEV_0448
     * @tc.desc   18x 段合法：前缀 189 命中规则，尾号 33333333
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060448 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1033333333');
      const result: boolean = PhoneNumberValidator.isValid('18933333333');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060448 end');
    });

    /**
     * @tc.name   testPhoneVolume060449
     * @tc.number SUB_Contact_PHONEV_0449
     * @tc.desc   18x 段合法：前缀 189 命中规则，尾号 44444444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060449 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1044444444');
      const result: boolean = PhoneNumberValidator.isValid('18944444444');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060449 end');
    });

    /**
     * @tc.name   testPhoneVolume060450
     * @tc.number SUB_Contact_PHONEV_0450
     * @tc.desc   18x 段合法：前缀 189 命中规则，尾号 55555555
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060450 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1055555555');
      const result: boolean = PhoneNumberValidator.isValid('18955555555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060450 end');
    });

    /**
     * @tc.name   testPhoneVolume060451
     * @tc.number SUB_Contact_PHONEV_0451
     * @tc.desc   18x 段合法：前缀 189 命中规则，尾号 66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060451', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060451 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('1066666666');
      const result: boolean = PhoneNumberValidator.isValid('18966666666');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060451 end');
    });

    /**
     * @tc.name   testPhoneVolume060452
     * @tc.number SUB_Contact_PHONEV_0452
     * @tc.desc   边界：180 前缀 + 7 位尾号（10 位）低于尾数要求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060452 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('18000000000');
      const result: boolean = PhoneNumberValidator.isValid('1800000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060452 end');
    });

    /**
     * @tc.name   testPhoneVolume060453
     * @tc.number SUB_Contact_PHONEV_0453
     * @tc.desc   边界：180 前缀 + 9 位尾号（12 位）前缀匹配语义仍通过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060453', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060453 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('100000000000');
      const result: boolean = PhoneNumberValidator.isValid('180000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060453 end');
    });

    /**
     * @tc.name   testPhoneVolume060454
     * @tc.number SUB_Contact_PHONEV_0454
     * @tc.desc   非法：前缀后混入字母 a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060454', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060454 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('18000000000');
      const result: boolean = PhoneNumberValidator.isValid('18a00000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060454 end');
    });

    /**
     * @tc.name   testPhoneVolume060455
     * @tc.number SUB_Contact_PHONEV_0455
     * @tc.desc   合法：同段两个合法输入相邻对照，结果同为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060455', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060455 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('18999999999');
      const result: boolean = PhoneNumberValidator.isValid('18000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(true));
      expect(adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(true));
      expect(result === adjacentResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060455 end');
    });

    /**
     * @tc.name   testPhoneVolume060456
     * @tc.number SUB_Contact_PHONEV_0456
     * @tc.desc   极值：180 前缀 + 20 位尾号，前缀匹配无长度上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPhoneVolume060456', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060456 begin');
      const adjacentResult: boolean = PhoneNumberValidator.isValid('10000000000000000000000');
      const result: boolean = PhoneNumberValidator.isValid('18000000000000000000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(adjacentResult), String(false));
      expect(adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === adjacentResult), String(false));
      expect(result === adjacentResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPhoneVolume060456 end');
    });

  });
}
