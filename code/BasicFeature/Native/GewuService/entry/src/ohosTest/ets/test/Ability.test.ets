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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';

const DOMAIN = 0xF811;
const TAG = '[Sample_GewuService]';
const DEFAULT_MODEL_PATH = '/data/storage/el2/base/files/Qwen2_5_0_5B_CPU_Q4';
const INVALID_MODEL_PATH = '/data/storage/el2/base/files/NotExistModel';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * 使用设备上默认模型路径创建格物会话，验证 OH_QoS_GewuCreateSession 调用成功返回 OH_QOS_GEWU_OK(0)。
     */
    it('GewuService_CreateSession_001', 0, () => {
      hilog.info(DOMAIN, TAG, 'GewuService_CreateSession_001, begin');
      let code: number = testNapi.createSession(DEFAULT_MODEL_PATH);
      hilog.info(DOMAIN, TAG, 'GewuService_CreateSession_001, modelPath=%{public}s code=%{public}d',
        DEFAULT_MODEL_PATH, code);
      expect(code).assertEqual(0);
      code = testNapi.destroySession();
      hilog.info(DOMAIN, TAG, 'GewuService_CreateSession_001, destroySession code=%{public}d', code);
      expect(code).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'GewuService_CreateSession_001, end');
    })

    /**
     * 使用不存在的模型路径创建格物会话，验证创建失败时返回非 OH_QOS_GEWU_OK 的错误码且应用不崩溃。
     */
    it('GewuService_CreateSession_002', 0, () => {
      hilog.info(DOMAIN, TAG, 'GewuService_CreateSession_002, begin');
      let code: number = testNapi.createSession(INVALID_MODEL_PATH);
      hilog.info(DOMAIN, TAG, 'GewuService_CreateSession_002, modelPath=%{public}s code=%{public}d',
        INVALID_MODEL_PATH, code);
      expect(code === 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'GewuService_CreateSession_002, end');
    })

    /**
     * 创建格物会话后提交推理请求，验证 OH_QoS_GewuSubmitRequest 调用成功（返回 OH_QOS_GEWU_OK）且能取回非空的推理结果。
     */
    it('GewuService_SubmitRequest_001', 0, () => {
      hilog.info(DOMAIN, TAG, 'GewuService_SubmitRequest_001, begin');
      let code: number = testNapi.createSession(DEFAULT_MODEL_PATH);
      hilog.info(DOMAIN, TAG, 'GewuService_SubmitRequest_001, createSession code=%{public}d', code);
      expect(code).assertEqual(0);
      code = testNapi.submitRequest('What is LLM?');
      let response: string = testNapi.getResponse();
      hilog.info(DOMAIN, TAG, 'GewuService_SubmitRequest_001, submitRequest code=%{public}d response=%{public}s',
        code, response);
      expect(code).assertEqual(0);
      expect(response.length).assertLarger(0);
      code = testNapi.destroySession();
      hilog.info(DOMAIN, TAG, 'GewuService_SubmitRequest_001, destroySession code=%{public}d', code);
      expect(code).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'GewuService_SubmitRequest_001, end');
    })

    /**
     * 创建格物会话并提交请求后调用中止接口，验证 OH_QoS_GewuAbortRequest 返回定义域内的错误码（枚举值均非负）且应用不崩溃。
     */
    it('GewuService_AbortRequest_001', 0, () => {
      hilog.info(DOMAIN, TAG, 'GewuService_AbortRequest_001, begin');
      let code: number = testNapi.createSession(DEFAULT_MODEL_PATH);
      hilog.info(DOMAIN, TAG, 'GewuService_AbortRequest_001, createSession code=%{public}d', code);
      expect(code).assertEqual(0);
      code = testNapi.submitRequest('What is LLM?');
      hilog.info(DOMAIN, TAG, 'GewuService_AbortRequest_001, submitRequest code=%{public}d', code);
      expect(code).assertEqual(0);
      code = testNapi.abortRequest();
      hilog.info(DOMAIN, TAG, 'GewuService_AbortRequest_001, abortRequest code=%{public}d', code);
      expect(code).assertLargerOrEqual(0);
      code = testNapi.destroySession();
      hilog.info(DOMAIN, TAG, 'GewuService_AbortRequest_001, destroySession code=%{public}d', code);
      expect(code).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'GewuService_AbortRequest_001, end');
    })

    /**
     * 未创建会话时直接销毁会话，验证接口返回 OH_QOS_GEWU_NOENT 错误码且应用不崩溃。
     */
    it('GewuService_DestroySession_001', 0, () => {
      hilog.info(DOMAIN, TAG, 'GewuService_DestroySession_001, begin');
      let code: number = testNapi.destroySession();
      hilog.info(DOMAIN, TAG, 'GewuService_DestroySession_001, destroySession code=%{public}d', code);
      expect(code === 0).assertFalse();
      hilog.info(DOMAIN, TAG, 'GewuService_DestroySession_001, end');
    })
  })
}
