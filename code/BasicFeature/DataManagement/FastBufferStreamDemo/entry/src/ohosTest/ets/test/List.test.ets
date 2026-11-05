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
import abilityTest from './Ability.test';
import fastBufferBasicsTest from './FastBufferBasics.test';
import fastBufferMatrixTest from './FastBufferMatrix.test';
import streamPipelineTest from './StreamPipeline.test';
import fastBufferUtilTest from './FastBufferUtil.test';
import fastBufferUtilMatrixTest from './FastBufferUtilMatrix.test';
import streamFileUtilTest from './StreamFileUtil.test';
import streamFileMatrixTest from './StreamFileMatrix.test';
import perfTimerTest from './PerfTimer.test';
import perfTimerMatrixTest from './PerfTimerMatrix.test';
import deviceUtilTest from './DeviceUtil.test';
import deviceUtilMatrixTest from './DeviceUtilMatrix.test';
import logUtilTest from './LogUtil.test';
import logUtilMatrixTest from './LogUtilMatrix.test';
import tlvUtilTest from './TlvUtil.test';
import tlvMatrixTest from './TlvMatrix.test';

export default function testsuite() {
  abilityTest();
  fastBufferBasicsTest();
  fastBufferMatrixTest();
  fastBufferUtilTest();
  fastBufferUtilMatrixTest();
  streamFileUtilTest();
  streamFileMatrixTest();
  perfTimerTest();
  perfTimerMatrixTest();
  deviceUtilTest();
  deviceUtilMatrixTest();
  logUtilTest();
  logUtilMatrixTest();
  streamPipelineTest();
  tlvUtilTest();
  tlvMatrixTest();
}
