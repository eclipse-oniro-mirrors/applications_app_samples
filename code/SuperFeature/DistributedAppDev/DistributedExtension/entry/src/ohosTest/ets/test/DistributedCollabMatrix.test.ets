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
import {
  COLLABORATE_INDEX_KEY, CollaborateRequest, buildRequest, collaborateIndex, mockRequest, shouldAccept,
  summarizeRequest, toggleAccepted, wantParamKeys
} from '../../../main/ets/model/CollabModel';

/** 构造只带协同下标的 wantParam，模拟系统把调用方参数透传给 onCollaborate 的形状 */
function wantOf(index: string): Record<string, Object> {
  const want: Record<string, Object> = {};
  want[COLLABORATE_INDEX_KEY] = index;
  return want;
}

/**
 * 协同请求的纯逻辑：onCollaborate 只认 supportCollaborateIndex 一个键，
 * 判错一个字就会把本该接受的协同请求回成 REJECT，页面上看到的结果也随之一致变化。
 * 这里把「键名 + 取值 + 判定 + 文案」四段分别验证。
 */
export default function distributedCollabMatrixTest() {
  describe('DistributedCollabMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0100
     * @tc.name testCollab0001
     * @tc.desc Verify the collaborate index key matches the documented wantParam key.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0001', 0, () => {
      expect(COLLABORATE_INDEX_KEY).assertEqual('ohos.extra.param.key.supportCollaborateIndex');
      expect(COLLABORATE_INDEX_KEY.startsWith('ohos.extra.param.key.')).assertTrue();
      expect(COLLABORATE_INDEX_KEY.length).assertEqual(44);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0200
     * @tc.name testCollab0002
     * @tc.desc Verify a present index is read back unchanged as a string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0002', 0, () => {
      expect(collaborateIndex(wantOf('3'))).assertEqual('3');
      expect(wantParamKeys(wantOf('3')).length).assertEqual(1);
      expect(wantParamKeys(wantOf('3'))[0]).assertEqual(COLLABORATE_INDEX_KEY);
      expect(collaborateIndex(wantOf('设备A-窗口2'))).assertEqual('设备A-窗口2');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0300
     * @tc.name testCollab0003
     * @tc.desc Verify a missing key reads back as an empty string rather than undefined text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0003', 0, () => {
      const empty: Record<string, Object> = {};
      expect(collaborateIndex(empty)).assertEqual('');
      expect(wantParamKeys(empty).length).assertEqual(0);
      expect(collaborateIndex(empty) === 'undefined').assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0400
     * @tc.name testCollab0004
     * @tc.desc Verify a non string index value is stringified instead of being dropped.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCollab0004', 0, () => {
      const want: Record<string, Object> = {};
      want[COLLABORATE_INDEX_KEY] = 5;
      expect(collaborateIndex(want)).assertEqual('5');
      expect(shouldAccept(collaborateIndex(want))).assertTrue();
      expect(buildRequest(want).keyCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0500
     * @tc.name testCollab0005
     * @tc.desc Verify wantParamKeys reports every key the caller passed, including unsupported ones.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCollab0005', 0, () => {
      const want = wantOf('7');
      want['ohos.extra.param.key.unsupported'] = 'x';
      const keys = wantParamKeys(want);
      expect(keys.length).assertEqual(2);
      expect(keys.indexOf(COLLABORATE_INDEX_KEY) >= 0).assertTrue();
      expect(buildRequest(want).keyCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0600
     * @tc.name testCollab0006
     * @tc.desc Verify blank and whitespace only indexes are rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0006', 0, () => {
      expect(shouldAccept('')).assertFalse();
      expect(shouldAccept('   ')).assertFalse();
      expect(shouldAccept('\t\n')).assertFalse();
      expect(mockRequest('  ').accepted).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0700
     * @tc.name testCollab0007
     * @tc.desc Verify a non blank index is accepted even with surrounding spaces.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0007', 0, () => {
      expect(shouldAccept('0')).assertTrue();
      expect(shouldAccept(' 1 ')).assertTrue();
      expect(shouldAccept('窗口')).assertTrue();
      expect(mockRequest(' 1 ').accepted).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0800
     * @tc.name testCollab0008
     * @tc.desc Verify buildRequest mirrors the extension logic for a well formed request.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0008', 0, () => {
      const request = buildRequest(wantOf('2'));
      expect(request.index).assertEqual('2');
      expect(request.accepted).assertTrue();
      expect(request.keyCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0900
     * @tc.name testCollab0009
     * @tc.desc Verify buildRequest rejects a request that carries other keys but no index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCollab0009', 0, () => {
      const want: Record<string, Object> = {};
      want['ohos.extra.param.key.other'] = 'y';
      const request = buildRequest(want);
      expect(request.index).assertEqual('');
      expect(request.accepted).assertFalse();
      expect(request.keyCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_1000
     * @tc.name testCollab0010
     * @tc.desc Verify mockRequest reports one parameter when only the index is filled.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0010', 0, () => {
      const request = mockRequest('3');
      expect(request.keyCount).assertEqual(1);
      expect(request.accepted).assertTrue();
      expect(request.index).assertEqual('3');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_1100
     * @tc.name testCollab0011
     * @tc.desc Verify mockRequest reports zero parameters for an empty index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0011', 0, () => {
      const request = mockRequest('');
      expect(request.keyCount).assertEqual(0);
      expect(request.accepted).assertFalse();
      expect(request.index).assertEqual('');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_1200
     * @tc.name testCollab0012
     * @tc.desc Verify a whitespace only index counts as one parameter yet still gets rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCollab0012', 0, () => {
      // 边界：键数按原始长度统计，判定按 trim 后的长度，两者不同源
      const request = mockRequest('   ');
      expect(request.keyCount).assertEqual(1);
      expect(request.accepted).assertFalse();
      expect(request.index.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_1300
     * @tc.name testCollab0013
     * @tc.desc Verify describe renders the empty placeholder when no index was supplied.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0013', 0, () => {
      expect(new CollaborateRequest('', false, 0).describe())
        .assertEqual('协同下标 "（空）"，参数 0 个 → REJECT');
      expect(new CollaborateRequest('', false, 0).describe().includes('（空）')).assertTrue();
      expect(new CollaborateRequest('', false, 0).describe().includes('ACCEPT')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_1400
     * @tc.name testCollab0014
     * @tc.desc Verify describe reports ACCEPT and REJECT for the same index with different verdicts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0014', 0, () => {
      expect(new CollaborateRequest('3', true, 1).describe()).assertEqual('协同下标 "3"，参数 1 个 → ACCEPT');
      expect(new CollaborateRequest('3', false, 1).describe()).assertEqual('协同下标 "3"，参数 1 个 → REJECT');
      expect(new CollaborateRequest('3', true, 1).describe().endsWith('ACCEPT')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_1500
     * @tc.name testCollab0015
     * @tc.desc Verify summarizeRequest appends the documented accept verdict.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0015', 0, () => {
      const summary = summarizeRequest(mockRequest('3'));
      expect(summary).assertEqual('协同下标 "3"，参数 1 个 → ACCEPT；扩展按 demo 规则接受协同');
      expect(summary.startsWith('协同下标')).assertTrue();
      expect(summary.includes('接受协同')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_1600
     * @tc.name testCollab0016
     * @tc.desc Verify summarizeRequest names the missing key when the request is rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0016', 0, () => {
      const summary = summarizeRequest(mockRequest(''));
      expect(summary).assertEqual('协同下标 "（空）"，参数 0 个 → REJECT；扩展按 demo 规则拒绝协同（缺少 supportCollaborateIndex）');
      expect(summary.includes('缺少 supportCollaborateIndex')).assertTrue();
      expect(summary.includes('接受协同')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_1700
     * @tc.name testCollab0017
     * @tc.desc Verify toggleAccepted flips the stored verdict exactly once per call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollab0017', 0, () => {
      expect(toggleAccepted(true)).assertFalse();
      expect(toggleAccepted(false)).assertTrue();
      expect(toggleAccepted(toggleAccepted(true))).assertTrue();
    });
  });
}
