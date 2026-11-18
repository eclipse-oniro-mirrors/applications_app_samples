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

/**
 * 元数据字段与搜索命中的交叉矩阵。
 *
 * 搜索框会拿用户输入去比对五个字段，因此关键字表里既有接口名片段、也有中文说明片段，
 * 还有大小写与首尾空格的变体；字段契约则逐个锁定，避免文案改动影响页面标题。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  PROFILE_METAS,
  ProfileKind,
  ProfileMeta,
  createFunctionOf,
  filterProfiles,
  hfpRoleName,
  isProfileKind,
  metaOf
} from '../../../main/ets/model/ProfileCatalog';

export default function bluetoothProfileCatalogCrossTest() {
  describe('BluetoothProfileCatalogCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0001
     * @tc.name catalogCross0001
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'empty'.
     */
    it('catalogCross0001', 0, () => {
      const result: ProfileMeta[] = filterProfiles('');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0002
     * @tc.name catalogCross0002
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword ''.
     */
    it('catalogCross0002', 0, () => {
      const result: ProfileMeta[] = filterProfiles(' ');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0003
     * @tc.name catalogCross0003
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword ''.
     */
    it('catalogCross0003', 0, () => {
      const result: ProfileMeta[] = filterProfiles('  ');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0004
     * @tc.name catalogCross0004
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'h'.
     */
    it('catalogCross0004', 0, () => {
      const result: ProfileMeta[] = filterProfiles('h');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0005
     * @tc.name catalogCross0005
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'H'.
     */
    it('catalogCross0005', 0, () => {
      const result: ProfileMeta[] = filterProfiles('H');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0006
     * @tc.name catalogCross0006
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'hf'.
     */
    it('catalogCross0006', 0, () => {
      const result: ProfileMeta[] = filterProfiles('hf');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0007
     * @tc.name catalogCross0007
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'hfp'.
     */
    it('catalogCross0007', 0, () => {
      const result: ProfileMeta[] = filterProfiles('hfp');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0008
     * @tc.name catalogCross0008
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'HFP'.
     */
    it('catalogCross0008', 0, () => {
      const result: ProfileMeta[] = filterProfiles('HFP');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0009
     * @tc.name catalogCross0009
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'Hfp'.
     */
    it('catalogCross0009', 0, () => {
      const result: ProfileMeta[] = filterProfiles('Hfp');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0010
     * @tc.name catalogCross0010
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'hfps'.
     */
    it('catalogCross0010', 0, () => {
      const result: ProfileMeta[] = filterProfiles('hfps');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0011
     * @tc.name catalogCross0011
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'hfp'.
     */
    it('catalogCross0011', 0, () => {
      const result: ProfileMeta[] = filterProfiles('hfp ');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0012
     * @tc.name catalogCross0012
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'hfp'.
     */
    it('catalogCross0012', 0, () => {
      const result: ProfileMeta[] = filterProfiles('  hfp');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0013
     * @tc.name catalogCross0013
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'ag'.
     */
    it('catalogCross0013', 0, () => {
      const result: ProfileMeta[] = filterProfiles('ag');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0014
     * @tc.name catalogCross0014
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'AG'.
     */
    it('catalogCross0014', 0, () => {
      const result: ProfileMeta[] = filterProfiles('AG');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0015
     * @tc.name catalogCross0015
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'audio'.
     */
    it('catalogCross0015', 0, () => {
      const result: ProfileMeta[] = filterProfiles('audio');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0016
     * @tc.name catalogCross0016
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'Audio'.
     */
    it('catalogCross0016', 0, () => {
      const result: ProfileMeta[] = filterProfiles('Audio');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0017
     * @tc.name catalogCross0017
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'gateway'.
     */
    it('catalogCross0017', 0, () => {
      const result: ProfileMeta[] = filterProfiles('gateway');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0018
     * @tc.name catalogCross0018
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'Gateway'.
     */
    it('catalogCross0018', 0, () => {
      const result: ProfileMeta[] = filterProfiles('Gateway');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0019
     * @tc.name catalogCross0019
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'audio gateway'.
     */
    it('catalogCross0019', 0, () => {
      const result: ProfileMeta[] = filterProfiles('audio gateway');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0020
     * @tc.name catalogCross0020
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'handsfree'.
     */
    it('catalogCross0020', 0, () => {
      const result: ProfileMeta[] = filterProfiles('handsfree');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0021
     * @tc.name catalogCross0021
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'HandsFree'.
     */
    it('catalogCross0021', 0, () => {
      const result: ProfileMeta[] = filterProfiles('HandsFree');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0022
     * @tc.name catalogCross0022
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'handsfreeaudiogatewayprofile'.
     */
    it('catalogCross0022', 0, () => {
      const result: ProfileMeta[] = filterProfiles('handsfreeaudiogatewayprofile');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0023
     * @tc.name catalogCross0023
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'js-apis'.
     */
    it('catalogCross0023', 0, () => {
      const result: ProfileMeta[] = filterProfiles('js-apis');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0024
     * @tc.name catalogCross0024
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'js-apis-bluetooth-hfp.md'.
     */
    it('catalogCross0024', 0, () => {
      const result: ProfileMeta[] = filterProfiles('js-apis-bluetooth-hfp.md');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0025
     * @tc.name catalogCross0025
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'bluetooth'.
     */
    it('catalogCross0025', 0, () => {
      const result: ProfileMeta[] = filterProfiles('bluetooth');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0026
     * @tc.name catalogCross0026
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '@ohos'.
     */
    it('catalogCross0026', 0, () => {
      const result: ProfileMeta[] = filterProfiles('@ohos');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0027
     * @tc.name catalogCross0027
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '@ohos.bluetooth.hfp'.
     */
    it('catalogCross0027', 0, () => {
      const result: ProfileMeta[] = filterProfiles('@ohos.bluetooth.hfp');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0028
     * @tc.name catalogCross0028
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'create'.
     */
    it('catalogCross0028', 0, () => {
      const result: ProfileMeta[] = filterProfiles('create');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0029
     * @tc.name catalogCross0029
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'createhfpgprofile'.
     */
    it('catalogCross0029', 0, () => {
      const result: ProfileMeta[] = filterProfiles('createhfpgprofile');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0030
     * @tc.name catalogCross0030
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'createhfpagprofile'.
     */
    it('catalogCross0030', 0, () => {
      const result: ProfileMeta[] = filterProfiles('createhfpagprofile');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0031
     * @tc.name catalogCross0031
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'profile'.
     */
    it('catalogCross0031', 0, () => {
      const result: ProfileMeta[] = filterProfiles('profile');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0032
     * @tc.name catalogCross0032
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'hfp.'.
     */
    it('catalogCross0032', 0, () => {
      const result: ProfileMeta[] = filterProfiles('hfp.');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0033
     * @tc.name catalogCross0033
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword '()'.
     */
    it('catalogCross0033', 0, () => {
      const result: ProfileMeta[] = filterProfiles('()');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0034
     * @tc.name catalogCross0034
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '通话'.
     */
    it('catalogCross0034', 0, () => {
      const result: ProfileMeta[] = filterProfiles('通话');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0035
     * @tc.name catalogCross0035
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '音频'.
     */
    it('catalogCross0035', 0, () => {
      const result: ProfileMeta[] = filterProfiles('音频');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0036
     * @tc.name catalogCross0036
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '免提'.
     */
    it('catalogCross0036', 0, () => {
      const result: ProfileMeta[] = filterProfiles('免提');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0037
     * @tc.name catalogCross0037
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '耳机'.
     */
    it('catalogCross0037', 0, () => {
      const result: ProfileMeta[] = filterProfiles('耳机');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0038
     * @tc.name catalogCross0038
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '车机'.
     */
    it('catalogCross0038', 0, () => {
      const result: ProfileMeta[] = filterProfiles('车机');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0039
     * @tc.name catalogCross0039
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '接入'.
     */
    it('catalogCross0039', 0, () => {
      const result: ProfileMeta[] = filterProfiles('接入');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0040
     * @tc.name catalogCross0040
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '查询'.
     */
    it('catalogCross0040', 0, () => {
      const result: ProfileMeta[] = filterProfiles('查询');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0041
     * @tc.name catalogCross0041
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '连接状态'.
     */
    it('catalogCross0041', 0, () => {
      const result: ProfileMeta[] = filterProfiles('连接状态');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0042
     * @tc.name catalogCross0042
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword '模块'.
     */
    it('catalogCross0042', 0, () => {
      const result: ProfileMeta[] = filterProfiles('模块');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0043
     * @tc.name catalogCross0043
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword '入口'.
     */
    it('catalogCross0043', 0, () => {
      const result: ProfileMeta[] = filterProfiles('入口');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0044
     * @tc.name catalogCross0044
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'baseprofile'.
     */
    it('catalogCross0044', 0, () => {
      const result: ProfileMeta[] = filterProfiles('baseprofile');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0045
     * @tc.name catalogCross0045
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'BaseProfile'.
     */
    it('catalogCross0045', 0, () => {
      const result: ProfileMeta[] = filterProfiles('BaseProfile');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0046
     * @tc.name catalogCross0046
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'pan'.
     */
    it('catalogCross0046', 0, () => {
      const result: ProfileMeta[] = filterProfiles('pan');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0047
     * @tc.name catalogCross0047
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword 'map'.
     */
    it('catalogCross0047', 0, () => {
      const result: ProfileMeta[] = filterProfiles('map');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0048
     * @tc.name catalogCross0048
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'hf'.
     */
    it('catalogCross0048', 0, () => {
      const result: ProfileMeta[] = filterProfiles('hf');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0049
     * @tc.name catalogCross0049
     * @tc.desc Verify filterProfiles keeps 0 entry for the keyword '示例'.
     */
    it('catalogCross0049', 0, () => {
      const result: ProfileMeta[] = filterProfiles('示例');
      expect(result.length).assertEqual(0);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0050
     * @tc.name catalogCross0050
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword '。'.
     */
    it('catalogCross0050', 0, () => {
      const result: ProfileMeta[] = filterProfiles('。');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0051
     * @tc.name catalogCross0051
     * @tc.desc Verify filterProfiles keeps 1 entry for the keyword 'HFP 通话'.
     */
    it('catalogCross0051', 0, () => {
      const result: ProfileMeta[] = filterProfiles('HFP 通话');
      expect(result.length).assertEqual(1);
      expect(result.length <= PROFILE_METAS.length).assertTrue();
      expect(result.length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0052
     * @tc.name catalogCross0052
     * @tc.desc Verify the catalog code stays the lowercase route key used by the demo entry.
     */
    it('catalogCross0052', 0, () => {
      const meta: ProfileMeta = metaOf(ProfileKind.HFP);
      expect(meta.code).assertEqual('HFP');
      expect(meta.code.toLowerCase()).assertEqual('hfp');
      expect(isProfileKind('hfp')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0053
     * @tc.name catalogCross0053
     * @tc.desc Verify the api name matches the module that exports the AG entry.
     */
    it('catalogCross0053', 0, () => {
      const meta: ProfileMeta = metaOf(ProfileKind.HFP);
      expect(meta.apiName).assertEqual('@ohos.bluetooth.hfp');
      expect(meta.apiName.indexOf('bluetooth') >= 0).assertTrue();
      expect(meta.apiName.length).assertEqual(19);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0054
     * @tc.name catalogCross0054
     * @tc.desc Verify the title names both the profile and the audio gateway duty.
     */
    it('catalogCross0054', 0, () => {
      const meta: ProfileMeta = metaOf(ProfileKind.HFP);
      expect(meta.title).assertEqual('HFP 通话音频网关');
      expect(meta.title.indexOf('HFP') === 0).assertTrue();
      expect(meta.title.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0055
     * @tc.name catalogCross0055
     * @tc.desc Verify the role keeps the AG wording after the HF role was removed.
     */
    it('catalogCross0055', 0, () => {
      const meta: ProfileMeta = metaOf(ProfileKind.HFP);
      expect(meta.role).assertEqual('Audio Gateway（AG）');
      expect(meta.role.indexOf('AG') >= 0).assertTrue();
      expect(meta.role.toLowerCase().indexOf('hf）') === -1).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0056
     * @tc.name catalogCross0056
     * @tc.desc Verify the interface name is the AG class that the docs link to.
     */
    it('catalogCross0056', 0, () => {
      const meta: ProfileMeta = metaOf(ProfileKind.HFP);
      expect(meta.interfaceName).assertEqual('HandsFreeAudioGatewayProfile');
      expect(meta.interfaceName.indexOf('Gateway') >= 0).assertTrue();
      expect(meta.interfaceName.length).assertEqual(28);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0057
     * @tc.name catalogCross0057
     * @tc.desc Verify the create function string is callable syntax with parentheses.
     */
    it('catalogCross0057', 0, () => {
      const meta: ProfileMeta = metaOf(ProfileKind.HFP);
      expect(meta.createFunction).assertEqual('hfp.createHfpAgProfile()');
      expect(meta.createFunction.indexOf('()') >= 0).assertTrue();
      expect(createFunctionOf(ProfileKind.HFP)).assertEqual('hfp.createHfpAgProfile()');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0058
     * @tc.name catalogCross0058
     * @tc.desc Verify the profile id is the HFP service id from the bluetooth constant table.
     */
    it('catalogCross0058', 0, () => {
      const meta: ProfileMeta = metaOf(ProfileKind.HFP);
      expect(meta.profileId).assertEqual(4);
      expect(meta.profileId > 0).assertTrue();
      expect(meta.profileId < 100).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0059
     * @tc.name catalogCross0059
     * @tc.desc Verify the doc page points at the hfp api reference file.
     */
    it('catalogCross0059', 0, () => {
      const meta: ProfileMeta = metaOf(ProfileKind.HFP);
      expect(meta.docPage).assertEqual('js-apis-bluetooth-hfp.md');
      expect(meta.docPage.indexOf('hfp') >= 0).assertTrue();
      expect(meta.docPage.indexOf('js-apis') === 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0060
     * @tc.name catalogCross0060
     * @tc.desc Verify the summary describes the AG duty and the device that can connect.
     */
    it('catalogCross0060', 0, () => {
      const meta: ProfileMeta = metaOf(ProfileKind.HFP);
      expect(meta.summary).assertEqual('以 AG 角色对外提供免提通话能力，耳机、车机作为 HF 端接入后可查询连接状态。');
      expect(meta.summary.indexOf('AG') >= 0).assertTrue();
      expect(meta.summary.length).assertEqual(41);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0061
     * @tc.name catalogCross0061
     * @tc.desc Verify the note points callers at BaseProfile for the link capability.
     */
    it('catalogCross0061', 0, () => {
      const meta: ProfileMeta = metaOf(ProfileKind.HFP);
      expect(meta.note).assertEqual('模块只提供 createHfpAgProfile 一个入口，链路能力全部来自 BaseProfile。');
      expect(meta.note.indexOf('BaseProfile') >= 0).assertTrue();
      expect(meta.note.length).assertEqual(51);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0062
     * @tc.name catalogCross0062
     * @tc.desc Verify the only remaining kind is hfp and the enumeration has one member.
     */
    it('catalogCross0062', 0, () => {
      expect(ProfileKind.HFP).assertEqual('hfp');
      expect(isProfileKind('HFP')).assertFalse();
      expect(isProfileKind('pan')).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0063
     * @tc.name catalogCross0063
     * @tc.desc Verify metaOf and createFunctionOf agree for the single remaining kind.
     */
    it('catalogCross0063', 0, () => {
      expect(metaOf(ProfileKind.HFP).createFunction).assertEqual(createFunctionOf(ProfileKind.HFP));
      expect(metaOf(ProfileKind.HFP).kind).assertEqual(ProfileKind.HFP);
      expect(createFunctionOf(ProfileKind.HFP).indexOf('hfp') === 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0064
     * @tc.name catalogCross0064
     * @tc.desc Verify the role name helper still returns the AG wording for the page header.
     */
    it('catalogCross0064', 0, () => {
      expect(hfpRoleName()).assertEqual('AG（音频网关）');
      expect(hfpRoleName().indexOf('AG') === 0).assertTrue();
      expect(hfpRoleName().length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_CROSS_0065
     * @tc.name catalogCross0065
     * @tc.desc Verify the catalog holds exactly the HFP entry now that pan and map are gone.
     */
    it('catalogCross0065', 0, () => {
      expect(PROFILE_METAS.length).assertEqual(1);
      expect(PROFILE_METAS[0].kind).assertEqual(ProfileKind.HFP);
      expect(PROFILE_METAS[0].code.toLowerCase() === 'pan').assertFalse();
    });
  });
}
