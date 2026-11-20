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

export default function parseLabelVolume02() {
  describe('ParseLabelVolume02Test', () => {

    /**
     * @tc.name   testParseLabel020151
     * @tc.number SUB_ASSET_PARSELBL_0151
     * @tc.desc   双标签 Map 解析按 NORMAL 顺序返回标签数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020151 begin');
      const anchorMap: asset.AssetMap = new Map([
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('AnchorA')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('AnchorB')]
      ]);
      const labels: string[] = getLabelList(anchorMap);
      expect(labels.length).assertEqual(2);
      expect(labels[0]).assertEqual('AnchorA');
      expect(labels[1]).assertEqual('AnchorB');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020151 end');
    })

    /**
     * @tc.name   testParseLabel020152
     * @tc.number SUB_ASSET_PARSELBL_0152
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020152 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020152 end');
    })

    /**
     * @tc.name   testParseLabel020153
     * @tc.number SUB_ASSET_PARSELBL_0153
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020153 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020153 end');
    })

    /**
     * @tc.name   testParseLabel020154
     * @tc.number SUB_ASSET_PARSELBL_0154
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020154 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020154 end');
    })

    /**
     * @tc.name   testParseLabel020155
     * @tc.number SUB_ASSET_PARSELBL_0155
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020155 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020155 end');
    })

    /**
     * @tc.name   testParseLabel020156
     * @tc.number SUB_ASSET_PARSELBL_0156
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020156 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020156 end');
    })

    /**
     * @tc.name   testParseLabel020157
     * @tc.number SUB_ASSET_PARSELBL_0157
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020157 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020157 end');
    })

    /**
     * @tc.name   testParseLabel020158
     * @tc.number SUB_ASSET_PARSELBL_0158
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020158 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020158 end');
    })

    /**
     * @tc.name   testParseLabel020159
     * @tc.number SUB_ASSET_PARSELBL_0159
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020159 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020159 end');
    })

    /**
     * @tc.name   testParseLabel020160
     * @tc.number SUB_ASSET_PARSELBL_0160
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020160 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020160 end');
    })

    /**
     * @tc.name   testParseLabel020161
     * @tc.number SUB_ASSET_PARSELBL_0161
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020161 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020161 end');
    })

    /**
     * @tc.name   testParseLabel020162
     * @tc.number SUB_ASSET_PARSELBL_0162
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020162 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020162 end');
    })

    /**
     * @tc.name   testParseLabel020163
     * @tc.number SUB_ASSET_PARSELBL_0163
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020163 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020163 end');
    })

    /**
     * @tc.name   testParseLabel020164
     * @tc.number SUB_ASSET_PARSELBL_0164
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020164 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020164 end');
    })

    /**
     * @tc.name   testParseLabel020165
     * @tc.number SUB_ASSET_PARSELBL_0165
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020165 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020165 end');
    })

    /**
     * @tc.name   testParseLabel020166
     * @tc.number SUB_ASSET_PARSELBL_0166
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020166 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020166 end');
    })

    /**
     * @tc.name   testParseLabel020167
     * @tc.number SUB_ASSET_PARSELBL_0167
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020167 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020167 end');
    })

    /**
     * @tc.name   testParseLabel020168
     * @tc.number SUB_ASSET_PARSELBL_0168
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020168 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020168 end');
    })

    /**
     * @tc.name   testParseLabel020169
     * @tc.number SUB_ASSET_PARSELBL_0169
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020169 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020169 end');
    })

    /**
     * @tc.name   testParseLabel020170
     * @tc.number SUB_ASSET_PARSELBL_0170
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020170 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020170 end');
    })

    /**
     * @tc.name   testParseLabel020171
     * @tc.number SUB_ASSET_PARSELBL_0171
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020171 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020171 end');
    })

    /**
     * @tc.name   testParseLabel020172
     * @tc.number SUB_ASSET_PARSELBL_0172
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020172 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020172 end');
    })

    /**
     * @tc.name   testParseLabel020173
     * @tc.number SUB_ASSET_PARSELBL_0173
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020173 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020173 end');
    })

    /**
     * @tc.name   testParseLabel020174
     * @tc.number SUB_ASSET_PARSELBL_0174
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020174 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020174 end');
    })

    /**
     * @tc.name   testParseLabel020175
     * @tc.number SUB_ASSET_PARSELBL_0175
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020175 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020175 end');
    })

    /**
     * @tc.name   testParseLabel020176
     * @tc.number SUB_ASSET_PARSELBL_0176
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020176 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020176 end');
    })

    /**
     * @tc.name   testParseLabel020177
     * @tc.number SUB_ASSET_PARSELBL_0177
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020177 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020177 end');
    })

    /**
     * @tc.name   testParseLabel020178
     * @tc.number SUB_ASSET_PARSELBL_0178
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020178 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020178 end');
    })

    /**
     * @tc.name   testParseLabel020179
     * @tc.number SUB_ASSET_PARSELBL_0179
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020179 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020179 end');
    })

    /**
     * @tc.name   testParseLabel020180
     * @tc.number SUB_ASSET_PARSELBL_0180
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020180 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020180 end');
    })

    /**
     * @tc.name   testParseLabel020181
     * @tc.number SUB_ASSET_PARSELBL_0181
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020181 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020181 end');
    })

    /**
     * @tc.name   testParseLabel020182
     * @tc.number SUB_ASSET_PARSELBL_0182
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020182 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020182 end');
    })

    /**
     * @tc.name   testParseLabel020183
     * @tc.number SUB_ASSET_PARSELBL_0183
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020183 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020183 end');
    })

    /**
     * @tc.name   testParseLabel020184
     * @tc.number SUB_ASSET_PARSELBL_0184
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020184 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020184 end');
    })

    /**
     * @tc.name   testParseLabel020185
     * @tc.number SUB_ASSET_PARSELBL_0185
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020185 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020185 end');
    })

    /**
     * @tc.name   testParseLabel020186
     * @tc.number SUB_ASSET_PARSELBL_0186
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020186 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020186 end');
    })

    /**
     * @tc.name   testParseLabel020187
     * @tc.number SUB_ASSET_PARSELBL_0187
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020187 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020187 end');
    })

    /**
     * @tc.name   testParseLabel020188
     * @tc.number SUB_ASSET_PARSELBL_0188
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020188 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020188 end');
    })

    /**
     * @tc.name   testParseLabel020189
     * @tc.number SUB_ASSET_PARSELBL_0189
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020189 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020189 end');
    })

    /**
     * @tc.name   testParseLabel020190
     * @tc.number SUB_ASSET_PARSELBL_0190
     * @tc.desc   合法值：单标签 Map 解析返回单元素数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020190 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020190 end');
    })

    /**
     * @tc.name   testParseLabel020191
     * @tc.number SUB_ASSET_PARSELBL_0191
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020191 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020191 end');
    })

    /**
     * @tc.name   testParseLabel020192
     * @tc.number SUB_ASSET_PARSELBL_0192
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020192 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020192 end');
    })

    /**
     * @tc.name   testParseLabel020193
     * @tc.number SUB_ASSET_PARSELBL_0193
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020193 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020193 end');
    })

    /**
     * @tc.name   testParseLabel020194
     * @tc.number SUB_ASSET_PARSELBL_0194
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020194 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020194 end');
    })

    /**
     * @tc.name   testParseLabel020195
     * @tc.number SUB_ASSET_PARSELBL_0195
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020195 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020195 end');
    })

    /**
     * @tc.name   testParseLabel020196
     * @tc.number SUB_ASSET_PARSELBL_0196
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020196 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020196 end');
    })

    /**
     * @tc.name   testParseLabel020197
     * @tc.number SUB_ASSET_PARSELBL_0197
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020197 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020197 end');
    })

    /**
     * @tc.name   testParseLabel020198
     * @tc.number SUB_ASSET_PARSELBL_0198
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020198 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020198 end');
    })

    /**
     * @tc.name   testParseLabel020199
     * @tc.number SUB_ASSET_PARSELBL_0199
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020199 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020199 end');
    })

    /**
     * @tc.name   testParseLabel020200
     * @tc.number SUB_ASSET_PARSELBL_0200
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020200 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020200 end');
    })

    /**
     * @tc.name   testParseLabel020201
     * @tc.number SUB_ASSET_PARSELBL_0201
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020201 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020201 end');
    })

    /**
     * @tc.name   testParseLabel020202
     * @tc.number SUB_ASSET_PARSELBL_0202
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020202 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020202 end');
    })

    /**
     * @tc.name   testParseLabel020203
     * @tc.number SUB_ASSET_PARSELBL_0203
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020203 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020203 end');
    })

    /**
     * @tc.name   testParseLabel020204
     * @tc.number SUB_ASSET_PARSELBL_0204
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020204 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020204 end');
    })

    /**
     * @tc.name   testParseLabel020205
     * @tc.number SUB_ASSET_PARSELBL_0205
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020205 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020205 end');
    })

    /**
     * @tc.name   testParseLabel020206
     * @tc.number SUB_ASSET_PARSELBL_0206
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020206 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020206 end');
    })

    /**
     * @tc.name   testParseLabel020207
     * @tc.number SUB_ASSET_PARSELBL_0207
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020207 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020207 end');
    })

    /**
     * @tc.name   testParseLabel020208
     * @tc.number SUB_ASSET_PARSELBL_0208
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020208 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020208 end');
    })

    /**
     * @tc.name   testParseLabel020209
     * @tc.number SUB_ASSET_PARSELBL_0209
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020209 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020209 end');
    })

    /**
     * @tc.name   testParseLabel020210
     * @tc.number SUB_ASSET_PARSELBL_0210
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020210 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020210 end');
    })

    /**
     * @tc.name   testParseLabel020211
     * @tc.number SUB_ASSET_PARSELBL_0211
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020211 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020211 end');
    })

    /**
     * @tc.name   testParseLabel020212
     * @tc.number SUB_ASSET_PARSELBL_0212
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020212 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020212 end');
    })

    /**
     * @tc.name   testParseLabel020213
     * @tc.number SUB_ASSET_PARSELBL_0213
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020213 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020213 end');
    })

    /**
     * @tc.name   testParseLabel020214
     * @tc.number SUB_ASSET_PARSELBL_0214
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020214 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020214 end');
    })

    /**
     * @tc.name   testParseLabel020215
     * @tc.number SUB_ASSET_PARSELBL_0215
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020215 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020215 end');
    })

    /**
     * @tc.name   testParseLabel020216
     * @tc.number SUB_ASSET_PARSELBL_0216
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020216 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020216 end');
    })

    /**
     * @tc.name   testParseLabel020217
     * @tc.number SUB_ASSET_PARSELBL_0217
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020217 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020217 end');
    })

    /**
     * @tc.name   testParseLabel020218
     * @tc.number SUB_ASSET_PARSELBL_0218
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020218 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020218 end');
    })

    /**
     * @tc.name   testParseLabel020219
     * @tc.number SUB_ASSET_PARSELBL_0219
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020219 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020219 end');
    })

    /**
     * @tc.name   testParseLabel020220
     * @tc.number SUB_ASSET_PARSELBL_0220
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020220 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020220 end');
    })

    /**
     * @tc.name   testParseLabel020221
     * @tc.number SUB_ASSET_PARSELBL_0221
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020221 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020221 end');
    })

    /**
     * @tc.name   testParseLabel020222
     * @tc.number SUB_ASSET_PARSELBL_0222
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020222 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020222 end');
    })

    /**
     * @tc.name   testParseLabel020223
     * @tc.number SUB_ASSET_PARSELBL_0223
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020223 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020223 end');
    })

    /**
     * @tc.name   testParseLabel020224
     * @tc.number SUB_ASSET_PARSELBL_0224
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020224 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020224 end');
    })

    /**
     * @tc.name   testParseLabel020225
     * @tc.number SUB_ASSET_PARSELBL_0225
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020225 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020225 end');
    })

    /**
     * @tc.name   testParseLabel020226
     * @tc.number SUB_ASSET_PARSELBL_0226
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020226 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020226 end');
    })

    /**
     * @tc.name   testParseLabel020227
     * @tc.number SUB_ASSET_PARSELBL_0227
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020227 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020227 end');
    })

    /**
     * @tc.name   testParseLabel020228
     * @tc.number SUB_ASSET_PARSELBL_0228
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020228 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020228 end');
    })

    /**
     * @tc.name   testParseLabel020229
     * @tc.number SUB_ASSET_PARSELBL_0229
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020229 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020229 end');
    })

    /**
     * @tc.name   testParseLabel020230
     * @tc.number SUB_ASSET_PARSELBL_0230
     * @tc.desc   合法值：双标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020230 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020230 end');
    })

    /**
     * @tc.name   testParseLabel020231
     * @tc.number SUB_ASSET_PARSELBL_0231
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020231 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020231 end');
    })

    /**
     * @tc.name   testParseLabel020232
     * @tc.number SUB_ASSET_PARSELBL_0232
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020232 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020232 end');
    })

    /**
     * @tc.name   testParseLabel020233
     * @tc.number SUB_ASSET_PARSELBL_0233
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020233 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020233 end');
    })

    /**
     * @tc.name   testParseLabel020234
     * @tc.number SUB_ASSET_PARSELBL_0234
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020234 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020234 end');
    })

    /**
     * @tc.name   testParseLabel020235
     * @tc.number SUB_ASSET_PARSELBL_0235
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020235 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020235 end');
    })

    /**
     * @tc.name   testParseLabel020236
     * @tc.number SUB_ASSET_PARSELBL_0236
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020236 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020236 end');
    })

    /**
     * @tc.name   testParseLabel020237
     * @tc.number SUB_ASSET_PARSELBL_0237
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020237 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020237 end');
    })

    /**
     * @tc.name   testParseLabel020238
     * @tc.number SUB_ASSET_PARSELBL_0238
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020238 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020238 end');
    })

    /**
     * @tc.name   testParseLabel020239
     * @tc.number SUB_ASSET_PARSELBL_0239
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020239 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020239 end');
    })

    /**
     * @tc.name   testParseLabel020240
     * @tc.number SUB_ASSET_PARSELBL_0240
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020240 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020240 end');
    })

    /**
     * @tc.name   testParseLabel020241
     * @tc.number SUB_ASSET_PARSELBL_0241
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020241 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020241 end');
    })

    /**
     * @tc.name   testParseLabel020242
     * @tc.number SUB_ASSET_PARSELBL_0242
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020242 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020242 end');
    })

    /**
     * @tc.name   testParseLabel020243
     * @tc.number SUB_ASSET_PARSELBL_0243
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020243 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020243 end');
    })

    /**
     * @tc.name   testParseLabel020244
     * @tc.number SUB_ASSET_PARSELBL_0244
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020244 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020244 end');
    })

    /**
     * @tc.name   testParseLabel020245
     * @tc.number SUB_ASSET_PARSELBL_0245
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020245 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020245 end');
    })

    /**
     * @tc.name   testParseLabel020246
     * @tc.number SUB_ASSET_PARSELBL_0246
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020246 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020246 end');
    })

    /**
     * @tc.name   testParseLabel020247
     * @tc.number SUB_ASSET_PARSELBL_0247
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020247 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020247 end');
    })

    /**
     * @tc.name   testParseLabel020248
     * @tc.number SUB_ASSET_PARSELBL_0248
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020248 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020248 end');
    })

    /**
     * @tc.name   testParseLabel020249
     * @tc.number SUB_ASSET_PARSELBL_0249
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020249 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020249 end');
    })

    /**
     * @tc.name   testParseLabel020250
     * @tc.number SUB_ASSET_PARSELBL_0250
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020250 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020250 end');
    })

    /**
     * @tc.name   testParseLabel020251
     * @tc.number SUB_ASSET_PARSELBL_0251
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020251 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020251 end');
    })

    /**
     * @tc.name   testParseLabel020252
     * @tc.number SUB_ASSET_PARSELBL_0252
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020252 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020252 end');
    })

    /**
     * @tc.name   testParseLabel020253
     * @tc.number SUB_ASSET_PARSELBL_0253
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020253 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020253 end');
    })

    /**
     * @tc.name   testParseLabel020254
     * @tc.number SUB_ASSET_PARSELBL_0254
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020254 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020254 end');
    })

    /**
     * @tc.name   testParseLabel020255
     * @tc.number SUB_ASSET_PARSELBL_0255
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020255 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020255 end');
    })

    /**
     * @tc.name   testParseLabel020256
     * @tc.number SUB_ASSET_PARSELBL_0256
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020256 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020256 end');
    })

    /**
     * @tc.name   testParseLabel020257
     * @tc.number SUB_ASSET_PARSELBL_0257
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020257 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020257 end');
    })

    /**
     * @tc.name   testParseLabel020258
     * @tc.number SUB_ASSET_PARSELBL_0258
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020258 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020258 end');
    })

    /**
     * @tc.name   testParseLabel020259
     * @tc.number SUB_ASSET_PARSELBL_0259
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020259 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020259 end');
    })

    /**
     * @tc.name   testParseLabel020260
     * @tc.number SUB_ASSET_PARSELBL_0260
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020260 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020260 end');
    })

    /**
     * @tc.name   testParseLabel020261
     * @tc.number SUB_ASSET_PARSELBL_0261
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020261 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020261 end');
    })

    /**
     * @tc.name   testParseLabel020262
     * @tc.number SUB_ASSET_PARSELBL_0262
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020262 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020262 end');
    })

    /**
     * @tc.name   testParseLabel020263
     * @tc.number SUB_ASSET_PARSELBL_0263
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020263 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020263 end');
    })

    /**
     * @tc.name   testParseLabel020264
     * @tc.number SUB_ASSET_PARSELBL_0264
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020264 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020264 end');
    })

    /**
     * @tc.name   testParseLabel020265
     * @tc.number SUB_ASSET_PARSELBL_0265
     * @tc.desc   合法值：三标签 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020265 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020265 end');
    })

    /**
     * @tc.name   testParseLabel020266
     * @tc.number SUB_ASSET_PARSELBL_0266
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020266 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020266 end');
    })

    /**
     * @tc.name   testParseLabel020267
     * @tc.number SUB_ASSET_PARSELBL_0267
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020267 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020267 end');
    })

    /**
     * @tc.name   testParseLabel020268
     * @tc.number SUB_ASSET_PARSELBL_0268
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020268 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020268 end');
    })

    /**
     * @tc.name   testParseLabel020269
     * @tc.number SUB_ASSET_PARSELBL_0269
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020269 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020269 end');
    })

    /**
     * @tc.name   testParseLabel020270
     * @tc.number SUB_ASSET_PARSELBL_0270
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020270 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020270 end');
    })

    /**
     * @tc.name   testParseLabel020271
     * @tc.number SUB_ASSET_PARSELBL_0271
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020271 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020271 end');
    })

    /**
     * @tc.name   testParseLabel020272
     * @tc.number SUB_ASSET_PARSELBL_0272
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020272 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020272 end');
    })

    /**
     * @tc.name   testParseLabel020273
     * @tc.number SUB_ASSET_PARSELBL_0273
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020273 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020273 end');
    })

    /**
     * @tc.name   testParseLabel020274
     * @tc.number SUB_ASSET_PARSELBL_0274
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020274 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020274 end');
    })

    /**
     * @tc.name   testParseLabel020275
     * @tc.number SUB_ASSET_PARSELBL_0275
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020275 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020275 end');
    })

    /**
     * @tc.name   testParseLabel020276
     * @tc.number SUB_ASSET_PARSELBL_0276
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020276 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020276 end');
    })

    /**
     * @tc.name   testParseLabel020277
     * @tc.number SUB_ASSET_PARSELBL_0277
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020277 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020277 end');
    })

    /**
     * @tc.name   testParseLabel020278
     * @tc.number SUB_ASSET_PARSELBL_0278
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020278 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020278 end');
    })

    /**
     * @tc.name   testParseLabel020279
     * @tc.number SUB_ASSET_PARSELBL_0279
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020279 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020279 end');
    })

    /**
     * @tc.name   testParseLabel020280
     * @tc.number SUB_ASSET_PARSELBL_0280
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020280 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020280 end');
    })

    /**
     * @tc.name   testParseLabel020281
     * @tc.number SUB_ASSET_PARSELBL_0281
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020281 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020281 end');
    })

    /**
     * @tc.name   testParseLabel020282
     * @tc.number SUB_ASSET_PARSELBL_0282
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020282 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020282 end');
    })

    /**
     * @tc.name   testParseLabel020283
     * @tc.number SUB_ASSET_PARSELBL_0283
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020283 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020283 end');
    })

    /**
     * @tc.name   testParseLabel020284
     * @tc.number SUB_ASSET_PARSELBL_0284
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020284 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020284 end');
    })

    /**
     * @tc.name   testParseLabel020285
     * @tc.number SUB_ASSET_PARSELBL_0285
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020285 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020285 end');
    })

    /**
     * @tc.name   testParseLabel020286
     * @tc.number SUB_ASSET_PARSELBL_0286
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020286 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020286 end');
    })

    /**
     * @tc.name   testParseLabel020287
     * @tc.number SUB_ASSET_PARSELBL_0287
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020287 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020287 end');
    })

    /**
     * @tc.name   testParseLabel020288
     * @tc.number SUB_ASSET_PARSELBL_0288
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020288 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020288 end');
    })

    /**
     * @tc.name   testParseLabel020289
     * @tc.number SUB_ASSET_PARSELBL_0289
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020289 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020289 end');
    })

    /**
     * @tc.name   testParseLabel020290
     * @tc.number SUB_ASSET_PARSELBL_0290
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020290 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020290 end');
    })

    /**
     * @tc.name   testParseLabel020291
     * @tc.number SUB_ASSET_PARSELBL_0291
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020291 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020291 end');
    })

    /**
     * @tc.name   testParseLabel020292
     * @tc.number SUB_ASSET_PARSELBL_0292
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020292 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020292 end');
    })

    /**
     * @tc.name   testParseLabel020293
     * @tc.number SUB_ASSET_PARSELBL_0293
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020293 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020293 end');
    })

    /**
     * @tc.name   testParseLabel020294
     * @tc.number SUB_ASSET_PARSELBL_0294
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020294 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020294 end');
    })

    /**
     * @tc.name   testParseLabel020295
     * @tc.number SUB_ASSET_PARSELBL_0295
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020295 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020295 end');
    })

    /**
     * @tc.name   testParseLabel020296
     * @tc.number SUB_ASSET_PARSELBL_0296
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020296 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020296 end');
    })

    /**
     * @tc.name   testParseLabel020297
     * @tc.number SUB_ASSET_PARSELBL_0297
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020297 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020297 end');
    })

    /**
     * @tc.name   testParseLabel020298
     * @tc.number SUB_ASSET_PARSELBL_0298
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020298 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020298 end');
    })

    /**
     * @tc.name   testParseLabel020299
     * @tc.number SUB_ASSET_PARSELBL_0299
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020299 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020299 end');
    })

    /**
     * @tc.name   testParseLabel020300
     * @tc.number SUB_ASSET_PARSELBL_0300
     * @tc.desc   边界值：四标签上界 Map 解析按序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLabel020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020300 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseLabel020300 end');
    })

  })
}
