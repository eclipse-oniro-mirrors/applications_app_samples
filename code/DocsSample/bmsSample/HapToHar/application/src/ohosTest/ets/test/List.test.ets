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

import bundleInfoGuardTest from './BundleInfoGuard.test';
import moduleResourceGuardTest from './ModuleResourceGuard.test';
import harRuntimeMatrixTest from './HarRuntimeMatrix.test';
import appFactsMatrixTest from './AppFactsMatrix.test';
import harStringMatrixTest from './HarStringMatrix.test';
import harFontColorMatrixTest from './HarFontColorMatrix.test';
import harMediaMatrixTest from './HarMediaMatrix.test';
import mediaChecksumMatrixTest from './MediaChecksumMatrix.test';
import directoryFactsMatrixTest from './DirectoryFactsMatrix.test';
import draftIoMatrixTest from './DraftIoMatrix.test';
import prefStoreMatrixTest from './PrefStoreMatrix.test';
import encodeTextMatrixTest from './EncodeTextMatrix.test';
import jsonDocMatrixTest from './JsonDocMatrix.test';
import numberSenseMatrixTest from './NumberSenseMatrix.test';
import textSenseMatrixTest from './TextSenseMatrix.test';
import collectionSenseMatrixTest from './CollectionSenseMatrix.test';
import timeSenseMatrixTest from './TimeSenseMatrix.test';
import mathSenseMatrixTest from './MathSenseMatrix.test';
import displayFactsMatrixTest from './DisplayFactsMatrix.test';
import fileErrorMatrixTest from './FileErrorMatrix.test';
import wantFactsMatrixTest from './WantFactsMatrix.test';
import resourceIdMatrixTest from './ResourceIdMatrix.test';

export default function testsuite() {
  bundleInfoGuardTest();
  moduleResourceGuardTest();
  harRuntimeMatrixTest();
  appFactsMatrixTest();
  harStringMatrixTest();
  harFontColorMatrixTest();
  harMediaMatrixTest();
  mediaChecksumMatrixTest();
  directoryFactsMatrixTest();
  draftIoMatrixTest();
  prefStoreMatrixTest();
  encodeTextMatrixTest();
  jsonDocMatrixTest();
  numberSenseMatrixTest();
  textSenseMatrixTest();
  collectionSenseMatrixTest();
  timeSenseMatrixTest();
  mathSenseMatrixTest();
  displayFactsMatrixTest();
  fileErrorMatrixTest();
  wantFactsMatrixTest();
  resourceIdMatrixTest();
}
