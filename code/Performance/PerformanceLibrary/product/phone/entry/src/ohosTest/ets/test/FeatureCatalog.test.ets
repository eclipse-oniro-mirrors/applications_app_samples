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

import { describe, expect, it } from '@ohos/hypium';
import { performanceTypeArray } from '../../../main/ets/model/MockData';

function assertRoute(name: string, expected: string): void {
  const entries = performanceTypeArray.filter(item => item.name === name);
  const occurrences = entries.length;
  expect(occurrences).assertEqual(1);
  const actual = entries[0].uri;
  expect(actual).assertEqual(expected);
}

export default function featureCatalogTest(): void {
  describe('PerformanceFeatureCatalog', () => {
    // @tc.number SUB_PERFORMANCE_FEATURECATALOG_0100
    // @tc.name featureCatalogHasUniqueNamesAndDestinations
    // @tc.desc Verify performanceTypeArray contains distinct visible names and local router destinations.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('featureCatalogHasUniqueNamesAndDestinations', 0, () => {
      const names = new Set<string>();
      const paths = new Set<string>();
      const localPath = /^pages\/[A-Za-z][A-Za-z\d]*\/[A-Za-z][A-Za-z\d]*$/;
      for (const entry of performanceTypeArray) {
        const trimmed = entry.name.trim();
        const nonempty = trimmed.length > 0;
        const local = localPath.test(entry.uri);
        expect(nonempty).assertTrue();
        expect(trimmed).assertEqual(entry.name);
        expect(local).assertTrue();
        names.add(entry.name);
        paths.add(entry.uri);
      }
      const total = performanceTypeArray.length;
      const uniqueNames = names.size;
      const uniquePaths = paths.size;
      expect(total).assertEqual(16);
      expect(uniqueNames).assertEqual(total);
      expect(uniquePaths).assertEqual(total);
    });

    // @tc.number SUB_PERFORMANCE_FEATURECATALOG_0200
    // @tc.name renderingAndProfilingLinksTargetTheirOwnPages
    // @tc.desc Verify performanceTypeArray maps rendering and profiling labels to the intended entry pages.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('renderingAndProfilingLinksTargetTheirOwnPages', 0, () => {
      assertRoute('HiDumper', 'pages/hiDumper/HiDumperPage');
      assertRoute('IfOrVisibility', 'pages/ifOrVisibility/IfOrVisibilityPage');
      assertRoute('Grid', 'pages/grid/GridPage');
      assertRoute('SmartPerf Editor', 'pages/smartPerfEditor/SmartPerfEditorPage');
      assertRoute('SmartPerfHost', 'pages/smartPerfHost/SmartPerfHostPage');
      assertRoute('Trace', 'pages/trace/TracePage');
      assertRoute('DFX StateManagement', 'pages/DFXStateManagement/DFXStateManagementPage');
      assertRoute('WaterFlow', 'pages/waterFlow/WaterFlowPage');
    });

    // @tc.number SUB_PERFORMANCE_FEATURECATALOG_0300
    // @tc.name loadAndConcurrencyLinksTargetTheirOwnPages
    // @tc.desc Verify performanceTypeArray maps loading and concurrency labels to the intended entry pages.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('loadAndConcurrencyLinksTargetTheirOwnPages', 0, () => {
      assertRoute('StaticImport', 'pages/staticImport/StaticEntryView');
      assertRoute('DynamicImport', 'pages/dynamicImport/DynamicEntryView');
      assertRoute('BackgroundTask', 'pages/backgroundTask/BackgroundTaskPage');
      assertRoute('MemoryShared', 'pages/memoryShared/MemorySharedHomePage');
      assertRoute('ThreadDataTransfer', 'pages/ThreadDataTransfer/ThreadDataTransferPage');
      assertRoute('NativeThreadsCallJS', 'pages/nativeThreadsCallJS/NativeThreadsCallJS');
      assertRoute('ThreadCommunication', 'pages/ThreadCommunication/ThreadCommunicationHomePage');
      assertRoute('WebPerformance', 'pages/webPerformance/WebHomePage');
    });
  });
}
