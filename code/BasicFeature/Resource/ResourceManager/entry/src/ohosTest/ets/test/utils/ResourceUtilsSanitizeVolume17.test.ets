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
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function resourceUtilsSanitizeB17Test() {
  describe('ResourceUtilsSanitizeB17Test', () => {

    /**
     * @tc.name   testResourceUtilsSanitizeB170001
     * @tc.number SUB_RESMGR_UTILS_17_0001
     * @tc.desc   sanitizeWorld of a 10 char word keeps 6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170001 begin');
      const result: string = ResourceUtils.sanitizeWorld('  apceem  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('apceem'));
      expect(result).assertEqual('apceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170001 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170002
     * @tc.number SUB_RESMGR_UTILS_17_0002
     * @tc.desc   sanitizeWorld of a 7 char word keeps 7 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170002 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('badrfoh'));
      expect(result).assertEqual('badrfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170002 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170003
     * @tc.number SUB_RESMGR_UTILS_17_0003
     * @tc.desc   sanitizeWorld of a 8 char word keeps 8 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170003 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemguip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ceemguip'));
      expect(result).assertEqual('ceemguip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170003 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170004
     * @tc.number SUB_RESMGR_UTILS_17_0004
     * @tc.desc   sanitizeWorld of a 13 char word keeps 9 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170004 begin');
      const result: string = ResourceUtils.sanitizeWorld('  drfohajob  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('drfohajob'));
      expect(result).assertEqual('drfohajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170004 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170005
     * @tc.number SUB_RESMGR_UTILS_17_0005
     * @tc.desc   sanitizeWorld of a 10 char word keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170005 begin');
      const result: string = ResourceUtils.sanitizeWorld('emguipapce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emguipapce'));
      expect(result).assertEqual('emguipapce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170005 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170006
     * @tc.number SUB_RESMGR_UTILS_17_0006
     * @tc.desc   sanitizeWorld of a 11 char word keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170006 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajobadrf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('fohajobadrf'));
      expect(result).assertEqual('fohajobadrf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170006 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170007
     * @tc.number SUB_RESMGR_UTILS_17_0007
     * @tc.desc   sanitizeWorld of a 16 char word keeps 12 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170007 begin');
      const result: string = ResourceUtils.sanitizeWorld('  guipapceemgu  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guipapceemgu'));
      expect(result).assertEqual('guipapceemgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170007 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170008
     * @tc.number SUB_RESMGR_UTILS_17_0008
     * @tc.desc   sanitizeWorld of a 13 char word keeps 13 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170008 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajobadrfohaj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hajobadrfohaj'));
      expect(result).assertEqual('hajobadrfohaj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170008 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170009
     * @tc.number SUB_RESMGR_UTILS_17_0009
     * @tc.desc   sanitizeWorld of a 14 char word keeps 14 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170009 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapceemguipap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ipapceemguipap'));
      expect(result).assertEqual('ipapceemguipap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170009 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170010
     * @tc.number SUB_RESMGR_UTILS_17_0010
     * @tc.desc   sanitizeWorld of a 19 char word keeps 15 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170010 begin');
      const result: string = ResourceUtils.sanitizeWorld('  jobadrfohajobad  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jobadrfohajobad'));
      expect(result).assertEqual('jobadrfohajobad');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170010 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170011
     * @tc.number SUB_RESMGR_UTILS_17_0011
     * @tc.desc   sanitizeWorld of a 16 char word keeps 16 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170011 begin');
      const result: string = ResourceUtils.sanitizeWorld('apceemguipapceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('apceemguipapceem'));
      expect(result).assertEqual('apceemguipapceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170011 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170012
     * @tc.number SUB_RESMGR_UTILS_17_0012
     * @tc.desc   sanitizeWorld of a 17 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170012 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfohajobadrfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('badrfohajobadrfo...'));
      expect(result).assertEqual('badrfohajobadrfo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170012 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170013
     * @tc.number SUB_RESMGR_UTILS_17_0013
     * @tc.desc   sanitizeWorld of a 22 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170013 begin');
      const result: string = ResourceUtils.sanitizeWorld('  ceemguipapceemguip  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ceemguipapceemgu...'));
      expect(result).assertEqual('ceemguipapceemgu...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170013 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170014
     * @tc.number SUB_RESMGR_UTILS_17_0014
     * @tc.desc   sanitizeWorld of a 19 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170014 begin');
      const result: string = ResourceUtils.sanitizeWorld('drfohajobadrfohajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('drfohajobadrfoha...'));
      expect(result).assertEqual('drfohajobadrfoha...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170014 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170015
     * @tc.number SUB_RESMGR_UTILS_17_0015
     * @tc.desc   sanitizeWorld of a 20 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170015 begin');
      const result: string = ResourceUtils.sanitizeWorld('emguipapceemguipapce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('emguipapceemguip...'));
      expect(result).assertEqual('emguipapceemguip...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170015 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170016
     * @tc.number SUB_RESMGR_UTILS_17_0016
     * @tc.desc   sanitizeWorld of a 25 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170016 begin');
      const result: string = ResourceUtils.sanitizeWorld('  fohajobadrfohajobadrf  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('fohajobadrfohajo...'));
      expect(result).assertEqual('fohajobadrfohajo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170016 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170017
     * @tc.number SUB_RESMGR_UTILS_17_0017
     * @tc.desc   sanitizeWorld of a 22 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170017 begin');
      const result: string = ResourceUtils.sanitizeWorld('guipapceemguipapceemgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('guipapceemguipap...'));
      expect(result).assertEqual('guipapceemguipap...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170017 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170018
     * @tc.number SUB_RESMGR_UTILS_17_0018
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170018 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajobadrfohajobadrfohaj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hajobadrfohajoba...'));
      expect(result).assertEqual('hajobadrfohajoba...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170018 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170019
     * @tc.number SUB_RESMGR_UTILS_17_0019
     * @tc.desc   sanitizeWorld of a 28 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170019 begin');
      const result: string = ResourceUtils.sanitizeWorld('  ipapceemguipapceemguipap  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ipapceemguipapce...'));
      expect(result).assertEqual('ipapceemguipapce...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170019 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170020
     * @tc.number SUB_RESMGR_UTILS_17_0020
     * @tc.desc   sanitizeWorld of a 1 char word keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170020 begin');
      const result: string = ResourceUtils.sanitizeWorld('j');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('j'));
      expect(result).assertEqual('j');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170020 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170021
     * @tc.number SUB_RESMGR_UTILS_17_0021
     * @tc.desc   sanitizeWorld of a 2 char word keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170021 begin');
      const result: string = ResourceUtils.sanitizeWorld('ap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ap'));
      expect(result).assertEqual('ap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170021 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170022
     * @tc.number SUB_RESMGR_UTILS_17_0022
     * @tc.desc   sanitizeWorld of a 7 char word keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170022 begin');
      const result: string = ResourceUtils.sanitizeWorld('  bad  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('bad'));
      expect(result).assertEqual('bad');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170022 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170023
     * @tc.number SUB_RESMGR_UTILS_17_0023
     * @tc.desc   sanitizeWorld of a 4 char word keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170023 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ceem'));
      expect(result).assertEqual('ceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170023 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170024
     * @tc.number SUB_RESMGR_UTILS_17_0024
     * @tc.desc   sanitizeWorld of a 5 char word keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170024 begin');
      const result: string = ResourceUtils.sanitizeWorld('drfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('drfoh'));
      expect(result).assertEqual('drfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170024 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170025
     * @tc.number SUB_RESMGR_UTILS_17_0025
     * @tc.desc   sanitizeWorld of a 10 char word keeps 6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170025 begin');
      const result: string = ResourceUtils.sanitizeWorld('  emguip  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emguip'));
      expect(result).assertEqual('emguip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170025 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170026
     * @tc.number SUB_RESMGR_UTILS_17_0026
     * @tc.desc   sanitizeWorld of a 7 char word keeps 7 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170026 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('fohajob'));
      expect(result).assertEqual('fohajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170026 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170027
     * @tc.number SUB_RESMGR_UTILS_17_0027
     * @tc.desc   sanitizeWorld of a 8 char word keeps 8 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170027 begin');
      const result: string = ResourceUtils.sanitizeWorld('guipapce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guipapce'));
      expect(result).assertEqual('guipapce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170027 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170028
     * @tc.number SUB_RESMGR_UTILS_17_0028
     * @tc.desc   sanitizeWorld of a 13 char word keeps 9 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170028 begin');
      const result: string = ResourceUtils.sanitizeWorld('  hajobadrf  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hajobadrf'));
      expect(result).assertEqual('hajobadrf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170028 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170029
     * @tc.number SUB_RESMGR_UTILS_17_0029
     * @tc.desc   sanitizeWorld of a 10 char word keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170029 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapceemgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ipapceemgu'));
      expect(result).assertEqual('ipapceemgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170029 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170030
     * @tc.number SUB_RESMGR_UTILS_17_0030
     * @tc.desc   sanitizeWorld of a 11 char word keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170030 begin');
      const result: string = ResourceUtils.sanitizeWorld('jobadrfohaj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('jobadrfohaj'));
      expect(result).assertEqual('jobadrfohaj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170030 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170031
     * @tc.number SUB_RESMGR_UTILS_17_0031
     * @tc.desc   sanitizeWorld of a 16 char word keeps 12 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170031 begin');
      const result: string = ResourceUtils.sanitizeWorld('  apceemguipap  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('apceemguipap'));
      expect(result).assertEqual('apceemguipap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170031 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170032
     * @tc.number SUB_RESMGR_UTILS_17_0032
     * @tc.desc   sanitizeWorld of a 13 char word keeps 13 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170032 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfohajobad');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('badrfohajobad'));
      expect(result).assertEqual('badrfohajobad');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170032 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170033
     * @tc.number SUB_RESMGR_UTILS_17_0033
     * @tc.desc   sanitizeWorld of a 14 char word keeps 14 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170033 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemguipapceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ceemguipapceem'));
      expect(result).assertEqual('ceemguipapceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170033 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170034
     * @tc.number SUB_RESMGR_UTILS_17_0034
     * @tc.desc   sanitizeWorld of a 19 char word keeps 15 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170034 begin');
      const result: string = ResourceUtils.sanitizeWorld('  drfohajobadrfoh  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('drfohajobadrfoh'));
      expect(result).assertEqual('drfohajobadrfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170034 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170035
     * @tc.number SUB_RESMGR_UTILS_17_0035
     * @tc.desc   sanitizeWorld of a 16 char word keeps 16 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170035 begin');
      const result: string = ResourceUtils.sanitizeWorld('emguipapceemguip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('emguipapceemguip'));
      expect(result).assertEqual('emguipapceemguip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170035 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170036
     * @tc.number SUB_RESMGR_UTILS_17_0036
     * @tc.desc   sanitizeWorld of a 17 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170036 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajobadrfohajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('fohajobadrfohajo...'));
      expect(result).assertEqual('fohajobadrfohajo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170036 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170037
     * @tc.number SUB_RESMGR_UTILS_17_0037
     * @tc.desc   sanitizeWorld of a 22 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170037 begin');
      const result: string = ResourceUtils.sanitizeWorld('  guipapceemguipapce  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('guipapceemguipap...'));
      expect(result).assertEqual('guipapceemguipap...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170037 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170038
     * @tc.number SUB_RESMGR_UTILS_17_0038
     * @tc.desc   sanitizeWorld of a 19 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170038 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajobadrfohajobadrf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hajobadrfohajoba...'));
      expect(result).assertEqual('hajobadrfohajoba...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170038 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170039
     * @tc.number SUB_RESMGR_UTILS_17_0039
     * @tc.desc   sanitizeWorld of a 20 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170039 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapceemguipapceemgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ipapceemguipapce...'));
      expect(result).assertEqual('ipapceemguipapce...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170039 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170040
     * @tc.number SUB_RESMGR_UTILS_17_0040
     * @tc.desc   sanitizeWorld of a 25 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170040 begin');
      const result: string = ResourceUtils.sanitizeWorld('  jobadrfohajobadrfohaj  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jobadrfohajobadr...'));
      expect(result).assertEqual('jobadrfohajobadr...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170040 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170041
     * @tc.number SUB_RESMGR_UTILS_17_0041
     * @tc.desc   sanitizeWorld of a 22 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170041 begin');
      const result: string = ResourceUtils.sanitizeWorld('apceemguipapceemguipap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('apceemguipapceem...'));
      expect(result).assertEqual('apceemguipapceem...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170041 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170042
     * @tc.number SUB_RESMGR_UTILS_17_0042
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170042 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfohajobadrfohajobad');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('badrfohajobadrfo...'));
      expect(result).assertEqual('badrfohajobadrfo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170042 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170043
     * @tc.number SUB_RESMGR_UTILS_17_0043
     * @tc.desc   sanitizeWorld of a 28 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170043 begin');
      const result: string = ResourceUtils.sanitizeWorld('  ceemguipapceemguipapceem  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ceemguipapceemgu...'));
      expect(result).assertEqual('ceemguipapceemgu...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170043 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170044
     * @tc.number SUB_RESMGR_UTILS_17_0044
     * @tc.desc   sanitizeWorld of a 1 char word keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170044 begin');
      const result: string = ResourceUtils.sanitizeWorld('d');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('d'));
      expect(result).assertEqual('d');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170044 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170045
     * @tc.number SUB_RESMGR_UTILS_17_0045
     * @tc.desc   sanitizeWorld of a 2 char word keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170045 begin');
      const result: string = ResourceUtils.sanitizeWorld('em');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('em'));
      expect(result).assertEqual('em');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170045 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170046
     * @tc.number SUB_RESMGR_UTILS_17_0046
     * @tc.desc   sanitizeWorld of a 7 char word keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170046 begin');
      const result: string = ResourceUtils.sanitizeWorld('  foh  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('foh'));
      expect(result).assertEqual('foh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170046 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170047
     * @tc.number SUB_RESMGR_UTILS_17_0047
     * @tc.desc   sanitizeWorld of a 4 char word keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170047 begin');
      const result: string = ResourceUtils.sanitizeWorld('guip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guip'));
      expect(result).assertEqual('guip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170047 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170048
     * @tc.number SUB_RESMGR_UTILS_17_0048
     * @tc.desc   sanitizeWorld of a 5 char word keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170048 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hajob'));
      expect(result).assertEqual('hajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170048 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170049
     * @tc.number SUB_RESMGR_UTILS_17_0049
     * @tc.desc   sanitizeWorld of a 10 char word keeps 6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170049 begin');
      const result: string = ResourceUtils.sanitizeWorld('  ipapce  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ipapce'));
      expect(result).assertEqual('ipapce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170049 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170050
     * @tc.number SUB_RESMGR_UTILS_17_0050
     * @tc.desc   sanitizeWorld of a 7 char word keeps 7 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170050 begin');
      const result: string = ResourceUtils.sanitizeWorld('jobadrf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('jobadrf'));
      expect(result).assertEqual('jobadrf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170050 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170051
     * @tc.number SUB_RESMGR_UTILS_17_0051
     * @tc.desc   sanitizeWorld of a 8 char word keeps 8 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170051 begin');
      const result: string = ResourceUtils.sanitizeWorld('apceemgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('apceemgu'));
      expect(result).assertEqual('apceemgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170051 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170052
     * @tc.number SUB_RESMGR_UTILS_17_0052
     * @tc.desc   sanitizeWorld of a 13 char word keeps 9 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170052 begin');
      const result: string = ResourceUtils.sanitizeWorld('  badrfohaj  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('badrfohaj'));
      expect(result).assertEqual('badrfohaj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170052 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170053
     * @tc.number SUB_RESMGR_UTILS_17_0053
     * @tc.desc   sanitizeWorld of a 10 char word keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170053 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemguipap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ceemguipap'));
      expect(result).assertEqual('ceemguipap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170053 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170054
     * @tc.number SUB_RESMGR_UTILS_17_0054
     * @tc.desc   sanitizeWorld of a 11 char word keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170054 begin');
      const result: string = ResourceUtils.sanitizeWorld('drfohajobad');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('drfohajobad'));
      expect(result).assertEqual('drfohajobad');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170054 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170055
     * @tc.number SUB_RESMGR_UTILS_17_0055
     * @tc.desc   sanitizeWorld of a 16 char word keeps 12 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170055 begin');
      const result: string = ResourceUtils.sanitizeWorld('  emguipapceem  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emguipapceem'));
      expect(result).assertEqual('emguipapceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170055 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170056
     * @tc.number SUB_RESMGR_UTILS_17_0056
     * @tc.desc   sanitizeWorld of a 13 char word keeps 13 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170056 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajobadrfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('fohajobadrfoh'));
      expect(result).assertEqual('fohajobadrfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170056 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170057
     * @tc.number SUB_RESMGR_UTILS_17_0057
     * @tc.desc   sanitizeWorld of a 14 char word keeps 14 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170057 begin');
      const result: string = ResourceUtils.sanitizeWorld('guipapceemguip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('guipapceemguip'));
      expect(result).assertEqual('guipapceemguip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170057 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170058
     * @tc.number SUB_RESMGR_UTILS_17_0058
     * @tc.desc   sanitizeWorld of a 19 char word keeps 15 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170058 begin');
      const result: string = ResourceUtils.sanitizeWorld('  hajobadrfohajob  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hajobadrfohajob'));
      expect(result).assertEqual('hajobadrfohajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170058 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170059
     * @tc.number SUB_RESMGR_UTILS_17_0059
     * @tc.desc   sanitizeWorld of a 16 char word keeps 16 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170059 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapceemguipapce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ipapceemguipapce'));
      expect(result).assertEqual('ipapceemguipapce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170059 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170060
     * @tc.number SUB_RESMGR_UTILS_17_0060
     * @tc.desc   sanitizeWorld of a 17 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170060 begin');
      const result: string = ResourceUtils.sanitizeWorld('jobadrfohajobadrf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jobadrfohajobadr...'));
      expect(result).assertEqual('jobadrfohajobadr...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170060 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170061
     * @tc.number SUB_RESMGR_UTILS_17_0061
     * @tc.desc   sanitizeWorld of a 22 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170061 begin');
      const result: string = ResourceUtils.sanitizeWorld('  apceemguipapceemgu  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('apceemguipapceem...'));
      expect(result).assertEqual('apceemguipapceem...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170061 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170062
     * @tc.number SUB_RESMGR_UTILS_17_0062
     * @tc.desc   sanitizeWorld of a 19 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170062 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfohajobadrfohaj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('badrfohajobadrfo...'));
      expect(result).assertEqual('badrfohajobadrfo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170062 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170063
     * @tc.number SUB_RESMGR_UTILS_17_0063
     * @tc.desc   sanitizeWorld of a 20 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170063 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemguipapceemguipap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ceemguipapceemgu...'));
      expect(result).assertEqual('ceemguipapceemgu...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170063 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170064
     * @tc.number SUB_RESMGR_UTILS_17_0064
     * @tc.desc   sanitizeWorld of a 25 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170064 begin');
      const result: string = ResourceUtils.sanitizeWorld('  drfohajobadrfohajobad  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('drfohajobadrfoha...'));
      expect(result).assertEqual('drfohajobadrfoha...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170064 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170065
     * @tc.number SUB_RESMGR_UTILS_17_0065
     * @tc.desc   sanitizeWorld of a 22 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170065 begin');
      const result: string = ResourceUtils.sanitizeWorld('emguipapceemguipapceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('emguipapceemguip...'));
      expect(result).assertEqual('emguipapceemguip...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170065 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170066
     * @tc.number SUB_RESMGR_UTILS_17_0066
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170066 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajobadrfohajobadrfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('fohajobadrfohajo...'));
      expect(result).assertEqual('fohajobadrfohajo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170066 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170067
     * @tc.number SUB_RESMGR_UTILS_17_0067
     * @tc.desc   sanitizeWorld of a 28 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170067 begin');
      const result: string = ResourceUtils.sanitizeWorld('  guipapceemguipapceemguip  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('guipapceemguipap...'));
      expect(result).assertEqual('guipapceemguipap...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170067 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170068
     * @tc.number SUB_RESMGR_UTILS_17_0068
     * @tc.desc   sanitizeWorld of a 1 char word keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170068 begin');
      const result: string = ResourceUtils.sanitizeWorld('h');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('h'));
      expect(result).assertEqual('h');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170068 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170069
     * @tc.number SUB_RESMGR_UTILS_17_0069
     * @tc.desc   sanitizeWorld of a 2 char word keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170069 begin');
      const result: string = ResourceUtils.sanitizeWorld('ip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ip'));
      expect(result).assertEqual('ip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170069 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170070
     * @tc.number SUB_RESMGR_UTILS_17_0070
     * @tc.desc   sanitizeWorld of a 7 char word keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170070 begin');
      const result: string = ResourceUtils.sanitizeWorld('  job  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('job'));
      expect(result).assertEqual('job');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170070 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170071
     * @tc.number SUB_RESMGR_UTILS_17_0071
     * @tc.desc   sanitizeWorld of a 4 char word keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170071 begin');
      const result: string = ResourceUtils.sanitizeWorld('apce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('apce'));
      expect(result).assertEqual('apce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170071 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170072
     * @tc.number SUB_RESMGR_UTILS_17_0072
     * @tc.desc   sanitizeWorld of a 5 char word keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170072 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('badrf'));
      expect(result).assertEqual('badrf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170072 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170073
     * @tc.number SUB_RESMGR_UTILS_17_0073
     * @tc.desc   sanitizeWorld of a 10 char word keeps 6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170073 begin');
      const result: string = ResourceUtils.sanitizeWorld('  ceemgu  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ceemgu'));
      expect(result).assertEqual('ceemgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170073 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170074
     * @tc.number SUB_RESMGR_UTILS_17_0074
     * @tc.desc   sanitizeWorld of a 7 char word keeps 7 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170074 begin');
      const result: string = ResourceUtils.sanitizeWorld('drfohaj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('drfohaj'));
      expect(result).assertEqual('drfohaj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170074 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170075
     * @tc.number SUB_RESMGR_UTILS_17_0075
     * @tc.desc   sanitizeWorld of a 8 char word keeps 8 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170075 begin');
      const result: string = ResourceUtils.sanitizeWorld('emguipap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emguipap'));
      expect(result).assertEqual('emguipap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170075 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170076
     * @tc.number SUB_RESMGR_UTILS_17_0076
     * @tc.desc   sanitizeWorld of a 13 char word keeps 9 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170076 begin');
      const result: string = ResourceUtils.sanitizeWorld('  fohajobad  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('fohajobad'));
      expect(result).assertEqual('fohajobad');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170076 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170077
     * @tc.number SUB_RESMGR_UTILS_17_0077
     * @tc.desc   sanitizeWorld of a 10 char word keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170077 begin');
      const result: string = ResourceUtils.sanitizeWorld('guipapceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guipapceem'));
      expect(result).assertEqual('guipapceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170077 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170078
     * @tc.number SUB_RESMGR_UTILS_17_0078
     * @tc.desc   sanitizeWorld of a 11 char word keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170078 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajobadrfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hajobadrfoh'));
      expect(result).assertEqual('hajobadrfoh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170078 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170079
     * @tc.number SUB_RESMGR_UTILS_17_0079
     * @tc.desc   sanitizeWorld of a 16 char word keeps 12 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170079 begin');
      const result: string = ResourceUtils.sanitizeWorld('  ipapceemguip  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ipapceemguip'));
      expect(result).assertEqual('ipapceemguip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170079 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170080
     * @tc.number SUB_RESMGR_UTILS_17_0080
     * @tc.desc   sanitizeWorld of a 13 char word keeps 13 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170080 begin');
      const result: string = ResourceUtils.sanitizeWorld('jobadrfohajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('jobadrfohajob'));
      expect(result).assertEqual('jobadrfohajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170080 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170081
     * @tc.number SUB_RESMGR_UTILS_17_0081
     * @tc.desc   sanitizeWorld of a 14 char word keeps 14 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170081 begin');
      const result: string = ResourceUtils.sanitizeWorld('apceemguipapce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('apceemguipapce'));
      expect(result).assertEqual('apceemguipapce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170081 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170082
     * @tc.number SUB_RESMGR_UTILS_17_0082
     * @tc.desc   sanitizeWorld of a 19 char word keeps 15 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170082 begin');
      const result: string = ResourceUtils.sanitizeWorld('  badrfohajobadrf  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('badrfohajobadrf'));
      expect(result).assertEqual('badrfohajobadrf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170082 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170083
     * @tc.number SUB_RESMGR_UTILS_17_0083
     * @tc.desc   sanitizeWorld of a 16 char word keeps 16 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170083 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemguipapceemgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ceemguipapceemgu'));
      expect(result).assertEqual('ceemguipapceemgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170083 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170084
     * @tc.number SUB_RESMGR_UTILS_17_0084
     * @tc.desc   sanitizeWorld of a 17 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170084 begin');
      const result: string = ResourceUtils.sanitizeWorld('drfohajobadrfohaj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('drfohajobadrfoha...'));
      expect(result).assertEqual('drfohajobadrfoha...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170084 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170085
     * @tc.number SUB_RESMGR_UTILS_17_0085
     * @tc.desc   sanitizeWorld of a 22 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170085 begin');
      const result: string = ResourceUtils.sanitizeWorld('  emguipapceemguipap  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('emguipapceemguip...'));
      expect(result).assertEqual('emguipapceemguip...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170085 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170086
     * @tc.number SUB_RESMGR_UTILS_17_0086
     * @tc.desc   sanitizeWorld of a 19 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170086 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajobadrfohajobad');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('fohajobadrfohajo...'));
      expect(result).assertEqual('fohajobadrfohajo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170086 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170087
     * @tc.number SUB_RESMGR_UTILS_17_0087
     * @tc.desc   sanitizeWorld of a 20 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170087 begin');
      const result: string = ResourceUtils.sanitizeWorld('guipapceemguipapceem');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('guipapceemguipap...'));
      expect(result).assertEqual('guipapceemguipap...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170087 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170088
     * @tc.number SUB_RESMGR_UTILS_17_0088
     * @tc.desc   sanitizeWorld of a 25 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170088 begin');
      const result: string = ResourceUtils.sanitizeWorld('  hajobadrfohajobadrfoh  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hajobadrfohajoba...'));
      expect(result).assertEqual('hajobadrfohajoba...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170088 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170089
     * @tc.number SUB_RESMGR_UTILS_17_0089
     * @tc.desc   sanitizeWorld of a 22 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170089 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapceemguipapceemguip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ipapceemguipapce...'));
      expect(result).assertEqual('ipapceemguipapce...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170089 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170090
     * @tc.number SUB_RESMGR_UTILS_17_0090
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170090 begin');
      const result: string = ResourceUtils.sanitizeWorld('jobadrfohajobadrfohajob');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jobadrfohajobadr...'));
      expect(result).assertEqual('jobadrfohajobadr...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170090 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170091
     * @tc.number SUB_RESMGR_UTILS_17_0091
     * @tc.desc   sanitizeWorld of a 28 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170091 begin');
      const result: string = ResourceUtils.sanitizeWorld('  apceemguipapceemguipapce  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('apceemguipapceem...'));
      expect(result).assertEqual('apceemguipapceem...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170091 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170092
     * @tc.number SUB_RESMGR_UTILS_17_0092
     * @tc.desc   sanitizeWorld of a 1 char word keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170092 begin');
      const result: string = ResourceUtils.sanitizeWorld('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('b'));
      expect(result).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170092 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170093
     * @tc.number SUB_RESMGR_UTILS_17_0093
     * @tc.desc   sanitizeWorld of a 2 char word keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170093 begin');
      const result: string = ResourceUtils.sanitizeWorld('ce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ce'));
      expect(result).assertEqual('ce');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170093 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170094
     * @tc.number SUB_RESMGR_UTILS_17_0094
     * @tc.desc   sanitizeWorld of a 7 char word keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170094 begin');
      const result: string = ResourceUtils.sanitizeWorld('  drf  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('drf'));
      expect(result).assertEqual('drf');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170094 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB170095
     * @tc.number SUB_RESMGR_UTILS_17_0095
     * @tc.desc   sanitizeWorld of a 4 char word keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB170095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170095 begin');
      const result: string = ResourceUtils.sanitizeWorld('emgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emgu'));
      expect(result).assertEqual('emgu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB170095 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB1796
     * @tc.number SUB_RESMGR_UTILS_17_0096
     * @tc.desc   数字与空格混合的占位词
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB1796', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB1796 begin');
      expect(ResourceUtils.sanitizeWorld('12 34')).assertEqual('12 34');
      expect(ResourceUtils.sanitizeWorld('0123456789abcdefg')).assertEqual('0123456789abcdef...');
      expect(ResourceUtils.sanitizeWorld('0123456789abcdefg').length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB1796 end');
    })
  })
}
