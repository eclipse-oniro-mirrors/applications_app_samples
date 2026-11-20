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
import { getLabelList, stringToArray } from '../../../main/ets/model/AssetModel';
import { asset } from '@kit.AssetStoreKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Asset]';

export default function parseLabelVolume01() {
  describe('ParseLabelVolume01Test', () => {

    /**
     * @tc.name   testParseLabel010001
     * @tc.number SUB_ASSET_PARSELBL_0001
     * @tc.desc   双标签 Map 解析按 NORMAL 顺序返回标签数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010001 begin');
      const anchorMap: asset.AssetMap = new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('AnchorA')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('AnchorB')]
      ]);
      const labels: string[] = getLabelList(anchorMap);
      expect(labels.length).assertEqual(2);
      expect(labels[0]).assertEqual('AnchorA');
      expect(labels[1]).assertEqual('AnchorB');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010001 end');
    })

    /**
     * @tc.name   testParseLabel010002
     * @tc.number SUB_ASSET_PARSELBL_0002
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010002 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('G1')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["G1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["G1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010002 end');
    })

    /**
     * @tc.name   testParseLabel010003
     * @tc.number SUB_ASSET_PARSELBL_0003
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010003 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('G2')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["G2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["G2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010003 end');
    })

    /**
     * @tc.name   testParseLabel010004
     * @tc.number SUB_ASSET_PARSELBL_0004
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010004 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('G3')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["G3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["G3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010004 end');
    })

    /**
     * @tc.name   testParseLabel010005
     * @tc.number SUB_ASSET_PARSELBL_0005
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010005 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('G4')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["G4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["G4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010005 end');
    })

    /**
     * @tc.name   testParseLabel010006
     * @tc.number SUB_ASSET_PARSELBL_0006
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010006 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L5')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010006 end');
    })

    /**
     * @tc.name   testParseLabel010007
     * @tc.number SUB_ASSET_PARSELBL_0007
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010007 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L6')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010007 end');
    })

    /**
     * @tc.name   testParseLabel010008
     * @tc.number SUB_ASSET_PARSELBL_0008
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010008 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L7')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010008 end');
    })

    /**
     * @tc.name   testParseLabel010009
     * @tc.number SUB_ASSET_PARSELBL_0009
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010009 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L8')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010009 end');
    })

    /**
     * @tc.name   testParseLabel010010
     * @tc.number SUB_ASSET_PARSELBL_0010
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010010 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L9')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010010 end');
    })

    /**
     * @tc.name   testParseLabel010011
     * @tc.number SUB_ASSET_PARSELBL_0011
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010011 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L10')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010011 end');
    })

    /**
     * @tc.name   testParseLabel010012
     * @tc.number SUB_ASSET_PARSELBL_0012
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010012 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L11')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010012 end');
    })

    /**
     * @tc.name   testParseLabel010013
     * @tc.number SUB_ASSET_PARSELBL_0013
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010013 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L12')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010013 end');
    })

    /**
     * @tc.name   testParseLabel010014
     * @tc.number SUB_ASSET_PARSELBL_0014
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010014 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L13')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010014 end');
    })

    /**
     * @tc.name   testParseLabel010015
     * @tc.number SUB_ASSET_PARSELBL_0015
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010015 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L14')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010015 end');
    })

    /**
     * @tc.name   testParseLabel010016
     * @tc.number SUB_ASSET_PARSELBL_0016
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010016 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L15')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010016 end');
    })

    /**
     * @tc.name   testParseLabel010017
     * @tc.number SUB_ASSET_PARSELBL_0017
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010017 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L16')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010017 end');
    })

    /**
     * @tc.name   testParseLabel010018
     * @tc.number SUB_ASSET_PARSELBL_0018
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010018 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L17')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010018 end');
    })

    /**
     * @tc.name   testParseLabel010019
     * @tc.number SUB_ASSET_PARSELBL_0019
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010019 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L18')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010019 end');
    })

    /**
     * @tc.name   testParseLabel010020
     * @tc.number SUB_ASSET_PARSELBL_0020
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010020 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L19')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010020 end');
    })

    /**
     * @tc.name   testParseLabel010021
     * @tc.number SUB_ASSET_PARSELBL_0021
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010021 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L20')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010021 end');
    })

    /**
     * @tc.name   testParseLabel010022
     * @tc.number SUB_ASSET_PARSELBL_0022
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010022 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L21')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010022 end');
    })

    /**
     * @tc.name   testParseLabel010023
     * @tc.number SUB_ASSET_PARSELBL_0023
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010023 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L22')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010023 end');
    })

    /**
     * @tc.name   testParseLabel010024
     * @tc.number SUB_ASSET_PARSELBL_0024
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010024 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L23')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010024 end');
    })

    /**
     * @tc.name   testParseLabel010025
     * @tc.number SUB_ASSET_PARSELBL_0025
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010025 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L24')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010025 end');
    })

    /**
     * @tc.name   testParseLabel010026
     * @tc.number SUB_ASSET_PARSELBL_0026
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010026 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L25')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010026 end');
    })

    /**
     * @tc.name   testParseLabel010027
     * @tc.number SUB_ASSET_PARSELBL_0027
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010027 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L26')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010027 end');
    })

    /**
     * @tc.name   testParseLabel010028
     * @tc.number SUB_ASSET_PARSELBL_0028
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010028 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L27')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010028 end');
    })

    /**
     * @tc.name   testParseLabel010029
     * @tc.number SUB_ASSET_PARSELBL_0029
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010029 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L28')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010029 end');
    })

    /**
     * @tc.name   testParseLabel010030
     * @tc.number SUB_ASSET_PARSELBL_0030
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010030 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L29')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010030 end');
    })

    /**
     * @tc.name   testParseLabel010031
     * @tc.number SUB_ASSET_PARSELBL_0031
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010031 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L30')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L30"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L30"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010031 end');
    })

    /**
     * @tc.name   testParseLabel010032
     * @tc.number SUB_ASSET_PARSELBL_0032
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010032 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L31')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L31"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L31"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010032 end');
    })

    /**
     * @tc.name   testParseLabel010033
     * @tc.number SUB_ASSET_PARSELBL_0033
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010033 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L32')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L32"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L32"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010033 end');
    })

    /**
     * @tc.name   testParseLabel010034
     * @tc.number SUB_ASSET_PARSELBL_0034
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010034 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L33')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L33"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L33"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010034 end');
    })

    /**
     * @tc.name   testParseLabel010035
     * @tc.number SUB_ASSET_PARSELBL_0035
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010035 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L34')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L34"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L34"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010035 end');
    })

    /**
     * @tc.name   testParseLabel010036
     * @tc.number SUB_ASSET_PARSELBL_0036
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010036 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L35')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L35"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L35"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010036 end');
    })

    /**
     * @tc.name   testParseLabel010037
     * @tc.number SUB_ASSET_PARSELBL_0037
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010037 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L36')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L36"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L36"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010037 end');
    })

    /**
     * @tc.name   testParseLabel010038
     * @tc.number SUB_ASSET_PARSELBL_0038
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010038 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L37')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L37"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L37"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010038 end');
    })

    /**
     * @tc.name   testParseLabel010039
     * @tc.number SUB_ASSET_PARSELBL_0039
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010039 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L38')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L38"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L38"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010039 end');
    })

    /**
     * @tc.name   testParseLabel010040
     * @tc.number SUB_ASSET_PARSELBL_0040
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010040 begin');
      const result: string[] = getLabelList(new Map([[asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L39')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["L39"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["L39"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010040 end');
    })

    /**
     * @tc.name   testParseLabel010041
     * @tc.number SUB_ASSET_PARSELBL_0041
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010041 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A0')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B0')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A0","B0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A0","B0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010041 end');
    })

    /**
     * @tc.name   testParseLabel010042
     * @tc.number SUB_ASSET_PARSELBL_0042
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010042 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A1')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B1')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A1","B1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A1","B1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010042 end');
    })

    /**
     * @tc.name   testParseLabel010043
     * @tc.number SUB_ASSET_PARSELBL_0043
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010043 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A2')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B2')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A2","B2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A2","B2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010043 end');
    })

    /**
     * @tc.name   testParseLabel010044
     * @tc.number SUB_ASSET_PARSELBL_0044
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010044 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A3')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B3')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A3","B3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A3","B3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010044 end');
    })

    /**
     * @tc.name   testParseLabel010045
     * @tc.number SUB_ASSET_PARSELBL_0045
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010045 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A4')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B4')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A4","B4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A4","B4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010045 end');
    })

    /**
     * @tc.name   testParseLabel010046
     * @tc.number SUB_ASSET_PARSELBL_0046
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010046 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A5')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B5')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A5","B5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A5","B5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010046 end');
    })

    /**
     * @tc.name   testParseLabel010047
     * @tc.number SUB_ASSET_PARSELBL_0047
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010047 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A6')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B6')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A6","B6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A6","B6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010047 end');
    })

    /**
     * @tc.name   testParseLabel010048
     * @tc.number SUB_ASSET_PARSELBL_0048
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010048 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A7')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B7')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A7","B7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A7","B7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010048 end');
    })

    /**
     * @tc.name   testParseLabel010049
     * @tc.number SUB_ASSET_PARSELBL_0049
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010049 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A8')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B8')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A8","B8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A8","B8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010049 end');
    })

    /**
     * @tc.name   testParseLabel010050
     * @tc.number SUB_ASSET_PARSELBL_0050
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010050 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A9')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B9')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A9","B9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A9","B9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010050 end');
    })

    /**
     * @tc.name   testParseLabel010051
     * @tc.number SUB_ASSET_PARSELBL_0051
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010051 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A10')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B10')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A10","B10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A10","B10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010051 end');
    })

    /**
     * @tc.name   testParseLabel010052
     * @tc.number SUB_ASSET_PARSELBL_0052
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010052 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A11')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B11')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A11","B11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A11","B11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010052 end');
    })

    /**
     * @tc.name   testParseLabel010053
     * @tc.number SUB_ASSET_PARSELBL_0053
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010053 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A12')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B12')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A12","B12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A12","B12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010053 end');
    })

    /**
     * @tc.name   testParseLabel010054
     * @tc.number SUB_ASSET_PARSELBL_0054
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010054 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A13')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B13')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A13","B13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A13","B13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010054 end');
    })

    /**
     * @tc.name   testParseLabel010055
     * @tc.number SUB_ASSET_PARSELBL_0055
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010055 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A14')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B14')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A14","B14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A14","B14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010055 end');
    })

    /**
     * @tc.name   testParseLabel010056
     * @tc.number SUB_ASSET_PARSELBL_0056
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010056 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A15')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B15')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A15","B15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A15","B15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010056 end');
    })

    /**
     * @tc.name   testParseLabel010057
     * @tc.number SUB_ASSET_PARSELBL_0057
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010057 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A16')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B16')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A16","B16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A16","B16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010057 end');
    })

    /**
     * @tc.name   testParseLabel010058
     * @tc.number SUB_ASSET_PARSELBL_0058
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010058 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A17')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B17')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A17","B17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A17","B17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010058 end');
    })

    /**
     * @tc.name   testParseLabel010059
     * @tc.number SUB_ASSET_PARSELBL_0059
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010059 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A18')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B18')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A18","B18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A18","B18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010059 end');
    })

    /**
     * @tc.name   testParseLabel010060
     * @tc.number SUB_ASSET_PARSELBL_0060
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010060 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A19')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B19')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A19","B19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A19","B19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010060 end');
    })

    /**
     * @tc.name   testParseLabel010061
     * @tc.number SUB_ASSET_PARSELBL_0061
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010061 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A20')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B20')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A20","B20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A20","B20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010061 end');
    })

    /**
     * @tc.name   testParseLabel010062
     * @tc.number SUB_ASSET_PARSELBL_0062
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010062 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A21')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B21')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A21","B21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A21","B21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010062 end');
    })

    /**
     * @tc.name   testParseLabel010063
     * @tc.number SUB_ASSET_PARSELBL_0063
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010063 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A22')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B22')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A22","B22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A22","B22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010063 end');
    })

    /**
     * @tc.name   testParseLabel010064
     * @tc.number SUB_ASSET_PARSELBL_0064
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010064 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A23')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B23')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A23","B23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A23","B23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010064 end');
    })

    /**
     * @tc.name   testParseLabel010065
     * @tc.number SUB_ASSET_PARSELBL_0065
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010065 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A24')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B24')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A24","B24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A24","B24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010065 end');
    })

    /**
     * @tc.name   testParseLabel010066
     * @tc.number SUB_ASSET_PARSELBL_0066
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010066 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A25')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B25')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A25","B25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A25","B25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010066 end');
    })

    /**
     * @tc.name   testParseLabel010067
     * @tc.number SUB_ASSET_PARSELBL_0067
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010067 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A26')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B26')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A26","B26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A26","B26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010067 end');
    })

    /**
     * @tc.name   testParseLabel010068
     * @tc.number SUB_ASSET_PARSELBL_0068
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010068 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A27')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B27')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A27","B27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A27","B27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010068 end');
    })

    /**
     * @tc.name   testParseLabel010069
     * @tc.number SUB_ASSET_PARSELBL_0069
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010069 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A28')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B28')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A28","B28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A28","B28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010069 end');
    })

    /**
     * @tc.name   testParseLabel010070
     * @tc.number SUB_ASSET_PARSELBL_0070
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010070 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A29')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B29')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A29","B29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A29","B29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010070 end');
    })

    /**
     * @tc.name   testParseLabel010071
     * @tc.number SUB_ASSET_PARSELBL_0071
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010071 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A30')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B30')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A30","B30"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A30","B30"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010071 end');
    })

    /**
     * @tc.name   testParseLabel010072
     * @tc.number SUB_ASSET_PARSELBL_0072
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010072 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A31')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B31')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A31","B31"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A31","B31"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010072 end');
    })

    /**
     * @tc.name   testParseLabel010073
     * @tc.number SUB_ASSET_PARSELBL_0073
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010073 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A32')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B32')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A32","B32"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A32","B32"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010073 end');
    })

    /**
     * @tc.name   testParseLabel010074
     * @tc.number SUB_ASSET_PARSELBL_0074
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010074 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A33')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B33')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A33","B33"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A33","B33"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010074 end');
    })

    /**
     * @tc.name   testParseLabel010075
     * @tc.number SUB_ASSET_PARSELBL_0075
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010075 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A34')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B34')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A34","B34"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A34","B34"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010075 end');
    })

    /**
     * @tc.name   testParseLabel010076
     * @tc.number SUB_ASSET_PARSELBL_0076
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010076 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A35')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B35')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A35","B35"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A35","B35"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010076 end');
    })

    /**
     * @tc.name   testParseLabel010077
     * @tc.number SUB_ASSET_PARSELBL_0077
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010077 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A36')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B36')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A36","B36"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A36","B36"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010077 end');
    })

    /**
     * @tc.name   testParseLabel010078
     * @tc.number SUB_ASSET_PARSELBL_0078
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010078 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A37')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B37')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A37","B37"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A37","B37"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010078 end');
    })

    /**
     * @tc.name   testParseLabel010079
     * @tc.number SUB_ASSET_PARSELBL_0079
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010079 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A38')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B38')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A38","B38"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A38","B38"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010079 end');
    })

    /**
     * @tc.name   testParseLabel010080
     * @tc.number SUB_ASSET_PARSELBL_0080
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010080 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A39')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B39')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["A39","B39"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["A39","B39"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010080 end');
    })

    /**
     * @tc.name   testParseLabel010081
     * @tc.number SUB_ASSET_PARSELBL_0081
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010081 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X0')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y0')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z0')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X0","Y0","Z0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X0","Y0","Z0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010081 end');
    })

    /**
     * @tc.name   testParseLabel010082
     * @tc.number SUB_ASSET_PARSELBL_0082
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010082 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X1')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y1')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z1')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X1","Y1","Z1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X1","Y1","Z1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010082 end');
    })

    /**
     * @tc.name   testParseLabel010083
     * @tc.number SUB_ASSET_PARSELBL_0083
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010083 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X2')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y2')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z2')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X2","Y2","Z2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X2","Y2","Z2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010083 end');
    })

    /**
     * @tc.name   testParseLabel010084
     * @tc.number SUB_ASSET_PARSELBL_0084
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010084 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X3')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y3')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z3')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X3","Y3","Z3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X3","Y3","Z3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010084 end');
    })

    /**
     * @tc.name   testParseLabel010085
     * @tc.number SUB_ASSET_PARSELBL_0085
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010085 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X4')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y4')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z4')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X4","Y4","Z4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X4","Y4","Z4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010085 end');
    })

    /**
     * @tc.name   testParseLabel010086
     * @tc.number SUB_ASSET_PARSELBL_0086
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010086 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X5')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y5')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z5')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X5","Y5","Z5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X5","Y5","Z5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010086 end');
    })

    /**
     * @tc.name   testParseLabel010087
     * @tc.number SUB_ASSET_PARSELBL_0087
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010087 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X6')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y6')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z6')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X6","Y6","Z6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X6","Y6","Z6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010087 end');
    })

    /**
     * @tc.name   testParseLabel010088
     * @tc.number SUB_ASSET_PARSELBL_0088
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010088 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X7')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y7')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z7')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X7","Y7","Z7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X7","Y7","Z7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010088 end');
    })

    /**
     * @tc.name   testParseLabel010089
     * @tc.number SUB_ASSET_PARSELBL_0089
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010089 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X8')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y8')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z8')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X8","Y8","Z8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X8","Y8","Z8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010089 end');
    })

    /**
     * @tc.name   testParseLabel010090
     * @tc.number SUB_ASSET_PARSELBL_0090
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010090 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X9')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y9')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z9')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X9","Y9","Z9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X9","Y9","Z9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010090 end');
    })

    /**
     * @tc.name   testParseLabel010091
     * @tc.number SUB_ASSET_PARSELBL_0091
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010091 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X10')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y10')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z10')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X10","Y10","Z10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X10","Y10","Z10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010091 end');
    })

    /**
     * @tc.name   testParseLabel010092
     * @tc.number SUB_ASSET_PARSELBL_0092
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010092 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X11')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y11')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z11')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X11","Y11","Z11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X11","Y11","Z11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010092 end');
    })

    /**
     * @tc.name   testParseLabel010093
     * @tc.number SUB_ASSET_PARSELBL_0093
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010093 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X12')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y12')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z12')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X12","Y12","Z12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X12","Y12","Z12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010093 end');
    })

    /**
     * @tc.name   testParseLabel010094
     * @tc.number SUB_ASSET_PARSELBL_0094
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010094 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X13')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y13')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z13')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X13","Y13","Z13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X13","Y13","Z13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010094 end');
    })

    /**
     * @tc.name   testParseLabel010095
     * @tc.number SUB_ASSET_PARSELBL_0095
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010095 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X14')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y14')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z14')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X14","Y14","Z14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X14","Y14","Z14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010095 end');
    })

    /**
     * @tc.name   testParseLabel010096
     * @tc.number SUB_ASSET_PARSELBL_0096
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010096 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X15')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y15')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z15')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X15","Y15","Z15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X15","Y15","Z15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010096 end');
    })

    /**
     * @tc.name   testParseLabel010097
     * @tc.number SUB_ASSET_PARSELBL_0097
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010097 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X16')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y16')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z16')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X16","Y16","Z16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X16","Y16","Z16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010097 end');
    })

    /**
     * @tc.name   testParseLabel010098
     * @tc.number SUB_ASSET_PARSELBL_0098
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010098 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X17')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y17')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z17')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X17","Y17","Z17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X17","Y17","Z17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010098 end');
    })

    /**
     * @tc.name   testParseLabel010099
     * @tc.number SUB_ASSET_PARSELBL_0099
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010099 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X18')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y18')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z18')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X18","Y18","Z18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X18","Y18","Z18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010099 end');
    })

    /**
     * @tc.name   testParseLabel010100
     * @tc.number SUB_ASSET_PARSELBL_0100
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010100 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X19')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y19')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z19')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X19","Y19","Z19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X19","Y19","Z19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010100 end');
    })

    /**
     * @tc.name   testParseLabel010101
     * @tc.number SUB_ASSET_PARSELBL_0101
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010101 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X20')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y20')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z20')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X20","Y20","Z20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X20","Y20","Z20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010101 end');
    })

    /**
     * @tc.name   testParseLabel010102
     * @tc.number SUB_ASSET_PARSELBL_0102
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010102 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X21')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y21')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z21')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X21","Y21","Z21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X21","Y21","Z21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010102 end');
    })

    /**
     * @tc.name   testParseLabel010103
     * @tc.number SUB_ASSET_PARSELBL_0103
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010103 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X22')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y22')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z22')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X22","Y22","Z22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X22","Y22","Z22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010103 end');
    })

    /**
     * @tc.name   testParseLabel010104
     * @tc.number SUB_ASSET_PARSELBL_0104
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010104 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X23')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y23')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z23')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X23","Y23","Z23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X23","Y23","Z23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010104 end');
    })

    /**
     * @tc.name   testParseLabel010105
     * @tc.number SUB_ASSET_PARSELBL_0105
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010105 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X24')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y24')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z24')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X24","Y24","Z24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X24","Y24","Z24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010105 end');
    })

    /**
     * @tc.name   testParseLabel010106
     * @tc.number SUB_ASSET_PARSELBL_0106
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010106 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X25')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y25')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z25')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X25","Y25","Z25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X25","Y25","Z25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010106 end');
    })

    /**
     * @tc.name   testParseLabel010107
     * @tc.number SUB_ASSET_PARSELBL_0107
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010107 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X26')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y26')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z26')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X26","Y26","Z26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X26","Y26","Z26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010107 end');
    })

    /**
     * @tc.name   testParseLabel010108
     * @tc.number SUB_ASSET_PARSELBL_0108
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010108 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X27')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y27')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z27')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X27","Y27","Z27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X27","Y27","Z27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010108 end');
    })

    /**
     * @tc.name   testParseLabel010109
     * @tc.number SUB_ASSET_PARSELBL_0109
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010109 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X28')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y28')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z28')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X28","Y28","Z28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X28","Y28","Z28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010109 end');
    })

    /**
     * @tc.name   testParseLabel010110
     * @tc.number SUB_ASSET_PARSELBL_0110
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010110 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X29')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y29')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z29')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X29","Y29","Z29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X29","Y29","Z29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010110 end');
    })

    /**
     * @tc.name   testParseLabel010111
     * @tc.number SUB_ASSET_PARSELBL_0111
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010111 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X30')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y30')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z30')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X30","Y30","Z30"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X30","Y30","Z30"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010111 end');
    })

    /**
     * @tc.name   testParseLabel010112
     * @tc.number SUB_ASSET_PARSELBL_0112
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010112 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X31')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y31')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z31')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X31","Y31","Z31"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X31","Y31","Z31"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010112 end');
    })

    /**
     * @tc.name   testParseLabel010113
     * @tc.number SUB_ASSET_PARSELBL_0113
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010113 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X32')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y32')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z32')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X32","Y32","Z32"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X32","Y32","Z32"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010113 end');
    })

    /**
     * @tc.name   testParseLabel010114
     * @tc.number SUB_ASSET_PARSELBL_0114
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010114 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X33')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y33')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z33')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X33","Y33","Z33"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X33","Y33","Z33"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010114 end');
    })

    /**
     * @tc.name   testParseLabel010115
     * @tc.number SUB_ASSET_PARSELBL_0115
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010115 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X34')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y34')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z34')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["X34","Y34","Z34"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["X34","Y34","Z34"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010115 end');
    })

    /**
     * @tc.name   testParseLabel010116
     * @tc.number SUB_ASSET_PARSELBL_0116
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010116 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a0')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b0')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c0')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d0')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a0","b0","c0","d0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a0","b0","c0","d0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010116 end');
    })

    /**
     * @tc.name   testParseLabel010117
     * @tc.number SUB_ASSET_PARSELBL_0117
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010117 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a1')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b1')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c1')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d1')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a1","b1","c1","d1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a1","b1","c1","d1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010117 end');
    })

    /**
     * @tc.name   testParseLabel010118
     * @tc.number SUB_ASSET_PARSELBL_0118
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010118 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a2')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b2')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c2')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d2')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a2","b2","c2","d2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a2","b2","c2","d2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010118 end');
    })

    /**
     * @tc.name   testParseLabel010119
     * @tc.number SUB_ASSET_PARSELBL_0119
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010119 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a3')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b3')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c3')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d3')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a3","b3","c3","d3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a3","b3","c3","d3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010119 end');
    })

    /**
     * @tc.name   testParseLabel010120
     * @tc.number SUB_ASSET_PARSELBL_0120
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010120 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a4')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b4')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c4')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d4')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a4","b4","c4","d4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a4","b4","c4","d4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010120 end');
    })

    /**
     * @tc.name   testParseLabel010121
     * @tc.number SUB_ASSET_PARSELBL_0121
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010121 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a5')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b5')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c5')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d5')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a5","b5","c5","d5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a5","b5","c5","d5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010121 end');
    })

    /**
     * @tc.name   testParseLabel010122
     * @tc.number SUB_ASSET_PARSELBL_0122
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010122 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a6')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b6')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c6')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d6')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a6","b6","c6","d6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a6","b6","c6","d6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010122 end');
    })

    /**
     * @tc.name   testParseLabel010123
     * @tc.number SUB_ASSET_PARSELBL_0123
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010123 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a7')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b7')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c7')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d7')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a7","b7","c7","d7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a7","b7","c7","d7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010123 end');
    })

    /**
     * @tc.name   testParseLabel010124
     * @tc.number SUB_ASSET_PARSELBL_0124
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010124 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a8')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b8')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c8')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d8')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a8","b8","c8","d8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a8","b8","c8","d8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010124 end');
    })

    /**
     * @tc.name   testParseLabel010125
     * @tc.number SUB_ASSET_PARSELBL_0125
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010125 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a9')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b9')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c9')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d9')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a9","b9","c9","d9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a9","b9","c9","d9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010125 end');
    })

    /**
     * @tc.name   testParseLabel010126
     * @tc.number SUB_ASSET_PARSELBL_0126
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010126 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a10')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b10')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c10')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d10')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a10","b10","c10","d10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a10","b10","c10","d10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010126 end');
    })

    /**
     * @tc.name   testParseLabel010127
     * @tc.number SUB_ASSET_PARSELBL_0127
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010127 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a11')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b11')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c11')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d11')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a11","b11","c11","d11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a11","b11","c11","d11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010127 end');
    })

    /**
     * @tc.name   testParseLabel010128
     * @tc.number SUB_ASSET_PARSELBL_0128
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010128 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a12')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b12')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c12')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d12')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a12","b12","c12","d12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a12","b12","c12","d12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010128 end');
    })

    /**
     * @tc.name   testParseLabel010129
     * @tc.number SUB_ASSET_PARSELBL_0129
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010129 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a13')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b13')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c13')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d13')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a13","b13","c13","d13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a13","b13","c13","d13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010129 end');
    })

    /**
     * @tc.name   testParseLabel010130
     * @tc.number SUB_ASSET_PARSELBL_0130
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010130 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a14')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b14')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c14')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d14')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a14","b14","c14","d14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a14","b14","c14","d14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010130 end');
    })

    /**
     * @tc.name   testParseLabel010131
     * @tc.number SUB_ASSET_PARSELBL_0131
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010131 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a15')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b15')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c15')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d15')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a15","b15","c15","d15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a15","b15","c15","d15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010131 end');
    })

    /**
     * @tc.name   testParseLabel010132
     * @tc.number SUB_ASSET_PARSELBL_0132
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010132 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a16')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b16')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c16')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d16')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a16","b16","c16","d16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a16","b16","c16","d16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010132 end');
    })

    /**
     * @tc.name   testParseLabel010133
     * @tc.number SUB_ASSET_PARSELBL_0133
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010133 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a17')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b17')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c17')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d17')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a17","b17","c17","d17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a17","b17","c17","d17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010133 end');
    })

    /**
     * @tc.name   testParseLabel010134
     * @tc.number SUB_ASSET_PARSELBL_0134
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010134 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a18')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b18')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c18')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d18')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a18","b18","c18","d18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a18","b18","c18","d18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010134 end');
    })

    /**
     * @tc.name   testParseLabel010135
     * @tc.number SUB_ASSET_PARSELBL_0135
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010135 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a19')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b19')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c19')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d19')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a19","b19","c19","d19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a19","b19","c19","d19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010135 end');
    })

    /**
     * @tc.name   testParseLabel010136
     * @tc.number SUB_ASSET_PARSELBL_0136
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010136 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a20')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b20')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c20')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d20')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a20","b20","c20","d20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a20","b20","c20","d20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010136 end');
    })

    /**
     * @tc.name   testParseLabel010137
     * @tc.number SUB_ASSET_PARSELBL_0137
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010137 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a21')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b21')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c21')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d21')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a21","b21","c21","d21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a21","b21","c21","d21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010137 end');
    })

    /**
     * @tc.name   testParseLabel010138
     * @tc.number SUB_ASSET_PARSELBL_0138
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010138 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a22')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b22')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c22')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d22')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a22","b22","c22","d22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a22","b22","c22","d22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010138 end');
    })

    /**
     * @tc.name   testParseLabel010139
     * @tc.number SUB_ASSET_PARSELBL_0139
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010139 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a23')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b23')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c23')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d23')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a23","b23","c23","d23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a23","b23","c23","d23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010139 end');
    })

    /**
     * @tc.name   testParseLabel010140
     * @tc.number SUB_ASSET_PARSELBL_0140
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010140 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a24')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b24')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c24')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d24')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a24","b24","c24","d24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a24","b24","c24","d24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010140 end');
    })

    /**
     * @tc.name   testParseLabel010141
     * @tc.number SUB_ASSET_PARSELBL_0141
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010141 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a25')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b25')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c25')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d25')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a25","b25","c25","d25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a25","b25","c25","d25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010141 end');
    })

    /**
     * @tc.name   testParseLabel010142
     * @tc.number SUB_ASSET_PARSELBL_0142
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010142 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a26')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b26')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c26')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d26')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a26","b26","c26","d26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a26","b26","c26","d26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010142 end');
    })

    /**
     * @tc.name   testParseLabel010143
     * @tc.number SUB_ASSET_PARSELBL_0143
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010143 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a27')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b27')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c27')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d27')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a27","b27","c27","d27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a27","b27","c27","d27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010143 end');
    })

    /**
     * @tc.name   testParseLabel010144
     * @tc.number SUB_ASSET_PARSELBL_0144
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010144 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a28')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b28')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c28')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d28')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a28","b28","c28","d28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a28","b28","c28","d28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010144 end');
    })

    /**
     * @tc.name   testParseLabel010145
     * @tc.number SUB_ASSET_PARSELBL_0145
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010145 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a29')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b29')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c29')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d29')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a29","b29","c29","d29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a29","b29","c29","d29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010145 end');
    })

    /**
     * @tc.name   testParseLabel010146
     * @tc.number SUB_ASSET_PARSELBL_0146
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010146 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a30')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b30')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c30')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d30')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a30","b30","c30","d30"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a30","b30","c30","d30"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010146 end');
    })

    /**
     * @tc.name   testParseLabel010147
     * @tc.number SUB_ASSET_PARSELBL_0147
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010147 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a31')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b31')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c31')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d31')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a31","b31","c31","d31"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a31","b31","c31","d31"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010147 end');
    })

    /**
     * @tc.name   testParseLabel010148
     * @tc.number SUB_ASSET_PARSELBL_0148
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010148 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a32')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b32')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c32')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d32')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a32","b32","c32","d32"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a32","b32","c32","d32"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010148 end');
    })

    /**
     * @tc.name   testParseLabel010149
     * @tc.number SUB_ASSET_PARSELBL_0149
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010149 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a33')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b33')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c33')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d33')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a33","b33","c33","d33"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a33","b33","c33","d33"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010149 end');
    })

    /**
     * @tc.name   testParseLabel010150
     * @tc.number SUB_ASSET_PARSELBL_0150
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010150 begin');
            const result: string[] = getLabelList(new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a34')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b34')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c34')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d34')]]));
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a34","b34","c34","d34"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a34","b34","c34","d34"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel010150 end');
    })

  })
}
