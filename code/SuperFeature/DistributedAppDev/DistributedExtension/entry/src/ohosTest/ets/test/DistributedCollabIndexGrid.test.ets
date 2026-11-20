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
  COLLABORATE_INDEX_KEY, CollaborateRequest, buildRequest, mockRequest, shouldAccept
} from '../../../main/ets/model/CollabModel';

const COLLAB_KEY: string = COLLABORATE_INDEX_KEY;

/**
 * 协同下标网格：37 个下标（空串、纯空白、制表符、全角空格、中文、emoji、长串）× 7 种 wantParam 键组合。
 * 判定规则是 trim 后非空才接受协同，所以「看起来有值」的纯空白下标必须被拒。
 * keyCount 反映的是调用方实际传了几个键，多传的键不会生效，但数量要在页面上显示出来。
 */
export default function distributedCollabIndexGridTest() {
  describe('DistributedCollabIndexGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0001
     * @tc.name testCollabIdx0001
     * @tc.desc Verify index empty is rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0001', 0, () => {
      const request: CollaborateRequest = mockRequest('');
      expect(request.index).assertEqual('');
      expect(request.accepted).assertEqual(shouldAccept(''));
      expect(request.keyCount).assertEqual(0);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0002
     * @tc.name testCollabIdx0002
     * @tc.desc Verify index   is rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0002', 0, () => {
      const request: CollaborateRequest = mockRequest(' ');
      expect(request.index).assertEqual(' ');
      expect(request.accepted).assertEqual(shouldAccept(' '));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0003
     * @tc.name testCollabIdx0003
     * @tc.desc Verify index    is rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0003', 0, () => {
      const request: CollaborateRequest = mockRequest('  ');
      expect(request.index).assertEqual('  ');
      expect(request.accepted).assertEqual(shouldAccept('  '));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0004
     * @tc.name testCollabIdx0004
     * @tc.desc Verify index 	 is rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0004', 0, () => {
      const request: CollaborateRequest = mockRequest('\u0009');
      expect(request.index).assertEqual('\u0009');
      expect(request.accepted).assertEqual(shouldAccept('\u0009'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0005
     * @tc.name testCollabIdx0005
     * @tc.desc Verify index 
 is rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0005', 0, () => {
      const request: CollaborateRequest = mockRequest('\u000A');
      expect(request.index).assertEqual('\u000A');
      expect(request.accepted).assertEqual(shouldAccept('\u000A'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0006
     * @tc.name testCollabIdx0006
     * @tc.desc Verify index 　 is rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0006', 0, () => {
      const request: CollaborateRequest = mockRequest('　');
      expect(request.index).assertEqual('　');
      expect(request.accepted).assertEqual(shouldAccept('　'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0007
     * @tc.name testCollabIdx0007
     * @tc.desc Verify index 0 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0007', 0, () => {
      const request: CollaborateRequest = mockRequest('0');
      expect(request.index).assertEqual('0');
      expect(request.accepted).assertEqual(shouldAccept('0'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0008
     * @tc.name testCollabIdx0008
     * @tc.desc Verify index 1 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0008', 0, () => {
      const request: CollaborateRequest = mockRequest('1');
      expect(request.index).assertEqual('1');
      expect(request.accepted).assertEqual(shouldAccept('1'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0009
     * @tc.name testCollabIdx0009
     * @tc.desc Verify index 9 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0009', 0, () => {
      const request: CollaborateRequest = mockRequest('9');
      expect(request.index).assertEqual('9');
      expect(request.accepted).assertEqual(shouldAccept('9'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0010
     * @tc.name testCollabIdx0010
     * @tc.desc Verify index 01 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0010', 0, () => {
      const request: CollaborateRequest = mockRequest('01');
      expect(request.index).assertEqual('01');
      expect(request.accepted).assertEqual(shouldAccept('01'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0011
     * @tc.name testCollabIdx0011
     * @tc.desc Verify index idx is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0011', 0, () => {
      const request: CollaborateRequest = mockRequest('idx');
      expect(request.index).assertEqual('idx');
      expect(request.accepted).assertEqual(shouldAccept('idx'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0012
     * @tc.name testCollabIdx0012
     * @tc.desc Verify index idx-1 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0012', 0, () => {
      const request: CollaborateRequest = mockRequest('idx-1');
      expect(request.index).assertEqual('idx-1');
      expect(request.accepted).assertEqual(shouldAccept('idx-1'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0013
     * @tc.name testCollabIdx0013
     * @tc.desc Verify index sample-index-0 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0013', 0, () => {
      const request: CollaborateRequest = mockRequest('sample-index-0');
      expect(request.index).assertEqual('sample-index-0');
      expect(request.accepted).assertEqual(shouldAccept('sample-index-0'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0014
     * @tc.name testCollabIdx0014
     * @tc.desc Verify index A is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0014', 0, () => {
      const request: CollaborateRequest = mockRequest('A');
      expect(request.index).assertEqual('A');
      expect(request.accepted).assertEqual(shouldAccept('A'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0015
     * @tc.name testCollabIdx0015
     * @tc.desc Verify index ABC is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0015', 0, () => {
      const request: CollaborateRequest = mockRequest('ABC');
      expect(request.index).assertEqual('ABC');
      expect(request.accepted).assertEqual(shouldAccept('ABC'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0016
     * @tc.name testCollabIdx0016
     * @tc.desc Verify index abc is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0016', 0, () => {
      const request: CollaborateRequest = mockRequest('abc');
      expect(request.index).assertEqual('abc');
      expect(request.accepted).assertEqual(shouldAccept('abc'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0017
     * @tc.name testCollabIdx0017
     * @tc.desc Verify index 中文下标 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0017', 0, () => {
      const request: CollaborateRequest = mockRequest('中文下标');
      expect(request.index).assertEqual('中文下标');
      expect(request.accepted).assertEqual(shouldAccept('中文下标'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0018
     * @tc.name testCollabIdx0018
     * @tc.desc Verify index 下标 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0018', 0, () => {
      const request: CollaborateRequest = mockRequest('下标');
      expect(request.index).assertEqual('下标');
      expect(request.accepted).assertEqual(shouldAccept('下标'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0019
     * @tc.name testCollabIdx0019
     * @tc.desc Verify index 1234567890 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0019', 0, () => {
      const request: CollaborateRequest = mockRequest('1234567890');
      expect(request.index).assertEqual('1234567890');
      expect(request.accepted).assertEqual(shouldAccept('1234567890'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0020
     * @tc.name testCollabIdx0020
     * @tc.desc Verify index xxxxxxxxxxxxxxxxxxxx is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0020', 0, () => {
      const request: CollaborateRequest = mockRequest('xxxxxxxxxxxxxxxxxxxx');
      expect(request.index).assertEqual('xxxxxxxxxxxxxxxxxxxx');
      expect(request.accepted).assertEqual(shouldAccept('xxxxxxxxxxxxxxxxxxxx'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0021
     * @tc.name testCollabIdx0021
     * @tc.desc Verify index of length 40 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0021', 0, () => {
      const request: CollaborateRequest = mockRequest('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(request.index).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(request.accepted).assertEqual(shouldAccept('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0022
     * @tc.name testCollabIdx0022
     * @tc.desc Verify index a b is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0022', 0, () => {
      const request: CollaborateRequest = mockRequest('a b');
      expect(request.index).assertEqual('a b');
      expect(request.accepted).assertEqual(shouldAccept('a b'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0023
     * @tc.name testCollabIdx0023
     * @tc.desc Verify index  a  is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0023', 0, () => {
      const request: CollaborateRequest = mockRequest(' a ');
      expect(request.index).assertEqual(' a ');
      expect(request.accepted).assertEqual(shouldAccept(' a '));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0024
     * @tc.name testCollabIdx0024
     * @tc.desc Verify index a	b is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0024', 0, () => {
      const request: CollaborateRequest = mockRequest('a\u0009b');
      expect(request.index).assertEqual('a\u0009b');
      expect(request.accepted).assertEqual(shouldAccept('a\u0009b'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0025
     * @tc.name testCollabIdx0025
     * @tc.desc Verify index ACCEPT is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0025', 0, () => {
      const request: CollaborateRequest = mockRequest('ACCEPT');
      expect(request.index).assertEqual('ACCEPT');
      expect(request.accepted).assertEqual(shouldAccept('ACCEPT'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0026
     * @tc.name testCollabIdx0026
     * @tc.desc Verify index REJECT is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0026', 0, () => {
      const request: CollaborateRequest = mockRequest('REJECT');
      expect(request.index).assertEqual('REJECT');
      expect(request.accepted).assertEqual(shouldAccept('REJECT'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0027
     * @tc.name testCollabIdx0027
     * @tc.desc Verify index -1 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0027', 0, () => {
      const request: CollaborateRequest = mockRequest('-1');
      expect(request.index).assertEqual('-1');
      expect(request.accepted).assertEqual(shouldAccept('-1'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0028
     * @tc.name testCollabIdx0028
     * @tc.desc Verify index 0.0 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0028', 0, () => {
      const request: CollaborateRequest = mockRequest('0.0');
      expect(request.index).assertEqual('0.0');
      expect(request.accepted).assertEqual(shouldAccept('0.0'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0029
     * @tc.name testCollabIdx0029
     * @tc.desc Verify index null is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0029', 0, () => {
      const request: CollaborateRequest = mockRequest('null');
      expect(request.index).assertEqual('null');
      expect(request.accepted).assertEqual(shouldAccept('null'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0030
     * @tc.name testCollabIdx0030
     * @tc.desc Verify index undefined is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0030', 0, () => {
      const request: CollaborateRequest = mockRequest('undefined');
      expect(request.index).assertEqual('undefined');
      expect(request.accepted).assertEqual(shouldAccept('undefined'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0031
     * @tc.name testCollabIdx0031
     * @tc.desc Verify index 😀 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0031', 0, () => {
      const request: CollaborateRequest = mockRequest('😀');
      expect(request.index).assertEqual('😀');
      expect(request.accepted).assertEqual(shouldAccept('😀'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0032
     * @tc.name testCollabIdx0032
     * @tc.desc Verify index 🐾 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0032', 0, () => {
      const request: CollaborateRequest = mockRequest('🐾');
      expect(request.index).assertEqual('🐾');
      expect(request.accepted).assertEqual(shouldAccept('🐾'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0033
     * @tc.name testCollabIdx0033
     * @tc.desc Verify index ① is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0033', 0, () => {
      const request: CollaborateRequest = mockRequest('①');
      expect(request.index).assertEqual('①');
      expect(request.accepted).assertEqual(shouldAccept('①'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0034
     * @tc.name testCollabIdx0034
     * @tc.desc Verify index ① ② is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0034', 0, () => {
      const request: CollaborateRequest = mockRequest('① ②');
      expect(request.index).assertEqual('① ②');
      expect(request.accepted).assertEqual(shouldAccept('① ②'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0035
     * @tc.name testCollabIdx0035
     * @tc.desc Verify index ①.1 is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0035', 0, () => {
      const request: CollaborateRequest = mockRequest('①.1');
      expect(request.index).assertEqual('①.1');
      expect(request.accepted).assertEqual(shouldAccept('①.1'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0036
     * @tc.name testCollabIdx0036
     * @tc.desc Verify index 中文 and english is accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0036', 0, () => {
      const request: CollaborateRequest = mockRequest('中文 and english');
      expect(request.index).assertEqual('中文 and english');
      expect(request.accepted).assertEqual(shouldAccept('中文 and english'));
      expect(request.keyCount).assertEqual(1);
      expect(request.describe().indexOf(request.accepted ? 'ACCEPT' : 'REJECT') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0037
     * @tc.name testCollabIdx0037
     * @tc.desc Verify a wantParam with 0 key(s) yields 0 key count entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0037', 0, () => {
      const want: Record<string, Object> = {};
      const request: CollaborateRequest = buildRequest(want);
      expect(request.keyCount).assertEqual(0);
      expect(request.index).assertEqual('');
      expect(request.accepted).assertEqual(request.index.trim().length > 0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0038
     * @tc.name testCollabIdx0038
     * @tc.desc Verify a wantParam with 1 key(s) yields 1 key count entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0038', 0, () => {
      const want: Record<string, Object> = {};
      want[COLLAB_KEY] = 'sample-index-0';
      const request: CollaborateRequest = buildRequest(want);
      expect(request.keyCount).assertEqual(1);
      expect(request.index).assertEqual('sample-index-0');
      expect(request.accepted).assertEqual(request.index.trim().length > 0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0039
     * @tc.name testCollabIdx0039
     * @tc.desc Verify a wantParam with 1 key(s) yields 1 key count entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0039', 0, () => {
      const want: Record<string, Object> = {};
      want['other'] = 'sample-index-0';
      const request: CollaborateRequest = buildRequest(want);
      expect(request.keyCount).assertEqual(1);
      expect(request.index).assertEqual('');
      expect(request.accepted).assertEqual(request.index.trim().length > 0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0040
     * @tc.name testCollabIdx0040
     * @tc.desc Verify a wantParam with 2 key(s) yields 2 key count entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0040', 0, () => {
      const want: Record<string, Object> = {};
      want[COLLAB_KEY] = 'sample-index-0';
      want['other'] = 'sample-index-0';
      const request: CollaborateRequest = buildRequest(want);
      expect(request.keyCount).assertEqual(2);
      expect(request.index).assertEqual('sample-index-0');
      expect(request.accepted).assertEqual(request.index.trim().length > 0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0041
     * @tc.name testCollabIdx0041
     * @tc.desc Verify a wantParam with 3 key(s) yields 3 key count entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0041', 0, () => {
      const want: Record<string, Object> = {};
      want[COLLAB_KEY] = 'sample-index-0';
      want['a'] = 'sample-index-0';
      want['b'] = 'sample-index-0';
      const request: CollaborateRequest = buildRequest(want);
      expect(request.keyCount).assertEqual(3);
      expect(request.index).assertEqual('sample-index-0');
      expect(request.accepted).assertEqual(request.index.trim().length > 0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0042
     * @tc.name testCollabIdx0042
     * @tc.desc Verify a wantParam with 4 key(s) yields 4 key count entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0042', 0, () => {
      const want: Record<string, Object> = {};
      want[COLLAB_KEY] = 'sample-index-0';
      want['a'] = 'sample-index-0';
      want['b'] = 'sample-index-0';
      want['c'] = 'sample-index-0';
      const request: CollaborateRequest = buildRequest(want);
      expect(request.keyCount).assertEqual(4);
      expect(request.index).assertEqual('sample-index-0');
      expect(request.accepted).assertEqual(request.index.trim().length > 0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLLAB_0043
     * @tc.name testCollabIdx0043
     * @tc.desc Verify a wantParam with 2 key(s) yields 2 key count entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCollabIdx0043', 0, () => {
      const want: Record<string, Object> = {};
      want['a'] = 'sample-index-0';
      want['b'] = 'sample-index-0';
      const request: CollaborateRequest = buildRequest(want);
      expect(request.keyCount).assertEqual(2);
      expect(request.index).assertEqual('');
      expect(request.accepted).assertEqual(request.index.trim().length > 0);
    });

  });
}
