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

import encodeTextMatrixTest from './EncodeTextMatrix.test';
import jsonDocMatrixTest from './JsonDocMatrix.test';
import numberSenseMatrixTest from './NumberSenseMatrix.test';
import textSenseMatrixTest from './TextSenseMatrix.test';
import collectionSenseMatrixTest from './CollectionSenseMatrix.test';
import timeSenseMatrixTest from './TimeSenseMatrix.test';
import mathSenseMatrixTest from './MathSenseMatrix.test';
import moduleNameMatrixTest from './ModuleNameMatrix.test';
import versionMatrixTest from './VersionMatrix.test';
import hspTextMatrixTest from './HspTextMatrix.test';
import draftIoMatrixTest from './DraftIoMatrix.test';
import prefStoreMatrixTest from './PrefStoreMatrix.test';
import bundleFactsMatrixTest from './BundleFactsMatrix.test';
import moduleFactsMatrixTest from './ModuleFactsMatrix.test';
import entryStringMatrixTest from './EntryStringMatrix.test';
import libraryFactsMatrixTest from './LibraryFactsMatrix.test';
import appScopeMatrixTest from './AppScopeMatrix.test';
import colorFactsMatrixTest from './ColorFactsMatrix.test';
import mediaFactsMatrixTest from './MediaFactsMatrix.test';
import layeredTextMatrixTest from './LayeredTextMatrix.test';
import layeredJsonMatrixTest from './LayeredJsonMatrix.test';
import signatureMatrixTest from './SignatureMatrix.test';
import displayFactsMatrixTest from './DisplayFactsMatrix.test';
import fileErrorMatrixTest from './FileErrorMatrix.test';
import wantFactsMatrixTest from './WantFactsMatrix.test';
import resourceIdMatrixTest from './ResourceIdMatrix.test';
import abilityFactsMatrixTest from './AbilityFactsMatrix.test';
import uiFlowMatrixTest from './UiFlowMatrix.test';

export default function testsuite() {
  encodeTextMatrixTest();
  jsonDocMatrixTest();
  numberSenseMatrixTest();
  textSenseMatrixTest();
  collectionSenseMatrixTest();
  timeSenseMatrixTest();
  mathSenseMatrixTest();
  moduleNameMatrixTest();
  versionMatrixTest();
  hspTextMatrixTest();
  draftIoMatrixTest();
  prefStoreMatrixTest();
  bundleFactsMatrixTest();
  moduleFactsMatrixTest();
  entryStringMatrixTest();
  libraryFactsMatrixTest();
  appScopeMatrixTest();
  colorFactsMatrixTest();
  mediaFactsMatrixTest();
  layeredTextMatrixTest();
  layeredJsonMatrixTest();
  signatureMatrixTest();
  displayFactsMatrixTest();
  fileErrorMatrixTest();
  wantFactsMatrixTest();
  resourceIdMatrixTest();
  abilityFactsMatrixTest();
  uiFlowMatrixTest();
}
