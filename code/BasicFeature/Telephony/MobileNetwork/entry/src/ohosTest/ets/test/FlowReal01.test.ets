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

// FlowReal01 套件：覆盖合法枚举值、非法极值、重复调用一致性与组合场景。
// 期望值取自冻结资源 id 基线（ResourceTable.txt）。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import data from '@ohos.telephony.data';
import { NetworkMobile } from '../../../../src/main/ets/model/NetworkMobile';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MobileNetwork_FlowReal01]';

export default function flowReal01Test() {
  describe('FlowReal01Test', () => {

    /**
     * @tc.number SUB_MOBILENETWORK_FLOW_0026
     * @tc.name testFlow0026
     * @tc.desc 非法枚举值 -1 落入 default 分支映射为 none(33554455)
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlow0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0026 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(-1 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'id=%{public}s', String(result.id));
      expect(result.id).assertEqual(33554455);
      expect(Number.isInteger(result.id) && result.id > 0).assertTrue();
      expect(result.id === 33554449).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0026 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_FLOW_0027
     * @tc.name testFlow0027
     * @tc.desc DATA_FLOW_TYPE_DOWN 映射为冻结 down 资源(33554449)
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlow0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0027 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(data.DataFlowType.DATA_FLOW_TYPE_DOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'id=%{public}s', String(result.id));
      expect(result.id).assertEqual(33554449);
      expect(Number.isInteger(result.id)).assertTrue();
      expect(result.id === 33554455).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0027 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_FLOW_0028
     * @tc.name testFlow0028
     * @tc.desc DATA_FLOW_TYPE_DORMANT 映射为冻结 dormant 资源(33554448)且为正值整数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testFlow0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0028 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(data.DataFlowType.DATA_FLOW_TYPE_DORMANT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'id=%{public}s', String(result.id));
      expect(result.id).assertEqual(33554448);
      expect(Number.isInteger(result.id)).assertTrue();
      expect(result.id > 0).assertTrue();
      expect(result.id === 33554463).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0028 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_FLOW_0029
     * @tc.name testFlow0029
     * @tc.desc UINT8_MAX 非法值落入 default 分支映射为 none 且返回对象类型
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlow0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0029 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: Resource = sut.getDataFlowTypeResource(255 as data.DataFlowType);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'id=%{public}s', String(result.id));
      expect(result.id).assertEqual(33554455);
      expect(result.id > 0).assertTrue();
      expect(typeof result).assertEqual('object');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0029 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_FLOW_0030
     * @tc.name testFlow0030
     * @tc.desc 同一输入两次调用映射稳定一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlow0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0030 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const r1: Resource = sut.getDataFlowTypeResource(data.DataFlowType.DATA_FLOW_TYPE_DOWN);
      const r2: Resource = sut.getDataFlowTypeResource(data.DataFlowType.DATA_FLOW_TYPE_DOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'r1=%{public}s r2=%{public}s', String(r1.id), String(r2.id));
      expect(r1.id === r2.id).assertTrue();
      expect(Number.isInteger(r1.id) && Number.isInteger(r2.id)).assertTrue();
      expect(r1.id).assertEqual(33554449);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0030 end');
    })

    /**
     * @tc.number SUB_MOBILENETWORK_FLOW_0031
     * @tc.name testFlow0031
     * @tc.desc 流量映射与连接态映射交叉调用，各自命中冻结 id
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testFlow0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0031 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const fl: Resource = sut.getDataFlowTypeResource(data.DataFlowType.DATA_FLOW_TYPE_DOWN);
      const st: Resource = sut.getDataStateResource(data.DataConnectState.DATA_STATE_UNKNOWN);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fl=%{public}s st=%{public}s', String(fl.id), String(st.id));
      expect(fl.id).assertEqual(33554449);
      expect(st.id).assertEqual(33554462);
      expect(Number.isInteger(fl.id) && Number.isInteger(st.id)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow0031 end');
    })
  })
}
