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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';
import { resourceManager } from '@kit.LocalizationKit';
import { entryContext, PngOracle } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function resourceIdMatrixTest() {
  describe('resourceIdMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_RID_0001
   * @tc.name      testResourceId0001
   * @tc.desc      String id module_desc literal value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testResourceId0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testResourceId0001', 'module_desc literal value');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.module_desc');
    expect(res.getStringSync(ref)).assertEqual('module description');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_RID_0002
   * @tc.name      testResourceId0002
   * @tc.desc      String id module_desc literal length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testResourceId0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testResourceId0002', 'module_desc literal length');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const ref: Resource = $r('app.string.module_desc');
    expect(res.getStringSync(ref).length).assertEqual(18);
    expect(res.getStringByNameSync('module_desc').length).assertEqual(18);
