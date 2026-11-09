/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import customDataSourceBehaviorTest from './CustomDataSourceBehavior.test';
import fileAlbumCatalogTest from './FileAlbumCatalog.test';
import urlUtilsBoundaryTest from './UrlUtilsBoundary.test';
import abilityTest from './Ability.test';
import uploadDownloadFuncTest from './UploadDownloadFunc.test';
import fileModelMatrixTest from './FileModelMatrix.test';
import constantsContractTest from './ConstantsContract.test';
import urlUtilsStorageTest from './UrlUtilsStorage.test';
import fileUtilsMatrixTest from './FileUtilsMatrix.test';
import downloadCleanMatrixTest from './DownloadCleanMatrix.test';
import fileModelExtraTest from './FileModelExtra.test';
import urlUtilsExtraTest from './UrlUtilsExtra.test';
import fileUtilsExtraTest from './FileUtilsExtra.test';
import downloadCleanExtraTest from './DownloadCleanExtra.test';
import fileModelExtra2Test from './FileModelExtra2.test';
import urlUtilsExtra2Test from './UrlUtilsExtra2.test';
import fileUtilsExtra2Test from './FileUtilsExtra2.test';
import downloadCleanExtra2Test from './DownloadCleanExtra2.test';
import fileModelExtra3Test from './FileModelExtra3.test';
import urlUtilsExtra3Test from './UrlUtilsExtra3.test';
import downloadCleanExtra3Test from './DownloadCleanExtra3.test';
import requestInvalidExtraTest from './RequestInvalidExtra.test';
import uploadInvalidExtraTest from './UploadInvalidExtra.test';
import fileTypeCatalogTest from './FileTypeCatalog.test';
import fileTypeCatalogTestPart2 from './FileTypeCatalogPart2.test';
import serverConfigTest from './ServerConfig.test';
import serverConfigTestPart2 from './ServerConfigPart2.test';
import downloadDirectoryScenarioTest from './DirectoryScenario.test';
import downloadDirectoryScenarioTestPart2 from './DirectoryScenarioPart2.test';
import cleanupPathScenarioTest from './CleanupPathScenario.test';
import cleanupPathScenarioTestPart2 from './CleanupPathScenarioPart2.test';
import finalEdgeCaseTest from './FinalEdgeCase.test';
import fileUtilsExtra4Test from './FileUtilsExtra4.test';
import downloadCleanExtra4Test from './DownloadCleanExtra4.test';
import fileModelResidualTest from './FileModelResidual.test';
import fileUtilsResidualTest from './FileUtilsResidual.test';
import cleanResidualTest from './CleanResidual.test';
import mediaUtilsResidualTest from './MediaUtilsResidual.test';
import fileUtilsErrorResidualTest from './FileUtilsErrorResidual.test';

export default function testsuite() {
  customDataSourceBehaviorTest();
  fileAlbumCatalogTest();
  urlUtilsBoundaryTest();
  abilityTest();
  uploadDownloadFuncTest();
  fileModelMatrixTest();
  constantsContractTest();
  urlUtilsStorageTest();
  fileUtilsMatrixTest();
  downloadCleanMatrixTest();
  fileModelExtraTest();
  urlUtilsExtraTest();
  fileUtilsExtraTest();
  downloadCleanExtraTest();
  fileModelExtra2Test();
  urlUtilsExtra2Test();
  fileUtilsExtra2Test();
  downloadCleanExtra2Test();
  fileModelExtra3Test();
  urlUtilsExtra3Test();
  downloadCleanExtra3Test();
  requestInvalidExtraTest();
  uploadInvalidExtraTest();
  fileTypeCatalogTest();
  fileTypeCatalogTestPart2();
  serverConfigTest();
  serverConfigTestPart2();
  downloadDirectoryScenarioTest();
  downloadDirectoryScenarioTestPart2();
  cleanupPathScenarioTest();
  cleanupPathScenarioTestPart2();
  finalEdgeCaseTest();
  fileUtilsExtra4Test();
  downloadCleanExtra4Test();
  fileModelResidualTest();
  fileUtilsResidualTest();
  cleanResidualTest();
  mediaUtilsResidualTest();
  fileUtilsErrorResidualTest();
}