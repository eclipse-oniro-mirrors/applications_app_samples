/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ChannelConfigModel, ChannelConfigStatus, ChannelConfigJson } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * ChannelConfigModel 数据模型测试套件。
 * 验证渠道配置模型的构造、状态标记、查询判断、序列化、
 * 重置等全部公开方法的行为正确性。
 */
export default function ChannelConfigModelTest(): void {
  describe('ChannelConfigModelTest', () => {

    // ========================================
    // 构造与默认值
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0100
     * @tc.name testChannelConfigModel0001
     * @tc.desc 正向用例：默认构造后各字段为初始值。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0001: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.channelId).assertEqual('');
      expect(model.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(model.lastFetchTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.fetchCount).assertEqual(0);
    });

    // ========================================
    // 状态标记方法
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0200
     * @tc.name testChannelConfigModel0002
     * @tc.desc 正向用例：调用 markSuccess 后状态变为 SUCCESS，渠道号更新，获取次数加一。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0002: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('test-channel-001');
      expect(model.channelId).assertEqual('test-channel-001');
      expect(model.status).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(model.fetchCount).assertEqual(1);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.lastFetchTime).assertLarger(0);
    });

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0300
     * @tc.name testChannelConfigModel0003
     * @tc.desc 正向用例：调用 markFailed 后状态变为 FAILED，错误信息正确记录。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0003: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markFailed('获取渠道号失败', 10001);
      expect(model.status).assertEqual(ChannelConfigStatus.FAILED);
      expect(model.errorMessage).assertEqual('获取渠道号失败');
      expect(model.errorCode).assertEqual(10001);
      expect(model.fetchCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0400
     * @tc.name testChannelConfigModel0004
     * @tc.desc 正向用例：调用 markLoading 后状态变为 LOADING，错误信息清空。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0004: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markFailed('previous error', 99);
      model.markLoading();
      expect(model.status).assertEqual(ChannelConfigStatus.LOADING);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
    });

    // ========================================
    // 查询判断方法
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0500
     * @tc.name testChannelConfigModel0005
     * @tc.desc 正向用例：markSuccess 后 isSuccess 返回 true，其他状态返回 false。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0005: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.isSuccess()).assertEqual(false);
      model.markSuccess('ch-100');
      expect(model.isSuccess()).assertEqual(true);
      model.markFailed('err', 1);
      expect(model.isSuccess()).assertEqual(false);
    });

    // ========================================
    // 重置方法
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0600
     * @tc.name testChannelConfigModel0006
     * @tc.desc 正向用例：reset 后所有字段恢复为初始值。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0006: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('ch-reset');
      model.reset();
      expect(model.channelId).assertEqual('');
      expect(model.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(model.lastFetchTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.fetchCount).assertEqual(0);
    });

    // ========================================
    // 序列化方法
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0700
     * @tc.name testChannelConfigModel0007
     * @tc.desc 正向用例：toJSON 返回包含全部字段的对象。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModel0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0007: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('ch-json');
      const json: ChannelConfigJson = model.toJSON();
      expect(json.channelId).assertEqual('ch-json');
      expect(json.status).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(json.fetchCount).assertEqual(1);
      expect(json.lastFetchTime).assertLarger(0);
    });

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0800
     * @tc.name testChannelConfigModel0008
     * @tc.desc 正向用例：toString 返回包含模型信息的非空字符串。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModel0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0008: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('ch-str');
      const str: string = model.toString();
      expect(str.length).assertLarger(0);
      expect(str.indexOf('ch-str')).assertLarger(-1);
      expect(str.indexOf('success')).assertLarger(-1);
    });

    // ========================================
    // 统计与时间方法
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0900
     * @tc.name testChannelConfigModel0009
     * @tc.desc 正向用例：多次 markSuccess 和 markFailed 后 fetchCount 累加正确。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModel0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0009: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.fetchCount).assertEqual(0);
      model.markSuccess('ch-1');
      expect(model.fetchCount).assertEqual(1);
      model.markSuccess('ch-2');
      expect(model.fetchCount).assertEqual(2);
      model.markFailed('err', 1);
      expect(model.fetchCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_1000
     * @tc.name testChannelConfigModel0010
     * @tc.desc 边界用例：未获取过时间差返回 -1，markSuccess 后状态与渠道号同步更新且时间差落在调用区间内。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModel0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0010: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.getTimeSinceLastFetch()).assertEqual(-1);
      expect(model.lastFetchTime).assertEqual(0);
      expect(model.fetchCount).assertEqual(0);
      const beforeMark: number = Date.now();
      model.markSuccess('ch-time');
      // 必须在取 after 之前读取时间差：getTimeSinceLastFetch 每次调用都重新取 Date.now()，
      // 若先取 after 再读时间差，跨毫秒时上界断言会偶发失败。
      const timeDiff: number = model.getTimeSinceLastFetch();
      const afterMark: number = Date.now();
      expect(model.channelId).assertEqual('ch-time');
      expect(model.status).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.fetchCount).assertEqual(1);
      expect(model.isSuccess()).assertTrue();
      expect(model.lastFetchTime).assertLargerOrEqual(beforeMark);
      expect(model.lastFetchTime).assertLessOrEqual(afterMark);
      expect(timeDiff).assertLargerOrEqual(0);
      expect(timeDiff).assertLessOrEqual(afterMark - beforeMark);
    });
  });
}
