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

export default function resourceUtilsSanitizeV24Test() {
  describe('ResourceUtilsSanitizeV24Test', () => {

    /**
     * @tc.name   testResourceUtilsSanitizeV240001
     * @tc.number SUB_RESMGR_UTILS24_0001
     * @tc.desc   长度 1 的占位词清洗后长度为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240001 begin');
      const result: string = ResourceUtils.sanitizeWorld('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('b'));
      expect(result).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240001 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240002
     * @tc.number SUB_RESMGR_UTILS24_0002
     * @tc.desc   长度 2 的占位词清洗后长度为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240002 begin');
      const result: string = ResourceUtils.sanitizeWorld('cc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cc'));
      expect(result).assertEqual('cc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240002 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240003
     * @tc.number SUB_RESMGR_UTILS24_0003
     * @tc.desc   长度 3 的占位词清洗后长度为 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240003 begin');
      const result: string = ResourceUtils.sanitizeWorld('ddd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ddd'));
      expect(result).assertEqual('ddd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240003 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240004
     * @tc.number SUB_RESMGR_UTILS24_0004
     * @tc.desc   长度 4 的占位词清洗后长度为 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240004 begin');
      const result: string = ResourceUtils.sanitizeWorld('eeee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('eeee'));
      expect(result).assertEqual('eeee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240004 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240005
     * @tc.number SUB_RESMGR_UTILS24_0005
     * @tc.desc   长度 5 的占位词清洗后长度为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240005 begin');
      const result: string = ResourceUtils.sanitizeWorld('fffff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('fffff'));
      expect(result).assertEqual('fffff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240005 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240006
     * @tc.number SUB_RESMGR_UTILS24_0006
     * @tc.desc   长度 6 的占位词清洗后长度为 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240006 begin');
      const result: string = ResourceUtils.sanitizeWorld('gggggg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('gggggg'));
      expect(result).assertEqual('gggggg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240006 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240007
     * @tc.number SUB_RESMGR_UTILS24_0007
     * @tc.desc   长度 7 的占位词清洗后长度为 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240007 begin');
      const result: string = ResourceUtils.sanitizeWorld('hhhhhhh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('hhhhhhh'));
      expect(result).assertEqual('hhhhhhh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240007 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240008
     * @tc.number SUB_RESMGR_UTILS24_0008
     * @tc.desc   长度 8 的占位词清洗后长度为 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240008 begin');
      const result: string = ResourceUtils.sanitizeWorld('iiiiiiii');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('iiiiiiii'));
      expect(result).assertEqual('iiiiiiii');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240008 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240009
     * @tc.number SUB_RESMGR_UTILS24_0009
     * @tc.desc   长度 9 的占位词清洗后长度为 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240009 begin');
      const result: string = ResourceUtils.sanitizeWorld('jjjjjjjjj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('jjjjjjjjj'));
      expect(result).assertEqual('jjjjjjjjj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(9));
      expect(result.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240009 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240010
     * @tc.number SUB_RESMGR_UTILS24_0010
     * @tc.desc   长度 10 的占位词清洗后长度为 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240010 begin');
      const result: string = ResourceUtils.sanitizeWorld('kkkkkkkkkk');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('kkkkkkkkkk'));
      expect(result).assertEqual('kkkkkkkkkk');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240010 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240011
     * @tc.number SUB_RESMGR_UTILS24_0011
     * @tc.desc   长度 11 的占位词清洗后长度为 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240011 begin');
      const result: string = ResourceUtils.sanitizeWorld('lllllllllll');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lllllllllll'));
      expect(result).assertEqual('lllllllllll');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(11));
      expect(result.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240011 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240012
     * @tc.number SUB_RESMGR_UTILS24_0012
     * @tc.desc   长度 12 的占位词清洗后长度为 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240012 begin');
      const result: string = ResourceUtils.sanitizeWorld('mmmmmmmmmmmm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('mmmmmmmmmmmm'));
      expect(result).assertEqual('mmmmmmmmmmmm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(12));
      expect(result.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240012 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240013
     * @tc.number SUB_RESMGR_UTILS24_0013
     * @tc.desc   长度 13 的占位词清洗后长度为 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240013 begin');
      const result: string = ResourceUtils.sanitizeWorld('nnnnnnnnnnnnn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nnnnnnnnnnnnn'));
      expect(result).assertEqual('nnnnnnnnnnnnn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240013 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240014
     * @tc.number SUB_RESMGR_UTILS24_0014
     * @tc.desc   长度 14 的占位词清洗后长度为 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240014 begin');
      const result: string = ResourceUtils.sanitizeWorld('oooooooooooooo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('oooooooooooooo'));
      expect(result).assertEqual('oooooooooooooo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(14));
      expect(result.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240014 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240015
     * @tc.number SUB_RESMGR_UTILS24_0015
     * @tc.desc   长度 15 的占位词清洗后长度为 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240015 begin');
      const result: string = ResourceUtils.sanitizeWorld('ppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ppppppppppppppp'));
      expect(result).assertEqual('ppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(15));
      expect(result.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240015 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240016
     * @tc.number SUB_RESMGR_UTILS24_0016
     * @tc.desc   长度 16 的占位词清洗后长度为 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240016 begin');
      const result: string = ResourceUtils.sanitizeWorld('qqqqqqqqqqqqqqqq');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('qqqqqqqqqqqqqqqq'));
      expect(result).assertEqual('qqqqqqqqqqqqqqqq');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(16));
      expect(result.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240016 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240017
     * @tc.number SUB_RESMGR_UTILS24_0017
     * @tc.desc   长度 17 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240017 begin');
      const result: string = ResourceUtils.sanitizeWorld('rrrrrrrrrrrrrrrrr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('rrrrrrrrrrrrrrrr...'));
      expect(result).assertEqual('rrrrrrrrrrrrrrrr...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240017 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240018
     * @tc.number SUB_RESMGR_UTILS24_0018
     * @tc.desc   长度 18 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240018 begin');
      const result: string = ResourceUtils.sanitizeWorld('ssssssssssssssssss');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ssssssssssssssss...'));
      expect(result).assertEqual('ssssssssssssssss...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240018 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240019
     * @tc.number SUB_RESMGR_UTILS24_0019
     * @tc.desc   长度 19 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240019 begin');
      const result: string = ResourceUtils.sanitizeWorld('ttttttttttttttttttt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('tttttttttttttttt...'));
      expect(result).assertEqual('tttttttttttttttt...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240019 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240020
     * @tc.number SUB_RESMGR_UTILS24_0020
     * @tc.desc   长度 20 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240020 begin');
      const result: string = ResourceUtils.sanitizeWorld('uuuuuuuuuuuuuuuuuuuu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('uuuuuuuuuuuuuuuu...'));
      expect(result).assertEqual('uuuuuuuuuuuuuuuu...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240020 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240021
     * @tc.number SUB_RESMGR_UTILS24_0021
     * @tc.desc   长度 21 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240021 begin');
      const result: string = ResourceUtils.sanitizeWorld('vvvvvvvvvvvvvvvvvvvvv');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('vvvvvvvvvvvvvvvv...'));
      expect(result).assertEqual('vvvvvvvvvvvvvvvv...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240021 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240022
     * @tc.number SUB_RESMGR_UTILS24_0022
     * @tc.desc   长度 22 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240022 begin');
      const result: string = ResourceUtils.sanitizeWorld('wwwwwwwwwwwwwwwwwwwwww');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('wwwwwwwwwwwwwwww...'));
      expect(result).assertEqual('wwwwwwwwwwwwwwww...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240022 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240023
     * @tc.number SUB_RESMGR_UTILS24_0023
     * @tc.desc   长度 23 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240023 begin');
      const result: string = ResourceUtils.sanitizeWorld('xxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('xxxxxxxxxxxxxxxx...'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxx...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240023 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240024
     * @tc.number SUB_RESMGR_UTILS24_0024
     * @tc.desc   长度 24 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240024 begin');
      const result: string = ResourceUtils.sanitizeWorld('yyyyyyyyyyyyyyyyyyyyyyyy');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('yyyyyyyyyyyyyyyy...'));
      expect(result).assertEqual('yyyyyyyyyyyyyyyy...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240024 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240025
     * @tc.number SUB_RESMGR_UTILS24_0025
     * @tc.desc   长度 25 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240025 begin');
      const result: string = ResourceUtils.sanitizeWorld('zzzzzzzzzzzzzzzzzzzzzzzzz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('zzzzzzzzzzzzzzzz...'));
      expect(result).assertEqual('zzzzzzzzzzzzzzzz...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240025 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240026
     * @tc.number SUB_RESMGR_UTILS24_0026
     * @tc.desc   长度 26 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240026 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240026 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240027
     * @tc.number SUB_RESMGR_UTILS24_0027
     * @tc.desc   长度 27 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240027 begin');
      const result: string = ResourceUtils.sanitizeWorld('bbbbbbbbbbbbbbbbbbbbbbbbbbb');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('bbbbbbbbbbbbbbbb...'));
      expect(result).assertEqual('bbbbbbbbbbbbbbbb...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240027 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240028
     * @tc.number SUB_RESMGR_UTILS24_0028
     * @tc.desc   长度 28 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240028 begin');
      const result: string = ResourceUtils.sanitizeWorld('cccccccccccccccccccccccccccc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240028 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240029
     * @tc.number SUB_RESMGR_UTILS24_0029
     * @tc.desc   长度 29 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240029 begin');
      const result: string = ResourceUtils.sanitizeWorld('ddddddddddddddddddddddddddddd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('dddddddddddddddd...'));
      expect(result).assertEqual('dddddddddddddddd...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240029 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240030
     * @tc.number SUB_RESMGR_UTILS24_0030
     * @tc.desc   长度 30 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240030 begin');
      const result: string = ResourceUtils.sanitizeWorld('eeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('eeeeeeeeeeeeeeee...'));
      expect(result).assertEqual('eeeeeeeeeeeeeeee...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240030 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240031
     * @tc.number SUB_RESMGR_UTILS24_0031
     * @tc.desc   长度 31 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240031 begin');
      const result: string = ResourceUtils.sanitizeWorld('fffffffffffffffffffffffffffffff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ffffffffffffffff...'));
      expect(result).assertEqual('ffffffffffffffff...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240031 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240032
     * @tc.number SUB_RESMGR_UTILS24_0032
     * @tc.desc   长度 32 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240032 begin');
      const result: string = ResourceUtils.sanitizeWorld('gggggggggggggggggggggggggggggggg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('gggggggggggggggg...'));
      expect(result).assertEqual('gggggggggggggggg...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240032 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240033
     * @tc.number SUB_RESMGR_UTILS24_0033
     * @tc.desc   长度 33 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240033 begin');
      const result: string = ResourceUtils.sanitizeWorld('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hhhhhhhhhhhhhhhh...'));
      expect(result).assertEqual('hhhhhhhhhhhhhhhh...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240033 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240034
     * @tc.number SUB_RESMGR_UTILS24_0034
     * @tc.desc   长度 34 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240034 begin');
      const result: string = ResourceUtils.sanitizeWorld('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('iiiiiiiiiiiiiiii...'));
      expect(result).assertEqual('iiiiiiiiiiiiiiii...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240034 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240035
     * @tc.number SUB_RESMGR_UTILS24_0035
     * @tc.desc   长度 35 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240035 begin');
      const result: string = ResourceUtils.sanitizeWorld('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jjjjjjjjjjjjjjjj...'));
      expect(result).assertEqual('jjjjjjjjjjjjjjjj...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240035 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240036
     * @tc.number SUB_RESMGR_UTILS24_0036
     * @tc.desc   长度 36 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240036 begin');
      const result: string = ResourceUtils.sanitizeWorld('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('kkkkkkkkkkkkkkkk...'));
      expect(result).assertEqual('kkkkkkkkkkkkkkkk...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240036 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240037
     * @tc.number SUB_RESMGR_UTILS24_0037
     * @tc.desc   长度 37 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240037 begin');
      const result: string = ResourceUtils.sanitizeWorld('lllllllllllllllllllllllllllllllllllll');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('llllllllllllllll...'));
      expect(result).assertEqual('llllllllllllllll...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240037 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240038
     * @tc.number SUB_RESMGR_UTILS24_0038
     * @tc.desc   长度 38 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240038 begin');
      const result: string = ResourceUtils.sanitizeWorld('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('mmmmmmmmmmmmmmmm...'));
      expect(result).assertEqual('mmmmmmmmmmmmmmmm...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240038 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240039
     * @tc.number SUB_RESMGR_UTILS24_0039
     * @tc.desc   长度 39 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240039 begin');
      const result: string = ResourceUtils.sanitizeWorld('nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('nnnnnnnnnnnnnnnn...'));
      expect(result).assertEqual('nnnnnnnnnnnnnnnn...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240039 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240040
     * @tc.number SUB_RESMGR_UTILS24_0040
     * @tc.desc   长度 40 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240040 begin');
      const result: string = ResourceUtils.sanitizeWorld('oooooooooooooooooooooooooooooooooooooooo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('oooooooooooooooo...'));
      expect(result).assertEqual('oooooooooooooooo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240040 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240041
     * @tc.number SUB_RESMGR_UTILS24_0041
     * @tc.desc   长度 41 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240041 begin');
      const result: string = ResourceUtils.sanitizeWorld('ppppppppppppppppppppppppppppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('pppppppppppppppp...'));
      expect(result).assertEqual('pppppppppppppppp...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240041 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240042
     * @tc.number SUB_RESMGR_UTILS24_0042
     * @tc.desc   长度 42 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240042 begin');
      const result: string = ResourceUtils.sanitizeWorld('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('qqqqqqqqqqqqqqqq...'));
      expect(result).assertEqual('qqqqqqqqqqqqqqqq...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240042 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240043
     * @tc.number SUB_RESMGR_UTILS24_0043
     * @tc.desc   长度 43 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240043 begin');
      const result: string = ResourceUtils.sanitizeWorld('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('rrrrrrrrrrrrrrrr...'));
      expect(result).assertEqual('rrrrrrrrrrrrrrrr...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240043 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240044
     * @tc.number SUB_RESMGR_UTILS24_0044
     * @tc.desc   长度 44 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240044 begin');
      const result: string = ResourceUtils.sanitizeWorld('ssssssssssssssssssssssssssssssssssssssssssss');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ssssssssssssssss...'));
      expect(result).assertEqual('ssssssssssssssss...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240044 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240045
     * @tc.number SUB_RESMGR_UTILS24_0045
     * @tc.desc   长度 45 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240045 begin');
      const result: string = ResourceUtils.sanitizeWorld('ttttttttttttttttttttttttttttttttttttttttttttt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('tttttttttttttttt...'));
      expect(result).assertEqual('tttttttttttttttt...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240045 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240046
     * @tc.number SUB_RESMGR_UTILS24_0046
     * @tc.desc   长度 46 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240046 begin');
      const result: string = ResourceUtils.sanitizeWorld('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('uuuuuuuuuuuuuuuu...'));
      expect(result).assertEqual('uuuuuuuuuuuuuuuu...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240046 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240047
     * @tc.number SUB_RESMGR_UTILS24_0047
     * @tc.desc   长度 47 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240047 begin');
      const result: string = ResourceUtils.sanitizeWorld('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('vvvvvvvvvvvvvvvv...'));
      expect(result).assertEqual('vvvvvvvvvvvvvvvv...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240047 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240048
     * @tc.number SUB_RESMGR_UTILS24_0048
     * @tc.desc   长度 48 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240048 begin');
      const result: string = ResourceUtils.sanitizeWorld('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('wwwwwwwwwwwwwwww...'));
      expect(result).assertEqual('wwwwwwwwwwwwwwww...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240048 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240049
     * @tc.number SUB_RESMGR_UTILS24_0049
     * @tc.desc   长度 49 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240049 begin');
      const result: string = ResourceUtils.sanitizeWorld('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('xxxxxxxxxxxxxxxx...'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxx...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240049 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240050
     * @tc.number SUB_RESMGR_UTILS24_0050
     * @tc.desc   长度 50 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240050 begin');
      const result: string = ResourceUtils.sanitizeWorld('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('yyyyyyyyyyyyyyyy...'));
      expect(result).assertEqual('yyyyyyyyyyyyyyyy...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240050 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240051
     * @tc.number SUB_RESMGR_UTILS24_0051
     * @tc.desc   长度 51 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240051 begin');
      const result: string = ResourceUtils.sanitizeWorld('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('zzzzzzzzzzzzzzzz...'));
      expect(result).assertEqual('zzzzzzzzzzzzzzzz...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240051 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240052
     * @tc.number SUB_RESMGR_UTILS24_0052
     * @tc.desc   长度 52 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240052 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240052 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240053
     * @tc.number SUB_RESMGR_UTILS24_0053
     * @tc.desc   长度 53 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240053 begin');
      const result: string = ResourceUtils.sanitizeWorld('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('bbbbbbbbbbbbbbbb...'));
      expect(result).assertEqual('bbbbbbbbbbbbbbbb...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240053 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240054
     * @tc.number SUB_RESMGR_UTILS24_0054
     * @tc.desc   长度 54 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240054 begin');
      const result: string = ResourceUtils.sanitizeWorld('cccccccccccccccccccccccccccccccccccccccccccccccccccccc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240054 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240055
     * @tc.number SUB_RESMGR_UTILS24_0055
     * @tc.desc   长度 55 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240055 begin');
      const result: string = ResourceUtils.sanitizeWorld('ddddddddddddddddddddddddddddddddddddddddddddddddddddddd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('dddddddddddddddd...'));
      expect(result).assertEqual('dddddddddddddddd...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240055 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240056
     * @tc.number SUB_RESMGR_UTILS24_0056
     * @tc.desc   长度 56 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240056 begin');
      const result: string = ResourceUtils.sanitizeWorld('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('eeeeeeeeeeeeeeee...'));
      expect(result).assertEqual('eeeeeeeeeeeeeeee...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240056 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240057
     * @tc.number SUB_RESMGR_UTILS24_0057
     * @tc.desc   长度 57 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240057 begin');
      const result: string = ResourceUtils.sanitizeWorld('fffffffffffffffffffffffffffffffffffffffffffffffffffffffff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ffffffffffffffff...'));
      expect(result).assertEqual('ffffffffffffffff...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240057 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240058
     * @tc.number SUB_RESMGR_UTILS24_0058
     * @tc.desc   长度 58 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240058 begin');
      const result: string = ResourceUtils.sanitizeWorld('gggggggggggggggggggggggggggggggggggggggggggggggggggggggggg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('gggggggggggggggg...'));
      expect(result).assertEqual('gggggggggggggggg...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240058 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240059
     * @tc.number SUB_RESMGR_UTILS24_0059
     * @tc.desc   长度 59 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240059 begin');
      const result: string = ResourceUtils.sanitizeWorld('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hhhhhhhhhhhhhhhh...'));
      expect(result).assertEqual('hhhhhhhhhhhhhhhh...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240059 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240060
     * @tc.number SUB_RESMGR_UTILS24_0060
     * @tc.desc   长度 60 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240060 begin');
      const result: string = ResourceUtils.sanitizeWorld('iiiiiiiiiiiiiiiiiiiiiiiiiiiiii' +
        'iiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('iiiiiiiiiiiiiiii...'));
      expect(result).assertEqual('iiiiiiiiiiiiiiii...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240060 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240061
     * @tc.number SUB_RESMGR_UTILS24_0061
     * @tc.desc   长度 61 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240061 begin');
      const result: string = ResourceUtils.sanitizeWorld('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjj' +
        'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jjjjjjjjjjjjjjjj...'));
      expect(result).assertEqual('jjjjjjjjjjjjjjjj...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240061 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240062
     * @tc.number SUB_RESMGR_UTILS24_0062
     * @tc.desc   长度 62 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240062 begin');
      const result: string = ResourceUtils.sanitizeWorld('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk' +
        'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('kkkkkkkkkkkkkkkk...'));
      expect(result).assertEqual('kkkkkkkkkkkkkkkk...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240062 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240063
     * @tc.number SUB_RESMGR_UTILS24_0063
     * @tc.desc   长度 63 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240063 begin');
      const result: string = ResourceUtils.sanitizeWorld('llllllllllllllllllllllllllllllll' +
        'lllllllllllllllllllllllllllllll');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('llllllllllllllll...'));
      expect(result).assertEqual('llllllllllllllll...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240063 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240064
     * @tc.number SUB_RESMGR_UTILS24_0064
     * @tc.desc   长度 64 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240064 begin');
      const result: string = ResourceUtils.sanitizeWorld('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm' +
        'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('mmmmmmmmmmmmmmmm...'));
      expect(result).assertEqual('mmmmmmmmmmmmmmmm...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240064 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240065
     * @tc.number SUB_RESMGR_UTILS24_0065
     * @tc.desc   长度 65 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240065 begin');
      const result: string = ResourceUtils.sanitizeWorld('nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn' +
        'nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('nnnnnnnnnnnnnnnn...'));
      expect(result).assertEqual('nnnnnnnnnnnnnnnn...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240065 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240066
     * @tc.number SUB_RESMGR_UTILS24_0066
     * @tc.desc   长度 66 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240066 begin');
      const result: string = ResourceUtils.sanitizeWorld('ooooooooooooooooooooooooooooooooo' +
        'ooooooooooooooooooooooooooooooooo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('oooooooooooooooo...'));
      expect(result).assertEqual('oooooooooooooooo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240066 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240067
     * @tc.number SUB_RESMGR_UTILS24_0067
     * @tc.desc   长度 67 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240067 begin');
      const result: string = ResourceUtils.sanitizeWorld('pppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('pppppppppppppppp...'));
      expect(result).assertEqual('pppppppppppppppp...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240067 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240068
     * @tc.number SUB_RESMGR_UTILS24_0068
     * @tc.desc   长度 68 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240068 begin');
      const result: string = ResourceUtils.sanitizeWorld('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq' +
        'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('qqqqqqqqqqqqqqqq...'));
      expect(result).assertEqual('qqqqqqqqqqqqqqqq...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240068 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240069
     * @tc.number SUB_RESMGR_UTILS24_0069
     * @tc.desc   长度 69 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240069 begin');
      const result: string = ResourceUtils.sanitizeWorld('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('rrrrrrrrrrrrrrrr...'));
      expect(result).assertEqual('rrrrrrrrrrrrrrrr...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240069 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240070
     * @tc.number SUB_RESMGR_UTILS24_0070
     * @tc.desc   长度 70 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240070 begin');
      const result: string = ResourceUtils.sanitizeWorld('sssssssssssssssssssssssssssssssssss' +
        'sssssssssssssssssssssssssssssssssss');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ssssssssssssssss...'));
      expect(result).assertEqual('ssssssssssssssss...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240070 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240071
     * @tc.number SUB_RESMGR_UTILS24_0071
     * @tc.desc   长度 71 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240071 begin');
      const result: string = ResourceUtils.sanitizeWorld('tttttttttttttttttttttttttttttttttttt' +
        'ttttttttttttttttttttttttttttttttttt');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('tttttttttttttttt...'));
      expect(result).assertEqual('tttttttttttttttt...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240071 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240072
     * @tc.number SUB_RESMGR_UTILS24_0072
     * @tc.desc   长度 72 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240072 begin');
      const result: string = ResourceUtils.sanitizeWorld('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu' +
        'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('uuuuuuuuuuuuuuuu...'));
      expect(result).assertEqual('uuuuuuuuuuuuuuuu...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240072 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240073
     * @tc.number SUB_RESMGR_UTILS24_0073
     * @tc.desc   长度 73 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240073 begin');
      const result: string = ResourceUtils.sanitizeWorld('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv' +
        'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('vvvvvvvvvvvvvvvv...'));
      expect(result).assertEqual('vvvvvvvvvvvvvvvv...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240073 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240074
     * @tc.number SUB_RESMGR_UTILS24_0074
     * @tc.desc   长度 74 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240074 begin');
      const result: string = ResourceUtils.sanitizeWorld('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww' +
        'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('wwwwwwwwwwwwwwww...'));
      expect(result).assertEqual('wwwwwwwwwwwwwwww...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240074 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240075
     * @tc.number SUB_RESMGR_UTILS24_0075
     * @tc.desc   长度 75 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240075 begin');
      const result: string = ResourceUtils.sanitizeWorld('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('xxxxxxxxxxxxxxxx...'));
      expect(result).assertEqual('xxxxxxxxxxxxxxxx...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240075 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240076
     * @tc.number SUB_RESMGR_UTILS24_0076
     * @tc.desc   长度 76 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240076 begin');
      const result: string = ResourceUtils.sanitizeWorld('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy' +
        'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('yyyyyyyyyyyyyyyy...'));
      expect(result).assertEqual('yyyyyyyyyyyyyyyy...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240076 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240077
     * @tc.number SUB_RESMGR_UTILS24_0077
     * @tc.desc   长度 77 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240077 begin');
      const result: string = ResourceUtils.sanitizeWorld('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
        'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('zzzzzzzzzzzzzzzz...'));
      expect(result).assertEqual('zzzzzzzzzzzzzzzz...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240077 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240078
     * @tc.number SUB_RESMGR_UTILS24_0078
     * @tc.desc   长度 78 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240078 begin');
      const result: string = ResourceUtils.sanitizeWorld('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('aaaaaaaaaaaaaaaa...'));
      expect(result).assertEqual('aaaaaaaaaaaaaaaa...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240078 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240079
     * @tc.number SUB_RESMGR_UTILS24_0079
     * @tc.desc   长度 79 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240079 begin');
      const result: string = ResourceUtils.sanitizeWorld('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
        'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('bbbbbbbbbbbbbbbb...'));
      expect(result).assertEqual('bbbbbbbbbbbbbbbb...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240079 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240080
     * @tc.number SUB_RESMGR_UTILS24_0080
     * @tc.desc   长度 80 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240080 begin');
      const result: string = ResourceUtils.sanitizeWorld('cccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccccccccccccccccccccccc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('cccccccccccccccc...'));
      expect(result).assertEqual('cccccccccccccccc...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240080 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240081
     * @tc.number SUB_RESMGR_UTILS24_0081
     * @tc.desc   长度 81 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240081 begin');
      const result: string = ResourceUtils.sanitizeWorld('dddddddddddddddddddddddddddddddddddddddd' +
        'ddddddddddddddddddddddddddddddddddddddddd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('dddddddddddddddd...'));
      expect(result).assertEqual('dddddddddddddddd...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240081 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240082
     * @tc.number SUB_RESMGR_UTILS24_0082
     * @tc.desc   长度 82 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240082 begin');
      const result: string = ResourceUtils.sanitizeWorld('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' +
        'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('eeeeeeeeeeeeeeee...'));
      expect(result).assertEqual('eeeeeeeeeeeeeeee...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240082 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240083
     * @tc.number SUB_RESMGR_UTILS24_0083
     * @tc.desc   长度 83 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240083 begin');
      const result: string = ResourceUtils.sanitizeWorld('ffffffffffffffffffffffffffffffffffffffffff' +
        'fffffffffffffffffffffffffffffffffffffffff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ffffffffffffffff...'));
      expect(result).assertEqual('ffffffffffffffff...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240083 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240084
     * @tc.number SUB_RESMGR_UTILS24_0084
     * @tc.desc   长度 84 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240084 begin');
      const result: string = ResourceUtils.sanitizeWorld('gggggggggggggggggggggggggggggggggggggggggg' +
        'gggggggggggggggggggggggggggggggggggggggggg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('gggggggggggggggg...'));
      expect(result).assertEqual('gggggggggggggggg...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240084 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240085
     * @tc.number SUB_RESMGR_UTILS24_0085
     * @tc.desc   长度 85 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240085 begin');
      const result: string = ResourceUtils.sanitizeWorld('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh' +
        'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('hhhhhhhhhhhhhhhh...'));
      expect(result).assertEqual('hhhhhhhhhhhhhhhh...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240085 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240086
     * @tc.number SUB_RESMGR_UTILS24_0086
     * @tc.desc   长度 86 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240086 begin');
      const result: string = ResourceUtils.sanitizeWorld('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii' +
        'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('iiiiiiiiiiiiiiii...'));
      expect(result).assertEqual('iiiiiiiiiiiiiiii...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240086 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240087
     * @tc.number SUB_RESMGR_UTILS24_0087
     * @tc.desc   长度 87 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240087 begin');
      const result: string = ResourceUtils.sanitizeWorld('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj' +
        'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('jjjjjjjjjjjjjjjj...'));
      expect(result).assertEqual('jjjjjjjjjjjjjjjj...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240087 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240088
     * @tc.number SUB_RESMGR_UTILS24_0088
     * @tc.desc   长度 88 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240088 begin');
      const result: string = ResourceUtils.sanitizeWorld('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk' +
        'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('kkkkkkkkkkkkkkkk...'));
      expect(result).assertEqual('kkkkkkkkkkkkkkkk...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240088 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240089
     * @tc.number SUB_RESMGR_UTILS24_0089
     * @tc.desc   长度 89 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240089 begin');
      const result: string = ResourceUtils.sanitizeWorld('llllllllllllllllllllllllllllllllllllllllllll' +
        'lllllllllllllllllllllllllllllllllllllllllllll');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('llllllllllllllll...'));
      expect(result).assertEqual('llllllllllllllll...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240089 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240090
     * @tc.number SUB_RESMGR_UTILS24_0090
     * @tc.desc   长度 90 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240090 begin');
      const result: string = ResourceUtils.sanitizeWorld('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm' +
        'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('mmmmmmmmmmmmmmmm...'));
      expect(result).assertEqual('mmmmmmmmmmmmmmmm...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240090 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240091
     * @tc.number SUB_RESMGR_UTILS24_0091
     * @tc.desc   长度 91 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240091 begin');
      const result: string = ResourceUtils.sanitizeWorld('nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn' +
        'nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('nnnnnnnnnnnnnnnn...'));
      expect(result).assertEqual('nnnnnnnnnnnnnnnn...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240091 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240092
     * @tc.number SUB_RESMGR_UTILS24_0092
     * @tc.desc   长度 92 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240092 begin');
      const result: string = ResourceUtils.sanitizeWorld('oooooooooooooooooooooooooooooooooooooooooooooo' +
        'oooooooooooooooooooooooooooooooooooooooooooooo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('oooooooooooooooo...'));
      expect(result).assertEqual('oooooooooooooooo...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240092 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240093
     * @tc.number SUB_RESMGR_UTILS24_0093
     * @tc.desc   长度 93 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240093 begin');
      const result: string = ResourceUtils.sanitizeWorld('pppppppppppppppppppppppppppppppppppppppppppppp' +
        'ppppppppppppppppppppppppppppppppppppppppppppppp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('pppppppppppppppp...'));
      expect(result).assertEqual('pppppppppppppppp...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240093 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240094
     * @tc.number SUB_RESMGR_UTILS24_0094
     * @tc.desc   长度 94 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240094 begin');
      const result: string = ResourceUtils.sanitizeWorld('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq' +
        'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('qqqqqqqqqqqqqqqq...'));
      expect(result).assertEqual('qqqqqqqqqqqqqqqq...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240094 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240095
     * @tc.number SUB_RESMGR_UTILS24_0095
     * @tc.desc   长度 95 的占位词清洗后长度为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240095 begin');
      const result: string = ResourceUtils.sanitizeWorld('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('rrrrrrrrrrrrrrrr...'));
      expect(result).assertEqual('rrrrrrrrrrrrrrrr...');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.sanitizeWorld(result) === result));
      expect(ResourceUtils.sanitizeWorld(result) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(19));
      expect(result.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240095 end');
    })

    /**
     * @tc.name   testResourceUtilsSanitizeV240096
     * @tc.number SUB_RESMGR_UTILS24_0096
     * @tc.desc   空白串回落默认词，16 字符正好保留，17 字符截断后补省略号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsSanitizeV240096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240096 begin');
      const blank: string = ResourceUtils.sanitizeWorld('    ');
      const exact: string = ResourceUtils.sanitizeWorld('1234567890123456');
      const overflow: string = ResourceUtils.sanitizeWorld('12345678901234567');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s][%{public}s]', exact, overflow);
      expect(blank).assertEqual('world');
      expect(exact).assertEqual('1234567890123456');
      expect(overflow).assertEqual('1234567890123456...');
      expect(overflow.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsSanitizeV240096 end');
    })
  })
}
