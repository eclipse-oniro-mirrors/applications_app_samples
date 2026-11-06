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


import fileIoMatrix1Test from './FileIoMatrix1.test';
import fileIoMatrix2Test from './FileIoMatrix2.test';
import fileIoMatrix3Test from './FileIoMatrix3.test';
import fileIoMatrix4Test from './FileIoMatrix4.test';
import fileIoMatrix5Test from './FileIoMatrix5.test';
import fileIoMatrix6Test from './FileIoMatrix6.test';

import dfmaFileOpsTest from './FileOpsMatrix.test';
import dfmaBoundaryTest from './BoundarySecurity.test';
import dfmaWatcherTest from './WatcherLifecycle.test';

import dfmaWatcherLifecycleExtraTest from './WatcherLifecycleExtra.test';
import dfmaFileContentExtraTest from './FileContentExtra.test';
import dfmaExceptionExtraTest from './ExceptionSecurityExtra.test';
import dfmaMetadataConcurrencyTest from './MetadataConcurrency.test';

import dfmaLargeStreamExtraTest from './LargeStreamExtra.test';
import dfmaWatcherEventExtraTest from './WatcherEventExtra.test';
import dfmaSecurityExtraTest from './SecurityPathExtra.test';
import dfmaMetadataPerfExtraTest from './MetadataPerfExtra.test';

import dfmaRandomAccessTest from './RandomAccessExtra.test';
import dfmaSecurityPathExtra2Test from './SecurityPathExtra2.test';
import dfmaWatcherCreateExtraTest from './WatcherCreateExtra.test';
import dfmaBulkPerfExtraTest from './BulkPerfExtra.test';

import dfmaFileIoVolumeTest from './FileIoVolume.test';
import dfmaBulkLifecycleTest from './BulkLifecycle.test';
import dfmaMetadataVolumeTest from './MetadataVolume.test';

import dfmaFileIoVolume2Test from './FileIoVolume2.test';
import dfmaBulkLifecycle2Test from './BulkLifecycle2.test';
import dfmaMetadataVolume2Test from './MetadataVolume2.test';

import dfmaFileIoVolume3Test from './FileIoVolume3.test';
import dfmaBulkLifecycle3Test from './BulkLifecycle3.test';
import dfmaMetadataVolume3Test from './MetadataVolume3.test';
import dfmaFinalVolumeTest from './FinalVolumeExtra.test';

export default function testsuite() {
  dfmaFileIoVolume3Test();
  dfmaBulkLifecycle3Test();
  dfmaMetadataVolume3Test();
  dfmaFinalVolumeTest();
  dfmaFileIoVolume2Test();
  dfmaBulkLifecycle2Test();
  dfmaMetadataVolume2Test();
  dfmaFileIoVolumeTest();
  dfmaBulkLifecycleTest();
  dfmaMetadataVolumeTest();
  dfmaRandomAccessTest();
  dfmaSecurityPathExtra2Test();
  dfmaWatcherCreateExtraTest();
  dfmaBulkPerfExtraTest();
  dfmaLargeStreamExtraTest();
  dfmaWatcherEventExtraTest();
  dfmaSecurityExtraTest();
  dfmaMetadataPerfExtraTest();
  dfmaWatcherLifecycleExtraTest();
  dfmaFileContentExtraTest();
  dfmaExceptionExtraTest();
  dfmaMetadataConcurrencyTest();
  dfmaFileOpsTest();
  dfmaBoundaryTest();
  dfmaWatcherTest();
  fileIoMatrix1Test();
  fileIoMatrix2Test();
  fileIoMatrix3Test();
  fileIoMatrix4Test();
  fileIoMatrix5Test();
  fileIoMatrix6Test();
}