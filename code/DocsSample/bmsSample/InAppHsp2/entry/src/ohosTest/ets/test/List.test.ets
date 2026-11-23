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

import bundleCoreMatrixTest from './BundleCoreMatrix.test';
import entryModuleMatrixTest from './EntryModuleMatrix.test';
import libraryModuleMatrixTest from './LibraryModuleMatrix.test';
import hspIntegrationMatrixTest from './HspIntegrationMatrix.test';
import entryResourceMatrixTest from './EntryResourceMatrix.test';
import libraryResourceMatrixTest from './LibraryResourceMatrix.test';
import contextDirMatrixTest from './ContextDirMatrix.test';
import cacheIoMatrixTest from './FileCacheIoMatrix.test';
import cacheErrorMatrixTest from './FileCacheErrorMatrix.test';
import displayMatrixTest from './DisplayMatrix.test';
import encodingMatrixTest from './TextEncodingMatrix.test';
import arrayMatrixTest from './ArrayLogicMatrix.test';
import numberMatrixTest from './NumberFormatMatrix.test';
import stringMatrixTest from './StringParseMatrix.test';
import abilityLifecycleTest from './AbilityLifecycleMatrix.test';

export default function testsuite() {
  bundleCoreMatrixTest();
  entryModuleMatrixTest();
  libraryModuleMatrixTest();
  hspIntegrationMatrixTest();
  entryResourceMatrixTest();
  libraryResourceMatrixTest();
  contextDirMatrixTest();
  cacheIoMatrixTest();
  cacheErrorMatrixTest();
  displayMatrixTest();
  encodingMatrixTest();
  arrayMatrixTest();
  numberMatrixTest();
  stringMatrixTest();
  abilityLifecycleTest();
}
