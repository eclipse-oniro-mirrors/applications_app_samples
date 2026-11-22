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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/PerfTestSupport';
import {
  average,
} from '../model/PerfTestLogic';

/** AverageTest logic checks (32 cases). */
export default function averageTest(): void {
  describe('AverageTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_AVERAGE_0001
     * @tc.name      Perf_Average_0001
     * @tc.desc      average([0]) is 0.
