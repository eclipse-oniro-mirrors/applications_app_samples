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

// SlotCore 套件：getDefaultCellularDataSlotId 无输入域，按类型/值域/契约/状态/组合维度展开。
// 期望只来自 main 冻结契约（成功返回数据卡槽位 0/1，失败默认 -1）。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NetworkMobile } from '../../../../src/main/ets/model/NetworkMobile';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MobileNetwork_SlotCore]';

export default function slotCoreTest() {
  describe('SlotCoreTest', () => {

    /**
     * @tc.number SUB_MOBILENETWORK_SLOT_0001
     * @tc.name testSlot0001
     * @tc.desc 合法：返回值的类型契约，结果为有限整数 number
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testSlot0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0001 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r: number = await sut.getDefaultCellularDataSlotId();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(r));
      expect(typeof r).assertEqual('number');
      expect(Number.isInteger(r)).assertTrue();
      expect(Number.isFinite(r)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0001 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_SLOT_0002
     * @tc.name testSlot0002
     * @tc.desc 合法：返回值落在规格值域 {-1,0,1} 内
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testSlot0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0002 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r: number = await sut.getDefaultCellularDataSlotId();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(r));
      expect(r === -1 || r === 0 || r === 1).assertTrue();
      expect(r).assertLarger(-2);
      expect(r).assertLess(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0002 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_SLOT_0003
     * @tc.name testSlot0003
     * @tc.desc 契约：catch 兜底保证返回值可用，不是 NaN 也不是空值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testSlot0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0003 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r: number = await sut.getDefaultCellularDataSlotId();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(r));
      expect(Number.isNaN(r)).assertFalse();
      expect(r !== null).assertTrue();
      expect(typeof r).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0003 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_SLOT_0004
     * @tc.name testSlot0004
     * @tc.desc 边界：返回值夹在 -2 与 2 之间且不越出值域端点
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSlot0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0004 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r: number = await sut.getDefaultCellularDataSlotId();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(r));
      expect(r).assertLarger(-2);
      expect(r).assertLess(2);
      expect(r === -1 || r === 0 || r === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0004 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_SLOT_0005
     * @tc.name testSlot0005
     * @tc.desc 状态：连续两次查询返回同一个槽位
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testSlot0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0005 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r1: number = await sut.getDefaultCellularDataSlotId();
      const r2: number = await sut.getDefaultCellularDataSlotId();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'r1=%{public}s r2=%{public}s', String(r1), String(r2));
      expect(r1 === r2).assertTrue();
      expect(typeof r2).assertEqual('number');
      expect(Number.isInteger(r2)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0005 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_SLOT_0006
     * @tc.name testSlot0006
     * @tc.desc 组合：槽位查询与漫游查询交叉调用互不干扰，非法槽位漫游仍为 false
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSlot0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0006 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r: number = await sut.getDefaultCellularDataSlotId();
      const roam: boolean = await sut.isCellularDataRoamingEnabled(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'slot=%{public}s roam=%{public}s', String(r), String(roam));
      expect(roam).assertEqual(false);
      expect(typeof roam).assertEqual('boolean');
      expect(r === -1 || r === 0 || r === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0006 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_SLOT_0007
     * @tc.name testSlot0007
     * @tc.desc 组合：槽位查询与数据开关查询交叉调用互不干扰
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSlot0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0007 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r: number = await sut.getDefaultCellularDataSlotId();
      const en: boolean = await sut.isCellularDataEnabled();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'slot=%{public}s en=%{public}s', String(r), String(en));
      expect(typeof en).assertEqual('boolean');
      expect(r === -1 || r === 0 || r === 1).assertTrue();
      expect(r === 0 || r === 1 || r === -1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0007 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_SLOT_0008
     * @tc.name testSlot0008
     * @tc.desc 状态：连续三次查询结果两两一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSlot0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0008 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r1: number = await sut.getDefaultCellularDataSlotId();
      const r2: number = await sut.getDefaultCellularDataSlotId();
      const r3: number = await sut.getDefaultCellularDataSlotId();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'r1=%{public}s r2=%{public}s r3=%{public}s', String(r1), String(r2), String(r3));
      expect(r1 === r2).assertTrue();
      expect(r2 === r3).assertTrue();
      expect(r1 === r3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0008 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_SLOT_0009
     * @tc.name testSlot0009
     * @tc.desc 组合：查询结果可安全作为漫游查询入参；若结果为 -1 则漫游必为 false
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSlot0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0009 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r: number = await sut.getDefaultCellularDataSlotId();
      const roamR: boolean = await sut.isCellularDataRoamingEnabled(r);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'slot=%{public}s roamR=%{public}s', String(r), String(roamR));
      expect(typeof roamR).assertEqual('boolean');
      expect(r !== -1 || roamR === false).assertTrue();
      expect(r === -1 || r === 0 || r === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0009 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_SLOT_0010
     * @tc.name testSlot0010
     * @tc.desc 组合：槽位查询与流量类型查询交叉调用互不干扰，流量资源 id 为正整数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testSlot0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0010 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r: number = await sut.getDefaultCellularDataSlotId();
      const fl: Resource = await sut.getCellularDataFlowType();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'slot=%{public}s flowId=%{public}s', String(r), String(fl.id));
      expect(fl.id > 0).assertTrue();
      expect(r === -1 || r === 0 || r === 1).assertTrue();
      expect(typeof r).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSlot0010 end');
    })
  })
}
