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
  describeThrown, distributedErrorHint, errorInfo, formatError
} from '../../../main/ets/utils/ErrorUtil';

/**
 * 错误文案网格：21 个错误码（含 2 个未登记码）× 3 种 message（空串 / 一段英文 / 带数字的英文），共 63 条。
 * describeThrown 必须是「formatError + 分号 + hint」的严格拼接，任何一段丢了都会被这条断言抓住。
 * 空 message 会被兜底成「未知错误」，`ErrorInfo.describe()` 在 code > 0 时统一渲染成 `[code] message`。
 */
export default function distributedErrorMessageGridTest() {
  describe('DistributedErrorMessageGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0001
     * @tc.name testErrMsg0001
     * @tc.desc Verify code 201 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0001', 0, () => {
      const hint: string = distributedErrorHint(201);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 201, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 201, detail) + '；' + hint);
      expect(errorInfo(201, detail).describe()).assertEqual('[201] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 201, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0002
     * @tc.name testErrMsg0002
     * @tc.desc Verify code 201 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0002', 0, () => {
      const hint: string = distributedErrorHint(201);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 201, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 201, detail) + '；' + hint);
      expect(errorInfo(201, detail).describe()).assertEqual('[201] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 201, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0003
     * @tc.name testErrMsg0003
     * @tc.desc Verify code 201 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0003', 0, () => {
      const hint: string = distributedErrorHint(201);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 201, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 201, detail) + '；' + hint);
      expect(errorInfo(201, detail).describe()).assertEqual('[201] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 201, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0004
     * @tc.name testErrMsg0004
     * @tc.desc Verify code 801 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0004', 0, () => {
      const hint: string = distributedErrorHint(801);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 801, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 801, detail) + '；' + hint);
      expect(errorInfo(801, detail).describe()).assertEqual('[801] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 801, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0005
     * @tc.name testErrMsg0005
     * @tc.desc Verify code 801 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0005', 0, () => {
      const hint: string = distributedErrorHint(801);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 801, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 801, detail) + '；' + hint);
      expect(errorInfo(801, detail).describe()).assertEqual('[801] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 801, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0006
     * @tc.name testErrMsg0006
     * @tc.desc Verify code 801 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0006', 0, () => {
      const hint: string = distributedErrorHint(801);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 801, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 801, detail) + '；' + hint);
      expect(errorInfo(801, detail).describe()).assertEqual('[801] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 801, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0007
     * @tc.name testErrMsg0007
     * @tc.desc Verify code 32390001 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0007', 0, () => {
      const hint: string = distributedErrorHint(32390001);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390001, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390001, detail) + '；' + hint);
      expect(errorInfo(32390001, detail).describe()).assertEqual('[32390001] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390001, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0008
     * @tc.name testErrMsg0008
     * @tc.desc Verify code 32390001 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0008', 0, () => {
      const hint: string = distributedErrorHint(32390001);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390001, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390001, detail) + '；' + hint);
      expect(errorInfo(32390001, detail).describe()).assertEqual('[32390001] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390001, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0009
     * @tc.name testErrMsg0009
     * @tc.desc Verify code 32390001 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0009', 0, () => {
      const hint: string = distributedErrorHint(32390001);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390001, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390001, detail) + '；' + hint);
      expect(errorInfo(32390001, detail).describe()).assertEqual('[32390001] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390001, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0010
     * @tc.name testErrMsg0010
     * @tc.desc Verify code 32390002 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0010', 0, () => {
      const hint: string = distributedErrorHint(32390002);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390002, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390002, detail) + '；' + hint);
      expect(errorInfo(32390002, detail).describe()).assertEqual('[32390002] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390002, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0011
     * @tc.name testErrMsg0011
     * @tc.desc Verify code 32390002 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0011', 0, () => {
      const hint: string = distributedErrorHint(32390002);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390002, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390002, detail) + '；' + hint);
      expect(errorInfo(32390002, detail).describe()).assertEqual('[32390002] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390002, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0012
     * @tc.name testErrMsg0012
     * @tc.desc Verify code 32390002 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0012', 0, () => {
      const hint: string = distributedErrorHint(32390002);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390002, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390002, detail) + '；' + hint);
      expect(errorInfo(32390002, detail).describe()).assertEqual('[32390002] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390002, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0013
     * @tc.name testErrMsg0013
     * @tc.desc Verify code 32390004 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0013', 0, () => {
      const hint: string = distributedErrorHint(32390004);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390004, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390004, detail) + '；' + hint);
      expect(errorInfo(32390004, detail).describe()).assertEqual('[32390004] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390004, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0014
     * @tc.name testErrMsg0014
     * @tc.desc Verify code 32390004 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0014', 0, () => {
      const hint: string = distributedErrorHint(32390004);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390004, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390004, detail) + '；' + hint);
      expect(errorInfo(32390004, detail).describe()).assertEqual('[32390004] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390004, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0015
     * @tc.name testErrMsg0015
     * @tc.desc Verify code 32390004 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0015', 0, () => {
      const hint: string = distributedErrorHint(32390004);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390004, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390004, detail) + '；' + hint);
      expect(errorInfo(32390004, detail).describe()).assertEqual('[32390004] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390004, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0016
     * @tc.name testErrMsg0016
     * @tc.desc Verify code 32390006 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0016', 0, () => {
      const hint: string = distributedErrorHint(32390006);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390006, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390006, detail) + '；' + hint);
      expect(errorInfo(32390006, detail).describe()).assertEqual('[32390006] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390006, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0017
     * @tc.name testErrMsg0017
     * @tc.desc Verify code 32390006 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0017', 0, () => {
      const hint: string = distributedErrorHint(32390006);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390006, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390006, detail) + '；' + hint);
      expect(errorInfo(32390006, detail).describe()).assertEqual('[32390006] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390006, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0018
     * @tc.name testErrMsg0018
     * @tc.desc Verify code 32390006 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0018', 0, () => {
      const hint: string = distributedErrorHint(32390006);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390006, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390006, detail) + '；' + hint);
      expect(errorInfo(32390006, detail).describe()).assertEqual('[32390006] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390006, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0019
     * @tc.name testErrMsg0019
     * @tc.desc Verify code 32390100 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0019', 0, () => {
      const hint: string = distributedErrorHint(32390100);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390100, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390100, detail) + '；' + hint);
      expect(errorInfo(32390100, detail).describe()).assertEqual('[32390100] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390100, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0020
     * @tc.name testErrMsg0020
     * @tc.desc Verify code 32390100 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0020', 0, () => {
      const hint: string = distributedErrorHint(32390100);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390100, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390100, detail) + '；' + hint);
      expect(errorInfo(32390100, detail).describe()).assertEqual('[32390100] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390100, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0021
     * @tc.name testErrMsg0021
     * @tc.desc Verify code 32390100 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0021', 0, () => {
      const hint: string = distributedErrorHint(32390100);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390100, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390100, detail) + '；' + hint);
      expect(errorInfo(32390100, detail).describe()).assertEqual('[32390100] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390100, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0022
     * @tc.name testErrMsg0022
     * @tc.desc Verify code 32390101 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0022', 0, () => {
      const hint: string = distributedErrorHint(32390101);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390101, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390101, detail) + '；' + hint);
      expect(errorInfo(32390101, detail).describe()).assertEqual('[32390101] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390101, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0023
     * @tc.name testErrMsg0023
     * @tc.desc Verify code 32390101 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0023', 0, () => {
      const hint: string = distributedErrorHint(32390101);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390101, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390101, detail) + '；' + hint);
      expect(errorInfo(32390101, detail).describe()).assertEqual('[32390101] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390101, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0024
     * @tc.name testErrMsg0024
     * @tc.desc Verify code 32390101 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0024', 0, () => {
      const hint: string = distributedErrorHint(32390101);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390101, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390101, detail) + '；' + hint);
      expect(errorInfo(32390101, detail).describe()).assertEqual('[32390101] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390101, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0025
     * @tc.name testErrMsg0025
     * @tc.desc Verify code 32390102 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0025', 0, () => {
      const hint: string = distributedErrorHint(32390102);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390102, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390102, detail) + '；' + hint);
      expect(errorInfo(32390102, detail).describe()).assertEqual('[32390102] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390102, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0026
     * @tc.name testErrMsg0026
     * @tc.desc Verify code 32390102 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0026', 0, () => {
      const hint: string = distributedErrorHint(32390102);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390102, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390102, detail) + '；' + hint);
      expect(errorInfo(32390102, detail).describe()).assertEqual('[32390102] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390102, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0027
     * @tc.name testErrMsg0027
     * @tc.desc Verify code 32390102 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0027', 0, () => {
      const hint: string = distributedErrorHint(32390102);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390102, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390102, detail) + '；' + hint);
      expect(errorInfo(32390102, detail).describe()).assertEqual('[32390102] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390102, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0028
     * @tc.name testErrMsg0028
     * @tc.desc Verify code 32390103 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0028', 0, () => {
      const hint: string = distributedErrorHint(32390103);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390103, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390103, detail) + '；' + hint);
      expect(errorInfo(32390103, detail).describe()).assertEqual('[32390103] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390103, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0029
     * @tc.name testErrMsg0029
     * @tc.desc Verify code 32390103 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0029', 0, () => {
      const hint: string = distributedErrorHint(32390103);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390103, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390103, detail) + '；' + hint);
      expect(errorInfo(32390103, detail).describe()).assertEqual('[32390103] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390103, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0030
     * @tc.name testErrMsg0030
     * @tc.desc Verify code 32390103 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0030', 0, () => {
      const hint: string = distributedErrorHint(32390103);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390103, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390103, detail) + '；' + hint);
      expect(errorInfo(32390103, detail).describe()).assertEqual('[32390103] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390103, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0031
     * @tc.name testErrMsg0031
     * @tc.desc Verify code 32390104 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0031', 0, () => {
      const hint: string = distributedErrorHint(32390104);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390104, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390104, detail) + '；' + hint);
      expect(errorInfo(32390104, detail).describe()).assertEqual('[32390104] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390104, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0032
     * @tc.name testErrMsg0032
     * @tc.desc Verify code 32390104 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0032', 0, () => {
      const hint: string = distributedErrorHint(32390104);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390104, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390104, detail) + '；' + hint);
      expect(errorInfo(32390104, detail).describe()).assertEqual('[32390104] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390104, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0033
     * @tc.name testErrMsg0033
     * @tc.desc Verify code 32390104 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0033', 0, () => {
      const hint: string = distributedErrorHint(32390104);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390104, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390104, detail) + '；' + hint);
      expect(errorInfo(32390104, detail).describe()).assertEqual('[32390104] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390104, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0034
     * @tc.name testErrMsg0034
     * @tc.desc Verify code 32390200 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0034', 0, () => {
      const hint: string = distributedErrorHint(32390200);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390200, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390200, detail) + '；' + hint);
      expect(errorInfo(32390200, detail).describe()).assertEqual('[32390200] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390200, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0035
     * @tc.name testErrMsg0035
     * @tc.desc Verify code 32390200 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0035', 0, () => {
      const hint: string = distributedErrorHint(32390200);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390200, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390200, detail) + '；' + hint);
      expect(errorInfo(32390200, detail).describe()).assertEqual('[32390200] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390200, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0036
     * @tc.name testErrMsg0036
     * @tc.desc Verify code 32390200 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0036', 0, () => {
      const hint: string = distributedErrorHint(32390200);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390200, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390200, detail) + '；' + hint);
      expect(errorInfo(32390200, detail).describe()).assertEqual('[32390200] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390200, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0037
     * @tc.name testErrMsg0037
     * @tc.desc Verify code 32390201 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0037', 0, () => {
      const hint: string = distributedErrorHint(32390201);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390201, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390201, detail) + '；' + hint);
      expect(errorInfo(32390201, detail).describe()).assertEqual('[32390201] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390201, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0038
     * @tc.name testErrMsg0038
     * @tc.desc Verify code 32390201 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0038', 0, () => {
      const hint: string = distributedErrorHint(32390201);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390201, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390201, detail) + '；' + hint);
      expect(errorInfo(32390201, detail).describe()).assertEqual('[32390201] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390201, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0039
     * @tc.name testErrMsg0039
     * @tc.desc Verify code 32390201 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0039', 0, () => {
      const hint: string = distributedErrorHint(32390201);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390201, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390201, detail) + '；' + hint);
      expect(errorInfo(32390201, detail).describe()).assertEqual('[32390201] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390201, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0040
     * @tc.name testErrMsg0040
     * @tc.desc Verify code 32390202 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0040', 0, () => {
      const hint: string = distributedErrorHint(32390202);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390202, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390202, detail) + '；' + hint);
      expect(errorInfo(32390202, detail).describe()).assertEqual('[32390202] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390202, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0041
     * @tc.name testErrMsg0041
     * @tc.desc Verify code 32390202 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0041', 0, () => {
      const hint: string = distributedErrorHint(32390202);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390202, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390202, detail) + '；' + hint);
      expect(errorInfo(32390202, detail).describe()).assertEqual('[32390202] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390202, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0042
     * @tc.name testErrMsg0042
     * @tc.desc Verify code 32390202 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0042', 0, () => {
      const hint: string = distributedErrorHint(32390202);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390202, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390202, detail) + '；' + hint);
      expect(errorInfo(32390202, detail).describe()).assertEqual('[32390202] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390202, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0043
     * @tc.name testErrMsg0043
     * @tc.desc Verify code 32390203 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0043', 0, () => {
      const hint: string = distributedErrorHint(32390203);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390203, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390203, detail) + '；' + hint);
      expect(errorInfo(32390203, detail).describe()).assertEqual('[32390203] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390203, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0044
     * @tc.name testErrMsg0044
     * @tc.desc Verify code 32390203 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0044', 0, () => {
      const hint: string = distributedErrorHint(32390203);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390203, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390203, detail) + '；' + hint);
      expect(errorInfo(32390203, detail).describe()).assertEqual('[32390203] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390203, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0045
     * @tc.name testErrMsg0045
     * @tc.desc Verify code 32390203 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0045', 0, () => {
      const hint: string = distributedErrorHint(32390203);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390203, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390203, detail) + '；' + hint);
      expect(errorInfo(32390203, detail).describe()).assertEqual('[32390203] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390203, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0046
     * @tc.name testErrMsg0046
     * @tc.desc Verify code 32390204 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0046', 0, () => {
      const hint: string = distributedErrorHint(32390204);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390204, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390204, detail) + '；' + hint);
      expect(errorInfo(32390204, detail).describe()).assertEqual('[32390204] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390204, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0047
     * @tc.name testErrMsg0047
     * @tc.desc Verify code 32390204 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0047', 0, () => {
      const hint: string = distributedErrorHint(32390204);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390204, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390204, detail) + '；' + hint);
      expect(errorInfo(32390204, detail).describe()).assertEqual('[32390204] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390204, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0048
     * @tc.name testErrMsg0048
     * @tc.desc Verify code 32390204 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0048', 0, () => {
      const hint: string = distributedErrorHint(32390204);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390204, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390204, detail) + '；' + hint);
      expect(errorInfo(32390204, detail).describe()).assertEqual('[32390204] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390204, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0049
     * @tc.name testErrMsg0049
     * @tc.desc Verify code 32390205 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0049', 0, () => {
      const hint: string = distributedErrorHint(32390205);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390205, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390205, detail) + '；' + hint);
      expect(errorInfo(32390205, detail).describe()).assertEqual('[32390205] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390205, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0050
     * @tc.name testErrMsg0050
     * @tc.desc Verify code 32390205 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0050', 0, () => {
      const hint: string = distributedErrorHint(32390205);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390205, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390205, detail) + '；' + hint);
      expect(errorInfo(32390205, detail).describe()).assertEqual('[32390205] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390205, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0051
     * @tc.name testErrMsg0051
     * @tc.desc Verify code 32390205 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0051', 0, () => {
      const hint: string = distributedErrorHint(32390205);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390205, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390205, detail) + '；' + hint);
      expect(errorInfo(32390205, detail).describe()).assertEqual('[32390205] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390205, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0052
     * @tc.name testErrMsg0052
     * @tc.desc Verify code 32390206 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0052', 0, () => {
      const hint: string = distributedErrorHint(32390206);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390206, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390206, detail) + '；' + hint);
      expect(errorInfo(32390206, detail).describe()).assertEqual('[32390206] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390206, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0053
     * @tc.name testErrMsg0053
     * @tc.desc Verify code 32390206 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0053', 0, () => {
      const hint: string = distributedErrorHint(32390206);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390206, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390206, detail) + '；' + hint);
      expect(errorInfo(32390206, detail).describe()).assertEqual('[32390206] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390206, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0054
     * @tc.name testErrMsg0054
     * @tc.desc Verify code 32390206 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0054', 0, () => {
      const hint: string = distributedErrorHint(32390206);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390206, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390206, detail) + '；' + hint);
      expect(errorInfo(32390206, detail).describe()).assertEqual('[32390206] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390206, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0055
     * @tc.name testErrMsg0055
     * @tc.desc Verify code 32390300 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0055', 0, () => {
      const hint: string = distributedErrorHint(32390300);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390300, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390300, detail) + '；' + hint);
      expect(errorInfo(32390300, detail).describe()).assertEqual('[32390300] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390300, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0056
     * @tc.name testErrMsg0056
     * @tc.desc Verify code 32390300 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0056', 0, () => {
      const hint: string = distributedErrorHint(32390300);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390300, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390300, detail) + '；' + hint);
      expect(errorInfo(32390300, detail).describe()).assertEqual('[32390300] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390300, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0057
     * @tc.name testErrMsg0057
     * @tc.desc Verify code 32390300 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0057', 0, () => {
      const hint: string = distributedErrorHint(32390300);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390300, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390300, detail) + '；' + hint);
      expect(errorInfo(32390300, detail).describe()).assertEqual('[32390300] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390300, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0058
     * @tc.name testErrMsg0058
     * @tc.desc Verify code 32390210 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0058', 0, () => {
      const hint: string = distributedErrorHint(32390210);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390210, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390210, detail) + '；' + hint);
      expect(errorInfo(32390210, detail).describe()).assertEqual('[32390210] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390210, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0059
     * @tc.name testErrMsg0059
     * @tc.desc Verify code 32390210 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0059', 0, () => {
      const hint: string = distributedErrorHint(32390210);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390210, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390210, detail) + '；' + hint);
      expect(errorInfo(32390210, detail).describe()).assertEqual('[32390210] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390210, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0060
     * @tc.name testErrMsg0060
     * @tc.desc Verify code 32390210 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0060', 0, () => {
      const hint: string = distributedErrorHint(32390210);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390210, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390210, detail) + '；' + hint);
      expect(errorInfo(32390210, detail).describe()).assertEqual('[32390210] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390210, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0061
     * @tc.name testErrMsg0061
     * @tc.desc Verify code 32390400 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0061', 0, () => {
      const hint: string = distributedErrorHint(32390400);
      const detail: string = '';
      const line: string = describeThrown('openProxyChannel', 32390400, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390400, detail) + '；' + hint);
      expect(errorInfo(32390400, detail).describe()).assertEqual('[32390400] 未知错误');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390400, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0062
     * @tc.name testErrMsg0062
     * @tc.desc Verify code 32390400 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0062', 0, () => {
      const hint: string = distributedErrorHint(32390400);
      const detail: string = 'Permission denied.';
      const line: string = describeThrown('openProxyChannel', 32390400, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390400, detail) + '；' + hint);
      expect(errorInfo(32390400, detail).describe()).assertEqual('[32390400] Permission denied.');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390400, detail).startsWith('sendData失败')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ERRMSG_0063
     * @tc.name testErrMsg0063
     * @tc.desc Verify code 32390400 composes a single description line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrMsg0063', 0, () => {
      const hint: string = distributedErrorHint(32390400);
      const detail: string = 'code 32390103 happens';
      const line: string = describeThrown('openProxyChannel', 32390400, detail);
      expect(line).assertEqual(formatError('openProxyChannel', 32390400, detail) + '；' + hint);
      expect(errorInfo(32390400, detail).describe()).assertEqual('[32390400] code 32390103 happens');
      expect(hint.length > 0).assertTrue();
      expect(describeThrown('sendData', 32390400, detail).startsWith('sendData失败')).assertTrue();
    });

  });
}
