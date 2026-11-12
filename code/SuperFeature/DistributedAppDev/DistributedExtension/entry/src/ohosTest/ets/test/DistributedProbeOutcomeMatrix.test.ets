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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProbeStatus, classifyErrorCode } from '../../../main/ets/model/ProbeState';
import {
  EnumSnapshot, ExtensionInfoResult, LOCAL_GUARD_CODE, LOCAL_THROWN_CODE, ProbeOutcome
} from '../../../main/ets/utils/DistributedProbe';

/**
 * 真调用结果的统一外壳：页面只认 ProbeOutcome / ExtensionInfoResult / EnumSnapshot 三者的文案。
 * 这三个类把"错误码 → 状态 → 建议"固化下来，写错会让一次 32390101 被显示成"调用成功"，
 * 因此对每个分支单独断言，而不是只看非空。
 */
export default function distributedProbeOutcomeMatrixTest() {
  describe('DistributedProbeOutcomeMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_0100
     * @tc.name testOutcome0001
     * @tc.desc Verify the two local pseudo codes stay negative so they never collide with system codes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0001', 0, () => {
      expect(LOCAL_GUARD_CODE).assertEqual(-1);
      expect(LOCAL_THROWN_CODE).assertEqual(-2);
      expect(LOCAL_GUARD_CODE < 0).assertTrue();
      expect(LOCAL_THROWN_CODE < LOCAL_GUARD_CODE).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_0200
     * @tc.name testOutcome0002
     * @tc.desc Verify a successful outcome is reported as success with an idle status.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0002', 0, () => {
      const outcome = new ProbeOutcome('createServer', 0, '服务端已创建');
      expect(outcome.succeeded()).assertTrue();
      expect(outcome.describe()).assertEqual('createServer成功：服务端已创建');
      expect(outcome.status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_0300
     * @tc.name testOutcome0003
     * @tc.desc Verify an empty message is replaced so the panel never renders a blank line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0003', 0, () => {
      expect(new ProbeOutcome('openProxyChannel', 32390101, '').message).assertEqual('未知结果');
      expect(new ProbeOutcome('openProxyChannel', 0, '').describe()).assertEqual('openProxyChannel成功：未知结果');
      expect(new ProbeOutcome('openProxyChannel', 0, '').message.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_0400
     * @tc.name testOutcome0004
     * @tc.desc Verify the local guard code is rendered as not executed rather than failed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0004', 0, () => {
      const outcome = new ProbeOutcome('connect', LOCAL_GUARD_CODE, '尚未创建 Connection 对象');
      expect(outcome.describe()).assertEqual('connect未执行：尚未创建 Connection 对象');
      expect(outcome.describe().includes('失败')).assertFalse();
      expect(outcome.succeeded()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_0500
     * @tc.name testOutcome0005
     * @tc.desc Verify the guard hint tells the user to finish the previous step.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0005', 0, () => {
      const outcome = new ProbeOutcome('sendData', LOCAL_GUARD_CODE, '尚未创建 Connection 对象');
      expect(outcome.hint()).assertEqual('按顺序完成前一步再调用该接口');
      expect(outcome.hint().includes('顺序')).assertTrue();
      expect(outcome.status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_0600
     * @tc.name testOutcome0006
     * @tc.desc Verify an exception without a numeric code is sent to hilog instead of being treated as success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0006', 0, () => {
      const outcome = new ProbeOutcome('createServer', LOCAL_THROWN_CODE, 'assert failed');
      expect(outcome.describe()).assertEqual('createServer失败（-2）：assert failed');
      expect(outcome.hint()).assertEqual('系统接口抛出异常但未携带数字错误码，查看 hilog 中的原始描述');
      expect(outcome.succeeded()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_0700
     * @tc.name testOutcome0007
     * @tc.desc Verify the permission wording in the thrown message switches the hint to the permission path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0007', 0, () => {
      const denied = new ProbeOutcome('createServer', LOCAL_THROWN_CODE, 'Permission verification failed');
      expect(denied.hint().includes('权限校验')).assertTrue();
      expect(denied.hint().includes('ACCESS_BLUETOOTH')).assertTrue();
      // 大小写不敏感：实测抛出的是首字母大写的 Permission
      expect(new ProbeOutcome('start', LOCAL_THROWN_CODE, 'permission denied').hint())
        .assertEqual(denied.hint());
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_0800
     * @tc.name testOutcome0008
     * @tc.desc Verify a system code keeps its numeric value in the text and borrows the shared hint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0008', 0, () => {
      const outcome = new ProbeOutcome('openProxyChannel', 32390101, 'Remote is nullptr');
      expect(outcome.describe()).assertEqual('openProxyChannel失败（32390101）：Remote is nullptr');
      expect(outcome.hint().includes('推送服务')).assertTrue();
      expect(outcome.status).assertEqual(ProbeStatus.RESTRICTED);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_0900
     * @tc.name testOutcome0009
     * @tc.desc Verify the status field is derived from the code for representative values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0009', 0, () => {
      expect(new ProbeOutcome('a', 201, 'x').status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(new ProbeOutcome('a', 801, 'x').status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(new ProbeOutcome('a', 32390002, 'x').status).assertEqual(ProbeStatus.UNPAIRED);
      expect(new ProbeOutcome('a', 32390300, 'x').status).assertEqual(ProbeStatus.INTERNAL);
      expect(new ProbeOutcome('a', 0, 'x').status).assertEqual(ProbeStatus.IDLE);
      expect(new ProbeOutcome('a', LOCAL_GUARD_CODE, 'x').status === ProbeStatus.FAILED).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_1000
     * @tc.name testOutcome0010
     * @tc.desc Verify succeeded is true only for a zero code.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testOutcome0010', 0, () => {
      expect(new ProbeOutcome('a', 0, 'x').succeeded()).assertTrue();
      expect(new ProbeOutcome('a', 1, 'x').succeeded()).assertFalse();
      expect(new ProbeOutcome('a', LOCAL_GUARD_CODE, 'x').succeeded()).assertFalse();
      expect(new ProbeOutcome('a', LOCAL_THROWN_CODE, 'x').succeeded()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_1100
     * @tc.name testOutcome0011
     * @tc.desc Verify a timeout style negative code still reports failure text while the hint stays generic.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testOutcome0011', 0, () => {
      // 实测行为：只有 -1 / -2 有专属提示，其它负数会落到 distributedErrorHint，
      // 该函数对 code<=0 统一回「操作已正常完成」，与 describe 的失败措辞不一致，此处如实锁定
      const timeout = new ProbeOutcome('openProxyChannel', -9001, '4000 ms 内未返回结果');
      expect(timeout.describe()).assertEqual('openProxyChannel失败（-9001）：4000 ms 内未返回结果');
      expect(timeout.hint()).assertEqual('操作已正常完成');
      expect(timeout.describe().includes(timeout.hint())).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_1200
     * @tc.name testOutcome0012
     * @tc.desc Verify a failed read reports the code and the original message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0012', 0, () => {
      const failed = new ExtensionInfoResult(false, 0, '', '', 201, 'denied');
      expect(failed.describe()).assertEqual('读取扩展信息失败（201）：denied');
      expect(failed.declared).assertFalse();
      expect(failed.describe().includes('已注册')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_1300
     * @tc.name testOutcome0013
     * @tc.desc Verify a missing distributed extension reports the registered extension count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0013', 0, () => {
      const missing = new ExtensionInfoResult(false, 3, '', '', 0, '未匹配到');
      expect(missing.describe()).assertEqual('未读到 distributed 扩展：本模块共注册 3 个扩展');
      expect(missing.describe().includes('未读到')).assertTrue();
      expect(missing.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_1400
     * @tc.name testOutcome0014
     * @tc.desc Verify a declared extension reports its name, type name and total count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0014', 0, () => {
      const found = new ExtensionInfoResult(true, 2, 'DistributedExtAbility', 'distributed', 0, 'ok');
      expect(found.describe()).assertEqual('已注册 DistributedExtAbility（type=distributed）；本模块共注册 2 个扩展');
      expect(found.declared).assertTrue();
      expect(found.describe().includes('type=distributed')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_1500
     * @tc.name testOutcome0015
     * @tc.desc Verify an enum snapshot is consistent only when both runtime values match the d.ts constants.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOutcome0015', 0, () => {
      const snapshot = new EnumSnapshot(0, 1, 0, '');
      expect(snapshot.consistent()).assertTrue();
      expect(snapshot.staticLinkType).assertEqual(0);
      expect(snapshot.staticChannelResume).assertEqual(1);
      expect(snapshot.staticCollaborateAccept).assertEqual(0);
      expect(snapshot.describe().includes('一致')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_1600
     * @tc.name testOutcome0016
     * @tc.desc Verify a drifted runtime value breaks the consistency flag and is reported as such.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testOutcome0016', 0, () => {
      const driftChannel = new EnumSnapshot(0, 7, 0, '');
      expect(driftChannel.consistent()).assertFalse();
      expect(driftChannel.describe().includes('不一致')).assertTrue();
      const driftLink = new EnumSnapshot(9, 1, 0, '');
      expect(driftLink.consistent()).assertFalse();
      expect(driftLink.describe().includes('LINK_BR=9')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_OUTCOME_1700
     * @tc.name testOutcome0017
     * @tc.desc Verify a failed enum read never claims consistency even when the values look right.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testOutcome0017', 0, () => {
      const failed = new EnumSnapshot(0, 1, 401, 'invalid parameter');
      expect(failed.consistent()).assertFalse();
      expect(failed.describe()).assertEqual('读取枚举失败（401）：invalid parameter');
      expect(failed.describe().includes('一致')).assertFalse();
    });
  });
}
