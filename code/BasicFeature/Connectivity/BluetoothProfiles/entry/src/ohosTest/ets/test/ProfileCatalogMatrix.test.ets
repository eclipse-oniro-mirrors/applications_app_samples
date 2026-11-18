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
 * Profile 目录与首页检索矩阵。
 *
 * 演示面收敛为单一 HFP 之后，目录只剩下一条元数据，因此这里逐字段锁定元数据内容，
 * 并对 isProfileKind 与 filterProfiles 做全量关键字对照，确保已删除的 PAN / MAP / HF 字样
 * 不会再从任何字段被检索出来。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  PROFILE_METAS,
  ProfileKind,
  createFunctionOf,
  filterProfiles,
  hfpRoleName,
  isProfileKind,
  metaOf
} from '../../../main/ets/model/ProfileCatalog';

export default function bluetoothProfileCatalogMatrixTest() {
  describe('BluetoothProfileCatalogMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0001
     * @tc.name catalogMatrix0001
     * @tc.desc Verify the HFP metadata keeps the expected short code.
     */
    it('catalogMatrix0001', 0, () => {
      const value: string = metaOf(ProfileKind.HFP).code;
      expect(value).assertEqual('HFP');
      expect(value.length).assertEqual(3);
      expect(PROFILE_METAS[0].code).assertEqual(value);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0002
     * @tc.name catalogMatrix0002
     * @tc.desc Verify the HFP metadata keeps the expected module name.
     */
    it('catalogMatrix0002', 0, () => {
      const value: string = metaOf(ProfileKind.HFP).apiName;
      expect(value).assertEqual('@ohos.bluetooth.hfp');
      expect(value.length).assertEqual(19);
      expect(PROFILE_METAS[0].apiName).assertEqual(value);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0003
     * @tc.name catalogMatrix0003
     * @tc.desc Verify the HFP metadata keeps the expected page title.
     */
    it('catalogMatrix0003', 0, () => {
      const value: string = metaOf(ProfileKind.HFP).title;
      expect(value).assertEqual('HFP 通话音频网关');
      expect(value.length).assertEqual(10);
      expect(PROFILE_METAS[0].title).assertEqual(value);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0004
     * @tc.name catalogMatrix0004
     * @tc.desc Verify the HFP metadata keeps the expected profile role.
     */
    it('catalogMatrix0004', 0, () => {
      const value: string = metaOf(ProfileKind.HFP).role;
      expect(value).assertEqual('Audio Gateway（AG）');
      expect(value.length).assertEqual(17);
      expect(PROFILE_METAS[0].role).assertEqual(value);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0005
     * @tc.name catalogMatrix0005
     * @tc.desc Verify the HFP metadata keeps the expected interface name.
     */
    it('catalogMatrix0005', 0, () => {
      const value: string = metaOf(ProfileKind.HFP).interfaceName;
      expect(value).assertEqual('HandsFreeAudioGatewayProfile');
      expect(value.length).assertEqual(28);
      expect(PROFILE_METAS[0].interfaceName).assertEqual(value);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0006
     * @tc.name catalogMatrix0006
     * @tc.desc Verify the HFP metadata keeps the expected create entry.
     */
    it('catalogMatrix0006', 0, () => {
      const value: string = metaOf(ProfileKind.HFP).createFunction;
      expect(value).assertEqual('hfp.createHfpAgProfile()');
      expect(value.length).assertEqual(24);
      expect(PROFILE_METAS[0].createFunction).assertEqual(value);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0007
     * @tc.name catalogMatrix0007
     * @tc.desc Verify the HFP metadata keeps the expected doc page.
     */
    it('catalogMatrix0007', 0, () => {
      const value: string = metaOf(ProfileKind.HFP).docPage;
      expect(value).assertEqual('js-apis-bluetooth-hfp.md');
      expect(value.length).assertEqual(24);
      expect(PROFILE_METAS[0].docPage).assertEqual(value);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0008
     * @tc.name catalogMatrix0008
     * @tc.desc Verify the HFP metadata keeps the expected summary text.
     */
    it('catalogMatrix0008', 0, () => {
      const value: string = metaOf(ProfileKind.HFP).summary;
      expect(value).assertEqual('以 AG 角色对外提供免提通话能力，耳机、车机作为 HF 端接入后可查询连接状态。');
      expect(value.length).assertEqual(41);
      expect(PROFILE_METAS[0].summary).assertEqual(value);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0009
     * @tc.name catalogMatrix0009
     * @tc.desc Verify the HFP metadata keeps the expected note text.
     */
    it('catalogMatrix0009', 0, () => {
      const value: string = metaOf(ProfileKind.HFP).note;
      expect(value).assertEqual('模块只提供 createHfpAgProfile 一个入口，链路能力全部来自 BaseProfile。');
      expect(value.length).assertEqual(51);
      expect(PROFILE_METAS[0].note).assertEqual(value);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0010
     * @tc.name catalogMatrix0010
     * @tc.desc Verify the HFP metadata pins profileId 4 and exposes a single catalog entry.
     */
    it('catalogMatrix0010', 0, () => {
      expect(metaOf(ProfileKind.HFP).profileId).assertEqual(4);
      expect(PROFILE_METAS.length).assertEqual(1);
      expect(PROFILE_METAS[0].profileId).assertEqual(4);
      expect(PROFILE_METAS[0].kind).assertEqual(ProfileKind.HFP);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0011
     * @tc.name catalogMatrix0011
     * @tc.desc Verify the create function stays in sync between metadata and factory naming.
     */
    it('catalogMatrix0011', 0, () => {
      expect(createFunctionOf(ProfileKind.HFP)).assertEqual(PROFILE_METAS[0].createFunction);
      expect(createFunctionOf(ProfileKind.HFP)).assertEqual('hfp.createHfpAgProfile()');
      expect(createFunctionOf(ProfileKind.HFP).length).assertEqual(24);
      expect(createFunctionOf(ProfileKind.HFP).indexOf('createHfpAgProfile')).assertEqual(4);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0012
     * @tc.name catalogMatrix0012
     * @tc.desc Verify the AG role name is fixed and differs from the profile short code.
     */
    it('catalogMatrix0012', 0, () => {
      expect(hfpRoleName()).assertEqual('AG（音频网关）');
      expect(hfpRoleName().length).assertEqual('AG（音频网关）'.length);
      expect(hfpRoleName() === metaOf(ProfileKind.HFP).code).assertFalse();
      expect(metaOf(ProfileKind.HFP).role.indexOf('AG') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0013
     * @tc.name catalogMatrix0013
     * @tc.desc Verify metaOf returns the very same catalog entry for the only remaining kind.
     */
    it('catalogMatrix0013', 0, () => {
      expect(metaOf(ProfileKind.HFP) === PROFILE_METAS[0]).assertTrue();
      expect(PROFILE_METAS.length).assertEqual(1);
      expect(PROFILE_METAS[0].code).assertEqual('HFP');
      expect(PROFILE_METAS[0].kind).assertEqual(ProfileKind.HFP);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0014
     * @tc.name catalogMatrix0014
     * @tc.desc Verify isProfileKind returns true and the search keeps 1 entry for this input.
     */
    it('catalogMatrix0014', 0, () => {
      const raw: string = 'hfp';
      expect(isProfileKind(raw)).assertEqual(true);
      expect(filterProfiles(raw).length).assertEqual(1);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0015
     * @tc.name catalogMatrix0015
     * @tc.desc Verify isProfileKind returns false and the search keeps 1 entry for this input.
     */
    it('catalogMatrix0015', 0, () => {
      const raw: string = 'HFP';
      expect(isProfileKind(raw)).assertEqual(false);
      expect(filterProfiles(raw).length).assertEqual(1);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0016
     * @tc.name catalogMatrix0016
     * @tc.desc Verify isProfileKind returns false and the search keeps 1 entry for this input.
     */
    it('catalogMatrix0016', 0, () => {
      const raw: string = 'hfp ';
      expect(isProfileKind(raw)).assertEqual(false);
      expect(filterProfiles(raw).length).assertEqual(1);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0017
     * @tc.name catalogMatrix0017
     * @tc.desc Verify isProfileKind returns false and the search keeps 1 entry for this input.
     */
    it('catalogMatrix0017', 0, () => {
      const raw: string = ' hfp';
      expect(isProfileKind(raw)).assertEqual(false);
      expect(filterProfiles(raw).length).assertEqual(1);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0018
     * @tc.name catalogMatrix0018
     * @tc.desc Verify isProfileKind returns false and the search keeps 0 entry for this input.
     */
    it('catalogMatrix0018', 0, () => {
      const raw: string = 'pan';
      expect(isProfileKind(raw)).assertEqual(false);
      expect(filterProfiles(raw).length).assertEqual(0);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0019
     * @tc.name catalogMatrix0019
     * @tc.desc Verify isProfileKind returns false and the search keeps 0 entry for this input.
     */
    it('catalogMatrix0019', 0, () => {
      const raw: string = 'map';
      expect(isProfileKind(raw)).assertEqual(false);
      expect(filterProfiles(raw).length).assertEqual(0);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0020
     * @tc.name catalogMatrix0020
     * @tc.desc Verify isProfileKind returns false and the search keeps 1 entry for this input.
     */
    it('catalogMatrix0020', 0, () => {
      const raw: string = 'hf';
      expect(isProfileKind(raw)).assertEqual(false);
      expect(filterProfiles(raw).length).assertEqual(1);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0021
     * @tc.name catalogMatrix0021
     * @tc.desc Verify isProfileKind returns false and the search keeps 1 entry for this input.
     */
    it('catalogMatrix0021', 0, () => {
      const raw: string = 'ag';
      expect(isProfileKind(raw)).assertEqual(false);
      expect(filterProfiles(raw).length).assertEqual(1);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0022
     * @tc.name catalogMatrix0022
     * @tc.desc Verify isProfileKind returns false and the search keeps 1 entry for this input.
     */
    it('catalogMatrix0022', 0, () => {
      const raw: string = '';
      expect(isProfileKind(raw)).assertEqual(false);
      expect(filterProfiles(raw).length).assertEqual(1);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0023
     * @tc.name catalogMatrix0023
     * @tc.desc Verify isProfileKind returns false and the search keeps 0 entry for this input.
     */
    it('catalogMatrix0023', 0, () => {
      const raw: string = 'hfp2';
      expect(isProfileKind(raw)).assertEqual(false);
      expect(filterProfiles(raw).length).assertEqual(0);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0024
     * @tc.name catalogMatrix0024
     * @tc.desc Verify isProfileKind returns false and the search keeps 0 entry for this input.
     */
    it('catalogMatrix0024', 0, () => {
      const raw: string = 'hfp/createHfpAgProfile';
      expect(isProfileKind(raw)).assertEqual(false);
      expect(filterProfiles(raw).length).assertEqual(0);
      expect(filterProfiles('  ' + raw + '  ').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0025
     * @tc.name catalogMatrix0025
     * @tc.desc Verify filterProfiles with keyword "code lower" returns one entry.
     */
    it('catalogMatrix0025', 0, () => {
      const keyword: string = 'hfp';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0026
     * @tc.name catalogMatrix0026
     * @tc.desc Verify filterProfiles with keyword "code upper" returns one entry.
     */
    it('catalogMatrix0026', 0, () => {
      const keyword: string = 'HFP';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0027
     * @tc.name catalogMatrix0027
     * @tc.desc Verify filterProfiles with keyword "code with trailing blank" returns one entry.
     */
    it('catalogMatrix0027', 0, () => {
      const keyword: string = 'hfp ';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0028
     * @tc.name catalogMatrix0028
     * @tc.desc Verify filterProfiles with keyword "code with blanks around" returns one entry.
     */
    it('catalogMatrix0028', 0, () => {
      const keyword: string = '  hfp  ';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0029
     * @tc.name catalogMatrix0029
     * @tc.desc Verify filterProfiles with keyword "title chinese" returns one entry.
     */
    it('catalogMatrix0029', 0, () => {
      const keyword: string = '音频';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0030
     * @tc.name catalogMatrix0030
     * @tc.desc Verify filterProfiles with keyword "title chinese word" returns one entry.
     */
    it('catalogMatrix0030', 0, () => {
      const keyword: string = '通话';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0031
     * @tc.name catalogMatrix0031
     * @tc.desc Verify filterProfiles with keyword "role lower" returns one entry.
     */
    it('catalogMatrix0031', 0, () => {
      const keyword: string = 'ag';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0032
     * @tc.name catalogMatrix0032
     * @tc.desc Verify filterProfiles with keyword "role english" returns one entry.
     */
    it('catalogMatrix0032', 0, () => {
      const keyword: string = 'Audio';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0033
     * @tc.name catalogMatrix0033
     * @tc.desc Verify filterProfiles with keyword "role english lower" returns one entry.
     */
    it('catalogMatrix0033', 0, () => {
      const keyword: string = 'gateway';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0034
     * @tc.name catalogMatrix0034
     * @tc.desc Verify filterProfiles with keyword "interface lower" returns one entry.
     */
    it('catalogMatrix0034', 0, () => {
      const keyword: string = 'handsfree';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0035
     * @tc.name catalogMatrix0035
     * @tc.desc Verify filterProfiles with keyword "module fragment" returns one entry.
     */
    it('catalogMatrix0035', 0, () => {
      const keyword: string = 'bluetooth';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0036
     * @tc.name catalogMatrix0036
     * @tc.desc Verify filterProfiles with keyword "module scope" returns one entry.
     */
    it('catalogMatrix0036', 0, () => {
      const keyword: string = '@ohos';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0037
     * @tc.name catalogMatrix0037
     * @tc.desc Verify filterProfiles with keyword "create function" returns zero entry.
     */
    it('catalogMatrix0037', 0, () => {
      const keyword: string = 'createHfpAgProfile';
      expect(filterProfiles(keyword).length).assertEqual(0);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0038
     * @tc.name catalogMatrix0038
     * @tc.desc Verify filterProfiles with keyword "note lower" returns zero entry.
     */
    it('catalogMatrix0038', 0, () => {
      const keyword: string = 'baseprofile';
      expect(filterProfiles(keyword).length).assertEqual(0);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0039
     * @tc.name catalogMatrix0039
     * @tc.desc Verify filterProfiles with keyword "summary chinese" returns one entry.
     */
    it('catalogMatrix0039', 0, () => {
      const keyword: string = '免提';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0040
     * @tc.name catalogMatrix0040
     * @tc.desc Verify filterProfiles with keyword "empty returns all" returns one entry.
     */
    it('catalogMatrix0040', 0, () => {
      const keyword: string = '';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0041
     * @tc.name catalogMatrix0041
     * @tc.desc Verify filterProfiles with keyword "blank returns all" returns one entry.
     */
    it('catalogMatrix0041', 0, () => {
      const keyword: string = '   ';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0042
     * @tc.name catalogMatrix0042
     * @tc.desc Verify filterProfiles with keyword "removed profile" returns zero entry.
     */
    it('catalogMatrix0042', 0, () => {
      const keyword: string = 'pan';
      expect(filterProfiles(keyword).length).assertEqual(0);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0043
     * @tc.name catalogMatrix0043
     * @tc.desc Verify filterProfiles with keyword "removed profile" returns zero entry.
     */
    it('catalogMatrix0043', 0, () => {
      const keyword: string = 'map';
      expect(filterProfiles(keyword).length).assertEqual(0);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0044
     * @tc.name catalogMatrix0044
     * @tc.desc Verify filterProfiles with keyword "removed interface" returns zero entry.
     */
    it('catalogMatrix0044', 0, () => {
      const keyword: string = 'mse';
      expect(filterProfiles(keyword).length).assertEqual(0);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0045
     * @tc.name catalogMatrix0045
     * @tc.desc Verify filterProfiles with keyword "removed pan feature" returns zero entry.
     */
    it('catalogMatrix0045', 0, () => {
      const keyword: string = 'tethering';
      expect(filterProfiles(keyword).length).assertEqual(0);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0046
     * @tc.name catalogMatrix0046
     * @tc.desc Verify filterProfiles with keyword "nonsense" returns zero entry.
     */
    it('catalogMatrix0046', 0, () => {
      const keyword: string = 'zzz';
      expect(filterProfiles(keyword).length).assertEqual(0);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CATALOG_0047
     * @tc.name catalogMatrix0047
     * @tc.desc Verify filterProfiles with keyword "removed hf role" returns zero entry.
     */
    it('catalogMatrix0047', 0, () => {
      const keyword: string = 'hfp.createHfpHfProfile';
      expect(filterProfiles(keyword).length).assertEqual(0);
      expect(filterProfiles(keyword).length).assertEqual(filterProfiles(keyword, PROFILE_METAS).length);
      expect(isProfileKind(keyword.trim().toLowerCase())).assertEqual(false);
    });
  });
}
