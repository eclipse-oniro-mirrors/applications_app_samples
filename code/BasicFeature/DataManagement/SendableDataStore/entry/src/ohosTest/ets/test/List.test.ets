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

import dataValidatorTest from './DataValidatorTest.test';
import sendableArrayTest from './SendableArrayTest.test';
import sendableMapTest from './SendableMapTest.test';
import sendableQueueTest from './SendableQueueTest.test';
import sendableRecordTest from './SendableRecordTest.test';
import dataMigrationTest from './DataMigrationTest.test';
import dataBackupTest from './DataBackupTest.test';
import dataEncryptionTest from './DataEncryptionTest.test';
import distributedDataTest from './DistributedDataTest.test';
import abilityTest from './AbilityTest.test';
import indexAndNavigationTest from './IndexAndNavigationTest.test';
import sendablePreferencesTest from './SendablePreferencesTest.test';
import sendableRdbTest from './SendableRdbTest.test';
import errorHandlingTest from './ErrorHandlingTest.test';
import performanceMonitorTest from './PerformanceMonitorTest.test';
import dataStoreConfigTest from './DataStoreConfigTest.test';
import loggerTest from './LoggerTest.test';
import dataModelsEnumAndConstantsTest from './DataModelsEnumAndConstantsTest.test';
import preferencesRdbUITest from './PreferencesRdbUITest.test';
import collectionPagesUITest from './CollectionPagesUITest.test';
import advancedPagesUITest from './AdvancedPagesUITest.test';
import e2eWorkflowAndBoundaryTest from './E2EWorkflowAndBoundaryTest.test';
import errorHandlingOverflowTest from './ErrorHandlingOverflowTest.test';
import batchCapacityGuardTest from './BatchCapacityGuardTest.test';
import managerMethodGapTest from './ManagerMethodGapTest.test';
import supplementaryCoverageTest from './SupplementaryCoverageTest.test';
import preferencesDeepTest from './PreferencesDeepTest.test';
import rdbDeepTest from './RdbDeepTest.test';
import encryptionDeepTest from './EncryptionDeepTest.test';
import distributedDeepTest from './DistributedDeepTest.test';
import backupMigrationDeepTest from './BackupMigrationDeepTest.test';
import queueRecordDeepTest from './QueueRecordDeepTest.test';
import configPerfErrorDeepTest from './ConfigPerfErrorDeepTest.test';

export default function testsuite(): void {
  dataValidatorTest();
  sendableArrayTest();
  sendableMapTest();
  sendableQueueTest();
  sendableRecordTest();
  dataMigrationTest();
  dataBackupTest();
  dataEncryptionTest();
  distributedDataTest();
  abilityTest();
  indexAndNavigationTest();
  sendablePreferencesTest();
  sendableRdbTest();
  errorHandlingTest();
  performanceMonitorTest();
  dataStoreConfigTest();
  loggerTest();
  dataModelsEnumAndConstantsTest();
  preferencesRdbUITest();
  collectionPagesUITest();
  advancedPagesUITest();
  e2eWorkflowAndBoundaryTest();
  errorHandlingOverflowTest();
  batchCapacityGuardTest();
  managerMethodGapTest();
  supplementaryCoverageTest();
  preferencesDeepTest();
  rdbDeepTest();
  encryptionDeepTest();
  distributedDeepTest();
  backupMigrationDeepTest();
  queueRecordDeepTest();
  configPerfErrorDeepTest();
}
