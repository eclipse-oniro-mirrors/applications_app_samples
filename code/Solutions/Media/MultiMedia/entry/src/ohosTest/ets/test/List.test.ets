/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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

import { abilityDelegatorRegistry } from '@kit.TestKit';
import MultiMediaUiTest from './MultiMediaUiTest.test';
import CalendarDate1Logic from './CalendarDate1Logic.test';
import CalendarDate2Logic from './CalendarDate2Logic.test';
import ClockTime1Logic from './ClockTime1Logic.test';
import ClockTime2Logic from './ClockTime2Logic.test';
import DataSourceDeletion1Logic from './DataSourceDeletion1Logic.test';
import DataSourceDeletion2Logic from './DataSourceDeletion2Logic.test';
import DataSourceDeletion3Logic from './DataSourceDeletion3Logic.test';
import DataSourceInsertionLogic from './DataSourceInsertionLogic.test';
import DataSourceListenerLogic from './DataSourceListenerLogic.test';
import DataSourceStorageLogic from './DataSourceStorageLogic.test';
import DataSourceWorkflowLogic from './DataSourceWorkflowLogic.test';
import DurationBoundaryLogic from './DurationBoundaryLogic.test';
import MediaDescriptorsDeletionLogic from './MediaDescriptorsDeletionLogic.test';
import MediaFailureWorkflowsLogic from './MediaFailureWorkflowsLogic.test';
import MediaListingAlbumsLogic from './MediaListingAlbumsLogic.test';
import MediaMappingCreationLogic from './MediaMappingCreationLogic.test';
import MediaRenameMetadataLogic from './MediaRenameMetadataLogic.test';
import NumericPaddingLogic from './NumericPaddingLogic.test';
import RecorderConfigLogic from './RecorderConfigLogic.test';
import RecorderLifecycleLogic from './RecorderLifecycleLogic.test';
import RecorderStateLogic from './RecorderStateLogic.test';
import SystemClockLogic from './SystemClockLogic.test';

export default function testsuite(): void {
  CalendarDate1Logic();
  CalendarDate2Logic();
  ClockTime1Logic();
  ClockTime2Logic();
  DataSourceDeletion1Logic();
  DataSourceDeletion2Logic();
  DataSourceDeletion3Logic();
  DataSourceInsertionLogic();
  DataSourceListenerLogic();
  DataSourceStorageLogic();
  DataSourceWorkflowLogic();
  DurationBoundaryLogic();
  MediaDescriptorsDeletionLogic();
  MediaFailureWorkflowsLogic();
  MediaListingAlbumsLogic();
  MediaMappingCreationLogic();
  MediaRenameMetadataLogic();
  NumericPaddingLogic();
  RecorderConfigLogic();
  RecorderLifecycleLogic();
  RecorderStateLogic();
  SystemClockLogic();
  const selected: string = abilityDelegatorRegistry.getArguments().parameters['class'] ?? '';
  const classes: string[] = selected.split(',');
  if (classes.every((name: string): boolean => name.split('#')[0] === 'MultiMediaUiTest')) {
    MultiMediaUiTest();
  }
}
