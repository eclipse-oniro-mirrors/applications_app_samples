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

// CStateReal01 套件：覆盖合法枚举值、非法极值、重复调用一致性与组合场景。
// 期望值取自冻结资源 id 基线（ResourceTable.txt）。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import data from '@ohos.telephony.data';
import { NetworkMobile } from '../../../../src/main/ets/model/NetworkMobile';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MobileNetwork_CStateReal01]';

export default function cstateReal01Test() {
  describe('CStateReal01Test', () => {

    /**
     * @tc.number SUB_MOBILENETWORK_CSTATE_0026
     * @tc.name testCState0026
     * @tc.desc 非法枚举值 -1 落入 default 分支映射为 unknown(33554462)
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testCState0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0026 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(-1 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'id=%{public}s', String(result.id));
      expect(result.id).assertEqual(33554462);
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      expect(result.id === 33554447).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0026 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_CSTATE_0027
     * @tc.name testCState0027
     * @tc.desc DATA_STATE_CONNECTED 映射为冻结 connect 资源(33554443)
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testCState0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0027 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_CONNECTED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'id=%{public}s', String(result.id));
      expect(result.id).assertEqual(33554443);
      expect(Number.isInteger(result.id)).assertTrue();
      expect(result.id === 33554462).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0027 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_CSTATE_0028
     * @tc.name testCState0028
     * @tc.desc DATA_STATE_SUSPENDED 映射为冻结 suspended 资源(33554461)且为正值整数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testCState0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0028 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_SUSPENDED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'id=%{public}s', String(result.id));
      expect(result.id).assertEqual(33554461);
      expect(Number.isInteger(result.id)).assertTrue();
      expect(result.id > 0).assertTrue();
      expect(result.id === 33554443).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0028 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_CSTATE_0029
     * @tc.name testCState0029
     * @tc.desc UINT8_MAX+1 非法值落入 default 分支映射为 unknown 且返回对象类型
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testCState0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0029 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataStateResource(256 as data.DataConnectState);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'id=%{public}s', String(result.id));
      expect(result.id).assertEqual(33554462);
      expect(result.id > 0).assertTrue();
      expect(typeof result).assertEqual('object');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0029 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_CSTATE_0030
     * @tc.name testCState0030
     * @tc.desc 同一输入两次调用映射稳定一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testCState0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0030 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r1: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_SUSPENDED);
      const r2: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_SUSPENDED);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'r1=%{public}s r2=%{public}s', String(r1.id), String(r2.id));
      expect(r1.id === r2.id).assertTrue();
      expect(Number.isInteger(r1.id) && Number.isInteger(r2.id)).assertTrue();
      expect(r1.id).assertEqual(33554461);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0030 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_CSTATE_0031
     * @tc.name testCState0031
     * @tc.desc 连接态映射与槽位查询交叉调用，连接态命中冻结 id 且槽位在值域内
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testCState0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0031 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const st: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_UNKNOWN);
      const slot: number = await sut.getDefaultCellularDataSlotId();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'st=%{public}s slot=%{public}s', String(st.id), String(slot));
      expect(st.id).assertEqual(33554462);
      expect(slot === -1 || slot === 0 || slot === 1).assertTrue();
      expect(Number.isInteger(st.id)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCState0031 end');
    })
  })
}
