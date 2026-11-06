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
// DownloadFlow 单测：picker 支持判定、下载目标路由、attempt token 防迟到回调、超时降级判定、状态机与状态文案。
// 下载演示页在 dayu200 上必须走沙箱降级路径，这些纯函数保证“选择器不可用/超时/迟到回调”三个分支都可测。

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  DownloadState,
  DownloadTarget,
  beginAttempt,
  downloadStateName,
  isStaleAttempt,
  nextDownloadState,
  resolveDownloadTarget,
  shouldFallbackOnTimeout,
  supportsDocumentPicker
} from '../main/ets/model/DownloadFlow';
import { PICKER_TIMEOUT_MS } from '../main/ets/common/AppConstants';
import { buildDownloadContent, buildDownloadFileName } from '../main/ets/utils/FormatUtil';

export default function downloadFlowTest() {
  describe('DownloadFlowTest', () => {
    // picker 支持矩阵：phone/tablet/2in1 走选择器；default（dayu200）、未知类型与大小写不一致都不支持
    it('supportsDocumentPicker_byDeviceType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(supportsDocumentPicker('phone')).assertTrue();
      expect(supportsDocumentPicker('tablet')).assertTrue();
      expect(supportsDocumentPicker('2in1')).assertTrue();
      expect(supportsDocumentPicker('default')).assertFalse();
      expect(supportsDocumentPicker('wearable')).assertFalse();
      expect(supportsDocumentPicker('')).assertFalse();
      expect(supportsDocumentPicker('Phone')).assertFalse();
      expect(supportsDocumentPicker('TABLET')).assertFalse();
    });

    // 下载目标路由：不支持 picker 的设备直接落沙箱，支持的设备走 PICKER
    it('resolveDownloadTarget_defaultSandbox', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(resolveDownloadTarget('default')).assertEqual(DownloadTarget.SANDBOX);
      expect(resolveDownloadTarget('phone')).assertEqual(DownloadTarget.PICKER);
      expect(resolveDownloadTarget('tablet')).assertEqual(DownloadTarget.PICKER);
    });

    // 下载目标路由：2in1 支持 picker；空串与未知类型（'pc'）回落沙箱
    it('resolveDownloadTarget_twoInOneAndUnknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(resolveDownloadTarget('2in1')).assertEqual(DownloadTarget.PICKER);
      expect(resolveDownloadTarget('')).assertEqual(DownloadTarget.SANDBOX);
      expect(resolveDownloadTarget('pc')).assertEqual(DownloadTarget.SANDBOX);
    });

    // attempt token：每次发起尝试自增一次（含跨较大数值），页面用它丢弃超时后的迟到回调
    it('beginAttempt_incrementsToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(beginAttempt(0)).assertEqual(1);
      expect(beginAttempt(5)).assertEqual(6);
      expect(beginAttempt(99)).assertEqual(100);
      expect(beginAttempt(beginAttempt(1))).assertEqual(3);
    });

    // 迟到回调判定：token 与当前活跃 token 不相等即过期（含大间隔）；相等不算过期；初始 0/0 视为有效
    it('isStaleAttempt_detectsLateCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(isStaleAttempt(1, 2)).assertTrue();
      expect(isStaleAttempt(2, 2)).assertFalse();
      expect(isStaleAttempt(7, 9)).assertTrue();
      expect(isStaleAttempt(9, 9)).assertFalse();
      expect(isStaleAttempt(0, 1)).assertTrue();
      expect(isStaleAttempt(0, 0)).assertFalse();
    });

    // 超时降级判定：仅当“未结算且 token 仍是当前活跃 token”才降级；已结算或 token 已过期都不降级
    it('shouldFallbackOnTimeout_pendingAndSettled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(shouldFallbackOnTimeout(false, 3, 3)).assertTrue();
      expect(shouldFallbackOnTimeout(true, 3, 3)).assertFalse();
      expect(shouldFallbackOnTimeout(false, 3, 4)).assertFalse();
      expect(shouldFallbackOnTimeout(false, 0, 0)).assertTrue();
    });

    // 状态机迁移：新状态只由 success 决定（PICKING/IDLE/FAILED 起步均然），与当前状态无关
    it('nextDownloadState_transitions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(nextDownloadState(DownloadState.PICKING, true)).assertEqual(DownloadState.SUCCESS);
      expect(nextDownloadState(DownloadState.PICKING, false)).assertEqual(DownloadState.FALLBACK);
      expect(nextDownloadState(DownloadState.IDLE, true)).assertEqual(DownloadState.SUCCESS);
      expect(nextDownloadState(DownloadState.IDLE, false)).assertEqual(DownloadState.FALLBACK);
      expect(nextDownloadState(DownloadState.FAILED, true)).assertEqual(DownloadState.SUCCESS);
      expect(nextDownloadState(DownloadState.FAILED, false)).assertEqual(DownloadState.FALLBACK);
    });

    // 状态机迁移：成功后可再次下载；再次失败仍能降级到沙箱，不会卡死在 SUCCESS/FALLBACK
    it('nextDownloadState_retryAfterSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(nextDownloadState(DownloadState.SUCCESS, true)).assertEqual(DownloadState.SUCCESS);
      expect(nextDownloadState(DownloadState.SUCCESS, false)).assertEqual(DownloadState.FALLBACK);
      expect(nextDownloadState(DownloadState.FALLBACK, true)).assertEqual(DownloadState.SUCCESS);
      expect(nextDownloadState(DownloadState.FALLBACK, false)).assertEqual(DownloadState.FALLBACK);
    });

    // 状态文案：五个状态都有稳定的中文展示名（页面状态徽标直接使用）
    it('downloadState_names', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const idleId: number = downloadStateName(DownloadState.IDLE).id;
      expect(idleId > 0).assertTrue();
      expect(downloadStateName(DownloadState.PICKING).id !== idleId).assertTrue();
      expect(downloadStateName(DownloadState.SUCCESS).id !== idleId).assertTrue();
      expect(downloadStateName(DownloadState.FALLBACK).id !== idleId).assertTrue();
      expect(downloadStateName(DownloadState.FAILED).id !== idleId).assertTrue();
    });

    // 超时常量：3 秒与页面计时器一致，改动会导致降级窗口变化
    it('timeoutConstant_isThreeSeconds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PICKER_TIMEOUT_MS).assertEqual(3000);
    });

    // 降级文件：文件名按时间戳生成，正文固定 4 行、含组件名与“应用沙箱”字样，便于用户在沙箱中辨认
    it('fileNameAndContent_stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const date = new Date(2026, 9, 27, 10, 11, 12);
      expect(buildDownloadFileName(date)).assertEqual('atomic-service-demo-20261027-101112.txt');
      const content = buildDownloadContent(date);
      expect(content.includes('DownloadFileButton')).assertTrue();
      expect(content.includes('sandbox')).assertTrue();
      expect(content.split('\n').length).assertEqual(4);
    });
  });
}
