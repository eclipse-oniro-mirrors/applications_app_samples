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
import contact from '@ohos.contact';
import { ContactFieldExtractor } from '../../../main/ets/utils/ContactFieldExtractor';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function fieldVolume04Test() {
  describe('FieldVolume04Test', () => {

    /**
     * @tc.name   testFieldVolume04Anchor01
     * @tc.number SUB_Contact_FIELD_0229
     * @tc.desc   letterDiffers 首字符不同为真，大小写敏感
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume04Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume04Anchor01 begin');
      const same: boolean = ContactFieldExtractor.letterDiffers('zhang', 'zhao');
      const diff: boolean = ContactFieldExtractor.letterDiffers('zhang', 'wang');
      const caseSensitive: boolean = ContactFieldExtractor.letterDiffers('a', 'A');
      expect(same).assertFalse();
      expect(diff).assertTrue();
      expect(caseSensitive).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume04Anchor01 end');
    });
    /**
     * @tc.name   testFieldVolume040230
     * @tc.number SUB_Contact_FIELD_0230
     * @tc.desc   同首：A 对 A 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040230 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('A', 'A');
      const result: boolean = ContactFieldExtractor.letterDiffers('A', 'A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040230 end');
    });

    /**
     * @tc.name   testFieldVolume040231
     * @tc.number SUB_Contact_FIELD_0231
     * @tc.desc   异首：A 对 B 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040231 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('B', 'A');
      const result: boolean = ContactFieldExtractor.letterDiffers('A', 'B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040231 end');
    });

    /**
     * @tc.name   testFieldVolume040232
     * @tc.number SUB_Contact_FIELD_0232
     * @tc.desc   异首：B 对 A 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040232 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('A', 'B');
      const result: boolean = ContactFieldExtractor.letterDiffers('B', 'A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040232 end');
    });

    /**
     * @tc.name   testFieldVolume040233
     * @tc.number SUB_Contact_FIELD_0233
     * @tc.desc   同首：B 对 B 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040233 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('B', 'B');
      const result: boolean = ContactFieldExtractor.letterDiffers('B', 'B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040233 end');
    });

    /**
     * @tc.name   testFieldVolume040234
     * @tc.number SUB_Contact_FIELD_0234
     * @tc.desc   异首：B 对 C 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040234 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('C', 'B');
      const result: boolean = ContactFieldExtractor.letterDiffers('B', 'C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040234 end');
    });

    /**
     * @tc.name   testFieldVolume040235
     * @tc.number SUB_Contact_FIELD_0235
     * @tc.desc   异首：C 对 B 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040235 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('B', 'C');
      const result: boolean = ContactFieldExtractor.letterDiffers('C', 'B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040235 end');
    });

    /**
     * @tc.name   testFieldVolume040236
     * @tc.number SUB_Contact_FIELD_0236
     * @tc.desc   同首：C 对 C 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040236 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('C', 'C');
      const result: boolean = ContactFieldExtractor.letterDiffers('C', 'C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040236 end');
    });

    /**
     * @tc.name   testFieldVolume040237
     * @tc.number SUB_Contact_FIELD_0237
     * @tc.desc   异首：C 对 D 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040237 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('D', 'C');
      const result: boolean = ContactFieldExtractor.letterDiffers('C', 'D');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040237 end');
    });

    /**
     * @tc.name   testFieldVolume040238
     * @tc.number SUB_Contact_FIELD_0238
     * @tc.desc   异首：D 对 C 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040238 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('C', 'D');
      const result: boolean = ContactFieldExtractor.letterDiffers('D', 'C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040238 end');
    });

    /**
     * @tc.name   testFieldVolume040239
     * @tc.number SUB_Contact_FIELD_0239
     * @tc.desc   同首：D 对 D 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040239 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('D', 'D');
      const result: boolean = ContactFieldExtractor.letterDiffers('D', 'D');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040239 end');
    });

    /**
     * @tc.name   testFieldVolume040240
     * @tc.number SUB_Contact_FIELD_0240
     * @tc.desc   异首：D 对 E 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040240 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('E', 'D');
      const result: boolean = ContactFieldExtractor.letterDiffers('D', 'E');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040240 end');
    });

    /**
     * @tc.name   testFieldVolume040241
     * @tc.number SUB_Contact_FIELD_0241
     * @tc.desc   异首：E 对 D 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040241 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('D', 'E');
      const result: boolean = ContactFieldExtractor.letterDiffers('E', 'D');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040241 end');
    });

    /**
     * @tc.name   testFieldVolume040242
     * @tc.number SUB_Contact_FIELD_0242
     * @tc.desc   同首：E 对 E 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040242 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('E', 'E');
      const result: boolean = ContactFieldExtractor.letterDiffers('E', 'E');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040242 end');
    });

    /**
     * @tc.name   testFieldVolume040243
     * @tc.number SUB_Contact_FIELD_0243
     * @tc.desc   异首：E 对 F 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040243 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('F', 'E');
      const result: boolean = ContactFieldExtractor.letterDiffers('E', 'F');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040243 end');
    });

    /**
     * @tc.name   testFieldVolume040244
     * @tc.number SUB_Contact_FIELD_0244
     * @tc.desc   异首：F 对 E 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040244 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('E', 'F');
      const result: boolean = ContactFieldExtractor.letterDiffers('F', 'E');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040244 end');
    });

    /**
     * @tc.name   testFieldVolume040245
     * @tc.number SUB_Contact_FIELD_0245
     * @tc.desc   同首：F 对 F 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040245 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('F', 'F');
      const result: boolean = ContactFieldExtractor.letterDiffers('F', 'F');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040245 end');
    });

    /**
     * @tc.name   testFieldVolume040246
     * @tc.number SUB_Contact_FIELD_0246
     * @tc.desc   异首：F 对 G 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040246 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('G', 'F');
      const result: boolean = ContactFieldExtractor.letterDiffers('F', 'G');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040246 end');
    });

    /**
     * @tc.name   testFieldVolume040247
     * @tc.number SUB_Contact_FIELD_0247
     * @tc.desc   异首：G 对 F 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040247 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('F', 'G');
      const result: boolean = ContactFieldExtractor.letterDiffers('G', 'F');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040247 end');
    });

    /**
     * @tc.name   testFieldVolume040248
     * @tc.number SUB_Contact_FIELD_0248
     * @tc.desc   同首：G 对 G 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040248 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('G', 'G');
      const result: boolean = ContactFieldExtractor.letterDiffers('G', 'G');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040248 end');
    });

    /**
     * @tc.name   testFieldVolume040249
     * @tc.number SUB_Contact_FIELD_0249
     * @tc.desc   异首：G 对 H 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040249 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('H', 'G');
      const result: boolean = ContactFieldExtractor.letterDiffers('G', 'H');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040249 end');
    });

    /**
     * @tc.name   testFieldVolume040250
     * @tc.number SUB_Contact_FIELD_0250
     * @tc.desc   异首：H 对 G 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040250 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('G', 'H');
      const result: boolean = ContactFieldExtractor.letterDiffers('H', 'G');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040250 end');
    });

    /**
     * @tc.name   testFieldVolume040251
     * @tc.number SUB_Contact_FIELD_0251
     * @tc.desc   同首：H 对 H 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040251 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('H', 'H');
      const result: boolean = ContactFieldExtractor.letterDiffers('H', 'H');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040251 end');
    });

    /**
     * @tc.name   testFieldVolume040252
     * @tc.number SUB_Contact_FIELD_0252
     * @tc.desc   异首：H 对 I 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040252 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('I', 'H');
      const result: boolean = ContactFieldExtractor.letterDiffers('H', 'I');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040252 end');
    });

    /**
     * @tc.name   testFieldVolume040253
     * @tc.number SUB_Contact_FIELD_0253
     * @tc.desc   异首：I 对 H 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040253 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('H', 'I');
      const result: boolean = ContactFieldExtractor.letterDiffers('I', 'H');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040253 end');
    });

    /**
     * @tc.name   testFieldVolume040254
     * @tc.number SUB_Contact_FIELD_0254
     * @tc.desc   同首：I 对 I 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040254 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('I', 'I');
      const result: boolean = ContactFieldExtractor.letterDiffers('I', 'I');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040254 end');
    });

    /**
     * @tc.name   testFieldVolume040255
     * @tc.number SUB_Contact_FIELD_0255
     * @tc.desc   异首：I 对 J 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040255 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('J', 'I');
      const result: boolean = ContactFieldExtractor.letterDiffers('I', 'J');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040255 end');
    });

    /**
     * @tc.name   testFieldVolume040256
     * @tc.number SUB_Contact_FIELD_0256
     * @tc.desc   异首：J 对 I 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040256 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('I', 'J');
      const result: boolean = ContactFieldExtractor.letterDiffers('J', 'I');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040256 end');
    });

    /**
     * @tc.name   testFieldVolume040257
     * @tc.number SUB_Contact_FIELD_0257
     * @tc.desc   同首：J 对 J 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040257 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('J', 'J');
      const result: boolean = ContactFieldExtractor.letterDiffers('J', 'J');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040257 end');
    });

    /**
     * @tc.name   testFieldVolume040258
     * @tc.number SUB_Contact_FIELD_0258
     * @tc.desc   异首：J 对 K 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040258 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('K', 'J');
      const result: boolean = ContactFieldExtractor.letterDiffers('J', 'K');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040258 end');
    });

    /**
     * @tc.name   testFieldVolume040259
     * @tc.number SUB_Contact_FIELD_0259
     * @tc.desc   异首：K 对 J 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040259 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('J', 'K');
      const result: boolean = ContactFieldExtractor.letterDiffers('K', 'J');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040259 end');
    });

    /**
     * @tc.name   testFieldVolume040260
     * @tc.number SUB_Contact_FIELD_0260
     * @tc.desc   同首：K 对 K 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040260 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('K', 'K');
      const result: boolean = ContactFieldExtractor.letterDiffers('K', 'K');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040260 end');
    });

    /**
     * @tc.name   testFieldVolume040261
     * @tc.number SUB_Contact_FIELD_0261
     * @tc.desc   异首：K 对 L 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040261 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('L', 'K');
      const result: boolean = ContactFieldExtractor.letterDiffers('K', 'L');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040261 end');
    });

    /**
     * @tc.name   testFieldVolume040262
     * @tc.number SUB_Contact_FIELD_0262
     * @tc.desc   异首：L 对 K 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040262 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('K', 'L');
      const result: boolean = ContactFieldExtractor.letterDiffers('L', 'K');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040262 end');
    });

    /**
     * @tc.name   testFieldVolume040263
     * @tc.number SUB_Contact_FIELD_0263
     * @tc.desc   同首：L 对 L 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040263 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('L', 'L');
      const result: boolean = ContactFieldExtractor.letterDiffers('L', 'L');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040263 end');
    });

    /**
     * @tc.name   testFieldVolume040264
     * @tc.number SUB_Contact_FIELD_0264
     * @tc.desc   异首：L 对 M 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040264 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('M', 'L');
      const result: boolean = ContactFieldExtractor.letterDiffers('L', 'M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040264 end');
    });

    /**
     * @tc.name   testFieldVolume040265
     * @tc.number SUB_Contact_FIELD_0265
     * @tc.desc   异首：M 对 L 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040265 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('L', 'M');
      const result: boolean = ContactFieldExtractor.letterDiffers('M', 'L');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040265 end');
    });

    /**
     * @tc.name   testFieldVolume040266
     * @tc.number SUB_Contact_FIELD_0266
     * @tc.desc   同首：M 对 M 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040266 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('M', 'M');
      const result: boolean = ContactFieldExtractor.letterDiffers('M', 'M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040266 end');
    });

    /**
     * @tc.name   testFieldVolume040267
     * @tc.number SUB_Contact_FIELD_0267
     * @tc.desc   异首：M 对 N 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040267 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('N', 'M');
      const result: boolean = ContactFieldExtractor.letterDiffers('M', 'N');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040267 end');
    });

    /**
     * @tc.name   testFieldVolume040268
     * @tc.number SUB_Contact_FIELD_0268
     * @tc.desc   异首：N 对 M 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040268 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('M', 'N');
      const result: boolean = ContactFieldExtractor.letterDiffers('N', 'M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040268 end');
    });

    /**
     * @tc.name   testFieldVolume040269
     * @tc.number SUB_Contact_FIELD_0269
     * @tc.desc   同首：N 对 N 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040269 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('N', 'N');
      const result: boolean = ContactFieldExtractor.letterDiffers('N', 'N');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040269 end');
    });

    /**
     * @tc.name   testFieldVolume040270
     * @tc.number SUB_Contact_FIELD_0270
     * @tc.desc   异首：N 对 O 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040270 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('O', 'N');
      const result: boolean = ContactFieldExtractor.letterDiffers('N', 'O');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040270 end');
    });

    /**
     * @tc.name   testFieldVolume040271
     * @tc.number SUB_Contact_FIELD_0271
     * @tc.desc   异首：O 对 N 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040271 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('N', 'O');
      const result: boolean = ContactFieldExtractor.letterDiffers('O', 'N');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040271 end');
    });

    /**
     * @tc.name   testFieldVolume040272
     * @tc.number SUB_Contact_FIELD_0272
     * @tc.desc   同首：O 对 O 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040272 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('O', 'O');
      const result: boolean = ContactFieldExtractor.letterDiffers('O', 'O');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040272 end');
    });

    /**
     * @tc.name   testFieldVolume040273
     * @tc.number SUB_Contact_FIELD_0273
     * @tc.desc   异首：O 对 P 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040273 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('P', 'O');
      const result: boolean = ContactFieldExtractor.letterDiffers('O', 'P');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040273 end');
    });

    /**
     * @tc.name   testFieldVolume040274
     * @tc.number SUB_Contact_FIELD_0274
     * @tc.desc   异首：P 对 O 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040274 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('O', 'P');
      const result: boolean = ContactFieldExtractor.letterDiffers('P', 'O');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040274 end');
    });

    /**
     * @tc.name   testFieldVolume040275
     * @tc.number SUB_Contact_FIELD_0275
     * @tc.desc   同首：P 对 P 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040275 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('P', 'P');
      const result: boolean = ContactFieldExtractor.letterDiffers('P', 'P');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040275 end');
    });

    /**
     * @tc.name   testFieldVolume040276
     * @tc.number SUB_Contact_FIELD_0276
     * @tc.desc   异首：P 对 Q 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040276 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('Q', 'P');
      const result: boolean = ContactFieldExtractor.letterDiffers('P', 'Q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040276 end');
    });

    /**
     * @tc.name   testFieldVolume040277
     * @tc.number SUB_Contact_FIELD_0277
     * @tc.desc   异首：Q 对 P 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040277 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('P', 'Q');
      const result: boolean = ContactFieldExtractor.letterDiffers('Q', 'P');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040277 end');
    });

    /**
     * @tc.name   testFieldVolume040278
     * @tc.number SUB_Contact_FIELD_0278
     * @tc.desc   同首：Q 对 Q 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040278 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('Q', 'Q');
      const result: boolean = ContactFieldExtractor.letterDiffers('Q', 'Q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040278 end');
    });

    /**
     * @tc.name   testFieldVolume040279
     * @tc.number SUB_Contact_FIELD_0279
     * @tc.desc   异首：Q 对 R 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040279 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('R', 'Q');
      const result: boolean = ContactFieldExtractor.letterDiffers('Q', 'R');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040279 end');
    });

    /**
     * @tc.name   testFieldVolume040280
     * @tc.number SUB_Contact_FIELD_0280
     * @tc.desc   异首：R 对 Q 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040280 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('Q', 'R');
      const result: boolean = ContactFieldExtractor.letterDiffers('R', 'Q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040280 end');
    });

    /**
     * @tc.name   testFieldVolume040281
     * @tc.number SUB_Contact_FIELD_0281
     * @tc.desc   同首：R 对 R 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040281 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('R', 'R');
      const result: boolean = ContactFieldExtractor.letterDiffers('R', 'R');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040281 end');
    });

    /**
     * @tc.name   testFieldVolume040282
     * @tc.number SUB_Contact_FIELD_0282
     * @tc.desc   异首：R 对 S 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040282 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('S', 'R');
      const result: boolean = ContactFieldExtractor.letterDiffers('R', 'S');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040282 end');
    });

    /**
     * @tc.name   testFieldVolume040283
     * @tc.number SUB_Contact_FIELD_0283
     * @tc.desc   异首：S 对 R 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040283 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('R', 'S');
      const result: boolean = ContactFieldExtractor.letterDiffers('S', 'R');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040283 end');
    });

    /**
     * @tc.name   testFieldVolume040284
     * @tc.number SUB_Contact_FIELD_0284
     * @tc.desc   同首：S 对 S 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040284 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('S', 'S');
      const result: boolean = ContactFieldExtractor.letterDiffers('S', 'S');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040284 end');
    });

    /**
     * @tc.name   testFieldVolume040285
     * @tc.number SUB_Contact_FIELD_0285
     * @tc.desc   异首：S 对 T 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040285 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('T', 'S');
      const result: boolean = ContactFieldExtractor.letterDiffers('S', 'T');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040285 end');
    });

    /**
     * @tc.name   testFieldVolume040286
     * @tc.number SUB_Contact_FIELD_0286
     * @tc.desc   异首：T 对 S 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040286 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('S', 'T');
      const result: boolean = ContactFieldExtractor.letterDiffers('T', 'S');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040286 end');
    });

    /**
     * @tc.name   testFieldVolume040287
     * @tc.number SUB_Contact_FIELD_0287
     * @tc.desc   同首：T 对 T 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040287 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('T', 'T');
      const result: boolean = ContactFieldExtractor.letterDiffers('T', 'T');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040287 end');
    });

    /**
     * @tc.name   testFieldVolume040288
     * @tc.number SUB_Contact_FIELD_0288
     * @tc.desc   异首：T 对 U 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040288 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('U', 'T');
      const result: boolean = ContactFieldExtractor.letterDiffers('T', 'U');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040288 end');
    });

    /**
     * @tc.name   testFieldVolume040289
     * @tc.number SUB_Contact_FIELD_0289
     * @tc.desc   异首：U 对 T 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040289 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('T', 'U');
      const result: boolean = ContactFieldExtractor.letterDiffers('U', 'T');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040289 end');
    });

    /**
     * @tc.name   testFieldVolume040290
     * @tc.number SUB_Contact_FIELD_0290
     * @tc.desc   同首：U 对 U 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040290 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('U', 'U');
      const result: boolean = ContactFieldExtractor.letterDiffers('U', 'U');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040290 end');
    });

    /**
     * @tc.name   testFieldVolume040291
     * @tc.number SUB_Contact_FIELD_0291
     * @tc.desc   异首：U 对 V 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040291 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('V', 'U');
      const result: boolean = ContactFieldExtractor.letterDiffers('U', 'V');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040291 end');
    });

    /**
     * @tc.name   testFieldVolume040292
     * @tc.number SUB_Contact_FIELD_0292
     * @tc.desc   异首：V 对 U 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040292 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('U', 'V');
      const result: boolean = ContactFieldExtractor.letterDiffers('V', 'U');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040292 end');
    });

    /**
     * @tc.name   testFieldVolume040293
     * @tc.number SUB_Contact_FIELD_0293
     * @tc.desc   同首：V 对 V 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040293 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('V', 'V');
      const result: boolean = ContactFieldExtractor.letterDiffers('V', 'V');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040293 end');
    });

    /**
     * @tc.name   testFieldVolume040294
     * @tc.number SUB_Contact_FIELD_0294
     * @tc.desc   异首：V 对 W 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040294 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('W', 'V');
      const result: boolean = ContactFieldExtractor.letterDiffers('V', 'W');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040294 end');
    });

    /**
     * @tc.name   testFieldVolume040295
     * @tc.number SUB_Contact_FIELD_0295
     * @tc.desc   异首：W 对 V 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040295 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('V', 'W');
      const result: boolean = ContactFieldExtractor.letterDiffers('W', 'V');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040295 end');
    });

    /**
     * @tc.name   testFieldVolume040296
     * @tc.number SUB_Contact_FIELD_0296
     * @tc.desc   同首：W 对 W 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040296 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('W', 'W');
      const result: boolean = ContactFieldExtractor.letterDiffers('W', 'W');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040296 end');
    });

    /**
     * @tc.name   testFieldVolume040297
     * @tc.number SUB_Contact_FIELD_0297
     * @tc.desc   异首：W 对 X 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040297 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('X', 'W');
      const result: boolean = ContactFieldExtractor.letterDiffers('W', 'X');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040297 end');
    });

    /**
     * @tc.name   testFieldVolume040298
     * @tc.number SUB_Contact_FIELD_0298
     * @tc.desc   异首：X 对 W 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040298 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('W', 'X');
      const result: boolean = ContactFieldExtractor.letterDiffers('X', 'W');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040298 end');
    });

    /**
     * @tc.name   testFieldVolume040299
     * @tc.number SUB_Contact_FIELD_0299
     * @tc.desc   同首：X 对 X 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040299 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('X', 'X');
      const result: boolean = ContactFieldExtractor.letterDiffers('X', 'X');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040299 end');
    });

    /**
     * @tc.name   testFieldVolume040300
     * @tc.number SUB_Contact_FIELD_0300
     * @tc.desc   异首：X 对 Y 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040300 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('Y', 'X');
      const result: boolean = ContactFieldExtractor.letterDiffers('X', 'Y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040300 end');
    });

    /**
     * @tc.name   testFieldVolume040301
     * @tc.number SUB_Contact_FIELD_0301
     * @tc.desc   异首：Y 对 X 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040301 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('X', 'Y');
      const result: boolean = ContactFieldExtractor.letterDiffers('Y', 'X');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040301 end');
    });

    /**
     * @tc.name   testFieldVolume040302
     * @tc.number SUB_Contact_FIELD_0302
     * @tc.desc   同首：Y 对 Y 不显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040302 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('Y', 'Y');
      const result: boolean = ContactFieldExtractor.letterDiffers('Y', 'Y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(false));
      expect(reverseResult).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040302 end');
    });

    /**
     * @tc.name   testFieldVolume040303
     * @tc.number SUB_Contact_FIELD_0303
     * @tc.desc   异首：Y 对 Z 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040303 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('Z', 'Y');
      const result: boolean = ContactFieldExtractor.letterDiffers('Y', 'Z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040303 end');
    });

    /**
     * @tc.name   testFieldVolume040304
     * @tc.number SUB_Contact_FIELD_0304
     * @tc.desc   异首：Z 对 Y 显示分组头
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFieldVolume040304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040304 begin');
      const reverseResult: boolean = ContactFieldExtractor.letterDiffers('Y', 'Z');
      const result: boolean = ContactFieldExtractor.letterDiffers('Z', 'Y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(reverseResult), String(true));
      expect(reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(result === reverseResult), String(true));
      expect(result === reverseResult).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFieldVolume040304 end');
    });

  });
}
