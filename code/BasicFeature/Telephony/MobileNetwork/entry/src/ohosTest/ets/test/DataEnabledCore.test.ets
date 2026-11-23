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

// DataEnabledCore 套件：isCellularDataEnabled 无输入域，按类型/值域/契约/状态/组合维度展开。
// 期望只来自 main 冻结契约（成功返回设备开关状态，失败默认 false）。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NetworkMobile } from '../../../../src/main/ets/model/NetworkMobile';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MobileNetwork_DataEnabledCore]';

export default function dataEnabledCoreTest() {
  describe('DataEnabledCoreTest', () => {

    /**
     * @tc.number SUB_MOBILENETWORK_DATAEN_0001
     * @tc.name testDataEnabled0001
     * @tc.desc 合法：返回值为布尔类型且落在 {true,false}，字符串化可还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testDataEnabled0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0001 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const en: boolean = await sut.isCellularDataEnabled();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(en));
      expect(en === true || en === false).assertTrue();
      expect(typeof en).assertEqual('boolean');
      expect(String(en) === 'true' || String(en) === 'false').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0001 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_DATAEN_0002
     * @tc.name testDataEnabled0002
     * @tc.desc 合法：布尔结果数字化为 0/1 且为整数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testDataEnabled0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0002 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const en: boolean = await sut.isCellularDataEnabled();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(en));
      expect(Number(en) === 0 || Number(en) === 1).assertTrue();
      expect(Number.isInteger(Number(en))).assertTrue();
      expect(typeof en).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0002 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_DATAEN_0003
     * @tc.name testDataEnabled0003
     * @tc.desc 组合：数据开关查询与槽位查询交叉调用互不干扰
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataEnabled0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0003 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const en: boolean = await sut.isCellularDataEnabled();
      const slot: number = await sut.getDefaultCellularDataSlotId();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'en=%{public}s slot=%{public}s', String(en), String(slot));
      expect(slot === -1 || slot === 0 || slot === 1).assertTrue();
      expect(en === true || en === false).assertTrue();
      expect(typeof en).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0003 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_DATAEN_0004
     * @tc.name testDataEnabled0004
     * @tc.desc 状态：连续两次查询返回同一个开关状态
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataEnabled0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0004 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const en1: boolean = await sut.isCellularDataEnabled();
      const en2: boolean = await sut.isCellularDataEnabled();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'en1=%{public}s en2=%{public}s', String(en1), String(en2));
      expect(en1 === en2).assertTrue();
      expect(typeof en2).assertEqual('boolean');
      expect(en2 === true || en2 === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0004 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_DATAEN_0005
     * @tc.name testDataEnabled0005
     * @tc.desc 状态：连续三次查询结果两两一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDataEnabled0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0005 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const en1: boolean = await sut.isCellularDataEnabled();
      const en2: boolean = await sut.isCellularDataEnabled();
      const en3: boolean = await sut.isCellularDataEnabled();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'en1=%{public}s en2=%{public}s en3=%{public}s',
        String(en1), String(en2), String(en3));
      expect(en1 === en2).assertTrue();
      expect(en2 === en3).assertTrue();
      expect(en1 === en3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0005 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_DATAEN_0006
     * @tc.name testDataEnabled0006
     * @tc.desc 组合：开关查询与非法槽位漫游查询交叉调用互不干扰
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDataEnabled0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0006 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const en: boolean = await sut.isCellularDataEnabled();
      const roam: boolean = await sut.isCellularDataRoamingEnabled(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'en=%{public}s roam=%{public}s', String(en), String(roam));
      expect(typeof en).assertEqual('boolean');
      expect(roam).assertEqual(false);
      expect(typeof roam).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0006 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_DATAEN_0007
     * @tc.name testDataEnabled0007
     * @tc.desc 组合：开关查询与流量类型查询交叉调用互不干扰，流量资源 id 为正整数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDataEnabled0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0007 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const en: boolean = await sut.isCellularDataEnabled();
      const fl: Resource = await sut.getCellularDataFlowType();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'en=%{public}s flowId=%{public}s', String(en), String(fl.id));
      expect(en === true || en === false).assertTrue();
      expect(fl.id > 0).assertTrue();
      expect(typeof en).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0007 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_DATAEN_0008
     * @tc.name testDataEnabled0008
     * @tc.desc 组合：开关查询与连接态查询交叉调用互不干扰，连接态资源 id 为整数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDataEnabled0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0008 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const en: boolean = await sut.isCellularDataEnabled();
      const st: Resource = await sut.getCellularDataState();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'en=%{public}s stateId=%{public}s', String(en), String(st.id));
      expect(en === true || en === false).assertTrue();
      expect(st.id > 0).assertTrue();
      expect(Number.isInteger(st.id)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0008 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_DATAEN_0009
     * @tc.name testDataEnabled0009
     * @tc.desc 状态：开关查询被槽位查询打断后状态保持一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testDataEnabled0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0009 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const en1: boolean = await sut.isCellularDataEnabled();
      const slot: number = await sut.getDefaultCellularDataSlotId();
      const en2: boolean = await sut.isCellularDataEnabled();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'en1=%{public}s slot=%{public}s en2=%{public}s',
        String(en1), String(slot), String(en2));
      expect(en1 === en2).assertTrue();
      expect(slot === -1 || slot === 0 || slot === 1).assertTrue();
      expect(typeof en2).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0009 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_DATAEN_0010
     * @tc.name testDataEnabled0010
     * @tc.desc 边界：布尔结果的数值化投影夹在 0 与 1 之间
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testDataEnabled0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0010 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const en: boolean = await sut.isCellularDataEnabled();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(en));
      expect(Number(en) >= 0).assertTrue();
      expect(Number(en) <= 1).assertTrue();
      expect(typeof en).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataEnabled0010 end');
    })
  })
}
