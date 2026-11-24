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

export default function resourceUtilsSanitizeB16Test() {
  describe('ResourceUtilsSanitizeB16Test', () => {

    /**
     * @tc.name   testResourceUtilsSanitizeB160001
     * @tc.number SUB_RESMGR_UTILS_16_0001
     * @tc.desc   sanitizeWorld of a 5 char word keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160001 begin');
      const result: string = ResourceUtils.sanitizeWorld('  a  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(result).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160001 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160002
     * @tc.number SUB_RESMGR_UTILS_16_0002
     * @tc.desc   sanitizeWorld of a 2 char word keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160002 begin');
      const result: string = ResourceUtils.sanitizeWorld('ba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ba'));
      expect(result).assertEqual('ba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160002 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160003
     * @tc.number SUB_RESMGR_UTILS_16_0003
     * @tc.desc   sanitizeWorld of a 3 char word keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160003 begin');
      const result: string = ResourceUtils.sanitizeWorld('cee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cee'));
      expect(result).assertEqual('cee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160003 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160004
     * @tc.number SUB_RESMGR_UTILS_16_0004
     * @tc.desc   sanitizeWorld of a 8 char word keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160004 begin');
      const result: string = ResourceUtils.sanitizeWorld('  drfo  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('drfo'));
      expect(result).assertEqual('drfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160004 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160005
     * @tc.number SUB_RESMGR_UTILS_16_0005
     * @tc.desc   sanitizeWorld of a 5 char word keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160005 begin');
      const result: string = ResourceUtils.sanitizeWorld('emgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emgui'));
      expect(result).assertEqual('emgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160005 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160006
     * @tc.number SUB_RESMGR_UTILS_16_0006
     * @tc.desc   sanitizeWorld of a 6 char word keeps 6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160006 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('fohajo'));
      expect(result).assertEqual('fohajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160006 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160007
     * @tc.number SUB_RESMGR_UTILS_16_0007
     * @tc.desc   sanitizeWorld of a 11 char word keeps 7 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160007 begin');
      const result: string = ResourceUtils.sanitizeWorld('  guipapc  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guipapc'));
      expect(result).assertEqual('guipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160007 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160008
     * @tc.number SUB_RESMGR_UTILS_16_0008
     * @tc.desc   sanitizeWorld of a 8 char word keeps 8 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160008 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hajobadr'));
      expect(result).assertEqual('hajobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160008 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160009
     * @tc.number SUB_RESMGR_UTILS_16_0009
     * @tc.desc   sanitizeWorld of a 9 char word keeps 9 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160009 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapceemg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ipapceemg'));
      expect(result).assertEqual('ipapceemg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160009 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160010
     * @tc.number SUB_RESMGR_UTILS_16_0010
     * @tc.desc   sanitizeWorld of a 14 char word keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160010 begin');
      const result: string = ResourceUtils.sanitizeWorld('  jobadrfoha  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('jobadrfoha'));
      expect(result).assertEqual('jobadrfoha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160010 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160011
     * @tc.number SUB_RESMGR_UTILS_16_0011
     * @tc.desc   sanitizeWorld of a 11 char word keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160011 begin');
      const result: string = ResourceUtils.sanitizeWorld('apceemguipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('apceemguipa'));
      expect(result).assertEqual('apceemguipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160011 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160012
     * @tc.number SUB_RESMGR_UTILS_16_0012
     * @tc.desc   sanitizeWorld of a 12 char word keeps 12 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160012 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfohajoba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('badrfohajoba'));
      expect(result).assertEqual('badrfohajoba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160012 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160013
     * @tc.number SUB_RESMGR_UTILS_16_0013
     * @tc.desc   sanitizeWorld of a 17 char word keeps 13 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160013 begin');
      const result: string = ResourceUtils.sanitizeWorld('  ceemguipapcee  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ceemguipapcee'));
      expect(result).assertEqual('ceemguipapcee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160013 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160014
     * @tc.number SUB_RESMGR_UTILS_16_0014
     * @tc.desc   sanitizeWorld of a 14 char word keeps 14 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160014 begin');
      const result: string = ResourceUtils.sanitizeWorld('drfohajobadrfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('drfohajobadrfo'));
      expect(result).assertEqual('drfohajobadrfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160014 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160015
     * @tc.number SUB_RESMGR_UTILS_16_0015
     * @tc.desc   sanitizeWorld of a 15 char word keeps 15 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160015 begin');
      const result: string = ResourceUtils.sanitizeWorld('emguipapceemgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('emguipapceemgui'));
      expect(result).assertEqual('emguipapceemgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160015 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160016
     * @tc.number SUB_RESMGR_UTILS_16_0016
     * @tc.desc   sanitizeWorld of a 20 char word keeps 16 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160016 begin');
      const result: string = ResourceUtils.sanitizeWorld('  fohajobadrfohajo  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('fohajobadrfohajo'));
      expect(result).assertEqual('fohajobadrfohajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160016 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160017
     * @tc.number SUB_RESMGR_UTILS_16_0017
     * @tc.desc   sanitizeWorld of a 17 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160017 begin');
      const result: string = ResourceUtils.sanitizeWorld('guipapceemguipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('guipapceemguipap...'));
      expect(result).assertEqual('guipapceemguipap...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160017 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160018
     * @tc.number SUB_RESMGR_UTILS_16_0018
     * @tc.desc   sanitizeWorld of a 18 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160018 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajobadrfohajobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hajobadrfohajoba...'));
      expect(result).assertEqual('hajobadrfohajoba...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160018 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160019
     * @tc.number SUB_RESMGR_UTILS_16_0019
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160019 begin');
      const result: string = ResourceUtils.sanitizeWorld('  ipapceemguipapceemg  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ipapceemguipapce...'));
      expect(result).assertEqual('ipapceemguipapce...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160019 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160020
     * @tc.number SUB_RESMGR_UTILS_16_0020
     * @tc.desc   sanitizeWorld of a 20 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160020 begin');
      const result: string = ResourceUtils.sanitizeWorld('jobadrfohajobadrfoha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jobadrfohajobadr...'));
      expect(result).assertEqual('jobadrfohajobadr...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160020 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160021
     * @tc.number SUB_RESMGR_UTILS_16_0021
     * @tc.desc   sanitizeWorld of a 21 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160021 begin');
      const result: string = ResourceUtils.sanitizeWorld('apceemguipapceemguipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('apceemguipapceem...'));
      expect(result).assertEqual('apceemguipapceem...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160021 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160022
     * @tc.number SUB_RESMGR_UTILS_16_0022
     * @tc.desc   sanitizeWorld of a 26 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160022 begin');
      const result: string = ResourceUtils.sanitizeWorld('  badrfohajobadrfohajoba  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('badrfohajobadrfo...'));
      expect(result).assertEqual('badrfohajobadrfo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160022 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160023
     * @tc.number SUB_RESMGR_UTILS_16_0023
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160023 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemguipapceemguipapcee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ceemguipapceemgu...'));
      expect(result).assertEqual('ceemguipapceemgu...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160023 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160024
     * @tc.number SUB_RESMGR_UTILS_16_0024
     * @tc.desc   sanitizeWorld of a 24 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160024 begin');
      const result: string = ResourceUtils.sanitizeWorld('drfohajobadrfohajobadrfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('drfohajobadrfoha...'));
      expect(result).assertEqual('drfohajobadrfoha...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160024 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160025
     * @tc.number SUB_RESMGR_UTILS_16_0025
     * @tc.desc   sanitizeWorld of a 5 char word keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160025 begin');
      const result: string = ResourceUtils.sanitizeWorld('  e  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('e'));
      expect(result).assertEqual('e');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160025 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160026
     * @tc.number SUB_RESMGR_UTILS_16_0026
     * @tc.desc   sanitizeWorld of a 2 char word keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160026 begin');
      const result: string = ResourceUtils.sanitizeWorld('fo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('fo'));
      expect(result).assertEqual('fo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160026 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160027
     * @tc.number SUB_RESMGR_UTILS_16_0027
     * @tc.desc   sanitizeWorld of a 3 char word keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160027 begin');
      const result: string = ResourceUtils.sanitizeWorld('gui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gui'));
      expect(result).assertEqual('gui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160027 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160028
     * @tc.number SUB_RESMGR_UTILS_16_0028
     * @tc.desc   sanitizeWorld of a 8 char word keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160028 begin');
      const result: string = ResourceUtils.sanitizeWorld('  hajo  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hajo'));
      expect(result).assertEqual('hajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160028 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160029
     * @tc.number SUB_RESMGR_UTILS_16_0029
     * @tc.desc   sanitizeWorld of a 5 char word keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160029 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ipapc'));
      expect(result).assertEqual('ipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160029 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160030
     * @tc.number SUB_RESMGR_UTILS_16_0030
     * @tc.desc   sanitizeWorld of a 6 char word keeps 6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160030 begin');
      const result: string = ResourceUtils.sanitizeWorld('jobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('jobadr'));
      expect(result).assertEqual('jobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160030 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160031
     * @tc.number SUB_RESMGR_UTILS_16_0031
     * @tc.desc   sanitizeWorld of a 11 char word keeps 7 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160031 begin');
      const result: string = ResourceUtils.sanitizeWorld('  apceemg  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('apceemg'));
      expect(result).assertEqual('apceemg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160031 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160032
     * @tc.number SUB_RESMGR_UTILS_16_0032
     * @tc.desc   sanitizeWorld of a 8 char word keeps 8 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160032 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfoha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('badrfoha'));
      expect(result).assertEqual('badrfoha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160032 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160033
     * @tc.number SUB_RESMGR_UTILS_16_0033
     * @tc.desc   sanitizeWorld of a 9 char word keeps 9 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160033 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemguipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ceemguipa'));
      expect(result).assertEqual('ceemguipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160033 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160034
     * @tc.number SUB_RESMGR_UTILS_16_0034
     * @tc.desc   sanitizeWorld of a 14 char word keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160034 begin');
      const result: string = ResourceUtils.sanitizeWorld('  drfohajoba  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('drfohajoba'));
      expect(result).assertEqual('drfohajoba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160034 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160035
     * @tc.number SUB_RESMGR_UTILS_16_0035
     * @tc.desc   sanitizeWorld of a 11 char word keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160035 begin');
      const result: string = ResourceUtils.sanitizeWorld('emguipapcee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emguipapcee'));
      expect(result).assertEqual('emguipapcee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160035 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160036
     * @tc.number SUB_RESMGR_UTILS_16_0036
     * @tc.desc   sanitizeWorld of a 12 char word keeps 12 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160036 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajobadrfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('fohajobadrfo'));
      expect(result).assertEqual('fohajobadrfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160036 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160037
     * @tc.number SUB_RESMGR_UTILS_16_0037
     * @tc.desc   sanitizeWorld of a 17 char word keeps 13 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160037 begin');
      const result: string = ResourceUtils.sanitizeWorld('  guipapceemgui  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guipapceemgui'));
      expect(result).assertEqual('guipapceemgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160037 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160038
     * @tc.number SUB_RESMGR_UTILS_16_0038
     * @tc.desc   sanitizeWorld of a 14 char word keeps 14 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160038 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajobadrfohajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hajobadrfohajo'));
      expect(result).assertEqual('hajobadrfohajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160038 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160039
     * @tc.number SUB_RESMGR_UTILS_16_0039
     * @tc.desc   sanitizeWorld of a 15 char word keeps 15 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160039 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapceemguipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ipapceemguipapc'));
      expect(result).assertEqual('ipapceemguipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160039 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160040
     * @tc.number SUB_RESMGR_UTILS_16_0040
     * @tc.desc   sanitizeWorld of a 20 char word keeps 16 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160040 begin');
      const result: string = ResourceUtils.sanitizeWorld('  jobadrfohajobadr  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jobadrfohajobadr'));
      expect(result).assertEqual('jobadrfohajobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160040 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160041
     * @tc.number SUB_RESMGR_UTILS_16_0041
     * @tc.desc   sanitizeWorld of a 17 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160041 begin');
      const result: string = ResourceUtils.sanitizeWorld('apceemguipapceemg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('apceemguipapceem...'));
      expect(result).assertEqual('apceemguipapceem...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160041 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160042
     * @tc.number SUB_RESMGR_UTILS_16_0042
     * @tc.desc   sanitizeWorld of a 18 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160042 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfohajobadrfoha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('badrfohajobadrfo...'));
      expect(result).assertEqual('badrfohajobadrfo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160042 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160043
     * @tc.number SUB_RESMGR_UTILS_16_0043
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160043 begin');
      const result: string = ResourceUtils.sanitizeWorld('  ceemguipapceemguipa  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ceemguipapceemgu...'));
      expect(result).assertEqual('ceemguipapceemgu...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160043 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160044
     * @tc.number SUB_RESMGR_UTILS_16_0044
     * @tc.desc   sanitizeWorld of a 20 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160044 begin');
      const result: string = ResourceUtils.sanitizeWorld('drfohajobadrfohajoba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('drfohajobadrfoha...'));
      expect(result).assertEqual('drfohajobadrfoha...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160044 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160045
     * @tc.number SUB_RESMGR_UTILS_16_0045
     * @tc.desc   sanitizeWorld of a 21 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160045 begin');
      const result: string = ResourceUtils.sanitizeWorld('emguipapceemguipapcee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('emguipapceemguip...'));
      expect(result).assertEqual('emguipapceemguip...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160045 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160046
     * @tc.number SUB_RESMGR_UTILS_16_0046
     * @tc.desc   sanitizeWorld of a 26 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160046 begin');
      const result: string = ResourceUtils.sanitizeWorld('  fohajobadrfohajobadrfo  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('fohajobadrfohajo...'));
      expect(result).assertEqual('fohajobadrfohajo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160046 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160047
     * @tc.number SUB_RESMGR_UTILS_16_0047
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160047 begin');
      const result: string = ResourceUtils.sanitizeWorld('guipapceemguipapceemgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('guipapceemguipap...'));
      expect(result).assertEqual('guipapceemguipap...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160047 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160048
     * @tc.number SUB_RESMGR_UTILS_16_0048
     * @tc.desc   sanitizeWorld of a 24 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160048 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajobadrfohajobadrfohajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hajobadrfohajoba...'));
      expect(result).assertEqual('hajobadrfohajoba...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160048 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160049
     * @tc.number SUB_RESMGR_UTILS_16_0049
     * @tc.desc   sanitizeWorld of a 5 char word keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160049 begin');
      const result: string = ResourceUtils.sanitizeWorld('  i  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('i'));
      expect(result).assertEqual('i');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160049 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160050
     * @tc.number SUB_RESMGR_UTILS_16_0050
     * @tc.desc   sanitizeWorld of a 2 char word keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160050 begin');
      const result: string = ResourceUtils.sanitizeWorld('jo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('jo'));
      expect(result).assertEqual('jo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160050 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160051
     * @tc.number SUB_RESMGR_UTILS_16_0051
     * @tc.desc   sanitizeWorld of a 3 char word keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160051 begin');
      const result: string = ResourceUtils.sanitizeWorld('apc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('apc'));
      expect(result).assertEqual('apc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160051 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160052
     * @tc.number SUB_RESMGR_UTILS_16_0052
     * @tc.desc   sanitizeWorld of a 8 char word keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160052 begin');
      const result: string = ResourceUtils.sanitizeWorld('  badr  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('badr'));
      expect(result).assertEqual('badr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160052 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160053
     * @tc.number SUB_RESMGR_UTILS_16_0053
     * @tc.desc   sanitizeWorld of a 5 char word keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160053 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ceemg'));
      expect(result).assertEqual('ceemg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160053 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160054
     * @tc.number SUB_RESMGR_UTILS_16_0054
     * @tc.desc   sanitizeWorld of a 6 char word keeps 6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160054 begin');
      const result: string = ResourceUtils.sanitizeWorld('drfoha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('drfoha'));
      expect(result).assertEqual('drfoha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160054 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160055
     * @tc.number SUB_RESMGR_UTILS_16_0055
     * @tc.desc   sanitizeWorld of a 11 char word keeps 7 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160055 begin');
      const result: string = ResourceUtils.sanitizeWorld('  emguipa  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emguipa'));
      expect(result).assertEqual('emguipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160055 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160056
     * @tc.number SUB_RESMGR_UTILS_16_0056
     * @tc.desc   sanitizeWorld of a 8 char word keeps 8 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160056 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajoba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('fohajoba'));
      expect(result).assertEqual('fohajoba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160056 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160057
     * @tc.number SUB_RESMGR_UTILS_16_0057
     * @tc.desc   sanitizeWorld of a 9 char word keeps 9 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160057 begin');
      const result: string = ResourceUtils.sanitizeWorld('guipapcee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guipapcee'));
      expect(result).assertEqual('guipapcee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160057 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160058
     * @tc.number SUB_RESMGR_UTILS_16_0058
     * @tc.desc   sanitizeWorld of a 14 char word keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160058 begin');
      const result: string = ResourceUtils.sanitizeWorld('  hajobadrfo  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hajobadrfo'));
      expect(result).assertEqual('hajobadrfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160058 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160059
     * @tc.number SUB_RESMGR_UTILS_16_0059
     * @tc.desc   sanitizeWorld of a 11 char word keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160059 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapceemgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ipapceemgui'));
      expect(result).assertEqual('ipapceemgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160059 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160060
     * @tc.number SUB_RESMGR_UTILS_16_0060
     * @tc.desc   sanitizeWorld of a 12 char word keeps 12 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160060 begin');
      const result: string = ResourceUtils.sanitizeWorld('jobadrfohajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('jobadrfohajo'));
      expect(result).assertEqual('jobadrfohajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160060 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160061
     * @tc.number SUB_RESMGR_UTILS_16_0061
     * @tc.desc   sanitizeWorld of a 17 char word keeps 13 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160061 begin');
      const result: string = ResourceUtils.sanitizeWorld('  apceemguipapc  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('apceemguipapc'));
      expect(result).assertEqual('apceemguipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160061 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160062
     * @tc.number SUB_RESMGR_UTILS_16_0062
     * @tc.desc   sanitizeWorld of a 14 char word keeps 14 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160062 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfohajobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('badrfohajobadr'));
      expect(result).assertEqual('badrfohajobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160062 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160063
     * @tc.number SUB_RESMGR_UTILS_16_0063
     * @tc.desc   sanitizeWorld of a 15 char word keeps 15 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160063 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemguipapceemg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ceemguipapceemg'));
      expect(result).assertEqual('ceemguipapceemg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160063 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160064
     * @tc.number SUB_RESMGR_UTILS_16_0064
     * @tc.desc   sanitizeWorld of a 20 char word keeps 16 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160064 begin');
      const result: string = ResourceUtils.sanitizeWorld('  drfohajobadrfoha  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('drfohajobadrfoha'));
      expect(result).assertEqual('drfohajobadrfoha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160064 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160065
     * @tc.number SUB_RESMGR_UTILS_16_0065
     * @tc.desc   sanitizeWorld of a 17 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160065 begin');
      const result: string = ResourceUtils.sanitizeWorld('emguipapceemguipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('emguipapceemguip...'));
      expect(result).assertEqual('emguipapceemguip...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160065 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160066
     * @tc.number SUB_RESMGR_UTILS_16_0066
     * @tc.desc   sanitizeWorld of a 18 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160066 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajobadrfohajoba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('fohajobadrfohajo...'));
      expect(result).assertEqual('fohajobadrfohajo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160066 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160067
     * @tc.number SUB_RESMGR_UTILS_16_0067
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160067 begin');
      const result: string = ResourceUtils.sanitizeWorld('  guipapceemguipapcee  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('guipapceemguipap...'));
      expect(result).assertEqual('guipapceemguipap...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160067 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160068
     * @tc.number SUB_RESMGR_UTILS_16_0068
     * @tc.desc   sanitizeWorld of a 20 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160068 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajobadrfohajobadrfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hajobadrfohajoba...'));
      expect(result).assertEqual('hajobadrfohajoba...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160068 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160069
     * @tc.number SUB_RESMGR_UTILS_16_0069
     * @tc.desc   sanitizeWorld of a 21 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160069 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapceemguipapceemgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ipapceemguipapce...'));
      expect(result).assertEqual('ipapceemguipapce...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160069 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160070
     * @tc.number SUB_RESMGR_UTILS_16_0070
     * @tc.desc   sanitizeWorld of a 26 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160070 begin');
      const result: string = ResourceUtils.sanitizeWorld('  jobadrfohajobadrfohajo  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jobadrfohajobadr...'));
      expect(result).assertEqual('jobadrfohajobadr...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160070 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160071
     * @tc.number SUB_RESMGR_UTILS_16_0071
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160071 begin');
      const result: string = ResourceUtils.sanitizeWorld('apceemguipapceemguipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('apceemguipapceem...'));
      expect(result).assertEqual('apceemguipapceem...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160071 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160072
     * @tc.number SUB_RESMGR_UTILS_16_0072
     * @tc.desc   sanitizeWorld of a 24 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160072 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfohajobadrfohajobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('badrfohajobadrfo...'));
      expect(result).assertEqual('badrfohajobadrfo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160072 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160073
     * @tc.number SUB_RESMGR_UTILS_16_0073
     * @tc.desc   sanitizeWorld of a 5 char word keeps 1 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160073 begin');
      const result: string = ResourceUtils.sanitizeWorld('  c  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('c'));
      expect(result).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160073 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160074
     * @tc.number SUB_RESMGR_UTILS_16_0074
     * @tc.desc   sanitizeWorld of a 2 char word keeps 2 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160074 begin');
      const result: string = ResourceUtils.sanitizeWorld('dr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('dr'));
      expect(result).assertEqual('dr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160074 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160075
     * @tc.number SUB_RESMGR_UTILS_16_0075
     * @tc.desc   sanitizeWorld of a 3 char word keeps 3 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160075 begin');
      const result: string = ResourceUtils.sanitizeWorld('emg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emg'));
      expect(result).assertEqual('emg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160075 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160076
     * @tc.number SUB_RESMGR_UTILS_16_0076
     * @tc.desc   sanitizeWorld of a 8 char word keeps 4 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160076 begin');
      const result: string = ResourceUtils.sanitizeWorld('  foha  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('foha'));
      expect(result).assertEqual('foha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160076 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160077
     * @tc.number SUB_RESMGR_UTILS_16_0077
     * @tc.desc   sanitizeWorld of a 5 char word keeps 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160077 begin');
      const result: string = ResourceUtils.sanitizeWorld('guipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('guipa'));
      expect(result).assertEqual('guipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160077 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160078
     * @tc.number SUB_RESMGR_UTILS_16_0078
     * @tc.desc   sanitizeWorld of a 6 char word keeps 6 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160078 begin');
      const result: string = ResourceUtils.sanitizeWorld('hajoba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hajoba'));
      expect(result).assertEqual('hajoba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160078 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160079
     * @tc.number SUB_RESMGR_UTILS_16_0079
     * @tc.desc   sanitizeWorld of a 11 char word keeps 7 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160079 begin');
      const result: string = ResourceUtils.sanitizeWorld('  ipapcee  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ipapcee'));
      expect(result).assertEqual('ipapcee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160079 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160080
     * @tc.number SUB_RESMGR_UTILS_16_0080
     * @tc.desc   sanitizeWorld of a 8 char word keeps 8 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160080 begin');
      const result: string = ResourceUtils.sanitizeWorld('jobadrfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('jobadrfo'));
      expect(result).assertEqual('jobadrfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160080 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160081
     * @tc.number SUB_RESMGR_UTILS_16_0081
     * @tc.desc   sanitizeWorld of a 9 char word keeps 9 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160081 begin');
      const result: string = ResourceUtils.sanitizeWorld('apceemgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('apceemgui'));
      expect(result).assertEqual('apceemgui');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160081 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160082
     * @tc.number SUB_RESMGR_UTILS_16_0082
     * @tc.desc   sanitizeWorld of a 14 char word keeps 10 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160082 begin');
      const result: string = ResourceUtils.sanitizeWorld('  badrfohajo  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('badrfohajo'));
      expect(result).assertEqual('badrfohajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160082 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160083
     * @tc.number SUB_RESMGR_UTILS_16_0083
     * @tc.desc   sanitizeWorld of a 11 char word keeps 11 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160083 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemguipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ceemguipapc'));
      expect(result).assertEqual('ceemguipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160083 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160084
     * @tc.number SUB_RESMGR_UTILS_16_0084
     * @tc.desc   sanitizeWorld of a 12 char word keeps 12 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160084 begin');
      const result: string = ResourceUtils.sanitizeWorld('drfohajobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('drfohajobadr'));
      expect(result).assertEqual('drfohajobadr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160084 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160085
     * @tc.number SUB_RESMGR_UTILS_16_0085
     * @tc.desc   sanitizeWorld of a 17 char word keeps 13 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160085 begin');
      const result: string = ResourceUtils.sanitizeWorld('  emguipapceemg  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('emguipapceemg'));
      expect(result).assertEqual('emguipapceemg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160085 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160086
     * @tc.number SUB_RESMGR_UTILS_16_0086
     * @tc.desc   sanitizeWorld of a 14 char word keeps 14 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160086 begin');
      const result: string = ResourceUtils.sanitizeWorld('fohajobadrfoha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('fohajobadrfoha'));
      expect(result).assertEqual('fohajobadrfoha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160086 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160087
     * @tc.number SUB_RESMGR_UTILS_16_0087
     * @tc.desc   sanitizeWorld of a 15 char word keeps 15 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160087 begin');
      const result: string = ResourceUtils.sanitizeWorld('guipapceemguipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('guipapceemguipa'));
      expect(result).assertEqual('guipapceemguipa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160087 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160088
     * @tc.number SUB_RESMGR_UTILS_16_0088
     * @tc.desc   sanitizeWorld of a 20 char word keeps 16 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160088 begin');
      const result: string = ResourceUtils.sanitizeWorld('  hajobadrfohajoba  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hajobadrfohajoba'));
      expect(result).assertEqual('hajobadrfohajoba');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160088 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160089
     * @tc.number SUB_RESMGR_UTILS_16_0089
     * @tc.desc   sanitizeWorld of a 17 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160089 begin');
      const result: string = ResourceUtils.sanitizeWorld('ipapceemguipapcee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ipapceemguipapce...'));
      expect(result).assertEqual('ipapceemguipapce...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160089 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160090
     * @tc.number SUB_RESMGR_UTILS_16_0090
     * @tc.desc   sanitizeWorld of a 18 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160090 begin');
      const result: string = ResourceUtils.sanitizeWorld('jobadrfohajobadrfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jobadrfohajobadr...'));
      expect(result).assertEqual('jobadrfohajobadr...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160090 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160091
     * @tc.number SUB_RESMGR_UTILS_16_0091
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160091 begin');
      const result: string = ResourceUtils.sanitizeWorld('  apceemguipapceemgui  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('apceemguipapceem...'));
      expect(result).assertEqual('apceemguipapceem...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160091 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160092
     * @tc.number SUB_RESMGR_UTILS_16_0092
     * @tc.desc   sanitizeWorld of a 20 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160092 begin');
      const result: string = ResourceUtils.sanitizeWorld('badrfohajobadrfohajo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('badrfohajobadrfo...'));
      expect(result).assertEqual('badrfohajobadrfo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160092 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160093
     * @tc.number SUB_RESMGR_UTILS_16_0093
     * @tc.desc   sanitizeWorld of a 21 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160093 begin');
      const result: string = ResourceUtils.sanitizeWorld('ceemguipapceemguipapc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ceemguipapceemgu...'));
      expect(result).assertEqual('ceemguipapceemgu...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160093 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160094
     * @tc.number SUB_RESMGR_UTILS_16_0094
     * @tc.desc   sanitizeWorld of a 26 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160094 begin');
      const result: string = ResourceUtils.sanitizeWorld('  drfohajobadrfohajobadr  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('drfohajobadrfoha...'));
      expect(result).assertEqual('drfohajobadrfoha...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160094 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB160095
     * @tc.number SUB_RESMGR_UTILS_16_0095
     * @tc.desc   sanitizeWorld of a 23 char word keeps 19 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB160095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160095 begin');
      const result: string = ResourceUtils.sanitizeWorld('emguipapceemguipapceemg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('emguipapceemguip...'));
      expect(result).assertEqual('emguipapceemguip...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length >= 1 && result.length <= 19));
      expect(result.length >= 1 && result.length <= 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result.trim()));
      expect(result === result.trim()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB160095 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeB1696
     * @tc.number SUB_RESMGR_UTILS_16_0096
     * @tc.desc   16 字符上限附近的截断
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeB1696', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB1696 begin');
      expect(ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaa')).assertEqual('aaaaaaaaaaaaaaaa');
      expect(ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaa')).assertEqual('aaaaaaaaaaaaaaaa...');
      expect(ResourceUtils.sanitizeWorld('  abcd  ')).assertEqual('abcd');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeB1696 end');
    })
  })
}
